Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 73AF06FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 15:33:20 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0SFXKni030668 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:33:20 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012809332044-397284 ;
	Thu, 28 Jan 2016 09:33:20 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2016 17:33:07 +0200
Message-Id: <1453995187-12654-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/28/2016 09:33:20 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/28/2016 09:33:20 AM,
	Serialize complete at 01/28/2016 09:33:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-28_06:, , signatures=0
Cc: brad.mouring@ni.com
Subject: [meta-oe][PATCH 1/1] start-stop-daemon: Upgrade 1.16.0.2 -> 1.17.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jan 2016 15:33:20 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 ...stop-daemon-Accept-SIG-prefixed-signal-na.patch | 39 ++++++++++++++++++++++
 .../start-stop-daemon_1.16.0.2.bb                  | 32 ------------------
 .../start-stop-daemon/start-stop-daemon_1.17.25.bb | 36 ++++++++++++++++++++
 3 files changed, 75 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch
 delete mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch
new file mode 100644
index 0000000..e988efd
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch
@@ -0,0 +1,39 @@
+From 685645a20e39cf2ab7db8d1f5e3666a4228abca8 Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Wed, 8 Jul 2015 09:44:57 +0300
+Subject: [PATCH 1/1] dpkg start-stop-daemon: Accept SIG prefixed signal names
+
+---
+ utils/start-stop-daemon.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/utils/start-stop-daemon.c b/utils/start-stop-daemon.c
+index 6aebe9b..e805082 100644
+--- a/utils/start-stop-daemon.c
++++ b/utils/start-stop-daemon.c
+@@ -18,6 +18,9 @@
+  *                 and Andreas Schuldei <andreas@schuldei.org>
+  *
+  * Changes by Ian Jackson: added --retry (and associated rearrangements).
++ *
++ * Changes by Haris Okanovic <haris.okanovic@ni.com> to support 'SIG'
++ *     prefixed signal names placed in public domain as well.
+  */
+ 
+ #include <config.h>
+@@ -661,6 +664,12 @@ parse_signal(const char *sig_str, int *sig_num)
+ 	if (parse_unsigned(sig_str, 10, sig_num) == 0)
+ 		return 0;
+ 
++        /* Skip over optional "SIG" prefix */
++        if (strncmp(sig_str, "SIG", 3) == 0) {
++                warning("Using deprecated signal name %s. Drop the 'SIG' prefix.\n", sig_str);
++                sig_str += 3;
++        }
++
+ 	for (i = 0; i < array_count(siglist); i++) {
+ 		if (strcmp(sig_str, siglist[i].name) == 0) {
+ 			*sig_num = siglist[i].signal;
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
deleted file mode 100644
index efdd6b7..0000000
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
-package"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
-# start-stop-daemon is usually shipped by dpkg
-DEPENDS = "ncurses"
-RCONFLICTS_${PN} = "dpkg"
-
-PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
-
-SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
-SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
-SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
-
-inherit autotools gettext pkgconfig
-
-S = "${WORKDIR}/dpkg-${PV}"
-
-EXTRA_OECONF = " \
-    --with-start-stop-daemon \
-    --without-bz2 \
-    --without-install-info \
-    --without-selinux \
-    --without-update-alternatives \
-"
-
-do_install_append () {
-    # remove everything that is not related to start-stop-daemon, since there
-    # is no explicit rule for only installing ssd
-    find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
-    find ${D} -depth -type d -empty -exec rmdir {} \;
-}
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
new file mode 100644
index 0000000..5ee4472
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
+package"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;endline=21;md5=8fbd0497a7d0b01e99820bffcb58e9ad"
+# start-stop-daemon is usually shipped by dpkg
+DEPENDS = "ncurses"
+RCONFLICTS_${PN} = "dpkg"
+
+SRC_URI = " \
+    ${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
+    file://0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch \
+"
+
+SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
+SRC_URI[sha256sum] = "07019d38ae98fb107c79dbb3690cfadff877f153b8c4970e3a30d2e59aa66baa"
+
+inherit autotools gettext pkgconfig
+
+S = "${WORKDIR}/dpkg-${PV}"
+
+EXTRA_OECONF = " \
+    --without-bz2 \
+    --without-selinux \
+"
+
+do_install_append () {
+    # remove everything that is not related to start-stop-daemon, since there
+    # is no explicit rule for only installing ssd
+    find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
+    find ${D} -depth -type d -empty -exec rmdir {} \;
+
+    # support for buggy init.d scripts that refer to an alternative
+    # explicit path to start-stop-daemon
+    mkdir -p ${D}/sbin/
+    ln -sf /usr/sbin/start-stop-daemon ${D}/sbin/start-stop-daemon
+}
-- 
2.7.0


