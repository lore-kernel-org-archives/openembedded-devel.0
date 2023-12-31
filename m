Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A85BC47DA6
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.219020.1704025425183613649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFoYkFBM;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d2376db79so74656185e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025423; x=1704630223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K1aN5nEeqluZMJH3FgcW0ri+CS0e/nL5BWJhZDCKEM=;
        b=XFoYkFBMpGRd5Q1nLr/qiIQRH1+h01qFLYQeEZwcwxS4RzVJoLE4Z5cvNpvLasN6JT
         Od2RULh0YWaRycAMiJPfrRnIO21s5kZWhyRMGXDAAoPHVG8W/bbOR9OyD738i2/lKXR1
         mIYTy3RHO3lyEeTkxrSi9G6YzD4GlRlfXP2ErAJbaYZsByvJKQnoHHicGrFIaoesGwAA
         r98CHdywP/zW8Hzwl+gK3PeCVbqQwSlRW0bLkJvixx5kjeTMXQ2n5SQtr2n9gMRdfL66
         xDGwV3P1uxInEZrlrpP/erdnFy2n88nvEKGdbpfuvjqor3dGySOyH4Le25ZiVHf3ypey
         Hs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025423; x=1704630223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K1aN5nEeqluZMJH3FgcW0ri+CS0e/nL5BWJhZDCKEM=;
        b=MTEXAkS+rTv7ZFaFtmepU1P1rs0WmEGYYstxR4JfSvgHx+wF6ZQnaDkBR6cm5PgVvw
         FeGKOt1u3B6pKW0N5wYR6R0XkFEh/b6kCDowRke+f/XRqnK0KZthu2ZjZZgg8YVmgb/v
         jDApHybjsUAVKjMOytAbLzr5vEqFAjUj/oGdgI2OGKw1/PP78IHt5FseN5QwWBVBvE2w
         K0UZ+/z2TVenEQNygB7IXvzKKHfPm8FX/X3svrWlkcvKKYghh8ANf0E8OcOM4zDcH7sE
         Xl94Tu0SMfNqRlKWSerajbP2a+8/VwQpQKEDZII3odgOKtjBZ+ZkSH3l516oEu/OyNgf
         CqaQ==
X-Gm-Message-State: AOJu0YySzUAVNW2BuBQdj92iGX6Z9tAIMj971uNQjdMGqIPFRg1KuGvR
	PSVka5pqqeMezAKTAv+OVwNodBX0O4M=
X-Google-Smtp-Source: AGHT+IE1IbthaQSG12lSQQ4Xdu7gNJWrAxHFdNVYBuN9Bw/jfCjcfZVe7+q4s+TfKcXPIy4XheoRSw==
X-Received: by 2002:a05:600c:3516:b0:40d:8812:2aa6 with SMTP id h22-20020a05600c351600b0040d88122aa6mr261378wmq.36.1704025423546;
        Sun, 31 Dec 2023 04:23:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/23] wireshark: update 4.0.10 -> 4.2.0
Date: Sun, 31 Dec 2023 13:23:20 +0100
Message-Id: <20231231122329.405225-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107965

This resolves python 3.12 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-try_run-test-when-cross-compiling.patch | 66 --------------
 ...-do-not-use-lemon-data-from-the-host.patch | 32 +++++++
 ...ireshark-src-improve-reproducibility.patch | 16 ++--
 .../0002-flex-Remove-line-directives.patch    | 14 ++-
 .../0004-lemon-Remove-line-directives.patch   | 87 +++++--------------
 ...wireshark_4.0.10.bb => wireshark_4.2.0.bb} |  6 +-
 6 files changed, 73 insertions(+), 148 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_4.0.10.bb => wireshark_4.2.0.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch b/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
