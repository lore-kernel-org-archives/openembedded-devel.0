Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB330C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.12901.1649781043503174072
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlaDK7JP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id be5so11272601plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsOPi3Pa3bnQiIM55kRFcJgzOODX0MSpeeHytnmKsAk=;
        b=AlaDK7JPlGasLu666mY4kFxsL12//t4LSAY/uxvglkvlT1hVxJn+ux9EtkHBiSAjcv
         YyQPxVru/aY0nD51SucynuqxMj22x4HkSWqRgPoyaqfh8utMYxTK55f32RmwcFA4z50h
         MkaW6ZXjzLUbPUr90o4J2fMxzMudJscSyPZIQLp2RQgNWljOFd7RXH3Y4VlpAkspb/zV
         tz32GrR+PyyPpLOkbOMn8322ii4ztV/zdyYdvjjNFrUoauq34G23IOWO0Ms0O3tpBhSv
         bFY9YxwRsjyTybj/uDrelegPBcyVgv4hqh73vDPjB4Hjj19N5QfXUm7Q/7Cg+MFSk0+5
         8Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsOPi3Pa3bnQiIM55kRFcJgzOODX0MSpeeHytnmKsAk=;
        b=VB2wjidTWMsKa5lQJHdJhxWmTdDd5ETiROtohLfFHLDQNYlld/N91nPEafUYF4fXOT
         +wibsi91kPtTiEYj/ZTBc3P2G/9Q8dFLIbkDmTt04DLT2pKaU9LYdbpSf3B4AI9KlgRk
         TrKBw2d7TgLGP5/pDT/c1ey8DipOMfaGKwljdWOp2TvNhaGUv7QIIBQj0cTU33hZixiR
         yQZvRgR8B2Tp/jRBkwf19rGxvftdujvF1IT+KOj4fEnAjmdXzgzB/XaoxJC7Br+XY07X
         oUveBxm3EqwzSXfZkzU/7nJohgZQTGF9o8XmcmkqB+ra2ObOlrsNrn1voDvLxOyuayv0
         BF7Q==
X-Gm-Message-State: AOAM532i5oVVt/AbX3XF0M0ANZ+hC6YaCGeQoRkoJXT2+Yc7e5B5T2Qo
	scp0+V0bdkWrv35OwQIdUb1YfmOVfnqlOg==
X-Google-Smtp-Source: 
 ABdhPJxKhIXD4hP7bYdf2bpHh0xeaduF6xyMgV7CxHn1KhPPEcd41q1ozHoGjXRkMJ2df/zSrAQZ6g==
X-Received: by 2002:a17:902:bcc4:b0:157:333:e512 with SMTP id
 o4-20020a170902bcc400b001570333e512mr27592344pls.9.1649781042613;
        Tue, 12 Apr 2022 09:30:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a628707000000b004fa6eb33b02sm38796263pfe.49.2022.04.12.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 09:30:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] dbus-cxx: Include missing <utility> header
Date: Tue, 12 Apr 2022 09:30:39 -0700
Message-Id: <20220412163039.3157555-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96590

gcc-12 does error about this explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb   |  1 +
 .../files/0001-include-utility-header.patch   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index 487681c92d..c8dabc5ead 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
            file://0001-Include-typeinfo-for-typeid.patch \
+           file://0001-include-utility-header.patch \
 "
 SRC_URI:append:libc-musl = "file://fix_build_musl.patch"
 SRCREV = "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch
new file mode 100644
index 0000000000..0c8262af75
--- /dev/null
+++ b/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch
@@ -0,0 +1,32 @@
+From 63170cfcfbf483716ce2599e165db80713fc2706 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Apr 2022 06:47:19 -0700
+Subject: [PATCH] include utility header
+
+Needed for exchange from std namespace
+
+Fixes
+dbus-cxx/variant.cpp:135:25: error: 'exchange' is not a member of 'std'
+
+Upstream-Status: Submitted [https://github.com/dbus-cxx/dbus-cxx/pull/98]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dbus-cxx/variant.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dbus-cxx/variant.cpp b/dbus-cxx/variant.cpp
+index bcf2684..97b622c 100644
+--- a/dbus-cxx/variant.cpp
++++ b/dbus-cxx/variant.cpp
+@@ -11,6 +11,7 @@
+ #include <dbus-cxx/dbus-cxx-private.h>
+ #include <dbus-cxx/signatureiterator.h>
+ #include <stdint.h>
++#include <utility>
+ #include "enums.h"
+ #include "path.h"
+ #include "signature.h"
+-- 
+2.35.1
+
-- 
2.35.1


