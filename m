Return-Path: <panagiotis.tamtamis@unify.com>
Received: from mx12.unify.com (mx12.unify.com [62.134.46.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5D933780AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:32:35 +0000 (UTC)
Received: from MCHP02HTC.global-ad.net (unknown [172.29.42.235])
	by mx12.unify.com (Server) with ESMTP id C605723F04EA;
	Tue, 20 Jun 2017 16:32:36 +0200 (CEST)
Received: from MCHP04MSX.global-ad.net ([169.254.37.243]) by
	MCHP02HTC.global-ad.net ([172.29.42.235]) with mapi id 14.03.0339.000;
	Tue, 20 Jun 2017 16:32:36 +0200
From: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>
To: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>, ???'?? ??????
	<maryan.pricak@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] (no subject)
Thread-Index: AQHS6c6jcl6dbLJSqEqYPzUGleZCp6ItzNFg
Date: Tue, 20 Jun 2017 14:32:35 +0000
Message-ID: <0D74DA672F03634EA90EB18A61E36D27263B1095@MCHP04MSX.global-ad.net>
References: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
	<e23728ee-eece-c3d1-da75-defd91e094ad@rsi-elektrotechnik.de>
	<0D74DA672F03634EA90EB18A61E36D27263B0EC1@MCHP04MSX.global-ad.net>
	<baf1ac86-c92d-1907-0cb5-25e94b495818@rsi-elektrotechnik.de>
In-Reply-To: <baf1ac86-c92d-1907-0cb5-25e94b495818@rsi-elektrotechnik.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.42.225]
MIME-Version: 1.0
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jun 2017 14:32:36 -0000
X-Groupsio-MsgNum: 67266
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0069_01D2E9EB.345185F0"

------=_NextPart_000_0069_01D2E9EB.345185F0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello Josef,

> Hi Tamis,
>
> On 20.06.2017 10:07, Tamtamis, Panagiotis wrote:
> > I use the following in my image recipe:
> >
> > FORCE_RO_REMOVE = "1"
> > ROOTFS_RO_UNNEEDED += " kernel-${LINUX_VERSION} kernel-image-
> ${LINUX_VERSION} kernel-image-uimage-${LINUX_VERSION}"
>
> While that might work, it actually builds all the stuff and then only 
> excludes it
> from the rootfs generation. But if we actually never ever want a kernel, why
> spend the compile time? :)

I agree with you. Even if cross compiling in production server does not take 
that much time, it is not the optimal solution.
I will also see your layer at GitHub  :-).

Br,
Tamis


