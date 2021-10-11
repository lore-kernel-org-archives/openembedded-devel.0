Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAB1C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.2786.1633977725691199110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MqLVdBpW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id e3so25523647wrc.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EK6oJZr2yUPiHPkvfr8FUKuRFoW57GWimaIZQG3dXmk=;
        b=MqLVdBpWYyuIh4QYu3HJ6GPZmG3JQqlTLGCMjGayPt+BVzqU2hrzzfXzx0xuCLmail
         zVVg6U20YiBACUPEOrZhzDU3knI9FV8BggtrxqmjWxRAAzRIX7oSjVSySMrqcrIkH8ai
         FcIGAiVpCZlK9igvCuuzIJghA9W3ir3ydnJd2VnoCUsgE/aLFfYrs/vDoG+GpYQyCDG8
         o5ScwKcHwfkHBSOFUwwlhNHZhdIoDjFWhV6/2dSQQwtbBV/mdUZ//Sy0prLTzgvszdzi
         m1DpWV0Z4vi+fsrwzHKWNBTYE8jJyiHgOAKpU4OGNLDRbrTlLpt4cLPkaHZbaurCHz+y
         l4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EK6oJZr2yUPiHPkvfr8FUKuRFoW57GWimaIZQG3dXmk=;
        b=k5Vt0UWi91+xl/mEsbjFKoKTipsYTfRF0vqjcYmvhFc1OSs9oO354G1/o9b6bZt2zr
         gF1EupiceuwFWC0RGOsDw5eVwbuTk2p+m65Hza4l3bEFdvlLN81I7SzbB2Xbt1yRe3XP
         xy3LJPjzHwvZstfCkkgxDiplDymOrxCvagctCZ2OD0Lq3BSppVWQNDC5c8N6FlsD+Kp+
         F4dss9QBttL54bEIIIIvBKPGACE+PgfI2IaxYTaRP5cDmgYNhP6Hw5vxh4HViC9lh8gi
         bvyZ/DDPUeqNNNtmaLcJuVMkl/Us/oCSSqFdqkgrrGXUVk5ekgYN+jPn5RfVmeQZElgk
         seKg==
X-Gm-Message-State: AOAM5320elTTfJv6CQR0DASguyWLepvcZnTgLB3qx2EaF13/sQE+MKrW
	cmY8ThwnMWhkWEUi7WoJS2VgG+q3tEnA9w==
X-Google-Smtp-Source: 
 ABdhPJxsiipytp2SU0qH8DlvCFHJyvPxXGL++f1MRmmqJktOnSZQT88Uzxcwl4vUIC8O3XTDVIasfw==
X-Received: by 2002:a7b:cf07:: with SMTP id l7mr746032wmg.10.1633977724346;
        Mon, 11 Oct 2021 11:42:04 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/24] python3-m2crypto: address build failure with openssl
 3.x
Date: Mon, 11 Oct 2021 20:41:40 +0200
Message-Id: <20211011184140.653609-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93238

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...p.py-address-openssl-3.x-build-issue.patch | 28 +++++++++++++++++++
 .../python/python3-m2crypto_0.38.0.bb         |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch
new file mode 100644
index 000000000..c67e50803
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch
@@ -0,0 +1,28 @@
+From 0d824e5c2ab13e761ffaeabdccf9513d5b8f280d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 8 Oct 2021 11:18:35 +0200
+Subject: [PATCH] setup.py: address openssl 3.x build issue
+
+swig throws:
+| /home/alex/development/poky/build-metaoe/tmp/work/x86_64-linux/python3-m2crypto-native/0.38.0-r0/recipe-sysroot-native/usr/include/openssl/macros.h:155: Error: CPP #error ""OPENSSL_API_COMPAT expresses an impossible API compatibility level"". Use the -cpperraswarn option to continue swig processing.
+
+I'm not sure why; upstream should take a look.
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index 2c65404..74704bc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -192,6 +192,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+ 
+         self.swig_opts.append('-includeall')
+         self.swig_opts.append('-modern')
++        self.swig_opts.append('-cpperraswarn')
+         self.swig_opts.append('-builtin')
+ 
+         # These two lines are a workaround for
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index e1ee99bae..51a0dd676 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-m2crypto:"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-            file://cross-compile-platform.patch \
-            file://avoid-host-contamination.patch \
+           file://cross-compile-platform.patch \
+           file://avoid-host-contamination.patch \
+           file://0001-setup.py-address-openssl-3.x-build-issue.patch \
            "
 SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
 
-- 
2.20.1


