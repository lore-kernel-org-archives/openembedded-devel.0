Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 4981 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 08 Apr 2018 20:32:34 UTC
Received: from slow1-d.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 91E027470E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:32:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id CF2163A0145
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:25:35 +0200 (CEST)
X-Originating-IP: 50.37.95.246
Received: from xps13.localdomain (unknown [50.37.95.246])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 268B820003;
	Sun,  8 Apr 2018 20:25:33 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Apr 2018 11:25:06 -0700
Message-Id: <20180408182506.24114-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.1
Subject: [meta-oe][PATCH] htop: Update to 2.1.0
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
X-List-Received-Date: Sun, 08 Apr 2018 20:32:35 -0000

Add PACKAGECONFIG options and update formatting to better conform to the
style guide.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../htop/files/0001-Use-pkg-config.patch           | 35 +++++++++-------------
 meta-oe/recipes-support/htop/htop_2.0.2.bb         | 25 ----------------
 meta-oe/recipes-support/htop/htop_2.1.0.bb         | 35 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-support/htop/htop_2.0.2.bb
 create mode 100644 meta-oe/recipes-support/htop/htop_2.1.0.bb

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index ff5cd4923..fc0d86e33 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -1,36 +1,32 @@
-From 7ebcbf17ad9483c7109e4a83b66966bc02f09bd4 Mon Sep 17 00:00:00 2001
-From: Paul Barker <pbarker@toganlabs.com>
-Date: Sun, 5 Nov 2017 20:10:10 +0000
-Subject: [PATCH] Use pkg-config
-
 We need to use pkg-config to find the ncurses library instead of the
 ncurses*-config applications.
 
 Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
 Upstream-status: Inappropriate
     (`ncurses*-config` can be used outside of OpenEmbedded)
----
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7e0edd1..c5a8365 100644
+index 559dc4d..77aea22 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -185,9 +185,9 @@ m4_define([HTOP_CHECK_LIB],
+@@ -185,10 +185,10 @@ m4_define([HTOP_CHECK_LIB],
  
  AC_ARG_ENABLE(unicode, [AS_HELP_STRING([--enable-unicode], [enable Unicode support])], ,enable_unicode="yes")
  if test "x$enable_unicode" = xyes; then
 -   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
--    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw5-config",
--     HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "ncurses5-config",
+-    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
+-     HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw5-config",
+-      HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "ncurses5-config",
 +   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
-+    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
-+     HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
-       HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
-        HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
-         HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
-@@ -200,8 +200,8 @@ if test "x$enable_unicode" = xyes; then
++    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
++     HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
++      HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
+        HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
+         HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
+          HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
+@@ -201,8 +201,8 @@ if test "x$enable_unicode" = xyes; then
           [AC_CHECK_HEADERS([ncurses/curses.h],[:],
              [AC_CHECK_HEADERS([ncurses.h],[:],[missing_headers="$missing_headers $ac_header"])])])])
  else
@@ -41,6 +37,3 @@ index 7e0edd1..c5a8365 100644
       HTOP_CHECK_LIB([ncurses6],  [refresh], [HAVE_LIBNCURSES],
        HTOP_CHECK_LIB([ncurses],  [refresh], [HAVE_LIBNCURSES],
        missing_libraries="$missing_libraries libncurses"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/htop/htop_2.0.2.bb b/meta-oe/recipes-support/htop/htop_2.0.2.bb
deleted file mode 100644
index 395b83ff6..000000000
--- a/meta-oe/recipes-support/htop/htop_2.0.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "htop process monitor"
-HOMEPAGE = "http://htop.sf.net"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
-
-DEPENDS = "ncurses"
-RDEPENDS_${PN} = "ncurses-terminfo"
-
-SRC_URI = " \
-    http://hisham.hm/htop/releases/${PV}/htop-${PV}.tar.gz \
-    file://0001-Use-pkg-config.patch \
-    "
-
-SRC_URI[md5sum] = "7d354d904bad591a931ad57e99fea84a"
-SRC_URI[sha256sum] = "179be9dccb80cee0c5e1a1f58c8f72ce7b2328ede30fb71dcdf336539be2f487"
-
-LDFLAGS_append_libc-uclibc = " -lubacktrace"
-
-do_configure_prepend () {
-    rm -rf ${S}/config.h
-}
-
-inherit autotools
diff --git a/meta-oe/recipes-support/htop/htop_2.1.0.bb b/meta-oe/recipes-support/htop/htop_2.1.0.bb
new file mode 100644
index 000000000..5ff2fcfbf
--- /dev/null
+++ b/meta-oe/recipes-support/htop/htop_2.1.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Interactive process viewer"
+HOMEPAGE = "http://hisham.hm/htop"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
+           file://0001-Use-pkg-config.patch"
+SRC_URt[md5sum] = "f262b66ad6c194782f4d3a80627e84c8"
+SRC_URI[sha256sum] = "3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "proc \
+                   cgroup \
+                   taskstats \
+                   unicode \
+                   linux-affinity \
+                   delayacct"
+PACKAGECONFIG[proc] = "--enable-proc,--disable-proc"
+PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
+PACKAGECONFIG[cgroup] = "--enable-cgroup,--disable-cgroup"
+PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
+PACKAGECONFIG[taskstats] = "--enable-taskstats,--disable-taskstats"
+PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
+PACKAGECONFIG[linux-affinity] = "--enable-linux-affinity,--disable-linux-affinity"
+PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc"
+PACKAGECONFIG[setuid] = "--enable-setuid,--disable-setuid"
+PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
+
+do_configure_prepend () {
+    rm -rf ${S}/config.h
+}
-- 
2.16.1


