Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C316FECAAD8
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.8929.1661843662143043760
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDisXRW1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so10966688pjg.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rgtxxncdoo+Iq0vhiosS8njOWy5h8UTL5q4rqDc2jhI=;
        b=DDisXRW1q174O+6CMTX1kahx0zu94ozTmR2euYegFpjbkSOjcAdxcysTm8nYjNLo5A
         xQQVSg9b7H63cw/ZWfCAtMaDJCYG0JNC5hdGS0K3xfRn4g21AxkT22kPhiGYDo/ngQ2M
         xWHCf+/oPHfTNRF8kFwBLRn++wVe13DMIx1uzkYV5rWHO0tqMp1etSa5jaQxEv6sIT4v
         nLpVk06UpT7QEK8x8375BWluecuJ7Nd3mlevKU5xO1yAkOZ2m6UpnC0QgHjpzrJfKBtv
         88CrOHqbbQM0yyxtYr8cWWSfaZtLBZsG1yJZt1HykATOU80Zc3lYiOsrCeN88IMNWpvz
         xy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rgtxxncdoo+Iq0vhiosS8njOWy5h8UTL5q4rqDc2jhI=;
        b=AYfoToEXR3KmJYLCwSomcDJvnM9WCEELEYqdXqX5eWW61zCGkywyFv3VhL6lfHohO3
         Y4wDvRGru7pPKlnsT8iFjMrSdLPm9yO6aFZvLJV5uYIF1X4inVUShppTkd3KnUYhgKIS
         mWeVFD4Wh3MMRhcafWoiwyTs7mLF//uDDwbSgvSCbG6MqLRuoM8QigcwyN9FaDXw0Zmi
         QIingxvTkYxJE+X8LRuGXje/12rA9lczwxtXz3SZWirR7nUf5omEo+TGUrzTFhE/7H0W
         QsIBiXtVAObKAPLsuSP9J5Xnfj6UHBxM/3ihTOETaiQjUPoVxDJxi+EyEeOQUo9bApsf
         i2dA==
X-Gm-Message-State: ACgBeo1w0ri8OhsTVKtMEKl+Uz7HZN8fmYJcGSk/RTcO+Uu2K3xZh1Hn
	97swzn99BZAMZbXE6jLsg1aXev22QDPAxQ==
X-Google-Smtp-Source: 
 AA6agR41S3RLz2fNfmjeEoWxbnYOJXmNxy2hp6tJGv1mMa3Wk7l+wt2BRNzLpAWR4wnuel/9Ka772w==
X-Received: by 2002:a17:90b:2242:b0:1fe:61c:3022 with SMTP id
 hk2-20020a17090b224200b001fe061c3022mr2448426pjb.197.1661843661293;
        Tue, 30 Aug 2022 00:14:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/21] openflow: Include sys/stat.h for
 fchmod
Date: Tue, 30 Aug 2022 00:13:59 -0700
Message-Id: <20220830071413.3887189-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98544

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-util-Include-sys-stat.h-for-fchmod.patch | 23 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch
new file mode 100644
index 0000000000..97e3422166
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch
@@ -0,0 +1,23 @@
+From b875c6e264eaf7350ad4e4ebf427692d8fd3cd72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 12:58:53 -0700
+Subject: [PATCH] socket-util: Include sys/stat.h for fchmod
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/socket-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/socket-util.c b/lib/socket-util.c
+index c7b5d6d..5b3d602 100644
+--- a/lib/socket-util.c
++++ b/lib/socket-util.c
+@@ -42,6 +42,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/resource.h>
++#include <sys/stat.h>
+ #include <sys/un.h>
+ #include <unistd.h>
+ #include "fatal-signal.h"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index b6cef0730a..1ac5dd4105 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -3,8 +3,8 @@ include ${BPN}.inc
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
 PV = "1.0+git${SRCPV}"
 
-SRC_URI += "\
-           file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
+SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
            file://0001-generate-not-static-get_dh-functions.patch \
+           file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
            "
-- 
2.37.2


