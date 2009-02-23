Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian@poessinger.com>) id 1Lbhe7-0002qw-4d
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 21:43:32 +0100
Received: from tardis (p5B0A87CF.dip0.t-ipconnect.de [91.10.135.207])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1LbhbE1WEi-0002gn; Mon, 23 Feb 2009 21:40:26 +0100
From: =?iso-8859-1?Q?Christian_P=F6ssinger?= <christian@poessinger.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Feb 2009 21:40:24 +0100
Message-ID: <000801c995f6$f5303340$df9099c0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmV9vJnXAZlAd1MRFes/1QhzcOyfA==
X-Provags-ID: V01U2FsdGVkX184k30nC+DG2Ji+/vE1xcIhsHe8zxPDufJyvmz
	rsT3h/k/Egty3V5LWT0mmJYk84ANmZmblEOyoMInQSjo9PaK3T
	XIyzvnZhQ+TJ6TeYfrS037Q5NZTBqMlAmhhPgELXoweirwHJu+ s3g==
Subject: [PATCH] New Package chan-sccp-b. It's a branch from the original chan-sccp implementation of Skinny Client Control Protocol for the Asterisk soft-PBX
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
X-List-Received-Date: Mon, 23 Feb 2009 20:43:44 -0000
X-Groupsio-MsgNum: 7885
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0003_01C995FF.547CBD70"
Content-Language: de

------=_NextPart_000_0003_01C995FF.547CBD70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

[PATCH] New Package chan-sccp-b. It's a branch from the original chan-sccp
implementation of Skinny Client Control Protocol for the Asterisk soft-PBX

---
 .../enable-all-features.patch                      |   67
++++++++++++++++++++
 .../update-defines.patch                           |   44 +++++++++++++
 packages/asterisk/asterisk-chan-sccp-b_20090110.bb |   34 ++++++++++
 3 files changed, 145 insertions(+), 0 deletions(-)
 create mode 100644
packages/asterisk/asterisk-chan-sccp-b-20090110/enable-all-features.patch
 create mode 100644
packages/asterisk/asterisk-chan-sccp-b-20090110/update-defines.patch
 create mode 100644 packages/asterisk/asterisk-chan-sccp-b_20090110.bb

