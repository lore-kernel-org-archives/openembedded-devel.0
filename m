Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA788C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 10:30:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.4893.1660213844780597601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cq8/qABY;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w3so22435952edc.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=eZ55xyjAcUrrMZCmODLKrfz7H8RNa/SjVyxXJeSx9qA=;
        b=cq8/qABYK5BYJUN46JxvJzzzw3rB1kBByyOUDByzEqrVlVlS96pqgg35X90EO2Z972
         Nt9ySXydO8wCpVxNuEjEKdOnYnAxn66CHdM3oKPqZPDMNYEWNVi8e7RT9kZEOuOxyuTv
         0bYTOcJJFk70Tqn/kBJRdOeag/npaaKg/VTJhrqMquOsyqjmn/askwCtWy50tkTblSjo
         hqQb8p3p9au0kzBeaRbPPM953INph0N94PsSR/rQlToKT7no7EDiYJkULQIgD5uWQLFF
         2WsHpfhhif7IxXJH1urUhCFKVXugKfPBrqJaAqSuyVxLQ/MahNkGXn1wpwuY5JyvF67H
         Q64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=eZ55xyjAcUrrMZCmODLKrfz7H8RNa/SjVyxXJeSx9qA=;
        b=RKfOi2bOeNRc4/yDTVFChcEK1a02BtwV/XwYTBGwbDXjBSo6SQIC9nGfhmydXCyU9w
         +kDVwgcUKZk5u5ImxLtrwDCBOPoseZ60D4YgHadsnWsyCRAOLBJvaJg8KLLxDCSZRLtI
         fy5rMJBT1yHXZ2Be4S2V29aRj3UIS2wadboWTV1pVEhjrHZU0XjuStEzLkUXTjmx/VQt
         17lDNaXYRvzhuGxJCkid/GyZ4R08gKCKKSBuVNHBWGlR6axmGH+E3qYBrx6E5c19HPbe
         v8lbNgT0cdEQgjtoGtLmLMeDTrUEh0RySLVRbgaih+g3PtHjj/S2S5VekUP4DileZbK2
         7aOA==
X-Gm-Message-State: ACgBeo3pmyRuA+i+MZ4jwGL+UuRAaRkZfZiudVW/ecYDtiFmSVY7Z/8U
	vQH1kta9in0FnN1xVaZxeASErZxk5lU=
X-Google-Smtp-Source: 
 AA6agR6Fwo3LG+J8UDwJmqXzelcynKorxodd2WWeF0254L2/aadMty/bXDMr6P4Jc3PSG8UrLKLQSQ==
X-Received: by 2002:a05:6402:3689:b0:43e:43d6:6039 with SMTP id
 ej9-20020a056402368900b0043e43d66039mr31027381edb.341.1660213842900;
        Thu, 11 Aug 2022 03:30:42 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 m4-20020aa7d344000000b0043b7917b1a4sm8895051edr.43.2022.08.11.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 03:30:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] libgpiod: Detect ptest using PTEST_ENABLED
Date: Thu, 11 Aug 2022 11:30:37 +0100
Message-Id: <20220811103037.5511-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 10:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98193

Allow the ptest packages to be disabled even if ptest is enabled in
DISTRO_FEATURES.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 2cccf93bd5fb..3e6e5d567d03 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -19,7 +19,8 @@ PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
 # Enable cxx bindings by default.
-PACKAGECONFIG ?= "cxx"
+PACKAGECONFIG ?= "cxx \
+		  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
 # Always build tools - they don't have any additional
 # requirements over the library.
@@ -56,8 +57,6 @@ RRECOMMENDS:${PN}-ptest += " \
 "
 RDEPENDS:${PN}-ptest += "bats python3-packaging"
 
-PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
-
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
 
-- 
2.35.1


