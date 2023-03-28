Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FF7C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:29:05 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.61107.1679992141659395674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WFdHhqNT;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t10so46160746edd.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZsHV+VcVKhj7PTUCeu95qbpBPAi7TXrm/V7x3qexnM=;
        b=WFdHhqNTD8Z2sZ0u9VE38Ewny66u5ariEBtENeUHzbfgGDBZAk/VJBdMxuBbo3V/kz
         Bz+VYFgZZ2NgEXAQqPxYcSYN+IUlLumlN4/kbhiqMvzMfc2uBRFLiT8tVQZ8Q26Vmnmw
         7+ekPI02A3DujUJMIF2h/oGNuOj8E5M0omxU++E+8iHtFCIWT/tTr2WMtF/Xw7n7L/LB
         eJGaVtzp6UgR+7RkescJg+1/qbBaZ5zYbHkzf4aOnAsnWOhX3Oo3JjEbp9dxF+UgOOh3
         WwFYaVVrZLccpsg/nIFby+Qj/ULX7pm8iHiytg6bkBtsWRqljYJOCOJQBNuZ7Xaj7yWA
         Oo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZsHV+VcVKhj7PTUCeu95qbpBPAi7TXrm/V7x3qexnM=;
        b=gACXzhuLGy0VxZCJV0PLO7PkJj9lAlM/GfKUDXy/R4ad+cErmRYznadh6Wj7huMKjP
         KcwQUq4c46zU3YhvYHSABRyb/NVDvWwzsAYe2W0kJDm7ygXakG6RotwZQ8dDRMIWt2Lk
         H6gDm6x1z2+IAXSy6VPWNvuSykfLH2LiGqLxy6Fo2DskO1sOOAOQ/d9NRge5TtQmd68/
         q7WvhaSmhvip73gHsOHwNXV0uLdwCgREa2uj5hWVMCu9QnyssdZHMilO2BAzRSZJeZlH
         OJNxtk7sLJ/Sq5J58kme0sK0+jsySEQIbIpIE+3Ri9oVT3WYEtA/7TzQWrpdOWbOc0rf
         YIUQ==
X-Gm-Message-State: AAQBX9dhFCyd0UUTiPITUrrBUy6aDtRFRq9a1KZxlUqOFycs/1sN1LpN
	e94xIhnzyDOyQ+bl8wmr/DZdB1lwQ0I=
X-Google-Smtp-Source: AKy350ZrexvAKnlizJvYcSjDBPeVS9x48L90reFLFbXgVUJvjVZeVoaTYr3OiDV55cn25/hej0Dmzg==
X-Received: by 2002:a05:6402:187:b0:501:d3a1:9a3a with SMTP id r7-20020a056402018700b00501d3a19a3amr12745202edv.25.1679992139677;
        Tue, 28 Mar 2023 01:28:59 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id m11-20020a50998b000000b004c13fe8fabfsm15548482edb.84.2023.03.28.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 01:28:59 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencv: Fix PACKAGECONFIG[openvino]
Date: Tue, 28 Mar 2023 10:28:56 +0200
Message-Id: <20230328082856.299688-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101803

The circular dependency was fixed in a different way in
meta-intel's openvino-inference-engine. Only some samples
in openvino use opencv and building the samples was made
optional.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
index 18516619e..361b00430 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -110,7 +110,7 @@ PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
-PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine-initial,openvino-inference-engine"
+PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
-- 
2.39.2


