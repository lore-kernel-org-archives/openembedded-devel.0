Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22381C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 09:48:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.36006.1715939277573329517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bUexmGAt;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3535fdf5ab0so228858f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715939276; x=1716544076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDZ/Ki9lVIIlsNVxdQ49MOadPfTEO5gB6xWzpmDh+GQ=;
        b=bUexmGAtCvuQKGbBy4as+wj4YgapHjjYh7OEbzKmKniavl8A+LkgOS1N4Url1e5/Of
         XoNj0Dy8s7YJtl8PH9wi5Wn8ajEUabPQhADilGoelLqRn8LnupDrucA2epg+I9FGWJ23
         NDlvfJ6Ls14dbVUcrfqFtQMKWU3/QFhlQRmczyz0Hi9AHbXBTssZ86jChH6uNcCdYZLg
         u07cJmVKY35Qlhr6ZiyhY2Ry7Si6Y3xw+sQ/F5a3rrZm+UwIogOq+KJ9Pwh24k9/jYDd
         E9nXOnSfRFiFHnACnQEnJjGR0d1eAD7lVzUX/4Qe675fdkNEaI0DRamkwWuvR/olbsFH
         2zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939276; x=1716544076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDZ/Ki9lVIIlsNVxdQ49MOadPfTEO5gB6xWzpmDh+GQ=;
        b=F5hn42wRxGhIy1i/sylFrt7j3AkVGrVayCkU4IJ33cm1GmpmZdlWE+yFnpWGnp6Iyx
         AfULLk4uUK1z+4zdyJFb5DC/76oUYKz65Ht/3ZQ+O7CuIQCnmk1FtgcMRXiJg/gVJUm2
         1iv9lvdbLhTbHLr0aJO7net+i/N0J5ha218GjUxOZ+hpnzmOzUfsQCxH4FyvzzIrJcS8
         fnhwxOAUYRsAKGKetd4EnWMovA4EF0UWWZZB2J4ixPFe1xRSBmVnFBS8PoaJXKVvm5AM
         /Ij4+t7VQgxLhCoFNq/iWsmlc1mbNfnCPitPh/5eQr1cs07c6BE/wDvuvGTiBYwdhXmK
         DcAw==
X-Gm-Message-State: AOJu0YxwD2Y0w+mcrmL4D8kLoaryYxx1Q9x1A0oBEA+M0E5OY75BU52H
	44YEt8xSred4FcqpwROQV2w8KBRSO2L0Xh+TYkfu8rzx4raUBc0s+h2Z97yKIk7je2/PyN0ldcc
	I
X-Google-Smtp-Source: AGHT+IGZqHqkuNQsRezWp1eGTe34Mm/9mxahGgNQbSkU27EuDv2z96fTTXkA3/05rn9gH2O/qwoZ8A==
X-Received: by 2002:a5d:4b0f:0:b0:346:bc1b:4efa with SMTP id ffacd0b85a97d-3504a73bc7dmr16218729f8f.32.1715939276011;
        Fri, 17 May 2024 02:47:56 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm21047406f8f.98.2024.05.17.02.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:47:55 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 3/4] source-han-sans-cn-fonts: fix url
Date: Fri, 17 May 2024 11:47:01 +0200
Message-Id: <20240517094702.9246-4-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517094702.9246-1-alexandre.truong@smile.fr>
References: <20240517094702.9246-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 09:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110426

We get fetch errors from the SRC_URI provided. svn protocol was used
but it's deprecated. So, a http url will be passed instead.

The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index b4a598527..981d0d3c0 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,13 +11,12 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/CN;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP} \
     file://44-source-han-sans-cn.conf \
 "
-SRC_URI[md5sum] = "d16abc21f6575bb08894efedbed484a2"
-SRC_URI[sha256sum] = "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb66f7435e5b39734a4f"
+SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
 
-S = "${WORKDIR}/SourceHanSansCN"
+S = "${WORKDIR}/${BP}"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-- 
2.34.1


