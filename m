Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27016C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:19:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.7741.1642256397678438433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 09F97240002;
	Sat, 15 Jan 2022 14:19:54 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] htop: Update to 3.1.2
Date: Sat, 15 Jan 2022 06:19:04 -0800
Message-Id: <20220115141904.587561-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:19:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94857

Upstream renamed the branch to "main", update SRC_URI.

Refresh pkg-config patch.

Update PACKAGECONFIG options. The linux-affinity option was renamed to
affinity. Add a packageconfig conflict between affinity and hwloc, since
these are mutually exclusive. The setuid option was removed by upstream,
and a capabilities option added. The sensors option switched from
--with/--without to --enable/--disable. Reorder the option to match the
order used in the configure script to make future updates easier.

License-Update: The previous license contained an exception for the
Portable Linux Processor Affinity (PLPA) project. This exception has
been removed, so the project uses an unmodified GPLv2 license. Minor
formatting and whitespace changes were also made to match the license
text as published by the FSF. Commit making change:
https://github.com/htop-dev/htop/commit/088dc5b9a7a5352ee7fdf85f3aff1368958634eb

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../htop/files/0001-Use-pkg-config.patch      | 42 +++++++++----------
 .../htop/{htop_3.0.5.bb => htop_3.1.2.bb}     | 21 +++++-----
 2 files changed, 32 insertions(+), 31 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_3.0.5.bb => htop_3.1.2.bb} (54%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index 93d6d5857..2760162ac 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -1,4 +1,4 @@
-From 14100c6fc2cce7260ca5ace81094aee0ae40dd07 Mon Sep 17 00:00:00 2001
+From 98ed72177c49a8015a443b3ec272fee3fb5a4eb3 Mon Sep 17 00:00:00 2001
 From: Paul Barker <pbarker@toganlabs.com>
 Date: Sun, 5 Nov 2017 22:07:30 +0000
 Subject: [PATCH] htop: Update to v2.0.2
@@ -17,32 +17,32 @@ Upstream-status: Inappropriate
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 115d894..0e0a1eb 100644
+index 0e69096..d20014f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -205,10 +205,10 @@ AS_VAR_POPDEF([CACHEVAR])dnl
- 
- AC_ARG_ENABLE(unicode, [AS_HELP_STRING([--enable-unicode], [enable Unicode support])], ,enable_unicode="yes")
+@@ -322,10 +322,10 @@ AC_ARG_ENABLE([unicode],
+               [],
+               [enable_unicode=yes])
  if test "x$enable_unicode" = xyes; then
--   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
--    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
--     HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw5-config",
--      HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "ncurses5-config",
-+   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
-+    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
-+     HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
-+      HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
+-   HTOP_CHECK_SCRIPT([ncursesw6], [waddwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
+-    HTOP_CHECK_SCRIPT([ncursesw], [waddwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
+-     HTOP_CHECK_SCRIPT([ncursesw], [wadd_wch], [HAVE_LIBNCURSESW], "ncursesw5-config",
+-      HTOP_CHECK_SCRIPT([ncurses], [wadd_wch], [HAVE_LIBNCURSESW], "ncurses5-config",
++   HTOP_CHECK_SCRIPT([ncursesw6], [waddwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
++    HTOP_CHECK_SCRIPT([ncursesw], [waddwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
++     HTOP_CHECK_SCRIPT([ncursesw], [wadd_wch], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
++      HTOP_CHECK_SCRIPT([ncurses], [wadd_wch], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
         HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
          HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
           HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
-@@ -225,8 +225,8 @@ if test "x$enable_unicode" = xyes; then
+@@ -342,8 +342,8 @@ if test "x$enable_unicode" = xyes; then
     # (at this point we already link against a working ncurses library with wide character support)
     AC_SEARCH_LIBS([keypad], [tinfow tinfo])
  else
--   HTOP_CHECK_SCRIPT([ncurses6], [refresh], [HAVE_LIBNCURSES], "ncurses6-config",
--    HTOP_CHECK_SCRIPT([ncurses], [refresh], [HAVE_LIBNCURSES], "ncurses5-config",
-+   HTOP_CHECK_SCRIPT([ncurses6], [refresh], [HAVE_LIBNCURSES], "pkg-config ncurses6",
-+    HTOP_CHECK_SCRIPT([ncurses], [refresh], [HAVE_LIBNCURSES], "pkg-config ncurses5",
-      HTOP_CHECK_LIB([ncurses6],  [refresh], [HAVE_LIBNCURSES],
-       HTOP_CHECK_LIB([ncurses],  [refresh], [HAVE_LIBNCURSES],
-       missing_libraries="$missing_libraries libncurses"
+-   HTOP_CHECK_SCRIPT([ncurses6], [wnoutrefresh], [HAVE_LIBNCURSES], [ncurses6-config],
+-    HTOP_CHECK_SCRIPT([ncurses], [wnoutrefresh], [HAVE_LIBNCURSES], [ncurses5-config],
++   HTOP_CHECK_SCRIPT([ncurses6], [wnoutrefresh], [HAVE_LIBNCURSES], [pkg-config ncurses6],
++    HTOP_CHECK_SCRIPT([ncurses], [wnoutrefresh], [HAVE_LIBNCURSES], [pkg-config ncurses5],
+      HTOP_CHECK_LIB([ncurses6],  [doupdate], [HAVE_LIBNCURSES],
+       HTOP_CHECK_LIB([ncurses],  [doupdate], [HAVE_LIBNCURSES],
+        HTOP_CHECK_LIB([curses],  [doupdate], [HAVE_LIBNCURSES],
diff --git a/meta-oe/recipes-support/htop/htop_3.0.5.bb b/meta-oe/recipes-support/htop/htop_3.1.2.bb
similarity index 54%
rename from meta-oe/recipes-support/htop/htop_3.0.5.bb
rename to meta-oe/recipes-support/htop/htop_3.1.2.bb
index 2772aa577..d8e241ed0 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.5.bb
+++ b/meta-oe/recipes-support/htop/htop_3.1.2.bb
@@ -2,14 +2,14 @@ SUMMARY = "Interactive process viewer"
 HOMEPAGE = "https://htop.dev"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4099d367cd5e59b6d4fc1ee33accb891"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "git://github.com/htop-dev/htop.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
-           "
-SRCREV = "ce6d60e7def146c13d0b8bca4642e7401a0a8995"
+"
+SRCREV = "d73783d6dbec4a8d9d20d744bf2b5e6a7073aa46"
 
 S = "${WORKDIR}/git"
 
@@ -17,18 +17,19 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= " \
     unicode \
-    linux-affinity \
+    affinity \
     delayacct \
 "
+PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
+PACKAGECONFIG[affinity] = "--enable-affinity,--disable-affinity,,,,hwloc"
+PACKAGECONFIG[unwind] = "--enable-unwind,--disable-unwind,libunwind"
+PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc,,,affinity"
 PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
 PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
 PACKAGECONFIG[ancient-vserver] = "--enable-ancient-vserver,--disable-ancient-vserver"
-PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
-PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc"
-PACKAGECONFIG[linux-affinity] = "--enable-linux-affinity,--disable-linux-affinity"
-PACKAGECONFIG[setuid] = "--enable-setuid,--disable-setuid"
+PACKAGECONFIG[capabilities] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
-PACKAGECONFIG[sensors] = "--with-sensors,--without-sensors,lmsensors,lmsensors-libsensors"
+PACKAGECONFIG[sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 
 FILES:${PN} += "${datadir}/icons/hicolor/scalable/apps/htop.svg"
 
-- 
2.34.1


