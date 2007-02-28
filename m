Received: from [66.207.66.26] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philip@balister.org>) id 1HMPPq-0001dU-2w
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 15:04:22 +0100
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l1SE4JJo031163
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Feb 2007 09:04:20 -0500
Message-ID: <45E58BE3.5080209@balister.org>
Date: Wed, 28 Feb 2007 09:04:19 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.9 (X11/20070212)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <407130732.20070227223500@gmail.com>	<1172609341.28406.169.camel@localhost.localdomain>	<1828813817.20070227233137@gmail.com>
	<45E57EF4.9050706@dominion.kabel.utwente.nl>
In-Reply-To: <45E57EF4.9050706@dominion.kabel.utwente.nl>
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Wed, 28 Feb 2007 14:04:23 -0000
X-Groupsio-MsgNum: 1497
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms020400010607050405050302"

--------------ms020400010607050405050302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Paul Sokolovsky schreef:
>> Hello Richard,
>>
>> Tuesday, February 27, 2007, 10:49:01 PM, you wrote:
>>
>>> On Tue, 2007-02-27 at 22:35 +0200, Paul Sokolovsky wrote:
>>>> This code was committed, as it doesn't affect any existing aspect of
>>>> OE. Please feel free to tweak it, and of course use!
>>> So its not really a RFC, is it? ;-)
>>   Disapprove is easy if it's wrong.
> 
> To illustrate the point: your commit broke building for machines that don't set root flash
> size (e.g. machines that don't have flash).

To expand a little, I was getting messages related to ROOT_FLASH_SIZE 
when building for the EFIKA. The EFIKA has an IDE slot we can install 
different devices (with different sizes) in (hard drive, CF on adapter, 
etc), so it does not make sense to define ROOT_FLASH_SIZE for this machine.

Philip

--------------ms020400010607050405050302
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDIyODE0
MDQxOVowIwYJKoZIhvcNAQkEMRYEFDyzL9cYS43ADrn8rdNOzKL3aHkyMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6FvjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6F
vjANBgkqhkiG9w0BAQEFAASCAQCllfZ7LOMSEzlXmNzrNswSv6iP5InKaanlHncNjICG//N0uLn5
EWsR30nI6dlmjbO8Gv1nV6wF+f4yXfCVSwd4VPFnne6G1ldp329vAGxSGF+lXFJYRrahWzoL3WsW
laSIny/gRyDgpstnJgC8reVu0QIDRUpRqtiynj2kSKozDQs07ShZFTc7JlNdtZBSOz1NmOBmXat+
qX5R5vqVRJYkvNxl/Xh/3x6bjO3JAs0cZNjbx/Vbm5VIg9ZuIf7cdSBFCl4XDlfSMz0r4xc3hr8Q
AbXXt1a5lRco+IwnnorIahh7/MED5Q7oVxDUQzpjXzMfOhhUy9rMr8uu2fXaogxOAAAAAAAA

--------------ms020400010607050405050302--
