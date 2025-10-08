Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B699CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:19 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2619.1759957158717901346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECvDaavs;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b40f11a1027so44627466b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957157; x=1760561957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkPMGKdH3rGM5iwB80cM/DVsMfVR6sHDWwI0DwIyQTw=;
        b=ECvDaavscnfPrsX7OyUdTk/az1ZEnHifQKgXRoPBT1QPlS90ZNfn1hZJL7RUDc3lSP
         lfbB4ao6Kvfwv5AwOXaGZLH2VDLbkA6vS7Qg8VLzsKCoVqX05SZR/IBOB5SbWulLdZj6
         rf6LnZFfjJeauMHCh5NqkBKXMYZN359cg7gVNFL53ssr+Em/vxEXouhiD/gFMPSrI+7t
         TpPBpSePskbmeSGYJc/DZ5hMziubN66eHJE9oUlHxt3naRMAdJbRO1Od+knHxpCajy57
         L7yGIlm3GBBV2k36ouAZ0dAQZkqDj0Bp37iQiTi3nA9wFEhWAtgfrBYVJr2EcK2cN4jE
         0m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957157; x=1760561957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkPMGKdH3rGM5iwB80cM/DVsMfVR6sHDWwI0DwIyQTw=;
        b=nFl21FWL/bagk3Q6DJknKNwBZWtpwJR/mvRVpMVuNJBVFo6cPQpEgnbsslQR/MArRn
         QVEXjVC72KQvZs5sQNQ7LoyF/dAPZksP8ceexDaxaJSTqvS0nQH8eC5338BxW+BtXrJb
         dDZIzDhZg8J6futrBugEpBuaZTso+tVPceGqsBX3NTzj0TKfRIQXRyZt4ZnVJ7nHSUBb
         V/4FSvH9ljQzL9RP0UPUVLgMQqZwmIKRF8rAnj6Np3dB3chTvvvnlD724mvNnGfPFxyV
         YrQ8nv9aCLGnimDGKXJ0WcczTrveneQqlcVLXwnz74QwFfI+N+lmMjd2ADhSql7f9vpK
         JCVw==
X-Gm-Message-State: AOJu0Yz6zuuVPzkEkvbZbr57FD9aWIxkBd/0C7hDEfkTlsGl0rjovPVi
	1b3y+z9qMSf1MSEues/S+r3fei5aPyqY8b15DHvO13U6qw9hUWqF7b4JZh3KK+43
X-Gm-Gg: ASbGnctRphXa5xnm5j8lmvsgqPAQO/e9t6St3Drvb7wHsA3de5hWkGpiNRd/f0E3SdR
	HL2GLCS2UK/F+SYvsVSUrLO9gxdaHvYiizFP9Kx0laPs4lZzYEE4WQ4HW/qaoPKRnXBxiBnHNsg
	IoMDynJjnZUMX3QrTgZiWqOiopduYSDc5BRFoCOfU+wLgEBNw/JyVKr+L/fk9xwRQALSjak8qhx
	jrJM1ljMbo1SHw9DaliL6BXNmIvVnh7RaullLzGpCLguTOjzVII4KQMfYVqVzCTzBWKYqIUc53t
	opax/XoA/l/7YGCOCh6+0ExxLSV/9YEFVqiZp8ju3WfCAdgiujMbeCTmuMZrDmElD0ZMBjbHrjY
	XlUjiF6W0XZJxbmTstIkaO0/NXkqeI7lmh2coklMxijeO
X-Google-Smtp-Source: AGHT+IEJDYta4Zn3NONjFPrOyPumsYwadADfISx/dyN3Z3RLKNI9RMss8LZqfqTcYxsr61rIUl4K9Q==
X-Received: by 2002:a17:907:9710:b0:b50:3363:8531 with SMTP id a640c23a62f3a-b50aa387389mr590444566b.12.1759957156830;
        Wed, 08 Oct 2025 13:59:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 03/11] imagemagick: patch CVE-2025-53019
Date: Wed,  8 Oct 2025 22:59:06 +0200
Message-ID: <20251008205914.598660-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120386

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53019

Pick the patch mentioned in the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...k-when-entering-StreamImage-multiple.patch | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch
new file mode 100644
index 0000000000..b40dd2c9a0
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch
@@ -0,0 +1,26 @@
+From 8afe85d586b15b3b09c5c3c86a6d62b53ab8899e Mon Sep 17 00:00:00 2001
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 64e81170bf..2f77a777a3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-Correct-out-of-bounds-read-of-a-single-byte.patch \
            file://0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch \
            file://0002-Added-missing-return.patch \
+           file://0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

