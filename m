Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.2537.1608065069495257866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 12:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y3UZ9XVO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id g185so479313wmf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LH0Brobg2nhm+eOrud1qHG3jbHkq88L3tIyfmIeJI88=;
        b=Y3UZ9XVOXUr0PL6pEjJ3AzswiD5A7hobRYVcjTwE7dzZMDKv2Ok8TlWt+LM+ZD0+xr
         +pUJQlgV2u8ctprnRDfJ/oH0B3HsvvNFhZSieDRlE8I3mytrPi3N2OAhFKosI+Da7jB7
         6+cp5DSYLytGSoyC1Tce8fAB/q/vmE5IvSVNtK5eXoDL/uO7ym5u994X3g42/Fwv5bnO
         XQHeJqpTw2ePTyZXbaDkKTcgTvmY5UmjC5c2FA8CZ0PMoUEnRLpuZqMibA4S7VvVyg3E
         Zr2NwpyHBhWncwnwlbxmiQe9fh75YlBiWB01rQFB6tmsdavJKEPNrP1WC1LtBZEDOwJU
         sdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LH0Brobg2nhm+eOrud1qHG3jbHkq88L3tIyfmIeJI88=;
        b=E10cNlHwxHLGtuZalj4ls3GEG7thkmFTfaFk3fhDjOxOTAbYdyY0+NhP6Yun2P83TF
         qKDsiSm4873udc6dQrwsXWW6tbitop0GcyawJl0Wh0kw7QafljxenE6VvMC8QH6OIL3s
         Er9ZWy/O9T83t8FgcKqIwCkmnxFw6JaFlFcz6dlIvA3zABovxcLT8gNtl8am8FRycExT
         WgqQr1hA7Q1CIBQrlpzFsIlwxUE9+FQCdePF4XoY/evcWB970Vg70V9SX9nCMBe9qqP8
         NPj6Yu4nhKNBg2pKjTtJsrR3+R6io9roJi1hNiw2duGYNojNfR6INhtR7WhHmmZy9N6R
         uvgg==
X-Gm-Message-State: AOAM5302llNL6/EFvW1R90fWXIW8hAFwqZxX2DFkCgIXIQAXPweaJxhG
	61Id94IO7NA8XbGyDmGlfZqbjitT2TyTTQ==
X-Google-Smtp-Source: ABdhPJxZ0TjbJeWlFYSWmNTfuCyC/oG4WoUrHjn+JY5i2Ava7PCTmCAN6FYW0UNMgYkTeI0mLffNzw==
X-Received: by 2002:a1c:630b:: with SMTP id x11mr578467wmb.138.1608065067411;
        Tue, 15 Dec 2020 12:44:27 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id i7sm26705038wrv.12.2020.12.15.12.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:44:26 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v3] bitwise: add new recipe
Date: Tue, 15 Dec 2020 22:45:42 +0200
Message-Id: <20201215204542.16903-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

Bitwise is multi base interactive calculator supporting
dynamic base conversion and bit manipulation.
It's a handy tool for low level hackers, kernel developers and
device drivers developers.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v3: Fix compilation error by introducing a patch.
    Keep only sha256sum

 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-extended/bitwise/bitwise_0.41.bb  | 24 +++++++++++++++
 ...build-when-build-dir-is-not-same-as-.patch | 29 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
 create mode 100644 meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2c46d21b7..577f2e788 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -307,6 +307,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TU
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
+     bitwise \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
      brotli \
      byacc \
diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
new file mode 100644
index 000000000..037822781
--- /dev/null
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Bitwise terminal calculator"
+DESCRIPTION = "Bitwise is multi base interactive calculator \
+supporting dynamic base conversion and bit manipulation.\
+It's a handy tool for low level hackers, \
+kernel developers and device drivers developers."
+
+HOMEPAGE = "https://github.com/mellowcandle/bitwise"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz \
+           file://0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch \
+           "
+SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
+
+UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
+
+S = "${WORKDIR}/${BPN}-v${PV}"
+
+DEPENDS = "ncurses readline"
+
+inherit autotools
diff --git a/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch b/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
new file mode 100644
index 000000000..ad3f0bb1f
--- /dev/null
+++ b/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
@@ -0,0 +1,29 @@
+From 2089b514045d2de64a5d9c54e241731e85d77df2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Dec 2020 22:11:59 -0800
+Subject: [PATCH] makefile.am: Fix build when build dir is not same as
+ sourcedir
+
+This ensures right include paths are added to compiler
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index eba85a1..da998ff 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,7 +19,7 @@ if COND_DEBUG
+ MAYBE_DEBUG=-g -O0
+ endif
+ 
+-AM_CFLAGS = $(MAYBE_COVERAGE) $(MAYBE_DEBUG) $(MAYBE_TRACE)
++AM_CFLAGS = $(MAYBE_COVERAGE) $(MAYBE_DEBUG) $(MAYBE_TRACE) -I$(srcdir)/inc
+ 
+ check_PROGRAMS = tests/test-shunting-yard
+ tests_test_shunting_yard_SOURCES = src/shunting-yard.c inc/shunting-yard.h \
+-- 
+2.29.2
+
-- 
2.17.1

