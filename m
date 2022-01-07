Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0495DC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 12:27:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5694.1641558426487408074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=0hjuoitr;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id w20so10751210wra.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cy9Ar8raI6vO6XLjwG9cklbE2qHkUg6u+3dwJy+GIdk=;
        b=0hjuoitrYyvoU0XAfOdB8xUTZmbSfdpl93J+Wqc7QBkJ2OL0huP/5Y294UQ5qyspFi
         dCxBOjgEM4cLta2WOvSawgEtEngoU590IGo0n7ymCRoaZz5H1nObk08SBjBrW9hoWsxt
         hcLGvxknQ8kiqEKJIcZSjGNFl+//LxDNVUm6eJ6hEMAToXC5BaBQFr4WtzK/owJYs+u4
         u5YrtAzU5IK160u6neDcBd/+7TK5SbNpwuEjxPIpAUnNWq8+SlboK6hjFizX6lZ/NOfJ
         IS5kKEBoGv5aznhCYegg06nWRSycblexGfVXM7sZba4HQd/xP8TDMnIPNDBfSKFXZsk1
         AUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cy9Ar8raI6vO6XLjwG9cklbE2qHkUg6u+3dwJy+GIdk=;
        b=u90Rhr2F+8LO6dF2LwhP+Nkipho2ecZqkqjry6ZRqOXiCbC1bL3nwRye0NQk8MwQob
         qsFWWwbHgd2pUGkd1M0zjJtPvhD782cJ6PgxpJJA/oapTdQ58gTFSgpKrWV0/NAX/OiV
         b254ZpblJZxmRJs4uXclmxP1K7sSbFyvFZLmValOmpjKPrkZnbF/DfYAmxLoXLGS9Mms
         VE1nV5bO9TvzDiL7RCOUmrYRg5zh5Da7o/zhsWEJCS8RHw70Dk07xNGG21wa+XNY49Yd
         sQyAsZPNHc7FrxzAAYycUCgNyd8sOojGu9mswKZ8AmlG11YhLElPLqmRJHz1HDXFeB8F
         7gLQ==
X-Gm-Message-State: AOAM533ALJuWHatMPOwHXPnGiKl8ahuPX73xLcnl+KoT3IomT0l3kC0r
	HlJ7G2Oi8+3bZPwiWafvkE/PwA==
X-Google-Smtp-Source: 
 ABdhPJwBgkNYHxDIUWvWLrNO/lpU8+6Ar/wxd/7XNAL32oP2q1C3HLe0MRDZqFoJF4xSDt40mVnlyw==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr54086546wrf.510.1641558424421;
        Fri, 07 Jan 2022 04:27:04 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 o29sm2562860wms.3.2022.01.07.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 04:27:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-zeroconf: bump version 0.36.13 -> 0.38.1
Date: Fri,  7 Jan 2022 13:27:01 +0100
Message-Id: <20220107122702.614365-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 12:27:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94685

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
index ccab7fe4c..c49782e42 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "196fa1bd6e166f0333e3e9fff076f9991bf2719c4788287eaec577c241ef96bf"
+SRC_URI[sha256sum] = "10c501b25d8881b656e56c34674d98fe6bc752240a572e74f918bc849c93ba9c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


