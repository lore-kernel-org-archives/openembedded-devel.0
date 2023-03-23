Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8170EC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 10:05:49 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.68863.1679565942420063286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 03:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=moZDr7NF;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w9so84071486edc.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679565940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRe5FMtdJjheqgy2xq8P4G+lfzYF+TqqV26O/jnu7RA=;
        b=moZDr7NFZgfZArGMtUoc/GeZ1bWWnjQBrgHO9fe5todJUU3TghNz0HIdXC+2Lx5eBS
         stA/KwqCcycWO29/WiurodVpvJowjJgvOSTOaqm6tK6bG0MUHzfgOoUmCYXOfDzprbhh
         m8wBl3SW8oB/GwG7zlgqD7bkz4zaqo/8pC/vFihkZ5z92Rh2WGolpjbHpVfAK9Duc0P8
         /hOa8HiLyMtXbKcK6giQD4tffdGP/+066AUl1SLwhFwXx04ZXlCOGFKg0U2H/CG23ZeE
         WfLeDfIQTQs2Q2m/rbNH6/FBkV8S3Ul2II9uJkoiOK0L3ropLHH8bDMsZCMamGCpzMcM
         falw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRe5FMtdJjheqgy2xq8P4G+lfzYF+TqqV26O/jnu7RA=;
        b=cpNDM0OtapHi9HJioBJg+Cjp7bPimqyJFDX5gL/iPHQzXIR8JgDZzlJu3VHAUO9Elc
         O0hyZbIuHNPvccyR/ug2t8P9LH36UV5Hd1H12ETYTJ4dQEZYCmkOenGRvPiFrqLVDWvu
         zi5P9PYMSM3hsno6iubxlpayJbDSzTjISuO3UBUsX4AADE62YG5cl4Iw8SjrcAEBSSXI
         79INLzuKcd0n2kYYgUjdRyCOKbQ7aPmFAPaRYJLnQ9ULu3nNoyM1MnziFcgfMBuUGVBt
         4ZvhcgKi53Msgvp4pMeHz5dVUa5Pp2rnS4cnEctt+pvXH4XpMH0s04FPsniM1/tCmwln
         GLeA==
X-Gm-Message-State: AO0yUKVQzo8jdAkrSOJ5PYjxeM3SdeY0DNs8JiIVIFwiJLRStu7Vyipa
	qwaFxA41En6JRTH7f9kYLhU/eH2bRiw=
X-Google-Smtp-Source: AK7set8OC8p9WuF7cD6PMFX0A8uvpYOXqNResYX0XF/L5IYHEh6J8r254w+iEWd27XPKMeU1lFi2vg==
X-Received: by 2002:aa7:d61a:0:b0:4f9:a97d:469b with SMTP id c26-20020aa7d61a000000b004f9a97d469bmr10139215edr.10.1679565940569;
        Thu, 23 Mar 2023 03:05:40 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a13-20020a509e8d000000b00501d73cfc86sm3882537edf.9.2023.03.23.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 03:05:40 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencv: Support OpenVINO
Date: Thu, 23 Mar 2023 11:05:38 +0100
Message-Id: <20230323100538.2054939-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 10:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101668

Add PACKAGECONFIG[openvino]. It uses openvino-inference-engine-initial
as build dependency to avoid circular dependency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
index eef2e66ca..18516619e 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -110,6 +110,7 @@ PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine-initial,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
-- 
2.39.2