diff --git
a/packages/asterisk/asterisk-chan-sccp-b-20090110/enable-all-features.patch
b/packages/asterisk/asterisk-chan-sccp-b-20090110/enable-all-features.patch
new file mode 100644
index 0000000..cf3a224
--- /dev/null
+++
b/packages/asterisk/asterisk-chan-sccp-b-20090110/enable-all-features.patch
@@ -0,0 +1,67 @@
+diff -Nurd chan_sccp-20090109.orig/create_config.sh
chan_sccp-20090109/create_config.sh
+--- chan_sccp-20090109.orig/create_config.sh   2009-01-09
17:59:21.000000000 +0100
++++ chan_sccp-20090109/create_config.sh        2009-02-20
18:39:04.000000000 +0100
+@@ -78,57 +78,12 @@
+
+ echo >>$CONFIGFILE
+
+-echo -n "Build PARK functions (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-      echo "#define CS_SCCP_PARK"  >>$CONFIGFILE
+-fi
+-
+-echo -n "Build PICKUP functions (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-        echo "#define CS_SCCP_PICKUP"  >>$CONFIGFILE
+-fi
+-
+-echo -n "Build DIRTRFR functions (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-      echo "#define CS_SCCP_DIRTRFR"  >>$CONFIGFILE
+-fi
+-
+-echo -n "Build CONFERENCE test functions (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-      echo "#define CS_SCCP_CONFERENCE"  >>$CONFIGFILE
+-fi
+-
+-if [ "$REALTIME_USEABLE" = "1" ]
+-then
+-      echo -n "Use realtime functionality (y/n)[n]?"
+-      read key
+-      if [ "$key" = "y" ]
+-      then
+-              echo "#define CS_SCCP_REALTIME"  >>$CONFIGFILE
+-      fi
+-fi
+-
+-echo -n "Enable manager events (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-      echo "#define CS_MANAGER_EVENTS"  >>$CONFIGFILE
+-fi
+-
+-echo -n "Debug SCCP indications (y/n)[n]?"
+-read key
+-if [ "$key" = "y" ]
+-then
+-      echo "#define CS_DEBUG_INDICATIONS"  >>$CONFIGFILE
+-fi
++echo "#define CS_SCCP_PARK"  >>$CONFIGFILE
++echo "#define CS_SCCP_PICKUP"  >>$CONFIGFILE
++echo "#define CS_SCCP_DIRTRFR"  >>$CONFIGFILE
++echo "#define CS_SCCP_CONFERENCE"  >>$CONFIGFILE
++echo "#define CS_SCCP_REALTIME"  >>$CONFIGFILE
++echo "#define CS_MANAGER_EVENTS"  >>$CONFIGFILE
+
+ if [ "$REALTIME_USEABLE" = "1" ]
+ then
diff --git
a/packages/asterisk/asterisk-chan-sccp-b-20090110/update-defines.patch
b/packages/asterisk/asterisk-chan-sccp-b-20090110/update-defines.patch
new file mode 100644
index 0000000..9efc138
--- /dev/null
+++ b/packages/asterisk/asterisk-chan-sccp-b-20090110/update-defines.patch
@@ -0,0 +1,44 @@
+diff -Nurd chan_sccp-20090109.orig/chan_sccp.c
chan_sccp-20090109/chan_sccp.c
+--- chan_sccp-20090109.orig/chan_sccp.c        2009-01-09
17:59:21.000000000 +0100
++++ chan_sccp-20090109/chan_sccp.c     2009-02-19 09:10:21.000000000 +0100
+@@ -23,6 +23,7 @@
+  *
+  */
+ #define AST_MODULE "chan_sccp"
++#define SCCP_BRANCH "v2"
+
+ #include "config.h"
+
+diff -Nurd chan_sccp-20090109.orig/chan_sccp.h
chan_sccp-20090109/chan_sccp.h
+--- chan_sccp-20090109.orig/chan_sccp.h        2009-01-09
17:59:21.000000000 +0100
++++ chan_sccp-20090109/chan_sccp.h     2009-02-19 09:13:05.000000000 +0100
+@@ -132,13 +132,13 @@
+ #endif
+
+ /* Versioning */
+-#ifndef SCCP_VERSION
+ #define SCCP_VERSION "20090109"
+-#endif
+
+-#ifndef SCCP_BRANCH
+-#define SCCP_BRANCH "trunk"
+-#endif
++#define SCCP_BRANCH "v2"
++
++#define BUILD_USER "openembedded"
++
++#define BUILD_DATE "--"
+
+ #define SCCP_LOCK_TRIES 10
+ #define SCCP_LOCK_USLEEP 100
+diff -Nurd chan_sccp-20090109.orig/Makefile chan_sccp-20090109/Makefile
+--- chan_sccp-20090109.orig/Makefile   2009-01-09 17:59:21.000000000 +0100
++++ chan_sccp-20090109/Makefile        2009-02-19 09:10:01.000000000 +0100
+@@ -39,7 +39,6 @@
+ #CFLAGS+= -march=$(PROC)
+ CFLAGS+= -Iinclude -D_REENTRANT -D_GNU_SOURCE -DCRYPTO -fPIC -pipe -Wall
+ CFLAGS+= -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Wlong-long
+-CFLAGS+= -D'SCCP_BRANCH="v2"' -D'SCCP_SVNVERSION="$(shell svnversion -n
.)"' -D'BUILD_USER="$(shell whoami)"' -D'BUILD_DATE="$(shell date)"'
+ CFLAGS+= $(DEBUG)
+
+ LINTOPTS=-linelen 1000
diff --git a/packages/asterisk/asterisk-chan-sccp-b_20090110.bb
b/packages/asterisk/asterisk-chan-sccp-b_20090110.bb
new file mode 100644
index 0000000..fc97816
--- /dev/null
+++ b/packages/asterisk/asterisk-chan-sccp-b_20090110.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "A branch from the original chan-sccp implementation of
Skinny Client Control Protocol for the Asterisk soft-PBX"
+HOMEPAGE="http://sourceforge.net/projects/chan-sccp-b"
+LICENSE = "GPL"
+
+DEPENDS = "asterisk"
+
+PACKAGES = "${PN} ${PN}-dbg"
+
+PARALLEL_MAKE=""
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/chan-sccp-b/chan_sccp_20090110.tar.gz \
+           file://enable-all-features.patch;patch=1\
+           file://update-defines.patch;patch=1\
+         "
+S = "${WORKDIR}/chan_sccp-20090109"
+
+FILES_${PN} = "/usr/lib/asterisk/modules/chan_sccp.so \
+               ${sysconfdir}/asterisk/sccp.conf"
+
+FILES_${PN}-dbg = "/usr/lib/asterisk/modules/.debug/chan_sccp.so"
+
+do_compile () {
+       export STAGING_INCDIR=${STAGING_INCDIR}
+       sed -e
's/ASTERISK_HEADER_DIR=$(INSTALL_PREFIX)\/usr\/include/ASTERISK_HEADER_DIR=\
$\{STAGING_INCDIR\}/' -i Makefile
+       oe_runmake
+}
+
+do_install () {
+       install -m 0755 -d ${D}/${sysconfdir}/asterisk
+       install -m 0755 -d ${D}/usr/lib/asterisk/modules/.debug
+       install -m 0755 ${S}/chan_sccp.so ${D}/usr/lib/asterisk/modules/
+       install -m 0664 ${S}/chan_sccp.so
${D}/usr/lib/asterisk/modules/.debug
+       install -m 0664 ${S}/conf/sccp.conf ${D}/${sysconfdir}/asterisk
+}
--
1.5.4.3

