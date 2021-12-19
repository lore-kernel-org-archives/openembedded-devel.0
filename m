Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418C2C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 08:48:07 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.14798.1639903686488346419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iOCefupg;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id f5so2598124edq.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kwo1lfneL+2kEILmz8Fr7b/cnQ5TZNMSNmgNDwZGju8=;
        b=iOCefupgie9zzkMDdJkVlqk1sACTPMbAizty5+K69FpNmamsV4Yuo3bHUQc7Zu6fHW
         7n0oGc6XQMpi06eRFNrZolpVSXuYytoNqQMJ//uxZ0OQbt0oAG3H2V4Ubre+59+YUY/Z
         KdLzox34SYlw9D4zkOBcLCs0za7nGTWpWTc3t4jvt4BMUx2Szh9L90mQXjrf/uaMLALr
         uXaVrcOKkKmMVUGzHLVNlUT7HDwOPidvHuMaTCvNzq9h+YlSQPJ7Q6+CouaWKpwdYNBd
         XhHw2fswNmhNfOc4P2gxahHvg3vShHIWSojfnkrPGODNHF3YDrGW/ufAg9IX25pXFZST
         +VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kwo1lfneL+2kEILmz8Fr7b/cnQ5TZNMSNmgNDwZGju8=;
        b=cWySRZWuPyj9XrfUzSJ3bgpwJRz/xreVL3SGNWFG42+e9bWTWcFvNGANLKyElbuBaM
         z7h9iOlQCrDSrj6s2ggIHhXw4uWOLw2bFCbpLFTIcC64vnAUdN/pPQVyyNnMCD4lBCBj
         VJld7EYP+eK4qXWowhZdVIbkntYrdiUCo2R9YYvpE1HWFW5SlhJ1hBXW/RqnW1Mi5aCk
         Dk7MRt1Av1Df9z1ctmok3JANzSYU5R0KGq2RLWwzyBCIo09tzsS/KwEZdf1untALx24O
         JQua1wO1TA/WOMijZLSuOZI/IXA2fLdvbklJL/6+E9edNPi6P7NPML1ucgMe6SX6oT4q
         TAoA==
X-Gm-Message-State: AOAM532ADxsFmtQk0w7ePaivVUNHo47wWVz6aBUxDMoWFFikCSn0QiS2
	q7BunNMIJ8jhF5VLolEqvShy9QFi3xM=
X-Google-Smtp-Source: 
 ABdhPJyRyv107DP2u85vA9Urbb9sarteh4H2/5OJdqdJ3vDSFchD8zIj/7PyfoKdaXi93OvLGYwUzA==
X-Received: by 2002:aa7:d741:: with SMTP id a1mr10688699eds.21.1639903684836;
        Sun, 19 Dec 2021 00:48:04 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 12sm4409951ejh.173.2021.12.19.00.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 00:48:04 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2 2/3] netdata: fixed some oelint-adv issues
 in the recipe.
Date: Sun, 19 Dec 2021 09:47:53 +0100
Message-Id: <20211219084754.2215526-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211219084754.2215526-1-jan.vermaete@gmail.com>
References: <20211219084754.2215526-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Dec 2021 08:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94441

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
index 7f99e9d4c..d479051c4 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
@@ -5,7 +5,9 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "https://github.com/${PN}/${PN}/releases/download/${PV}/${PN}-v${PV}.tar.gz"
+DEPENDS += "libuv openssl util-linux zlib "
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-v${PV}.tar.gz"
 SRC_URI[sha256sum] = "ac406513e86ad24976a66146702aeac960e43908abc51d70e4a073905275d13e"
 
 # default netdata.conf for netdata configuration
@@ -16,9 +18,7 @@ SRC_URI += "file://netdata.service"
 
 UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
 
-S = "${WORKDIR}/netdata-v${PV}"
-
-DEPENDS += "libuv openssl util-linux zlib "
+S = "${WORKDIR}/${BPN}-v${PV}"
 
 inherit pkgconfig autotools-brokensep useradd systemd
 
-- 
2.25.1


