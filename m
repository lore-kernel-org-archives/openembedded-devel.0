Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBF3C7EE22
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.94681.1683499454201866379
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BIjlEQ+2;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-965ddb2093bso447799666b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499452; x=1686091452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=BIjlEQ+2ChXdvTF0fdCmzxnrtSVQnkPamgezEesfNUv/ENbY1h4m+DxkVTQ9wbNFQb
         Bshssqqdnjo3w+SST0S6CtWWebdKIyxZKTRZeoiZANDPlzJL30l4N8YNxFnW2ToHpWAB
         IQDVuaRZREXQ0Pj1TDG9F0G6p9Qjtu3MehLhDeGUtvQp62DH7c/wtlJbq5BuLB6wEfGj
         hL1Erxo8xNHcIndTy7QVo/OrxGtwov/GU8rhVGwYKynZuFuwwnFAzVHCklFm2QLC+ir3
         HDnkRWmm6nZtTJCgAJWOUtOC+8VAp1GT0PXvfStndMwaQ3xtfAp8E2zPt7DvYyWzM1px
         qOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499452; x=1686091452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=d+3A1yWnl8lBHoXsiyIhlin3agwZfEiToEw5+ScQmngwuqxkJmP4Ybfcqte0T4BAmE
         Xx1zW2jsX2XvUopeX6/3Q+fsjHaXxkGD4RBhQBM978cUAXo1wqSjHv1P0rYDgMmhwXYC
         qIs+/mzfakNZUVyLnUYpxfmIgR93RjoO76gyRXtyGGfbo3kDdYINMLRSe2u9WHIEANkN
         Lyn01h8fs00EeWUYKWXeV2HOnQLTXO1R0XIKROV0fwuUFdWrGjHLTYh7m7uMAxhqOEYW
         p+vGkFjTupqGmOujOCUlbAFZCTWBkhBs2Ui/Ur7icLf94GGcnP37+gppAv3RFsSnvZck
         w3Aw==
X-Gm-Message-State: AC+VfDzzoxTAcVm0/SrwUrwV+zzFs2Wjqx0JMuz6qKo1vzoucXMrUAb8
	kSIxdUb1Rh6DvyzwPGUNn9b6uZWxIxk=
X-Google-Smtp-Source: ACHHUZ6jZ8J0rsQYa7IpSDcSphfvUUB4E9UcTkRniea1gur3Sybhphv0Jzhs7oeeszRfV3tXCG49bQ==
X-Received: by 2002:a17:906:4fd1:b0:959:8575:2635 with SMTP id i17-20020a1709064fd100b0095985752635mr7681629ejw.17.1683499452666;
        Sun, 07 May 2023 15:44:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jx4-20020a170907760400b00965f4171642sm3463869ejc.125.2023.05.07.15.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/16] cpulimit: fix do_install with multilib
Date: Mon,  8 May 2023 00:43:48 +0200
Message-Id: <20230507224354.1149327-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102372

* fixes:
  DEBUG: Executing shell function do_install
  install: cannot stat 'TOPDIR/.../lib32-cpulimit/0.2-r0/git/src/lib32-cpulimit': No such file or directory
  WARNING: exit code 1 from a shell command.

* drop strange 'g...@' from SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 86a58beda4..58e4fd6e88 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
 SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
 
-SRC_URI = "git://g...@github.com/opsengine/cpulimit.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master \
            file://0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch \
            "
 
@@ -15,7 +15,7 @@ do_compile() {
 }
 do_install() {
     install -d ${D}${sbindir}
-    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+    install -m 0755 ${B}/src/${BPN} ${D}${sbindir}/
 }
 
 CFLAGS += "-D_GNU_SOURCE ${LDFLAGS}"
-- 
2.40.1


