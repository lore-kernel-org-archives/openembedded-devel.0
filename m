Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1INtRL-0001mt-Ps
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 18:52:20 +0200
Received: (qmail 3982 invoked by uid 1003); 22 Aug 2007 16:51:13 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Aug 2007 16:51:12 -0000
Message-ID: <46CC697F.8040306@balister.org>
Date: Wed, 22 Aug 2007 12:51:11 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.5 (X11/20070719)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <19c1b8a90708220852p5ed75070wa0a78dd002fe112c@mail.gmail.com>
In-Reply-To: <19c1b8a90708220852p5ed75070wa0a78dd002fe112c@mail.gmail.com>
Subject: Re: RFC: Fix for bug 1744 and some restructuring of omap kernel bb	files.
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
X-List-Received-Date: Wed, 22 Aug 2007 16:52:20 -0000
X-Groupsio-MsgNum: 2748
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010806030504010609030401"

--------------ms010806030504010609030401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have given it a quick look, and it looks reasonable. It appears to 
drop OABI support, which I think is OK, except for the celinux distro 
(not sure).

The only real concern I have is that we would like to move to the 
linux.inc/linux_2.6.x.bb style of kernel bb files. Should we push this, 
or wait until we can convert the omap/davinci kernels to linux.inc? I 
shouldn't even look at this until September ...

Philip

Khem Raj wrote:
> Hi Koen et al.
> 
> I have been looking into omap structure of late and found that it was
> hard to add a new machine to same kernel build without some
> duplication. So I went ahead and tried to fix it. Attached patch also
> fixes bug 1744.
> 
> I have moved the defconf files to kernel-<version>/$MACHINE folder and
> I expect that we add machine specific patches if needed here too.
> 
> I have built omap5912osk and omap2430sdp machine kernels with this
> change and they built and worked ok.
> 
> However I have also made changes to other omap related files which I
> believe I correct but it would be helpful if someone could test them.
> 
> I havent changed the old kernel bb files. If this looks ok and
> applicable I can do that too.
> 
> Is it ok?
> 
> Thanks
> 
> -Khem
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--------------ms010806030504010609030401
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHzDFPOZ2p8t9T4wm358rqkwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDQxNDEzMTkyOVoXDTA4MDQxMzEzMTky
OVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvJS5tUVsXVRltIKV57mvyOnqjrDpQX8YvC35MubnQf7RctFZ
65G/JPVfYuJzo0956WHCLCSPC1mhaA5bVNCogPweIYq9EoZZsTijl3qrP6AkCdfr47S5fwIps4vZ
X3zFZ1BXZ7up+wrl+s0Xp3i6IJrdVysiAbz5oUF1Fl7Go0SzLgwQa+m7LL2XqFaMM3jIH+qUxu72
tDt43Jjl97/8YGsdNWQRipOWA+VvK6JS5yse1IxEI73mWZWeQMe4y6TEtp/8kcWxCB7aIjrMNQMN
szDZVB2pvaRXapwf5HKxY7zLuScR94reAR0hBmusQ2xPuhDGbbjEdkvgcST2yR0ZlwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAbLC8HLx4GoPVKDTTePeZ6Atrqtro0XmJi/Nqw7DJyWG5mzqAS2HdIFnxOuAk9srp
nbYSpM8lXwnRtLaIrlnawIMDtCrvBQ4RSnrUsxxDVVa+FJYDP2nzYFFul8eXoZfCUiYil1flfdYN
U5QulSNRWJZkmYvowYVfU81qKnZ0TFAwggL9MIICZqADAgECAhB8wxTzmdqfLfU+MJt+fK6pMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNzA0MTQxMzE5MjlaFw0wODA0MTMxMzE5MjlaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALyUubVFbF1U
ZbSClee5r8jp6o6w6UF/GLwt+TLm50H+0XLRWeuRvyT1X2Lic6NPeelhwiwkjwtZoWgOW1TQqID8
HiGKvRKGWbE4o5d6qz+gJAnX6+O0uX8CKbOL2V98xWdQV2e7qfsK5frNF6d4uiCa3VcrIgG8+aFB
dRZexqNEsy4MEGvpuyy9l6hWjDN4yB/qlMbu9rQ7eNyY5fe//GBrHTVkEYqTlgPlbyuiUucrHtSM
RCO95lmVnkDHuMukxLaf/JHFsQge2iI6zDUDDbMw2VQdqb2kV2qcH+RysWO8y7knEfeK3gEdIQZr
rENsT7oQxm24xHZL4HEk9skdGZcCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAGywvBy8eBqD1Sg003j3megLa6ra
6NF5iYvzasOwyclhuZs6gEth3SBZ8TrgJPbK6Z22EqTPJV8J0bS2iK5Z2sCDA7Qq7wUOEUp61LMc
Q1VWvhSWAz9p82BRbpfHl6GXwlImIpdX5X3WDVOULpUjUViWZJmL6MGFX1PNaip2dExQMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB8wxTzmdqfLfU+MJt+fK6pMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDgyMjE2
NTExMVowIwYJKoZIhvcNAQkEMRYEFIOBfWHUA/8JEo6BGCQpValJreVzMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQAz6ynfUow9baRc3pHy0UO76FFQFzmaKpgBrEx0g0PaM5AGEzMB
s/JNtVsxTmXmm0mnXW2pXObONMdJR+rUoGot4Xptxm3pVeHwEiIXlvvA2I4rZ7a239GTqv8KB+ji
7AhsWQDGUfXYUAbRKqFhPeOZM82Z9HafJY7CLO89F0ICRmdmNxVb4GVtWZ0VP7GzOzKxEQEh66XQ
x+nUr6QQbUoiKmj6zf9aCJZXtm0SRrVpXn56sC+TCdPfGbmDURop9sQndr5SRB6KnUw1Fj+4Z2BN
XIpFfn9Z9rOri4G77wBZsZVmyMYcKuWn/FRLWSp6jaM9Y50YbzObz9YNmKtEqsPrAAAAAAAA

--------------ms010806030504010609030401--
