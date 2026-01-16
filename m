Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8857BD4A612
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1311.1768549094778143387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lm7j1Rhu;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso11247285e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549093; x=1769153893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xf0uOQ0tEKA3siTKy2dHTwo7R+0ruUrOZEMdQ39rcDA=;
        b=lm7j1RhuDdRJB+eU5q4BzH1yul6pbiCiGBKkbGLtzD1ZE3eleDm6zlW2//+z/oT2nj
         YbA32LjrdGqkCl0JiuXs9K0aMnLZwJiuTE5z/ix/LwAiwEbS7+JyiJqo5weu79ci/XxT
         zBNhqLDQ9gSfuyZVceUR4BlWlrLhNXaFt9V+U9skbZ2zio+2xcToIviUe0IYinx2vbDX
         3g4u3HeHpgaj16uiO5/8AfYxqDivArKcGsGGnQZZoVHFHvzuRWudqRb6uw/BRcLCNiTY
         VcvDKEjgK9L1OBdQ1M2X4IVzycGv6n+/1Ze2ieaP96voQ0sRNyp00CUSKc/8BrP3bLKt
         3haQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549093; x=1769153893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xf0uOQ0tEKA3siTKy2dHTwo7R+0ruUrOZEMdQ39rcDA=;
        b=lQD/24Ax48h3IXKKzjS/21DjwoR1hV5b1Y6rv7BzaS7QIi5eZdJVpfdR1tSYcXz7rk
         ogogCzGZlKYU28cCequXDuNHlSor5sDJEYGowOoYd7D/1mEJ8MzqdSi75SCE1SdXM+FH
         FGDMWc6mgrN5NL77LfSA1l1t98IWFSEPYO3k8265OzGzrhZZfUMSV1sujzGeK55qdAFz
         fkxIYazN+sW7lcN4BKBT0Zmw4DDWYntc2sM86UiBV4n6PaxMha8kkiI8AVftzrOIteu0
         WJAqM1ghBblGIGiRzOfSByGPWZgqoUB7uUdxBHy2FxHFFaHQNDw/IJV0rdn6dpnH6xRm
         TrVA==
X-Gm-Message-State: AOJu0Yxn/CMW+cMSwwbfXwu1TbRpQ1PreHJBllBuglSou5dPXeOgBe5V
	KlwnlwWoWW06ynZmT4Iw4Lo4sIjmRFtek3/81fRg59L51A3TvTQxonppM3hF+w==
X-Gm-Gg: AY/fxX5WF1hTkwxSkQQ43Wk8JdaksCz1/e95+L/NF5a74+4YtqZQqJ6vokP1vwbx02e
	RS1IRn99iL/UfrdM5y0q2HsSPDlDjOk40eUUwT+1eBzEe6nTdSZlDIz88iSEURo4ZRN8btx6zIt
	OtKXmdlSv5oLUBHHGZswbiawHQlGux1TMgo1ijU40xUwZ/1KsLX6zpGMV3+OjJM4DOOn/Gtoq/n
	aYzq1utHn/grf4PntBrfpFD6Qimoyi31VJPKTVomjbi+20NZZRgMFkbDigxsNQO8XwxaUz9gYu2
	sOci7JYd/6s5tA5DmD+AFO3uudBrZlw5VR/Cico+6GNMGcjmKrlN0H1JCUI7cpnVW6LiGOCyBrc
	KVtZ0IJb58ByJR+ABabV2rIYUhJOEZ0YgdN9aFK/C9OHpZM6zVV1p7yIVudqamGzwE3psF9ORgz
	zTsLiPU5bU
X-Received: by 2002:a05:600c:4e93:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4801e30a606mr26846935e9.1.1768549092967;
        Thu, 15 Jan 2026 23:38:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 1/6] fluidsynth: patch CVE-2025-56225
Date: Fri, 16 Jan 2026 08:38:05 +0100
Message-ID: <20260116073810.3290097-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123521

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-56225

Pick the PR content referenced by the NVD advisoy.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fluidsynth/CVE-2025-56225.patch           | 25 +++++++++++++++++++
 .../fluidsynth/fluidsynth_git.bb              | 10 ++++----
 2 files changed, 30 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
new file mode 100644
index 0000000000..a1de14ca19
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
@@ -0,0 +1,25 @@
+From 18ab31c1dad215188edf2bedc78be98a32492ec9 Mon Sep 17 00:00:00 2001
+From: "Tom M." <tom.mbrt@googlemail.com>
+Date: Mon, 14 Jul 2025 18:13:38 +0200
+Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
+
+CVE: CVE-2025-56225
+Upstream-Status: Backport [https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/synth/fluid_synth_monopoly.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/synth/fluid_synth_monopoly.c b/src/synth/fluid_synth_monopoly.c
+index d1de1319..6e6e2a90 100644
+--- a/src/synth/fluid_synth_monopoly.c
++++ b/src/synth/fluid_synth_monopoly.c
+@@ -410,7 +410,7 @@ int fluid_synth_noteoff_mono_LOCAL(fluid_synth_t *synth, int chan, int key)
+                 fluid_channel_breath_msb(channel))
+         {
+             /* legato playing detection */
+-            if(channel->mode  & FLUID_CHANNEL_LEGATO_PLAYING)
++            if (channel->mode & FLUID_CHANNEL_LEGATO_PLAYING && channel->preset != NULL)
+             {
+                 /* the list contains others notes */
+                 if(i_prev >= 0)
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
index 984f37b756..bcae74adca 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -2,11 +2,11 @@ require ${BPN}.inc
 
 DEPENDS = "${BPN}-native alsa-lib ncurses glib-2.0"
 
-SRC_URI += " \
-    file://0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch \
-    file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch \
-    file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
-"
+SRC_URI += "file://0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch \
+           file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch \
+           file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
+           file://CVE-2025-56225.patch \
+           "
 
 EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 

