Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2700C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:44 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2398.1654283975268279673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J3p4GEE1;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id n10so8013109pjh.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gaCGu6cWjhawZupHUZeGjiaY9NvjwxDanfXoVXmCdes=;
        b=J3p4GEE1wldj39yhM7U2A5aqsF0r9CGfpF6p3vECv43JaJzlkoV9SerKcPLTgCjfNa
         19wzKLBuuaA4YUCvBpXMHeRY55wXMWFpZDQ9oDLc2VAMPzaxzB1uJXXKnwIxc2GjQLum
         4YxosQ5t8oXIlvXYexx3nK+aDARxycVQA3CDj3rDTVZg4pfG75MsJnTJkoY8RHBkxbPb
         LiUDxvAfGM75ySyekbAo4A1C42sQX/R0eYUXB+F+pH1gWosmMtm8C9eb6852GpTaVUJ/
         Jum6csI7yqAR2unwExAONfZ5WBFdcmCafoiDEp3E4jbBBaAuTSEqrhc4+bCwOvVTyGif
         EaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gaCGu6cWjhawZupHUZeGjiaY9NvjwxDanfXoVXmCdes=;
        b=agaMku1KS28HDnm/YccCDzqhaikefPbBlnb3w7cJiqnYuLEXnDA2Sgc/0eZ23GsO2B
         yBJpBce9sIzvyGyFsHc7z+Oth6x+BIu3YxiaiShqUQS9mCptEYENVfujTijwRUS4RhmJ
         fv+/Lari/GGPiRLd0X/hg5m1huyuIEWCF+g2EzC9ULz87X2CxWldyd6WiF/4RRrbKr2f
         lJ4M0TviUKE945v1XSHKhFTpLTsodjn+pYvyq+Qh3fvAvNWZzsYxW9qtNTh8BBMazbei
         2hAoH5oVxF4tZAV9vxLI4bwZ18Bu9u9sOMRwBqPBNbbyIeyleO+WpvJjAf/vJY4aCL3v
         3okg==
X-Gm-Message-State: AOAM530jSfeQh8STShjPJNR364SuCz/kdywedMvPx2m4ILdd0Z7Dmsjf
	46QYR/fArjoSGVlrdn+owizquT3ms84=
X-Google-Smtp-Source: 
 ABdhPJwIvIGPZsqR9Fu9BB+env+qQLA5t1KNCo5mH9l4I6GFN2dZAtbaqX+LwvxJopJ50Zh49WDPbQ==
X-Received: by 2002:a17:90b:3b4b:b0:1e8:434c:5ab1 with SMTP id
 ot11-20020a17090b3b4b00b001e8434c5ab1mr2622996pjb.129.1654283974429;
        Fri, 03 Jun 2022 12:19:34 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 08/20] libmtp: Add doxygen-native dependency in case
 documentation build is enabled in PACKAGECONFIG. This fixes a FTBFS due to
 missing dependency.
Date: Fri,  3 Jun 2022 12:17:07 -0700
Message-Id: 
 <ff3a018b2b66170a560d8373dbbef3f15ebba849.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97397

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9e6d16e6640d105ecf3470ab891598034c9ef33)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
index b4cbb792ce..3483db3c83 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF += " \
 "
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
-PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen"
+PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen,doxygen-native"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
 PACKAGECONFIG[mtpz] = "--enable-mtpz,--disable-mtpz,libgcrypt"
 
-- 
2.25.1


