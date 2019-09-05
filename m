Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 539EA762B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 11:23:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x85BNcfu026761
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Sep 2019 04:23:38 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 04:23:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 19:23:36 +0800
Message-ID: <1567682616-88522-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] drbd-utils: switch to add patch from change source in do_configure
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
X-List-Received-Date: Thu, 05 Sep 2019 11:23:37 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

it is not proper change source in do_configure, it will make
source not updated even local.conf have change the DISTRO_FEATURES

[YOCTO: #13493]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-drbd-utils-support-usrmerge.patch         | 108 +++++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_9.10.0.bb      |  12 +--
 2 files changed, 109 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
new file mode 100644
index 0000000..5e12872
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -0,0 +1,108 @@
+From 642b5823abeee27a0fdc2d12d0e1235461ace9ed Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Sep 2019 18:57:39 +0800
+Subject: [PATCH] drbd-utils: support usrmerge
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac         |  2 +-
+ scripts/Makefile.in  |  4 ++--
+ user/v83/Makefile.in | 14 +++++++-------
+ user/v84/Makefile.in | 14 +++++++-------
+ 4 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4df1b4d..c4ef1bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -176,7 +176,7 @@ AC_ARG_WITH(tmpfilesdir,
+ AC_SUBST(tmpfilesdir)
+ 
+ # set default early
+-default_udevdir=/lib/udev
++default_udevdir=${prefix}/lib/udev
+ if test x"$with_udev" = x || \
+    test x"$with_udev" = xyes ; then
+ 	if test x"$PKG_CONFIG" != x; then
+diff --git a/scripts/Makefile.in b/scripts/Makefile.in
+index fbb0beb..da701a1 100644
+--- a/scripts/Makefile.in
++++ b/scripts/Makefile.in
+@@ -75,8 +75,8 @@ endif
+ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
+ 	install -d $(DESTDIR)$(systemdunitdir)
+ 	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
+-	install -d $(DESTDIR)/lib/drbd/
+-	install -m 755 drbd $(DESTDIR)/lib/drbd/
++	install -d $(DESTDIR)/${nonarch_libdir}/drbd
++	install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbd
+ 	install -d $(DESTDIR)$(tmpfilesdir)/
+ 	install -m 444 drbd.tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/drbd.conf
+ endif
+diff --git a/user/v83/Makefile.in b/user/v83/Makefile.in
+index 27516de..b301376 100644
+--- a/user/v83/Makefile.in
++++ b/user/v83/Makefile.in
+@@ -96,19 +96,19 @@ install:
+ ifeq ($(WITH_83_SUPPORT),yes)
+ 	install -d $(DESTDIR)$(localstatedir)/lib/drbd
+ 	install -d $(DESTDIR)$(localstatedir)/lock
+-	install -d $(DESTDIR)/lib/drbd/
++	install -d $(DESTDIR)/${nonarch_libdir}/drbd/
+ 	if getent group haclient > /dev/null 2> /dev/null ; then		\
+-		install -g haclient -m 4750 drbdsetup-83 $(DESTDIR)/lib/drbd/ ;	\
+-		install -m 755 drbdadm-83 $(DESTDIR)/lib/drbd/ ;		\
++		install -g haclient -m 4750 drbdsetup-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;	\
++		install -m 755 drbdadm-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
+ 	else									\
+-		install -m 755 drbdsetup-83 $(DESTDIR)/lib/drbd/ ;		\
+-		install -m 755 drbdadm-83 $(DESTDIR)/lib/drbd/ ; 		\
++		install -m 755 drbdsetup-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
++		install -m 755 drbdadm-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ; 		\
+ 	fi
+ endif
+ 
+ uninstall:
+-	rm -f $(DESTDIR)/lib/drbd/drbdsetup-83
+-	rm -f $(DESTDIR)/lib/drbd/drbdadm-83
++	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdsetup-83
++	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdadm-83
+ 
+ .PHONY: install uninstall clean distclean
+ ../../configure:
+diff --git a/user/v84/Makefile.in b/user/v84/Makefile.in
+index 38977c6..05ef060 100644
+--- a/user/v84/Makefile.in
++++ b/user/v84/Makefile.in
+@@ -109,19 +109,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
+ 	install -d $(DESTDIR)$(localstatedir)/lib/drbd
+ 	install -d $(DESTDIR)$(localstatedir)/run/drbd
+ 	install -d $(DESTDIR)$(localstatedir)/lock
+-	install -d $(DESTDIR)/lib/drbd/
++	install -d $(DESTDIR)/${nonarch_libdir}/drbd/
+ 	if getent group haclient > /dev/null 2> /dev/null ; then	\
+-		install -g haclient -m 4750 drbdsetup-84 $(DESTDIR)/lib/drbd/ ;	\
+-		install -m 755 drbdadm-84 $(DESTDIR)/lib/drbd/ ;		\
++		install -g haclient -m 4750 drbdsetup-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;	\
++		install -m 755 drbdadm-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
+ 	else								\
+-		install -m 755 drbdsetup-84 $(DESTDIR)/lib/drbd/ ;		\
+-		install -m 755 drbdadm-84 $(DESTDIR)/lib/drbd/ ; 		\
++		install -m 755 drbdsetup-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
++		install -m 755 drbdadm-84 $(DESTDIR)/${nonarch_libdir}/drbd/ ; 		\
+ 	fi
+ endif
+ 
+ uninstall:
+-	rm -f $(DESTDIR)/lib/drbd/drbdsetup-84
+-	rm -f $(DESTDIR)/lib/drbd/drbdadm-84
++	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdsetup-84
++	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdadm-84
+ 
+ spell:
+ 	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
index d708511..0e14ae7 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
+           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
           "
 # v9.10.0
 SRCREV_drbd-utils = "859151b228d3b3aacefb09d06d515a2589c22e35"
@@ -38,17 +39,6 @@ EXTRA_OECONF = " \
 # If we have inherited reproducible_build, we want to use it.
 export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"
 
-do_configure_prepend() {
-    # move the the file under folder /lib/drbd/ to /usr/lib/drbd when usrmerge enabled
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        for m_file in `find ${S} -name 'Makefile.in'`; do
-            sed -i -e "s;\$(DESTDIR)\/lib\/drbd;\$(DESTDIR)\${nonarch_libdir}\/drbd;g" $m_file
-        done
-        # move the the file under folder /lib/udev/ to /usr/lib/udev when usrmerge enabled
-        sed -i -e "s;default_udevdir=/lib/udev;default_udevdir=\${prefix}/lib/udev;g" ${S}/configure.ac
-    fi
-
-}
 do_install_append() {
     # don't install empty /var/lock and /var/run to avoid conflict with base-files
     rm -rf ${D}${localstatedir}/lock
-- 
2.7.4


