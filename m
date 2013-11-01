Return-Path: <joe@deserted.net>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEA636AD31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 18:24:34 +0000 (UTC)
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA1IOa7d015147
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Nov 2013 11:24:36 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2013 14:24:36 -0400
Message-Id: <1383330276-16354-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.8.4
Subject: [meta-networking][v2][PATCH] autofs: correct QA issues with orphaned systemd files
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
X-List-Received-Date: Fri, 01 Nov 2013 18:24:35 -0000

If we build a project without systemd support on a system that has systemd
enabled, the following QA items get flagged:

  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/autofs.service

Trying to keep the solution to the problem as contained as possible in a
way that may be accepted up-stream by adding an optional parameter to the
--with-systemd flag.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---

Corrected version.  Basically this problem appeared if I built on a
systemd-system for a system without systemd in DISTRO_FEATURES.  Autodetection
was still half-happening.

 ...emd-allow-with-systemd-to-take-a-path-arg.patch | 47 ++++++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |  4 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
new file mode 100644
index 0000000..742f25d
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
@@ -0,0 +1,47 @@
+From 40971911d653bf53de295d7462c643e4073916b9 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe@deserted.net>
+Date: Fri, 1 Nov 2013 12:47:18 -0400
+Subject: [PATCH] systemd: allow --with-systemd to take a path arg
+
+If building for a cross-compile environment with systemd it is convenient
+to be able to specify a systemd path for the target that may not be the
+same as that on the host.
+
+Upstream-status: Submitted [http://www.spinics.net/lists/autofs/msg00740.html]
+
+Signed-off-by: Joe MacDonald <joe@deserted.net>
+---
+ aclocal.m4 |   10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 3e6f223..105e3e9 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -229,8 +229,10 @@ dnl Check the location of the systemd unit files directory
+ dnl --------------------------------------------------------------------------
+ AC_DEFUN([AF_WITH_SYSTEMD],
+ [AC_ARG_WITH(systemd,
+-[  --with-systemd         install systemd unit file if systemd unit directory
+-			  is found on system],
++[  --with-systemd@<:@=systemddir@:>@  install systemd unit file.  If 'yes'
++			  probe the system for unit directory.
++			  If a path is specified, assume that
++			  is a valid install path.],
+ [if test "$withval" = yes; then
+   if test -z "$systemddir"; then
+     AC_MSG_CHECKING([location of the systemd unit files directory])
+@@ -247,6 +249,10 @@ AC_DEFUN([AF_WITH_SYSTEMD],
+   else
+     AC_MSG_RESULT(not found)
+   fi
++else
++ if test "$withval" != no; then
++  systemddir=$withval
++ fi
+ fi])
+ ])
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index c4eea31..54e89f5 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -60,6 +60,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-do-not-check-for-modprobe.patch \
            file://fix_disable_ldap.patch \
            file://autofs-5.0.7-fix-lib-deps.patch \
+           file://0001-systemd-allow-with-systemd-to-take-a-path-arg.patch \
 "
 
 SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"
@@ -73,7 +74,7 @@ INITSCRIPT_PARAMS = "defaults"
 # FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
 CFLAGS += "${LDFLAGS}"
 
-PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
 
 PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
@@ -85,7 +86,6 @@ EXTRA_OECONF += "--disable-mount-locking \
 "
 CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
                         ac_cv_path_RPCGEN=rpcgen \
-                        systemddir=${systemd_unitdir}/system \
 "
 
 do_configure_prepend () {
-- 
1.8.4


