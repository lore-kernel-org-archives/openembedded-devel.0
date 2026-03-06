Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F4FCB60D
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71230.1772809567041102193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AeqePj1m;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so78564735e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809565; x=1773414365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccBGokhW9wclWb3qrvVc8USkkdsbNTUs7FIbjQsFe0g=;
        b=AeqePj1mf4oxCQO9qj8bZxwCh9G6Ht9UwOSdmCe5P74ZjUfYJ+zL+kiEegFXj56fEn
         wCfPbWz1F6CiIWV3BdvgqmSK0UXkL+GASRYLXLI2HO0M32LSQbeSr6LMdSZbrkz1sXVm
         BQ36lWkvtwAcb0C0jwebCvbuTmTssR+dTPNsErLoE35MpFJDTmImtHmc88b0iPoViJK9
         6TPqWZT3FKR7yOtm5x1gE11VgFoh110y/KfW6jz/bKhUHJGhvwTYjTwboZ2/Z0gpcNol
         HK/OUDkjoj4aQg+eqvOhghlQpBini5nWXausjGB4VPeHWQFVwx9kKmMhNORpUS2ICK42
         NUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809565; x=1773414365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ccBGokhW9wclWb3qrvVc8USkkdsbNTUs7FIbjQsFe0g=;
        b=gBtCMg/t16oCM4M8JS+6COplFEUyqt7KMKhCfOUPmTRJmg3UJYEyD9wUkBqHU4gakB
         SrQvkliq7iICcKn/sOI0kGzLa8J+IwpJVvkyvtsyEVLx+prqVlSHsErZHIhVbD5cCzlY
         tCWOh84t0Z/dqD8f36PsG95d7bS9wUoDQlRldA+fWPcHiRyMoTPMMrgx7ToLHpKQM9N2
         WYyar/U1MynJtseHsV3Lwh+PWL+aPp+z22sKh5Z/3Z52lM5eOd9DEs+BdZyPPLg0/A7v
         zLp6CLNGoBGfsTNorWJGbfd10tczCNAQ0lTuHVqiTRzYoMtg+b59sA6QLfSvU7Kzld9x
         hp7A==
X-Gm-Message-State: AOJu0YwWwjIyXxb+uVFqF+N7ON9yNm7New5qrgFxtywoUym+UsH0mHqa
	78+oo3HaK3VuMf6GgarElQwmkW4dPmhJsj7kSFPUevBJw8Ka80Ufr84/Nuf/5A==
X-Gm-Gg: ATEYQzwwu/ThekCrB0Dyi8h1K18ijJMRzodeVWFtxbgncHblrdEq9eqBufTgY381Qqs
	Lr7hi1oZkPpkWfJpEAin41w0NxyM+o8dnC3E0lgHKdW5IZzzUhvx6iZNgoihX8BIeRGX5eHKLws
	Yx60L9gLbdYt2lw5ZNt/gsiAtcx3M3BQvbj8ahEeKt3qif8qf+U9FWgOHLAMXv2XHBxCxzd460P
	F9QbQN4FhEY3VE/UZ/YjyWZml3p0v/QxCBVpHbXpZYKPJMOYh+uwEvlsGvIIehyTxGYTVWOwtfv
	fRnmy2ymVmceJj8eQTPNQYqP2Q6KJ3cdIaadFJyLvE771+xf0tnhRUCzkFZt7CO1WLfTRhuOI13
	GRnEcOXkYkIqGWJo3Z17CDRusYIvfbrqL0g0IqGX43teblb64ay1GDX/oseOptzKJ3r+Z7lFwuA
	vaP1E0Lm3ORfw+MBMJ2g03FJvpCz0lDkM=
X-Received: by 2002:a05:600c:3488:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-48526925656mr38769195e9.9.1772809565256;
        Fri, 06 Mar 2026 07:06:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 03/11] imagemagick: patch CVE-2026-24485
Date: Fri,  6 Mar 2026 16:05:54 +0100
Message-ID: <20260306150602.616834-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124907

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24485

Backport the patch that is referenced by the NVD advisory.

Note that the backport is much shorter than the upstream version,
only the macro change from the top was backported.

There are two reasons for this:
1. The omitted part fails to apply to this version.
2. The omitted part also doesn't introduce any changes. In one part
   it only shuffles around variable names: it consolidates variable
   declarations to avoid duplication, without any logic change,
   and in the other part it introduces a new dedicated "extent"
   variable to store memory size (instead of "size" variable), but
   that is also just cosmetics, and introduces no change in the code.

The actual fix is in the macro change, which is in this patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-24485.patch          | 45 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24485.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24485.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24485.patch
new file mode 100644
index 0000000000..7196aaeb4d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24485.patch
@@ -0,0 +1,45 @@
+From 8b1f339454f9896e518f4c20482e150a9eefb304 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 22 Jan 2026 19:25:35 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-pqgj-2p96-rx85
+
+CVE: CVE-2026-24485
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/332c1566acc2de77857032d3c2504ead6210ff50]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/pcd.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/coders/pcd.c b/coders/pcd.c
+index db613504f..9477c75c0 100644
+--- a/coders/pcd.c
++++ b/coders/pcd.c
+@@ -116,19 +116,26 @@ static MagickBooleanType DecodeImage(Image *image,unsigned char *luma,
+ #define IsSync(sum)  ((sum & 0xffffff00UL) == 0xfffffe00UL)
+ #define PCDGetBits(n) \
+ {  \
++  ssize_t \
++    byte_count = 0x800; \
++  \
+   sum=(sum << n) & 0xffffffff; \
+   bits-=n; \
+   while (bits <= 24) \
+   { \
+     if (p >= (buffer+0x800)) \
+       { \
+-        (void) ReadBlob(image,0x800,buffer); \
++        byte_count=ReadBlob(image,0x800,buffer); \
++        if (byte_count != 0x800) \
++          break; \
+         p=buffer; \
+       } \
+     sum|=(((unsigned int) (*p)) << (24-bits)); \
+     bits+=8; \
+     p++; \
+   } \
++  if (byte_count != 0x800) \
++    break; \
+ }
+ 
+   typedef struct PCDTable
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 991b2e363d..3e2d3ab344 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
            file://CVE-2026-24481.patch \
            file://CVE-2026-24484.patch \
+           file://CVE-2026-24485.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

