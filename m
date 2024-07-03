Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2098CC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:57:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.50364.1720011427534646361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+7VEyob;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42138eadf64so38151995e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720011425; x=1720616225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oovzp5XqCissDEa9fa811IcHu2IbdKP8fW4L3BmFbRk=;
        b=I+7VEyobx/pZfX21aI+Npx1zzJ81GXjIQ0/j/CqWNh5rVi0bWqIxDRKqAt9TFJKLr4
         xipyn3y0c9QnY9ayvp/SUzDkcyTcNSpCUHn63vrU940tzxSAwyozCnRC213zwT+0z/dZ
         rL86e7pjt2Z1zo2qhSK/qUWGjkOsn6HCk/FIZMx7UqhdI4cJXPY8VuwaMjviUUennOZX
         UdpxTFU+ExK4H61Rp0mCeza21Hvi4qW+BpXtie1pa0im7IytVidLeIUmU/iTzncY2tu3
         /1+EU3SEGZz6zXyYtBQ3us3BxqDd1Tob42dmuZJDtDmZO29q0K0V7DDMe0Ef3bGkmUCl
         R06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011425; x=1720616225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oovzp5XqCissDEa9fa811IcHu2IbdKP8fW4L3BmFbRk=;
        b=PeaHnjp/y4LtcomJaT2SBVh6AiiqBvK202htAKmbVQAM0ajlkFYDgYvQfJ7mc+pFjI
         kuJaK7l6LA2zSDo6US/UFhbcdkhcCtulHMINdVAxilix9tuYu1pvdtS5QsprkOUmA6v/
         MzMLjjx7UY+kBOHJMzWP87w0kOna26ZN9b22DI2QFzZxCNA3BEddiqQjroARt5FhtQD/
         LQthsPc5QXQmXF9CoIcQahim70CSMZZIXByvP5W2MKDYrr00s4JKKLTuETIG9T4wt+CN
         iPaU+zECFlzcUqx5DorwWdwhkRXYW/1O8l2IkhR/Ze7lxRQdIcu1HI5hpi79y1zrqe3Q
         hTQg==
X-Gm-Message-State: AOJu0YzR5q5wdKB/pC/ITNBblWbbqpoyNO0sFzXw7o8lMPlmZbb7vdYX
	Rz6ApvQNMEHHIj1EaWq8QWTCfjONUJF2LTEuHqkTi2TgWvf1UDbrnfSmfiY+
X-Google-Smtp-Source: AGHT+IHkOdmp/bolNijIENzj+eEprmos6zzoh3pXA+bA+nppArWMRt10D0y6K7bsmCATCe7rtjendQ==
X-Received: by 2002:a05:600c:1e09:b0:425:6b8a:7013 with SMTP id 5b1f17b1804b1-42641758bdfmr8650935e9.35.1720011425198;
        Wed, 03 Jul 2024 05:57:05 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b8e2sm237148925e9.16.2024.07.03.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:57:04 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] jsonrpc: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed,  3 Jul 2024 15:56:53 +0300
Message-Id: <20240703125653.21683-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 12:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111226

WARNING: jsonrpc-1.4.1-r0 do_package_qa: QA Issue: File /usr/lib/libjson-rpc-cpp/cmake/libjson-rpc-cppTargets.cmake in package jsonrpc-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index 544922f05..f0c60e5a8 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -25,4 +25,8 @@ EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO
                   -DCMAKE_LIBRARY_PATH=${libdir} \
 "
 
+do_install:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${libdir}/libjson-rpc-cpp/cmake/libjson-rpc-cppTargets.cmake
+}
+
 FILES:${PN}-dev += "${libdir}/libjson-rpc-cpp/cmake"
-- 
2.25.1


