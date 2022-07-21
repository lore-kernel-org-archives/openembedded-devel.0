Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D31C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 22:55:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.1765.1658444119606125635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 15:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HwiSDmqM;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id ku18so2896987pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtNaw9L+Ma1QuYulEBOECn1BkzE37i84Pf67GKQa09Y=;
        b=HwiSDmqMvI1XLHkdnn7wTWEjlVMem6MADwABTRWakiD2V6Ld8fRa1Isih+k4qgTJIt
         IoEDsW4Syr5PsDtMdVDJ/TYSLUbvdr238FNLWxx/Rdt2cYIQ3Y5a9IpFVJpnLvNVv+zh
         X9Wk7bFZEu0trYPxrSsyrdGR3g9Ql23KdopmepATPkgi7KARVF0BuvwBx8f8cNv9c7SN
         7B0sQBUEQ/dA0CqjB13lblCSnKykw7qWJ7HVoOYrGVCkt+jWqtWfY5bfqMTl/1zjt63Z
         NoUQcG3j5VZycDmGmlkPvCpFYr0E+DFfONtTbdd8oA3y6jac3H1hvGhwx6F8RIPzJUhN
         iN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtNaw9L+Ma1QuYulEBOECn1BkzE37i84Pf67GKQa09Y=;
        b=ecJzg87pxEQlpkak55mgapiTsL5zTpy47mdZ8pgmm5UTrxI6bzEsS4YhbulMOCi+QF
         ti+voJ9KSuFp352QsaNx0hgtBZ5Har8gfhxH83iEDyNBQh3lQBpQ1xPNmti2Khuwz5C9
         5x/M4Xe/JJUyTqx/E5sQ4l1GaiKykqY1d02HGXQZnzCcxOBW2yoIeJC7xkgvgJvweeBk
         rdUa2hWv1flUCuuHm+UnIW8El2aJP8WBUakwwUypHfyMAhbXXS/yilUHKHG2a9K6guIu
         4W4THh4Dp9n8i5CTd//fpNvqkcTVNiVDTTVo5XpXpcpgBCtugjKHpfZYZ4VIzoamn0PB
         y0pg==
X-Gm-Message-State: AJIora+ROioeQcw5MBuf3akmmoe+pBclZBbf8lm6gJyiEPLZkprvMJo8
	+Z3h88hP/otoySEdpDmisXXUsSupoaIXZQ==
X-Google-Smtp-Source: 
 AGRyM1sqFBPup8EXGj7B8NriKokq5tWEmFRDmz7Zhghb2HXBsGrbGzTKDYk0sXPeXXU8TrEQ1CxWkQ==
X-Received: by 2002:a17:90b:3841:b0:1ef:f0ac:de55 with SMTP id
 nl1-20020a17090b384100b001eff0acde55mr14134732pjb.35.1658444118726;
        Thu, 21 Jul 2022 15:55:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a17090ab90200b001f0097c2fb2sm1942651pjr.28.2022.07.21.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 15:55:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libmtp: Upgrade to 1.1.20
Date: Thu, 21 Jul 2022 15:55:15 -0700
Message-Id: <20220721225515.1699541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 22:55:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97923

Use github for downloading the release artifacts.
This has support for new devices

https://github.com/libmtp/libmtp/releases/tag/v1.1.20

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmtp/{libmtp_1.1.19.bb => libmtp_1.1.20.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.19.bb => libmtp_1.1.20.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
index 3483db3c83..f7a7507b8c 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
@@ -17,10 +17,9 @@ BBCLASSEXTEND = "native"
 DEPENDS = "libusb1 gettext-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch"
-
-SRC_URI[sha256sum] = "deb4af6f63f5e71215cfa7fb961795262920b4ec6cb4b627f55b30b18aa33228"
+SRC_URI[sha256sum] = "c9191dac2f5744cf402e08641610b271f73ac21a3c802734ec2cedb2c6bc56d0"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.37.1


