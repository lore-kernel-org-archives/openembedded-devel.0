Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE33C6FA90
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.2744.1662594078498214432
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJR8Grjg;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id p18so16105304plr.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ywNrDPDSO4wSjSUFTIhYVl4FmKicM6OG76Te0FYqsqs=;
        b=MJR8GrjgwYmsq2KkQy86kz+F7OTi0ouMHBvAlgONcGwUTjDgxUvaCbEN4rVzGWHShS
         mG5UqbyGaSpLrRAkqSMCyiCOUT0qfc++7xngr0ZNQywmNN9tU+1/fmoQAvm5HMUYL8OY
         Rx/XXWv6XIN6louJwJltGxA9iqzs6yPdBUPrlQ46nhRHY6C7xVfytIsU+5fThwiQPvzJ
         xDlvAmUkzt9FXnNDADBIulPrtE54gSkAH65gmGz2G7ZNTinFOGItR7GbaahTI8VoVn2V
         uBDgK39KNxeOeyJ3dy8kYizxPm268OIl9Gy7SbMJaB2rOVoyQUqDMz/Vakm0l2zUwun0
         uf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ywNrDPDSO4wSjSUFTIhYVl4FmKicM6OG76Te0FYqsqs=;
        b=EnMvG03JRqB5wtqM+gf+DvpxC/hi8XjyCrV00rWHVn3YcA559eZlwEG1op8Jqx68qJ
         cy1v0wMLPSn3NZxOcA/2vLzguVsKkilCGBvMBFUN39b2slFAogJKL+dEGrx2x+Y/aOR1
         Xtxxsevgl+nX95y5wy/OGalnilQ1YjPhs9iliKKoCC93N3tLfgNQM8OpRcZS17DjZYpl
         0iFKbJpmhVmOGK/ANO70G8OFVhu/ra49BblzccPLrICKMMLzDANshABzmn0l7b7++7+v
         XW6RfFXkSFIDVcaF/lhgvYrHcTWYRSQCY+OkRGhOSvoqE8VLNAYIwSMIl9y3CyYn/HnR
         XxPQ==
X-Gm-Message-State: ACgBeo3cNra6PvQBJMiYgAuJzvisAZVh55AUYByaqT+1FEm/r0CjDF0D
	wUB3ns0HlzT8auTHt4iulSLYWEMb3sQXig==
X-Google-Smtp-Source: 
 AA6agR5HssPuEse2VAA5uvNH3lTdCzu8pAeIiBeX857PNp5ttU7B/ad4EiqUNHEowMgU8n2CdoonXg==
X-Received: by 2002:a17:90b:3e86:b0:1f5:2b4f:7460 with SMTP id
 rj6-20020a17090b3e8600b001f52b4f7460mr997271pjb.97.1662594077740;
        Wed, 07 Sep 2022 16:41:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 16/22] sthttpd: Define _GNU_SOURCE if
 HAVE_SIGSET is set
Date: Wed,  7 Sep 2022 16:40:56 -0700
Message-Id: <20220907234102.3312797-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98706

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ne-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch | 51 +++++++++++++++++++
 .../recipes-httpd/sthttpd/sthttpd_2.27.1.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/0001-Define-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/0001-Define-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch b/meta-webserver/recipes-httpd/sthttpd/sthttpd/0001-Define-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch
new file mode 100644
index 0000000000..a1783a7adb
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/0001-Define-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch
@@ -0,0 +1,51 @@
+From f3889e5870e9761ee6113fac7f38aa44cc43e46c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 00:30:52 -0700
+Subject: [PATCH] Define _GNU_SOURCE if HAVE_SIGSET is set
+
+This enforces using sigset() API which needs _GNU_SOURCE macro to be
+defined
+
+Upstream-Status: Submitted [https://github.com/blueness/sthttpd/pull/16]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libhttpd.c | 5 ++++-
+ src/thttpd.c   | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/libhttpd.c b/src/libhttpd.c
+index fa42c10..669be11 100644
+--- a/src/libhttpd.c
++++ b/src/libhttpd.c
+@@ -25,9 +25,12 @@
+ ** SUCH DAMAGE.
+ */
+ 
+-
+ #include <config.h>
+ 
++#ifdef HAVE_SIGSET
++#define _GNU_SOURCE
++#endif
++
+ //system headers
+ #include <sys/types.h>
+ #include <sys/param.h>
+diff --git a/src/thttpd.c b/src/thttpd.c
+index ad97188..3c7a449 100644
+--- a/src/thttpd.c
++++ b/src/thttpd.c
+@@ -28,6 +28,10 @@
+ 
+ #include <config.h>
+ 
++#ifdef HAVE_SIGSET
++#define _GNU_SOURCE
++#endif
++
+ //system headers
+ #include <sys/param.h>
+ #include <sys/types.h>
+-- 
+2.37.3
+
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 4134a0e524..b40b148512 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -8,6 +8,7 @@ DEPENDS += "base-passwd virtual/crypt"
 
 SRCREV = "2845bf5bff2b820d2336c8c8061cbfc5f271e720"
 SRC_URI = "git://github.com/blueness/${BPN};branch=master;protocol=https \
+           file://0001-Define-_GNU_SOURCE-if-HAVE_SIGSET-is-set.patch \
            file://thttpd.service \
            file://thttpd.conf \
            file://init"
-- 
2.37.3


