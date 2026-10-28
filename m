Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36043.1793161466498214035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kUXYE+Mx;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso239472a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161466; x=1793766266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=kUXYE+Mx4rsGeBP1eB6ZmDDbwIT0u3D/E3w9gPKMZs60tsI/8Qrk6SRloZFk8aa+91
         xB9qvDft69Bi5kAToippY/npZVGVEjgBJTYwlxnpyjeo6t7zE8w6i5uzynpucOGJxN6g
         UHXvuHmS/1zsYpJoeIt3cPq02p96gFYhZ6ddnvtSMjTpXptaRPY+/Fs/FJNG+2WQv9b4
         degnV3JmZZEKv8hts3nOIwiihOjeea4K29kS5AfzAO+AXI3b/AePN+90uAjstQc6Pytl
         e5OUf6uFVoA6TtHp1W7Vmv019/PJAc+vKhe2+bdWQEf8lIYfI1VpqnTUuV/jEqVq6sSQ
         pgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161466; x=1793766266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=mWsTfhJ4fR9gn/XvXgaFT5ZG7L3a3UpwX//3IfNkrrffxrFHprk34n37xAnNYEz6EF
         H08REspd/GMzDuPWAGe0jpTlDPocJ6g8MaKejbW6l9GNLbsttrmAe7jUFwMPla2d4jqG
         ihTPHVoGMl/nzLqoamGKBSpBYys/ByG30G5WycJvdb8M+BBKTqA358EvYEDL4/4QOMf7
         +RGawu4457irF/uoCBhQkHMrgxEssNdidx3jHjiDMEAUnrykfwtfKfZ5bookchm4aN0r
         uC95SJu1D8lBP/X+9MIiAoFWKdW+9miV4rmG5EdTtf64glogKjNxmAATramH0Fz77BcI
         9sXA==
X-Gm-Message-State: AFq9FYKauxIgI12qfpoZcXBYssPjo3tQnL8Lo6AVIcUuE6w1z1yaKf2W
	++MJxvA9a6XVdv0ZSRTYdhFrRc1ARKPBuYuZeCgkr2navUq8ZCK0kapPHSBf1Q==
X-Gm-Gg: AYBFou32R3y9b61yzmXAcqBjzk48xzVdy9w9TlfsiENe4xwChUsQqzUUQ2+z3j3aRWo
	NxZcP7qn7/IQqGdkJjNuoVOvYXklEUd3EKC7GJaSn5KXKZaplqiyeJ9ZyMoRvnX2fptUs8C2EKn
	aHvflCwk8/uFzVMJTvKZ43BRpQuSqgfRvfw1vXCnsx2w8+dmWEVfdCaodIignh9lQRHv4NJZGPw
	ZMdfZmDOCFj60WNujBmLcx4+QKkVOO3L7UAeZ99DcdB0oLEtKlkDc9AVA1cwnAr+Rvb+ntEKMZR
	flY/e4DiF5tqZdtYRME6WzdfGFDBc1yr7W6lzBEqdhHX4eP6tlhIdPzOYaN5EPsuykT24zrQi+p
	8Vt10ujFfQbY2X+VFJAB7BmFLBR/ZWf4IWL1wddcbc6/YGlW/pJXF4EJrdme/TLWESgix2rZqkq
	0NaZhGBP1KSlgIVmEG05Y6TBciWYTu3Nxidwiy4WiBH2xBAbs59cU5gaOBdHvceUVgoZLhfg/ut
	cFGBSXcJiU/pIr/ZS0XJ8QkHQIaPxzbvnJiiCpoGZu1yzoPXXBc+ujzmXguGY6uTI3cKtNRux4f
	uWKorEI584X+mUrrisEth2nfVF4HXoYuGaikLowOedA/l5BTReeRvnoUwhj9cwOy7yWVdvVqzLI
	HCquT3bI=
X-Received: by 2002:a17:90b:4a07:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3ae57f630aemr928439a91.21.1793161465826;
        Tue, 27 Oct 2026 21:24:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 08/60] freerdp3: upgrade 3.32.1 -> 3.32.2
Date: Wed, 28 Oct 2026 17:23:06 +1300
Message-ID: <63837fd4bd94dbaa035acf2bafbd6a5dbf7d5861.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131560
Content-Type: text/plain; charset="utf-8"

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
 
 
