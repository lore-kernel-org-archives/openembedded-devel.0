Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAE0CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.2623.1759957160673420850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sj339iOX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3d80891c6cso213156466b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957159; x=1760561959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbjok82BW1+Ft0ltjhTXtJbI/XFRRI3AFoq9jVx7bk8=;
        b=Sj339iOXerwr4l4usjUUdilb7EaKEJe/YNWb2ZtEXcj4+CfHceyi/bztKdwwTzECe6
         cMNpKep/0Fck1NYo9RtGSJPTRvc/u4AZkCZA52eAZqEJtYTT8YEHbLURglhqGeJnHWbX
         jDj+W4W9KMBN379oeLzhAbMnOMxHpJIK2QyK3c+icahlyNEZNgV51qXG59w4pRjShJBo
         HfLrSyWzBCcJcB4Hw3VhHTskYxhK5Izos8rqSJcGIXXLWnO3UXnR/sdUQgrQ0YVudTqS
         vyEYfnLP00bBC/N5IyLc5KI7YDn0+QcgPYY1Zvdw2U+EIqhDxdy++7LG1m8ijL7YByPy
         Dh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957159; x=1760561959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbjok82BW1+Ft0ltjhTXtJbI/XFRRI3AFoq9jVx7bk8=;
        b=LDBWv82d0pIqmQJwOs62WrAcsUGK9KY7JXtzWhPS1qqRqeJ9CTOrqRRkHAW0xACVFq
         tAjdowlrZJoHMyihVV1QP84biQ0nW5wHAwVwQ+Wumac4YB3croAU2kG4I5kZI1llOEFk
         rPZXcaPeeXiS2+0FnZ31W/P25V7Uqhx29gOOoXVsa8DM+U8hpRGSbQvFADT+kpWi91IN
         k1XN3f88hOyBysFCUz6V/pwENBEZPXz7Hv4C5lt+B9OgXYvfqoFVkFjBovI40eMBLffO
         OPylTdOq3MUY+JoUsVU63u2YD18DFOYNhcex72cm5lzamQLvaHACGdQQwYbwR/R0EuSM
         6Fkw==
X-Gm-Message-State: AOJu0YwfTg4vG5C/DfIM//rZT3tLO6xRd8gOrzQ2vHj94V9JGqJiN/Sk
	BR7sSpr6HYtDmoIPFe+a4JIJf3CxMCIPVBL9kdIbPChiAQRlQ+2pV6qPG85dWw7+
X-Gm-Gg: ASbGncv2sJQuispNrVHQfsjaM4L9Bq0B24LomDkrJiG69bTnR8XhTlbmud7AErZ9TKX
	2The3rQ6YGgFhktlazcc5Cu7wacpnmD+7j1MpwbV00i0tQLTRKTRyGKWCk7fPi8V2A9EURAncry
	yG9O1jGZ0g6HqoDnmgqCDKj0EOmUGS4CaGYvJLKAP3Afk+N0y4v7vgoMnWoQElIEbS2RpBCwK3v
	t8V8PKKMkg79kzdBAvFhgrF0rvJ3N0NlL5BygHdu7oUzfEz7deblt4W6LqRmYsE5FDjo/H4xg6Y
	gNfduYRBxFVt88wUKYU2ktwaGNSnwvBHb8FRk1UB49GUmqFtu1cANXlrMsQ7ZHwYnDwqZoyzd2f
	OVWuDNqjSjUNkBAgYedQej9u6Ezq2n69eENcyz2rbTeBp
X-Google-Smtp-Source: AGHT+IEMgT5rab6DiRNRYmHiQVk6DJkh/X2nSmmXDyT5Dq5quXMcBI/GtoWTAgBV7L7O2vl6krdGGw==
X-Received: by 2002:a17:907:94c1:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b50bd049ba7mr560706166b.9.1759957158869;
        Wed, 08 Oct 2025 13:59:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 06/11] imagemagick: patch CVE-2025-55005
Date: Wed,  8 Oct 2025 22:59:09 +0200
Message-ID: <20251008205914.598660-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120389

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55005

Pick the patch that mentions the relevant github advisory in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-55005.patch     | 36 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55005.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55005.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55005.patch
new file mode 100644
index 0000000000..7f7b5537d4
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55005.patch
@@ -0,0 +1,36 @@
+From 75a044ff3d4b356a5a4c2100b907c3fadcd20ef5 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 7 Aug 2025 22:05:10 -0400
+Subject: [PATCH] CVE-2025-55005
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp
+
+CVE: CVE-2025-55005
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/b68bb6d3cfe472d5bd9329b4172e2e4f63d90a57]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/colorspace.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
+index baeeb43dd..e18009f30 100644
+--- a/MagickCore/colorspace.c
++++ b/MagickCore/colorspace.c
+@@ -2397,10 +2397,16 @@ static MagickBooleanType TransformsRGBImage(Image *image,
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 570d162fd4..690f3d27aa 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch \
            file://0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch \
            file://0001-CVE-2025-55004.patch \
+           file://0001-CVE-2025-55005.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

