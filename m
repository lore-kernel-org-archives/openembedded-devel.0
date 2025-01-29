Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011F9C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 05:07:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.6583.1738127249049755030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 21:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hrn3feEU;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so10973345a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 21:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738127248; x=1738732048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPbGCBpvKZ7S7Sqm7wVXqPa17STyXObrIbAktctCxV0=;
        b=Hrn3feEUow4aTcl5nHhcUM6OPSGQj/fpdmjA+cmnjeurGgWQE7Ub5ibmw2srStc1gK
         iVnpKYOMwS8wgyVu1pcNl8Yfvfy1TPcWX9FlUAKzUGRTMy1CpKOI2V7I30r1rIYI6mks
         B56UR18/Y7O1q6w5RYvXcSEPuAKS6QgtnaKF/ydQfiAwb1CJL61T97MI5EJiiaSMGCbU
         NvoeXkfh0cHNXMlSFocEfVUWK3a9AKatTsgugoaiWj982s62O3/EnYIWaJMkuBN6l2TW
         2ngv06oDNwcQ+R7BBHtOzZIadYgrvQb9DsUMASyrmNTDIiHrGSmRIzPPXM1y17+HtlBp
         4Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738127248; x=1738732048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPbGCBpvKZ7S7Sqm7wVXqPa17STyXObrIbAktctCxV0=;
        b=i1yWJojB2AuTlVX5JxZ5zCULjymeevJfu7x5aew2/KKG8KvOpawzrU+HEZ93OjqjL1
         i9Mwv37mQ176/V0C8PLrrw+DIPHUyu8E9ERfQ3uVLIK8W/7UHjSp9CB94eD6VzXv+V4Q
         yxRXSQAaVVPlvqvIQlljKHlPcX35FZoUzGCkjmjRGGrwAxNRbWsWFtxLNSo3aucBZ6UX
         TvFYXNccx5OlPoC5Fq5jxgusHc7e2EsxDOMbIZM/f9Le0bekAxrafOEDkPE8ei7q3bxU
         klcKKCoH+1DSXbgFlg8kfHzBInL2YwMmV2ORZbZeDKi+sm6W8cdu9HOhyab/i3aA0gAp
         nV1A==
X-Gm-Message-State: AOJu0Yx7m2tzjvfmrD7CqYCh2XwxpS4t5vQ3S5QjWLf87HOoNeoLnms0
	CYPL9SIKy+SdMYVR7mp2kTlEtZjsfz7vPdN8fnv9CoEzw87rtWyBj85bx6KB
X-Gm-Gg: ASbGncuYv4skkLSBYDYVFwFPiQ7kLF6hV8YXVa84C1767fiqy+ZLeJCi2iFsUkySOrA
	DdJPzuvmGx0mm4CGK0qe4B9o5mLfCEltBAa1oFEY+O6RgdiaLKx9p1/57comXlts1L/W8c4QRTD
	MjkMYKMLtmRC55oxuGEFqr7tgzLuHFHK68H77kGtmspv/yldc2MSjTZfTI6xLYWo+KWKqcSqXG7
	nw+NL4thDPiOMYsYyn3ApuGsrqQxDQTh8rVftFg2OThoGDQOJ71rq/X+9lAw2EGuNqFrT7JdyWD
	YTs9nAE=
X-Google-Smtp-Source: AGHT+IGWI9P4bXvmn6/l5Emt+pMi9ayDqFoIvDez8kwIqtvN4kVTa3pF3iES/5yn0tnbBVgBGXSsog==
X-Received: by 2002:a05:6a00:179d:b0:725:eacf:cfda with SMTP id d2e1a72fcca58-72fd0c5b841mr2521767b3a.17.1738127248180;
        Tue, 28 Jan 2025 21:07:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::eb05])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fdd5sm10535476b3a.10.2025.01.28.21.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 21:07:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Antonios Christidis <a-christidis@ti.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] opencl-cts: Add recipe
Date: Tue, 28 Jan 2025 21:07:23 -0800
Message-ID: <20250129050723.2727806-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 05:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115127

From: Antonios Christidis <a-christidis@ti.com>

This recipe provides the opecl-cts suite.  This is a pre-release version
v2024-08-08, which I have tested to work with opencl-headers version v2024.05.08
. The pre-release version was picked due to incompatibility issues with other
versions of headers.

Add a patch to add an option to disable warning as error

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add a CMake option to disable Werror, distros would want that

 .../files/0001-Ignore-Compiler-Warnings.patch | 43 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 28 ++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 0000000000..2e8b52d794
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,43 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Create CMake option ENABLE_WERROR
+
+This creates an option that can be toggled on or off when configuring the project.
+By default, it's set to ON
+
+Upstream-Status: Pending
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,6 +19,16 @@ add_definitions(-DCL_USE_DEPRECATED_OPEN
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
+ add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
+ 
++option(ENABLE_WERROR "Enable warnings as errors" ON)
++
++if(ENABLE_WERROR)
++  if(MSVC)
++    add_compile_options(/WX)
++  else()
++    add_compile_options(-Werror)
++  endif()
++endif()
++
+ option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
+ if(USE_CL_EXPERIMENTAL)
+   add_definitions(-DCL_EXPERIMENTAL)
+@@ -99,7 +109,6 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_C
+     add_cxx_flag_if_supported(-Wmisleading-indentation)
+     add_cxx_flag_if_supported(-Wunused-function)
+     add_cxx_flag_if_supported(-Wunused-variable)
+-    add_cxx_flag_if_supported(-Werror)
+     if(NOT CMAKE_BUILD_TYPE MATCHES "Release|RelWithDebInfo|MinSizeRel")
+         # Enable more warnings if not doing a release build.
+         add_cxx_flag_if_supported(-Wall)
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 0000000000..69181916b1
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,28 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core python3-io"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+	   file://0001-Ignore-Compiler-Warnings.patch"
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+SECURITY_STRINGFORMAT:remove = "-Werror=format-security"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}

