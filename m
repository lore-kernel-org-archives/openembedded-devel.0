Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4609CCC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9328.1791969945811828553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNx5KdrZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89a595332c7so2056904b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969945; x=1792574745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=NNx5KdrZpMPB2TVL0bYpuAATc91BeKpOIGy197G48omLr+PfvJIJy5CvUYx2oG3Rsj
         Z6EOBqnnBh0R1DTkFM0s5m7w3tTF8pEt/BKq+1meOUC9qv8+iPAsdnM6nf9r+OIx3lbC
         3BoJaNBVYxhaMcZGMPBvCNcmggFvsh4KbBQDyVIBchDF17lAqI1j+ZHNBE+iPQIdwmoL
         sjxklwtEXKB+nqzUC7JItllwTToAwFijmc4oCBZEMV8mWxRLJWqhVOmcj1SmhS8Ytiwv
         MlzlQ74MzIIRwtTlrVhaV50PGT3+J1REGp4nw+2PIR6JGFNA8ru9FFkJBZLhhq6pzZdF
         sgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969945; x=1792574745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=LcpOSYb79yvBKODLcSowbXtLTOp7GOIrdiG1gwKBU+V8LJC6jZR9IVc6bo+qM/nfG8
         RwcKhw8RmG9V1umM+V9K6vzold5EdEa4vjRKvbEeG4YU6HARSiTNqdXImkireaRWCYJe
         qbbZMuFy7EJhXWuZKd8fdxp1i9nRdS/GJ67FXCZHFBovzeZO1+BjBw6bnF+isqtvSzw9
         qOqKA2HWSmgJHVUCpJj6/y6517sRjl34rpSDf/Y7hNTX/8HKUMq/R9sERPhRa7bDnVYb
         gIRkqSIaJPku/ht/N1RDozi3WZUVIyo6lZxm0jchpH0916RHNS54XMvDrr/rP2HP4ei7
         ZA/g==
X-Gm-Message-State: AFq9FYI9VjeDLUBobSBsmBS/A5LriUK8cg7opfO72jxDFiHqsuArnrZE
	iVMYioypQRLWJ2C8YIbmlxJi/ZMo937oszbzQGsi0nhScEyWlE2Z7aenifIaxA==
X-Gm-Gg: AYBFou0zI6dicdCHpbSO2XPz9Yoq1AGUol2KNVRFzWHjK0ascEbboHmYm3Z+Nj7o65H
	k0+oBTUADH17AOVqsXEXuxUvHJr7g9dnpnK5e3WgCE6uQFzvY/Y/Pzr43yzF6KH7rVSzP9LsPUJ
	e14AaOWGPCUpbXSyXH4HSd0Yl5Yn1CBdXTonfpmcgH8Ru6Qd7tWHgADUDo8wPn/JeevmgJjyDkd
	B0GAH1s8t5OyzBcwcLoeB3JprsXUZe5XovBu7UM3zIgnL31gBkUXmHVBfBC/tIFc6YyTRSC5XW9
	ieYzZyb8vCxgFVq6RPIeKdfVrdcybcO8B3ZgJ50W7WO+F+PngeQv0TebhyV7jUbEOl3jTM36Uu5
	AVvagPoJP2G4ZE1A0vCPrl1ev1ZdvrX4XMzWvTEBgLyYuD67BUjuowZvo2AICAxStBKRiTjyEBF
	od+Rg/gcRBHg7stcmqFViUV5hfDuvw98RAIjWCFNaQVN+jG9FIvldkUkyp9OOd73ghUAkhAUvFI
	jM0Q5I+rGxPHF+IvL6fJi7FVdBcyPgP/OJqytg=
X-Received: by 2002:a05:6a00:b85:b0:880:f278:6b0b with SMTP id d2e1a72fcca58-897c3ef9252mr12176510b3a.4.1791969945101;
        Wed, 14 Oct 2026 02:25:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/17] freerdp3: upgrade 3.32.1 -> 3.32.2
Date: Wed, 14 Oct 2026 22:25:05 +1300
Message-ID: <20261014092514.454505-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130877

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version.

