Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612FCFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 22:55:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27420.1777935295289196287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2026 15:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gXFGxE2o;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2240517b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 15:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777935294; x=1778540094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7Uav8R7QtDtN2HKCJ2I8A0t28lx+gj0F+/vRtQ/rN4=;
        b=gXFGxE2ouVlfW1AKXPmolWvoBUodHxEJLRKQiZe2IqrBKdtFoYxlm+8nWDISxwZ1md
         q/3tF0qq4Z4sSXym6GWSV4WtRofxJc+M9oB9zSkpWqdQscREJmuxO/cIUKbm3dj2K8kT
         8qrUGbuR+OMl6LLV7+ddy/mkztT74hCB1qY2d5Jn/hd6dQO09niyY5NbGdfUovh9C7kk
         LPGAtbPp5bEbl4GnDe1NmnIOJODECzkvsiTI7eQoBoGPanzMBewu2V7tpkbURD4ncNdo
         Yp+b/2sTLoSLoNx6IK6w1ExqhcV/vPsNycEhTD61BmDMCtLeyg3tOihzRqykYuWhRB3X
         Uykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777935294; x=1778540094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7Uav8R7QtDtN2HKCJ2I8A0t28lx+gj0F+/vRtQ/rN4=;
        b=Q+1NZ6QfHUACauGYSvLibgPDLmKhsiOHvpZFOgiA6t84JXDk+e+YmcI9wTV79agO0Z
         xMc+Vg2reou0EtMeKrQTJusLw1iTl5YTmL9DbyBw/24uxbYYLsaBlwjShFsDWnhc+hjn
         zOm9A7JANmyZGEYR+VAw78bxgv0uIdE8lFPFGKytAvrJ+66H6fiQvBya2597gt5Q+VGC
         NT2+L58Zqv+GeWa0PU+WiKn6Kz7Rjt5hm7EKaJSt0ldgEJS+z4atf2Vu6Wo+koYg3Ixn
         BoJ2B9UdAjMljZAnChPqFprquH12rs1P82L6GcY1vAsx1jL+FBDTxGjtVt8WVQ2jxHRG
         V1yQ==
X-Gm-Message-State: AOJu0YxhIB672T0PG6JT5+kcDTFdGOgrAfyEgykmMpAW+5dnSv7KE5Z2
	D2nSQXvKzVGfLVgSvsK07BqVtNRwZIUF+4J+2DvDvVlYoHjyD2Gm/ZboEwcbCg==
X-Gm-Gg: AeBDies9PoNbLZj77B7E9DUvuwaXR7LZZulM7E0rI6gpS5v+0yqdae7lrQ0xIt2bN7U
	4dOHpoPA7AzmX8t7AFp0jRsqGT6OyCnSIRwTUdp1/X2AkqlbPrIvEtj5XhuHEjQ5WK1Mv6buog2
	w02CmBCoJOYWpdOodqAw9ZOE/iFpbFHrQ2KbBnZWUrdbqYS2qNBuLcr+8gCE2JSQKemtDDz0zcO
	WB8iP+NMg1p9JAGIZ9kv6bVDQs2FpR2j4yd3j7gjvMi5xFu0egj97sRw4w2zxHnX4ruzsyXP6oR
	NboG4X3Lrb2FTEHoHdnijt5Ai4OvMuHVVFHLEicQ+rQXB+EBJoQTHA2TXidVHu3qe8PQbFtMhlY
	d+tGqI5bvS/cG/41zAbYgUykL5n2HBx1v9RrprPKOATD/fk2WypE4KTL96qWX98TzlC4d4VHupw
	eqMFQ9m6SsEflkD0dDKkYuedWp8sKTW456TRu2Wh+QXs6mdiU=
X-Received: by 2002:a05:6a00:4510:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83544477035mr6934299b3a.30.1777935294376;
        Mon, 04 May 2026 15:54:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839460a00f7sm165259b3a.32.2026.05.04.15.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:54:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] freerdp3: upgrade 3.24.2 -> 3.25.0
Date: Tue,  5 May 2026 10:54:30 +1200
Message-ID: <20260504225430.1302619-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504225430.1302619-1-ankur.tyagi85@gmail.com>
References: <20260504225430.1302619-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 22:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126779

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/FreeRDP/FreeRDP/releases/tag/3.25.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/{freerdp3_3.24.2.bb => freerdp3_3.25.0.bb}       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.24.2.bb => freerdp3_3.25.0.bb} (94%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb
similarity index 94%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb
index a4561495cf..e71f2e213f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "3028b706908f81767d9b9c744a90778c28f57d61"
+SRCREV = "90e7f064dc3ab8672b8ec714059d8cd51be0743f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
@@ -68,6 +68,8 @@ do_configure:prepend() {
     sed -i 's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|' ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
     sed -i 's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|' ${S}/libfreerdp/codec/test/CMakeLists.txt
     sed -i 's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|' ${S}/libfreerdp/codec/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|' ${S}/server/proxy/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|' ${S}/server/proxy/test/CMakeLists.txt
 
 }
 
@@ -89,6 +91,7 @@ do_install_ptest() {
     cp -r ${S}/resources ${D}${PTEST_PATH}
     cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/test/
     cp -r ${S}/libfreerdp/codec/test/interleaved ${D}${PTEST_PATH}/test/
+    cp -r ${S}/server/proxy/test/conf ${D}${PTEST_PATH}/test/
 
     cd ${B}
     # the test definitions, how to execute the tests

