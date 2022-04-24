Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AACC38A2B
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19606.1650819518043533237
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 09:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nvg73Ofb;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id c12so21976449plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VybriwTWTlGPDpvZMQpyM6eJImW2JC9RadK/5u3Js3s=;
        b=nvg73OfbBaY4ZL1dpS8kkvAn3E7ASBAaLhlml23V8e2QVmHJ1a2NhZ1R5WwaYcrp4O
         h3qi1oqfobQuJRx3rbLi8kwcbKgHoQmnFY7gPPHWgD/FwduQ4TNP2F7qpTEFh4NLxFFF
         g3eKFMhIIpgV16BKGc2GPnT3oZnFW/0eyaeiutczMeho3jJuDJWDVY1PxtAIRu+J8AkS
         5IJcFTOPDbFq/P1DJUAn/CsK1gt0qWPPayumXa8+Yw4DODevTvA0raGzm4mql4frvJVW
         mXUX4+is03rCEhbsojtGcYgYzwW+DujxKwSZQZg5KvGpw8DozHmJvGWe+/hLArfYoF8a
         OQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VybriwTWTlGPDpvZMQpyM6eJImW2JC9RadK/5u3Js3s=;
        b=OA6Yh2JmlM9MtF4OLCWphZfbvQ5DgVd/pGBYq5HCUH1aN0mSL79VP8VulclKxICr4a
         CDCLf/bLFYjFdVeojVaveuUjoumYRJ0BVxKfMWexNdEwv1YTqCGUwySS+qOmAMLTBgL5
         B6s8cYin5IqZoXQEfKkyV4Zc3fiIJ5It80sJ+ytoQhYBU7xYRAi5ImAkFB0iREfKj+78
         NRUL26evKwUle73+cv7eUpPEb6c2+uEss03TjaMJKwuAbErJxy8gDjT8qYqhhMpHZ6EP
         p9EzsPUz8INBmENvqUXTMBwMeBwwhCPtpBLZr8CfP0hAAePCWkgSqAErSNiGK5LywRyT
         r6Lw==
X-Gm-Message-State: AOAM530l9jUaHPnrOIo6egxhNWYz1Wjl3R7ucPIe+1cZh7GMyJRXLF0f
	xMP3HTTMsuckXgDSN4cp73Hx0B0fwJq1iw==
X-Google-Smtp-Source: 
 ABdhPJzH+WhXP6tkPl7ZsMm0oM8/7JIM2zz6GcFtWskrNjKOIhhYNHlPLArBPWbcaw/Vsb3+5bWbig==
X-Received: by 2002:a17:902:aa8e:b0:158:e94b:7c92 with SMTP id
 d14-20020a170902aa8e00b00158e94b7c92mr14334609plr.126.1650819517290;
        Sun, 24 Apr 2022 09:58:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a17090a9b0f00b001cd4989fee6sm12097355pjp.50.2022.04.24.09.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 09:58:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Fix build errors with clang
Date: Sun, 24 Apr 2022 09:58:34 -0700
Message-Id: <20220424165834.4071907-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96753

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...plicit-typecast-to-enum-rrdset_flags.patch | 44 +++++++++++++++++++
 .../netdata/netdata_1.34.1.bb                 |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
new file mode 100644
index 0000000000..d0002887e1
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
@@ -0,0 +1,44 @@
+From e8ec0a0f3a353a8167687a8fdb26773e45927aac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Apr 2022 09:49:12 -0700
+Subject: [PATCH] Use explicit typecast to enum rrdset_flags
+
+specifications say
+An enumerator can be promoted to an integer value. However,
+converting an integer to an enumerator requires an explicit
+cast, and the results are not defined.
+
+Therefore The bitwise OR operation you are performing results
+in an int, which you then attempt to assign to a variable of
+type rrdset_flags without a cast.
+
+Fixes
+| ml/Host.cc:167:9: error: assigning to 'RRDSET_FLAGS' (aka 'rrdset_flags') from incompatible type 'int'
+|         rrdset_flag_set(RS, RRDSET_FLAG_ANOMALY_DETECTION);
+|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/netdata/netdata/pull/12750]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ database/rrd.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/database/rrd.h b/database/rrd.h
+index 071e1d0..dc8e39f 100644
+--- a/database/rrd.h
++++ b/database/rrd.h
+@@ -489,8 +489,8 @@ typedef enum rrdset_flags {
+ #define rrdset_flag_clear(st, flag) __atomic_and_fetch(&((st)->flags), ~flag, __ATOMIC_SEQ_CST)
+ #else
+ #define rrdset_flag_check(st, flag) ((st)->flags & (flag))
+-#define rrdset_flag_set(st, flag)   (st)->flags |= (flag)
+-#define rrdset_flag_clear(st, flag) (st)->flags &= ~(flag)
++#define rrdset_flag_set(st, flag)   (st)->flags = (rrdset_flags)((st)->flags | flag)
++#define rrdset_flag_clear(st, flag) (st)->flags = (rrdset_flags)((st)->flags & ~(flag))
+ #endif
+ #define rrdset_flag_check_noatomic(st, flag) ((st)->flags & (flag))
+ 
+-- 
+2.36.0
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
index 71fb0783b6..b777d20897 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 DEPENDS += "libuv util-linux zlib"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+           file://0001-Use-explicit-typecast-to-enum-rrdset_flags.patch \
+"
 SRC_URI[sha256sum] = "8ea0786df0e952209c14efeb02e25339a0769aa3edc029e12816b8ead24a82d7"
 
 # default netdata.conf for netdata configuration
-- 
2.36.0


