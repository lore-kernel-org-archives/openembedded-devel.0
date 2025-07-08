Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148B6C83F18
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:49 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.5595.1752004660841108059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOZjZ1AA;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so3430151fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004658; x=1752609458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm2X8FHAAywiJk+A42qd3J9CMr0oPtnulw5cW+KFKrM=;
        b=OOZjZ1AAB1TEHBlXwE9wixH33ZjSWrDBBtWENHL35jKyt1LRxG5bS1LBFH+Pfc/Myt
         OMut9NsMEOM79X1j1NmN0yZxBSy1nzHHfmN5sdwkl54pvH7+XuDsN6ofg39GA5fIeWXR
         g29Bt17hCwjFEEgoA/mNwQuTC8pKV776pU1w6fTFO0GEFttXadT7948EpXiZfLCp+pge
         1zNRYWkYVTkYA8z/G+1LoNA3+6cYZ1bQ6fm6P8PsavUIR0Db75aXtwJAIyAVe0d11CWN
         3xLXeUz3tg/qhfbyFRvmdHLLZ7pttbyKY0/xvxaVE3YbCcVpcxxoKp2pMg764UVf2BGx
         kBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004658; x=1752609458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm2X8FHAAywiJk+A42qd3J9CMr0oPtnulw5cW+KFKrM=;
        b=DF642exEXN38kkiG6DB0hjUJtTcj2IPAKtnISNAC6b8fX8fjfgfs+Sj/XfFLZkG0Af
         MziMzi5fUwTAMNVTmr53Nx+RlW9bkYbTv7kbVv8pZ0362sd1MOuhp54EkDwdFlpfWkyk
         Zyy2TkLO67QvkiVIhNOb98PqBpBB1RlnzSBeG/qc78BHJhpyToCgvEbKc5VZYe7Grv6g
         fsYd67RZXAOelqF5TEaGc14o2SyrPpVXYOo/XvG1cfn8rr+X7OcjEeNjeeQuOUyeCF3D
         NdB0+DPiQyM9vYD4u8Jlp8OhgkAOYEOWSsmFraeRvNpHXOceKR3vbvdwkbE4i2yRiB3T
         gCZA==
X-Gm-Message-State: AOJu0YwPsI+Sx3cWA3b5EPNdGYshKUKpVTKsgID/MpzaOpMDJmScCgbM
	mhjpavNk0F+rG6DwLr5rOcPlD/0IZx8dBvZjdqyMBMIsGiNcyNN2aWLYaAxB5g==
X-Gm-Gg: ASbGncuQppodylx28UxwRtszsR0ELp+OoGGqyYqU+QsypZDm6jCC4i30huiK9hp5gfI
	BMnLFopTckDpAxlVbsxy6BUKHwbk42I6xEhD8ML2PqBXCfP4nL57rhA+/JHOVNPaN7oqYbjtK/+
	ed9zkOBVbSL/nxdxuT/G+uvzxJ7dZGU7I3AG8B2INHRQxFN5ow1okmcl6T8qnGKyFlyJT4H4V6O
	XrX8Wj8jnrh9y2rbhMewe6YpELfd94nv6pCiRlxfOYC5MR11xs/NVVVvhqSsjy1LeYCdndZOb1h
	SWKJTfO86OlFVLnVLVaqJ8EB61lYs8gSNs4AebrB+eGiVRdr2S+4GN/HFXsUGBUdJbDE6V3HO71
	vhrJffYqpjBCo1g==
X-Google-Smtp-Source: AGHT+IHYVtgT5bHrltyuciWPm+djP55zyEM42JOAsSijy1xpmdeis6u0uMFSI3CnWZsrdZsOaXWyPA==
X-Received: by 2002:a05:651c:510:b0:329:1712:c38d with SMTP id 38308e7fff4ca-32f39ab0f14mr15971521fa.5.1752004658263;
        Tue, 08 Jul 2025 12:57:38 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:37 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 09/20] yajl: Add patch for CMake 4+ compatibility and fix build issue
Date: Tue,  8 Jul 2025 22:56:25 +0300
Message-ID: <20250708195636.1678606-9-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118331

