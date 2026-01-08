Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347AFD185CC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4003.1767869638170548166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsD/ke4d;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so24273585e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869636; x=1768474436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfuhMVUs4WU1JvHmvSezdrzeIMpGnyl/LfgKtT5BtYQ=;
        b=OsD/ke4d2eBOspHp59TQJAZrf94yUGg5moowr8f71haKYWYe+8cBZzDUI7xhLMbLIY
         20dEaud7vT0vRBj8BPxNKgcVItlBJEnPTC86ZpJ3zbCBQgT9YJnRvgZvvR9S23lhb+lV
         l66vzF5gT/WQ9l7bg1MU51mPSnSuKAiziL9yMUBpFCctDLN3rxbV6Txu2l24ZdLJ3NvQ
         q1Du67tA6x06TmFHtZ07sEAUveveXHLinvpFfvF5+Mq+J/RDYW9C8A/hu57xAv95l2Cr
         nbRPKc6XN2e2om6By1lF8hqMRH1oslgjPZm/JrNLFTAFJanHKwxp3BUV2jaxs3rbD8kd
         6/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869636; x=1768474436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfuhMVUs4WU1JvHmvSezdrzeIMpGnyl/LfgKtT5BtYQ=;
        b=ex3pFl0d11lftlp0Lh4Ao7MI8Xu7Vjg5LHdFZ2CHZayfpyAO+BP6SwR6fh6sqByECt
         5ocY67RVPXRQzFcF/6qaAXbp+b9Pc8N28VeSUdifVbHggiXX7TaDG9Hrd1jLp0UyNf2O
         dMc1isqdKT5TtPuaZvUsVFr9Sxp8tPjGnsnhFeBZCdxPl2hfyHQKT41VkBitu7+PKaht
         OZhVFRtZ905MjY33AyS0Cma8mdx55WWxXPxlcKsTMVGkEgSMMzTBklSYznPnbvtYavon
         L1045NyXbqw6zG2bfpoYVHmbQ4U3Mx3loiR2l8HixAekgrUh8WUS6IKCZNi7q+eiZVNl
         /u0Q==
X-Gm-Message-State: AOJu0YwQeLDwzu7oKKzG7a4EXt5Wu0GjMnwZgcQKLc7JyCD+QqoTUdUu
	gmZ7RrJEFuMfYHOYAKhOcmI+Nm1hnvPX7JJKzp2t1SzIrUqZPEio5wGl6ED7DQ==
X-Gm-Gg: AY/fxX5aZajIz5ldEHJnpnFK5xnY3qtAVqNnk4Js1WH8riL/DhppcnAMJrn/72Y8GZR
	jgQo60nYCNanSA9IrXhDWIy4kuxFDUrCtZZV+gaIrZL9r9bNRHGp9nj7DE+nRBp18EYf2+8itfY
	D0pQcwmm7oCejEOiHFSZOYrP+Yh4P15d6nZ0Vv9cO8sGz2OfNdKzbzlKaMD418+lKYjgb9R+ZbC
	86RJXAhb1MPcwvvZKdd//q00HDqQDF7E+EPnzG9yy0ysoOAJOcY5bKMCO8vkOnBIWxvqNKQlrfk
	7MjHZ7TULcDGcxbH1mMHxacehssjmBd7CdIe/ihPsx+WjOMsxD9D0htpN4uBsftgiHe9TVW9UEY
	pQs6LliJZWgXjQaIwb3ZuTAAtDb7wCo7j5YKROAQmOLQ3F/+9oxPMa8qmgCS56IVmL0Qu3CfIXt
	nXr0lUxufx
X-Google-Smtp-Source: AGHT+IEogcM6cROJCZUW/QeiuT3a3sZIclQBJBG3UYJCoOcqUGHB/kL+1PN3fIyGjbk90r6IJpg0Qg==
X-Received: by 2002:a05:600c:4713:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47d84b5b43dmr76111695e9.30.1767869636387;
        Thu, 08 Jan 2026 02:53:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 08/15] imagemagick: patch CVE-2025-55005
Date: Thu,  8 Jan 2026 11:53:10 +0100
Message-ID: <20260108105317.460246-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123262

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55005

Pick the patch that mentions the related github advisory[1] in its
commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-55005.patch          | 34 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
new file mode 100644
index 0000000000..727e66f741
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
@@ -0,0 +1,34 @@
+From 430c29617ce287db24872cb4e7fbb1e03d117d0a Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 7 Aug 2025 22:05:10 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp
+
+CVE: CVE-2025-55005
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/b68bb6d3cfe472d5bd9329b4172e2e4f63d90a57]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/colorspace.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
+index a87defad8..82400ce46 100644
+--- a/MagickCore/colorspace.c
++++ b/MagickCore/colorspace.c
+@@ -2420,10 +2420,16 @@ static MagickBooleanType TransformsRGBImage(Image *image,
+       value=GetImageProperty(image,"reference-black",exception);
+       if (value != (const char *) NULL)
+         reference_black=StringToDouble(value,(char **) NULL);
++      if (reference_black > 1024.0)
++        reference_black=1024.0;
+       reference_white=ReferenceWhite;
+       value=GetImageProperty(image,"reference-white",exception);
+       if (value != (const char *) NULL)
+         reference_white=StringToDouble(value,(char **) NULL);
++      if (reference_white > 1024.0)
++        reference_white=1024.0;
++      if (reference_black > reference_white)
++        reference_black=reference_white;
+       logmap=(Quantum *) AcquireQuantumMemory((size_t) MaxMap+1UL,
+         sizeof(*logmap));
+       if (logmap == (Quantum *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index caaf813f6e..baf0230590 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-53019.patch \
            file://CVE-2025-53101.patch \
            file://CVE-2025-55004.patch \
+           file://CVE-2025-55005.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

