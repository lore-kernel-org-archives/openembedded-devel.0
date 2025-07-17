Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4832BC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:54:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.49344.1752760448170199764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BApB//FM;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d3f72391so9184435e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752760446; x=1753365246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRrxoqbS07ufL5J/Ihbe6iB6FSrYwHtyh0leARXm3Bk=;
        b=BApB//FMp4DjA9idK/V/HBjrsVt65yQ0mnqMVhKVcPJCVTzO90W6A+z9iMIJRQiAje
         PMnrGQvnxfwnpufMay00cPBeissUi3E/xy2raEDi10QTCnWhBz0AolBAm9DR6uAr4C6n
         j0tpIvT3KWBCzv/VEYU1yEptvq2BV0nNQZdxkbl1LtXkx9JGhSfuhbn8YsvLDjw3bFNH
         DmBOkQGjvk/XxTnF9SmnGAME9q3Hh+ZvaolZ0OyBpWpcr5DU6WaLQGErODOwWhgADCyu
         nl+G7+rgdTwfq0Ij3y3rrn43ifRQIV1A7hRL75z6g7cfN5yFOSR8y/eS6ceIAOJguUqG
         4+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752760446; x=1753365246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRrxoqbS07ufL5J/Ihbe6iB6FSrYwHtyh0leARXm3Bk=;
        b=LiAchXn4wxbz0GFtTEB93wybLcHTahOBBYuYuu1v5Z1TgGLikYM5oKpKhaRMEF14JA
         LYZuhiq/lHmzc99N71yQvkpyICSxj80m8GTsx+Wboijxjr0SGgXkeDk/udg38uNOwwpk
         DMjzP9E85dJb31T8uHTU6eM5MQJz9DIVMMY3uZbUrHf1m4qvbl7p/oTKEOBOHkmkVGS2
         +RLITZ2H+vilzky9BtImpttOl13tMJjh3FD0mUQxJTGHJPXsdTbfvutn05CBAYdjvhkc
         AfY28wvCM+hkeMFcR0dUBmV/frrlfRUafyV5wG8kiC5AqNG680XgIyktt5HLKHFPwi1H
         jcGw==
X-Gm-Message-State: AOJu0YyBduVn04c7JnOuyceBrw2fa07BDW9tRYExlyoeF4N4PNbENOPZ
	vBrFLPqFwGbHq7s1T9uUALx/6bFyrGI/6OHFc35UFhpfrr1QzuCLUfjG/+LCVw==
X-Gm-Gg: ASbGncvSgq5mB9XGLhChUTdOd8AA9n1tlR2YW4musH5IcMAIrtFe+pJ7LHd+/E3UHK9
	XjJny7hQFxVcXUw2hu2ROX5Hw4YI4U+XVpG1qJ0fQ0J3zu2IGYHlyDH2iDqSCSQgdhI8AcW85CX
	w32TqocHgtgU3vZWRrZU2n6wzsOs/7WLsdwJTKzVmSNVV8za3sl773XNAWjhK/4mI3+m1gJgGD8
	1PIyknZeC8fpOolvmSz7mv7WiqnF36mIn23hxxkaVoe/zaf9c8rFRXtPfMIhCCNcpbHwF0Ql+h1
	Ec9Zry4YM6SkP2cMD4Gv+HNvAV6LGTEWBGQ6Jlo5SCuYJ2hnuj8euBQ1hsor9EU+GZpcdQq0f2p
	utEOn/mRapGGRhWgVqqPk6YHAIe7p4swbQc3gX63GXbcgM/I=
X-Google-Smtp-Source: AGHT+IHAv5QlPEetk3JYkQHkaCMoGGyMo6sY0vgjaLx3wMffMZ3SziEgwS3Iw0401AONyITQRohAqg==
X-Received: by 2002:a05:600c:3589:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-456357faf96mr27321485e9.9.1752760445939;
        Thu, 17 Jul 2025 06:54:05 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f9be79sm22819905e9.31.2025.07.17.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:54:05 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][walnascar][PATCH 1/2] mbedtls: upgrade 3.6.3 -> 3.6.3.1
Date: Thu, 17 Jul 2025 13:53:57 +0000
Message-ID: <20250717135359.3644-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 13:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118608

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
index b700c27a65..1e99f92306 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
@@ -23,10 +23,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
-           file://run-ptest"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+           file://run-ptest \
+           "
 
-SRCREV = "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


