Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74454C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.2742.1633977722743433021
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Marohbek;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e12so59141816wra.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrDBTtlW9bGRqsSlg5rUq2R0ub23vCAqUIQjt1xn2E4=;
        b=MarohbekMs9iGfGQxMOCx/KPhdAxPT5KjUhJXNz5IEbRyLUy46zfyqcQhJgqJxuJDz
         PqhQaHyFxxw/i7Rz6l0DI8Z6b8uMydlgddCcwSgGgu3nNMKcOkiSmjP6grPYU1FcL9o3
         +oRJSaL5FpgQpv5uOzjmnlLCV8N02t2MauYesILt59X5hhRM6WQedQKH1ssXJg+WDaaa
         0gtyZ7F95Og/M2jVoJYQw99i2oS8f343bWQR1Fcq8a/1A+GxqO9YD0Z2Cg3ixZcbZgiN
         +j9LwJ8Vq9F1f32fnPTtXPoamK7ijwxp8O/+SKloUQx6EW2VaJrkGcKEtriU025uLItR
         bi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrDBTtlW9bGRqsSlg5rUq2R0ub23vCAqUIQjt1xn2E4=;
        b=zH9eLrgaf8VZTJtRdZkzFt+HTfknymMwNTTQiMUXaiPfZX0JCANQhQoK6prJFwj1n4
         LcaFAfGnfJNzOgDyZTAG2kPD1KtQ16D9u9T7rpuVrS/pjjBAdyQApEACybETo+mhQB5F
         QIWZzM7BYiv11Dv6RB9EY297fuJWNuEzClGdFS73cjQkeRBivcoMwCZLWlj9f23VMpOR
         NudABmv+n1fLIDhj/q70aFgsROjoney9/qnLzq9dlmAydXgXdDK3TqOsEia07q26BYu9
         V7lqMtt/mqkyKgaTWGQ0H4h+Qt3anqbkuUm+lBHoDLPY96taag04Tsdn/W1nKNtcIcOh
         01tw==
X-Gm-Message-State: AOAM530Tva/k8fmFiwIMcHXaN3b1wsHHLVaUm2KJMjTqXBXB/08RWTxP
	VkLPD3caKsBN66Q6mw89ADua0sgq4DLRjQ==
X-Google-Smtp-Source: 
 ABdhPJyTddv1CyXB02soW34wuGoKQqGzNMXleNv0tt+YP7rY6GstXdkyOTV8AfW/wcZ8d3mpZACJkg==
X-Received: by 2002:adf:a2d8:: with SMTP id t24mr25745805wra.91.1633977721343;
        Mon, 11 Oct 2021 11:42:01 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/24] surf: add a webkit 2.34 compatibility patch
Date: Mon, 11 Oct 2021 20:41:36 +0200
Message-Id: <20211011184140.653609-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93234

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ake-compatible-with-webkitgtk-2.34.0.patch | 32 +++++++++++++++++++
 meta-oe/recipes-graphics/surf/surf_2.1.bb     |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch

diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
new file mode 100644
index 000000000..2fb44eb0e
--- /dev/null
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
@@ -0,0 +1,32 @@
+From 0cd38e6dbcaff7eef39fd46a60ff8a47e5f488c4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 23:08:48 +0200
+Subject: [PATCH] config.ml: make compatible with webkitgtk 2.34.0
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ config.mk | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index 032bf9f..850afbf 100644
+--- a/config.mk
++++ b/config.mk
+@@ -12,10 +12,10 @@ LIBDIR = $(LIBPREFIX)/surf
+ X11INC = `pkg-config --cflags x11`
+ X11LIB = `pkg-config --libs x11`
+ 
+-GTKINC = `pkg-config --cflags gtk+-3.0 gcr-3 webkit2gtk-4.0`
+-GTKLIB = `pkg-config --libs gtk+-3.0 gcr-3 webkit2gtk-4.0`
+-WEBEXTINC = `pkg-config --cflags webkit2gtk-4.0 webkit2gtk-web-extension-4.0 gio-2.0`
+-WEBEXTLIBS = `pkg-config --libs webkit2gtk-4.0 webkit2gtk-web-extension-4.0 gio-2.0`
++GTKINC = `pkg-config --cflags gtk+-3.0 gcr-3 webkit2gtk-4.1`
++GTKLIB = `pkg-config --libs gtk+-3.0 gcr-3 webkit2gtk-4.1`
++WEBEXTINC = `pkg-config --cflags webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0`
++WEBEXTLIBS = `pkg-config --libs webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0`
+ 
+ # includes and libs
+ INCS = $(X11INC) $(GTKINC)
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 307ee9b98..710ed9bce 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -11,7 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
            file://0001-config.mk-Fix-compiler-and-linker.patch \
-"
+           file://0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch \
+           "
 SRCREV = "bcd7d74e613fb8af11b40c351f0a6c1a771b2d2b"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


