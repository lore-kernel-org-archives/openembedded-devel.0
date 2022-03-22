Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F53C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:50:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13494.1647971417383966818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GcUQTh2E;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id q11so16093351pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ooApyl9yTTJuJ3NvDwUn4ry9wmGhiWN8xOCtCYriNLw=;
        b=GcUQTh2EvRbW8TM0W1aknE053AH93bu+6QRLw5wIJJ8GYAsg/ITpQJVv7n32VDPkBs
         Epq4XzsEY8dqDmWcfqzqNBjY2fOsCKQLhN5phoOYDFztqHKd3DUHDcFaxbpVJceeLp8w
         gJHvx+12oMErVSp2+cP/sxaizY9tHI/R/bSJXFUZwmn2GORBI03ZiY7KJiLq7al3tVGN
         fNXOl3Y4wK2gGqFQxP2BuIbO6SSQ+KssK/jMHjPSTW7lWM61QRAfLrbq4VmqnWneTjxq
         MKTF3PTfxMYbMoINoqg0p3mMDHSBbkNb95zjian9LNf49KA8do5Mn/LmWkh5vOLDw202
         aPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ooApyl9yTTJuJ3NvDwUn4ry9wmGhiWN8xOCtCYriNLw=;
        b=pwVieahyCVXDmRogOmxcST8wMjZeLd5rAT+jThfxM05Tz5pZCY26NjeDGzAMSipVZe
         U8LmZlf/fClACF0IyI3jKAf/s0RZ53vZiemoX24aVu/giQu9hkE3RxYx2l9YUxPQyRct
         JfIz4LnDjFfsZR276c9yfAYN348b16RHwfda2NbfWIeSbKeivaP17Ew5W49GBqc6C34T
         lqtYUevV/xRuKJI4zlF0DOxRgoIoTBou+TiLzWA7eTgh8aGHwAjZTNpJUPZxmiInjhax
         tKY0AJFywQyWu4xk5KrPhKWFoi5qcDQmdS/6n3DqxAshwqmO1vQ/nKOSuNlOSNBv6ZTg
         GcaA==
X-Gm-Message-State: AOAM533eoTmFrHT0sJ8leV+7t3r/3u8oL8cLlD//Y+KuNrkUN7ZaVgSj
	A63iCh77UH6JH5zpvbjV311kHN1tsy2iQQ==
X-Google-Smtp-Source: 
 ABdhPJzmzjcVKJ9MgCmHwaQvdcMMQwLrbon0EaBy0ZJwyN8b5+0c9FB+qVFiG4Yh1V3nEi9J/8EXIQ==
X-Received: by 2002:a17:90b:3e82:b0:1c7:2920:7c54 with SMTP id
 rj2-20020a17090b3e8200b001c729207c54mr6440140pjb.2.1647971416506;
        Tue, 22 Mar 2022 10:50:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 i9-20020a17090a2a0900b001c6e540fb6asm3351302pjd.13.2022.03.22.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:50:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] valijson: move out of hard dep on meta-networking
Date: Tue, 22 Mar 2022 10:50:13 -0700
Message-Id: <20220322175013.3378960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 17:50:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96148

curlpp is only needed to build examples, therefore make it a
packageconfig and keep it disabled, which is default anyway

Add packageconfigs for tests and disabling boost as well.

Include boost support by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bbappend             | 4 ----
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb  | 1 +
 .../recipes-devtools/valijson/valijson_0.6.bb               | 6 ++++--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/{dynamic-layers/networking-layer => }/recipes-devtools/valijson/valijson_0.6.bb (81%)

diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 359067cda3..b71b7e4f8a 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,6 +1,2 @@
-RDEPENDS:packagegroup-meta-oe-devtools += "\
-    valijson \
-"
-
 RDEPENDS:packagegroup-meta-oe-support:append:x86 = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'filesystems-layer', ' open-vm-tools', '', d)}"
 RDEPENDS:packagegroup-meta-oe-support:append:x86-64 = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'filesystems-layer', ' open-vm-tools', '', d)}"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 52a82e8acd..a74fe0e9d0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -303,6 +303,7 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     squashfs-tools-ng \
     uftrace \
     unifex \
+    valijson \
     libxerces-c \
     xerces-c-samples \
     xmlrpc-c \
diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_0.6.bb
similarity index 81%
rename from meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
rename to meta-oe/recipes-devtools/valijson/valijson_0.6.bb
index 1d3daa1443..4bed4a4f10 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_0.6.bb
@@ -10,9 +10,11 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
+PACKAGECONFIG ?= "boost"
 
-DEPENDS = "curlpp"
+PACKAGECONFIG[boost] = "-Dvalijson_EXCLUDE_BOOST=FALSE,-Dvalijson_EXCLUDE_BOOST=TRUE,boost"
+PACKAGECONFIG[examples] = "-Dvalijson_BUILD_EXAMPLES=TRUE,-Dvalijson_BUILD_EXAMPLES=FALSE,curlpp"
+PACKAGECONFIG[tests] = "-Dvalijson_BUILD_TESTS=TRUE,-Dvalijson_BUILD_TESTS=FALSE,curlpp"
 
 # valijson is a header only C++ library, so the main package will be empty.
 RDEPENDS:${PN}-dev = ""
-- 
2.35.1


