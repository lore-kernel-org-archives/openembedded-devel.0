Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505D1C25B7A
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 09:48:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.36007.1715939277980532323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 02:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=lHfL6hLQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-351d4909711so1209218f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715939276; x=1716544076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEBGvH2DdqHjOpI2QspWPIe6VFa55y6dQxkRiCkrS80=;
        b=lHfL6hLQ55h+S2iwCF2rp8OKtRfLcq6uwnGyG2IsFSV8Ll1/wzrHTQoJoWfgozqkpU
         IkYpjWTVL6rHeI7ipM7/+ubri736EHU3ZmFK7IkNBd0GqfA4bFEiGDlH6fKLqYz/i2dW
         mtQWPTi+Q2llW7VA8Jax4GucdTJMzhi8qeFfafR0DoZfc01X1x+IGEFY/kncOleW8mLe
         tY9ul5nNBWxbvkO930HSn31y5ODk5brK+xRzZuGTUIxhJ52tq03TpzPk2RyI5vP2WBpB
         AwOI0QMrWW4YuZj/VoiclqozQ0PhZ+vGg8V29mVU8w8BhhiEDR/YCXD6Xg4Fu8VwrMFE
         aqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939276; x=1716544076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEBGvH2DdqHjOpI2QspWPIe6VFa55y6dQxkRiCkrS80=;
        b=ol6fOBMXZ/fiss3GFj+RtTBat6unPujOzzpV71Tfx8Met5592RuG6oLGtdz7AoAkHZ
         Hs71Te8JvZ4qpFD0NRJOIVytNyhgzV9SElXEGuweQWci3LWdPuEAuGj/ngK8IHhpOJMH
         PwkSWb3Y7dkg/49jV5BCy4z9ppjiInhH9aiuHcrvOr+mtwjl0cOfVmZc4EGwRml7GRRL
         HqCBZeeFEb77bAMRmWRp0F6MU1VONY2WkBEBeY2leSY6f9jV4eq2X6dC/JJ2eLuYeBg2
         v4ui8CydLxwpBBoKU4QssYF3GGB2dl1Hwtyc2Z6onZt53dsWkLRShnGxGUZPcucBPs2F
         zeCw==
X-Gm-Message-State: AOJu0YysPjBAciihyO0XFb6A/HXNtGBkesiyw/pFaBddgQ5gLE9B1UPv
	oFdFiEV3ktVRf7PPs8eTM1nyFx4KSCo0j3/t1dFU/00ULQvYRLnAaViHh2cmuN6K95d0IMIG2th
	9
X-Google-Smtp-Source: AGHT+IEFAgCn/APALVz8rF3t389iaLkzBWq4/LP9hQxnzAOXoVQnH3/MSsrLQG6JXKR8EgydTn9GkQ==
X-Received: by 2002:a5d:6e0b:0:b0:34c:cae0:c989 with SMTP id ffacd0b85a97d-35049bbf662mr19058586f8f.33.1715939276532;
        Fri, 17 May 2024 02:47:56 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm21047406f8f.98.2024.05.17.02.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:47:56 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 4/4] source-han-sans-kr-fonts: fix url
Date: Fri, 17 May 2024 11:47:02 +0200
Message-Id: <20240517094702.9246-5-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517094702.9246-1-alexandre.truong@smile.fr>
References: <20240517094702.9246-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 09:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110427

We get fetch errors from the SRC_URI provided. svn protocol was used
but it's deprecated. So, a http url will be passed instead.

The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index 5ab5057d8..9d8460664 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,13 +11,12 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/TW;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP} \
     file://44-source-han-sans-kr.conf \
 "
-SRC_URI[md5sum] = "f8d1bd6c87d8575afdb25e2f46bd81d4"
-SRC_URI[sha256sum] = "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb17d5b10d4b4b0e6af"
+SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
 
-S = "${WORKDIR}/SourceHanSansKR"
+S = "${WORKDIR}/${BP}"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-- 
2.34.1


