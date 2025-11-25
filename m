Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14001D0EE0E
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 16:55:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2047.1764089731916613837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 08:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNp/e6r9;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3367683f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764089730; x=1764694530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmURDtPMLBKH+kJikzh1iivcVhPH9dWI0aERPUiEcA4=;
        b=KNp/e6r9JVEUM8FN4VGMi9kDZvExYK5BAXyW6UNFzxEJlAWZHqZALhTcMCDNjP9OON
         bzQmgn3o1sOEdFkIdAszPSgjjtmjYCmaKMNaFuYEZYpTVBrUV8Rofp272CR50vGKk9ZD
         xBYjkken4i5N+6lQOsYZUosoQM9b2LA95rR7k1sVMRDa5z3TPER6BHqTYVpzRVHuKDUR
         5Bm3lgJmlhi7Kp8hM0XSKNE2gghTKRZOpX6AcNAs9TyCwnYSFhiD+q/ywkDgp3qIKkki
         lH/Ilyv879D3YcKhz/DyK4r8aaleLCy+0R1vCJd/QJcBz40PjjoWhgUWTD69sgTcBqEK
         b2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089730; x=1764694530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmURDtPMLBKH+kJikzh1iivcVhPH9dWI0aERPUiEcA4=;
        b=BRXHlT4GrLnqpPtvEqPmA/nTFQIL0E7qXDdI8Mu2cNieRsFy6Q7fnsaaS7IWxJy5fk
         Ok4RMjI1KpHVUQLv/MZEPlPuVup6jwZHh1DWIMLaLcyk7+aket5JqJnqVblqHwL8RW30
         PESw0G+9g7FQ6CJ5gkx3C4sGqBgakbg+QHcYILGEj2tcmUyDgoqmgLygvbBSQV7jLyFT
         jnDlgX3hlqydxrWldmmRROHb41pZCXZRrKU45WmMgZjZszQzOOZXFgjxqvf3mmPCf9o6
         SkVI5Q0uD5CvaTvNmnAr3QbDzzdahn5W3pSg2rAFKbN7F60XZhD3Pq7idSDk8a/v+RD7
         GXVw==
X-Gm-Message-State: AOJu0YxfZN3gHFNZICIIEIxGhOHnvQWbX5+ExS18sQgwXpYiyeL+mUNy
	7R4dTQ4jvQhC6xCd+kXHxL11h8YG8vYwu8kt6Vzp/I9UPDClUpP1sb41xi+9iHv5
X-Gm-Gg: ASbGncsS0BzTDNp42zdCs1W97U9uMU0suJCWTvs5J6ORpRs05HGid1SPKOY+/xvLG+x
	iz6LAIP1mTFQM2j/I98ZMLK1HFM0crTInGcUudtLpaFsIyP4t5u34zggniX6Tv31UQaydvt2UUy
	LBsOcQXzHnachK/EWrffwvLvXc9pC4EKzv8xQw3nHB63jgQm+UP59K1zUmvnF5JcYHp4lLSWV7Y
	vyvR6Z0KMXXQ60e1Dhw/NVIcx36Nxk/sijdk1l+azn9lm10CGzk4/ROhp/ZHu5MboNgza1ZBKh4
	3+ZM+2tmks2eftUvB5BVdl6QjUF4Vg9k/gERY7Ux6lnuQNOtmlyzJkdz36l1U546kmf5WkjT+gm
	amB4DfHYhOTLOBIe6aL8zspMTjn5gm2z8yUa4ubjRFIqGTsKXzqJbNbliLWZPiu3NPo0YPhyPUI
	OOCORm7XB2
X-Google-Smtp-Source: AGHT+IGFidweJ62ON7sFUMDpNqoWlS59dwUCtYuThMduC8odlrptUqm8reQaQUAOxgCnfIGWPA9TUA==
X-Received: by 2002:a5d:5f83:0:b0:42b:411b:e476 with SMTP id ffacd0b85a97d-42cc1ac9c8cmr17517169f8f.9.1764089730059;
        Tue, 25 Nov 2025 08:55:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa7affsm35497613f8f.23.2025.11.25.08.55.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 08:55:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xrdp: upgrade 0.9.20 -> 0.10.4.1
Date: Tue, 25 Nov 2025 17:55:28 +0100
Message-ID: <20251125165528.1991859-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 16:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122058

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

