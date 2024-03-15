Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D892FC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:52:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1273.1710528728353080296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExdhWMgT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dddb160a37so18036365ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528727; x=1711133527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGvKMikCTFszQoiD7IBpYD6s3ayssjkAnCNCpwK5mfY=;
        b=ExdhWMgTDbJe6NBy2iY8lKRW+sf1RjuJzmTG74L3kopjm14/hTSxZraY0k2CF+DtcG
         0l+KY3fRisFFkWHPHSxzM6WQAPx4wXuTKipGOT4OlBg8G8oK2n3U3jD/fXcgssKrLlVB
         eE2KhKysoazctQAHDs2LIEH4uMiMDXUyR8evJkyyL24lpS6FuAOjqm0hE2kQLGzsKyuA
         HRtU7tjVIWqnOn0e/oXioAKYX9ioy1JDl/cfZRCuCggzrs1CzjajZlr0WWpngCd6gOmT
         9P75tGuWmT5sHns70pVHlE07WTTJoa+hZKWQbgy4sOsX5E0/x2vqnX9FibzRW5MW+c/y
         rDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528727; x=1711133527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGvKMikCTFszQoiD7IBpYD6s3ayssjkAnCNCpwK5mfY=;
        b=mBlOSpJauXuKidXCUeAPOotbswe+NMPbTO1zL9MDZQhmDWsoIDWa6u/rTeeekZ/svv
         CYXT0T5EwR9CbszfJPFwnw9GeAvmZjfPeQ0lu/uXt/bFOL4+4WwKAgPvyXVtunKIH7/e
         wdy+kkvtplDUbubiBJ/O6munl0ERr0BgZUP8fDzyG1/ew0Qr66ej2k1rn0Cz829SzHSU
         ckAgnAh8la2PxRMpI2aaWWTum+9n7kzMzjk49wfICj18+EGAH/rMy38gYvw0Y8efJaJu
         aV3ytdMfb5MCo63d8BwWbR4Gz8ggWyesrrvn5iVDh3rDsOAdkIL5ClX7p3HEQxtIA6c6
         TwDg==
X-Gm-Message-State: AOJu0YzCK+gO9Ad3HzgD60vsLh/somSyjUjef8u1vltCd/MUyNYMRtX9
	3M2G0TvvBJOGjsW98BUGJb5qj8b6hQ3V6cJz0G4yfh5PYIBanYCrMdyKOFPM
X-Google-Smtp-Source: AGHT+IHwFwaz1MC6YP15IrLPoW0l3NlwITq4/EGpvh0Zmt/SIhRIsENo6JaBqBC8E/rqxl718HMAQQ==
X-Received: by 2002:a17:903:40c3:b0:1dd:a134:5680 with SMTP id t3-20020a17090340c300b001dda1345680mr6046563pld.69.1710528727448;
        Fri, 15 Mar 2024 11:52:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c6db])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902d4c600b001dbcfb4766csm4202158plg.226.2024.03.15.11.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:52:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] dietsplash: Update and fix build with musl
Date: Fri, 15 Mar 2024 11:51:59 -0700
Message-ID: <20240315185200.3967095-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109345

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me-API-for-non-glibc-library-e.g.-mu.patch | 28 +++++++++++++++++++
 .../dietsplash/dietsplash_git.bb              |  7 +++--
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/dietsplash/dietsplash/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch

diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch
new file mode 100644
index 0000000000..aa8406e315
--- /dev/null
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch
@@ -0,0 +1,28 @@
+From 272491297564513c4ce49a11bc1ecc523a3afd63 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Mar 2024 11:05:54 -0700
+Subject: [PATCH] Mimic GNU basename() API for non-glibc library e.g. musl
+
+Upstream-Status: Submitted [https://github.com/lucasdemarchi/dietsplash/pull/7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/util.h b/src/util.h
+index 1f4c3ef..a3ab54a 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -60,6 +60,9 @@
+  */
+ #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + _array_size_chk(arr))
+ 
++#if !defined(__GLIBC__)
++#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
++#endif
+ 
+ #define DIE_PREFIX "[" PACKAGE_NAME "] ERR: "
+ #define LOG_SUFFIX "\n"
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index bd94b9ad51..1ee2657bd0 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -4,12 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 # Really, no depends besides a C library
 
-PV = "0.3"
+PV = "0.3+git"
 
-SRCREV = "ef2e1a390e768e21e6a6268977580ee129a96633"
+SRCREV = "8bed71d860bbb0c8792fa2a1179c9beeae84d577"
 SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git;branch=master;protocol=https \
            file://0001-configure.ac-Do-not-demand-linker-hash-style.patch \
-           "
+           file://0001-Mimic-GNU-basename-API-for-non-glibc-library-e.g.-mu.patch \
+"
 
 inherit autotools
 
-- 
2.44.0


