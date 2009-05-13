Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M4FJk-0006ju-K5
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:20:20 +0200
Received: (qmail 61 invoked by uid 1003); 13 May 2009 14:13:34 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 May 2009 14:13:33 -0000
Message-ID: <4A0AD58D.1050408@balister.org>
Date: Wed, 13 May 2009 10:13:33 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-14-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1242207556-15601-14-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH 13/37] minilite: Makefile fix - don't strip on	install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2009 14:20:21 -0000
X-Groupsio-MsgNum: 10279
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms000706060301070800040801"

--------------ms000706060301070800040801
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

koen.kooi@gmail.com wrote:
> From: Andrea Adami <andrea.adami@gmail.com>
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/minilite/files/makefile-fix.patch |   11 +++++++++++
>  recipes/minilite/minilite_0.41.bb         |    2 ++
>  recipes/minilite/minilite_0.43.bb         |    2 ++
>  recipes/minilite/minilite_0.44.bb         |    2 ++
>  recipes/minilite/minilite_0.47.bb         |    2 ++
>  recipes/minilite/minilite_0.48.bb         |    2 ++
>  recipes/minilite/minilite_0.49.bb         |    2 ++
>  recipes/minilite/minilite_0.50.bb         |    2 ++
>  8 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/minilite/files/makefile-fix.patch
> 
> diff --git a/recipes/minilite/files/makefile-fix.patch b/recipes/minilite/files/makefile-fix.patch
> new file mode 100644
> index 0000000..1be6cea
> --- /dev/null
> +++ b/recipes/minilite/files/makefile-fix.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.old	2006-01-16 22:51:34.000000000 +0100
> ++++ minilite-050/Makefile	2009-05-01 16:36:32.000000000 +0200
> +@@ -45,7 +45,7 @@
> + 
> + install-program: all
> + 	mkdir -p $(DESTDIR)$(PREFIX)/bin
> +-	$(INSTALL) -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
> ++	$(INSTALL) $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
> + 	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
> + 	$(INSTALL) -m 644 $(PACKAGE).desktop $(DESTDIR)$(PREFIX)/share/applications/$(PACKAGE).desktop
> + 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps/
> diff --git a/recipes/minilite/minilite_0.41.bb b/recipes/minilite/minilite_0.41.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.41.bb
> +++ b/recipes/minilite/minilite_0.41.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.43.bb b/recipes/minilite/minilite_0.43.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.43.bb
> +++ b/recipes/minilite/minilite_0.43.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.44.bb b/recipes/minilite/minilite_0.44.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.44.bb
> +++ b/recipes/minilite/minilite_0.44.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.47.bb b/recipes/minilite/minilite_0.47.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.47.bb
> +++ b/recipes/minilite/minilite_0.47.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.48.bb b/recipes/minilite/minilite_0.48.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.48.bb
> +++ b/recipes/minilite/minilite_0.48.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.49.bb b/recipes/minilite/minilite_0.49.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.49.bb
> +++ b/recipes/minilite/minilite_0.49.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"
> diff --git a/recipes/minilite/minilite_0.50.bb b/recipes/minilite/minilite_0.50.bb
> index 0f5b126..997ae93 100644
> --- a/recipes/minilite/minilite_0.50.bb
> +++ b/recipes/minilite/minilite_0.50.bb
> @@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1" 
> +
>  export CVSBUILD="no"

--------------ms000706060301070800040801
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDUxMzE0
MTMzM1owIwYJKoZIhvcNAQkEMRYEFGHbo9RzZ4ILn19N9B/RMNj2f2V+MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCmGSolOLni8m+J5cH3D4r0U1HK0U73n5T2q/KTVcxWQ/w7Cx9s
w2dp2N2Xdtn3HtUGamUOfONZETcoYaAZvL/sd+tTgqwXp3reOmA9L8F2yK81QxGk4mnrDIOE+U+y
uSA67Xat2Or1BVcrRUO4SO5epD7LBWzyK3wWkC933zAon37cMCCU2425IzqjduWyTZZL3Y115t2H
nrKXAWUgxbz0db7Kgv+gA9kJYBpzP4hh65YvspUYiKUI/K5ikCkpod2fafcHrM6/qygXMh69y7HY
6pg8Zv9KmG6xRhrsShqasIrxmr33IRKiVLVqLlEWcdIDXeh9xuu96uKLD02R4LqMAAAAAAAA

--------------ms000706060301070800040801--
