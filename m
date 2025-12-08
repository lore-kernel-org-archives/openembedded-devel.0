Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA736D3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 11:58:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6581.1765195126896707686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 03:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=agy3fjcd;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79af62d36bso37425566b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 03:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1765195125; x=1765799925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJYHFUKyx0EgVfCCHgk8OhMcxFJHlVxyZUVc47ILet8=;
        b=agy3fjcdn0lhg1sUtNgtygLjLqhlMUEHaRDT6Iuo3TYdEfknKwsS6jKrYkJZKm+5Ta
         1zPb5JKXiiv1mX/trg1gN09pwGdft9wNlkUxBmDwFS0mijOIBlKtPQw0G0ZxrnRHwiNs
         u5Fo1uex6MS5aPo+5CqC2S2gBXIr7FBKmjqsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195125; x=1765799925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJYHFUKyx0EgVfCCHgk8OhMcxFJHlVxyZUVc47ILet8=;
        b=MOWs115hUCjD9irFENR/judo88rBUZl77E6aXkupk9Jm/TSMsBVVzGaB2imIXpwAH9
         6cfJd6g8AOdmP7TxYcUiYM6oTfihFI3erC2S9xCjB9lQEydS4tgWEDUjP6/bE5R4I/px
         Il7LIZNuqn5qRyXTFkmx2yIIjPw7I5G0h8BHuizJa3emfHgKRuqSFbrf2yurmO2WxcOg
         RtUDKqChos9retIzj6HHkb1WNyirAaTRABaYgkDWPfRU60rtk3mnIZmCNu7zZRFWl+5z
         fNttqEBBbG/B5Y7YcbLB8OktGoLB3f3VlgYEfIsdbE6q3ROsUtXn4oiHMP61N6TOwo+T
         w4MQ==
X-Gm-Message-State: AOJu0Yxpq3RU2ZGEil7KoaCgupGimZWxTmZeuw/Ov9DZ+t6FINv2Zl+O
	hF9cv8tPp6/g4d7UF5tl5TRN1nSTdB6Mcs1RpzyoXY37w3wLnmr58C1jFMINzVi02k2VYOilrKz
	SnjEu
X-Gm-Gg: ASbGncuqBO3c1OJsX4siL65lCeYQvM9nL82s5V5GSAyZ3ev6rasa+CMIrgTgM0YNsMU
	a5cKzX0Xq3/j9WZIXuH2L26txuZnOL2tplGLO4ItHwSAacJPL0mR9YfDSKuroE9HjozDvF5/6tv
	VILLcI2CnnR5wnCyYzRevUtxTLtA53FGJQisDGPN+TG3t+OIRBNLNe8F9YhYzadnfqtH5fOSeaN
	flSOwarOz293AqFOmU1kllQ/SJj8ah5kD5d+byzooshAGEr/RhOHQpCOqaptcN8k156k+42I49B
	8D9aeydqHsYXvUPZSRdudT9DUy7CbkZq3HnUTgpdEILv/EHeq37qjV/BPJ4+eLNoHQTB7QoXBix
	xC1xEMFl06WUPexfw1Q5XGiJBK/EsMz9eJWgOGZgfKEZGX1RThdijFInKoHF4QcXZYpBkzCK7jF
	7Io0zwne6kBWzpnkGpdm4wvqxY
X-Google-Smtp-Source: AGHT+IHRHY4fFv/z6Opxcbiy8NrQIhF14Zs4cEdvSk1WLzy2m0kb1Y6qTvO+LRZ0z1p+VopW1Gopyg==
X-Received: by 2002:a17:907:9627:b0:b7a:21d5:15eb with SMTP id a640c23a62f3a-b7a2481838dmr759622366b.52.1765195124759;
        Mon, 08 Dec 2025 03:58:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7a01a3335dsm917308766b.61.2025.12.08.03.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 03:58:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] htop: Upgrade 3.3.0 -> 3.4.1
Date: Mon,  8 Dec 2025 13:58:38 +0200
Message-ID: <20251208115838.3752002-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122377

Upgrade to release 3.4.1:

- Support for PMAPI v3 for PCP
- PCP code cleanups
- Proper checks for strchrnul
- Code cleanup in the NetworkIOMeter
- Improved documentation for the --user option
- Display stuck processes on Darwin
- Handle issues when the monotonic clock runs backwards
- Fix builds using native curses on NetBSD

htop now prioritizes pkg-config over ncurses*-config to
cross-compile. It depends on libnl and a patch is required to fix:

