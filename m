Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9AEC25B78
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 09:48:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.36003.1715939276712193733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=C9xgnQAM;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3535fdf5ab0so228852f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715939275; x=1716544075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wMv3Q+sqwHz9zK+aMPzRhkcRVmU6JLAyjMetPgxw1U=;
        b=C9xgnQAMGXZFWdpjPPH2E8oQryhRb6pZEnbkb2LGx4FVLyHQ5DWaUcnAm/kbq+NNMY
         wC2QKDh6MStcJiZgB6XSimRhmz4qK0MwH+BAWTsvcD6nc/J4Cnh5D7I8dc3G6x3sr5A5
         T+Kmn3yVEar/JjQ2BYr9MWDYskcq4mSRG0r4eXZmVjCiDa72p1kyxZ+/1C1apl2yBRIW
         vLeKMJ9IDhML7lWnLBOJcaF5nrI4W68gtiXsagCMEfEWmwrfDKlo2ERZbREpZC190TSB
         LLiEVqvrhpNaBEj177IlUnmrAFU3XT3YIpwZY6iVjuuSiaodQ9vKM6+5rBEYN+/EIlbl
         Kcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939275; x=1716544075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wMv3Q+sqwHz9zK+aMPzRhkcRVmU6JLAyjMetPgxw1U=;
        b=G2IXVei8f/PRGrqBV6AoNhwyejf3Bsuc+MpnkZT52a6DgW0K14SQ7qxHpEJCR8Wx0q
         M08VMZJx1miB25hwR5Jq4xNQjlsHL64wG3QfJ7j0A3WzvUwKY+xslg4VLz0x49PvRBVZ
         Xu6IYywTBKMWhhByuHbP1RPByst4jXlxEJM6AUrTxSvVqTaRIhaRVNMK2ukrIPHQv5dZ
         6U/l6xXrFzkLGjThPjBEjUswBUEFK5NWkiHpL4Zed4QCBBE8F23wm33o+8c2CFB5sGNU
         h65sMOg+MTVoFRVHesHylE6zjcyqpaV5MJ+5v8NbHTo9y/exNc+32OFIkTFjgbayGp51
         mIAg==
X-Gm-Message-State: AOJu0YxoCtGlF0yrqskJAbNaCIT9yTaLYN+jAHMC0/J3VPHFn/eQQ7s3
	rdSZ2FATm0kxDD4ommJ11JqZPIdsTTyOCQ3U7pAfIHwVxh/tda/4wv19EdWyK74C/OCm/e38JEB
	a
X-Google-Smtp-Source: AGHT+IHFOyEAt0WwKUNth6ogAWfnr1V+QO2IuBmOdK16ma5lqKI28X/q1ZpBEpwbrpYdwWTA4ZjlRg==
X-Received: by 2002:adf:eac5:0:b0:34d:9089:6bd0 with SMTP id ffacd0b85a97d-3504a73c31cmr13122952f8f.40.1715939275085;
        Fri, 17 May 2024 02:47:55 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm21047406f8f.98.2024.05.17.02.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:47:54 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/4] source-han-sans-tw-fonts: fix url
Date: Fri, 17 May 2024 11:46:59 +0200
Message-Id: <20240517094702.9246-2-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517094702.9246-1-alexandre.truong@smile.fr>
References: <20240517094702.9246-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 09:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110423

We get fetch errors from the SRC_URI provided. svn protocol was used
but it's deprecated. So, a http url will be passed instead.

The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index a2b3fff07..563bd6a47 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,13 +11,12 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/TW;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP} \
     file://44-source-han-sans-tw.conf \
 "
-SRC_URI[md5sum] = "6533b71b31c19e548768f0fc963202f3"
-SRC_URI[sha256sum] = "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb4bd4125b5af59fd0"
+SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
 
-S = "${WORKDIR}/SourceHanSansTW"
+S = "${WORKDIR}/${BP}"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-- 
2.34.1


