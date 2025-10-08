Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7329DCCD187
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2624.1759957161396363251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpDmne74;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4c89df6145so35877966b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957160; x=1760561960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjPHDtJUmXgO7dK7k+jJSlp5pXbDICRFkkvqgqRGtS0=;
        b=mpDmne742oZ5BXjxB4pvkqAFZrQnhYwpkvipLBRzskQoCzhfzc11VxZFM23REn9DWQ
         pBQVZFfnU6F5nsKm4WUTSXVJTCYJQnY6+yHlNMwAx0wkgdHAxXimZpJf/9+5rCdn/qJc
         vUeENibNyN9VhbOEOMrs/AVy22llf+9XPbzCPC1X6J4zyrgEyl6HmjKjk2ch9BNdcl91
         tH8RQ6jBtcVJL6FbdcQvcXVxR/gWtAwQCBnfqHKNEyfhNDDT3Bsn9bYNo5PKLO9pQhzw
         3oOjMC+1CRoot6hKA0/N1R5Y67cjA7maYpYiyl0uCv82MZAF9UhEOAxYLXystVyDljv7
         38Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957160; x=1760561960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjPHDtJUmXgO7dK7k+jJSlp5pXbDICRFkkvqgqRGtS0=;
        b=W7XN0nfD1PV0nd2bp1wforazkJjLPmB99jFXoPLR0eSAmC65k0R3hHsBx2UX0sTLnA
         eL6I0kUhCOVuOAygnwS/Qo6RhiTEgHkn2Y69zvCvRkJeY8pyVjGOLnHoh559yhUr7Gjf
         aCGajqHKqflXJkpeg6g5uAQaFSLBcyE8W1kQi/I3cejIWRyPPT31XONOCd7k5PLvDLAw
         p0gTJszf6dxgolHZxFVYci2Lxw1OaTuxwjBoEDNUC0g7ruCKhbz7i1Cndp4Qi/gx4XNu
         gbr2SSN43497hJTnidwlbMgpgjjqwCNWjg+0Ff5/pzya8I4XrtbySsI42PcLrtDWav/F
         oaBg==
X-Gm-Message-State: AOJu0YyQycZquyWM7KiehhnZuf8nbrtcJdVm8Om5St86SMoYIzvrHIRB
	ga7CDPPn549uBg/V9S7VLMjxJ1iHDKgzRzAz8jeD/DQsW1Y29I9CZPtnLyyQmvAe
X-Gm-Gg: ASbGnctX83nKCSfPLdmADMtZ5Rl6g5vUsM8BeJyAumBAZFy49Mk5U7vM7wzYeucCb1y
	GSS9i71qQdaEXQ91N4fPSaWrVB3iQfHXfETqPeCHHpX9J/IvoJDFHqXSGVDa42W/fr4kcDoKNXi
	foh5uuAvobChSE2FVM84ys4tIg4leSSMKPGfYJKZxEDWVwPjSm/ZeaE2rKQx1ufczojgiz0QEbT
	vBMNKHb3si0TbN+VIyKIO9g0sKSfa4JzRwCe5olfsV0QHvmKiuzOFXsZ5ZRzu+mYhKzofHNuESQ
	rITpaWLDE7R+AdG8mN4pbmfrej1NeNWR51DziFTZVdnJJEYdqrUJjSNqprY3+ABD462LLdzMowz
	XzsN3jzzvUarUmfHk2cqOLwQtuSJ92paoMscZ4hgDgpG814cHvY4Tz9Y=
X-Google-Smtp-Source: AGHT+IHgcBSHdLibgKJ+QkiPwTTGGlO52JM3eEfX09nlQ1q4Zoitamb6CgY+/HzGA34nQ7AvRHM1Dw==
X-Received: by 2002:a17:907:3d89:b0:b3e:f89e:9840 with SMTP id a640c23a62f3a-b50aa9a1e57mr522384766b.20.1759957159581;
        Wed, 08 Oct 2025 13:59:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 07/11] imagemagick: patch CVE-2025-55154
Date: Wed,  8 Oct 2025 22:59:10 +0200
Message-ID: <20251008205914.598660-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120390

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55154

Pick the commit that mentions the related github advisory in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-55154.patch     | 80 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55154.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55154.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55154.patch
new file mode 100644
index 0000000000..9092d58d55
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55154.patch
@@ -0,0 +1,80 @@
+From ed4ceb060ceb72daeb931c639ae36d10c48b4b83 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 9 Aug 2025 08:28:23 -0400
+Subject: [PATCH] CVE-2025-55154
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qp29-wxp5-wh82
+
+CVE: CVE-2025-55154
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/db986e4782e9f6cc42a0e50151dc4fe43641b337]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/png.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index 9594623e3..46a6720b1 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -6392,19 +6392,19 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+               mng_info->magn_methy = 1;
+             if (mng_info->magn_methx == 1)
+               {
+-                magnified_width=mng_info->magn_ml;
++                magnified_width=(size_t) mng_info->magn_ml;
+ 
+                 if (image->columns > 1)
+                    magnified_width += mng_info->magn_mr;
+ 
+                 if (image->columns > 2)
+-                   magnified_width += (png_uint_32)
++                   magnified_width += (size_t)
+                       ((image->columns-2)*(mng_info->magn_mx));
+               }
+ 
+             else
+               {
+-                magnified_width=(png_uint_32) image->columns;
++                magnified_width=(size_t) image->columns;
+ 
+                 if (image->columns > 1)
+                    magnified_width += mng_info->magn_ml-1;
+@@ -6413,25 +6413,25 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+                    magnified_width += mng_info->magn_mr-1;
+ 
+                 if (image->columns > 3)
+-                   magnified_width += (png_uint_32)
++                   magnified_width += (size_t)
+                       ((image->columns-3)*(mng_info->magn_mx-1));
+               }
+ 
+             if (mng_info->magn_methy == 1)
+               {
+-                magnified_height=mng_info->magn_mt;
++                magnified_height=(size_t) mng_info->magn_mt;
+ 
+                 if (image->rows > 1)
+                    magnified_height += mng_info->magn_mb;
+ 
+                 if (image->rows > 2)
+-                   magnified_height += (png_uint_32)
++                   magnified_height += (size_t)
+                       ((image->rows-2)*(mng_info->magn_my));
+               }
+ 
+             else
+               {
+-                magnified_height=(png_uint_32) image->rows;
++                magnified_height=(size_t) image->rows;
+ 
+                 if (image->rows > 1)
+                    magnified_height += mng_info->magn_mt-1;
+@@ -6440,7 +6440,7 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+                    magnified_height += mng_info->magn_mb-1;
+ 
+                 if (image->rows > 3)
+-                   magnified_height += (png_uint_32)
++                   magnified_height += (size_t)
+                       ((image->rows-3)*(mng_info->magn_my-1));
+               }
+ 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 690f3d27aa..cca4c8ff1b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch \
            file://0001-CVE-2025-55004.patch \
            file://0001-CVE-2025-55005.patch \
+           file://0001-CVE-2025-55154.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

