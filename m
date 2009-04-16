Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LuQbI-00063L-Mo
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 14:22:32 +0200
Received: (qmail 1655 invoked by uid 1003); 16 Apr 2009 12:17:57 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Apr 2009 12:17:57 -0000
Message-ID: <49E721F4.6020708@balister.org>
Date: Thu, 16 Apr 2009 08:17:56 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>	<1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-3-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1239701117-7033-3-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][STABLE][PATCH 2/4] bluez + obex: sync with .dev
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
X-List-Received-Date: Thu, 16 Apr 2009 12:22:42 -0000
X-Groupsio-MsgNum: 9445
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010702000109030704060706"

--------------ms010702000109030704060706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> ---
>  recipes/bluez/bluez4_4.35.bb                       |   66 ++++++++++++++++++++
>  recipes/bluez/obexd_0.10.bb                        |   10 +++
>  recipes/openobex/obex-data-server_0.4.4.bb         |   11 +++
>  .../openobex-1.5/libusb_crosscompile_check.patch   |   11 +++
>  recipes/openobex/openobex_1.5.bb                   |   22 +++++++
>  5 files changed, 120 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/bluez4_4.35.bb
>  create mode 100644 recipes/bluez/obexd_0.10.bb
>  create mode 100644 recipes/openobex/obex-data-server_0.4.4.bb
>  create mode 100644 recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
>  create mode 100644 recipes/openobex/openobex_1.5.bb
> 
> diff --git a/recipes/bluez/bluez4_4.35.bb b/recipes/bluez/bluez4_4.35.bb
> new file mode 100644
> index 0000000..fec1411
> --- /dev/null
> +++ b/recipes/bluez/bluez4_4.35.bb
> @@ -0,0 +1,66 @@
> +DESCRIPTION = "Linux Bluetooth Stack Userland V4"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
> +HOMEPAGE = "http://www.bluez.org"
> +LICENSE = "GPL"
> +
> +# For angstrom we want this to replace at least bluez-libs
> +PROVIDES_append_angstrom = " bluez-libs"
> +
> +PR = "r1"
> +
> +SRC_URI = "\
> +  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
> +  file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
> +  file://sbc-thumb.patch;patch=1 \
> +  file://bluetooth.conf \
> +"
> +S = "${WORKDIR}/bluez-${PV}"
> +
> +inherit autotools_stage
> +AUTOTOOLS_STAGE_PKGCONFIG = "1"
> +
> +EXTRA_OECONF = "\
> +  --enable-gstreamer \
> +  --enable-alsa \
> +  --enable-usb \
> +  --enable-netlink \
> +  --enable-tools \
> +  --enable-bccmd \
> +  --enable-hid2hci \
> +  --enable-dfutool \
> +  --enable-hidd \
> +  --enable-pandd \
> +  --enable-dund \
> +  --disable-cups \
> +  --enable-test \
> +  --enable-manpages \
> +  --enable-configfiles \
> +  --enable-initscripts \
> +  --disable-pcmciarules \
> +"
> +
> +do_install_append() {
> +        install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
> +        install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> +        install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +        # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
> +        install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
> +}
> +
> +PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
> +
> +FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
> +FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
> +FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
> +FILES_${PN}-dev += "\
> +  ${libdir}/bluetooth/plugins/*.la \
> +  ${libdir}/alsa-lib/*.la \
> +  ${libdir}/gstreamer-0.10/*.la \
> +"
> +
> +FILES_${PN}-dbg += "\
> +  ${libdir}/bluetooth/plugins/.debug \
> +  ${libdir}/*/.debug \
> +"
> diff --git a/recipes/bluez/obexd_0.10.bb b/recipes/bluez/obexd_0.10.bb
> new file mode 100644
> index 0000000..e1cc6ce
> --- /dev/null
> +++ b/recipes/bluez/obexd_0.10.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "OBEX Server and Client"
> +DEPENDS = "openobex glib-2.0 dbus bluez4"
> +
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
> +
> +inherit autotools_stage
> +
> +FILES_${PN} += "${datadir}/dbus-1/"
> diff --git a/recipes/openobex/obex-data-server_0.4.4.bb b/recipes/openobex/obex-data-server_0.4.4.bb
> new file mode 100644
> index 0000000..34efcc7
> --- /dev/null
> +++ b/recipes/openobex/obex-data-server_0.4.4.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX client and server side functionality"
> +LICENSE = "GPLv2"
> +
> +DEPENDS = "bluez4 dbus-glib openobex"
> +
> +SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +FILES_${PN} += "${datadir}/dbus-1/"
> +
> diff --git a/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch b/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
> new file mode 100644
> index 0000000..1177dfe
> --- /dev/null
> +++ b/recipes/openobex/openobex-1.5/libusb_crosscompile_check.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
> ++++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
> +@@ -158,7 +158,7 @@
> + 		;;
> + 	*)
> + 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
> +-		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
> ++		REQUIRES="libusb"
> + 		;;
> + 	esac
> + 	AC_SUBST(USB_CFLAGS)
> diff --git a/recipes/openobex/openobex_1.5.bb b/recipes/openobex/openobex_1.5.bb
> new file mode 100644
> index 0000000..ab69cf1
> --- /dev/null
> +++ b/recipes/openobex/openobex_1.5.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "The Openobex project is an open source implementation of the \
> +Object Exchange (OBEX) protocol."
> +HOMEPAGE = "http://openobex.triq.net"
> +SECTION = "libs"
> +PROVIDES = "openobex-apps"
> +DEPENDS = "libusb-compat bluez4"
> +LICENSE = "GPL"
> +
> +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
> +           file://disable-cable-test.patch;patch=1 \
> +           file://libusb_crosscompile_check.patch;patch=1"
> +
> +inherit autotools_stage binconfig pkgconfig
> +
> +EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
> +                --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
> +
> +PACKAGES += "openobex-apps"
> +FILES_${PN} = "${libdir}/lib*.so.*"
> +FILES_${PN}-dev += "${bindir}/openobex-config"
> +FILES_${PN}-apps = "${bindir}/*"
> +DEBIAN_NOAUTONAME_${PN}-apps = "1"

Acked-by: Philip Balister <philip@balister.org>

--------------ms010702000109030704060706
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQxNjEy
MTc1NlowIwYJKoZIhvcNAQkEMRYEFJ2xrveDvPnQhtDPf4ph++1Nb055MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQB1n6ad1cftN3fkgFsSuOf7QZfhGzqCO/ttle0ccDGOq0TOpb1m
YaicyYyXjQtnsNLFh3ET4aA46WmW8DTgY0fM7WW6JUA+0Agd/qh98E5Jj/3fd3MrveiGe8y1uSyM
4xO5UWttQN47G3EIAjU7YX+CSn1IpWrXWyK3Thrs5PtDGhrK//PE0mjWZlB4dWTjhXsoeqU54rl0
SC0BpLTn5NLiTnEkYNFMR//ikmrCkt1kQCo0KL3nP/FwLh4WzX+RLJ3F+S7ITuiSVvJWaxpGfE4d
trWmw3MUonEd5knw/NPg8bTGGfLC1yfZtzHLbweH0LiojYzU42MBmCS7u4Vh2fZIAAAAAAAA

--------------ms010702000109030704060706--
