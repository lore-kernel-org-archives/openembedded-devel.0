Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF32FC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 20:39:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.18789.1654807181586507035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ph26ocDa;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id bg6so29938749ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6V6P1UtXBwYHTVB/QIXud/VMzd+LY1L/Ig0h/9C6jg4=;
        b=Ph26ocDaDzqxFM7QtvQJ/x0MaZv5Pxetpb1oPFzTJ94fqLaALs0GL9cWZdoNavXqvP
         XeAxgE1RvPRTcPGcJWa93b0uwLo0VcLzGKgStRAq+d7sYCwNqZsRVrx+kOvzxvKFKYFU
         cbNngt5JjpLOpAfJqZ4qaJRgm5yagXifyQN00aH7vtYnLT8iEVjM7qyEFKk9GBrqn5Hy
         vJKe4BnqUCLRIEjzqG5uRxeEB3twvURMMKFDlDXQBzpVp9qg6s8GLUVuJpszriHCgqDs
         tlIc+iR4dMjVr1k/4h7xMA6/iDgjsys9ku6MG+Mmnpzu+oNXO06NNhy8aH52jhdsR8d1
         c+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6V6P1UtXBwYHTVB/QIXud/VMzd+LY1L/Ig0h/9C6jg4=;
        b=sW8X7KFQk2Cf2iDE/CdilmG1lx76z4B954pHzHq+RkvXC1DsuXr0HVDwsGRwiR/K2Y
         eiD65d6//A8HaWNYDAPpHPasPZ3jdgp7mC+zeKbwx1xWYqrzYxjpxPQusB78W7TB0Kf1
         kGSm9gKp59jwAuwCR5+Q+6KUkvywt1jlpdAFai8/xHyPzzEf1fmVyDR4qijAsMwj2rxL
         X+AkJyVeqpXhm685kMbXvE2A8/Q1raJ81/KeA2msODhkSkGxJ8yZqV7t5uSc86387XxD
         FRONTU2BPmhUQVFgcCFyh1kTg/YjiykuRJM5mEOCuMcpJ4FbiGGiOtBIsxvJD1S6c3Aj
         epDQ==
X-Gm-Message-State: AOAM531SLdTFlhCXWL4KQD2BsKrZC5A099fXpBb4a6PQSPNE2fNbPnZB
	opOz+lQXZuFdiC8yt/Jo02ggCsYVK0pQLA==
X-Google-Smtp-Source: 
 ABdhPJwjSb4t+vic0Xnuhus3gTtnhll2XecyHhzb16F+AfBMMFDijzpJeOBGSPFzmxr8ihYV6204EA==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr36777486ejc.568.1654807179790;
        Thu, 09 Jun 2022 13:39:39 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id
 gi5-20020a1709070c8500b006feb8cebbbfsm11113868ejc.6.2022.06.09.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:39:39 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump 1.34.1 -> 1.35.0
Date: Thu,  9 Jun 2022 22:39:21 +0200
Message-Id: <20220609203921.499175-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 20:39:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97468

Do not that some collectors (a.k.a. plugins) moved from Python to
Go.  And Go is not (yet) part of this recipe.
More info at https://github.com/netdata/netdata/releases/tag/v1.35.0
under 'Deprecated in this release'

The patch should be handled by recoding upstream.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...plicit-typecast-to-enum-rrdset_flags.patch | 39 -------------------
 .../{netdata_1.34.1.bb => netdata_1.35.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.34.1.bb => netdata_1.35.0.bb} (94%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
deleted file mode 100644
index e3c7a7cd2..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Use-explicit-typecast-to-enum-rrdset_flags.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e8ec0a0f3a353a8167687a8fdb26773e45927aac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Apr 2022 09:49:12 -0700
-Subject: [PATCH] Use explicit typecast to enum rrdset_flags
-
-specifications say
-An enumerator can be promoted to an integer value. However,
-converting an integer to an enumerator requires an explicit
-cast, and the results are not defined.
-
-Therefore The bitwise OR operation you are performing results
-in an int, which you then attempt to assign to a variable of
-type rrdset_flags without a cast.
-
-Fixes
-| ml/Host.cc:167:9: error: assigning to 'RRDSET_FLAGS' (aka 'rrdset_flags') from incompatible type 'int'
-|         rrdset_flag_set(RS, RRDSET_FLAG_ANOMALY_DETECTION);
-|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/netdata/netdata/pull/12750]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- database/rrd.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/database/rrd.h
-+++ b/database/rrd.h
-@@ -489,8 +489,8 @@ typedef enum rrdset_flags {
- #define rrdset_flag_clear(st, flag) __atomic_and_fetch(&((st)->flags), ~flag, __ATOMIC_SEQ_CST)
- #else
- #define rrdset_flag_check(st, flag) ((st)->flags & (flag))
--#define rrdset_flag_set(st, flag)   (st)->flags |= (flag)
--#define rrdset_flag_clear(st, flag) (st)->flags &= ~(flag)
-+#define rrdset_flag_set(st, flag)   (st)->flags = (RRDSET_FLAGS)((st)->flags | flag)
-+#define rrdset_flag_clear(st, flag) (st)->flags = (RRDSET_FLAGS)((st)->flags & ~(flag))
- #endif
- #define rrdset_flag_check_noatomic(st, flag) ((st)->flags & (flag))
- 
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
similarity index 94%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
index b777d2089..26dc62d29 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
-           file://0001-Use-explicit-typecast-to-enum-rrdset_flags.patch \
 "
-SRC_URI[sha256sum] = "8ea0786df0e952209c14efeb02e25339a0769aa3edc029e12816b8ead24a82d7"
+SRC_URI[sha256sum] = "7981103c4ddd452de3a4565fb6c304454dc4c9adcc1954d716102f14df8ad4bb"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


