Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF85FCB60A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70987.1772809565810341357
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M60h7Vxn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso2622985e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809564; x=1773414364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jExustlqghuX4dXxDWYZb/kFnLFFpfyYXErJYiOUxxI=;
        b=M60h7VxnYu/xrmJR25hJ2l3v0Z8ZSSOMkvrmy36Uf0t/kAiUQxYNjRPRAAMZ5Nfm9n
         gR18KdXzvObMM4odN+gO5I42iDJSaPzVp9KKVOxo7PSjtS1y/qTT0aNl+58K1bFb9iR5
         JbSVRLqY8v9Sr6GXbhwj/ktD6vttY/KJDTIr36KaDx44kmv6Nfeu7oubfM5unts/VL4i
         8aPV3ZZcNe1KSr3E/HzX8P+9PMJwzgDgEoUDeocZ/Z3VagpX6eGIU6S8/ZjUEZKdWJbQ
         hNEvmmtWXXkXiRTzAXn12wwmU0ng6rDfkg3i3f6WpriDxVyxzRiTru7bl1Hxh17Az0ru
         NcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809564; x=1773414364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jExustlqghuX4dXxDWYZb/kFnLFFpfyYXErJYiOUxxI=;
        b=QPjwcH7k3UShwAc7TBLsVeZA7DbkNjOtiDN/k5I/OjvjVdMRJQmy5T1Le3YvEwulNM
         kGkyH2TEh03E/XO1B/xrRgtiLRAAtIL4rWrZrT/8cDCGH88gD77enM9oHi0KWnJmpDLy
         CtFX3zKFUvohGL8pGM6aK7FEbz9cKhV6EkMJyPEX+JW2FsX40ZcPXvTLn7Wu4XoowO9Q
         rc8leSpeh0Ay2xPgz3iNNP5qG3Wo3sAiUcjKL5eWPFlozxgnua6qawRiBlOaiS3Y8ns0
         jO2roUvkVEwujxAsImZsyorjUC1qb2LBtNHRs7QNU5sWIu3W7fbuTiwH1TJyPClHb3J+
         dmeg==
X-Gm-Message-State: AOJu0YxkmDtlBMH+Qhi13Q2tF0uk6/REcoT1cgFjqWmjd6t1c1Zk53ft
	RVnJiG8u67qW0UczRsmAs08g4P53eorpDIvH7ObR2yg3197SOFAjm4XzvZE7fA==
X-Gm-Gg: ATEYQzzsejUlK49h0ASOphhR1rA84MAZ5Er+dnTrXZdHvwIrKvUDW6iM0oh/LLDIKWV
	gr2ZGiS5HK/BJ3hItuYvOFllXitRHfaDT0WUiHyj2rmYf0Cvr3NL58ytOYFskv6a2w4dx3N83uc
	5Ldrfq04SE8zl2MdQOcbBODX+MAtMzUV/v3FBHMua/ZDbbMQWgfdFlPtixydSXJRqYU3jXCDsev
	YfrlWNsCRSsaihLCgFHSeUWPIJG6OX9RlZ53hdyjK8t82Hs54/ZK4vbTuOqzMxGGOx6rTy0BJo6
	tE1WyxrtlV/OKdO3xzEb2FpcD0Y14qr1GcfNa2c4Qd9bbbDLqqBgodyW6U8wXZh3z47JGjz+zYS
	j4cFVMcP2OQjDR7nbAKXEv4ixMHuo6HSLw8WnqeeI4meCGSLdtj9GNzNNeiFgeItgsGwYzFhQ6X
	LvekBX5bJgiln5t0ePw6bB
X-Received: by 2002:a05:600c:608f:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-48526967adfmr38145115e9.27.1772809563833;
        Fri, 06 Mar 2026 07:06:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 01/11] imagemagick: patch CVE-2026-24481
Date: Fri,  6 Mar 2026 16:05:52 +0100
Message-ID: <20260306150602.616834-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124905

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24481

Backport the patch that references the related Github advisory[1]
in its description explicitly.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-96pc-27rx-pr36

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-24481.patch          | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
new file mode 100644
index 0000000000..3d35a3f1d6
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
@@ -0,0 +1,25 @@
+From 6778a890f95971c61a16593abc2cd15376d22cdd Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 23 Jan 2026 13:19:06 +0100
+Subject: [PATCH] Initialize the pixels with empty values to prevent possible
+ heap information disclosure (GHSA-96pc-27rx-pr36)
+
+CVE: CVE-2026-24481
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/51c9d33f4770cdcfa1a029199375d570af801c97]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/psd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/coders/psd.c b/coders/psd.c
+index 28495c6d5..bb4ceecd6 100644
+--- a/coders/psd.c
++++ b/coders/psd.c
+@@ -1334,6 +1334,7 @@ static MagickBooleanType ReadPSDChannelZip(Image *image,
+       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+         image->filename);
+     }
++  memset(pixels,0,count*sizeof(*pixels));
+   if (ReadBlob(image,compact_size,compact_pixels) != (ssize_t) compact_size)
+     {
+       pixels=(unsigned char *) RelinquishMagickMemory(pixels);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index e3f4a96d6f..adf65880b6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -15,7 +15,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV} \
            file://run-ptest \
            file://imagemagick-ptest.sh \
-"
+           file://CVE-2026-24481.patch \
+           "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
 