Changelog:
https://github.com/FreeRDP/FreeRDP/releases/tag/3.32.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1-winpr-tools-link-only-winpr-public.patch | 76 -------------------
 ...{freerdp3_3.32.1.bb => freerdp3_3.32.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.32.1.bb => freerdp3_3.32.2.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch b/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
deleted file mode 100644
index 2dea69c3c4..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 6682e9ca667271b8ba148a301b4a2f9ac78be2b9 Mon Sep 17 00:00:00 2001
-From: Armin Novak <armin.novak@thincast.com>
-Date: Mon, 28 Sep 2026 11:57:22 +0200
-Subject: [PATCH] [winpr,tools] link only winpr public
-
-Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/6682e9ca667271b8ba148a301b4a2f9ac78be2b9]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- winpr/tools/CMakeLists.txt          | 18 +++++++++++++-----
- winpr/tools/makecert/CMakeLists.txt |  6 +++---
- 2 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/winpr/tools/CMakeLists.txt b/winpr/tools/CMakeLists.txt
-index 5719c1c65..225b70744 100644
---- a/winpr/tools/CMakeLists.txt
-+++ b/winpr/tools/CMakeLists.txt
-@@ -28,7 +28,8 @@ set(WINPR_TOOLS_API_VERSION "${WINPR_TOOLS_VERSION_MAJOR}")
- 
- set(WINPR_TOOLS_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- set(WINPR_TOOLS_SRCS "")
--set(WINPR_TOOLS_LIBS "")
-+set(WINPR_TOOLS_PUBLIC_LIBS "")
-+set(WINPR_TOOLS_PRIVATE_LIBS "")
- set(WINPR_TOOLS_INCLUDES "")
- set(WINPR_TOOLS_DEFINITIONS "")
- 
-@@ -64,11 +65,18 @@ macro(winpr_tools_include_directory_add)
-   endif()
- endmacro()
- 
--macro(winpr_tools_library_add)
-+macro(winpr_tools_library_public_add)
-   foreach(_lib ${ARGN})
--    list(APPEND WINPR_TOOLS_LIBS "${_lib}")
-+    list(APPEND WINPR_TOOLS_PUBLIC_LIBS "${_lib}")
-   endforeach()
--  set(WINPR_TOOLS_LIBS ${WINPR_TOOLS_LIBS} PARENT_SCOPE)
-+  set(WINPR_TOOLS_PUBLIC_LIBS ${WINPR_TOOLS_PUBLIC_LIBS} PARENT_SCOPE)
-+endmacro()
-+
-+macro(winpr_tools_library_private_add)
-+  foreach(_lib ${ARGN})
-+    list(APPEND WINPR_TOOLS_PRIVATE_LIBS "${_lib}")
-+  endforeach()
-+  set(WINPR_TOOLS_PRIVATE_LIBS ${WINPR_TOOLS_PRIVATE_LIBS} PARENT_SCOPE)
- endmacro()
- 
- macro(winpr_tools_definition_add)
-@@ -89,7 +97,7 @@ addtargetwithresourcefile(${MODULE_NAME} FALSE "${WINPR_VERSION}" WINPR_TOOLS_SR
- 
- add_compile_definitions(${WINPR_DEFINITIONS})
- target_include_directories(${MODULE_NAME} INTERFACE $<INSTALL_INTERFACE:include/winpr${WINPR_VERSION_MAJOR}>)
--target_link_libraries(${MODULE_NAME} PUBLIC ${WINPR_TOOLS_LIBS})
-+target_link_libraries(${MODULE_NAME} PRIVATE ${WINPR_TOOLS_PRIVATE_LIBS} PUBLIC ${WINPR_TOOLS_PUBLIC_LIBS})
- 
- installwithrpath(
-   TARGETS
-diff --git a/winpr/tools/makecert/CMakeLists.txt b/winpr/tools/makecert/CMakeLists.txt
-index 37b831125..0af1fcc08 100644
---- a/winpr/tools/makecert/CMakeLists.txt
-+++ b/winpr/tools/makecert/CMakeLists.txt
-@@ -31,11 +31,11 @@ endif()
- winpr_tools_module_add(${${MODULE_PREFIX}_SRCS})
- 
- if(OPENSSL_FOUND)
--  list(APPEND ${MODULE_PREFIX}_LIBS ${OPENSSL_LIBRARIES})
-+  winpr_tools_library_private_add(${OPENSSL_LIBRARIES})
- endif()
- 
- if(MBEDTLS_FOUND)
--  list(APPEND ${MODULE_PREFIX}_LIBS ${MBEDTLS_LIBRARIES})
-+  winpr_tools_library_private_add(${MBEDTLS_LIBRARIES})
- endif()
- 
--winpr_tools_library_add(${${MODULE_PREFIX}_LIBS} winpr)
-+winpr_tools_library_public_add(winpr)
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb
index f43c8cc7d2..2a985522c0 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.32.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb
@@ -8,9 +8,8 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "bf217a504e54cc719880c228e82353382cd7d4fa"
+SRCREV = "97eff6ddfbbfaa8e42a126d362686bd001ff8bdc"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
-           file://0001-winpr-tools-link-only-winpr-public.patch \
            file://run-ptest"
 
 