deleted file mode 100644
index 0d51ce1b8..000000000
--- a/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From b4f29807225cf3744c2f4f971902fbdd7486fc19 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jo=C3=A3o=20Valverde?= <j@v6e.pt>
-Date: Fri, 26 May 2023 13:29:23 +0100
-Subject: [PATCH] CMake: Fix a try_run() test when cross-compiling
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- ConfigureChecks.cmake | 36 ++++++++++++++++++++----------------
- 1 file changed, 20 insertions(+), 16 deletions(-)
-
-diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
-index dd8268e077..d8bca54115 100644
---- a/ConfigureChecks.cmake
-+++ b/ConfigureChecks.cmake
-@@ -122,26 +122,30 @@ check_type_size("ssize_t"       SSIZE_T)
- # Check if the libc vsnprintf() conforms to C99. If this fails we may
- # need to fall-back on GLib I/O.
- #
--check_c_source_runs("
--	#include <stdio.h>
--	int main(void)
--	{
--		/* Check that snprintf() and vsnprintf() don't return
--		 * -1 if the buffer is too small. C99 says this value
--		 * is the length that would be written not including
--		 * the nul byte. */
--		char buf[3];
--		return snprintf(buf, sizeof(buf), \"%s\", \"ABCDEF\") > 0 ? 0 : 1;
--	}"
--	HAVE_C99_VSNPRINTF
--)
--if (NOT HAVE_C99_VSNPRINTF)
--	message(FATAL_ERROR
-+# If cross-compiling we can't check so just assume this requirement is met.
-+#
-+if(NOT CMAKE_CROSSCOMPILING)
-+	check_c_source_runs("
-+		#include <stdio.h>
-+		int main(void)
-+		{
-+			/* Check that snprintf() and vsnprintf() don't return
-+			* -1 if the buffer is too small. C99 says this value
-+			* is the length that would be written not including
-+			* the nul byte. */
-+			char buf[3];
-+			return snprintf(buf, sizeof(buf), \"%s\", \"ABCDEF\") > 0 ? 0 : 1;
-+		}"
-+		HAVE_C99_VSNPRINTF
-+	)
-+	if (NOT HAVE_C99_VSNPRINTF)
-+		message(FATAL_ERROR
- "Building Wireshark requires a C99 compliant vsnprintf() and this \
- target does not meet that requirement. Compiling for ${CMAKE_SYSTEM} \
- using ${CMAKE_C_COMPILER_ID}. Please report this issue to the Wireshark \
- developers at wireshark-dev@wireshark.org."
--	)
-+		)
-+	endif()
- endif()
- 
- #
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/wireshark/files/0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch b/meta-networking/recipes-support/wireshark/files/0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch
new file mode 100644
index 000000000..1903f38f5
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch
@@ -0,0 +1,32 @@
+From 802d3cafa888b36aa72007d48232a010dbb0231d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 27 Dec 2023 16:57:28 +0100
+Subject: [PATCH] UseLemon.cmake: do not use lemon data from the host
+
+We use native lemon, and not the host one, so
+the data should be taken from the source tree as well.
+
+Upstream-Status: Inappropriate [cross-specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ cmake/modules/UseLemon.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/modules/UseLemon.cmake b/cmake/modules/UseLemon.cmake
+index fa4034e..83a7ca3 100644
+--- a/cmake/modules/UseLemon.cmake
++++ b/cmake/modules/UseLemon.cmake
+@@ -13,11 +13,12 @@ if(LEMON_EXECUTABLE)
+ 				${_out}.out
+ 			COMMAND ${LEMON_EXECUTABLE}
+ 				-l
+-				-T/usr/share/lemon/lempar.c
++				-T${CMAKE_SOURCE_DIR}/tools/lemon/lempar.c
+ 				-d.
+ 				${_in}
+ 			DEPENDS
+ 				${_in}
++				${CMAKE_SOURCE_DIR}/tools/lemon/lempar.c
+ 		)
+ 	endmacro()
+ 	add_custom_target(lemon)
diff --git a/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
index 6ad8a62c2..202de6260 100644
--- a/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
+++ b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 0a9ab056ce7582033a21d6bc541ece520bf2b0b6 Mon Sep 17 00:00:00 2001
+From d9c4cdad0c48becab491ea4e80e5cd81f7d1dc97 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Thu, 26 Nov 2020 05:38:31 -0800
 Subject: [PATCH] wireshark-src: improve reproducibility
@@ -8,15 +8,15 @@ comments.
 
 Upstream-Status: Pending
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+
 ---
- tools/make-plugin-reg.py | 2 +-
- tools/ncp2222.py         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ tools/ncp2222.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: wireshark-4.0.6/tools/ncp2222.py
-===================================================================
---- wireshark-4.0.6.orig/tools/ncp2222.py
-+++ wireshark-4.0.6/tools/ncp2222.py
+diff --git a/tools/ncp2222.py b/tools/ncp2222.py
+index f14d0c5..05073b9 100755
+--- a/tools/ncp2222.py
++++ b/tools/ncp2222.py
 @@ -5891,7 +5891,7 @@ def produce_code():
  
      print("/*")
diff --git a/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
index 069b5793d..0e6249c93 100644
--- a/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
+++ b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
@@ -1,4 +1,4 @@
-From 3e571e24c730f747d18ed02ba7451e9e00480fc7 Mon Sep 17 00:00:00 2001
+From e4e88c2f55286cf24af230b265d0e059363baa6c Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Thu, 26 Nov 2020 12:00:43 -0800
 Subject: [PATCH] flex: Remove #line directives
@@ -8,12 +8,13 @@ generate #line directives with absolute file patch.
 
 Upstream-Status: Pending
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+
 ---
  cmake/modules/FindLEX.cmake | 18 +++++++++++++-----
  1 file changed, 13 insertions(+), 5 deletions(-)
 
 diff --git a/cmake/modules/FindLEX.cmake b/cmake/modules/FindLEX.cmake
-index 0008bc4..ec68f84 100644
+index 20caa09..174f452 100644
 --- a/cmake/modules/FindLEX.cmake
 +++ b/cmake/modules/FindLEX.cmake
 @@ -32,11 +32,19 @@ MACRO(ADD_LEX_FILES _source _generated)
@@ -22,25 +23,22 @@ index 0008bc4..ec68f84 100644
  
 -      ADD_CUSTOM_COMMAND(
 -        OUTPUT ${_outc} ${_outh}
--        COMMAND ${LEX_EXECUTABLE} -o${_outc} --header-file=${_outh} ${_in}
+-        COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> -o${_outc} --header-file=${_outh} ${_in}
 -        DEPENDS ${_in}
 -      )
 +      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
 +        ADD_CUSTOM_COMMAND(
 +          OUTPUT ${_outc} ${_outh}
-+          COMMAND ${LEX_EXECUTABLE} --noline -o${_outc} --header-file=${_outh} ${_in}
++          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> --noline -o${_outc} --header-file=${_outh} ${_in}
 +          DEPENDS ${_in}
 +        )
 +      ELSE ()
 +        ADD_CUSTOM_COMMAND(
 +          OUTPUT ${_outc} ${_outh}
-+          COMMAND ${LEX_EXECUTABLE} -o${_outc} --header-file=${_outh} ${_in}
++          COMMAND ${LEX_EXECUTABLE} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:--debug> -o${_outc} --header-file=${_outh} ${_in}
 +          DEPENDS ${_in}
 +        )
 +      ENDIF ()
        LIST(APPEND ${_source} ${_in})
        LIST(APPEND ${_generated} ${_outc})
        INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
--- 
-2.26.2.Cisco
-
diff --git a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
index 134633f66..1a6fe8d39 100644
--- a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
+++ b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
@@ -1,4 +1,4 @@
-From 17f05a8d02c589e4867906f70381e63e46a67870 Mon Sep 17 00:00:00 2001
+From 94b951c0cccf67b66749cc87c473e63fa5207e83 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 27 Jan 2021 06:47:13 -0800
 Subject: [PATCH] lemon: Remove #line directives
@@ -8,67 +8,28 @@ directives with extra option '-l'.
 
 Upstream-Status: Pending
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+
 ---
- cmake/modules/UseLemon.cmake | 49 +++++++++++++++++++++++++-----------
- 1 file changed, 34 insertions(+), 15 deletions(-)
+ cmake/modules/UseLemon.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
 
-Index: wireshark-3.4.11/cmake/modules/UseLemon.cmake
-===================================================================
---- wireshark-3.4.11.orig/cmake/modules/UseLemon.cmake
-+++ wireshark-3.4.11/cmake/modules/UseLemon.cmake
-@@ -7,21 +7,40 @@ MACRO(ADD_LEMON_FILES _source _generated
- 
-       SET(_out ${CMAKE_CURRENT_BINARY_DIR}/${_basename})
- 
--      ADD_CUSTOM_COMMAND(
--         OUTPUT
--          ${_out}.c
--          # These files are generated as side-effect
--          ${_out}.h
--          ${_out}.out
--         COMMAND $<TARGET_FILE:lemon>
--           -T${_lemonpardir}/lempar.c
--           -d.
--           ${_in}
--         DEPENDS
--           ${_in}
--           lemon
--           ${_lemonpardir}/lempar.c
--      )
-+      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
-+        ADD_CUSTOM_COMMAND(
-+          OUTPUT
-+            ${_out}.c
-+            # These files are generated as side-effect
-+            ${_out}.h
-+            ${_out}.out
-+          COMMAND lemon
-+            -l
-+            -T${_lemonpardir}/lempar.c
-+            -d.
-+            ${_in}
-+          DEPENDS
-+            ${_in}
-+            lemon
-+            ${_lemonpardir}/lempar.c
-+        )
-+      ELSE ()
-+        ADD_CUSTOM_COMMAND(
-+          OUTPUT
-+            ${_out}.c
-+            # These files are generated as side-effect
-+            ${_out}.h
-+            ${_out}.out
-+          COMMAND lemon
-+            -T${_lemonpardir}/lempar.c
-+            -d.
-+            ${_in}
-+          DEPENDS
-+            ${_in}
-+            lemon
-+            ${_lemonpardir}/lempar.c
-+        )
-+      ENDIF ()
- 
-       LIST(APPEND ${_source} ${_in})
-       LIST(APPEND ${_generated} ${_out}.c)
+diff --git a/cmake/modules/UseLemon.cmake b/cmake/modules/UseLemon.cmake
+index e419de1..fa4034e 100644
+--- a/cmake/modules/UseLemon.cmake
++++ b/cmake/modules/UseLemon.cmake
+@@ -12,6 +12,7 @@ if(LEMON_EXECUTABLE)
+ 				${_out}.h
+ 				${_out}.out
+ 			COMMAND ${LEMON_EXECUTABLE}
++				-l
+ 				-T/usr/share/lemon/lempar.c
+ 				-d.
+ 				${_in}
+@@ -30,6 +31,7 @@ else()
+ 				${_out}.h
+ 				${_out}.out
+ 			COMMAND $<TARGET_FILE:lemon>
++				-l
+ 				-T${CMAKE_SOURCE_DIR}/tools/lemon/lempar.c
+ 				-d.
+ 				${_in}
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb
index 008aa8cb1..4a4768092 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.0.bb
@@ -4,20 +4,20 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares"
+DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares speexdsp"
 
 DEPENDS:append:class-target = " wireshark-native chrpath-replacement-native "
 
 SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
-           file://0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch \
            file://0001-wireshark-src-improve-reproducibility.patch \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
+           file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898"
+SRC_URI[sha256sum] = "0e428492f4c3625d61a7ccff008dc0e429d16ab8caccad4403157ea92b48a75b"
 
 PE = "1"
 
-- 
2.39.2


