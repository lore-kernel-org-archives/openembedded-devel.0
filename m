Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7D8C4332F
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:53 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.149945.1672105064035495636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMH3VsCU;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so11934366pjh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQwomKZ2uBknIj8MNR5u+Z1JqgsmcJjN1OY8SGo+pR8=;
        b=VMH3VsCUgmqs1tz5X2iPEyB+pjzneHjGtqfQ4SEF34AcnLxOD+4ZF9V340LBFLKLcs
         M6Qq6RB+qfxmBqYoD2SCBBKiGX9Jz5CjgaYTZky35Liz4/DbxyOTepypDgUwc+G7t/wS
         gk/8FLo5bBwQLqBqWX3IH+M7mSrtXxYyFjsjz9YMvkFfTycg4m9H46OipBtlR9/f/D3G
         TmR3rBvqamHP2SJLy7tk/IyPmTwnmGg/JF82KoDfvZaDC83ftnvuuv8eKgUFCvu9im+R
         14vH4Kb4LQKHwCnbJK0IsTRiaEE4yHAyu5v6CPcoKTubrOuZGFUoDD/iMON2VPrRCqwj
         MGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQwomKZ2uBknIj8MNR5u+Z1JqgsmcJjN1OY8SGo+pR8=;
        b=Uet8ISAOuX7qwEfJ47pHxg1n8oT701cbYUU7Ecj6P7ne8o1u+mml0+TQ5zKtXVXmJH
         uymukvGNdnFoEB2KQDpWA5bxRILaQlDE4OMqaT1c/bP0gzxVfV77h8MGSax0K6L3RMz4
         2KcUMWSNq5/Iv0ArQMT8vjurK0KiY+TEnba++bnYY7mJBvlzVdrRAirro1IES/kmMaDD
         F72oJwR/zvDb+kJde9ArRuI+M3Lwr3gHY2jUFbuUg5Oksx2rsxhCT1vN9+AaJ6BQYMLr
         EqdfU0Qx2710IBkKStgJzBWga05s0Rq3o4d5h6RlXDUFlJR9WU1NbzCKkVffv8Yp/ZsQ
         KH/w==
X-Gm-Message-State: AFqh2krrvjfW9bVC+domwVdng5zSzLe/GN6q6TcUvs+87g2Q8y94MILT
	j7LeUe4Gw6zik/gUlPlHAUKHkTt4jvU=
X-Google-Smtp-Source: AMrXdXsmDxdZq8cM2z91ONJSZpYgN/94TJ2whGPlLSHP6p4l1UeY2DLP5bLesxNRzsFnrV1I8rlX3w==
X-Received: by 2002:a17:902:ed44:b0:18f:f3e4:3912 with SMTP id y4-20020a170902ed4400b0018ff3e43912mr22377883plb.34.1672105063158;
        Mon, 26 Dec 2022 17:37:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 3/6] wxwidgets: Set HAVE_LARGEFILE_SUPPORT
Date: Mon, 26 Dec 2022 17:37:35 -0800
Message-Id: <20221227013738.3840802-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227013738.3840802-1-raj.khem@gmail.com>
References: <20221227013738.3840802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100251

cmake somehow fails to set it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...VE_LARGEFILE_SUPPORT-to-1-explicitly.patch | 30 +++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.1.bb              |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
new file mode 100644
index 0000000000..5160f2e1fe
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
@@ -0,0 +1,30 @@
+From e108aff9d6dae613f486c1b1681f4a3cdf17b845 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 19 Dec 2022 15:07:55 -0800
+Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explicitly
+
+nothing sets this to 0, but for some reason it gets undef'd
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/cmake/setup.h.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/build/cmake/setup.h.in b/build/cmake/setup.h.in
+index bce33a73f3..22afb4cfa0 100644
+--- a/build/cmake/setup.h.in
++++ b/build/cmake/setup.h.in
+@@ -869,8 +869,7 @@
+ /*
+  * Define if large (64 bit file offsets) files are supported.
+  */
+-#cmakedefine HAVE_LARGEFILE_SUPPORT 1
+-
++#define HAVE_LARGEFILE_SUPPORT 1
+ /*
+  * Use OpenGL
+  */
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index ae2995db20..39b6a2bc7c 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://wx-config-fix-libdir-for-multilib.patch \
            file://0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch \
            file://musl-locale-l.patch \
+           file://0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
 SRCREV= "97e99707c5d2271a70cb686720b48dbf34ced496"
 S = "${WORKDIR}/git"
@@ -76,6 +77,9 @@ PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
 PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
 PACKAGECONFIG[curl] = "-DwxUSE_WEBREQUEST_CURL=ON,-DwxUSE_WEBREQUEST_CURL=OFF,curl"
 
+# Support LFS unconditionally
+CXXFLAGS += "-D_FILE_OFFSET_BITS=64"
+
 do_compile:append() {
     # if not at re-compile
     if [ -L ${B}/wx-config ]; then
-- 
2.39.0


