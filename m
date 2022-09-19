Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0FBC6FA91
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.19192.1663590826487048450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WQA/ceg+;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id d1so21732273qvs.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=4YJAMHpKw6c/171FvdnLkoQWSm2I9XqhQvF1bLOmH8M=;
        b=WQA/ceg+dlxRfK0khPQujKnYq4Cc1HXWsmSTKfwt152PXvR3h6BOI4WjjUmG1OIglI
         2iyyFYfAoAllD+phT1nEW3X7mlJ37DhYDcbY4dLUGS/wWsVWNmgJxL83NB7S2g+8fZp8
         +85P06Fc15HX4PerCBpxEXw3zSABgIlni48rTxiU23b9BAQeqHP5nuGBIG7O8+xnuUTa
         QWBvcaG11oJPLH+znq2NDPPVqX553R6rwG8w26RDor8sH3ThG+mN+vsav4rGYjdOCmKw
         69cqaOx2zKCyvDD6EKuePJlghbJGlyKNpbOOHOSPZ8vN9OQ8rvZBPwFwe3gPLefm75qa
         axXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4YJAMHpKw6c/171FvdnLkoQWSm2I9XqhQvF1bLOmH8M=;
        b=b9dFzA73BIc3XEuaxyuHx4Cyy8A6AtkjvRnIkQdvy0Psf6ZNyffrOC0IGW4IwB6iZs
         dKxIOtlQkDE7Wa2q1TXDz6xS8EGs/HqeequS8PzI9MxJoiuXAd7F72Uu5nkOweejElYs
         0Hm1Jvv3+ojCptiZnvnKfBzhz7dbQgziBmMfvT6G9wza8SLYlLqOdNdH5n7DwAILN2sq
         k9dntY3KPnzOhC2VuR009WgXHKEnUpo+JRqBH8H+404ycIH7QdbRK4ioEX8IJwz7WXOC
         YS05TPpTpxD9gossEA9PKTApHsahqMyKELAGitAAoMK4Lk2pZDUNh/N1+6D+tVAzlCHx
         XaKQ==
X-Gm-Message-State: ACrzQf2O98z4PLVRyuiVijGKb1FMKr11juXBFauEjcRTZNSXq5pKvJPt
	kXX1rjM6bqWJZFKkA4I9bn9WjnDXiJI=
X-Google-Smtp-Source: 
 AMsMyM6UTMezD7fxGBSadgv5BKDfE9gRDcY7XYxES3qm/tQOmQK8qBunYA4NrPJupniKlB3Byolrvw==
X-Received: by 2002:a05:6214:411a:b0:4ac:9402:e7de with SMTP id
 kc26-20020a056214411a00b004ac9402e7demr14346883qvb.128.1663590830493;
        Mon, 19 Sep 2022 05:33:50 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 08/11] libldb: upgrade 2.3.3 -> 2.3.4
Date: Mon, 19 Sep 2022 08:33:35 -0400
Message-Id: 
 <02f2e6d762b660e12fd64dd1d638d7d43b2d5eb3.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98859

From: Yi Zhao <yi.zhao@windriver.com>

Required by samba 4.14.14.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1cd743f8d8053cc9d34cd1a0204d4d333722e0f5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb b/meta-networking/recipes-support/libldb/libldb_2.3.4.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.3.3.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.4.bb
index 6dd3ec3a9a..af5f0427d4 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.4.bb
@@ -32,8 +32,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "6824f69ea3bb58cb8a3be4c179e7569a"
-SRC_URI[sha256sum] = "9ef39700ff05b3e8f5801d2a39fe1ba023218650f81c9d377caca22f49076807"
+SRC_URI[md5sum] = "b01d6913a06901c22c5bc6caedc548ac"
+SRC_URI[sha256sum] = "f2e88dcab7b6007d92724b62f8a16e7c6e77275885c60eb4f87097e4aa4082c1"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


