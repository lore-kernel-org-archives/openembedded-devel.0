Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03E0C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.1468.1648343680691511262
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q08D167A;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so15529546pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LeiIQCySmCcyH2F+V8JcUQqQ6tgZMDB0R/IOWboYYDM=;
        b=q08D167Ayhg4sE53UqiIipvyHvMPbxgfWqFY3iYXRrMgGSe++x09p/SN/QHRp2ZTbr
         JzdtC3F4xTATI4CsZ7idZ09MVi88v9G/q9m2knKi4Y8dSgq8pO5ukQxlieM8N1edW/mV
         5enoDdyC8LqSLE1lLWuLMtxisp3CvSvodGddFHXi1MgihDvklUTfGuQhcT8218xRjj0W
         jQvZ70FjGlnc+nYOa7ovhRONFOqObTPnKyihJQJm0FBwDcnJUJ/pmMikNpNLkxFh/fyS
         JDq6KspmqLZo3pee2VYTEHB1jO0wrTj29fhvXlhccEx+kDXncYQJ5V5DM5mQmwOdcYTX
         t/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LeiIQCySmCcyH2F+V8JcUQqQ6tgZMDB0R/IOWboYYDM=;
        b=1ZSViFlabIfqUzQTrbKuZVGGlTthyVcO13YmXoDrLDeoUr6EKUPqx5KFTbn8DoJb7S
         8AZQr4Hc7vLsuPAoaZyEW44yNoHeyM6WKFe5ZFus1kjEzhXpDPvmDPZ47V+5j11x4tot
         zpH7F0viz9+QlQy1B5KKuyVjdg4lLvvKwFbSAe0WJGQz5Q+y2VFP58n3XIxz2bexpd1H
         sDfpkkiRd3Uxt9QYdIGNDJqeaYFAS5QKcbOWNqVyfNmUlK6x3AcGDGwINWTwC1DVUCjm
         uaUcAmGgTv3byndU8kdO5PA9KdCaIGIDW/iMgpTGHm/poOkfjrP4t5pB/NFm2R6BAIHr
         xa1Q==
X-Gm-Message-State: AOAM530fhoI2StTUfiHdVx6bXuo2AG4MERLNONvoqCi8rPxcncRTieX7
	NLewoRq4uGl5iaio4gcCGNwbVXxpJbI=
X-Google-Smtp-Source: 
 ABdhPJw1NYe0EKW+6atp/RzVlOld1/qPAtaccMCSj99YXHls8FtJN7ZpgViEfDnvIVQNcroL8RBwSA==
X-Received: by 2002:a17:902:e9d3:b0:154:6dd6:2521 with SMTP id
 19-20020a170902e9d300b001546dd62521mr20009260plk.59.1648343679969;
        Sat, 26 Mar 2022 18:14:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] pmdk: Fix build with newer ndctl
Date: Sat, 26 Mar 2022 18:14:32 -0700
Message-Id: <20220327011432.555592-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327011432.555592-1-raj.khem@gmail.com>
References: <20220327011432.555592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96221

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...axctl.h-instead-of-ndctl-libdaxctl.h.patch | 69 +++++++++++++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb  |  3 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch

diff --git a/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch b/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch
new file mode 100644
index 0000000000..0b03ffdea5
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch
@@ -0,0 +1,69 @@
+From 932252c0ba54a51c8bcf58b747656e29cdebfa6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Mar 2022 13:06:50 -0700
+Subject: [PATCH] use daxctl/libdaxctl.h instead of ndctl/libdaxctl.h
+
+Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/5413]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libpmem2/badblocks_ndctl.c        | 2 +-
+ src/libpmem2/region_namespace_ndctl.c | 2 +-
+ src/libpmem2/usc_ndctl.c              | 2 +-
+ src/tools/daxio/daxio.c               | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libpmem2/badblocks_ndctl.c b/src/libpmem2/badblocks_ndctl.c
+index 9a5910bba..cc637f7f4 100644
+--- a/src/libpmem2/badblocks_ndctl.c
++++ b/src/libpmem2/badblocks_ndctl.c
+@@ -16,7 +16,7 @@
+ #include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <ndctl/libndctl.h>
+-#include <ndctl/libdaxctl.h>
++#include <daxctl/libdaxctl.h>
+ 
+ #include "libpmem2.h"
+ #include "pmem2_utils.h"
+diff --git a/src/libpmem2/region_namespace_ndctl.c b/src/libpmem2/region_namespace_ndctl.c
+index 1383796a9..e31185984 100644
+--- a/src/libpmem2/region_namespace_ndctl.c
++++ b/src/libpmem2/region_namespace_ndctl.c
+@@ -6,7 +6,7 @@
+  */
+ 
+ #include <ndctl/libndctl.h>
+-#include <ndctl/libdaxctl.h>
++#include <daxctl/libdaxctl.h>
+ #include <sys/sysmacros.h>
+ #include <fcntl.h>
+ 
+diff --git a/src/libpmem2/usc_ndctl.c b/src/libpmem2/usc_ndctl.c
+index be63e879b..c58032a83 100644
+--- a/src/libpmem2/usc_ndctl.c
++++ b/src/libpmem2/usc_ndctl.c
+@@ -5,7 +5,7 @@
+  * usc_ndctl.c -- pmem2 usc function for platforms using ndctl
+  */
+ #include <ndctl/libndctl.h>
+-#include <ndctl/libdaxctl.h>
++#include <daxctl/libdaxctl.h>
+ #include <sys/types.h>
+ #include <sys/sysmacros.h>
+ #include <fcntl.h>
+diff --git a/src/tools/daxio/daxio.c b/src/tools/daxio/daxio.c
+index 66cd0b7ae..7f2c89d48 100644
+--- a/src/tools/daxio/daxio.c
++++ b/src/tools/daxio/daxio.c
+@@ -21,7 +21,7 @@
+ #include <string.h>
+ 
+ #include <ndctl/libndctl.h>
+-#include <ndctl/libdaxctl.h>
++#include <daxctl/libdaxctl.h>
+ #include <libpmem.h>
+ 
+ #include "util.h"
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
index 4354c83371..33d04099c9 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
@@ -11,7 +11,8 @@ DEPENDS:append:libc-musl = " fts"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.11;protocol=https"
+SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.11;protocol=https \
+           file://0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch"
 SRCREV = "5b21904a257eff47f2e87fcbf2de46111f03ddd8"
 
 inherit autotools-brokensep pkgconfig
-- 
2.35.1


