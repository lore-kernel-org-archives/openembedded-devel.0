Received: from [66.207.66.26] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philip@balister.org>) id 1HI7bf-0000Hp-9x
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 19:14:52 +0100
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l1GIEgIA005604;
	Fri, 16 Feb 2007 13:14:42 -0500
Message-ID: <45D5F491.7050103@balister.org>
Date: Fri, 16 Feb 2007 13:14:41 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.9 (X11/20070212)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45D5F14F.1050602@dominion.kabel.utwente.nl>
In-Reply-To: <45D5F14F.1050602@dominion.kabel.utwente.nl>
Cc: Harald Welte <laforge@openmoko.org>
Subject: Re: RFC: making uboot safe for multimachine and agree on one spelling
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
X-List-Received-Date: Fri, 16 Feb 2007 18:14:52 -0000
X-Groupsio-MsgNum: 1400
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070100050401070108080802"

--------------ms070100050401070108080802
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The u-boot web page is http://sourceforge.net/projects/u-boot so I 
suggest we standardize on u-boot. Also the tarballs are u-boot-....

I also like your suggesting for installing mkimage.

Philip



Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> After spending some time going trough u-boot recipes trying to make sense of its
> buildsystem, I noticed some strange problems and inconsistencies.
> 
> First the easy part: we need *one* spelling for u-boot, instead of uboot, u-boot, u-bot,
> etc. What is the preferred one nowadays?
> 
> Second: it seems that the 'mkimage' tool is at least arch speficic (at worst
> board-specific), so uboot recipes should install it to
> ${STAGING_NATIVE_DIR}/mkimage.u-boot.${MACHINE_ARCH}
> 
> what do you think about all this?
> 
> regards,
> 
> Koen
> 
> CC: to Harald because I'm not sure he's on oe-devel
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFF1fFPMkyGM64RGpERAsM2AKCo48tTjyY1DPoTYDp/41E8sOOMTQCeO8T8
> urHBB7VH79uq3fyR/9jBzk4=
> =E7Ei
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms070100050401070108080802
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDIxNjE4
MTQ0MVowIwYJKoZIhvcNAQkEMRYEFIKeTk4O12DACtawSzItQyMKBLzXMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6FvjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6F
vjANBgkqhkiG9w0BAQEFAASCAQCTLgrgJehpS7uR1kUlJxtgKy5JSXOi316h4rboctB8HKSjM9cl
h8Q/GEU+lb+RcBONS72MObPKrRWuw2ToLI4ICdf2JZUWlJMVmGfZph9VxgHFd733OfRE9mC5oNZo
4JJrJyLnXerfDcXwjFzAO2YW+oabMmNQmpz9eNCBVpgVecYT44Kx5KdhlCV8Dm7YVyQpJxZls1CT
NpRHaPsb4PtYopn2Rifyv/W6akJR/pa2qjumfDQt0Z1NpkEgnTZ5O7Dc3/YFOGOkeLeR55omINO9
5MBozzTB4SjLgtI/CMFAoikzV2mbRrLTPxLw6ohgl/6by7g+j3nmAqy9IB8T+JqfAAAAAAAA

--------------ms070100050401070108080802--
