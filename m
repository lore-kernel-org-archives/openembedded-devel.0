Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47195D185D5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4015.1767869667603353488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNpG4wy8;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so17115745e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869666; x=1768474466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04h9aEm9iJtgIPMsU6gI0R0WJzwyDZ3IT6W8ZflCfMo=;
        b=jNpG4wy8NRiN15IOe2i+OFYonNmAJdkTjakGBEsbV67hEXIoowfv9vHxOeFIUJLJFN
         tnqxv0A81nujkcwpey4uV6XGnrztWpJFOaFDtgz28EKrK/TpmhgZNf+S6hN+XWgAvb2W
         e3gignfQdMPeE3qgRMeOMPDWxepXURGyUwxrZXAty6NG0Z6z4E1/1/SR27tLxGhXEdcu
         QYqHewwovI40KynQzDnx7tQRHQqE0CJ5Ju0eEeI+yLdenozq1CTziWDGCZqrKJSv7byB
         0whWZmCLLcaw2UpxGDhibaF2qj1VvlGJXdl90jZdDTxTEJj9fX5PVwt/1KQF9AuccI6F
         hw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869666; x=1768474466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04h9aEm9iJtgIPMsU6gI0R0WJzwyDZ3IT6W8ZflCfMo=;
        b=jURQxntCvMSiRv6NeOD4Z1/oiMy3hxikiq7f4GMAh2ubspPnkKG8yrzPGgdPF7MmYN
         1WfV3lh6FAY9kHu7lIJmLmwwkypTiK2HW3OC077RxB8tOCsmJH5rAFyRzO85Gd6sV2nN
         RTz/s62IgTjT8Q3czk7qfvBSEbXWQD7pF02pi7Y9DWx4+EP4yVy6ym8U+DegGXOyg+lc
         WjCGp43uF4OLlSXwsmR+zUHCc48NOUH+NfqOEK6TXTTdzdGPYkFXcdEmboJSqcWW1+jm
         RhRM5ny7MdY1GICiFjmKhF0MUP7wNeaafs11SJ/j2HsPzPSqc6HeTS7HpvEccUHFGqri
         9bVQ==
X-Gm-Message-State: AOJu0YzP4fGvNRGeInkqEQMMpmcboDMKb2/qgNY5e6alIP033STMCMf+
	ee/eQHGj13cwkGhfXnOQ2fTFNu5IP+x217Xcra8PNCQrM4ZG47n2kgChShY5RQ==
X-Gm-Gg: AY/fxX5jCHLzT+u4GPi1oaLBG1srJwwmP/q6gbFAF2NWQybsQZSMkAhrpe5jCDeX2In
	iv/W7ewOMaW9lMfF+3RJjvSXgQ6XFD0Kt1lYO+VWEsh8XvPDbj5Ze95REqj8UJ3dhRaRf5CpkqG
	JwL5YEzx0OvpaasiDhuwoJH/q5MF0BhW46NFfJC+kFVmGYCsHJcbZhyfqyRIXQM74WyEpYfwHTm
	3UKLVAIvf/ewGPdIS8FMss5g3x9+/WYWCc4CpOHqAcZfbAXu3hZam9/MH/wnGp1kQ1k6ofT5Ong
	2M2ugoYqYaBVKnuev0Ys6q2I9+z4qsJlG+755q+lNo/SDIreAewD09bCzhhhdFGJl1cY6I0Dd7e
	6kHr24c5lVlcxkYaVxG7Onr0z/e5OfBl7/7FrbFy93+c5Ma63o38pDdDM5hF8+X8AZQwpnjqU1i
	sMn/IHQz9xZ96Z/D34VrY=
X-Google-Smtp-Source: AGHT+IHMGIe3M0CCafjmpAXJBSUDkGmZ5/L2rStAJxqVLyebXrWp3WIhaTLVbbuBS6hOq8VxwTaHKQ==
X-Received: by 2002:a05:600c:b86:b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47d84b3bc85mr63217535e9.26.1767869665909;
        Thu, 08 Jan 2026 02:54:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 14/15] imagemagick: patch CVE-2025-62171
Date: Thu,  8 Jan 2026 11:53:16 +0100
Message-ID: <20260108105317.460246-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123268

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-62171

Pick the patch that's mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-62171.patch          | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
new file mode 100644
index 0000000000..6b14a19550
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
@@ -0,0 +1,26 @@
+From 9214d0e007656d5385d51f31b215cc54225aab3c Mon Sep 17 00:00:00 2001
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
+index 5c75e7f23..7647a0296 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -1116,6 +1116,8 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression == BI_RLE4)
+       bmp_info.bits_per_pixel<<=1;
++    if (BMPOverflowCheck(image->columns,bmp_info.bits_per_pixel) != MagickFalse)
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+     extent=image->columns*bmp_info.bits_per_pixel;
+     bytes_per_line=4*((extent+31)/32);
+     if (BMPOverflowCheck(bytes_per_line,image->rows) != MagickFalse)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 7e40784005..ed20b67d69 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-55212.patch \
            file://CVE-2025-57803.patch \
            file://CVE-2025-57807.patch \
+           file://CVE-2025-62171.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

