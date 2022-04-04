Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C8BC35295
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.34785.1649076278865690630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ROAXGcun;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id bh17so19631009ejb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldtCoE1EOTYqJsWcRUZl5ViThXm2ep8Xfv5MGhmCWfQ=;
        b=ROAXGcuns3Uil0BzpMrDOTwOn2FBUhs0QZDVsSs5q/3l2sm7ecSKvK1Zrj3ggHJ7Mx
         NQOtlodop8Ff8c6u5jVP2tcL3QuQB6EH27Rv36WbCNFJVNvFfPxEtJhguB9lkaFeesZd
         mgchqybwLBaLmUjaGKXX3/zjb49GVA0A+DRslQszdzUeYHu7lraR9oVWvjHOWPCVk3FM
         GfFml/oqcon5bLhq4sQNEXtqIClak1jWkbwdGMHQXBrGvhWbsqGZlfjb439YPcCMzu4y
         fc/iKd1s/TpdaIirc3UZTtCGrywy0DAMhn2gPm80RRa82c2bzASek2FaQ+ZkCarLFmSt
         yXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldtCoE1EOTYqJsWcRUZl5ViThXm2ep8Xfv5MGhmCWfQ=;
        b=ZEVUdYXBl4lsf5Ok6wYucGKJs8l0t8TvwXGlBInV2LBfXuD0wWT8LPdpBXSxXYIw5m
         2rt8lyIquyuCncTyoGrrkbFlRQS5kcooKC66X4tnlXwhitzK2bHb8z4T1y9Hm8cyqfV0
         pvFvdEcDp6/nJ1H89H3iRZMKwF6EQyxBkwCkRwOPrsVyG7rmsDzsOIxdU8OPEkrxM/7h
         XFVqGg4cSY7PavF6ANcQEpAsww3jq1muoRACnPxYZrGPo7rU+IO3n4dbvCLS72JYzoUP
         h01CdAvXVk8Caij2SW7K3o1IOcvA6dTp9PR56+jb46nhKUbu5SvrnBugHJg8FztOmPeD
         /s7g==
X-Gm-Message-State: AOAM531i26lrE0U+WL2pw56z1X42ZAubcyacGPJWYxYplV9WpkR7Vu5T
	jY0gqi+YWff+crqvQn49yC4DrmSph5HmCTBp
X-Google-Smtp-Source: 
 ABdhPJx8kIi6aoUadnuhDcikDdfwQ5cq7XJZVsU+VUYzwiIzOPxAv+0EO8qoCRLShU3BX9e+eXQuqg==
X-Received: by 2002:a17:907:868a:b0:6e5:e35f:3b99 with SMTP id
 qa10-20020a170907868a00b006e5e35f3b99mr10061551ejc.33.1649076277166;
        Mon, 04 Apr 2022 05:44:37 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-52.retail.telecomitalia.it. [82.60.178.52])
        by smtp.gmail.com with ESMTPSA id
 b3-20020aa7d483000000b00419209d4c85sm5191459edr.66.2022.04.04.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 05:44:36 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-python][PATCH] python3-wxgtk4: add distro feature check to
 match dependency
Date: Mon,  4 Apr 2022 14:44:25 +0200
Message-Id: <20220404124425.42692-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96377

Add REQUIRED_DISTRO_FEATURE to match wxwidgets,
this fix build error (not buildable target) when x11 is not supported

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
index e61b00efa..dcb373a1f 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -4,6 +4,10 @@ HOMEPAGE = "http://www.wxpython.org"
 LICENSE = "WXwindows"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
 
+inherit features_check
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
+
 DEPENDS = "wxwidgets-native wxwidgets"
 
 PYPI_PACKAGE = "wxPython"
-- 
2.32.0


