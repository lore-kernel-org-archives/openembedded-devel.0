Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF15D3C542
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:47:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14832.1765370814284408050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWNzjHuL;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so7636290b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370813; x=1765975613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMYXCK3Df4BstZ5FzvLuJ5bQqsTNeTWbMrUqDDbVy7c=;
        b=cWNzjHuLPrcE6QIY5Q738rWa+v0DzimrYqKTTgIWFDEwE5Bb3IuN7CS/ZkSYiM45bO
         qQWWaT9X0aSmgcgk6krm/VnTL+AXmkbrj674mETQiNwVSJdcshv32/M16ET9hDvnfJmD
         +ByUF2KvFcUc2buPu/YLFrDh6dS/GWhB5BH6pGEbYXbsFDWdSTRUhxJTO3vLzJ0K2rax
         wVpDwle4TAOb/PoPMu5VpK6VPWr5EfJ1cg7bMQxTqjtyZUI287KDZd82YLzU0f/aimYX
         WwAsbJcu17nzrv80q9TF6RapBIHh1XLHlizjLZozURdHzzK4zw5MfKCCgFoAxxS3pvQJ
         xM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370813; x=1765975613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EMYXCK3Df4BstZ5FzvLuJ5bQqsTNeTWbMrUqDDbVy7c=;
        b=nOxy0PSt7hnwDgl5WgniaJfDQ5oRmUsewI4BhM2ujszPZM0z1wt0XGrFm62i2wRurF
         roBA9XjdstuS1rehlK26PL42UkplamUTwSkkBdXyuykGuvzpxtfACoMgWtc6GsjcKZ2I
         3dpWOpgJeFATT84f5DgnhxM+tQC0LvmJplIyjFsVjQID48GpAV09sDnMO2Z/nbPsmUKJ
         SdjWXT5uaDRQ4hhmnoYl6t/oEUHUjRvPKvM8O9V9sang9DJm5cYmunkfvBoEXXMqwBS/
         p+Q72uPPTFtmDX/v5gkgIsQpm6FfFX04Oj5K9BSe30AUcaPzxpFkBAXnHcDM67OJpaun
         qrig==
X-Gm-Message-State: AOJu0Yw4B1SrhCkVkSQW22FACJZKq3Vvl2HgaxCft+cQxMHHIl60iJko
	IFSAjTQP8Qy5KlN1+5uykAlw7pTC1/WQurno9k3IuTKuhLRsBF0fKiCjgSSWtw==
X-Gm-Gg: ASbGnctDU/vsKxfsXkd20LdozAeR7rPo+m9xs7+p58nZzOvUQ1GJZHnk/H9jSxqUGfI
	il/BUELR5/pzZ4QupLhGcdjxshOy9nGUTZUwwD6Hj4OHCkSUKEVtm8YE+tzk5QTcwRosyhpNPQo
	yBsiihHn2R4ZxxPpi3YjbXODOcpCxTqDgFFjrajGOWb71ZMzKhndfs3ZRmbBg45uVSfH0NHLbpC
	Jr132QH/JPxGJtV/YNEA5d0OsUblRe0ADWgxl2pPZSYnJkJeJ7KxUspWpMmG7sO6gRe207/AgK2
	lsWRSr77rm8DbpQlpEEAu3TaznuTvlJBGuMdTI7SAsrIrMr0LEVGf05hxZZ0u0hiYvMGslEA/t9
	r4hfYW0ymYg2IcDQTZDizxEcTylMTtfxSS9jRFQnSKTW4iyL8nss/ulS9zRDTQXyrptDN9su9P2
	2XU3+6qHvNkf0NO7ZvHwPDOfQ7LeKdFaDt
X-Google-Smtp-Source: AGHT+IFl2XlNhcokM7+9G5CQc/pSv9+QvhK2g7vVFhfnHQdfbARiO3TDQBTV/7B+ECdt6Mo2UwgrAQ==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e205 with SMTP id adf61e73a8af0-366e34c1a4amr2131773637.67.1765370813410;
        Wed, 10 Dec 2025 04:46:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:46:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 10/43] xrdp: upgrade 0.9.20 -> 0.10.4.1
Date: Wed, 10 Dec 2025 18:14:54 +0530
Message-ID: <20251210124528.10696-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
References: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122514

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fixes for the following vulnerabilities:
CVE-2022-23468, CVE-2022-23477, CVE-2022-23478, CVE-2022-23479,
CVE-2022-23480, CVE-2022-23481, CVE-2022-23482, CVE-2022-23483,
CVE-2022-23484, CVE-2022-23493, CVE-2023-40184, CVE-2023-42822,
CVE-2024-39917

Added a new patch to fix compiling with musl.

Dropped 0001-Fix-the-compile-error.patch: it's an 8 years old patch,
claiming to fix a compile error. I did not see an error when I removed
it (tried glibc and musl, gcc and clang).

