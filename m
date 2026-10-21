Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7499.1792574963289279595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f3zo007o;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-157fe9d771bso659807c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574963; x=1793179763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=f3zo007oiXt2sX+XcgkRpG12Fk6RpQrPZrg8WQqMIQRUPcUXwBUWaPL5uHBYU7P7+z
         8Obgm/G76XnBWzMgUeO5f65jNzGm9PU//DyLY5OOQ06lMZlVhOGzBibvQzWgMRMg0P/U
         9c37NOLKjvcGczAymA2LG5A3Q9Xsj5JVt+nAG6fWinpr9ubvIxkPxq/x8zZBPlSMv0eX
         5fSf7SLTBC8mnlTHVpR+zeCkKEvj1O0ZcLJQwE8eIGjtFg3jHBrVDMSmjVGqZh3Pu4l3
         6sMpfipEbTlp1hN9LX5cjobD6vYtyvyaTPzo/ceMzQeDcKUyed6mi+ON+JqNZN5fDMVK
         XiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574963; x=1793179763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4x69lUCrVBQwJ4mdn2UdiHmcMV75dkXJrevM7XafYo=;
        b=2oYH0ass4E+3q5FTs8QPC47JKw5ZuFKL6hK2CXH4u0IvUmC3mPwcRBfvh306M+sOXd
         dOad0Oj9YW1nHbraCt6Ys18jaTzHWTUD3DMMXRTfnGaHa92ZE4rLQFmyuLNL9xTOLD1N
         jK4SBqtW7orm7dBHktsIrEIS4P22cyPAmjTR2mRYqLM+5BGNfqxcAGU6fGJyao1q9vGj
         cF3KnXyDmJolEDAkRPky1305uIY3t0QB/UFjHxZYn9T8+MOV0Un1OVnCuwpk57TPcLnj
         0K2JyfNew5qB6GFjy1gZYYZNVQUkC6cJBrkJpP4zBdfCK31/saN94tydO3oB9IO711wu
         EtAw==
X-Gm-Message-State: AFq9FYJ4kuPwXRneJJGlX9yFM0sPVBwYZ4ouncfF8itWX6Xy6ZeeGlfC
	ddpC9IBaLjfnBLN1Wv6BEXJ/DyodVXoccl51nWskBH/ZdKF2Fhuo6lgtuWQL8w==
X-Gm-Gg: AYBFou171bpaChBEvDrsWLsumFkRgeYx1jeAt7hQM/ZP8JEOvdZq2QOcSPWw4b7TYnv
	/zE6n0jXczwoHPSiQoQVDHlq2S9jp9vZfhsTh+D0Wrjhk9uaFz6DgNDM2dOzFYqVroV0jeL8tu+
	1ksmKSevJ15zjzSbNF5HpbeC11Ilg+qO4XZGgL3Vda2PL4j8SxvYIqtf8NiwB6zVmJStv94NY8n
	6P5hnrnRny7MZUv6136n5xxgHD0c3TetxAPJKd82YIZk7P05s2VmQXASIXtrabIOOtGc4+asoqF
	h4j8Yupu5DpoaPbYD8DhNDrxQzEhp0iy2K28LoFnY+GeTTW69dYww3DF2Co9kmPDcGtJWxl/C48
	VvVmTwB0k5VvANCornNK2oRuaPaUFCymMiJ0/WPdtNy8evqilxo+gbbZ2TjbLXDVmlo3tFa1q11
	bgVE2Dax/9e0cvqbZKTasuwQmQjptmq3xfiWxFimszVaZX7UhFw+kO3wFDpAY1/0uel85XMUYxK
	iXXrQu/aVhsCse/Boc0Ns1TiYgxlodpHIiI/Xstu1ntCFBcjuxa5qFZkeoWvRtb/Ms+JnC1309N
	W1izBbrV3jnJXI8s20+ogOmcEVfu/AE=
X-Received: by 2002:a05:701b:270c:b0:190:d9bb:281f with SMTP id a92af1059eb24-190d9bb28b2mr1624001c88.18.1792574962518;
        Wed, 21 Oct 2026 02:29:22 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 8/44] freerdp3: upgrade 3.32.1 -> 3.32.2
Date: Wed, 21 Oct 2026 22:28:21 +1300
Message-ID: <20261021092857.3585453-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131195
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
 
 
