Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89463EC8741
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 16:22:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17657.1694103760149797924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 09:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bb506j15;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4018af1038cso12361775e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694103758; x=1694708558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIvR+ySyZJE+4vdMqifMThA9ZNiafgP7bTA9/cwpptA=;
        b=bb506j15u72gRUDObXTd+yJhTDfTq+hPYSu9g6oUYElLu2B2H5oC7DeUwZTclPjB+K
         iL1TmsvAsdP/0eoz+r31vAjnozOn/cloFpUty/xDX7k1gla/+DY8e/W7eAxkDYYFmMwB
         aZokPIyfAf6/ev/eLewRTmdUeUD/iMnym9IvaBh9bNsuJh7cXUakLlYZYkf0rDL7BZyJ
         4V9wt8TSCZ+R5ZoFgsMeM+QgxX7AguG3Bx1hivklPcCExKbeTwJSW6ALMkAZ7kk2CHpT
         RRfifCNtPAs4A0jRJRgWxaNiMDBFy2vaT6p5f/vZHm6FUcx6rvR32S9+YbUSJabq3Zlu
         TLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103758; x=1694708558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIvR+ySyZJE+4vdMqifMThA9ZNiafgP7bTA9/cwpptA=;
        b=XyJb8RPXTo1sywJ1I6m/7WaJIAzYqsZmy9CvT6O3mKsJ9SYhiGVh6IsiM36Jp3bG7i
         gVxz59Fxwe+DKrhuW3766kkUXhWNONzzt2wzWdmbWnOug715wKZmnvaTP3rofH5aOci5
         Kj1T0YiRb2Sx33Oeg6rsYe66W4TvAdZ130XVj3IzM/qyOLpntJCOdNNQzRzrsW65B7kS
         Hd4VqBxm6xi08h0yh3+vh50M1964lAiHBy2Eo8sv0sj5mJc2a+ARkTg+K157kH3U7vIx
         YOVgj5MwK81jP/Wn6hnoZYpg2He08Jy57ae7HvEZ/teTQndPiOSzRiUFfqQZ1OO42EQY
         i6mw==
X-Gm-Message-State: AOJu0Yx78mh8INeNsIi42ht9yT4ucgRc5hAP2DF0lVJpZ5ytSZq/YIvh
	cGAPMSmAXP5FGVNRSM/YIwzTcGN54NE=
X-Google-Smtp-Source: AGHT+IGlhaBETvTUJcWumgE1l2RDvDGEwwL8vUSgWiBuoi1TchfTtYNApyFcN+bobSfd/Txz5Xg7oA==
X-Received: by 2002:adf:ce04:0:b0:315:9676:c360 with SMTP id p4-20020adfce04000000b003159676c360mr5280008wrn.25.1694103758032;
        Thu, 07 Sep 2023 09:22:38 -0700 (PDT)
Received: from localhost.localdomain ([5.13.223.14])
        by smtp.gmail.com with ESMTPSA id d3-20020adfef83000000b0031c6ae19e27sm23665277wro.99.2023.09.07.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:22:37 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.4.0 -> 3.4.1
Date: Thu,  7 Sep 2023 19:22:24 +0300
Message-Id: <20230907162224.234564-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 16:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104793

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 2 +-
 ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 2 +-
 .../mbedtls/{mbedtls_3.4.0.bb => mbedtls_3.4.1.bb}              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.0.bb => mbedtls_3.4.1.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
index d98d8fa57..44d74754c 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
@@ -8,7 +8,7 @@ Building mbedtls with different aarch64 tuning variations revealed
 that we should use the crypto extensions without forcing a particular
 architecture version or core, as that can create issues.
 
-Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/7834]
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/471a975942dec76bf0ccb92b6c6da055385683fb]
 
 Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
 ---
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
index 4775c8ddb..c8f6cb750 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
@@ -9,7 +9,7 @@ the needed instructions instead of the broad crypto feature.
 
 E.g.: https://github.com/llvm/llvm-project/issues/61645
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa4f6219014d863bed51453e5261178adc66be34]
 
 Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
 ---
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
index 10fb7de8c..a6f8583b2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
+SRCREV = "72718dd87e087215ce9155a826ee5a66cfbe9631"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
 	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
 	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
-- 
2.25.1


