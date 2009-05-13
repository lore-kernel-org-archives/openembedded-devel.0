Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M4FKM-0006p2-A8
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:20:59 +0200
Received: (qmail 22800 invoked by uid 1003); 13 May 2009 14:14:11 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 May 2009 14:14:10 -0000
Message-ID: <4A0AD5AF.30303@balister.org>
Date: Wed, 13 May 2009 10:14:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-16-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1242207556-15601-16-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH 15/37] gpe-taskmanager: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 14:20:59 -0000
X-Groupsio-MsgNum: 10281
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050508060000080204000806"

--------------ms050508060000080204000806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

koen.kooi@gmail.com wrote:
> From: Andrea Adami <andrea.adami@gmail.com>
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/gpe-taskmanager/files/makefile-fix.patch |   11 +++++++++++
>  recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb  |    2 ++
>  recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb  |    2 ++
>  recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb  |    2 ++
>  recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb  |    1 +
>  5 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gpe-taskmanager/files/makefile-fix.patch
> 
> diff --git a/recipes/gpe-taskmanager/files/makefile-fix.patch b/recipes/gpe-taskmanager/files/makefile-fix.patch
> new file mode 100644
> index 0000000..7b26bed
> --- /dev/null
> +++ b/recipes/gpe-taskmanager/files/makefile-fix.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.old	2006-04-10 13:41:32.000000000 +0200
> ++++ gpe-taskmanager-0.20/Makefile	2009-05-01 22:03:35.000000000 +0200
> +@@ -32,7 +32,7 @@
> + 
> + install-program: all all-desktop
> + 	install -d $(DESTDIR)$(PREFIX)/bin
> +-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
> ++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
> + 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
> + 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PACKAGE).png
> + 	install -d $(DESTDIR)$(PREFIX)/share/applications
> diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
> index 1f31a4d..6b03ad4 100644
> --- a/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
> +++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
> @@ -7,3 +7,5 @@ SECTION = "gpe"
>  DESCRIPTION = "GPE task manager"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
> +
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
> index 1f31a4d..6b03ad4 100644
> --- a/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
> +++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
> @@ -7,3 +7,5 @@ SECTION = "gpe"
>  DESCRIPTION = "GPE task manager"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
> +
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
> index 1f31a4d..6b03ad4 100644
> --- a/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
> +++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
> @@ -7,3 +7,5 @@ SECTION = "gpe"
>  DESCRIPTION = "GPE task manager"
>  
>  SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
> +
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
> index 7d0ff8e..e02afbf 100644
> --- a/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
> +++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
> @@ -7,3 +7,4 @@ inherit gpe
>  
>  SRC_URI += "file://setlocale.patch;patch=1"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1"

--------------ms050508060000080204000806
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
MTQwN1owIwYJKoZIhvcNAQkEMRYEFKKbcLxn/H5T3ijmEWVi1hjgwapmMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQBLItuqdLkCrIZvXeaHJcnJtfbNdL0Lwy12cU0AZCq9v4GKEt2I
npTL+6dcx9swySiDuauJGho3Y3XZFqFsPHWJKN23dysq9OMyAu5FL1ePlMNZo8EBJOvYfVuyLqnL
dfpYKPKNQDFMRlOx4JnOclF9A1aDp5w6KUf1XNMNoYTWLtbmIUyIz4nbC2lWo+hSp7Zj92Dqo4Bw
9oKiGvapRwAXgLgBhowXtUYPfxN/muLQ5FcAsv+U34CQomtky4lkqi7DGjMQ4nTN7knG34NW74Wf
QwjyWQHqNrOHXrFa0NFtdM2EjDDwq8zp2Gkx+DWKHqTm5rK0j73QM3HUyFaBG+PAAAAAAAAA

--------------ms050508060000080204000806--
