Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E0C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:02:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.4935.1646380939464205456
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CppmAQtm;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id p8so6987689pfh.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pKBE6lixNzZA2waoMHaOgTeVL3auTEAVf9FDHVZ7yvk=;
        b=CppmAQtmEEqx6y8ILMMLAT+f83vajMr0Zei5N2cQQHagF5QHQIQ7aPhnE+EWCu5XzZ
         Q9rlZnrIsPNdQLnSIPjbTZXBssl+xlfvIhO5Q1P8VcEgL4lqEumv8+gsh3wfmCqAQBLZ
         I78cgPIEKXDDvxg64Ng3EUTvA8ifMBL5Ki+8oq0AwCgme02uaYGqlBJtmq1zDmM48Ltb
         q6x54FgsnGkhTDyzKPxJokgSWiLbSNszUBOeweattbL/jL4siLuWhWeMEyluyXcvOkcD
         4qYF87lDOpIPOSc7sJJqUVo8uuz1z+pgY1I3V9/ZODIRvgADid6P5xoFhl3T88wZy1mi
         /eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pKBE6lixNzZA2waoMHaOgTeVL3auTEAVf9FDHVZ7yvk=;
        b=bhh9EsipmrFTYMOc9Gw1uQDQlUnuOpSJzvyGhqgVTgX5rwuSM6n47+PHxk4lUi0JGz
         xhKrFNitGO2dlRNn6Qnum6Rgb/2Aent6rWMSFnqOpyKnbfaLmEO6m3MOev0X6iUOEo9f
         e5V8TRSWWgUITEKqKnDBlMECewqR8hACCc+ITru88ErLavcrl5ZYjZHYj/KM2m+E6NGg
         vRrsRnvExdtTxZoJsHEvcuQ8Nx6bPUBT2Lk9AL9JuLecuFHnzGIRcBMEa6BVYqDWOiP8
         fgJFKqFBULyI16is7x4GENB6usL4E8Pzrmoqvyq97t/U2mCHww4TYea6b5VIS0O7BQnx
         DkVg==
X-Gm-Message-State: AOAM530sVB38aVMv6NYD+XW57VQ/gLqcDMLsC3zS7I+GdKuhHM3ZJzOZ
	+B0+Rq571HwFl/V+3FfsH2REjU2wJT6X3w==
X-Google-Smtp-Source: 
 ABdhPJxN6TnkB0J0CCGaEfvO/Uuy0PsxSK7VnKaO9PYeMFclTJpyaWi5ZzRRJZK0ZnxywWpi+Zz4yA==
X-Received: by 2002:a63:c011:0:b0:378:74a6:9c31 with SMTP id
 h17-20020a63c011000000b0037874a69c31mr23589421pgg.585.1646380938677;
        Fri, 04 Mar 2022 00:02:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 h21-20020a056a00231500b004e13188af99sm4979290pfh.38.2022.03.04.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:02:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-crc32c: Do not poke at build system for
 finding platform
Date: Fri,  4 Mar 2022 00:02:16 -0800
Message-Id: <20220304080216.754292-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95767

platform is target specific and when cross compiling it should be
detected differently, in this case lets pass it via environment so that
it can be set in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Justin Bronder <jsbronder@cold-front.org>
---
 ...p.py-Fix-determining-target-platform.patch | 34 +++++++++++++++++++
 .../python/python3-crc32c_2.2.post0.bb        |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch

diff --git a/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch b/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
new file mode 100644
index 0000000000..b534c05e9a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
@@ -0,0 +1,34 @@
+From 855428feb14c44762ea21a18b05638e3e6266ab5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Mar 2022 23:50:30 -0800
+Subject: [PATCH] setup.py: Fix determining target platform
+
+Do not poke at the build machine to determine target platform or architecture
+pass it from environment instead for cross compiling to work
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/setup.py
++++ b/setup.py
+@@ -20,6 +20,7 @@
+ #    MA 02111-1307  USA
+ #
+ import glob
++import os
+ import platform
+ 
+ import distutils.ccompiler
+@@ -58,7 +59,8 @@ class _build_ext(build_ext):
+ 
+     def run(self):
+         assert(len(self.distribution.ext_modules) == 1)
+-        platform = self.platform.lower()
++        platform = os.environ.get('PLATFORM', 'True')
++
+         is_intel = platform in ['x86_64', 'amd64', 'i386', 'i686']
+         is_arm = platform in ['aarch64_be', 'aarch64', 'armv8b', 'armv8l']
+         distutils.log.info("platform: %s, is_intel: %d, is_arm: %d", platform, is_intel, is_arm)
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
index 0d51420939..040bbd320d 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
@@ -9,8 +9,11 @@ LIC_FILES_CHKSUM = " \
     file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
 "
 
+SRC_URI += "file://0001-setup.py-Fix-determining-target-platform.patch"
 SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
 
 inherit pypi setuptools3
 
+export PLATFORM = "${TARGET_ARCH}"
+
 RDEPENDS:${PN} += "python3-core"
-- 
2.35.1


