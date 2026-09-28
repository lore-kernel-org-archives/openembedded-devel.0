Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3C4CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:27 +0000 (UTC)
Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63908.1790618240699294852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q7AYItz2;
 spf=pass (domain: gmail.com, ip: 74.125.227.167, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso532636a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618240; x=1791223040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRJnbd05mi3JLTxJc+NcA5XGo6CNlyU0aG9jKweQzuU=;
        b=q7AYItz2fxxyQfj+9jXmwyiZrSK2ESzN2hhShc0NzNE6XUCOKURYTKL8F9p4Hr/bbO
         HQ8wmdJMNOQ6JM/Kv9mWd/8DujuEp/V1smJ8kQF0lOL1kRA+O/4ta3LQRnGAtQiOLoJZ
         DeR1QenuzWmefrCXCUrCKXTfaI6t+X3TQk+tRmKzngGPImYwP5WhgY5pFrOt+VqNFCQI
         jJOKfbm+6hruU9z9x5PqlKa6OLvKY2qq51nB1KaErGbWvDZbXGdB11wSKdS7WbIYi3SM
         MY78cxZHITEIKngsvVoI4iyZgwe0uhIcRlyP8xTAPqfxNLgtIj42GU6dcX/93uTlIshj
         dQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618240; x=1791223040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRJnbd05mi3JLTxJc+NcA5XGo6CNlyU0aG9jKweQzuU=;
        b=R7iYMPK/r6svZMQC9munmxNkaP0P87tetHiNrXyOqGiY3FyJjgLe1kxeB5M8++vHJ8
         KKlugZ+ct5YZb9WnQx7Q/j+Xgw4bmdB+jz3FxOo6OZehDallC0TCXW50O1FEk6jcKZ+e
         CJk+VJl+dnb2TAINs9BKHodhAmEyo6cPOE9SIqkpVETVF8fGG5Bm2xD/h+XpKYY78/om
         ZRl/m4J8HpR2e2OjDT+ZjwonEQogc2G1X8lhZ4FqjnWY3ME3BEkoks6CvyEIYh2JTQzu
         XWmcU6Y+U45F1gwTjtfFGYLYsyurQ3R4603+q97wPY9Nuy5Km/gl0/cgLMblhHO1j7nw
         nvbA==
X-Gm-Message-State: AFq9FYIRFph+gYN61I6vzKVi58aTCGxUdYrP+r8aPlKsAsTH2qYD6hmp
	iURw2Alog8jWyrlE5hq0hjhjKrceyNE2TGh2BceJTdNwesmje0FN9ZvevRz6MQ==
X-Gm-Gg: AYBFou1CHG8XxAiR6QB0R+V8EschOVeRPvEcmSp+WO+FQHiECgZjp7uLw2zaCu9CUuE
	olVOyOUrRwidVLaI2NlfQMocLtAz5wr7coJvJ4wWGkl+bZv76j6D2kboQZyEk+qbxAW8fHP056h
	oPxihvEKsoj7/TYSOKsDM1MbUizVYGekVKZwctTouymtAVer2vmDvhRvxRr7P/epb0mD5olp74d
	g5q6lakcYRnKsAbRJKxaXTyatI8kliXHZ4muFr7PFvqSULEyoC/SzF0az0rJ11/7tnk5g/P37MW
	8BGQzKU+IDUcQxxd7L0bU1nzs27ZUf3o531TIcW7zv8LFNVJDG0NSy9BvZlXU+w3liVQGrTlULO
	6MQGvgWqt8rfncwEN7/+p5PPO4O8sq2nyZhkuvAsZVexZ1kmHCA8VrXpH4rCjmx79RV/adHHqsh
	tfMuFodn70vremM3Zt9vgbRo2QNzolWbQH/15/JwkUxLqoyZuIhufqE0KAkwZ+TTPrda1Rkyq+7
	z7hRe1u+/0jyfNJ40HbFiA=
X-Received: by 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a09875d77cmr11054099a91.18.1790618240010;
        Mon, 28 Sep 2026 10:57:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/8] freerdp3: upgrade 3.30.0 -> 3.32.1
Date: Tue, 29 Sep 2026 06:56:56 +1300
Message-ID: <20260928175656.3501512-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130468

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/FreeRDP/FreeRDP/releases/tag/3.31.0
https://github.com/FreeRDP/FreeRDP/releases/tag/3.31.1
https://github.com/FreeRDP/FreeRDP/releases/tag/3.32.0
https://github.com/FreeRDP/FreeRDP/releases/tag/3.32.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1-winpr-tools-link-only-winpr-public.patch | 76 +++++++++++++++++++
 ...{freerdp3_3.30.0.bb => freerdp3_3.32.1.bb} |  3 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.30.0.bb => freerdp3_3.32.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch b/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
