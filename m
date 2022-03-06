Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B1C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 06:31:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13411.1646548292041936824
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 22:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WQohQ8Gt;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id qx21so25610069ejb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 22:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7liZZj7u5HQ3pfdLMhGF473DsnO8CJELHBn8fu+0fSM=;
        b=WQohQ8GtCHincMTfkIFYbbfSf1J4JRKfudOFwtCEkLdLltY6G4GtauJfoqPk2hzDfu
         C8eNN/hjyoO0c1f4IJ1/iqTm55K/XLNF2JnYbCJphiim9WZJTGRU+8chelJTG5MddUc9
         6++j1HGKFd/TJ3PqoqJ/MUP4pYhBiRuoaLHOD6T8qyQK/2UM/genqRaysgQLV/e/FUfC
         hHZsJGSyOTGHq1Ps3cVbQrB1tS9c6Y6vM0CSdaVlySWpJ9r0eWo8P9LMtfx021erDwY7
         qKLKpervopNEt7J1NU03Mj2Bj8jrjZfuHi+TURQOubxQza2EdgNiRlXMZcSMvPipA0EY
         yBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7liZZj7u5HQ3pfdLMhGF473DsnO8CJELHBn8fu+0fSM=;
        b=EbK1WiHgorEbiKcrwLBK0aE9Q2VOHx66S/s1tPeyxVTbPz5gnkBlWvDVhlNa+krsfj
         jW2TxEt9mSDmK27mVAxG2bW+gKZTpV8P1F9wR4DtKYB1ZTvmSn4FhEUoqEx+RmfE/0tX
         Cnhe5xczgB/bMqeXulnm5CtagcLRAP4q1ghfmjN6QoOj1tb5JpI7NH3Yxfc0DTi1Z2kN
         v2R/KD/5ODbJfXugMgDxk35a2PLF4zRMtGcUUSb9Vd6MMYDbjIbo7dIOGJgpfr1+LHhv
         9oDRlc/zgSZHjiIOLcSJAYfF+Sv8saUWcBmCQTqBOQidwS+MNpPkAKHdsDgMRCPe/Owc
         44PA==
X-Gm-Message-State: AOAM530MDvalbm8SSNhyhS4JrQA86m6B5vhhSJ7RflehqIuXUVw5QPRV
	/GFLz1hMu5LT0t7YRO7rRHzG5BZBTS3P
X-Google-Smtp-Source: 
 ABdhPJwWT3fBxcyU2ce7jj/6s7VM/u0mOYMzS7AwgxUFpiwzOdGxA7TRgW2ms48XI7xL0jJJcCTVpg==
X-Received: by 2002:a17:906:5804:b0:6ce:3f17:bf35 with SMTP id
 m4-20020a170906580400b006ce3f17bf35mr4848098ejq.346.1646548290290;
        Sat, 05 Mar 2022 22:31:30 -0800 (PST)
Received: from localhost.localdomain
 (ptr-fhlh8uecidb5vdapr22.18120a2.ip6.access.telenet.be.
 [2a02:1812:434:bc00:c57b:6a9a:7726:233a])
        by smtp.gmail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm3515101ejb.158.2022.03.05.22.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 22:31:29 -0800 (PST)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-oe][PATCH] libiio: point PYPA_WHEEL to custom location
Date: Sun,  6 Mar 2022 07:31:16 +0100
Message-Id: <20220306063116.710-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 06:31:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95810

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

This fixes the installation of the python bindings of libiio.

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index f33fc0c1c..19753a13b 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -15,6 +15,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
 SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
+PIP_INSTALL_PACKAGE = "libiio"
+PIP_INSTALL_DIST_PATH = "${B}/bindings/python/dist/"
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.21-*.whl"
 
 DEPENDS = " \
     flex-native bison-native libaio \
-- 
2.25.1


