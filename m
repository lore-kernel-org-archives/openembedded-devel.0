Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20679C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:29:25 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.57662.1671560962476877636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WkcqAM8f;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id gt4so13283739pjb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q76ljRBGd+9xcctyA6JG98hTT0vQCNGYeWoz7a5xxz0=;
        b=WkcqAM8f6+7IBmJZ8aPR+KS6qmcLGlF3LfYayt+wsD5X3ZRXArEbOUxrdbkPcMiZ+M
         CbrpcXrJD8Sj6AkPK7Jrt/g/1278QTimLNa/KkdQ+hsTPOVkYdXkuY4QlwhEnNX9pgu+
         YAgc7UsoKbIjALAW9M6SckJK0SmveyR7KQXM0l6YPBWAC1KDS94xOpAuy2xn1uanKUhS
         0fiqfie7jhUvslwQmDh0bOAW1ORIcrctz2/70QMMp2cHl0hmJyzUp/pqGYjobMwR0APs
         qmV/9Q0BN2aY8ZEicEaXjkXDqpiO6Tu5D2f5n1ICoVdZebem1vvE7G88EOtgIvf5pIk2
         k3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q76ljRBGd+9xcctyA6JG98hTT0vQCNGYeWoz7a5xxz0=;
        b=HxCY+bqIb5JftCfbDnCyyMVLn2Ppt+xNiXzRNW8awcygyEQsaeJ+VJI5dLCN446/zW
         g2U7rJ66kCkObjtKkWd293DFtZxbVtsdy1EJ0IkpKIoepFUAe1cRoG7pL5Uc7jftIXQn
         KGu/o/43feqbVKlLYEYWmLlwuTUqsXDfr7hK3cQ1Hk3U5PwnlZ4tDEig9IyM1svsHYMP
         RNdFCCkpNK3Y5n/Oq6p1sypUiIGMSkOmkXVknHO2wooOj/O1X9tRR1rU0ranacsx9u2I
         soORiLlBB5AHlXRZptMJ2v1E2W5Z8ddYQBKVqCKgc842hM168tL81dJFscm72UXeDWLw
         p/AA==
X-Gm-Message-State: ANoB5pn6MBku92L3DqursQSrbgYBKpUSU/Pj4ucMsdReFW2P9xUho3z0
	4GWp1o2rQUVSBFeknQJKkNEv5JybW2U=
X-Google-Smtp-Source: AA0mqf5yMJggqxdf2aYJqxCJKJuL6eFfw6NkXv+upZ7DjarLf2hKfS62QrS42r891kTbiHoocI/Q4A==
X-Received: by 2002:a17:90b:80f:b0:219:3d3a:6c51 with SMTP id bk15-20020a17090b080f00b002193d3a6c51mr48426184pjb.40.1671560961419;
        Tue, 20 Dec 2022 10:29:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id z3-20020a17090acb0300b002199eaa80e1sm8267266pjt.13.2022.12.20.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:29:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] wxwidgets: Set HAVE_LARGEFILE_SUPPORT
Date: Tue, 20 Dec 2022 10:29:18 -0800
Message-Id: <20221220182919.2420535-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 18:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100163

cmake somehow fails to set it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...VE_LARGEFILE_SUPPORT-to-1-explicitly.patch | 30 +++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.1.bb              |  2 ++
 2 files changed, 32 insertions(+)
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
index ae2995db20..8b302f481f 100644
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
@@ -39,6 +40,7 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
+    -DwxHAS_LARGE_FILES=ON \
 "
 EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 
-- 
2.39.0


