Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30883C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 17:37:10 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.16542.1638985029245941153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 09:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpL/ptZS;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id o14so1992680plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGAkyBnv2tkC1gRNWSPctbjn15IlRP0OitMi2cgIvCE=;
        b=jpL/ptZSJUWW43b0D1jE8lnqCJ/NigJ9740ii2EoYzPdbDjbt5YgIIbYvebOkC418t
         U0JAwHac18o6mGUMIEGz7jiV8uiD8fOk/4AaDKey86TUo/o8Y4tuclstJvLYOWO6cX7N
         +pI36uwGGJutmbQtF9PGVbh8pDQ6ahkLunEbFNGBd/nriOvZYWD/1ZPIs7/74Fd/lKEb
         +80UQJHYKBQUEv6XQGpmf7Ss/UITLNDhHCE7K1+cmFALga+XsLnYq0fJyHGU6qL5kEVf
         vwrB6M202/UMOxP8FDnso2LIhKAxdj5u5EFBFrxUXsG9KXQ3PjB35ZsTDvnjgmBFGxSQ
         2BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGAkyBnv2tkC1gRNWSPctbjn15IlRP0OitMi2cgIvCE=;
        b=lf6W73MMw5bsQ+zSD8aBU7gNQlSdTOPag49LgayzF3faN+IDm/EuxUgydPpANgnvEk
         rmDlAR27liJO0xu4fP3dBokJX8DspiQNSiqI3EkZV9GntcqcyexaEiTTmJuEAHoK0GiJ
         EeMsYQyxPb4kzpxRqELGSgrVDcX7G4ko2QGLZYE1n2RfqPLLsycxLeINCfhuNGWVsEo/
         u4qakF26HGTb1PEs9HSEIsPBv+KJYmJVwbOX6q9foFfVRibztj72pYBQk4YZSy/pK5c4
         WTHZzQhYmObQzGVEqrXA0pUMo3NPdqKQtprWPrPzPwF8miN0gu7zt3w2vv9OfTdbFVzZ
         7GBw==
X-Gm-Message-State: AOAM53128oa7kRhU+Jz2a+rJemBtjJC1JL/vKAUvojVBMk4NJUuvjeve
	UxNbIenzOlzedHhr9Yi5cnKv1OsGGuIY7Q==
X-Google-Smtp-Source: 
 ABdhPJywvLHJRf34h1E/WuiINp0Spg3LItbxb7wCTxdUX6Y5BHr4VEF3UK2HxmrQ4TIopvy/5deAEQ==
X-Received: by 2002:a17:90b:17cc:: with SMTP id
 me12mr8889220pjb.141.1638985028288;
        Wed, 08 Dec 2021 09:37:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id n7sm3164890pgt.6.2021.12.08.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:37:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tbb: Fix build with musl
Date: Wed,  8 Dec 2021 09:37:05 -0800
Message-Id: <20211208173705.1616864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 17:37:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94253

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2021.4.0.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch b/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
new file mode 100644
index 0000000000..355cf2e0bb
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
@@ -0,0 +1,33 @@
+From a7289eeff4ac9e3ca2d2289672c923518433124c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Dec 2021 09:26:58 -0800
+Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND
+
+Exclude non-glibc linux systems along with android
+Fixes
+src/tbb/dynamic_link.cpp:417:29: error: use
+ of undeclared identifier 'RTLD_DEEPBIND'                                                                                    |             flags = flags | RTLD_DEEPBIND;
+|                             ^
+
+Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/684]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tbb/dynamic_link.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
+index 12f35cfd..942c1c64 100644
+--- a/src/tbb/dynamic_link.cpp
++++ b/src/tbb/dynamic_link.cpp
+@@ -413,7 +413,7 @@ namespace r1 {
+         int flags = RTLD_NOW;
+         if (local_binding) {
+             flags = flags | RTLD_LOCAL;
+-#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
++#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
+             flags = flags | RTLD_DEEPBIND;
+ #endif
+         } else {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
index 5396e1735a..e848f50779 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH
             file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
             file://0001-Disable-use-of-_tpause-instruction.patch \
+            file://0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


