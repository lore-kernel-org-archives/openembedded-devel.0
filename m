Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2A1F433E6
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:41:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6924.1776318095223443357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U9MFxRsJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso51296455ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318094; x=1776922894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRQJ2Oe8laAluGJOI5HkJm01v6pQVzwO4wb2IycWSGo=;
        b=U9MFxRsJ4aFFhixaWMEjbK/JS3SZ/gyG3g/p4NKpcZ/E4e2NSqqiWqaqozG6S/Algm
         3pPBHs1ki7wqs55PXEwjsfegfM+DGvd5d29V/oN9o0pQYWhQVCBcNpb9dAS6aLgTwBkK
         +FHq/b+2jaAUZfydnpM4oMadXyTXCupp01IVTm5XX7EQ+CnmP9XEsPUhgyAgNqqOVwYC
         SJRTZ9w2z9sSBD9e8VtoMGo3CKtjv2mT4pShrjJFk7ifAFlgLrAta0yR857aEgktihWe
         a8aNFGxHX7l4vLl2WJeBlcbMZVUAtDa9uBTaO5vcD3YlIAzRzDZLFfhZZqbB2yOjAwP2
         YyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318094; x=1776922894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRQJ2Oe8laAluGJOI5HkJm01v6pQVzwO4wb2IycWSGo=;
        b=g9q+agkqsQ87UmOfJ58/Jp9ODEIKKpV6JXEeEf8yT0Inwc3i/WgvCv1TEZCylfSoVb
         1HuoJD96ICxVnVRfzYljWZ87UBEGJw6+Htg29rQD/sdaW2QwzxyTKH/l16BXo/+pqBSs
         ARl0kz55wYcsGbkN06Vv550BnZJuyB5lCKrWa1+F6+c2KoGFec9zltKJWl1oJ5KQS4In
         FZr5P3fU/GpQFXshFq7VXL+p+bS/q2718ofcFdqQ3vMQGD4CIvVOxYV6oaN3/hDlZ+J2
         OG5ZkFczmsDWqVzOur1blShVf9ovByIkCxnoNc15uTAdoW50Ng5ojurlhYduq1zDyC13
         3OmA==
X-Gm-Message-State: AOJu0YyhoD8jbAkvlAGt11+Q7ZZKmx9gsiyAe1kR/LGNnN8m4HjVNMmT
	gn3SEHp05p1gUnG7RKQOYbMyNWAjMV5QM/11WHRmfp1jSNXZ6duvCIX8hDmAbA==
X-Gm-Gg: AeBDiesxjr98r8G/nrpGiEVvi1OybaW6Q20qZwL2SuEkj0n4UHPN1JfExbCIUjQ/scZ
	ZOnUPgeUe7BVfyUdLb87o3xY5powILJ+L7CJw5eHScJHJ9vpVId4WZ3VQxSwbpVjvOtt3h6hU4T
	ei+My+hjPO4zs0zgMauV5zpApgD7asfL3AS3lMCuk4M8Ruapq9//WCPaWJuSiUt7srQK6al+URg
	2maOIrprOqUPYbsOxPw8DGSonRHg4Szg6ysuCoXWiggIFtg1CUUO7FNu5n/EIuS+P91Dp9rA+v8
	4/gJwAqA48k/rm6Zc3Pv0v9wMlHhktvSz9Xq0/NitsduNvgmNwqBvcdUN1Xk68tyq8NDxNUiRSk
	WS4HazDS5lU45+OnPi7MM6Ml90SZRKQ4fC2KbsF+hdTtcjem32JPwSx/ZfK6xu5frihRM0t6ryq
	7/ZSc6wmBm84WqHhJttCLuYFr0iQDX
X-Received: by 2002:a17:902:cf50:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b2d59a00c2mr169225015ad.16.1776318094254;
        Wed, 15 Apr 2026 22:41:34 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.47.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b1174sm50361225ad.70.2026.04.15.22.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:41:33 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scarthgap][PATCH 1/2] imagemagick: Fix CVE-2026-28493
Date: Thu, 16 Apr 2026 11:09:48 +0530
Message-Id: <20260416053949.365300-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126378

From: Bindu Bhabu <bhabu.bindu@kpit.com>

Backport imagemagick commits [1][2][3] from
version 7.1.2-16 which fixes the vulnerability
according to Debian [4].

Patch hunks were refreshed as per codebase
of imagemagick_7.1.1.

