<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/CR_INT0067_Concur_Attendee_Feed_Outbound"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:etv="urn:com.workday/evt"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://exslt.org/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0">
    
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 3, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0067 Concur Attendee Feed Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="wd:Report_Data">
        
        
        
        <File xtt:separator="&#xA;" xtt:align="left" xtt:severity="warning">


        
            <xsl:for-each select="wd:Report_Entry">
        
        <!-- Record 100 -->
            <Record100 xtt:separator="," xtt:quotes="always" xtt:align="left">  
                <RecordType xtt:attribute="Record Type 100"></RecordType>
                <ExternalID><xsl:value-of select="wd:Employee_ID"/></ExternalID>
                <AttendeeTypeCode xtt:attribute="Attendee Type Code"></AttendeeTypeCode>
                <CurrencyCode><xsl:value-of select="wd:Total_Pay_-_Currency/wd:code"/></CurrencyCode>
                <LastName><xsl:value-of select="wd:Legal_Name_-_Last_Name"/></LastName>
                <FirstName><xsl:value-of select="wd:Legal_Name_-_First_Name"/></FirstName>
                <MiddleInitial><xsl:value-of select="wd:Legal_Name_-_Middle_Name"/></MiddleInitial>
                <Suffix><xsl:value-of select="wd:Legal_Name_-_Social_Suffix"/></Suffix>
                <Company><xsl:value-of select="wd:Company"/></Company>
                <Title><xsl:value-of select="wd:Job_Title"/></Title>
                <Inactive>
                <xsl:choose>
                    <xsl:when test="wd:Active_Status='1'">
                        <xsl:text>N</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Y</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                   
                </Inactive>
                <YTDTotal></YTDTotal>
                <Custom1-20><xsl:value-of select="wd:primaryWorkEmail"/></Custom1-20>
                <Custom21><xsl:value-of select="wd:Custom_Organization_by_Type/@wd:Descriptor"/></Custom21>
                <Custom22></Custom22>
                <Custom23></Custom23>
                <Custom24-25></Custom24-25>
                <FutureUse1-20></FutureUse1-20>
                
            </Record100>
                
                
                
            
        </xsl:for-each>
            
      
        </File>
        
    </xsl:template>
    
</xsl:stylesheet>