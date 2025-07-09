Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773E1C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 21:11:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8069.1752095483540407379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 14:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDhpGtQ/;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b60de463so235703e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095481; x=1752700281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7+Xj4BPYiYsKWBMnrNgkLfU5thDI8INrTakri+KlS8=;
        b=MDhpGtQ/7HWdcl/Uc5+yiDAqOorqg0RlLiOjO1ja5TvZEK2MADj7zoX+BAdHXyQ36b
         0wPpDKfDqBhdvaLM+fKOqUrN52hl4gjM7QbRged7WUUq9Gh2bVuLKqY+ryOzTXitY+ev
         aq/++ljTRi60WhPoiaaJ50wnBn3naGxF8aqqPipAFXGm2Y54a2RZN71byafmvL8p/wQ3
         JzwBHI7G2qFPEJ95HDZk+ZvTpSu4PHtF99LooNFZB5x0ydKk0F9z1sYnghxMr7K0zQZx
         XrSLtVyT/mvItRHrqva2zmY6eUZJZZxCIOEDR9M+1hzL5XB5yKaEol/ctRBZRiMYKsq+
         cU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095481; x=1752700281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7+Xj4BPYiYsKWBMnrNgkLfU5thDI8INrTakri+KlS8=;
        b=ud9v7d9IPkZH7VPiLIdCHrdA2oE/TOcYIEKIMGgt3JoPCk4Sz5WVJMzlzhjKOlh71z
         wJBBlspd/961EBdxgDJ9/ucx5uypdgJcsNVunSdNst9/fBHBvIRlHxTaQBYV1j5k0meh
         y4MGhKzA1MMq7aN1AoQvAsoQSg6zUwtFypTEwXATQar8KQ5i4kKTYAjjSztfUcsbLEf1
         o/YJ/NDDGGZDjLK2fRK3ZVfvlJaA3ZJIZP8NepVH5s6DHdHTNIq96WfaQlK1sXlIAM0E
         i3dTZrb7IqWJr3irL5fD0FsFvoO1UxOSsQKoqs+jO9CPvIkZjVdWKklJvXIla49aihja
         R1cw==
X-Gm-Message-State: AOJu0YylVQLw/OSYbWVFriGICoWKV24tuVCG/IKRDDsA+tWCC/76i00f
	ehSAuBTC8BizvcC4zgP7+F+j0gQf8OxlN5+SKjBFyNHp2ddVJw/Qt4nNWA3sDQ==
X-Gm-Gg: ASbGncsMgJ4QXyBbJlU/J0FiSh9k8Z4CZoOn7rci1Z+s5oGoxtYQwsf49io/Tjv24r5
	ft53nZFvhusyFzqbkZXPKcRU2vJ2I1/exeF/BGhKsZQitsmOwives8ylZNltgJg13krHn6iJ8re
	UsMhTHFwV/z0q555AIMDLjc+jTgOXA+MB/N+iIZ73bPVrrj0Y9G4y0gFprxDekPMLn0UozAvYYm
	h6PKVaK/Yn0530pWPJ8StqzSC9/V1vMpTJmgTtBbjdJ2aFvjHmr5YgdSQDSgxDFGhis7M8cnoJ7
	LisrkbFcAEeR369SCLpKHRfzR/lhSBlgGF+jp54nxw6Db4KFMJtWsRBZaRcMnnvP5AGk66NTF+m
	bA6Y=
X-Google-Smtp-Source: AGHT+IFzxTgTFhrtBpanAPaGMiN1erCIZ+lmnTgh/frpUr5D5Q1Ti3q75Ow29M6q8ShQ0AHMzn9tTA==
X-Received: by 2002:a05:6512:158b:b0:553:349c:646c with SMTP id 2adb3069b0e04-559000c43aamr378768e87.27.1752095480937;
        Wed, 09 Jul 2025 14:11:20 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6be22sm21411e87.186.2025.07.09.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 14:11:20 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] yajl: Add patch for CMake 4+ compatibility and fix build issue
Date: Thu, 10 Jul 2025 00:11:12 +0300
Message-ID: <20250709211112.663441-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 21:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118386

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
 .../yajl/0001-allow-build-with-cmake-4.patch  | 93 +++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  2 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..78076e5c1e
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,93 @@
+From e67398dad70e5d0174ad0eca5c293a5bf1ce1796 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Jul 2025 00:00:33 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+CMake 3.0 and newer disallow reading the LOCATION property of targets directly.
+Instead, use the recommended $<TARGET_FILE:target> generator expression when
+referencing the output binary in add_custom_command.
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
+---
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
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/pull/256]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt             | 2 +-
+ reformatter/CMakeLists.txt | 4 +---
+ verify/CMakeLists.txt      | 4 +---
+ 3 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4c0a9be..e7031c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,7 +12,7 @@
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 2.8.0...3.10)
+ 
+ PROJECT(YetAnotherJSONParser C)
+ 
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 52a9bee..267d02e 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -35,9 +35,7 @@ IF (NOT WIN32)
+ ENDIF (NOT WIN32)
+ 
+ # copy the binary into the output directory
+-GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_reformat POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_reformat> ${binDir})
+ 
+ INSTALL(TARGETS json_reformat RUNTIME DESTINATION bin)
+diff --git a/verify/CMakeLists.txt b/verify/CMakeLists.txt
+index 967fca1..2f39008 100644
+--- a/verify/CMakeLists.txt
++++ b/verify/CMakeLists.txt
+@@ -29,9 +29,7 @@ ADD_EXECUTABLE(json_verify ${SRCS})
+ TARGET_LINK_LIBRARIES(json_verify yajl_s)
+ 
+ # copy in the binary
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
index e4434bee45..6951e7e705 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -12,10 +12,10 @@ SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
            file://CVE-2017-16516.patch \
            file://CVE-2022-24795.patch \
            file://CVE-2023-33460.patch \
+           file://0001-allow-build-with-cmake-4.patch \
            "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
-
 inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.43.0


