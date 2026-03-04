Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E122CEFCE4A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 20:39:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28367.1772656788664701570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 12:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMZpmgnA;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso60899255e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772656787; x=1773261587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5yMP4fY1KFglsFSRsN4ECT73r3gVthNAqUn8xyI9Q8=;
        b=OMZpmgnA+cGaPL9pG4ttFQfxfONZ8TVMtHo50eX/LjjrlZwGResjR0huGWUs4lGnV3
         I12EF/jYp5+9sPmHu9t2dGaT4RyZ7RdWrwrt7CW/RTjcprvQrleFEmK5vlhN8+W74lil
         RQbi8xYcYUHrSPZ4mrJZ7badt9OEbVfUgHaFBBq3gEigBUMpdDdeuqZ8urCxc68ZVrjg
         cGS5jqUpygQnB9iSqjIaH3OJY8sz9I/JpyeMXIiOT4QEJflwzRH72NjJEXKZZ4utTx54
         12jRRI2n3Hr0iv5vA93+SuH7crkybH7vZ5QZ4TBhPLkj1Jz+eT8ZqtM7ABSQk7OlTb/I
         dZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772656787; x=1773261587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5yMP4fY1KFglsFSRsN4ECT73r3gVthNAqUn8xyI9Q8=;
        b=CCzO6CY7cHa+B9wza2C4a/tukhwnnN4klapeaDT1t6ojRlsqxGHWu+QqW1lPa2w1Jl
         RL34XFBhApx+7R0/uHYAlxQs6txDoDWtIP9Ih1AHn4AXwocdc5if0l4in6gYFtlI95Ad
         Y1MFY9yeFo412CI65HeFL3Pe43HJoKhzIsznH2r5tK79muppDijLDyZRkhz1GXOetBy2
         A+CIOuz/eNBo2xnnypkzWjcO3wgIRGIsEfORzXwaMeXMylw+pHR1cLi87R1+gkIhJCb5
         Ry9rmtY3fz2ew4eH07WKIw70Oew+XY7BTDzH99oout1ZsOSgJATQ1oC/65KobZ1G3rmh
         F0Kw==
X-Gm-Message-State: AOJu0YyY5Jta6h4kfFzht+//jfFoTQTTe9xbjPiwKcypRgbzyiPFTYXe
	IQhe7bzbMnVJ739mmc22cog0wUXuUdcxKOl7B/5pR/4Aq1UndxtiEBLmU/P03A==
X-Gm-Gg: ATEYQzz0lrG32iDvc65hkmXTOpZpxnniFtFlQfeO73gv4BkKgzjy837+vv0UvspEAnG
	HUmGzdTJURWLLQ2/JRyP+Dn0UTJQST1RBk8Uwb7mLU3xUZ8knoGHJhiBqajC1BmDU+DUQZCjq4z
	SJ5X/y6WstHbqy/VAYtYyuYtItpkhWHwWYbJkRbZ144cFefqZluLijnQPbUs7fUG+u1Ok00hf1F
	xVEFEA89ZvOIJlnXChRTTCD+8DmT/pFt8XxnKDLdk6V+u+fuxNjk7yVqnwYDmkjDFyOcUgneDM5
	+O9uih14JkY9xZn9QwX3tUADx0z6tmjGhB9wfAZroiVVgAlh4I6KmfYm1O15yRkH57OSMZlMK+/
	i3oPatBf4ghdhpFjzCguzR4SBkndC/hD5zY0GK/cgPPVz8Mo5VCzr4k8o5sjwKwc3o6t9EcZVhb
	TEHrMfL6RgwJ/A9DvoY700
X-Received: by 2002:a05:600c:1e0d:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-485198c81e4mr54550035e9.33.1772656786936;
        Wed, 04 Mar 2026 12:39:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187c81adsm75882425e9.6.2026.03.04.12.39.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 12:39:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 2/2] gimp: patch CVE-2025-15059
Date: Wed,  4 Mar 2026 21:39:44 +0100
Message-ID: <20260304203944.2551023-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304203944.2551023-1-skandigraun@gmail.com>
References: <20260304203944.2551023-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 20:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124858

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15059

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-15059.patch            | 33 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patch
new file mode 100644
index 0000000000..f6a098e78d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patch
@@ -0,0 +1,33 @@
+From 5c9b71cf1ba8806ace50ab20e074cf850c7c02c4 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Sat, 20 Dec 2025 10:10:48 -0500
+Subject: [PATCH] plug-ins: fix #15284 ZDI-CAN-28232 vulnerability in file-psp
+
+We were not checking whether channel types were valid for grayscale
+images. Using a blue color channel caused an invalid computation of
+the offset which could cause us to access an invalid memory location.
+
+Now we separate RGB from non-RGB images when checking which channels
+are valid, and if not return with an error.
+
+CVE: CVE-2025-15059
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/03575ac8cbb0ef3103b0a15d6598475088dcc15e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-psp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/plug-ins/common/file-psp.c b/plug-ins/common/file-psp.c
+index 6a6b93d..bcad357 100644
+--- a/plug-ins/common/file-psp.c
++++ b/plug-ins/common/file-psp.c
+@@ -2020,7 +2020,8 @@ read_layer_block (FILE      *f,
+                 }
+               else
+                 {
+-                  if (channel_type > PSP_CHANNEL_BLUE)
++                  if ((ia->base_type == GIMP_RGB && channel_type > PSP_CHANNEL_BLUE) ||
++                      (ia->base_type != GIMP_RGB && channel_type >= PSP_CHANNEL_RED))
+                     {
+                       g_set_error (error, G_FILE_ERROR, G_FILE_ERROR_FAILED,
+                                   _("Invalid channel type %d in channel information chunk"),
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index dd3a1e3e1b..95a6dfd7c8 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -50,7 +50,8 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-14422.patch \
            file://CVE-2025-14425.patch \
            file://CVE-2025-5473.patch \
-"
+           file://CVE-2025-15059.patch \
+           "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
 EXTRA_OECONF = "--disable-python \

