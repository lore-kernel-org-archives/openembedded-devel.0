Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A9EC83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:16 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.3044.1752082274555506718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACMCdPZG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553e5df44f8so52144e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082272; x=1752687072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87MHml1AbFhr75URXS3+HD/xH1Fz3APrHUY79vAMvmY=;
        b=ACMCdPZG04y5MGmxfnowk0FwB7uRIvpOMeiOxcCzr8e59um9x0P3SRD0YKO9I2xQ9n
         NFmu0zo8w2UCeXh0xq3aWA3yezsm7GCo6LE7BvOwi8w+GrjC6nk+NEJzT/zycWqZ6WYz
         fz6ctH3LzOGexFAmFkds3zDGXMb1iTE/ID9PwgsfGdFX/d2fHZ0VtyuIL0xsxw+p/xs8
         bYLWwSCA+5yIFdGS0owuRifxsnfb9ODMTueVvcz7T6inrtDEanc4aQjFu3fiKwytvhXa
         Adn/QeWxAHs3w9HA/OWimx6JJwyQNzUZ+WVsdE8rsYVApnFp93SsTZhlXhElDHBQx34h
         8bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082272; x=1752687072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87MHml1AbFhr75URXS3+HD/xH1Fz3APrHUY79vAMvmY=;
        b=wbWaY3rA55c8EcuRgTDFejK9SUeg4Xlj+ApDRz8wxzKamqz5z+7S4+yFEc5KSsES1n
         qwGqE/EOWizgANFPM+YdOs9hZfxGY+tAk/074S4qg/+QulfDJ/s3kZRpXImHQwUV0Y35
         Rt4L/Zf8e/LqGPb56pM4VrINAh6OAWnOtE0ininAHgOq6MQ63Aws87SLPvQ2xuWNUdV+
         tQ+pQQRyFmO7TbIkJ3LTo+hbWbB4GQs4XExLU4VwoQneZefUmMWG91ODhVVDrolFPX+t
         wYaXz2vXBQe5YphS2wOnuZ4PuyLC3fLHmvmD5pnbHlmxkJ8RxCfBmyx+Re5J0b9901Le
         29gQ==
X-Gm-Message-State: AOJu0YysD8sK8iPZ9t0Fkvu3p2w1FegTExN9cZ59zkdYEdAyURKvAGxR
	VkeBcmZanYEi/12SSHObiC9fzyAqxxnkr6MuobNaU1dqSANDQJEBrUE2lYSNMw==
X-Gm-Gg: ASbGncusbNfdz8wmK82IR5bQSgaTq09xJuGV7MQap/nrZhsmATKu/6tG27sTlRfzR8c
	wAbvoAYPzc0TceFY5fwCGVuMoYVHT8q5oqkXWRj/RK0ADGnLNsoRl2HJf42bxQwLzcKoYVpTlzW
	deLIxk/rGL7Dv/nOp0j8VcST3OXODWxkush658C+bAC2fWQrjP7dp+i1Xx4a2foModOIGiBfOoC
	Y8I4I7GU31YWOcB3I3JdrYQ3D24GEjVxP/ScqpYnEb00UfwMFcxianFzk802oAyYZ6EgC59OcX2
	qJcyEPEICh3Ef7/lf+ZfJ92zLmpYrJSt2Ath/8x6a7CyTB7740HFQI9oybJQ7DTASss7FYBq/kH
	wo4Y=
X-Google-Smtp-Source: AGHT+IHzbSpfny7y3lw5Uwsai1T1jKtZYj8l/959/o/7ZVtEI4z8m0gmrzeBW6IQ8F/looQmNcQFug==
X-Received: by 2002:a05:6512:3ca1:b0:553:25b2:fd2d with SMTP id 2adb3069b0e04-558fa8ffb81mr1070161e87.30.1752082272073;
        Wed, 09 Jul 2025 10:31:12 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:11 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 05/20] libcbor: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:39 +0300
Message-ID: <20250709173054.605430-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118359

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
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../libcbor/libcbor_0.12.0.bb                 |  5 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1edca539ba
--- /dev/null
+++ b/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 4b34fd7b4d674eeba5e9572df1d88bafa1d100e3 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 11:29:39 +0300
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
+Upstream-Status: Backport [https://github.com/PJK/libcbor/commit/1183292d4695300785b272532c1e02d68840e4b8]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 815675e..a9f9bd5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libcbor)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
index 60c3c6fadd..fa48d23bde 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
@@ -4,9 +4,10 @@ DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose sc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
-SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
-SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
+SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
 
 inherit cmake
 
-- 
2.43.0


