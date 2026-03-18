Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DA110854D4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:28 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9893.1773824964966680540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSbw9Cmu;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70d802cc05so576365a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824964; x=1774429764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExuXtCSr4v3IJw4DiQvhxyYdVDpbqnB3jQQwinG9aVM=;
        b=VSbw9CmuqunEXfFxftTf6H6s0Y+YKMI8fYxXoqApZjv+BkjhpJ4kCIDPyckvMQ5sCI
         BWvC10iBNXTyjCnjk/mwIyT+Bwra4RFRKxXM4e1slIAviUcKUvHbKyIst/HYYuNTF5Lc
         m4+LgCfqCLKCqHh0LEgt6lXGMWGS2EXV7HZEHkLitgM/+RP53ofDJbM6klsAxrYhnESO
         RxnWPzeUtrtgF7hi4Ex5MwYv0KhrKLCIrR1+GSLR7eNl8fU0VNHooW3H+dRtWZwrI+Le
         iGs1XoyPJPeHJK/fc6zMY/1N9YmJq2OT8EZxK+EFdVnTN1Qk28QpjNmBMPfRo5c0f89V
         ze+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824964; x=1774429764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExuXtCSr4v3IJw4DiQvhxyYdVDpbqnB3jQQwinG9aVM=;
        b=ADFXEGBVs/9+bePVWqdqt3Hm/2B1PrY5Opa/t/vuJoC1Zctj6GdHhEdGeCSQWgZi92
         hhJixHJoMBOeo3Nz1ujSoD4jAOD59FH06k+3EsbGP4Lqz1LIRHwA08OtTvL8UyprgHLd
         KwBrG8RbBQdCtQ1cE4OFk71QtWxN+2L8bMqw1GwlMSlLYTQ2NlREOn0SkIf/jGpoRtlN
         FwaLQ57pAvsmHG3zg29jZD4Ijjkj773R/WeSYs4uPPouJJIVds5bG0simooEepNsTbug
         BeE2/y4aTOkTnmh7+TvJMXWPoEVKtJyBpXedi7d/Yp92M/WvYj01t0CmhzQpZfkphDAX
         EUDA==
X-Gm-Message-State: AOJu0Ywn1afGjUDMUGKUTFCUhNL7at8dVDaMLYQ9KKajTm7PhbyICCaN
	23CIROkqmTh08htewgKlyugZKGgGTy6mgTgrgYDjUYlxfYQAcYjv6/QTN5oplw==
X-Gm-Gg: ATEYQzy10YkCsmOaQjQMQGG6nn9ZYGn5sbsy6Ui9Z2mR/EnR0vo/AO8rED7+F+6avn4
	nDY8CFTm6p9wjE9CUPGrwvCALAd5wuD3ucdW8mEI7U3JfxoCBogy5AxUQavO2bs2D1MQfIE6gyV
	fKnGP1osszx6tovAFZJ9AwjavBqJelmgWT1gXUqraywVBX7FM68h+7ltwptNzROr+FZ6Qr7aoCY
	NxLEZMNp8VNexEesQN/WCQDekKQfR4hUTrgh3xxLeanncpuCpG1cbSXF8eUlDQLFKhCUxTqPjMS
	ksq5eaDeLsGvz009XWzcKG8h7GLNJMwBA51Telb3JIKFIxAfAiqpvr4qG9TqoqywGuUCEGsMkMd
	qMEl9xaaiz1ALmzQ+ZPfhPjeLIXlTSbzbgnqJwzapLmJtV5ONgi7sAA12JZLxucrzFyz7YT/0Dh
	kJxKSqdjI816hpBFET3P+S5wYdfOXgoEzYo1knKFIXeQZxUsXv/FCFGQ==
X-Received: by 2002:aa7:8896:0:b0:81f:453d:1ab9 with SMTP id d2e1a72fcca58-82a6aec2b41mr1701457b3a.3.1773824963936;
        Wed, 18 Mar 2026 02:09:23 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:23 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/6] imagemagick: Fix CVE-2025-66628
Date: Wed, 18 Mar 2026 14:43:34 +0530
Message-Id: <20260318091338.483937-2-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
References: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125355

Reference: https://github.com/ImageMagick/ImageMagick/commit/bdae0681ad1e572defe62df85834218f01e6d670

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2025-66628.patch    | 23 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch
new file mode 100644
index 0000000000..6b1d14ca06
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch
@@ -0,0 +1,23 @@
+From bdae0681ad1e572defe62df85834218f01e6d670 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 2 Dec 2025 22:49:12 +0100
+
+Subject: [PATCH] imagemagick: Fix CVE-2025-66628
+CVE: CVE-2025-66628
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/bdae0681ad1e572defe62df85834218f01e6d670]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/coders/tim.c b/coders/tim.c
+index 9a281b3..7b9cb1b 100644
+--- a/coders/tim.c
++++ b/coders/tim.c
+@@ -231,7 +231,8 @@ static Image *ReadTIMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+     (void) ReadBlobLSBShort(image);
+     width=ReadBlobLSBShort(image);
+     height=ReadBlobLSBShort(image);
+-    image_size=2*width*height;
++    if (HeapOverflowSanityCheckGetSize(2*width,height,&image_size) != MagickFalse)
++      ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (image_size > GetBlobSize(image))
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
+     bytes_per_line=width*2;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index c4e48b4bbe..7b2d33ccb8 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2025-65955.patch \
     file://CVE-2025-62171.patch \
     file://CVE-2025-43965.patch \
+    file://CVE-2025-66628.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