Changelogs:
0.10.4.1: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.4.1
0.10.4: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.4
0.10.3: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.3
0.10.2: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.2
0.10.1: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.1
0.10.0: https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 07c05145faa1a6112bde05a1f316b602cedd7029)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xrdp/0001-Fix-the-compile-error.patch     | 37 -------------------
 .../xrdp/xrdp/fix-compiling-with-musl.patch   | 27 ++++++++++++++
 .../xrdp/{xrdp_0.9.20.bb => xrdp_0.10.4.1.bb} | 20 ++++++----
 3 files changed, 39 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.20.bb => xrdp_0.10.4.1.bb} (87%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
deleted file mode 100644
index 1bb84001f3..0000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2fa575c3171688ceb0dc867a52628046b3f60d91 Mon Sep 17 00:00:00 2001
-From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-Date: Tue, 12 Dec 2017 22:36:50 +0800
-Subject: [PATCH] Fix the make error
-
-Fix the compile error:
- *** No rule to make target '../librfxcodec/src/.libs/librfxencode.a', needed by 'xrdp'.  Stop..
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- xrdp/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xrdp/Makefile.am b/xrdp/Makefile.am
-index 71d0f76..f41751b 100644
---- a/xrdp/Makefile.am
-+++ b/xrdp/Makefile.am
-@@ -21,7 +21,7 @@ XRDP_EXTRA_LIBS =
- if XRDP_RFXCODEC
- AM_CPPFLAGS += -DXRDP_RFXCODEC
- AM_CPPFLAGS += -I$(top_srcdir)/librfxcodec/include
--XRDP_EXTRA_LIBS += $(top_builddir)/librfxcodec/src/.libs/librfxencode.a
-+XRDP_EXTRA_LIBS += $(top_builddir)/librfxcodec/src/.libs/librfxencode.la
- endif
- 
- if XRDP_PIXMAN
-@@ -33,7 +33,7 @@ endif
- if XRDP_PAINTER
- AM_CPPFLAGS += -DXRDP_PAINTER
- AM_CPPFLAGS += -I$(top_srcdir)/libpainter/include
--XRDP_EXTRA_LIBS += $(top_builddir)/libpainter/src/.libs/libpainter.a
-+XRDP_EXTRA_LIBS += $(top_builddir)/libpainter/src/.libs/libpainter.la
- endif
- 
- sbin_PROGRAMS = \
diff --git a/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
new file mode 100644
index 0000000000..c716229ab6
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
@@ -0,0 +1,27 @@
+
+sys/signal.h does almost the same in both glibc and musl: it includes "signal.h"
+
+However with musl there is also a warning macro about this, which is interpreted as
+an error during building.
+
+Fixes error:
+
+| In file included from ../../sources/xrdp-0.10.4.1/waitforx/waitforx.c:5:
+| <...>/usr/include/sys/signal.h:1:2: error: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Werror=cpp]
+|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
+|       |  ^~~~~~~
+| cc1: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/3678]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+--- ./waitforx/waitforx.c.orig	2025-11-25 14:38:46.464337398 +0100
++++ ./waitforx/waitforx.c	2025-11-25 14:38:52.007441093 +0100
+@@ -2,7 +2,6 @@
+ #include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <sys/signal.h>
+ #include <unistd.h>
+ 
+ #include "config_ac.h"
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
similarity index 87%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
index a60c125d06..cd45d27fe4 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
@@ -13,20 +13,20 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
-           file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            "
+SRC_URI:append:libc-musl = " file://fix-compiling-with-musl.patch"
 
-SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"
+SRC_URI[sha256sum] = "52eadf3e86c57be0de0b9d5c184b52a7946a070746d3eb04b5089dd6d42f8f5f"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 CFLAGS += " -Wno-deprecated-declarations"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse"
+PACKAGECONFIG ??= "fuse"
+PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse3"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system xrdp"
@@ -36,10 +36,14 @@ USERADD_PARAM:${PN}  = "--system --home /var/run/xrdp -g xrdp \
 FILES:${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service "
 
-FILES:${PN}-dev += "${libdir}/xrdp/libcommon.so \
-                    ${libdir}/xrdp/libxrdp.so \
-                    ${libdir}/xrdp/libscp.so \
-                    ${libdir}/xrdp/libxrdpapi.so "
+FILES:${PN}-dev += " \
+    ${libdir}/xrdp/libcommon.so \
+    ${libdir}/xrdp/libxrdp.so \
+    ${libdir}/xrdp/libxrdpapi.so \
+    ${libdir}/xrdp/libtoml.so \
+    ${libdir}/xrdp/libsesman.so \
+    ${libdir}/xrdp/libipm.so \
+    "
 
 EXTRA_OECONF = "--enable-pam-config=suse --enable-fuse \
                 --enable-pixman --enable-painter --enable-vsock \