[1] https://github.com/ImageMagick/ImageMagick/commit/6cefe972445185cbb9c76651231d52512e0ec14b
[2] https://github.com/ImageMagick/ImageMagick/commit/47a803cc139a6eebf14fca5f1d5dd25c7782cc98
[3] https://github.com/ImageMagick/ImageMagick/commit/cd7acd2c4bea5c953fae062d9ce43d11374dcb60
[4] https://security-tracker.debian.org/tracker/CVE-2026-28493

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-28493-1.patch        | 26 ++++++++++++++
 .../imagemagick/CVE-2026-28493-2.patch        | 34 +++++++++++++++++++
 .../imagemagick/CVE-2026-28493-3.patch        | 25 ++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  3 ++
 4 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-3.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-1.patch
new file mode 100644
index 0000000000..f2f1c2fa44
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-1.patch
@@ -0,0 +1,26 @@
+From 6cefe972445185cbb9c76651231d52512e0ec14b Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sat, 28 Feb 2026 11:01:24 +0100
+Subject: [PATCH] Corrected typecast to avoid an out of bounds write
+ (GHSA-r39q-jr8h-gcq2)
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6cefe972445185cbb9c76651231d52512e0ec14b]
+CVE: CVE-2026-28493
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ coders/sixel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/sixel.c b/coders/sixel.c
+index 5de968e3581..a9ccd8a677a 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -573,7 +573,7 @@ static MagickBooleanType sixel_decode(Im
+                             return(MagickFalse);
+                           }
+                         for (x = 0; x < repeat_count; x++)
+-                          imbuf[(int) offset+x] = color_index;
++                          imbuf[(size_t) offset+x]=(sixel_pixel_t) color_index;
+                       }
+                       if (max_x < (position_x+repeat_count-1))
+                         max_x = position_x+repeat_count-1;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-2.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-2.patch
new file mode 100644
index 0000000000..872fc6f436
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-2.patch
@@ -0,0 +1,34 @@
+From 47a803cc139a6eebf14fca5f1d5dd25c7782cc98 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sat, 28 Feb 2026 11:03:09 +0100
+Subject: [PATCH] Added checks for overflows.
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/47a803cc139a6eebf14fca5f1d5dd25c7782cc98]
+CVE: CVE-2026-28493
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ coders/sixel.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/coders/sixel.c b/coders/sixel.c
+index a9ccd8a677a..d3a77aff219 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -536,7 +536,7 @@ static MagickBooleanType sixel_decode(Im
+                     {
+                       offset=(size_t) (imsx*((ssize_t) position_y+i)+
+                         (ssize_t) position_x);
+-                      if (offset >= (size_t) (imsx*imsy))
++                      if ((offset < 0) || (offset >= (imsx*imsy)))
+                         {
+                           imbuf=(sixel_pixel_t *) RelinquishMagickMemory(imbuf);
+                           return(MagickFalse);
+@@ -567,7 +567,7 @@ static MagickBooleanType sixel_decode(Im
+                       for (y = position_y + i; y < position_y + i + n; ++y)
+                       {
+                         offset=(size_t) ((ssize_t) imsx*y+(ssize_t) position_x);
+-                        if ((offset+(size_t) repeat_count) >= (size_t) (imsx*imsy))
++                        if ((offset < 0) || ((offset+repeat_count) >= (imsx*imsy)))
+                           {
+                             imbuf=(sixel_pixel_t *) RelinquishMagickMemory(imbuf);
+                             return(MagickFalse);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-3.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-3.patch
new file mode 100644
index 0000000000..4e756c2d1f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28493-3.patch
@@ -0,0 +1,25 @@
+From cd7acd2c4bea5c953fae062d9ce43d11374dcb60 Mon Sep 17 00:00:00 2001
+From: Jake Lodwick <jakelodwick@users.noreply.github.com>
+Date: Sun, 1 Mar 2026 04:46:29 -0700
+Subject: [PATCH] Add overflow check to sixel write path (#8587)
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/cd7acd2c4bea5c953fae062d9ce43d11374dcb60]
+CVE: CVE-2026-28493
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ coders/sixel.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/coders/sixel.c b/coders/sixel.c
+index d3a77aff219..b242959385d 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -815,6 +815,8 @@ static MagickBooleanType sixel_encode_impl(sixel_pixel_t *pixels,size_t width,
+   context->pos = 0;
+   if (ncolors < 1)
+     return(MagickFalse);
++  if (HeapOverflowSanityCheck(ncolors,width) != MagickFalse)
++    return(MagickFalse);
+   len=ncolors*width;
+   context->active_palette=(-1);
+   map=(sixel_pixel_t *) AcquireQuantumMemory(len,sizeof(sixel_pixel_t));
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index ffc26e7169..09a56a1723 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -29,6 +29,9 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-68618.patch \
            file://CVE-2025-68950.patch \
            file://CVE-2025-69204.patch \
+           file://CVE-2026-28493-1.patch \
+           file://CVE-2026-28493-2.patch \
+           file://CVE-2026-28493-3.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


