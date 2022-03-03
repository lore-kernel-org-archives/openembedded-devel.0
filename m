Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61170C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 03:32:52 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.7219.1646278370767006780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 19:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2233WnCX004500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 2 Mar 2022 19:32:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Mar 2022 19:32:49 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Mar 2022 19:32:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hstr: add new recipe
Date: Thu, 3 Mar 2022 11:32:48 +0800
Message-ID: <20220303033248.529371-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 03:32:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95724

From: Changqing Li <changqing.li@windriver.com>

hstr is bash and zsh shell history suggest box - easily view, navigate,
search and manage your command history.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...1-Use-OE-specific-checks-for-ncurses.patch | 42 +++++++++++++++++++
 ...configure.ac-Don-t-use-AC_CHECK_FILE.patch | 33 +++++++++++++++
 meta-oe/recipes-support/hstr/hstr_2.5.0.bb    | 18 ++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
 create mode 100644 meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
 create mode 100644 meta-oe/recipes-support/hstr/hstr_2.5.0.bb

diff --git a/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch b/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
new file mode 100644
index 000000000..d7eb558a9
--- /dev/null
+++ b/meta-oe/recipes-support/hstr/files/0001-Use-OE-specific-checks-for-ncurses.patch
@@ -0,0 +1,42 @@
+From f3fb4f12fac75efe0d8f1a923ad5992a7433d0db Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 2 Mar 2022 06:22:15 +0000
+Subject: [PATCH] Use OE-specific checks for ncurses
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/include/hstr.h        | 2 +-
+ src/include/hstr_curses.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/hstr.h b/src/include/hstr.h
+index 5eac881..c47cadb 100644
+--- a/src/include/hstr.h
++++ b/src/include/hstr.h
+@@ -26,7 +26,7 @@
+ #elif defined(__FreeBSD__)
+   #include <ncurses.h>
+ #else
+-  #include <ncursesw/curses.h>
++  #include <curses.h>
+ #endif
+ #include <readline/chardefs.h>
+ #include <signal.h>
+diff --git a/src/include/hstr_curses.h b/src/include/hstr_curses.h
+index 8a50ab9..1f081a8 100644
+--- a/src/include/hstr_curses.h
++++ b/src/include/hstr_curses.h
+@@ -24,7 +24,7 @@
+ #elif defined(__FreeBSD__)
+ #include <ncurses.h>
+ #else
+-#include <ncursesw/curses.h>
++#include <curses.h>
+ #endif
+ 
+ #define color_attr_on(C) if(terminal_has_colors()) { attron(C); }
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch b/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
new file mode 100644
index 000000000..e9b44c4c9
--- /dev/null
+++ b/meta-oe/recipes-support/hstr/files/0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch
@@ -0,0 +1,33 @@
+From d5ad538adb9fcbad8a3b4e46f266b668301cb1c4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 2 Mar 2022 05:36:48 +0000
+Subject: [PATCH] configure.ac: Don't use AC_CHECK_FILE
+
+AC_CHECK_FILE is not suitable for cross-compile, so
+remove it to fix configure error:
+cannot check for file existence when cross compiling
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 775c795..bd99188 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,9 +116,6 @@ AC_TYPE_SIZE_T
+ AC_FUNC_MALLOC
+ AC_CHECK_FUNCS([memset strdup strstr])
+ 
+-# Bash@Ubuntu@Windows
+-AC_CHECK_FILE(/tmp/hstr-ms-wsl,AC_DEFINE(__MS_WSL__), [])
+-
+ # Bash CLI autocomplete
+ AC_ARG_WITH([bash-completion-dir],
+     AS_HELP_STRING([--with-bash-completion-dir[=PATH]],
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/hstr/hstr_2.5.0.bb b/meta-oe/recipes-support/hstr/hstr_2.5.0.bb
new file mode 100644
index 000000000..6f6b123ec
--- /dev/null
+++ b/meta-oe/recipes-support/hstr/hstr_2.5.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "bash and zsh shell history suggest box - easily view, navigate, search and manage your command history."
+HOMEPAGE = "http://dvorka.github.io/hstr/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+DEPENDS = "ncurses readline"
+
+SRC_URI = "https://github.com/dvorka/hstr/releases/download/2.5/hstr-${PV}-tarball.tgz \
+           file://0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch \
+           file://0001-Use-OE-specific-checks-for-ncurses.patch"
+
+S = "${WORKDIR}/${BPN}"
+
+SRC_URI[md5sum] = "eda0a21cf2c39d8597193f2ab2e77af4"
+SRC_URI[sha256sum] = "44bb6d93ef064536218f8ae5464772861bfccfe364a436397d9f770207cd306d"
+
+inherit autotools pkgconfig bash-completion
-- 
2.25.1


