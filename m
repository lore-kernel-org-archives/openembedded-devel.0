Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2FAEB64DA
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 00:25:36 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.10807.1688603131056926745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 17:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dL669Fxi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5577900c06bso142998a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688603130; x=1691195130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSaSYdLwB+MakDeA8/mi9vbhmcHZHfmtTRYrYi3XU20=;
        b=dL669FxitlhjuGYuyHFQ+9nRRm5m8EMCjHmJBmBEibgTOLBD9EmW+UwWK6cKzCq3xS
         aDLFBq03tJKDDRuAbP6BZSJLrQ8QqKmGYYFrdrSsxab2Pv7wzI7kXF+wkWNsG7/yiJjw
         osDEh14p6PgExChmfXpxcdp1IxPRCGScGgaoixl3QxDRg44uHxVG9cQ78+hlggjUBXKK
         MjtE4vV3OuU4lG2tLhq3ticqeY7DI7yC4G7prqJ8NLjXAvzLRzYAToZXxkKIxonRTHpM
         BSSoXHJebKtRJARFnQR47bGy5rjOlp5H6E0N90cBcaGBn8za4g64BlwCaA758vJsf/li
         M/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688603130; x=1691195130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaSYdLwB+MakDeA8/mi9vbhmcHZHfmtTRYrYi3XU20=;
        b=Tw9ka63tqJzpsfkL8DUYCFXV2Uoxv9Damrd1okvm/KdeCrEDB4fnIqol+4J+7AJ88P
         xEk3x3WIDvvj9HDadv0ydz59e6fNWtPCAvETBuv02QKeIKIlnHVvVJnnfH4jcFCjg37/
         FMTEKmuOmGyZoYYPtoH534vfipCweaF0Sa79doRSniceLl/gRubzuJ14TX9jfWv31Eu6
         diRE/KELy85TBMaztD/2o4FLf07O/klIxKEXz7ttWaKKv8m9UyRSzRyA3/aQJV5/gPPe
         eaOC6uc/u9un01nBeyfzTqt4MybYgcqVl+qC1+c15j77TGMc9yV2DNQDQhJV2yzZUP15
         8UZw==
X-Gm-Message-State: ABy/qLbW0TRPRiUbewytbK3pRlYhYmgPUUyyt8DgvOHlvDRMv2+Rsam2
	QPL8XZ1FeykVti1z9RlHRBc+hV1OLks=
X-Google-Smtp-Source: APBJJlFFtOumRlnEcIOyIvFRaD+OsPwGACbWmMyRevQHfZjVNj6fQGR6A0TXifZ+s0kkn3GPF5cSBg==
X-Received: by 2002:a17:902:eac2:b0:1b8:4129:e7dc with SMTP id p2-20020a170902eac200b001b84129e7dcmr432246pld.50.1688603129898;
        Wed, 05 Jul 2023 17:25:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001b89612dc7dsm60464plk.142.2023.07.05.17.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 17:25:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] renderdoc: Upgrade to 1.27
Date: Wed,  5 Jul 2023 17:25:27 -0700
Message-ID: <20230706002527.3603020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 00:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103678

License-Update: Updated copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../renderdoc/{renderdoc_1.13.bb => renderdoc_1.27.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.13.bb => renderdoc_1.27.bb} (89%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
similarity index 89%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
index ceff54f46a..c89b2d1c99 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
@@ -2,9 +2,9 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=36d34a46cb71546195d2b0c626a52e5d"
 
-SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
+SRCREV = "35b13a8e8fd2a331854dba6da81a20452e142d6f"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
     file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
-- 
2.41.0


