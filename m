Received: from [198.82.22.238] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philip@balister.org>) id 1Hay0H-0003h0-4i
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 19:50:13 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l39Ho7JK014435
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Apr 2007 13:50:08 -0400
Message-ID: <461A7CCF.8020206@balister.org>
Date: Mon, 09 Apr 2007 13:50:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <evcm2e$15q$1@sea.gmane.org>
	<432beae0704090952u55847886o5eca96007a2d22be@mail.gmail.com>
In-Reply-To: <432beae0704090952u55847886o5eca96007a2d22be@mail.gmail.com>
Subject: Re: OE a deterministic build system?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2007 17:50:14 -0000
X-Groupsio-MsgNum: 1779
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070108000306060704090501"

--------------ms070108000306060704090501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Justin Patrin wrote:
>> Now, I really wonder what causes this virgin build to fail for me when
>> it seems everybody else can happily build it?  Is OE not deterministic?
>> Hints and discussion welcome.
>>
> 
> Of course it's deterministic....you do get the same error every time,
> don't you? Sounds like it's a difference between your system and
> everyone else's. I'll try a build myself with almost your exact
> local.conf and a fully up to date .dev as well.

I've had trouble in the past with autoconf detecting software installed 
on the build machine and using those paths for the OE build. This was 
caused by bad m4 macros that OE could not account for. I fixed the 
autoconf and solved the problem. Read the logs of the failed package and 
see if it is using headers from the machine you are building on.

Philip

--------------ms070108000306060704090501
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEBHvMir6xnUSDyiLP20+hb4wDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDQxNDEyNDMyNVoXDTA3MDQxNDEyNDMy
NVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq3dpPM5m9xXgeamg5R4O98aJ573uQPAU0hARVdQQeipeYZTD
642AZkuc0T+u+pTHVGp2RYX8/2ihbnSxqDMXiYsaKG5q+7QVXIe/gIQSD1WhmDUcDaZ9cFU04ogh
SosFnIQFDzgde1Npi0hixmAUR/W0yJ/h1qAw4Gl5+RA+XMD7bSQ8JzbnaVyxzHa7lWz2TtT7SG7U
+xBKaxUoPiujB86EZplhKaK/aBNi1Qexo6ibCzr5L0MalCyTY0wyvLkuB8fVLneGmS9k+FixKnET
n/AI5dv1Rvnw98pT1iLdxD9bxaygntLM43B+MFrk7ovEUS5kKnIaOVq8szeo/eRUXwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEEBQADgYEAieX+0Zb3MOoVi4spKQb4SE/qINe6cqFUBKcQWh5AjcOlr8UQlKr5kv2KXGlg786S
s6svdkqqI8ecfLbzT/mi1fSHAIoXIRwoVZATRto7UUW7RjHq9too/h2Ady0cFMCheKA/qRZ6ptRh
8JCIoqnvD5EGexK1Tk4OPeeBlK9QuocwggL9MIICZqADAgECAhAR7zIq+sZ1Eg8oiz9tPoW+MA0G
CSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNjA0MTQxMjQzMjVaFw0wNzA0MTQxMjQzMjVaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKt3aTzOZvcV
4HmpoOUeDvfGiee97kDwFNIQEVXUEHoqXmGUw+uNgGZLnNE/rvqUx1RqdkWF/P9ooW50sagzF4mL
Gihuavu0FVyHv4CEEg9VoZg1HA2mfXBVNOKIIUqLBZyEBQ84HXtTaYtIYsZgFEf1tMif4dagMOBp
efkQPlzA+20kPCc252lcscx2u5Vs9k7U+0hu1PsQSmsVKD4rowfOhGaZYSmiv2gTYtUHsaOomws6
+S9DGpQsk2NMMry5LgfH1S53hpkvZPhYsSpxE5/wCOXb9Ub58PfKU9Yi3cQ/W8WsoJ7SzONwfjBa
5O6LxFEuZCpyGjlavLM3qP3kVF8CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAInl/tGW9zDqFYuLKSkG+EhP6iDX
unKhVASnEFoeQI3Dpa/FEJSq+ZL9ilxpYO/OkrOrL3ZKqiPHnHy280/5otX0hwCKFyEcKFWQE0ba
O1FFu0Yx6vbaKP4dgHctHBTAoXigP6kWeqbUYfCQiKKp7w+RBnsStU5ODj3ngZSvULqHMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAR7zIq+sZ1Eg8oiz9tPoW+MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDQwOTE3
NTAwN1owIwYJKoZIhvcNAQkEMRYEFDEDp1fAfpJ6aF1Budc5CYvmlVx3MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6FvjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6F
vjANBgkqhkiG9w0BAQEFAASCAQAJiBiut3wzqAA5sDMgtDmXicityqJ5P3kd8yWIQ9d7Z2fG3aNT
2FfBp6/GkApkp5XOK+QzaU9cV3Oy9jg7PRYcSc/EOf0wcac2TA0kAZoSvte5k5J7DN2FoaoiFuGV
GH787Stb+1sr9CIpxh4HbCphyAWGlXVjvFxWsOk7zQA9mCNsDNz99ZRUgMT7y9cFCuDhyQU6Hx21
onTW5dwustVdJV+7nY/jwxaqP2W9nl7pwcL/zGqt8vW6AVDo+ZCVmUZZxXZTeUfCk4rIadJBq+Ba
a7kYsx/O1sU7nlinlLwoIyTVpCbYuOZYr0lppgwSKR0ViW6TR5Y1Jx+fR41XBnHsAAAAAAAA

--------------ms070108000306060704090501--