| configure: error: can not find required header files
netlink/attr.h, netlink/handlers.h, netlink/msg.h

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../htop/files/0001-Use-pkg-config.patch      | 47 -----------------
 ...nfigure.ac-Remove-usr-include-libnl3.patch | 50 +++++++++++++++++++
 .../htop/{htop_3.3.0.bb => htop_3.4.1.bb}     |  8 +--
 3 files changed, 55 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
 create mode 100644 meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
 rename meta-oe/recipes-support/htop/{htop_3.3.0.bb => htop_3.4.1.bb} (86%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
deleted file mode 100644
index 3d113efa15..0000000000
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0d49ee6416e389b9a7ba693588c2eaf129306a01 Mon Sep 17 00:00:00 2001
-From: Paul Barker <pbarker@toganlabs.com>
-Date: Sun, 5 Nov 2017 22:07:30 +0000
-Subject: [PATCH] htop: Update to v2.0.2
-
-We need to use pkg-config to find the ncurses library instead of the
-ncurses*-config applications.
-
-Signed-off-by: Paul Barker <pbarker@toganlabs.com>
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
-
-Upstream-Status: Inappropriate [`ncurses*-config` can be used outside of OpenEmbedded]
-
----
- configure.ac | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e4df238a..2a31b201 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -391,10 +391,10 @@ AC_ARG_ENABLE([unicode],
-               [],
-               [enable_unicode=yes])
- if test "x$enable_unicode" = xyes; then
--   HTOP_CHECK_SCRIPT([ncursesw6], [waddwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
--    HTOP_CHECK_SCRIPT([ncursesw], [waddwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
--     HTOP_CHECK_SCRIPT([ncursesw], [wadd_wch], [HAVE_LIBNCURSESW], "ncursesw5-config",
--      HTOP_CHECK_SCRIPT([ncurses], [wadd_wch], [HAVE_LIBNCURSESW], "ncurses5-config",
-+   HTOP_CHECK_SCRIPT([ncursesw6], [waddwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
-+    HTOP_CHECK_SCRIPT([ncursesw], [waddwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
-+     HTOP_CHECK_SCRIPT([ncursesw], [wadd_wch], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
-+      HTOP_CHECK_SCRIPT([ncurses], [wadd_wch], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
-        HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
-         HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
-          HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
-@@ -416,8 +416,8 @@ if test "x$enable_unicode" = xyes; then
-    # (at this point we already link against a working ncurses library with wide character support)
-    AC_SEARCH_LIBS([keypad], [tinfow tinfo])
- else
--   HTOP_CHECK_SCRIPT([ncurses6], [wnoutrefresh], [HAVE_LIBNCURSES], [ncurses6-config],
--    HTOP_CHECK_SCRIPT([ncurses], [wnoutrefresh], [HAVE_LIBNCURSES], [ncurses5-config],
-+   HTOP_CHECK_SCRIPT([ncurses6], [wnoutrefresh], [HAVE_LIBNCURSES], [pkg-config ncurses6],
-+    HTOP_CHECK_SCRIPT([ncurses], [wnoutrefresh], [HAVE_LIBNCURSES], [pkg-config ncurses5],
-      HTOP_CHECK_LIB([ncurses6],  [doupdate], [HAVE_LIBNCURSES],
-       HTOP_CHECK_LIB([ncurses],  [doupdate], [HAVE_LIBNCURSES],
-        HTOP_CHECK_LIB([curses],  [doupdate], [HAVE_LIBNCURSES],
diff --git a/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch b/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
new file mode 100644
index 0000000000..f00f3ac4db
--- /dev/null
+++ b/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
@@ -0,0 +1,50 @@
+From 87d66b3b60176197e785670214b0bbc5bedd6552 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 8 Dec 2025 11:06:01 +0000
+Subject: [PATCH] configure.ac: Remove /usr/include/libnl3
+
+Fixes:
+
+| configure: error: can not find required header files
+netlink/attr.h, netlink/handlers.h, netlink/msg.h
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9f2f46b3..f3906692 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -980,14 +980,14 @@ case "$enable_delayacct" in
+          enable_delayacct=no
+       else
+          old_CFLAGS="$CFLAGS"
+-         CFLAGS="$CFLAGS -I/usr/include/libnl3"
++         CFLAGS="$CFLAGS"
+          AC_CHECK_HEADERS([netlink/attr.h netlink/handlers.h netlink/msg.h], [enable_delayacct=yes], [enable_delayacct=no])
+          CFLAGS="$old_CFLAGS"
+       fi
+       ;;
+    yes)
+       old_CFLAGS="$CFLAGS"
+-      CFLAGS="$CFLAGS -I/usr/include/libnl3"
++      CFLAGS="$CFLAGS"
+       AC_CHECK_HEADERS([netlink/attr.h netlink/handlers.h netlink/msg.h], [], [AC_MSG_ERROR([can not find required header files netlink/attr.h, netlink/handlers.h, netlink/msg.h])])
+       CFLAGS="$old_CFLAGS"
+       ;;
+@@ -997,7 +997,7 @@ case "$enable_delayacct" in
+ esac
+ if test "$enable_delayacct" = yes; then
+   AC_DEFINE([HAVE_DELAYACCT], [1], [Define if delay accounting support should be enabled.])
+-  AM_CFLAGS="$AM_CFLAGS -I/usr/include/libnl3"
++  AM_CFLAGS="$AM_CFLAGS"
+ fi
+ AM_CONDITIONAL([HAVE_DELAYACCT], [test "$enable_delayacct" = yes])
+ 
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-support/htop/htop_3.3.0.bb b/meta-oe/recipes-support/htop/htop_3.4.1.bb
similarity index 86%
rename from meta-oe/recipes-support/htop/htop_3.3.0.bb
rename to meta-oe/recipes-support/htop/htop_3.4.1.bb
index efb89bf3ae..e3f8a7fdb4 100644
--- a/meta-oe/recipes-support/htop/htop_3.3.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.4.1.bb
@@ -4,16 +4,18 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "ncurses"
+DEPENDS = "ncurses libnl"
 
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
-           file://0001-Use-pkg-config.patch \
+           file://0001-configure.ac-Remove-usr-include-libnl3.patch \
 "
-SRCREV = "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
+SRCREV = "348c0a6bf4f33571835a0b6a1a0f5deb15132128"
 
 
 inherit autotools pkgconfig
 
+CFLAGS += " -I${STAGING_INCDIR}/libnl3"
+
 PACKAGECONFIG ??= " \
     unicode \
     affinity \
-- 
2.47.3


