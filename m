Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA1BE6688A
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 21:52:45 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.56132.1732398754478450009
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 13:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hZfDZA/y;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ea1e5fc65bso2592930a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732398754; x=1733003554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAfnzYOXC2NRPrI+2ggszmXkSEUtbqKeJ25Lagt2bP4=;
        b=hZfDZA/yoRC5j2EgtqE/uYHOpKGjg5z8riB5Fc2sOiXNiTb9vGYVO42lfyyC/5wmZz
         POHMXRAl4Mf4p/wOXx6k1HTGR5UumygyEACQwB3siNZu7iaMsnu2Ey4AqljCmRrV3tOW
         K6POlB26Z6/Y7D9gmhLKtueqiLCIvRgOl1c22XazmGEnxBYSfBxV0lWKKZuyVO20t51p
         /3rHkkwA/wDYCe7A9/PBnhtS84qsGrRTj4O41wq2Tdy6uDDMxFikNT9ztl6MwLYR30bc
         65itR9q2r1efXk59IbNpXaWIr5l9dOhmwTQSlk3kSXRPLz1T1H7GAW0vEy8AuGyJqlYy
         wxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732398754; x=1733003554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAfnzYOXC2NRPrI+2ggszmXkSEUtbqKeJ25Lagt2bP4=;
        b=LufsXFbeK/3pEwjMQvwcjBB8FOjpyL1d27ewViXkXfiO04ikNeX0rkAJgref9503w+
         ro4My8Cl+U7Q8/0jhchROwSmxEFKnqaEPMypvnTYr8m2HUAkROspQzLPXOgghS3boc3B
         Rtm6mjNhPBvcONdVIuTsI6NfBri4tRVFwW5kZ0IU/M0TXX85fS/Dp0fx3PU/Af/WnMT0
         MGZ5DV2yfp8fibGxp5WjRJN+s7XIEdpGbCkzhEtexDpFrQmEPyHCeK7ZKki6tZ2MXdDY
         agIE/KzMzu80nlgczoLsmAIw67AU835Y0qbndt3gxzK3ugsx0msdcuSb0etfn/FrJDXp
         u0CQ==
X-Gm-Message-State: AOJu0Yw7PwUvxRXGEtCjsFD7Mvjbx9426GqtzKnMAyPVhQB6LS1x2OAE
	p3go34flvCtdiznD3I56U2Ba61QibkXM4bShI2W8tGPQg0CxhQb+oVWVVQ==
X-Gm-Gg: ASbGncshN2vNAnaHGJtUbyH9LZMmhRSPd746mUI+qanemnT5+gbJwqZJQhXySFmm3Yf
	FVD0k1BxzUHeECD3fRCjjgA1FHT2QRwsMlq8kEgAEUTUjhv9GHY8S3MMP9fD5d2+cEILFLjZJI+
	nZcmUtqVhiuRAmTa3R4+R14DczhHNxpnbUDFSQcyQjGmcfWY4+jwYH3z3a+0WEuaMGgrRIewQg7
	stTYHrAw6yO8nYp59KPiFMywNrmcPgTSEudAmQzkJzAutcymwg=
X-Google-Smtp-Source: AGHT+IG+aHdsuX9SQdEskGVBRlqgfVHWbQXKXmb6taVGfDOTobj1+W4mu482K4WNoIhbIElOKUKBxg==
X-Received: by 2002:a17:90a:b884:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2eb0e22cfc2mr9443774a91.10.1732398753697;
        Sat, 23 Nov 2024 13:52:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cfe48d2sm3810268a91.3.2024.11.23.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:52:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] opencv: Specify right path for <numpy/ndarrayobject.h>
Date: Sat, 23 Nov 2024 13:52:30 -0800
Message-ID: <20241123215230.1558824-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123215230.1558824-1-raj.khem@gmail.com>
References: <20241123215230.1558824-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 21:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114025

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
index 07bdb37b75..5e54ab636f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
@@ -113,7 +113,7 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtu
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"

