Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M4FLA-0000oG-Sb
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:21:49 +0200
Received: (qmail 22931 invoked by uid 1003); 13 May 2009 14:15:02 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 May 2009 14:15:01 -0000
Message-ID: <4A0AD5E4.1040006@balister.org>
Date: Wed, 13 May 2009 10:15:00 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-18-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1242207556-15601-18-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH 17/37] gpe-autostarter: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 14:21:49 -0000
X-Groupsio-MsgNum: 10283
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040107030805030300050705"

--------------ms040107030805030300050705
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

koen.kooi@gmail.com wrote:
> From: Andrea Adami <andrea.adami@gmail.com>
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/gpe-autostarter/files/makefile-fix.patch |   11 +++++++++++
>  recipes/gpe-autostarter/gpe-autostarter_0.11.bb  |    4 +++-
>  recipes/gpe-autostarter/gpe-autostarter_0.12.bb  |    4 +++-
>  recipes/gpe-autostarter/gpe-autostarter_0.6.bb   |    2 ++
>  recipes/gpe-autostarter/gpe-autostarter_0.7.bb   |    2 ++
>  recipes/gpe-autostarter/gpe-autostarter_svn.bb   |    2 ++
>  6 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/gpe-autostarter/files/makefile-fix.patch
> 
> diff --git a/recipes/gpe-autostarter/files/makefile-fix.patch b/recipes/gpe-autostarter/files/makefile-fix.patch
> new file mode 100644
> index 0000000..97ee907
> --- /dev/null
> +++ b/recipes/gpe-autostarter/files/makefile-fix.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.old	2006-08-23 15:08:36.000000000 +0200
> ++++ gpe-autostarter-0.12/Makefile	2009-05-01 22:32:50.000000000 +0200
> +@@ -28,7 +28,7 @@
> + 
> + install-program: all
> + 	install -d $(DESTDIR)$(PREFIX)/bin
> +-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
> ++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
> + 	install -d $(DESTDIR)/etc/X11/Xsession.d
> + 	install $(PACKAGE).xsession $(DESTDIR)/etc/X11/Xsession.d/50$(PACKAGE)
> + 
> diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
> index b228b3d..26a9e97 100644
> --- a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
> +++ b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
> @@ -5,4 +5,6 @@ LICENSE = "GPL"
>  
>  inherit gpe
>  
> -SRC_URI += " file://dbus-new-api.patch;patch=1"
> +SRC_URI += "file://dbus-new-api.patch;patch=1 \
> +	    file://makefile-fix.patch;patch=1"
> +
> diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
> index c47f757..4c4293e 100644
> --- a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
> +++ b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
> @@ -5,4 +5,6 @@ RDEPENDS = "hotplug-dbus"
>  
>  inherit gpe
>  
> -SRC_URI += "file://wireless.patch;patch=1"
> +SRC_URI += "file://wireless.patch;patch=1 \
> +	    file://makefile-fix.patch;patch=1"
> +
> diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
> index ef7f255..0ba68b7 100644
> --- a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
> +++ b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
> @@ -4,3 +4,5 @@ DEPENDS = "glib-2.0 dbus-glib hotplug-dbus"
>  RDEPENDS = "hotplug-dbus"
>  
>  inherit gpe
> +
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
> index f92b5df..9e92740 100644
> --- a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
> +++ b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
> @@ -4,3 +4,5 @@ DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
>  RDEPENDS = "hotplug-dbus"
>  
>  inherit gpe
> +
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> diff --git a/recipes/gpe-autostarter/gpe-autostarter_svn.bb b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
> index 2742952..8d275b5 100644
> --- a/recipes/gpe-autostarter/gpe-autostarter_svn.bb
> +++ b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
> @@ -8,6 +8,8 @@ inherit gpe
>  SRC_URI = "${GPE_SVN} \
>             file://svn-build.patch;patch=1"
>  
> +SRC_URI += "file://makefile-fix.patch;patch=1"
> +
>  S = "${WORKDIR}/${PN}"
>  
>  export CVSBUILD="no"

--------------ms040107030805030300050705
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
MTUwMFowIwYJKoZIhvcNAQkEMRYEFCv9ctc4jB+J2+lbkR8ExIpZEPI9MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQB6GKqtyp1VHQeQfTAKYmn6OmFtfREZKeu4Hcqnn4EpOWrfSFU6
p+eA8w0W63/60JGWpF0AfZ+BpKemAn0cFM3oPjqLY3G2y7mFg5leCKp/7jwLlEyh5wpPD3mguUed
3kO0Dj11C3xp3J6YGvGVb/7GXmmKPxWNKnYmJzt2j9S2dNv7XSRzvej0ksNlsagCv1wXMwhqzmIf
xbo3vLYjpLxRSzqrjB37V7c32J6FdwXx9CGfA3REOhv4UWzvASvS3qrIrEvl+OaStBkmldqJU6rZ
rW67ZmSSapSMYFIGD8N91oV+2Rhn+B4FKFQ7zfqzYrK0uS47ZTDDQdmxtwmn/RMMAAAAAAAA

--------------ms040107030805030300050705--
