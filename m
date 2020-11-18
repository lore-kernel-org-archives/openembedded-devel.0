Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.25416.1605712086301917028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tQ7jYckr;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id t37so1299676pga.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zT6LhmRxHR4bkwe1mTbbdRhX9BA8CzZ+QwuBXzh0pEs=;
        b=tQ7jYckrQzKO3DNrAkUEAHJ7gASfwhBonOqxVtBnAqcCc//mEH8breJPG8edW1FLzV
         d6Phu5v/zckZX4k6b7YdvjKc+F0yf/twT5BgNQbzoL2/2o4he/LYVCHHVTwJsxyWiJXQ
         2OL9RS4wmHbkT+QtgftJo3sp9URywNMLhkS7ws22TlfGEQhch8PHcsiXRwEb8Xq/F70F
         3IuQB/LNSWnBzKK83nRVcaCnRu4QudOkCKm1v+NOI5zUWwqSLvueoIXnAV9DY48227rf
         gRlPq7QrqaNruP1XTOTbbjg5OPH98MeQqrgc8IPaHti0tX9X9So8T2v1VRmAzJq/b7oi
         MGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zT6LhmRxHR4bkwe1mTbbdRhX9BA8CzZ+QwuBXzh0pEs=;
        b=p0krQB6USrJrbWiHvEceopCdUeupzvVrD/lLQCOu7DarYKhk001delyxKfHP0tN98X
         yYdl1w0ZBkJdcViPXgs8oihEidxhlmuESf6Hw8ietjV9V2QZyWEQzwPCf+MYjOApCsog
         Ma+v+tYS8WgdIghX5llz8fodu5IdbkRDVyRqzu4C0p3AfIQrEeXq6HQyVOL8+ErpmIIV
         xNYpxezroa1j7025hEZE4nSE/E635ffmWdDkBWk3MzSN3w1i4w930fhrGfaPwbgtFjm0
         m9lGrc4PKwi/u0l46mXdvdpYBj/ztW5RQ0s1yzMvj6rGfltFgtsAGMHJkNY4p0hHRPWz
         aaow==
X-Gm-Message-State: AOAM530MpsveW2uwkxDtHGGOv7Yv8QyBj6F8A4QptzIZ2RcfsJjkKMCp
	8kI6xXimeS1XCfDWXxePoDqjulJArU8=
X-Google-Smtp-Source: ABdhPJxNaFqu9AAkobe/0g/HejIda4Rjzi0T+bIwD3rZNUavsgZHjS444cFKGHTXbMzUmqxnzOeQdA==
X-Received: by 2002:aa7:8801:0:b029:18b:5878:30d6 with SMTP id c1-20020aa788010000b029018b587830d6mr4957844pfo.77.1605712085568;
        Wed, 18 Nov 2020 07:08:05 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:05 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/17] glog : improve reproducibility
Date: Wed, 18 Nov 2020 07:07:42 -0800
Message-Id: <a51c0d9b3a0d7dc5986ce46e7de65ef26cd06373.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove WORKDIR info from config file to improve reproducibility

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit be95549f2ea5c59c6da6ace852b918cdba3c7822)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/glog/glog_0.3.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 9a8332836b5..56bf5155446 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -25,3 +25,10 @@ PACKAGECONFIG_remove_riscv32 = "unwind"
 
 PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libunwind,libunwind"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
+
+do_configure_append() {
+    # remove WORKDIR info to improve reproducibility
+    if [ -f  "${B}/config.h" ] ; then
+        sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
+    fi
+}
-- 
2.17.1

