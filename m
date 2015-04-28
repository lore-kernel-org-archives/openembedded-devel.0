Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCBE3716CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 09:19:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2015 02:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="562963398"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by orsmga003.jf.intel.com with ESMTP; 28 Apr 2015 02:19:57 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.197]) with mapi id
	14.03.0224.002; Tue, 28 Apr 2015 10:19:55 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH V7] bluez collection: add (moved from oe-core)
Thread-Index: AQHQgZRBneGabyY/EkGzSi8MWUx6Lp1iJWKw
Date: Tue, 28 Apr 2015 09:19:55 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B8B40@irsmsx105.ger.corp.intel.com>
References: <1430212675-14919-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1430212675-14919-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH V7] bluez collection: add (moved from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 09:19:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In v7:
Solved the gst-plugin-bluetooth crash.
Thanks Martin.
/Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Tuesday, April 28, 2015 12:18 PM
To: openembedded-devel@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [meta-oe][PATCH V7] bluez collection: add (moved from oe-core)

BlueZ 4.x Bluetooth stack has been removed from oe-core.
However, it is still supported, so add it to recipes-connectivity in meta-o=
e.

meta-systemd layer bluez4 bbappend has been integrated into bluez4 recipe.

In order to use it in oe-core/poky/YP, 'bluez5' backfill distro feature nee=
ds to be disabled via:
DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "bluez5" .
'bluetooth' distro feature needs to be present also.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../obsolete_automake_macros.patch                 |  14 +++
 .../bluez/bluez-hcidump_2.5.bb                     |  22 +++++
 .../bluez/bluez4-4.101/bluetooth.conf              |  16 +++
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 +++++++
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 +++++++++++++++++=
++++
 .../bluez/bluez4-4.101/install-test-script.patch   |  26 +++++
 ...ork-fix-network-Connect-method-parameters.patch |  30 ++++++
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 +++
 .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 +++++
 ...pygobject-instead-ofgobject-introspection.patch |  27 +++++
 meta-oe/recipes-connectivity/bluez/bluez4.inc      |  51 ++++++++++
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |  50 ++++++++++
 .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 ++++++++
 .../bluez/bluez4_4.101.bbappend                    |   9 --
 14 files changed, 460 insertions(+), 9 deletions(-)  create mode 100644 me=
ta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros=
.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetoo=
th.conf
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-ude=
v-paths.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_enc=
rypt_collision.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/install=
-test-script.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/network=
-fix-network-Connect-method-parameters.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolet=
e_automake_macros.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx=
.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-leg=
acy-pygobject-instead-ofgobject-introspection.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
 create mode 100644 meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth=
_4.101.bb
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_=
4.101.bbappend

diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_=
automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.=
5/obsolete_automake_macros.patch
new file mode 100644
index 0000000..0c77f1a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_auto
+++ make_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Pending [package obsolete/not maintained by upstream]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd=20
+bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
+--- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
++++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
+@@ -2,7 +2,7 @@
+ AC_INIT(bluez-hcidump, 2.5)
+
+ AM_INIT_AUTOMAKE([foreign subdir-objects])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta=
-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
new file mode 100644
index 0000000..3950630
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Linux Bluetooth Stack HCI Debugger Tool"
+DESCRIPTION =3D "The hcidump tool reads raw HCI data coming from and=20
+going to a Bluetooth device \ and displays the commands, events and data i=
n a human-readable form."
+
+SECTION =3D "console"
+# hcidump was integrated into bluez5
+DEPENDS =3D "bluez4"
+RCONFLICTS_${PN} =3D "bluez5"
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a \
+                    file://src/hcidump.c;beginline=3D1;endline=3D23;md5=3D=
3bee3a162dff43a5be7470710b99fbcf"
+PR =3D "r1"
+
+SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}=
.tar.gz \
+           file://obsolete_automake_macros.patch \ "
+
+SRC_URI[md5sum] =3D "2eab54bbd2b59a2ed4274ebb9390cf18"
+SRC_URI[sha256sum] =3D "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb2=
41267905d88881"
+S =3D "${WORKDIR}/bluez-hcidump-${PV}"
+
+inherit autotools
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf=
 b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