------=_NextPart_000_0003_01C995FF.547CBD70
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILgTCCA1ww
ggLFoAMCAQICAgPpMA0GCSqGSIb3DQEBBAUAMIG8MQswCQYDVQQGEwJERTEQMA4GA1UECBMHSGFt
YnVyZzEQMA4GA1UEBxMHSGFtYnVyZzE6MDgGA1UEChMxVEMgVHJ1c3RDZW50ZXIgZm9yIFNlY3Vy
aXR5IGluIERhdGEgTmV0d29ya3MgR21iSDEiMCAGA1UECxMZVEMgVHJ1c3RDZW50ZXIgQ2xhc3Mg
MSBDQTEpMCcGCSqGSIb3DQEJARYaY2VydGlmaWNhdGVAdHJ1c3RjZW50ZXIuZGUwHhcNOTgwMzA5
MTE1OTU5WhcNMTEwMTAxMTE1OTU5WjCBvDELMAkGA1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcx
EDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRDIFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBp
biBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsTGVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0Ex
KTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRydXN0Y2VudGVyLmRlMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQCwKeu0drOu17ZbtF7nveOxnEkEV1uhq9l/Exv9umGr2Odx3y0AlF1RSH0j
73VihJA8Ch9ZEXQvjoCl/TACPSlSzXIaSSGcvMtSjkihY5bIEIUwaVd0RcBahsbVPeBoV30xaiSN
RZc+MX5oZjJuJG3sMjbJQcrwMUTIo2HKG6A2HwIDAQABo2swaTAPBgNVHRMBAf8EBTADAQH/MA4G
A1UdDwEB/wQEAwIBhjAzBglghkgBhvhCAQgEJhYkaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9n
dWlkZWxpbmVzMBEGCWCGSAGG+EIBAQQEAwIABzANBgkqhkiG9w0BAQQFAAOBgQBPmVmFyGRWgsVv
PdhGCS88UcGncFiBkhLq9NQWAJZecijn1jZfGpyvH8KDGrQFVZmmWFw3KPJXHutdv7HTRQ9yHAPS
AMcsVdr+X4l2i+LUd/VNCRevxLqrMCtPuB3q2f9Z8FB0Rrpe6jaw65J7D1jaMuFSvSM3D/XzAEqu
sF7ebjCCA+wwggNVoAMCAQICDwDENwABAALlou1Djx5XszANBgkqhkiG9w0BAQUFADCBvDELMAkG
A1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcxEDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRD
IFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBpbiBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsT
GVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0ExKTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRy
dXN0Y2VudGVyLmRlMB4XDTA3MDkyNjA3MjQwOVoXDTEwMTIzMTIyNTk1OVowfTELMAkGA1UEBhMC
REUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVy
IENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJ
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDt9kYre5b9JKbNj5LffhGsiGlfobkfluO2XqPL
zKoMOnduw9+sfHUINrW76Y9B02KC9vF3SDmxbIM4fKM3+7k/dKzb0zI4w66PBHx+5CqeykhMm8sQ
aI4EpOUu7tWVfH8ZGHT9UpbVG17+Gi4znxxb/T9+IuB2Q/qr0ZJ5tR/7hwIDAQABo4IBLDCCASgw
VwYIKwYBBQUHAQEESzBJMEcGCCsGAQUFBzAChjtodHRwOi8vd3d3LnRydXN0Y2VudGVyLmRlL2Nl
cnRzZXJ2aWNlcy9jYWNlcnRzL3RjY2xhc3MxLmNydDASBgNVHRMBAf8ECDAGAQH/AgEAMEoGA1Ud
IARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93d3cudHJ1c3RjZW50ZXIu
ZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFP2u3ZGgztA5KkvvKMwSnk9+
FKp1MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly93d3cudHJ1c3RjZW50ZXIuZGUvY3JsL3YyL3Rj
Y2xhc3MxLmNybDANBgkqhkiG9w0BAQUFAAOBgQBe8NTmpp39KWyazqfbPAUwvRv/TEpem4Xy4Gsr
8t4RGG9ExKT/ktfFi2tXO+7LpTmJTbvQ+qHoxkBlmhD1oVVUn2zSIq372vfPvFoFtkvFatpmHDVu
cTm1vVfeq1t3yDsvs3WLicz5jT4MSV5EFBaGMgaKjgAIU0NOMXSadvg1FDCCBC0wggOWoAMCAQIC
DwDGeQABAAJleOfDDs0k2jANBgkqhkiG9w0BAQUFADB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMT
VEMgVHJ1c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBD
QTEpMCcGA1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkwHhcNMDgwNjAyMTk1
OTE0WhcNMDkwNjAzMTk1OTE0WjBVMQswCQYDVQQGEwJERTEdMBsGA1UEAwwUQ2hyaXN0aWFuIFDD
tnNzaW5nZXIxJzAlBgkqhkiG9w0BCQEWGGNocmlzdGlhbkBwb2Vzc2luZ2VyLmNvbTCBnzANBgkq
hkiG9w0BAQEFAAOBjQAwgYkCgYEAuguFcdn+JUOZE1zrf7pNe49W/VOCLZ5qMl4oadEeC2gQEphG
9arX0oBpkpGvvHnZUPDk7YRgQvJCOKQAKpZl4s5yEHFzeT7TIrslx0gCvZTnz2/irp91OdTM/ODf
IFLVm6y/9zUwqhE8xjOANKlKJjGWb1MZQa3OxVt0bAzx2aECAwEAAaOCAdUwggHRMIGZBggrBgEF
BQcBAQSBjDCBiTBSBggrBgEFBQcwAoZGaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9jZXJ0c2Vy
dmljZXMvY2FjZXJ0cy90Y19jbGFzczFfTDFfQ0FfSUlJLmNydDAzBggrBgEFBQcwAYYnaHR0cDov
L29jc3AuSUlJLnRjY2xhc3MxLnRydXN0Y2VudGVyLmRlMB8GA1UdIwQYMBaAFP2u3ZGgztA5Kkvv
KMwSnk9+FKp1MEoGA1UdIARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93
d3cudHJ1c3RjZW50ZXIuZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0OBBYEFFsT
sBwLENTiHhGnFoxQdRHfWH5kMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly93d3cudHJ1c3RjZW50
ZXIuZGUvY3JsL3YyL3RjX2NsYXNzMV9MMV9DQV9JSUkuY3JsMCcGA1UdJQQgMB4GCCsGAQUFBwMC
BggrBgEFBQcDBAYIKwYBBQUHAwcwIwYDVR0RBBwwGoEYY2hyaXN0aWFuQHBvZXNzaW5nZXIuY29t
MA0GCSqGSIb3DQEBBQUAA4GBAO125wEI0aBufMa0kTLKOucyyMuu5imnJR39B/Ujbbivd9TR1NV1
JASrmgipzCxIL1GyaBL+ctUGbCyjxNd5C9NGdNBbdMQ/flcQEG7jWfDYpOCR3krSiRKFbsVXMhgh
mn6iHbG2bzzj76IFqhKHvFS4OP5Hi79A9MGt4DATcm6JMYIDSzCCA0cCAQEwgZAwfTELMAkGA1UE
BhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2Vu
dGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0Eg
SUlJAg8AxnkAAQACZXjnww7NJNowCQYFKw4DAhoFAKCCAhAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDkwMjIzMjA0MDIyWjAjBgkqhkiG9w0BCQQxFgQUzQnsvgFN
Cnmg2YYnbJ0AvQi1u4swZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZI
hvcNAgUwgaEGCSsGAQQBgjcQBDGBkzCBkDB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMTVEMgVHJ1
c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQTEpMCcG
A1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkCDwDGeQABAAJleOfDDs0k2jCB
owYLKoZIhvcNAQkQAgsxgZOggZAwfTELMAkGA1UEBhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2Vu
dGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMT
IFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJAg8AxnkAAQACZXjnww7NJNowDQYJKoZI
hvcNAQEBBQAEgYAv9ASmQWupdH4xzJ8WUeNs5vjDhQcj2HvJgy+kn6iUlj+849pBz/H45Sg3XJgc
AXTjkdgCF2/QA3h4GigOwbR2Q5RnU+1AJZYRMDWK1euY/ommRQzRCPOzYHchKFPgNKwciwzVCeIf
NrOAzLlRUZC/o+//sSgtBliusWlFxiEufQAAAAAAAA==

------=_NextPart_000_0003_01C995FF.547CBD70--
