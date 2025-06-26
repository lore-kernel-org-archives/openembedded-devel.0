Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42705C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:49:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.10044.1750949357968010921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qgYcatll;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a442a3a2bfso16893201cf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750949357; x=1751554157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=glH+LKhwulwmPCNPFOq2oGrjf2QPztIgLJ6dwYwXmIs=;
        b=qgYcatllE1PHIoRkoqcMWEWdqH3JcUhls11Tx9u+9FuD2FAb/QTN2rukoVK9rrBTl+
         tA25xk84A+MXP94ZjXEF+zyg6sD0VqO1scNrnfdJxZHCJs35HkYZjHU24yOrMjAamR1A
         pRRS01nU+UrVHgezgXprNlndxF9nOmHzcaYXF8s16r6q97EToo/nwuu832KRNw6fZQn3
         dZWDvV/ca1Fwf4jhaMqsU7pS2dirTp4j06mjEom5/WXGl1No6e8opI1eDuurcjPIUyQT
         +FyEQx83J3eseyPQfiprhjVtCGqklulqcVI1O4xxsRP2kqGwZn9Sfu7ZqXj8Eo0IoMWV
         VUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949357; x=1751554157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glH+LKhwulwmPCNPFOq2oGrjf2QPztIgLJ6dwYwXmIs=;
        b=MCnu5MGs9lQ19XbfZIpvogIHEgHbM0slqGtsUobccyqKxM5Dt+2Z8RUiL3iW43HE91
         +rGBPyB1uM9JiemkvFHs3f8agWV/6U3zoUUmsYdQsfyp1rSgNQJoCI7er9fDT7YQDZ2U
         JvqlFaBrSU5Fo5fbVJzH7hiIp/0/4X3jS7gtwQs04nLqzTmeMWpB9j+VirdCLk0SwD8J
         BaTMZDim8PW1yhA49CEX3sPRJ/cCEQYuc6bKeFPezHG6q+WXJQAgfiolNnAMRpROjs6k
         KAtVm1AngEMK1sy9sfVOim31jnDxaGWHF16Xs2GfMW4QXY6n0Ss/moBOZcDz4g5QkvdX
         nAkA==
X-Gm-Message-State: AOJu0Yz8hAQhlNBfqOKj4TrlMRwUMSTXgQi3r1O4U0Wl69rJg7WSys+C
	bvc7M0s6jJQh+vxY/oZP0ZusqCSYCdAQt/stbGkpyJcmff0CE/v7Msaj7oqZHAyCCsx3gTcZo4R
	FHg0=
X-Gm-Gg: ASbGncuT3bX/5WDT6LtupNmL2pWorugiwAJV/CRXEsOHQMlMOs+kfE8HLGTUP/M+o+8
	lVCP/B+B63rD4Aak2EEGhgALtgGZovrx6zRiw9v74sLX0CgSPFZdAABgwg17XsS410T7L8tNvOT
	dt+FTB+XhHX2PEKmUQyesPBOHtE9LGL0RINIGXg85JU6UA3lAiFiW6zdzK0j/FiiVUuluv1civo
	KbQkKK9NGILSP6K08IPaHI8ENy16OhjjFCDlYAZtaLZ881bbS9JdIaGLN7W06Mc77wr5PWvbMkc
	PTN2wgSh5OosGQ1k23f06ykmxw2pvLW0emDNm/MsROdAk027kAEaSw==
X-Google-Smtp-Source: AGHT+IHKJtk2J5T5KVvmfnHLRV1EVtA3TJPg9JsYmRpG57LRPXKtBmj0haVlSPFJhjrtoznxCLNipg==
X-Received: by 2002:ac8:5750:0:b0:4a4:3c3e:5754 with SMTP id d75a77b69052e-4a7c0850c2fmr120716161cf.32.1750949356663;
        Thu, 26 Jun 2025 07:49:16 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e5d09esm72862341cf.46.2025.06.26.07.49.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:49:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-protobuf: upgrade from 5.29.5 to 6.31.1
Date: Thu, 26 Jun 2025 10:49:12 -0400
Message-Id: <20250626144912.3573904-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118127

From: Jon Mason <jon.mason@arm.com>

protobuf was upgraded from 5.29.5 to 6.31.1. Upgrade python3-protobuf
to match, otherwise a fatal mismatch error occurs.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{python3-protobuf_5.29.5.bb => python3-protobuf_6.31.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.5.bb => python3-protobuf_6.31.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
index 14ab3237b97b..bb801ffb71f4 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
+SRC_URI[sha256sum] = "d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.39.5