new file mode 100644
index 0000000000..2dea69c3c4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
@@ -0,0 +1,76 @@
+From 6682e9ca667271b8ba148a301b4a2f9ac78be2b9 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Mon, 28 Sep 2026 11:57:22 +0200
+Subject: [PATCH] [winpr,tools] link only winpr public
+
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/6682e9ca667271b8ba148a301b4a2f9ac78be2b9]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ winpr/tools/CMakeLists.txt          | 18 +++++++++++++-----
+ winpr/tools/makecert/CMakeLists.txt |  6 +++---
+ 2 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/winpr/tools/CMakeLists.txt b/winpr/tools/CMakeLists.txt
+index 5719c1c65..225b70744 100644
+--- a/winpr/tools/CMakeLists.txt
++++ b/winpr/tools/CMakeLists.txt
+@@ -28,7 +28,8 @@ set(WINPR_TOOLS_API_VERSION "${WINPR_TOOLS_VERSION_MAJOR}")
+ 
+ set(WINPR_TOOLS_DIR ${CMAKE_CURRENT_SOURCE_DIR})
+ set(WINPR_TOOLS_SRCS "")
+-set(WINPR_TOOLS_LIBS "")
++set(WINPR_TOOLS_PUBLIC_LIBS "")
++set(WINPR_TOOLS_PRIVATE_LIBS "")
+ set(WINPR_TOOLS_INCLUDES "")
+ set(WINPR_TOOLS_DEFINITIONS "")
+ 
+@@ -64,11 +65,18 @@ macro(winpr_tools_include_directory_add)
+   endif()
+ endmacro()
+ 
+-macro(winpr_tools_library_add)
++macro(winpr_tools_library_public_add)
+   foreach(_lib ${ARGN})
+-    list(APPEND WINPR_TOOLS_LIBS "${_lib}")
++    list(APPEND WINPR_TOOLS_PUBLIC_LIBS "${_lib}")
+   endforeach()
+-  set(WINPR_TOOLS_LIBS ${WINPR_TOOLS_LIBS} PARENT_SCOPE)
++  set(WINPR_TOOLS_PUBLIC_LIBS ${WINPR_TOOLS_PUBLIC_LIBS} PARENT_SCOPE)
++endmacro()
++
++macro(winpr_tools_library_private_add)
++  foreach(_lib ${ARGN})
++    list(APPEND WINPR_TOOLS_PRIVATE_LIBS "${_lib}")
++  endforeach()
++  set(WINPR_TOOLS_PRIVATE_LIBS ${WINPR_TOOLS_PRIVATE_LIBS} PARENT_SCOPE)
+ endmacro()
+ 
+ macro(winpr_tools_definition_add)
+@@ -89,7 +97,7 @@ addtargetwithresourcefile(${MODULE_NAME} FALSE "${WINPR_VERSION}" WINPR_TOOLS_SR
+ 
+ add_compile_definitions(${WINPR_DEFINITIONS})
+ target_include_directories(${MODULE_NAME} INTERFACE $<INSTALL_INTERFACE:include/winpr${WINPR_VERSION_MAJOR}>)
+-target_link_libraries(${MODULE_NAME} PUBLIC ${WINPR_TOOLS_LIBS})
++target_link_libraries(${MODULE_NAME} PRIVATE ${WINPR_TOOLS_PRIVATE_LIBS} PUBLIC ${WINPR_TOOLS_PUBLIC_LIBS})
+ 
+ installwithrpath(
+   TARGETS
+diff --git a/winpr/tools/makecert/CMakeLists.txt b/winpr/tools/makecert/CMakeLists.txt
+index 37b831125..0af1fcc08 100644
+--- a/winpr/tools/makecert/CMakeLists.txt
++++ b/winpr/tools/makecert/CMakeLists.txt
+@@ -31,11 +31,11 @@ endif()
+ winpr_tools_module_add(${${MODULE_PREFIX}_SRCS})
+ 
+ if(OPENSSL_FOUND)
+-  list(APPEND ${MODULE_PREFIX}_LIBS ${OPENSSL_LIBRARIES})
++  winpr_tools_library_private_add(${OPENSSL_LIBRARIES})
+ endif()
+ 
+ if(MBEDTLS_FOUND)
+-  list(APPEND ${MODULE_PREFIX}_LIBS ${MBEDTLS_LIBRARIES})
++  winpr_tools_library_private_add(${MBEDTLS_LIBRARIES})
+ endif()
+ 
+-winpr_tools_library_add(${${MODULE_PREFIX}_LIBS} winpr)
++winpr_tools_library_public_add(winpr)
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb
index c839f7b7a1..f43c8cc7d2 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb
@@ -8,8 +8,9 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "6b107f0aadbabc47941c5a5b893b88c01792af6d"
+SRCREV = "bf217a504e54cc719880c228e82353382cd7d4fa"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
+           file://0001-winpr-tools-link-only-winpr-public.patch \
            file://run-ptest"
 
 

