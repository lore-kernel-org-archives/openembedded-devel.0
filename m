Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFB9FCB60B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71229.1772809566288071891
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X2/2zLRB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so2047325e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809565; x=1773414365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSJ6YBJrsa5GqzQdKp1N+CQSCQz6YEVjHgSzmB++ih4=;
        b=X2/2zLRBonDlrAm1styiZaSenkvZbOTnruKtWvNgvTFaXSNAJz2ewhDD8LQJyuY2Sa
         GWzaP/0DHyEzTPnDPRUbYJbHJyhi3f0kCcg/WA20Nb5BHysMEgDtbRJsyUGqyxE5yle9
         pyLwpNAyg7I+t0eHpj7c1JM4IxIpkcSYyuBgrFlYfMakpk4jTSfo6a3Ndm9mXTUGFqRA
         Tf9NyU87xneBhhx4vY+vQ/EJZHUKZhraBV2jiMwfYAlXQlGjl9IHZH4nYePNRvWwAf7q
         AudPIILg/NospQ73xgJwhMthqJg3l8xNoLPZiAktFPkn2ghoBfPINWs5onl7LslNc1j6
         f9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809565; x=1773414365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSJ6YBJrsa5GqzQdKp1N+CQSCQz6YEVjHgSzmB++ih4=;
        b=Si6u2nyR3Pua//kzILRu+i7xcw62xDYHaTg8UdLdi/ljnczAnL931BCUuXGKdXQQUu
         AF05El1wowRgfwI/BJceQy4nP0EaY38HcBoOzGDOthul+7JIWtB6CwNPauXgggtVzwsw
         1K5RNr9oNDZxUJqB76HuO7L0Lrj++y8kQnWuYZQb0/oiDflpYAklr9XU4zxQhQtcsbBf
         nw3trG9pB6s2PMNfIGQi8jno3J9bMwmANAVT+tW8VmkiQk4/d1q+kP3FrPpt4RwXfxhb
         k2cC/yHUNp11SpJoHcFESicxjc+xyaxVM8xPmFSMbp7OllqzS8aPxZ1mdY1ECRWTAAFm
         XHNQ==
X-Gm-Message-State: AOJu0YyitW3SF/S6+hqs+7yNsXb30TfqShE3ABgXQUY3a7YU2C7Nl1gB
	rrK2AphFUHc/9XVbA7Y6wHRobR6BYE8Jub8t2JkaH4loSo9bPhv79oOCRwI4gg==
X-Gm-Gg: ATEYQzyUeyKYei87dHFum72hqFWjAqdCoggpUI470na74cxYDioPWGndzg+LF76yQ9i
	TkRNCe9E82rxexCQBA+33c3FwKXDXlg22qgcbhWX0mhXonpwrW58U5Cw0lSlD7Mkp19Vu+VX5/J
	al5U8p8E3FtwGC/l8qQqthwq7I+EoCgcPnCew/AGfBIaLH+LoNn9tNAqhU5fII+yjT0BL8m0Ttk
	lItUgeutW246vfz3Ip4ifM6eNeCYN4qZDr4xry9i/aK4EcfdBx1QWoZuin49qdis0J/KLElINw6
	hrzEmrvWP4yDvE2+G513n2MBjAOv1QybJKBP9/jZkYRVD1zhoVx4tCK82R/srouBEPpa1MfTCK0
	QrI6DRCcA/YqzfXhBjVCLq0A/miY8s9vRajHUFjdYTTMpJLdEwSC+V0RFruVb0YH7PBYzKCYwP0
	ogsNWKn/iif9Hu4YG/ntku
X-Received: by 2002:a05:600c:3e86:b0:483:8f0f:36fe with SMTP id 5b1f17b1804b1-48526919615mr41251075e9.1.1772809564561;
        Fri, 06 Mar 2026 07:06:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 02/11] imagemagick: patch CVE-2026-24484
Date: Fri,  6 Mar 2026 16:05:53 +0100
Message-ID: <20260306150602.616834-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124906

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24484

Backport the commit referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-24484.patch          | 27 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24484.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24484.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24484.patch
new file mode 100644
index 0000000000..b3e094f7c2
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24484.patch
@@ -0,0 +1,27 @@
+From fd210bafa27b174f3054e7ec6da4c8cadbd75565 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 23 Jan 2026 20:27:02 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-wg3g-gvx5-2pmv
+
+CVE: CVE-2026-24484
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/0349df6d43d633bd61bb582d1e1e87d6332de32a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/svg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/coders/svg.c b/coders/svg.c
+index f18f86460..2f8a27ebc 100644
+--- a/coders/svg.c
++++ b/coders/svg.c
+@@ -4235,6 +4235,9 @@ static MagickBooleanType WriteSVGImage(const ImageInfo *image_info,Image *image,
+             if (LocaleCompare("graphic-context",token) == 0)
+               {
+                 n++;
++                if (n == MagickMaxRecursionDepth)
++                  ThrowWriterException(DrawError,
++                    "VectorGraphicsNestedTooDeeply");
+                 if (active)
+                   {
+                     AffineToTransform(image,&affine);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index adf65880b6..991b2e363d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://run-ptest \
            file://imagemagick-ptest.sh \
            file://CVE-2026-24481.patch \
+           file://CVE-2026-24484.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

