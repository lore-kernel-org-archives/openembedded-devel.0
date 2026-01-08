Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3346ED185CD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:53:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4003.1767869629861134867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwhpcoBF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso8934845e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869628; x=1768474428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+E0VU0FoaSu6QuhePjxH8pbCZky4JCNUQW5TLL/WAw=;
        b=OwhpcoBF2KqiGFaw32/N7AVYMkMqgNIA1QPqDXiLJg7rOuSaPwsQzFdsmlvaRTSAlR
         DXjyyC6uHjNVe5ejvi6ScAsn06S/PzjS44GCzlIm9QJ1IoxV52zSP+X2i99dE3+Pc+IC
         micnIxA9iyqx65xFeMSo+qHqgc5jaFW/bYXyLYcnhIt/Mlkj2MAzm2rRFB6nAxTW9PnG
         IIuQce8NSKbFL50krhbzzQGQHxTzMs+OJmIHjQy8GW6uC7/Rdt/DYFJkpZZTLg5lT/V5
         CHznLwbXGNNLHLLuFwO1xlWoaq56Ange9jJXrip83VLN3DToXgpKllyzhT1xFL6V+tZ2
         LRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869628; x=1768474428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+E0VU0FoaSu6QuhePjxH8pbCZky4JCNUQW5TLL/WAw=;
        b=wkYe2waVBhBUY3N0tFwkJ+cmXBAO/WeTdgnClNTMhDDDlbaulrRgDIZyyZDzBkEyqN
         hPa4kSEKgeVx/ALSQoMksgsDUWaemw69b/JlQmL/+XPAdA7PtcoQqvd+Ua5dcie1+L5C
         U3c9QTfMM/BXIAPDMhwTTQB+Kihh8ukSaA5h0ZZB1wo/d5hzlk2c50u2R+oMEydHDXF4
         WlIfjoQwCLpkoe8GBshRdMs8ch9LZr0MmwnDoEMpa/sn2fwmlcEVosvvJt1sFuDcEi5n
         fzV++hTNw7hH0x8cIX4cMeLFUiSPLbWLboIkTgpa1/S1iGb6mGlR7emUX0gbTsWhEM+B
         JRgA==
X-Gm-Message-State: AOJu0Yxhl0LhY6g3Yaz6qOouBBsPhqxpQPVgKs20x8ywnmMvR0qpdpaZ
	o1Ok4VjjHmxryTher68SV8Agp0OtKIdwlg++JWquSZfwI1CMR/7EBeoMgtRHlg==
X-Gm-Gg: AY/fxX47Nb/LXAxGlM0k2ZHXIazLa6KqNjx9G3d4RkXT/VOmB/FegXuBsp3jnD1mRSb
	+OXdAQOn1TsCITujjDQ3wFkH6VP5cQZNV8Rwxz2G9wTZPyZfpcrVinpNAdm0Vg+Vh0jh6mB5u68
	fTAWI4Cqu8jbArsqsi+Ah1TBd1XZHEzvGymMmWzHxN2lv2Y9AC+uX7TNy9QA83HRcfgxzFgilp2
	vfvj28d5aj+yYlszbQTRcklVGC6pyFXHFqU+MryPzkQKRZ4yJ6JV8oc9RcNesUq1znOrZQACnS5
	oKVDVQiLZviKfiWs2nDwXG7cww0god0volQ1X98ZlqO+Sn0kf8kC79KndWAr2pbkOqfszI9C+OD
	1U4xQNEViiGdlCG9lJeMLdgjEgtMC9DeWnCepEVhdjguAO919Zo4iRBip0Puo4n7fhscOJx0iR4
	0NWx3Me6XE
X-Google-Smtp-Source: AGHT+IESJIbHUl8hOaldWn8WZvFpS4M2w8KYV2Xv5Uyd+qBLda+/y+a5cZbukbEaM/3kKKaxBllXdg==
X-Received: by 2002:a05:600c:a30c:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d848787eemr54849385e9.15.1767869628119;
        Thu, 08 Jan 2026 02:53:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 05/15] imagemagick: patch CVE-2025-53019
Date: Thu,  8 Jan 2026 11:53:07 +0100
Message-ID: <20260108105317.460246-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123259

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53019

Pick the commit that is marked as a fix at the bottom of the relevant
github advisory[1].

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cfh4-9f7v-fhrc

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-53019.patch          | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
new file mode 100644
index 0000000000..63702955cb
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
@@ -0,0 +1,26 @@
+From 4e32e83e3f57d110b56641f12cc5ed7d007dce29 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 27 Jun 2025 14:51:57 +0200
+Subject: [PATCH] Fixed memory leak when entering StreamImage multiple times.
+
+CVE: CVE-2025-53019
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/fc3ab0812edef903bbb2473c0ee652ddfd04fe5c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/stream.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/MagickCore/stream.c b/MagickCore/stream.c
+index 786dabb52..22a0c9eee 100644
+--- a/MagickCore/stream.c
++++ b/MagickCore/stream.c
+@@ -1321,7 +1321,8 @@ MagickExport Image *StreamImage(const ImageInfo *image_info,
+       image_info->filename);
+   read_info=CloneImageInfo(image_info);
+   stream_info->image_info=image_info;
+-  stream_info->quantum_info=AcquireQuantumInfo(image_info,(Image *) NULL);
++  if (stream_info->quantum_info == (QuantumInfo *) NULL)
++    stream_info->quantum_info=AcquireQuantumInfo(image_info,(Image *) NULL);
+   if (stream_info->quantum_info == (QuantumInfo *) NULL)
+     {
+       read_info=DestroyImageInfo(read_info);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 47ab5ead4c..cb4735e394 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -14,6 +14,7 @@ PV .= "-47"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
            file://CVE-2025-53014.patch \
            file://CVE-2025-53015.patch \
+           file://CVE-2025-53019.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

