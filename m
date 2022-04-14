Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC8C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 17:17:28 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.410.1649953911008257463
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aXSJPqg2;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id f3so5336785pfe.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPaRdbikoL/GzK/lKO7vIYuOWvpFW7WbagnE0Xwvk5k=;
        b=aXSJPqg2byOldzhUNOLIagV5jLssW5LXmJ53Qfj7Ndoy+vNxxE9gNIusGN4i12lB5H
         PXaLMnYKvXCK1xJy54wyXnCDZx9nYPDEuwmJEfqYggpuF76b+0aaiEzRFrv2ke6N+w2E
         m2rN3Z0MpvWbHwxrx3azXBZEnA7LJ/z+wLJvHQxS+GkWqlSuY5Zw7/QPovrTV6C5y5Tu
         /AO8+d86h+suw8gfe7tVds+yHidljrvq5izSuIOS5ShZvjbb0hMlWbfAVp+G77yOVEwG
         Dk09EpuoqU1b0PEaMLejDk2ZDYec77cPwWgTQPqYzRVcHERC+Rqk1SA5u3hJF1PKDu7Z
         AsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPaRdbikoL/GzK/lKO7vIYuOWvpFW7WbagnE0Xwvk5k=;
        b=tBOUcs4ufe54oHIbHHTgDk7rohHbmWdsRwMbUmqq1Zo/t4te4ZT+j5UIze4Jtybe9b
         AJ6cHvSa/MGzH/ulpas/NfQ6jXpdlKBxmWkBgmAewM4pfqb7Ahzz/2AU4Ch3CY7Ibznj
         KFK3tqbg4dELPL4VOb6R1nYP9aOhVXZyJTHAmuFaq+vBiNabmewrHAlu2bIFk3WzcERW
         xSQw1LsIPBZj3TBLE5OLm4FEepZrmqvMBHBOjjTzuVZJxFacVZ7UFah3mKFQFUZ+s0Ke
         4dur+OL7xdpN82dJoCx0Ne+PrSnErwXFmtsuVGuQt9zx4H1Z7sm6RwvhscqJ09Rv71f8
         5vgQ==
X-Gm-Message-State: AOAM532oLLDzYbpnF4CYP8ZPwmMRBV7/sjdEpR6MUZjKgYw4XCITVnfi
	ixP2IKwsFoNelijW5IWkQNy2gbFnOagJhQ==
X-Google-Smtp-Source: 
 ABdhPJx4FHy8YUPkPXFTcs/+hL9C5+KzTm3GZCVxvow460dilmtBJQpMZwSIvQ5TSstEnhaNDMiqUg==
X-Received: by 2002:a63:7d4a:0:b0:398:dad:6963 with SMTP id
 m10-20020a637d4a000000b003980dad6963mr2870642pgn.329.1649953909853;
        Thu, 14 Apr 2022 09:31:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a62e110000000b005061e2323bcsm364516pfh.162.2022.04.14.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 09:31:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Fix aarch64 build with gcc12
Date: Thu, 14 Apr 2022 09:31:47 -0700
Message-Id: <20220414163147.1583416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 17:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96654

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...just-the-cache-alignment-assumptions.patch | 45 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
new file mode 100644
index 0000000000..4b2a397b16
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
@@ -0,0 +1,45 @@
+From 5c9e0d0fc9188bab0ae09c9c33df01938b0c1b6c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Apr 2022 09:25:33 -0700
+Subject: [PATCH] server: Adjust the cache alignment assumptions
+
+aarch64 has 256 for hardware_destructive_interference_size and gcc 12
+has added a warning to complain about mismatches which results in
+static_assert failures
+
+In file included from src/mongo/s/commands/cluster_find_cmd.cpp:39:
+src/mongo/db/stats/counters.h:185:47: error: static assertion failed: cache line spill
+ 185 |     static_assert(sizeof(decltype(_together)) <= stdx::hardware_constructive_interference_size,
+     |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The structure need to ensure true sharing for both the elements
+so align it to hardware_constructive_interference_size instead
+
+Upstream-Status: Reported [https://jira.mongodb.org/browse/SERVER-65664]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/db/stats/counters.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mongo/db/stats/counters.h b/src/mongo/db/stats/counters.h
+index aa11c84c2f1..710d75a672f 100644
+--- a/src/mongo/db/stats/counters.h
++++ b/src/mongo/db/stats/counters.h
+@@ -178,10 +178,10 @@ private:
+     // These two counters are always incremented at the same time, so
+     // we place them on the same cache line.
+     struct Together {
+-        AtomicWord<long long> logicalBytesIn{0};
+-        AtomicWord<long long> requests{0};
++        alignas(std::hardware_constructive_interference_size) AtomicWord<long long> logicalBytesIn{0};
++        alignas(std::hardware_constructive_interference_size) AtomicWord<long long> requests{0};
+     };
+-    CacheAligned<Together> _together{};
++    Together _together{};
+     static_assert(sizeof(decltype(_together)) <= stdx::hardware_constructive_interference_size,
+                   "cache line spill");
+ 
+-- 
+2.35.2
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 310a0aa38e..7ea728aad4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://ppc64_ARCH_BITS.patch \
            file://PTHREAD_STACK_MIN.patch \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
+           file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.35.2