@@ -0,0 +1,16 @@
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.=
0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some=20
+ holes -->
+
+  <policy context=3D"default">
+    <allow own=3D"org.bluez"/>
+    <allow send_destination=3D"org.bluez"/>
+    <allow send_interface=3D"org.bluez.Agent"/>
+  </policy>
+
+</busconfig>
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths=
.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.pat=
ch
new file mode 100644
index 0000000..8089914
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.pat
+++ ch
@@ -0,0 +1,37 @@
+Add udevdir/udevrulesdir options
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: bluez-4.101/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/Makefile.am
++++ bluez-4.101/Makefile.am
+@@ -395,7 +395,7 @@ EXTRA_DIST +=3D audio/bluetooth.conf  include=20
+Makefile.tools
+=20
+ if DATAFILES
+-rulesdir =3D @UDEV_DIR@/rules.d
++rulesdir =3D @UDEV_RULES_DIR@
+=20
+ udev_files =3D
+=20
+Index: bluez-4.101/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/configure.ac
++++ bluez-4.101/configure.ac
+@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then  fi =20
+AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
+=20
++AC_ARG_WITH([udevdir],
++    AS_HELP_STRING([--with-udevdir=3DDIR], [udev directory]),
++    [], [with_udevdir=3D/lib/udev/])
++AC_SUBST([UDEV_DIR], [$with_udevdir])
++
++AC_ARG_WITH([udevrulesdir],
++    AS_HELP_STRING([--with-udevrulesdir=3DDIR], [udev rules directory]),
++    [], [with_udevrulesdir=3D/lib/udev/rules.d])
++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
++
+ AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8=20
+ src/bluetooth.service bluez.pc)
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_co=
llision.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt=
_collision.patch
new file mode 100644
index 0000000..1bc390f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collis
+++ ion.patch
@@ -0,0 +1,110 @@
+Avoid namepspace collision with encrypt function from libc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: bluez-4.101/test/l2test.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/test/l2test.c
++++ bluez-4.101/test/l2test.c
+@@ -107,7 +107,7 @@ static char *filename =3D NULL;  static int rfcmode =
=3D=20
+0;  static int master =3D 0;  static int auth =3D 0; -static int encrypt =
=3D=20
+0;
++static int encryption_request =3D 0;
+ static int secure =3D 0;
+ static int socktype =3D SOCK_SEQPACKET;
+ static int linger =3D 0;
+@@ -340,7 +340,7 @@ static int do_connect(char *svr)
+ 		opt |=3D L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |=3D L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |=3D L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |=3D L2CAP_LM_SECURE;
+@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
+ 		opt |=3D L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |=3D L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |=3D L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |=3D L2CAP_LM_SECURE;
+@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
+ 			break;
+=20
+ 		case 'E':
+-			encrypt =3D 1;
++			encryption_request =3D 1;
+ 			break;
+=20
+ 		case 'S':
+Index: bluez-4.101/test/rctest.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/test/rctest.c
++++ bluez-4.101/test/rctest.c
+@@ -79,7 +79,7 @@ static char *filename =3D NULL;
+=20
+ static int master =3D 0;
+ static int auth =3D 0;
+-static int encrypt =3D 0;
++static int encryption_request =3D 0;
+ static int secure =3D 0;
+ static int socktype =3D SOCK_STREAM;
+ static int linger =3D 0;
+@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
+ 		opt |=3D RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |=3D RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |=3D RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |=3D RFCOMM_LM_SECURE;
+@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
+ 		opt |=3D RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |=3D RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |=3D RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |=3D RFCOMM_LM_SECURE;
+@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
+ 			break;
+=20
+ 		case 'E':
+-			encrypt =3D 1;
++			encryption_request =3D 1;
+ 			break;
+=20
+ 		case 'S':
+Index: bluez-4.101/src/textfile.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/src/textfile.h
++++ bluez-4.101/src/textfile.h
+@@ -24,6 +24,8 @@
+ #ifndef __TEXTFILE_H
+ #define __TEXTFILE_H
+=20
++#include <sys/types.h>
++
+ int create_dirs(const char *filename, const mode_t mode);  int=20
+create_file(const char *filename, const mode_t mode);  int=20
+create_name(char *buf, size_t size, const char *path,
+Index: bluez-4.101/test/attest.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.101.orig/test/attest.c
++++ bluez-4.101/test/attest.c
+@@ -34,6 +34,7 @@
+ #include <termios.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
++#include <sys/select.h>
+=20
+ #include <bluetooth/bluetooth.h>
+ #include <bluetooth/rfcomm.h>
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-s=
cript.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-=
script.patch
new file mode 100644
index 0000000..23f7d99
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-scrip
+++ t.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate
+
+Install the bluez's test scripts
+
+Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com> diff -Nurd=20
+bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
+--- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
++++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
+@@ -227,6 +227,17 @@
+ 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
+ 		test/simple-player test/test-nap
+=20
++bluez4_testdir =3D $(libdir)/bluez4/test/ dist_bluez4_test_SCRIPTS =3D=20
++test/sap-client test/hsplay test/hsmicro \
++		test/monitor-bluetooth test/list-devices \
++		test/test-discovery test/test-manager test/test-adapter \
++		test/test-device test/test-service test/test-serial \
++		test/test-telephony test/test-network test/simple-agent \
++		test/simple-service test/simple-endpoint test/test-audio \
++		test/test-input test/test-sap-server test/test-oob \
++		test/test-attrib test/test-proximity test/test-thermometer \
++		test/test-serial-proxy test/test-health test/test-health-sink \
++		test/simple-player test/test-nap
+ if HIDD
+ bin_PROGRAMS +=3D compat/hidd
+=20
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-ne=
twork-Connect-method-parameters.patch b/meta-oe/recipes-connectivity/bluez/=
bluez4-4.101/network-fix-network-Connect-method-parameters.patch
new file mode 100644
index 0000000..37f9199
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-networ
+++ k-Connect-method-parameters.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+
+From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
+From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
+Date: Sat, 30 Jun 2012 00:39:05 -0300
+Subject: [PATCH] network: fix network Connect() method parameters
+
+---
+ network/connection.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/network/connection.c b/network/connection.c index=20
+544ec3a..59423a9 100644
+--- a/network/connection.c
++++ b/network/connection.c
+@@ -554,7 +554,9 @@ static void path_unregister(void *data)
+=20
+ static const GDBusMethodTable connection_methods[] =3D {
+ 	{ GDBUS_ASYNC_METHOD("Connect",
+-			NULL, NULL, connection_connect) },
++				GDBUS_ARGS({"uuid", "s"}),
++				GDBUS_ARGS({"interface", "s"}),
++				connection_connect) },
+ 	{ GDBUS_METHOD("Disconnect",
+ 			NULL, NULL, connection_disconnect) },
+ 	{ GDBUS_METHOD("GetProperties",
+--
+1.7.9.5
+
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_autom=
ake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete=
_automake_macros.patch
new file mode 100644
index 0000000..1068f24
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_
+++ macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd=20
+bluez-4.101/configure.ac bluez-4.101/configure.ac
+--- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
++++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
+@@ -2,7 +2,7 @@
+ AC_INIT(bluez, 4.101)
+
+ AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch =
b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
new file mode 100644
index 0000000..98fab45
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
@@ -0,0 +1,24 @@
+on x86 and x86_64 gcc 4.7 complains
+
+sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
+sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't=20
+match constraints [enabled by default]
+sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
+
+This patch is taken from=20
+https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: bluez-4.98/sbc/sbc_primitives_mmx.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000=
 -0800
++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -080=
0
+@@ -318,7 +318,7 @@
+ 				"movl          %k0, 4(%3)\n"
+ 			: "+r" (blk)
+ 			: "r" (&sb_sample_f[0][ch][sb]),
+-				"i" ((char *) &sb_sample_f[1][0][0] -
++				"r" ((char *) &sb_sample_f[1][0][0] -
+ 					(char *) &sb_sample_f[0][0][0]),
+ 				"r" (&scale_factor[ch][sb]),
+ 				"r" (&consts),
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pyg=
object-instead-ofgobject-introspection.patch b/meta-oe/recipes-connectivity=
/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.pa=
tch
new file mode 100644
index 0000000..37037f5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobje
+++ ct-instead-ofgobject-introspection.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Inappropriate
+
+use legacy pygobject instead of gobject-introspection
+
+Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
+---
+diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-agen=
t
+--- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +0800
++++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
+@@ -2,7 +2,7 @@
+=20
+ from __future__ import absolute_import, print_function,=20
+ unicode_literals
+=20
+-from gi.repository import GObject
++import gobject
+=20
+ import sys
+ import dbus
+@@ -122,7 +122,7 @@
+ 	path =3D "/test/agent"
+ 	agent =3D Agent(bus, path)
+=20
+-	mainloop =3D GObject.MainLoop()
++	mainloop =3D gobject.MainLoop()
+=20
+ 	if len(args) > 1:
+ 		if len(args) > 2:
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/recipe=
s-connectivity/bluez/bluez4.inc
new file mode 100644
index 0000000..59c35e4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4.inc
@@ -0,0 +1,51 @@
+SUMMARY =3D "Linux Bluetooth Stack Userland V4"
+DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These incl=
ude a system configurations, daemons, tools and system libraries."
+HOMEPAGE =3D "http://www.bluez.org"
+SECTION =3D "libs"
+LICENSE =3D "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e \
+                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0=
e09 \
+                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9bc=
54b93cd7e17bf03f52513f39f926e \
+                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a40=
781ed30d50d8639323a184aeb191"
+
+RPROVIDES_${PN} +=3D "${PN}-systemd"
+RREPLACES_${PN} +=3D "${PN}-systemd"
+RCONFLICTS_${PN} +=3D "${PN}-systemd"
+
+DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
+RDEPENDS_${PN}-dev =3D "bluez-hcidump"
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '',=20
+d)} \ "
+PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
+PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_unitdir}/sys=
tem/,--with-systemdunitdir=3D"
+
+ASNEEDED =3D ""
+
+SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz"
+S =3D "${WORKDIR}/bluez-${PV}"
+
+inherit autotools-brokensep pkgconfig systemd
+
+EXTRA_OECONF =3D "\
+    --disable-gstreamer \
+    --enable-usb \
+    --enable-tools \
+    --enable-bccmd \
+    --enable-hid2hci \
+    --enable-dfutool \
+    --disable-hidd \
+    --disable-pand \
+    --disable-dund \
+    --disable-cups \
+    --enable-test \
+    --enable-datafiles \
+    --with-udevdir=3D`pkg-config --variable=3Dudevdir udev` \
+    --with-udevrulesdir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \=
=20
+"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/r=
ecipes-connectivity/bluez/bluez4_4.101.bb
new file mode 100644
index 0000000..96ce0f6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -0,0 +1,50 @@
+require bluez4.inc
+
+PR =3D "r11"
+
+SRC_URI +=3D "file://bluetooth.conf \
+            file://sbc_mmx.patch \
+            file://fix-udev-paths.patch \
+            file://obsolete_automake_macros.patch \
+            file://network-fix-network-Connect-method-parameters.patch \
+            file://install-test-script.patch \
+            file://use-legacy-pygobject-instead-ofgobject-introspection.pa=
tch \
+            file://fix_encrypt_collision.patch \ "
+
+SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
+SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad=
75fe52846f7487"
+
+RCONFLICTS_${PN} =3D "bluez5"
+
+do_install_append() {
+    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth=
/
+    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+    # at_console doesn't really work with the current state of OE, so punc=
h some more holes so people can actually use BT
+    install -m 0644 ${WORKDIR}/bluetooth.conf=20
+${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+RDEPENDS_${PN}-dev =3D "bluez-hcidump"
+RDEPENDS_${PN}-testtools +=3D "python python-dbus python-pygobject"
+
+ALLOW_EMPTY_libasound-module-bluez =3D "1"
+PACKAGES =3D+ "libasound-module-bluez ${PN}-testtools"
+
+FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir}/al=
sa"
+FILES_${PN} +=3D "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/=
*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ =
${datadir}/dbus-1"
+FILES_${PN}-dev +=3D "\
+    ${libdir}/bluetooth/plugins/*.la \
+    ${libdir}/alsa-lib/*.la \
+"
+
+FILES_${PN}-testtools =3D "${libdir}/bluez4/test/*"
+
+FILES_${PN}-dbg +=3D "\
+    ${libdir}/bluetooth/plugins/.debug \
+    ${libdir}/*/.debug \
+    */udev/.debug \
+"
+
+SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
+SYSTEMD_AUTO_ENABLE =3D "disable"
\ No newline at end of file
diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.=
bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
new file mode 100644
index 0000000..6a16520
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -0,0 +1,39 @@
+require bluez4.inc
+require recipes-multimedia/gstreamer/gst-plugins-package.inc
+
+PR =3D "r1"
+
+SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
+SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad=
75fe52846f7487"
+
+DEPENDS =3D "bluez4 gst-plugins-base"
+
+EXTRA_OECONF =3D "\
+    --enable-gstreamer \
+"
+
+# clean unwanted files
+do_install_append() {
+    rm -rf ${D}${bindir}
+    rm -rf ${D}${sbindir}
+    rm -f  ${D}${libdir}/lib*
+    rm -rf ${D}${libdir}/pkgconfig
+    rm -rf ${D}${sysconfdir}
+    rm -rf ${D}${base_libdir}
+    rm -rf ${D}${libdir}/bluetooth
+    rm -rf ${D}${localstatedir}
+    rm -rf ${D}${libdir}/alsa-lib
+    rm -rf ${D}${datadir}
+    rm -rf ${D}${includedir}
+    rm -rf ${D}${nonarch_base_libdir}
+}
+
+FILES_${PN} =3D "${libdir}/gstreamer-0.10/lib*.so"
+FILES_${PN}-dev +=3D "\
+    ${libdir}/gstreamer-0.10/*.la \
+"
+
+FILES_${PN}-dbg +=3D "\
+    ${libdir}/*/.debug \
+"
+
diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.b=
bappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbap=
pend
deleted file mode 100644
index da01b05..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit systemd
-
-EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
-
-RPROVIDES_${PN} +=3D "${PN}-systemd"
-RREPLACES_${PN} +=3D "${PN}-systemd"
-RCONFLICTS_${PN} +=3D "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
-SYSTEMD_AUTO_ENABLE =3D "disable"
--
2.1.0


