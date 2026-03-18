Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746B210854D7
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:38 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9875.1773824976948815010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSZO1/NA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c65c87f73e3so330800a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824976; x=1774429776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf+aU9TE3L6/rND8V0BW45lk19qG/LkqR1i3SRGUwvE=;
        b=bSZO1/NAICTUMZkXrk2IgIaW98LJjSvFg44yzCUGewCJO/jA5YOGv69YausHKEa0UT
         o0zrrzVs6GFon0gNdPwxghCXcEhPgtiaPaREfvNpVVltnxYEKe2wvpzMsK30RWby7eCF
         BgCVlEFgpTeNQKPYVjWrh7omCAPml71yK9xqgLUAsOW0ZRwQV+sUnXUc9zZIGESh/uyM
         tdAu1x2jStqzqpjLzZ39KIh73cPvmSHTGWfx2+CZaFY76wFJq6Req4TRFuiO+4VBDXRv
         PLn9KkFIZn/Bu3nTT0t33TM/y8t0cMQASRMdc6m6d3fZa9wIfGg7+GuP+iwtBVhkkVAF
         Npqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824976; x=1774429776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qf+aU9TE3L6/rND8V0BW45lk19qG/LkqR1i3SRGUwvE=;
        b=dRXJYLrqHISfpThDBTfGEcC5oL88SVH1iffqFko2bkWurkb+5OtSpOctrvRYeQCVoM
         BaOoSUyBG0WkGdzglOnqtxJShP16fqKCuD1ZZp3IM86HToTaX+IrUOzm3cNWu2qYWBU7
         9uyw4zcCE/5UVAjAMGpal2TAPo5LdOnlpxvGWa94kEqMC852VJda3INYouHyps4X0cya
         XAegQjvozFUsqafz4de9vcVl39AurGGcYJ2FKoSPkHiAJaHnZrFP6buS2r4i2E7fASQe
         Xv7jpRnK0hjvHX+rIgDvwG4dBELsGWxjaGcGsQQiaO6p7k6PNnCe/LJfFxLSgTprNVD4
         1Fhw==
X-Gm-Message-State: AOJu0YwtqqrQS6BG1UbEAU/A7CmR7r+1YHysjhKX0mnGIQO/o4FgLqE6
	MgAfChmATbqekCUDDXSe9xcLdkvh3dGu4j5DOp2nCBvGGFh8lbEfW9sBI/B+6Q==
X-Gm-Gg: ATEYQzyNh3XaSh8GzXQQzoQ4g8pJfR379H8nkcMb69jOKjOCrFwQL4RqxSGZ4nhzryK
	DV3gzPnlSQHGY83K+Yb4VX74mfvIOoR405urJkOo0Rhc6NWqY5RkgvR0DRXW2ruL13p1xey2ht8
	Mqx6QNjdLjUYxA7+97fJGLKqP+8m9lz1OvM4FS/0myw03VWzm+evmtIEHi3jCFLS9VQdo4mm86f
	WT9FSqsb6mnoz+3wXFkiy/mxt503sO1Fz48eEm2V28HHYGQcHLPIvPfhVyxrdPX2egGi3Sb6DeO
	GzPu3UbNnTeXJAONFEtIsnRPudQ/yEBaUwR9hx04lCQZz4G5rwxzynAnMxzxPaSpQgY8EW/h+Zv
	SWWSs5Kh01LJZlJe1glO+qTSY+OjKSUn0lqUm+h9fprWRJUJQb6crXI2RgpaNpiz4T4LmLwiUA6
	HJzEDD7qDPKUl9slnXZBoHkzzVvxET2ZroZkUV278uCDY=
X-Received: by 2002:a05:6a21:6d98:b0:398:97dc:5546 with SMTP id adf61e73a8af0-39b99cb42aemr1701755637.2.1773824975993;
        Wed, 18 Mar 2026 02:09:35 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:35 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 4/6] imagemagick: Fix CVE-2026-22770
Date: Wed, 18 Mar 2026 14:43:36 +0530
Message-Id: <20260318091338.483937-4-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
References: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125357

Reference: https://github.com/ImageMagick/ImageMagick/commit/3e0330721020e0c5bb52e4b77c347527dd71658e

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2026-22770.patch    | 37 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch
new file mode 100644
index 0000000000..f370d3eec5
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch
@@ -0,0 +1,37 @@
+From 3e0330721020e0c5bb52e4b77c347527dd71658e Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 4 Jan 2026 15:26:48 +0100y
+
+Subject: [PATCH] imagemagick: Fix CVE-2026-22770
+CVE: CVE-2026-22770
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/3e0330721020e0c5bb52e4b77c347527dd71658e]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/MagickCore/effect.c b/MagickCore/effect.c
+index bfb1363..3a44240 100644
+--- a/MagickCore/effect.c
++++ b/MagickCore/effect.c
+@@ -880,16 +880,21 @@ static double **AcquireBilateralThreadSet(const size_t number_threads,
+   double
+     **weights;
+ 
++  size_t
++    count;
++
+   ssize_t
+     i;
+ 
++  if (HeapOverflowSanityCheckGetSize(height,sizeof(**weights),&count) != MagickFalse)
++    return((double **) NULL);
+   weights=(double **) AcquireQuantumMemory(number_threads+1,sizeof(*weights));
+   if (weights == (double **) NULL)
+     return((double **) NULL);
+-  (void) memset(weights,0,number_threads*sizeof(*weights));
++  (void) memset(weights,0,(number_threads+1)*sizeof(*weights));
+   for (i=0; i <= (ssize_t) number_threads; i++)
+   {
+-    weights[i]=(double *) AcquireQuantumMemory(width,height*sizeof(**weights));
++    weights[i]=(double *) AcquireQuantumMemory(width,count);
+     if (weights[i] == (double *) NULL)
+       return(DestroyBilateralThreadSet(number_threads,weights));
+   }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 1afc8bbe2c..e235b9eb89 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2025-43965.patch \
     file://CVE-2025-66628.patch \
     file://CVE-2025-68618.patch \
+    file://CVE-2026-22770.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


