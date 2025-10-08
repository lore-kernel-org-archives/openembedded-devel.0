Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B5BCCD184
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.2603.1759957159280446816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIO6rNsE;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3da3b34950so36736366b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957158; x=1760561958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSD0SaIiLvXNAEBBn9NLNSZokrlyy4eimkh607zOq4w=;
        b=lIO6rNsEGZK5PWbpTB9BoVvkf3M1riDYr6IqEtIa/3uv+Mw3f8AEmo7ykvDOjaZw4z
         zGTvZaiQFXUu6vCNbfIAAGraFB/I0cNIq9wh4Ce/fuZOwbp6xH9UX3GTWWn3eUJMQvQo
         j0SBKQkPNONWubzJCY85HY5OulH3NoOyI3dk/+km8uVACwTgJmF9kbfDyo+1j67x4ltG
         enTp5ZM26Nx+SMlkYWPg0fNRo7AmN8oRK+LNtYgpvP1V/eAVdXf93CLboec7Vl2Ee5MF
         20+G1RPcducAnHD9E6Y/4rl5Zn8C2tmschGCV8y7QZe9R2673W0/+pegZZoDfkAYOmH4
         6s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957158; x=1760561958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSD0SaIiLvXNAEBBn9NLNSZokrlyy4eimkh607zOq4w=;
        b=Go6VM+a6oAw4a4TO+AAaJJTQguid0cQFqRLejkYDy0SPQl7Yj4ia3Z5jniTOb6m7Lo
         yv11yaVronpMR4/zwIKoaXGPNQnBdeJkoCRbrLqoaANvUuzQOBPvALUx67hs6KnmR125
         9fntYfleZMoDNWEkPI7I6bLDom88Nun7WANrl4R2HX0td8kinpQQ8bJmKUaSVrOsUw/7
         pY5IryLs2JKF5zk737F1hfeAMLsRWwTCeYQwToblf031ngGbKPmVLi1RwbffUGeILLmB
         G3koxxLt3CxvYe/wCdIbSBpIcPlrZC5AIyF61moHmoYjoE1NqEV+NjRlB69ZfwuGPvvH
         kyEw==
X-Gm-Message-State: AOJu0YyFWXeShKJ/pwCiurVLfPyetPaWjAsTCILJSIbcme4diOP/H7ns
	D8l9Gw74Fsld5mWRqgBDL4Q6oAJ/2FoDP0jhiUIqB9mEdqVqGPkGP6F9QF8FiiFk
X-Gm-Gg: ASbGncsFMD0gsmasiY3WMyiAvub2Qfw7PmfPd+zamacFQCwCyfmkrCJHdLcv64hDD3y
	E0j52dBFE07MV6Cv7UO4D1/uWjSgMmyKH/VcOzYsgjgi99BiNCI5jspUXVrxJJiRdvHE3z6Oa8D
	Sj5gf+7eqhJp6nDu2gWOrhy1fHNxE9cTsCCmLfmW7X6eKcEeJ+/e/BTe8veuspYRhFO5WNhXD0z
	VokFGzo78aQ8C0thwDmPcuJCVsqpfcbLmCLBsMTx5pC+js43pXy3eh1xelg5DFjZycnIR/SdXDL
	Q9DLyxlovjkQAeaaRSsTllWrj4ITJJ8Bu1mY8nAiUg8ZXiNaqkbfdGPUBqeYPhufe6990iQ3lV3
	zc/3Or4XFAtv1Z7F/U7+5luFwxO0Xi7CF8TheR1VujJy3Zm4kLjvCjIE=
X-Google-Smtp-Source: AGHT+IHPHCQJ8SY6iTzKE/vf7EHfVHMU75Od43C1onBkuPNam7h63YqBRfeTTMy/bfCCypGyaCLPXA==
X-Received: by 2002:a17:906:284e:b0:b40:101d:cbc2 with SMTP id a640c23a62f3a-b50abaa44bcmr420785966b.37.1759957157514;
        Wed, 08 Oct 2025 13:59:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 04/11] imagemagick: patch CVE-2025-53101
Date: Wed,  8 Oct 2025 22:59:07 +0200
Message-ID: <20251008205914.598660-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120387

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53101

Pick the patch mentioned in the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-ImageMagick-ImageMagick-security-ad.patch | 52 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch
new file mode 100644
index 0000000000..48c3fff35c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch
@@ -0,0 +1,52 @@
+From 0afb803b504b572f3dc654ac4e39e5bd8df7ee03 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 27 Jun 2025 20:02:12 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9
+
+CVE: CVE-2025-53101
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 03a5972d0..abca0a9ae 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1665,7 +1665,6 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+     canonical;
+ 
+   ssize_t
+-    field_width,
+     offset;
+ 
+   canonical=MagickFalse;
+@@ -1681,21 +1680,21 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+         p++;
+         continue;
+       }
+-    field_width=0;
+-    if (*q == '0')
+-      field_width=(ssize_t) strtol(q,&q,10);
+     switch (*q)
+     {
+       case 'd':
+       case 'o':
+       case 'x':
+       {
++        ssize_t count;
+         q++;
+         c=(*q);
+         *q='\0';
+-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
++        count=FormatLocaleString(filename+(p-format-offset),(size_t)
+           (MagickPathExtent-(p-format-offset)),p,value);
+-        offset+=(4-field_width);
++        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
++          return(0);
++        offset+=(ssize_t) ((q-p)-count);
+         *q=c;
+         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+         canonical=MagickTrue;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 2f77a777a3..b4990fd5a3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch \
            file://0002-Added-missing-return.patch \
            file://0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch \
+           file://0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