------=_NextPart_000_0069_01D2E9EB.345185F0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIPnTCCAzYw
ggIeoAMCAQICEFKIki0gLsWYSyx9eBbYcr0wDQYJKoZIhvcNAQELBQAwNTELMAkGA1UEBhMCREUx
DjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1VbmlmeSBSb290IENBMB4XDTEzMDkyNTA3MzQzMFoX
DTI4MDkyNTA3NDQyNVowNTELMAkGA1UEBhMCREUxDjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1V
bmlmeSBSb290IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp7oHRPmtJ+/8I3iv
apenTzPKMh+diPfZPmp9SkuRTuW3NZivOarkd7vs2+gkhD8syKpPyLpKDRMG2zHgBjYxxdUhagYW
MNKej07xGs3kmPXKbt/FxL+xI+64aHLV35fCmOrOS7tLBGpDfAMJhAWMEI9xmQdDAYcxJOXlR4Hw
cosfPFvfDI7Tiwj4Kml547YRq1cKTpy8AtQgo1Rc41WakCknXeRcRtSlllGHydqd8RCNe49Ut+OI
zBtKSfoe/cYVuUrSh2cOCUFOh3EAxKmFi2lCEI5t3mtZV35MVGOIAbFF8On9udmA10uvM/RR51fg
o3oh9wdCOn0tFfMPLYOSGwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB
/zAdBgNVHQ4EFgQUL/fEwyUdkMhFfPNnCnMzxVyab08wDQYJKoZIhvcNAQELBQADggEBAGaM56dC
Yx9O21zPZ/Qnw8jw7uIVxlAdOE+jlrs5MLvenLmrlG5StAIgpqaXVzp5i9m+duDXhR+NVy9FwnyA
xqah+NZd0sp5p/M+0MYPu2BynLBfrMBoW6TwtStkkoK8PfQr5U9u8KeVifyQJe2fswcDWg6odiUb
/bdEmqQmXc2aA9qM6WEcCOYWa7QNHKt+bLXqFiznNiEkhIyehiro213FOvPn9OgVd8OjZzlSbxCp
WbkGER4aD36mJSq7dU1/8qdfLn1nXwtlJkqP5Gj0DCjyNVRZTGKNvKRvHGDTOTRD/bbQOigqHDlf
SXemNB3a5En3X73EJd8raK2M5JZRQ7MwggW9MIIEpaADAgECAg4w9GNsY4mqiwAAAAAABDANBgkq
hkiG9w0BAQsFADA1MQswCQYDVQQGEwJERTEOMAwGA1UECgwFVW5pZnkxFjAUBgNVBAMMDVVuaWZ5
IFJvb3QgQ0EwHhcNMTMwOTI2MTQ0MDA0WhcNMjMwOTI2MTQ1MDA0WjA1MQswCQYDVQQGEwJERTEO
MAwGA1UECgwFVW5pZnkxFjAUBgNVBAMMDVVuaWZ5IFVzZXIgQ0EwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCPGIg7woGyfrEXR+ihrCDd3i0M2evThPreB9ap8fL+bBiANbWggXV5rR/w
DBo1rzMnTeaEEsmQQ8n00D+wl/Rwby8JZUtgS3y3284/H5kfgVnGL6FW7qnJLq/cQKgIQuCP+nGs
dt5gc9LriPuwDo1p22lQuduffmF21saaFYOu7cSLAwV+YKoERBL7M00r9I4Qm1twYUqPI6/T9OVw
V2nmerPobEwBUcBeXDxHzD7MGR+z0CRUuVvROcM28lakGuDW09YlBSNY81xrCj7Zf82uPoNdEb1T
MkEcjVQO8U/IfCKPnalP/2/frXrWK6JAgGWpxXAcWMgKXAghR8uqsySTAgMBAAGjggLJMIICxTAO
BgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYEFJhx96C5h8dG9AYMgSYzvV3eUAtmMBIGA1UdEwEB/wQI
MAYBAf8CAQAwHwYDVR0jBBgwFoAUL/fEwyUdkMhFfPNnCnMzxVyab08wggEbBgNVHR8EggESMIIB
DjCCAQqgggEGoIIBAoYqaHR0cDovL3BraS51bmlmeS5jb20vY3JsL3VuaWZ5LXJvb3QtY2EuY3Js
hoHTbGRhcDovL3BraS1kaXJlY3RvcnkudW5pZnkuY29tL0NOPVVuaWZ5JTIwUm9vdCUyMENBLENO
PXVuaWZ5LXBraSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMs
Q049Q29uZmlndXJhdGlvbixEQz1nbG9iYWwtYWQsREM9bmV0P2NlcnRpZmljYXRlUmV2b2NhdGlv
bkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDCCAT4GCCsGAQUFBwEB
BIIBMDCCASwwNgYIKwYBBQUHMAKGKmh0dHA6Ly9wa2kudW5pZnkuY29tL2NydC91bmlmeS1yb290
LWNhLmNydDCByQYIKwYBBQUHMAKGgbxsZGFwOi8vcGtpLWRpcmVjdG9yeS51bmlmeS5jb20vQ049
VW5pZnklMjBSb290JTIwQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNl
cnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9Z2xvYmFsLWFkLERDPW5ldD9jQUNlcnRpZmljYXRl
P2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTAmBggrBgEFBQcwAYYaaHR0
cDovL29jc3AudW5pZnkuY29tL29yMDEwDQYJKoZIhvcNAQELBQADggEBAJ/DjgX7xxKEhsGGpQ0J
xImw4V8hTITbBq8FqllxWhvkMjyI+7524g2xXBNLeHAfF+1W6BFgVeUuWjYqQzKl2vFkjLXJy4OX
JQMigXk24N+s6PtF235yqMCiaOg4q/KIT4RjdWJKgNpWuf3r5GMUKCmRQiAOQggHKCbSfyky5f+J
IHNHzby2x+AlRjipyEoy8Y4S96kdG90PQ/8fkplmjoigN03cSKglEvDVdf+EoBjVEgzhRTb+YIhh
GCRuzlTl2BFQNMHoNDsIU4eoMa0eLIcsOZOEoTl9YLbdHrOkEiiF8FkOmsVRoQTmVeGTA6Cx0gd0
ZB4vGvsaMJFxezMZTf8wggaeMIIFhqADAgECAgp+i/nRAAAAABCvMA0GCSqGSIb3DQEBCwUAMDUx
CzAJBgNVBAYTAkRFMQ4wDAYDVQQKDAVVbmlmeTEWMBQGA1UEAwwNVW5pZnkgVXNlciBDQTAeFw0x
MzEwMjEwNzM1MDRaFw0xODEwMjAwNzM1MDRaMFgxLDAqBgkqhkiG9w0BCQEWHXBhbmFnaW90aXMu
dGFtdGFtaXNAdW5pZnkuY29tMSgwJgYDVQQDDB9UYW10YW1pcyBQYW5hZ2lvdGlzIFNFTkdSMDcw
MTQwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyNe0JD2i3s+szC33fTp76iZIUvbc
GgGxbPdqG5/nQ4GCks2/lbRv9jslpM4sBctP1z+ggppIN/+elifcW1FBnLUaYYWZLMqmnJIzw8In
VoqTP+0XEuGV/sx8Ekr5BJJigF6L2FN38b4OZT9Y5xBQHPB60QeUwSSnckgh9rQGx2ArhrgyYID7
NKBSZjApGx1RNDckKEx2pe1Rv3WpmLz+T5vphZoTEJ2Go81u5TxpTa4+4A9yqEjMENLZ9KAjxjqd
AK8jH8jD+v70xG2LKL8QV0wmgJ5QkvBZvNzQLGr7MezYZ7RibjD0di3SeTxEQrHayrrWactsSeMj
T60og0h6hwIDAQABo4IDizCCA4cwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIgt6SVoGmryaG
iZkJpvV0gvKhRYEphvjFSoLYuW8CAWQCAQ4wNQYDVR0lBC4wLAYKKwYBBAGCNxQCAgYIKwYBBQUH
AwQGCisGAQQBgjcKAwQGCCsGAQUFBwMCMA4GA1UdDwEB/wQEAwIEsDAMBgNVHRMBAf8EAjAAMB0G
A1UdDgQWBBRFUxQGRVbllZJknipjnI3bA7gs5TAfBgNVHSMEGDAWgBSYcfeguYfHRvQGDIEmM71d
3lALZjCCARsGA1UdHwSCARIwggEOMIIBCqCCAQagggEChipodHRwOi8vcGtpLnVuaWZ5LmNvbS9j
cmwvdW5pZnktdXNlci1jYS5jcmyGgdNsZGFwOi8vcGtpLWRpcmVjdG9yeS51bmlmeS5jb20vQ049
VW5pZnklMjBVc2VyJTIwQ0EsQ049dW5pZnktcGtpLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBT
ZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWdsb2JhbC1hZCxEQz1uZXQ/
Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlv
blBvaW50MIIBPgYIKwYBBQUHAQEEggEwMIIBLDA2BggrBgEFBQcwAoYqaHR0cDovL3BraS51bmlm
eS5jb20vY3J0L3VuaWZ5LXVzZXItY2EuY3J0MIHJBggrBgEFBQcwAoaBvGxkYXA6Ly9wa2ktZGly
ZWN0b3J5LnVuaWZ5LmNvbS9DTj1VbmlmeSUyMFVzZXIlMjBDQSxDTj1BSUEsQ049UHVibGljJTIw
S2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1nbG9iYWwtYWQs
REM9bmV0P2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9y
aXR5MCYGCCsGAQUFBzABhhpodHRwOi8vb2NzcC51bmlmeS5jb20vb3IwMTBQBgNVHREESTBHoCYG
CisGAQQBgjcUAgOgGAwWR1JNUzgyNjVAR0xPQkFMLUFELk5FVIEdcGFuYWdpb3Rpcy50YW10YW1p
c0B1bmlmeS5jb20wDQYJKoZIhvcNAQELBQADggEBADhumYGMCtI/WyN7RrIqEPnn6EPv5+HhamLW
t2pgQIDacVXWM3febceYb5Ytt0u/DcZvVG9X9Qqj1xmiplUE1spHv4kpO4YEzlXk+UmB3p8wFUzC
ZHRRWap6Y5UeZrzM9W8E/x2gAH2CHF5Nj9X2EQg+JUZD7ro0G7XXTG7ciV+gxIAjrN4E2CsxLy8d
LnXGTv7nk1OCmi/4NmnOdGJzjOEGh6XhNofosu17QGr541YsJHpw1x1VFWigImMxwfw9GC7X85dY
HGtRTo2BIfr1eayJqgNSm7DWp5u5oprq1tpNXYaATsRB7o8ORVb/aIYp8Xc9v2GxNAWDtaANR+Ew
I2MxggMvMIIDKwIBATBDMDUxCzAJBgNVBAYTAkRFMQ4wDAYDVQQKDAVVbmlmeTEWMBQGA1UEAwwN
VW5pZnkgVXNlciBDQQIKfov50QAAAAAQrzAJBgUrDgMCGgUAoIIBwTAYBgkqhkiG9w0BCQMxCwYJ
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzA2MjAxNDMyMzVaMCMGCSqGSIb3DQEJBDEWBBSV
0a13+epZVuxspe7KbImBG0Cu7TBSBgkrBgEEAYI3EAQxRTBDMDUxCzAJBgNVBAYTAkRFMQ4wDAYD
VQQKDAVVbmlmeTEWMBQGA1UEAwwNVW5pZnkgVXNlciBDQQIKfov50QAAAAAQrzBUBgsqhkiG9w0B
CRACCzFFoEMwNTELMAkGA1UEBhMCREUxDjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1VbmlmeSBV
c2VyIENBAgp+i/nRAAAAABCvMIG3BgkqhkiG9w0BCQ8xgakwgaYwCwYJYIZIAWUDBAEqMAsGCWCG
SAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgFAMA0GCCqGSIb3DQMCAgEoMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglg
hkgBZQMEAgIwCwYJYIZIAWUDBAIBMAoGCCqGSIb3DQIFMA0GCSqGSIb3DQEBAQUABIIBAMWGlPUX
sy7NAHKQkDxVq7+DDG5xVtEVOcFFmZm3S2J5gO+SVljuDj7NtJn2jOyaRbVnxYs8tJHRC6/j8hC1
aKiBt4x1Syx9CEoNcBCk4WYPrw9HvbQDWDpr6SvajP6aHOK2ByZXIuXPt7duUQJUlv4/Fh/CVcPj
CJkxuq+LndHLvNCKaPmGkkbpsekKonbB3DmE7xUH2+/5swNU0X4z+DgpnmdARq1oP5ovFn+gn3Q7
q8WIeGD4Jdsb/cq52puChPv+ezkEZp1encMsvvgl6zr1Xs3/pf3AD1DE9wefsU/BxbF9vJGCDDjD
8QITIwa863NfaC1FCV635E/yDzp766UAAAAAAAA=

------=_NextPart_000_0069_01D2E9EB.345185F0--
