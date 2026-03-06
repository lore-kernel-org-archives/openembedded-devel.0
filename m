Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56066FCB613
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70990.1772809569326165787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HU9l6QPY;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439ac15f35fso5971394f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809568; x=1773414368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IEreVc1AariqfEzRzV1NxN/iJ7fOBlHUNOCm79t5XQ=;
        b=HU9l6QPYCxVBcOXYPLLaAWPk1Qu+utCCwQZHrvLMJnLOrL8chaKlOyN+VuPozpF5wq
         vUTXSGo3JTq1LXgznOnRUyNyltGJd7CSkeKKzOZ11iQWb0w1wuL3lCRdfJIQ2AvlnqQg
         3sKc43Xh9gD6cQOGff2jYNW3R33s2WC5vYJakZp9w5rUZvCoxvNqx89naFeWX1wvnkvx
         nyjFCSRjO8oJCLzN55RiA8eSc2vCbQINu6M9AxrxxhhzL2Aj+pdINIeNvNHSqJoXtUaO
         OjLsEz1xTlZWYZvf84WzwaEybFTgB/FKYcTrPDJAzKongF3XL80LojHzHQav6O2bnMgE
         bpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809568; x=1773414368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IEreVc1AariqfEzRzV1NxN/iJ7fOBlHUNOCm79t5XQ=;
        b=n0ZsilPDSUx38dSj0E44nakr4fFIsPkVAN1FiBLN3Zo0ABUWf9zLg/MuAmNUN7aAuZ
         A8aXtJDXRT1i6/mcMl1wWR8b5BicRshTrttAm3ZBsnSzdlAwWxQMqOhS5smdSZ343eJ0
         VnuK2q+EQlODUqn8riaISXI5FLvRr11EWMSYi9XlEZGcREDhrFhP67zVKtkEs0C4aU4C
         JXBBfOZOShglUd2qdAVqWAsKYbr+iG9F4fBRMw1JNMyjx9hv3o4sIHH/fmNjFrn4YXTR
         0oZnQo+urw1MdQ6pMlDUvqH1AErP93/J2CWGLTLuN8hRrMrD9qsGx0vmZ/HUURed9oQc
         BSug==
X-Gm-Message-State: AOJu0YxQAMjlGHmjv03iYw3zfstPECwGWU614tHytC+qFwRtZ5hCmgUT
	ReLaEVc0lMZcvDI4JtIvChYXlmPwC+lispN3AREPr5FUowqUn03VOlxjoFn56g==
X-Gm-Gg: ATEYQzzrVZOZalENuf23VmmeRjisQzdOlzjw/FEaDvZWVLDJzl8YqQaQdcnnXeXsVzR
	Ns6QaG4UKDYMsG2xvecx9WA6FXS6o1ujI9uuDT8oZYEkmbbcGj/ZT2lmQg8niWwpfOO2X7FjUhI
	Dnp5SnGmU2og55kocsjKulyO10lBRo67LiGPk1KgVJTrYOSMsMKEqObsKJFno7dmyc84yjQSw9m
	i2GZdKwJJrmse41aGL1sm8X4tNiMILBmGgYRystSD4VxtKNjKISOVrkQwqFbMGKSKCS3rxtnAmf
	r5TuDIiv1WDa9RoH5c2Fc4MhnSXffErvxIitxC6fytw+wu/PZ0+3ucmu/IkDXA6rNPC+S0F5hdC
	9b84/64U75A/TE4pSUBgz15LDTlGAofUMvdbyZP7e932EcOwDzowTktN5x7dl+l8mLwBfn4Vabn
	tGzatsbJpQZPP1Bs0kZuiS
X-Received: by 2002:a05:600c:8b77:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-4852691c681mr41786525e9.3.1772809567550;
        Fri, 06 Mar 2026 07:06:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 06/11] imagemagick: patch CVE-2026-25638
Date: Fri,  6 Mar 2026 16:05:57 +0100
Message-ID: <20260306150602.616834-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124910

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25638

Backport the patch that references the related github advisory[1]
in its commit message.

Just a few commits later upstream decided to slightly change the same
line in a new commit[2] - this patch contains that change too.
(Though functionally they seem to do the same in this case:
the new version frees only one image, the original version was
freeing an image list, by calling the function from the new version
repeatedly).

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gxcx-qjqp-8vjw
[2]: https://github.com/ImageMagick/ImageMagick/commit/6a35526c7ce2b5dd690ded6c423b6eb6c0147967

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25638.patch          | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
new file mode 100644
index 0000000000..df019d9f6b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
@@ -0,0 +1,26 @@
+From 4a70293b882cd1bea92eab5eaa1951553109d636 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 22:06:12 +0100
+Subject: [PATCH] Fixed memory leak when writing MSL files
+ (GHSA-gxcx-qjqp-8vjw)
+
+CVE: CVE-2026-25638
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8517100d518bc99bd8c474f02f88 &&
+https://github.com/ImageMagick/ImageMagick/commit/6a35526c7ce2b5dd690ded6c423b6eb6c0147967]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/msl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index 53e3a95d1..bf764f0d5 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7887,6 +7887,7 @@ static MagickBooleanType WriteMSLImage(const ImageInfo *image_info,Image *image,
+     (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",image->filename);
+   msl_image=CloneImage(image,0,0,MagickTrue,exception);
+   status=ProcessMSLScript(image_info,&msl_image,exception);
++  msl_image=DestroyImage(msl_image);
+   return(status);
+ }
+ #endif
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 362ce24e59..4b5a7fbb14 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-24485.patch \
            file://CVE-2026-25576.patch \
            file://CVE-2026-25637.patch \
+           file://CVE-2026-25638.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

