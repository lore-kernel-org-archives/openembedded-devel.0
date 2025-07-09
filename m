Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFD1C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.3061.1752082296491906715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HXCKP468;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-555024588a8so76898e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082294; x=1752687094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP0v8hxfwPPinYFYeAUgIB3vR19NN2Of2/bXVo/tGQA=;
        b=HXCKP468xFuznODmg6S0Axg25zhj4IzA0sAZgIgx41PrLqMCUQ4NH6y4X2wks9iYac
         HYnuPv8KeMq9D1lr6YvOQsUyH1cZSKcOCN0Z3cGduoiahIuxfHJfHMostnoCUnYg7qAZ
         AbX/wGRIaeYl0Ugh78sVVgd/NtoY1ufQD/zB4KdRivXczuuZpDR6rHRg6C8T89gkvfzI
         RJFX2gLQjmp91NEF8AU5f5hqJ8zUKABYPvMM3iGbBxJA5QKfSFhd3kbizJLu0/QjSG46
         9XnwoBb3baG/JG5sSVLvbFGu0fhg6AnMHPeNQwGjsm9POZ6CVE5MwGiS8aQoGigaP87R
         mwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082294; x=1752687094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP0v8hxfwPPinYFYeAUgIB3vR19NN2Of2/bXVo/tGQA=;
        b=Qsickpgy/dB4mCXqaiFf5Pabhj+1UUX2loxDCGYl8Je81+TRB3bioy+tJ+zojw0bPT
         Mm+b+nov8chDq2fA3Cc+N35Eo53C3MA0kqqPMFVcePAcwqw6Lxm96qUCixRYwNmquynb
         /rLEUd5dlLmIUC6Bv2K4gUgqLkEovQOVeN+yxPOnAmj1QiITF1jvN2C0oCStqf26M8t+
         R/fztkzxPWW+KllORRSl1CcFbRUsae1H2SBTEbs+cWII2qfE6nivuD5OTr/UnAG3jx7U
         +zDBSPbMYn4pM0PaBUpjnGfY4efW9kFjf39wte1jxuqbikUcZCZOJ1SuDPAVqLK+E8mx
         h9TQ==
X-Gm-Message-State: AOJu0YwBC5KjZqxBU3a2ejCpb2SDYjxOcuq3E+Ac+kieGfv/mELxlfBu
	pexwnMKwsMNSf32dsX5fuxTUyeHNMNd2EXbRC/PjDExfs2MhFcrOn4lMwYluzw==
X-Gm-Gg: ASbGncvsk71c/MjJcNm+cihY0HAXFV+T7Kwg69DcZY53P80367gmoDajKv6eUpdvb5s
	qaKYRyT2BcmZkX2HI9lRHwfacXKnJm3HroCYeS04lYfDSVgg0PFRU9x0H3KxtWlhZ0O9Y0YuWCv
	3NRSpV003of7J4TDkDPwPzFIKgB1r/a5QemdRg8LysDqYrkSrKBCvhZE4oiYiQzS/Ssx7BqeYgS
	rBy52Sm/x0vDDLmOZxjz44Atp2W5irrB7VmUthdJnpIospSwq/2LZBbBnq0BA9LGa6RdlrSPDpE
	0oWja57FezNPdMzX/2dMg7/gHGLPXvA/rrBRAxlkugN9IcTfa02NxjaVfJ8aIZw7o6h0SSrq8p2
	ahS4C6nzF6uGCAg==
X-Google-Smtp-Source: AGHT+IEO8HzHpI8GNN2YuV8zKYSCoSQ8hzsCcqchF14c/ttqhjiIkgcQDfUSyf2J95roXIibifrdvA==
X-Received: by 2002:a05:6512:4002:b0:553:32f3:7ec4 with SMTP id 2adb3069b0e04-558fa8f8726mr1218477e87.29.1752082294028;
        Wed, 09 Jul 2025 10:31:34 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:33 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 20/20] libcyusbserial: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:54 +0300
Message-ID: <20250709173054.605430-20-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118374

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 51 +++++++++++++++++++
 .../libcyusbserial/libcyusbserial_git.bb      |  2 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libcyusbserial/libcyusbserial/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..433c845f4c
--- /dev/null
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,51 @@
+From 0998662e52a4a31e8e7cfe89d695341082aea238 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 20:19:39 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/cyrozap/libcyusbserial/pull/8]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt         | 2 +-
+ include/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4d42eb2..4bbb2b0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libcyusbserial C)
+ 
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+index 8f0c90b..63f4d02 100644
+--- a/include/CMakeLists.txt
++++ b/include/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ ################################################################################
+ # Install libbladeRF header files
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index 939e7db24e..7c9a9908ad 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -11,9 +11,9 @@ SRCREV = "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
 SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
     file://0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch \
     file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
+    file://0002-allow-build-with-cmake-4.patch \
 "
 
-
 inherit cmake
 
 PACKAGES =+ "${PN}-utils"
-- 
2.43.0


