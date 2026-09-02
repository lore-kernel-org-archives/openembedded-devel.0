Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A51C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:26 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9334.1788343520603711854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EtHC1O9s;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so979841a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343520; x=1788948320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6enS8Gjl5jR2WaReTZRQu4+oEFV7IviOs11sy0WnPw=;
        b=EtHC1O9sUMFWemWjRigy1Vi1XDoBMl1yEixQVHXeUsft1SkigSzSF+xfkdpZDaiI+J
         Wt4rqah+yWWvV/jIaZWOwip34epTdKA4PxYBC8bjNScHgsNFOfaOA6NpLlBj7nhxSdIL
         7pNEb8DLq5LvPK6+/4U+/DYEL6vz51yMP6J9X8HhCu4MsF22LG0vai55pjN85tZkPIxm
         u5gtw9m66d8ttLXzu4ZNNLW5xBrn49GSQd76Mwaq4EpYNzfh/udVdsgDo1y6BLjaNeVn
         V8nSk8kRcRqOhldVTonge8G5t7ki8nqGDZVhExz5ttigJuTyexh4/Wh4U1m9C5ifGXai
         J4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343520; x=1788948320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6enS8Gjl5jR2WaReTZRQu4+oEFV7IviOs11sy0WnPw=;
        b=Ac7va5ATV3JaBXdTfeArwvbMZUIgApmBEAOeObW8q86f7vO8Y5lgxX6ZJxmCKpGbJZ
         iuc5yBX+czArPveMbmlype04CJMj4U7IKupsSiiddyPXqpIFFwQy0sANB508s5se0AF+
         44WgeYIxl7baDFoLnblA6crsWeLtZxQ0IyAdG3vir0lobOQfn9KOtxJuRQTrJGEuAl+b
         DV/4PYAuBG8Ht5tcRhuyV8K6xijODk0lvq76Zr+owNR4/tKkUefKRhZxiAhqmCuFaiRC
         aL//AHUP/yrVFtYfEYGJcE6u1wxq8MvBH96cwTUxC49KXRwvMXkSNlGWt+syxHck55UA
         Cf1w==
X-Gm-Message-State: AFuF++nvKL3eX1Y+RFf4laMsxbntfk//j0s5G9jM6b/0g36Fr7gQZ77c
	Ssaja7SHVcK8tXZt83k18UEJRw6QMJ6QlF8TQlHE2eJaE9zFCdq6lUVGDKz0+ngG
X-Gm-Gg: AYBFou29fonTfU1y3OdEZlEaEtRf+73a2b/SLhmVQZePv/giO1B0nt9izugtoBN/HFB
	CLkn8U/5oMlftZuL0l/gAaXxXL9OfbyVyxqNTax2ATaJFoa7Xn24WQXISpgsH/8jk5meoCoQqFk
	rm6+MXpZJKhCAkWE0YGvE+hJGxHbmDUWg7DeM5gmoTkuWu+N+rva8oe8OVqpeny8deS2PvvaAIg
	aI5Bnz7ZXFvUoP2DyABBC9edN2QhKbkUxS7xxK8oSLc3Tfak40qAbMaD7kxtGeiNlVtx6OL/SGK
	xb0tcZrffk8Dzu2m8OwulsOqdnwucMq/Mu24+bJX/yTy+N1YoZDYT1OF5+Dh5GjP1unopSpmebW
	PnE3QQf43euYqtEQrwUJQxUQKOnDjHc2hVs3TJLX73qwSGnFTxzhfg4pNLBhh7C+RXC97p2dByR
	HILUAsMqG2DJZQ9CUXKl3tm2ZYkw3kmeKDRLxBPBUDvIxaP3b5onBCCmKkrkCIlTJuk+tS6GuLd
	KGR82APVIU=
X-Received: by 2002:a17:90a:da8d:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39af57d3181mr1559300a91.2.1788343519952;
        Wed, 02 Sep 2026 03:05:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/28] libmxml: upgrade 4.0.4 -> 4.0.5
Date: Wed,  2 Sep 2026 22:04:43 +1200
Message-ID: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129632

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7e505c34533b265a6da539126f4b25b9c6843f40)

Changelog:
https://github.com/michaelrsweet/mxml/releases/tag/v4.0.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb} (92%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
similarity index 92%
rename from meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
index d692774f08..01142f6f0d 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
-SRCREV = "0d5afc4278d7a336d554602b951c2979c3f8f296"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "18d5c7dd9c71ebc1d3f21fe1e0614300babdda84"
 
 # Package does not support out of tree builds.
 inherit autotools-brokensep