- CMake 3.0 and newer disallow reading the LOCATION property of targets directly.
Instead, use the recommended $<TARGET_FILE:target> generator expression when
referencing the output binary in add_custom_command.

Fixes:

| CMake Error at CMakeLists.txt:15 (CMAKE_MINIMUM_REQUIRED):
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

-----

| CMake Error at reformatter/CMakeLists.txt:38 (GET_TARGET_PROPERTY):
|   The LOCATION property may not be read from target "json_reformat".  Use the
|   target name directly with add_custom_command, or use the generator
|   expression $<TARGET_FILE>, as appropriate.
|
|
|
| CMake Error at verify/CMakeLists.txt:32 (GET_TARGET_PROPERTY):
|   The LOCATION property may not be read from target "json_verify".  Use the
|   target name directly with add_custom_command, or use the generator
|   expression $<TARGET_FILE>, as appropriate.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../yajl/0001-allow-build-with-cmake-4.patch  | 43 ++++++++++++
 ..._FILE-instead-of-LOCATION-property-f.patch | 67 +++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  3 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..c62a846da9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 3dfd5276ab30ba7f6820cd4585d390c3706684b0 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 18:17:56 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:15 (CMAKE_MINIMUM_REQUIRED):
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
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/pull/256]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4c0a9be..a49e52c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,7 +12,7 @@
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ 
+ PROJECT(YetAnotherJSONParser C)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch b/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch
new file mode 100644
index 0000000000..8b64ffd7d1
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch
@@ -0,0 +1,67 @@
+From 1b07726910d4ff7ce1829845471a066bb97dd411 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 18:33:48 +0300
+Subject: [PATCH] cmake: Use $<TARGET_FILE> instead of LOCATION property for
+ binary path
+
+CMake 3.0 and newer disallow reading the LOCATION property of targets directly.
+Instead, use the recommended $<TARGET_FILE:target> generator expression when
+referencing the output binary in add_custom_command.
+
+Fix:
+
+| CMake Error at reformatter/CMakeLists.txt:38 (GET_TARGET_PROPERTY):
+|   The LOCATION property may not be read from target "json_reformat".  Use the
+|   target name directly with add_custom_command, or use the generator
+|   expression $<TARGET_FILE>, as appropriate.
+|
+|
+|
+| CMake Error at verify/CMakeLists.txt:32 (GET_TARGET_PROPERTY):
+|   The LOCATION property may not be read from target "json_verify".  Use the
+|   target name directly with add_custom_command, or use the generator
+|   expression $<TARGET_FILE>, as appropriate.
+
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ reformatter/CMakeLists.txt | 5 +----
+ verify/CMakeLists.txt      | 5 +----
+ 2 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 52a9bee..b202fa5 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -34,10 +34,7 @@ IF (NOT WIN32)
+     TARGET_LINK_LIBRARIES(json_reformat m)
+ ENDIF (NOT WIN32)
+ 
+-# copy the binary into the output directory
+-GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_reformat POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_reformat> ${binDir})
+ 
+ INSTALL(TARGETS json_reformat RUNTIME DESTINATION bin)
+diff --git a/verify/CMakeLists.txt b/verify/CMakeLists.txt
+index 967fca1..37eac62 100644
+--- a/verify/CMakeLists.txt
++++ b/verify/CMakeLists.txt
+@@ -28,10 +28,7 @@ ADD_EXECUTABLE(json_verify ${SRCS})
+ 
+ TARGET_LINK_LIBRARIES(json_verify yajl_s)
+ 
+-# copy in the binary
+-GET_TARGET_PROPERTY(binPath json_verify LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_verify POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_verify> ${binDir})
+ 
+ INSTALL(TARGETS json_verify RUNTIME DESTINATION bin)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index e4434bee45..8c0d84f811 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -12,10 +12,11 @@ SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
            file://CVE-2017-16516.patch \
            file://CVE-2022-24795.patch \
            file://CVE-2023-33460.patch \
+           file://0001-allow-build-with-cmake-4.patch \
+           file://0002-cmake-Use-TARGET_FILE-instead-of-LOCATION-property-f.patch \
            "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
-
 inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.43.0


