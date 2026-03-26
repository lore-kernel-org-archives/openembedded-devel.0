Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD410A88DD
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50124.1774538539666716459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lYZF3Sa0;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd27754bso10548145e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538537; x=1775143337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9NWQTWGwJeMFWXyfScWutGCBEdBIaeVBXglNHG+pJI=;
        b=lYZF3Sa0erzaQkw9VMkKkon/tpy6eF9Gj/Jc9X/gxXz9ntWZKfas6P6aG85ur31iJJ
         q/456fRb9E3LosDusKHsJR3yv63lZWpexLaAKnFInbAe/EdvSo5PMYvwXJQiXOjfjYlW
         0v1RcPFn7xox5xKUqtLsQfs1K3VmVU8rcDxq0Hj3J7KJqXRpUPZllOpqCVj4rC0qEkOH
         IQCmFBVGHIWedbUjIenBlq0xrCwhATe1Ee6nC5ensDJ/NEh4ofLfQzyaOozPjM9m17br
         r6ru00uLYt3iXt9esIkq3ee6tbCbCtbC9F7oxm/BjOT6xd0QqZDYJIrSDCavP5ICGkUi
         +2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538537; x=1775143337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9NWQTWGwJeMFWXyfScWutGCBEdBIaeVBXglNHG+pJI=;
        b=rOowutaM/LoxbfajcVVcYG8fx/N7L5i3787pJW4o51Ch5qNIc0ran7lGICIezffnX2
         U3CbvuZgxeWh95I8xgljp+QW2dpbQpMsiMOoqycnuvl0jSGFEqVak6h6qhRl9wbKZb5Z
         ZxOT9aaX1hcNKwU2Ao0ew2su8RkeGj0lwIfTYuP3wkEiAk7wh5/18L5dYlX1FmBCr2Pb
         7PQvlsC4tnwNcrYpVnKoTHUaE/Bhl0kb7ku0ts7eRxkCEMbkLCGl5M8wukySxgXFzt2U
         NTJr9Y4jhKz2CzmpMHcgPEm2J2bTfrzwFPZKTEeXeryr32So6VPuoQW6WVoVDfRInZZl
         KU0Q==
X-Gm-Message-State: AOJu0YzCZh3pzf7xI9en3vK98Lz2ss8+Ofj9sZbuYoSH23DVN04A8dH1
	z6TQ4PzfuaN8lbvc4Au2HP7kKyc/7/9ASLvJGMui8U2LwjRGWLCGAXPrJs6Nlg==
X-Gm-Gg: ATEYQzzH0/JXGvB/kQ8UuvHqJVk02KynWdgWvU/bYUMQ//9tpcNfW2gbQO76AH1WfRU
	FDi9Z1hG3xoK7sjiELeYOPaFuYPbht7jl2aCjA/cFjifSY4XnCjAirUsQHse3GMmaxaiDTQLaFP
	p8/hTOy/z0AIaLjop2P+AVVShwNdOk/qkTisQUmBrtn57fiziUN3jjDxpcopCaK8hMeRwMxXiO/
	uO2UCP0HeQfnNcESKfy46NGObonXFI/D0wKeJ/6i0JnaZLs1cNwHQbkPvbRPysRabR4WrNglaLC
	VvluAbIm1ZiFz90dQzbq7atJ5lJmqKqqcUMDrxg3+sjLCKt5DwrXbKJ365Ffe/G0bofMR4wDMox
	WQ5xdHht8+PlzPRvNS2FzD3/FP88kStF7Qf6I2xtgneEWSKH0NvTi9xw7GUBH62RPAvrstNvMzv
	0CIpPdrEZH274GdygL0MDMsWjN
X-Received: by 2002:a05:600c:6308:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48715fea9afmr119967805e9.12.1774538536580;
        Thu, 26 Mar 2026 08:22:16 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 13/13] opencv: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:38 +0100
Message-ID: <20260326152143.2224099-14-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125752

PYTHON_DIR now contains PYTHON_ABI, use that.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index 981b06e33b..70ff7b2c4b 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -117,7 +117,7 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtu
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_BIN_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
-- 
2.53.0


