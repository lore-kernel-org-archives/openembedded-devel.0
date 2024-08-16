Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B60C531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:22 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.142238.1723789161354266262
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VZA/WFfb;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c661e75ff6so1014513eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789160; x=1724393960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUy9eGs/gguty5lcHUP6TWA4bN6LJepIACsvxoc7nAM=;
        b=VZA/WFfb9UBkDbrBkcOEqryP2J08BqzZlvHeUkfgJjtw+gYmH0eZgua0alwBL99M/Q
         6eFzL0Klk2muSL2eXVsGIn9WfKZqP8yobQXIYKscBzDxdNAymQsT46WFiyMeBZGHaUVb
         5q70TI9MuhTa3ISGFUQF5XKw++dzszK3/wFvwnd/Lx3F1zkUgd2/F2QOluPk3PS1BBvq
         eT8H0U2T5gQBxxB5nIq44e/zl/vmW711IudPa+2Fb62oqpLTWEG+GWmy50mi5NAoU9M2
         V+vR2l4HkDLu3lGfvSV0uT4yCpYf3q03Gk1jfC1rHVYSgfHP8xJ0vNhS3mxjg/rWGc7Q
         WgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789160; x=1724393960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUy9eGs/gguty5lcHUP6TWA4bN6LJepIACsvxoc7nAM=;
        b=g598uUFwboqGW8n4sU7Ht8QSGf+oXQb54+dAPSDQpSHyA6JrwscHAd6Fy/W7SXM2Wc
         2/A37M5a3yGXVD5sFPj675nqR3Ku9podtGPxY83b/ujpyVlrp/RXrCkrnDtZ99AT/+lS
         zA2eLgerPzNXz4eZZZUC9SZ0u4MV1yovIGSpg+99GIPTzxxjTMnXZojjh4K8tHHPXbUU
         emjzgwrLv1tn1HUMeZfIcymfMSB4Gkvi+qxxr9YfNznOvNtMHyfQRGnTebhjAt/vSngY
         vriWf6dMej4Qhsdnj+VsjTRbwq85k719jT6VynYLCEShSBlb6hhaOlIzthDMeM93Wm9T
         sOyQ==
X-Gm-Message-State: AOJu0Yy/PprynYpWlY1XrcgwO/RKG+3Q24HmsQE43DyKRHLoGQXL9tVT
	1pG86+FtJVfVXttrpGMVPoO+hu1GCkfj+v69Q8JpsDuBwhqSJMZ8l2xueA==
X-Google-Smtp-Source: AGHT+IGGLF8TXcfjZ/hNbnaeHS+Kgc85LnAsLCrlf0mygqNNwkc5EOGPIJusOt4h6dnnhOjd4cJKnw==
X-Received: by 2002:a05:6870:b622:b0:260:fe28:70ba with SMTP id 586e51a60fabf-2701c3548ddmr2013264fac.1.1723789160390;
        Thu, 15 Aug 2024 23:19:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] botan: Make it reproducible
Date: Thu, 15 Aug 2024 23:19:12 -0700
Message-ID: <20240816061915.2095711-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816061915.2095711-1-raj.khem@gmail.com>
References: <20240816061915.2095711-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111831

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_3.5.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.5.0.bb b/meta-oe/recipes-crypto/botan/botan_3.5.0.bb
index d0e9d3e109..3a40680a45 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.5.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.5.0.bb
@@ -18,8 +18,8 @@ CPU:armv7ve = "armv7"
 
 do_configure() {
 	python3 ${S}/configure.py \
-	--prefix="${D}${exec_prefix}" \
-	--libdir="${D}${libdir}" \
+	--prefix="${exec_prefix}" \
+	--libdir="${libdir}" \
 	--cpu="${CPU}" \
 	--cc-bin="${CXX}" \
 	--cxxflags="${CXXFLAGS}" \
@@ -39,8 +39,8 @@ do_compile() {
 	oe_runmake
 }
 do_install() {
-	oe_runmake install
-	sed -i -e "s|${D}||g" ${D}${libdir}/pkgconfig/botan-3.pc
+	oe_runmake DESTDIR=${D} install
+	sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${D}${includedir}/botan-3/botan/build.h
 }
 
 PACKAGES += "${PN}-python3"

