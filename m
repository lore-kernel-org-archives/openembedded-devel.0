Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.11467.1610235811501831837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 15:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from loomas.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C1F5CC0003;
	Sat,  9 Jan 2021 23:43:27 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] htop: Update to 3.0.4
Date: Sat,  9 Jan 2021 15:43:00 -0800
Message-Id: <20210109234300.3421236-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Along with the update, make a few cleanups to the recipe:
 * Refresh patch with devtool.
 * The cgroup and taskstats configure options are no longer provided by
   upstream.
 * Add ancient-vserver configure option. Leave it disabled by default
   since it is rarly used.
 * Reorder PACKAGECONFIG options to match upstream ./configure --help
   output to make future updates easier.
 * Add new sensors PACKAGECONFIG option that adds lmsensors integration.
   htop will dlopen libsensors. Disable by default to avoid pulling in
   excess dependencies.
 * Package new icon.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../htop/files/0001-Use-pkg-config.patch      | 19 +++++++++++++-----
 .../htop/{htop_3.0.1.bb => htop_3.0.4.bb}     | 20 ++++++++++---------
 2 files changed, 25 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_3.0.1.bb => htop_3.0.4.bb} (69%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index fc0d86e33..93d6d5857 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -1,3 +1,8 @@
+From 14100c6fc2cce7260ca5ace81094aee0ae40dd07 Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Sun, 5 Nov 2017 22:07:30 +0000
+Subject: [PATCH] htop: Update to v2.0.2
+
 We need to use pkg-config to find the ncurses library instead of the
 ncurses*-config applications.
 
@@ -7,11 +12,15 @@ Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 Upstream-status: Inappropriate
     (`ncurses*-config` can be used outside of OpenEmbedded)
 
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
 diff --git a/configure.ac b/configure.ac
-index 559dc4d..77aea22 100644
+index 115d894..0e0a1eb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -185,10 +185,10 @@ m4_define([HTOP_CHECK_LIB],
+@@ -205,10 +205,10 @@ AS_VAR_POPDEF([CACHEVAR])dnl
  
  AC_ARG_ENABLE(unicode, [AS_HELP_STRING([--enable-unicode], [enable Unicode support])], ,enable_unicode="yes")
  if test "x$enable_unicode" = xyes; then
@@ -26,9 +35,9 @@ index 559dc4d..77aea22 100644
         HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
          HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
           HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
-@@ -201,8 +201,8 @@ if test "x$enable_unicode" = xyes; then
-          [AC_CHECK_HEADERS([ncurses/curses.h],[:],
-             [AC_CHECK_HEADERS([ncurses.h],[:],[missing_headers="$missing_headers $ac_header"])])])])
+@@ -225,8 +225,8 @@ if test "x$enable_unicode" = xyes; then
+    # (at this point we already link against a working ncurses library with wide character support)
+    AC_SEARCH_LIBS([keypad], [tinfow tinfo])
  else
 -   HTOP_CHECK_SCRIPT([ncurses6], [refresh], [HAVE_LIBNCURSES], "ncurses6-config",
 -    HTOP_CHECK_SCRIPT([ncurses], [refresh], [HAVE_LIBNCURSES], "ncurses5-config",
diff --git a/meta-oe/recipes-support/htop/htop_3.0.1.bb b/meta-oe/recipes-support/htop/htop_3.0.4.bb
similarity index 69%
rename from meta-oe/recipes-support/htop/htop_3.0.1.bb
rename to meta-oe/recipes-support/htop/htop_3.0.4.bb
index d677e36c0..49d53ec98 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.1.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.4.bb
@@ -9,23 +9,25 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git \
            file://0001-Use-pkg-config.patch \
            "
-SRCREV = "dace850fa6e27b5626115b366059258cfe4d60c9"
+SRCREV = "0b989ee38ce37eb4a50265faa11df2bd7ed8e5c3"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "cgroup \
-                   taskstats \
-                   unicode \
-                   linux-affinity \
-                   delayacct"
+PACKAGECONFIG ??= " \
+    unicode \
+    linux-affinity \
+    delayacct \
+"
 PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
-PACKAGECONFIG[cgroup] = "--enable-cgroup,--disable-cgroup"
 PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
-PACKAGECONFIG[taskstats] = "--enable-taskstats,--disable-taskstats"
+PACKAGECONFIG[ancient-vserver] = "--enable-ancient-vserver,--disable-ancient-vserver"
 PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
-PACKAGECONFIG[linux-affinity] = "--enable-linux-affinity,--disable-linux-affinity"
 PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc"
+PACKAGECONFIG[linux-affinity] = "--enable-linux-affinity,--disable-linux-affinity"
 PACKAGECONFIG[setuid] = "--enable-setuid,--disable-setuid"
 PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
+PACKAGECONFIG[sensors] = "--with-sensors,--without-sensors,lmsensors,lmsensors-libsensors"
+
+FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/htop.svg"
-- 
2.26.2

