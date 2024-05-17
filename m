Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D761C41513
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 09:48:04 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.36582.1715939277322069067
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=vNlqQgqa;
 spf=pass (domain: smile.fr, ip: 209.85.208.182, mailfrom: alexandre.truong@smile.fr)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so4307301fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715939275; x=1716544075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKsu2LYHyYrvaLzY5hfHcPxtyuBWip2bzMINfysTTvQ=;
        b=vNlqQgqaTtkyjTA4DIZcJFGVXGZI/3noBeLtjmAjR2nBoY36LwgFrCAX+OUovAkDN8
         8GpK02e+otHwasEBy3U11R0CZvyHTFxv0CJhuOgT6k0B4jZPXtyxr+OTMlTMq1qUShGA
         rpkotS8HGRXdebmsnY8YxBpu7hz8UDsDwXC4wdQ6SB5MtuWYvHMLOeM/D3jKn1ugC9Oo
         Fuiy/VqBZotXoESDaB7KbkYOn/FQ0ZHnDCMi886A+ew7o51LzkF3Rmk2gjtbdSe///dZ
         twHfyqrmnmz/0l0CAs6Xj1WdMIjZ8Y5GTlQAglCLoJk4kJ5FSx0LNBVeSt+dGDVnNw04
         XWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939275; x=1716544075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKsu2LYHyYrvaLzY5hfHcPxtyuBWip2bzMINfysTTvQ=;
        b=KzflX8vcx680Ajj2wRe4QxlDk/UMjMU+YqCuPFRnGE2ldURI0RhQcAR7XZuXmGNe3U
         +qGz39ordroLTUpHW0entjwTykSGJHav1JuQRlYeNfL62AHtyQv+MMMQeD3S3D1myEka
         9Rz9s2WDjue+R3Amegz2cVfyoUTjDkJ2zk+cU5tSWjmp0MGSd3FvF8h9N/1XUbYMR8+s
         QzCEZ5Gn2dX6RNw3osz3yUfFpENA139LArrZB+htj3qeLuN54wdL9ASjCrrU/mWockNW
         fpncSVrI6mD55FvuYc5D/ZRZGpVozBLwyeEzOaIB699K9OhgpzECA7ETOb3gugKz4KVd
         QWPg==
X-Gm-Message-State: AOJu0Ywb3Pw7rBtnvyCDRgk8rypHgDylXPEpwWZdROo7Kfb48JxXNWpJ
	NZ7oGoLNXcIuvQNUPff5P6gwHAwoJ8VPjN15JgLM9fYSo+DtxPJ7ACxNwGP+dDt1fl63ZlAwnP2
	7
X-Google-Smtp-Source: AGHT+IHC29+WnGrVsG7VCEk9glFtihGSKkWn1WqedcR732nHRcGF4oG3w8uFxGshgtTaXBmCA0ki9A==
X-Received: by 2002:a2e:b618:0:b0:2da:50f8:dfab with SMTP id 38308e7fff4ca-2e51fd4a80bmr132410001fa.7.1715939275529;
        Fri, 17 May 2024 02:47:55 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm21047406f8f.98.2024.05.17.02.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:47:55 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/4] source-han-sans-jp-fonts: fix url
Date: Fri, 17 May 2024 11:47:00 +0200
Message-Id: <20240517094702.9246-3-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517094702.9246-1-alexandre.truong@smile.fr>
References: <20240517094702.9246-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 09:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110425

We get fetch errors from the SRC_URI provided. svn protocol was used
but it's deprecated. So, a http url will be passed instead.

The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index 6a4509048..8a2caa44b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,13 +11,12 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/JP;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP} \
     file://44-source-han-sans-jp.conf \
 "
-SRC_URI[md5sum] = "908fbf97f3df04a6838708c093f1e900"
-SRC_URI[sha256sum] = "dc6dbae3fba35f220bac88ba7130b826c7efe1282f472788fae3628b79be3f54"
+SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
 
-S = "${WORKDIR}/SourceHanSansJP"
+S = "${WORKDIR}/${BP}"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-- 
2.34.1


