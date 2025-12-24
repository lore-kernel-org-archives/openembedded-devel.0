Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E68E7848F
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126491.1766604882280640226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQEx/Bjg;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2e77f519so4049622f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604881; x=1767209681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlS/G9uOzhtQKb1X+/2FyhBaRuzoPiKvndAvqyRVfj8=;
        b=XQEx/BjgVfVWNchVssML8XZbUp1LjEojtCOV47FFjFt/2fqmybHsF+qqg8sB4Vz5H8
         hOLI6a94LXWKInAL8EKqMyENebwaTBbvBmHRbZtv/ALJY0a1S/DwsGIXhVNbeRCX0V6w
         hz0jlAklGQeBxOyy1288Hp7crQV7/YGtfYkTWHqc+fuM2R+ISb+hhSJ/KO7FimCChfGh
         AV62BwyXDOZSCI+Nt0DPyDdg85BbqB6V//hb7LxkjWuwX2InqLPq27ev/yEDg77aYSKJ
         GBwllFd7H61vJTxo1p+h0dsAvAgsjMVp1yKoTav3Q8oJgmlOZJ66b671nbdhz3EFU4dv
         ZGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604881; x=1767209681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlS/G9uOzhtQKb1X+/2FyhBaRuzoPiKvndAvqyRVfj8=;
        b=MuMytR51u8sS6F+i6vb5MlAuueUGC4Ayzb+KLH3Ufa5GcUG/4uLF02F2Hbos2hOLbk
         RChba8CDilI8FHqT1r7R9IvsVNMa2eLeJNmnfPl0BsyiEEi+EmYX3k3rrFdfSiLdVuNY
         /LYYslWYjCALPOpk/FGYXXmwcsXebCSBiZjAe/V/xaFmKDQFWAlLIJjNH8gwosffm+nt
         zkXm0EQb7cqOi9y1pjPlX8KifFSW5OxNaFcPCHtSD7sdDayg362aevVrwk2YmSDOKT84
         /DZzpajSNHD4C9co3EMY8wr33dgzROKfE9UDfpFfmxyQuepnVasnx5C3INu0kXIwF478
         VOJg==
X-Gm-Message-State: AOJu0Yxs82LhX67eZycF/lSC27zNgrOGbSG/uHHFf2uhIOD3Q9CF6Eec
	0k0s2sF4AJjhcPogsFSS9hSXFC6PfiU6pzoJxtpvldxzY+brGkUX+fDf/HowKw==
X-Gm-Gg: AY/fxX51V2Awhlmi5TOh3bi6SYEw9rpUp78zqCMA/Z7+DTnewQHG0cBo+fVhh8wx5aJ
	sozYNJPND2U4qwAIWiLXiq/D7vhsQaM95SV0WrWY6Hxda+EV3ARzQrJOvDORPPJW5vB0XsVMv9+
	U5xDjZ/hMwHbTtVxrHR6MJ3+A5odIWfsvUR4/EXekNQQ/lhEANBRFEMzV10Js6CwKyIbGBlKWpe
	fcWIkfipUId6ZUXaU+u5yJ9GzUolm20OIOmapgiSJCVG+/r2NT7tvk27c66HmiQMwWrDTqRGgHZ
	4Ut3vtCeRG46I9yXZQfX2tlIEtqLhFsZSgWBexuOCCshQg+RL2NzQMYxhhhtrCnJecbyTJsHA5V
	UGEfNAf7fZpxUQlKf9iQxD12kJKrK364TfwucwScTacD6jW1ZlfAAdUOf/Pw9Qsnd0YAXHXDZMY
	mswidTao9Q
X-Google-Smtp-Source: AGHT+IFiuuX5I2Fm98Y22tfeaSXvJ6EZOZGZ2hfBVQVskNrkXqS0iybJ8JXb7Qtv7b5elFoVbtFqpQ==
X-Received: by 2002:a05:6000:24c9:b0:430:fc0f:8fb3 with SMTP id ffacd0b85a97d-4324e506148mr22732440f8f.38.1766604880534;
        Wed, 24 Dec 2025 11:34:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33750665f8f.2.2025.12.24.11.34.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] imagemagick: patch CVE-2025-62171
Date: Wed, 24 Dec 2025 20:34:32 +0100
Message-ID: <20251224193434.2631122-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224193434.2631122-1-skandigraun@gmail.com>
References: <20251224193434.2631122-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122894

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-62171

Pick the patch that's mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/files/CVE-2025-62171.patch    | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62171.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-62171.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62171.patch
new file mode 100644
index 0000000000..7b6012657e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62171.patch
@@ -0,0 +1,26 @@
+From 12e9e846c20e8429940c1aab01ca8ffb9067bed0 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 12 Oct 2025 20:43:14 +0200
+Subject: [PATCH] Added extra check to resolve issue on 32-bit systems
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm)
+
+CVE: CVE-2025-62171
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/bmp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index 37f54e7f8..26deb34fe 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -976,6 +976,8 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression == BI_RLE4)
+       bmp_info.bits_per_pixel<<=1;
++    if (BMPOverflowCheck(image->columns,bmp_info.bits_per_pixel) != MagickFalse)
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+     extent=image->columns*bmp_info.bits_per_pixel;
+     bytes_per_line=4*((extent+31)/32);
+     if (BMPOverflowCheck(bytes_per_line,image->rows) != MagickFalse)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 83e9ff2fd0..81f4596456 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -47,6 +47,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://0011-ImageMagick-Fix-CVE-2023-34151.patch \
     file://CVE-2022-1115.patch \
     file://CVE-2025-65955.patch \
+    file://CVE-2025-62171.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"

