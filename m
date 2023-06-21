Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E93EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:09:33 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.2601.1687363765168454518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fT1P0iyL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51bde6a8c20so788062a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687363763; x=1689955763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkJauUF18xer1Gy6nmuiPR5BnXJb+qsb3T2mqZHd+5g=;
        b=fT1P0iyLFHFQgxCnkwpQcDl1mPSoZImgfjcI09+jsVuA0TP9h63ZZmJUY3GLAHuJFP
         bOWDMv7Qlw5XbBBIMDe12JmPrdrzEEIh3toaook0Vl2qDrFN/Q0xLumoBMQRSr4zRJ+0
         vXSx2BxpaHhmimt/m+sN13pOtYw604ZQceOiAVPyzOhSSkmz2Yz1STpg05wnS/5p4CS1
         XR4uM60y/+1J993TWtB9uMtavB6m+8Es7CaxH7ijRL/KqutVuGJFb3mORW952iKc0WCV
         cY1S5L9gNslc0YwcefFKckhKYzbJ8mlGQ8GD1P+rd1m9Fe3SCh1Lz9N7NGawBuTqCxZN
         28rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687363763; x=1689955763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkJauUF18xer1Gy6nmuiPR5BnXJb+qsb3T2mqZHd+5g=;
        b=GYHL5iHxf/zHeXkpUh9i6P2ctw/xWsSYjWWt87tVcMK6SktE1x/47rcuHsFk4cH5iZ
         cSquNajeA7z8ySFqRDFZxQstFMEQdio7374L069QgnUnAbxmJjXtEnCLo49Lg1TvliB/
         8IQUlKi3RzUpJCEz+zfJ98Bc5YBgD8ZHyHjxhUbXymgDzh7pD1Tg3h4zpXRg+RZ/dv+p
         p5GN9zHNIU00ikC1RY4jIh3vPGvQgAg5eD7oecsj/Cxs9YPec5CXRc/q/ABEDQEKWrkl
         Hxjh+gnVZqVZkH2FLTg9scKq161Vt9F2uI5VSQnBuC/PGs5UT7gC6hEUB+2ReIG2YASO
         qV1w==
X-Gm-Message-State: AC+VfDxA2cVdbcDtyC8+dVBA/ahi+gyA5m1GohH7IsehMqaZ9ehUvyWk
	RonxIPhjbLcJVwwfnxPVmmzUB1TJSeM=
X-Google-Smtp-Source: ACHHUZ5eopg3coZtj23dFVaDJOsBRrGwqa0b43DJUpoBRsfE5Sb1hRr/OycCtvABPfXcpriN2CyHGw==
X-Received: by 2002:aa7:d1d4:0:b0:51a:5ae1:b6e5 with SMTP id g20-20020aa7d1d4000000b0051a5ae1b6e5mr6063091edp.10.1687363763345;
        Wed, 21 Jun 2023 09:09:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ay15-20020a056402202f00b0051a26ce312dsm2839769edb.71.2023.06.21.09.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 09:09:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 1/2] postfix: fix malformed Upstream-Status
Date: Wed, 21 Jun 2023 18:09:10 +0200
Message-ID: <20230621160912.4193765-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103478

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch       | 2 +-
 ...2-Change-fixed-postconf-to-a-variable-for-cross-compil.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index e83085d20d..8c9c13b1c4 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -11,7 +11,7 @@ for Linux2 and Linux3 systems.
   native build, search host library path for nsl and resolv library
   which comes from libc
 
-Upstreamstatus: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index 347b9de0a3..28199ccdd2 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -3,7 +3,7 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
 
-Upstreamstatus: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
-- 
2.41.0


