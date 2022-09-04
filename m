Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9105C6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.11320.1662276907483269508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRSG4uux;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 202so5580929pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ofK2GQjrwv6H7oRXeHRm6bwKAFH0/WArqtHZPDz4eV4=;
        b=WRSG4uuxqnkwFhe6TCkQdVg9YNid0Sk0DMob7RJvOc76oZPu88qhPTbY/iwXTvU0cs
         lepqyEEtxrLmWYzsV2m+3QSakuzaa0GFSOYoswZKPcNxFBVyg5VzfrbsunvlEYwcin8J
         p7pQ69qRCDGLgxde9jNWF8P9/M4GZRtP7VO6ck8AjerOLOpkVFLDwTt9IEgADN2V3RPn
         /TRoxZqcfGYlehnGj9olvBzA7jq+3FVgvUDGR78bDcH0lUS3cHb5yNhQjzj7tZ8RX6Mv
         xUlUws02krgHTp2UUXL+L+oOlVzAD6REsxGOlgYPG2BmuuvnL6D4jkUgdHatDU54KwSt
         BayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ofK2GQjrwv6H7oRXeHRm6bwKAFH0/WArqtHZPDz4eV4=;
        b=TMM46V1aLgM7d0/iEA4GaW5H/MbizorsEe0MTGdsmXvLjQ2BwGHzDNSXCSv0ygoqq3
         EzFu0L6hONKKN2wshp3F21aq+y8WWkBOj6b9G8gPYqMD/GqDgO/L6z7v72VHBOXoq9jT
         jVn2JPvtvZvNR5uy7HGdVMKiaMCGdkISl4l6zKDnb7nk+Q7QsSlpIOc/kWA1oA/Us8mM
         1Zhkh69vkk5psxFrliwF0doP02oLoMzZVmBju/J54KlORXkYY27WVe6YeCZUwKtVU7cJ
         JMalwPoqdqO3sMFxbRKyD7Kc/kVII0GdBJ+xZCCtBhsDIcGT0Va3+vB0fLj4T50+nhVw
         dCpg==
X-Gm-Message-State: ACgBeo0N8s20tZ8tXcyc9Tid18NIWzWuyaLYIrxO0WhFxn0PSvXMNBrc
	NRO/oSK+78WpNQsGdb7cZn56PFRNYjCOow==
X-Google-Smtp-Source: 
 AA6agR52bSwWOaUrOvt3FXsjaXurDPJzDqP/CevsatZ3IMt7CrVhizsvrMG54CEm7uNujfp+Af5WNA==
X-Received: by 2002:a05:6a00:3306:b0:538:444d:87d3 with SMTP id
 cq6-20020a056a00330600b00538444d87d3mr32132406pfb.38.1662276906691;
        Sun, 04 Sep 2022 00:35:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 45/63] oprofile: Fix configure check for perf_events
 support
Date: Sun,  4 Sep 2022 00:33:59 -0700
Message-Id: <20220904073417.3251865-45-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98639

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gure-Include-unistd.h-for-getpid-API.patch | 28 +++++++++++++++++++
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-configure-Include-unistd.h-for-getpid-API.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-configure-Include-unistd.h-for-getpid-API.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-configure-Include-unistd.h-for-getpid-API.patch
new file mode 100644
index 0000000000..0ac03bde50
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-configure-Include-unistd.h-for-getpid-API.patch
@@ -0,0 +1,28 @@
+From 46f0aadf80d5e28f587149b6e90c3ba005971f6e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 19:22:17 -0700
+Subject: [PATCH] configure: Include unistd.h for getpid API
+
+This fixes the check for perf events support in configure
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index e4f4024..3384628 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -119,6 +119,7 @@ if test "$kernel_may_have_perf_events_support" = "yes"; then
+ 				#include <asm/unistd.h>
+ 				#include <sys/types.h>
+ 				#include <string.h>
++				#include <unistd.h>
+ 			]],
+ 			[[struct perf_event_attr attr;
+ 				pid_t pid;
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 23e7d3d5c3..e6eec0ab05 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0008-include-linux-limits.h-for-MAX_INPUT.patch \
            file://0009-Prevent-running-check-tests-on-host-if-cross-compili.patch \
            file://0010-oprofile-Determine-the-root-home-directory-dynamical.patch \
+           file://0001-configure-Include-unistd.h-for-getpid-API.patch \
 "
 SRC_URI[sha256sum] = "7ba06f99d7c188389d20d1d5e53ee690c7733f87aa9af62bd664fa0ca235a412"
 
-- 
2.37.3


