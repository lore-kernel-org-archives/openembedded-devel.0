Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id AEF487D25F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:23:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x184so1447576pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GKa9Nxcex1Kz65sNt26QVQONWBaSjH9voJ3pkGh6dOQ=;
	b=SWcL2k0RFjuL3ZJpALtxqbAPfBNx05JU9/d7ay5LPOawG9gPKNIf9M+gFv3/DT+W15
	4OlXSlir+2sj1T1XZRcm3yoE+HeovsSNZHbgE+HUkwRBsROC/MbXkHtNTmNE9MbjcJTf
	8qDiByIZiDHLxdeupug2IhgCt2ecrOtBOWS92ln2f4zxnGLAbD82NgbqXp88763BL6+k
	j+PYKfTXjCimmsI8rrCgij2wNYf9DUamStR6RqsvcA199fSJ5nCL3GD7si4sZ0ikZCVx
	/Mbc9deco17tvfps7ziJcdiSmUV0QqhMysXgHVpPjvmYIp9ZB8yGKjScXBCA6fTqpY7P
	bDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GKa9Nxcex1Kz65sNt26QVQONWBaSjH9voJ3pkGh6dOQ=;
	b=cJtnUx5RrzlwNpYcfj1CBcf6mZaYgSAQlIQEYajGzTs26jTnLD6xXxFvu9oC3p5Qmq
	e2ahjchm+7rshfuly8O7fkCs4oUX2qqB3eCrjfYq47bY89AyFnvnjt4d/+/VRdR+hVAa
	af+G13asqJ2H3qliXxxrfv260hr7uTrM51+TJzfBT7wr8EEhJCnUeBa62wLlJvoDWyYE
	VqfhUnlctkDGfemJEZr4XHhKt6rg2DiySJyN7y16vnxV0T9giMdIe7RTgZxbpApCsN9K
	ngl2mA0+a5WzYn7YoEI4WU0rg1y4K07xkfuPG6j6cRJISD7Ad7oLAzp7TgfNeyE9aECT
	6woQ==
X-Gm-Message-State: APjAAAVJ3vBxK+xitOybrWb2PFjdrM6Pl5VdBc5ARL2qYF38jVnmVTlt
	K2jRfAPZTaL00KgOMiaFESvVefoSAyc=
X-Google-Smtp-Source: APXvYqyjsZF5M+KlT02yzFwqX6Xi8Do3JoEDMJLLQ71GARXFSueb1f0ktnbCpzK+m9acOVqR0hZEhw==
X-Received: by 2002:a63:ce50:: with SMTP id r16mr12685943pgi.32.1576182181023; 
	Thu, 12 Dec 2019 12:23:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3552])
	by smtp.gmail.com with ESMTPSA id
	r66sm8730732pfc.74.2019.12.12.12.23.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 12:23:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2019 12:22:50 -0800
Message-Id: <20191212202252.2786262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hdf5: Upgrade to 1.8.21
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Dec 2019 20:23:00 -0000
Content-Transfer-Encoding: 8bit

Forward port 0001-cross-compiling-support.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-cross-compiling-support.patch  | 23 ++++++++-----------
 .../hdf5/{hdf5_1.8.19.bb => hdf5_1.8.21.bb}   |  5 ++--
 2 files changed, 12 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/hdf5/{hdf5_1.8.19.bb => hdf5_1.8.21.bb} (92%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch b/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
index 97f16bbc0b..bdc1fa5f96 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
@@ -14,11 +14,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/CMakeLists.txt | 23 -----------------------
  2 files changed, 6 insertions(+), 23 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08a65c4..9af14d5 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -817,4 +817,10 @@ endif ()
+@@ -770,4 +770,10 @@ endif ()
  #-----------------------------------------------------------------------------
  configure_file (${HDF_RESOURCES_DIR}/H5pubconf.h.in ${HDF5_BINARY_DIR}/H5pubconf.h @ONLY)
  
@@ -29,22 +27,22 @@ index 08a65c4..9af14d5 100644
 +configure_file(H5lib_settings.c H5lib_settings.c COPYONLY)
 +
  include (CMakeInstallation.cmake)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index d343208..d11525b 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -613,32 +613,9 @@ set (H5_PRIVATE_HEADERS
+@@ -613,36 +613,9 @@ set (H5_PRIVATE_HEADERS
  #-----------------------------------------------------------------------------
  add_executable (H5detect ${HDF5_SRC_DIR}/H5detect.c)
  TARGET_C_PROPERTIES (H5detect STATIC " " " ")
 -if (MSVC OR MINGW)
 -  target_link_libraries (H5detect "ws2_32.lib")
 -endif ()
+-if (CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
+-  set_property(TARGET H5detect PROPERTY LINK_FLAGS "-O0")
+-endif ()
 -
--set (CMD $<TARGET_FILE:H5detect>)
 -add_custom_command (
 -    OUTPUT ${HDF5_BINARY_DIR}/H5Tinit.c
--    COMMAND ${CMD}
+-    COMMAND $<TARGET_FILE:H5detect>
 -    ARGS > ${HDF5_BINARY_DIR}/H5Tinit.c
 -    DEPENDS H5detect
 -)
@@ -54,11 +52,13 @@ index d343208..d11525b 100644
 -if (MSVC OR MINGW)
 -  target_link_libraries (H5make_libsettings "ws2_32.lib")
 -endif ()
+-if (CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
+-  set_property(TARGET H5make_libsettings PROPERTY LINK_FLAGS "-O0")
+-endif ()
 -
--set (CMD $<TARGET_FILE:H5make_libsettings>)
 -add_custom_command (
 -    OUTPUT ${HDF5_BINARY_DIR}/H5lib_settings.c
--    COMMAND ${CMD}
+-    COMMAND $<TARGET_FILE:H5make_libsettings>
 -    ARGS > ${HDF5_BINARY_DIR}/H5lib_settings.c
 -    DEPENDS H5make_libsettings
 -    WORKING_DIRECTORY ${HDF5_BINARY_DIR}
@@ -66,6 +66,3 @@ index d343208..d11525b 100644
  
  if (GENERATE_ERROR_HEADERS)
    find_package (Perl)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
similarity index 92%
rename from meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
rename to meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
index fcbe9b0d62..9af2b67149 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
@@ -16,9 +16,8 @@ SRC_URI = " \
     file://0001-cross-compiling-support.patch \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
 "
-
-SRC_URI[md5sum] = "6f0353ee33e99089c110a1c8d2dd1b22"
-SRC_URI[sha256sum] = "59c03816105d57990329537ad1049ba22c2b8afe1890085f0c022b75f1727238"
+SRC_URI[md5sum] = "2d2408f2a9dfb5c7b79998002e9a90e9"
+SRC_URI[sha256sum] = "e5b1b1dee44a64b795a91c3321ab7196d9e0871fe50d42969761794e3899f40d"
 
 FILES_${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
-- 
2.24.1


