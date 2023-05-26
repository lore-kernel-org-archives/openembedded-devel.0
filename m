Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFDEC7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2489.1685081970079988789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nwkQw37m;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d293746e0so702183b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081969; x=1687673969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EanOf6Y8zvZqxRkJmqJYu0zJhUEJQVLazhVK+peKk0Y=;
        b=nwkQw37m/+V6ZkYhWFYw6m7IEOq0sqs5UgfUsuKnZ9apbY3QBvQEdHcPLRcrWKatdz
         /VCnF5s+K4ARY3r+ygGRt/gZE9TBQG38Ac3Nlf64Z8HL+YuSNxHxwWaUUomdHaoEr49a
         zxw0DerMvT1X8QeGq1N7Xf+TM8SldLo7m4fETNawSBa5AeArDr59XG/Js1XgN9lvNuNc
         ynX7j1niBJPXv/TS2ZO85JPgj18aMrbbJMxS8mOhJf4OvWvWAxiXXQ+gKJ2WpYGyGWtF
         q5rH7bys4K/AEhJP96+tXALA80HFegD4h7NoauEwEsGOwwRdvrrGQW1vAhhLXzwAliAN
         1l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081969; x=1687673969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EanOf6Y8zvZqxRkJmqJYu0zJhUEJQVLazhVK+peKk0Y=;
        b=JYmRcw2kmvo9uoazjY2YqXT6irqvmS8xBAi9myXQVufCgSkJhwo1bZHUu9Tq8wRcHf
         JHZDuWO+xa875eHNhKOTaFvkt5SAMilWjDHH/5bvo06TxmiYGiRzcFnSquomeEEAro3i
         3iM9oFm9zo31ENAt7UQqrymbuNWQXpcMIAPMQLeYEI5oV3cGJOrF1efzca9+yEGIDwUT
         Tth+IMooW0XSt/LfatlG736vVYMK+2dv7dR8ejEahX/UjLlpofcgS+gs/j0GhHGq/3Rn
         nhKSSO09J8IYFoGd60ossPoigHhiwOmzaEKToo0N99eBQ2C84ZtxlpgSXwKUuQMn5+Ao
         GpWw==
X-Gm-Message-State: AC+VfDzahHcIFeeR13lyuLBjno68seeKwuUqZl//Ds2axaHnFHy+OMhZ
	BNA7hLcdPL8T3WAExkF16NnUxABtAG8=
X-Google-Smtp-Source: ACHHUZ4kcXcCxVFHticBrBWq5a/MXouJItZEwZ8Wsh8cdatiSDIOp8r1mNGtqynBwPQoHpikoZpVew==
X-Received: by 2002:a05:6a20:2d2a:b0:103:f088:105e with SMTP id g42-20020a056a202d2a00b00103f088105emr916929pzl.16.1685081968873;
        Thu, 25 May 2023 23:19:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/7] vlan: Pass CFLAGS via CCFLAGS
Date: Thu, 25 May 2023 23:19:21 -0700
Message-Id: <20230526061925.420351-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102865

CCFLAGS is used in Make rules which will ensure file remapping options
are used when compiling

Fixes
WARNING: vlan-1.9-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/vconfig.vlan in package vlan-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 035d4946f1..b478692e39 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -28,7 +28,7 @@ do_configure:append () {
 
 # ignore strip to avoid yocto errors in stripping
 do_compile () {
-    oe_runmake PLATFORM=ARM 'STRIP=echo' all
+    oe_runmake PLATFORM=ARM 'STRIP=echo' CCFLAGS="${CFLAGS}" all
 }
 
 do_install () {
-- 
2.40.1


