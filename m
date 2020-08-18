Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.69289.1597768082676902620
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 09:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CgY0bdzC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id f193so10209438pfa.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDyHNCjaXhmwsq2ACxCpgQLkRlIEQzddxP+XNCD/nPY=;
        b=CgY0bdzCWK7y8xdDWwG5xJSOb2VqgvwEzS8Z+WqA4gxiLe0r5AAWxo3v41DkM2gxsA
         Z6bZ1mbGcal52G2uj8ZN9fKd9CRPx560IYQCLoWratpH1njNlGwh8c3Lbj1oZECSLv3I
         Ct9eIroMfz4/1xn4Vz3DCHvqjjtNOEmmzCx343UziBsB1oLpjdpVbCNPju+BBEH9kwn0
         EHoKqN34H6X33Nahabg4dzoRPHi9xxLFdHWONPZI7KU5lSHiLac4jQmjKOq7SIhCwiTu
         wXCHN3KTIom48/wHRqxvEVRmiVTpDlcfKzLnyLEDjnD25uMuWNNN0YdT7KTngAVSMuaD
         Dhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDyHNCjaXhmwsq2ACxCpgQLkRlIEQzddxP+XNCD/nPY=;
        b=NyNQlBxUbAU0Lv2P3GI3qPcqj8mIAQIyv0e5DECLYssAkah2pVNkFyTzZPfRXeii5C
         C3MotEWBZDyi0gSCZgiR1EiBdYyYqulWaPIXSxn4VpQiZprYmbVO4GhQIij4Afdr42cc
         rT6FbxXdJedYXjPHMw0/Hn7TjNBFNDPkO602O0PfCh9MU6XIYpParJTRV0ZJNczerXnq
         pC1g0DyFoj0xZ6Yb/LafwIlYlT5LgmGtSsOXwhUtPqn+FwtLsblF9zEmN91ObfDzuY5g
         e0cE0MqcWdUZg8PmTOQc5feagY2pdeyB3ylgbVqg2I05AS+rvy3WpXaTAcrC7BoUkr09
         GBtw==
X-Gm-Message-State: AOAM532zNf9n1Z77c1nOMlic/r7YfHzkMsxCI0gZ72LH98U7wFw3IyPY
	s+zDZfYKlQpLS9UnSImBaTqFR++cnSLBbg==
X-Google-Smtp-Source: ABdhPJwroZ2KGRkMye9HvaaPsHUhMik43dBryB/i1LTeWASYAmLyrOkJ2O5SxeKW63EN20bBgxSC2w==
X-Received: by 2002:aa7:9f46:: with SMTP id h6mr15863768pfr.321.1597768081688;
        Tue, 18 Aug 2020 09:28:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id t14sm22236840pgb.51.2020.08.18.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:28:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix linking with libxml2
Date: Tue, 18 Aug 2020 09:27:59 -0700
Message-Id: <20200818162759.1867769-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when libxml2-native is staged, then on x86 it starts to detect that for
target and fail to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...l2-to-linker-cmdline-of-xml-is-found.patch | 39 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
new file mode 100644
index 0000000000..d813b37f99
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
@@ -0,0 +1,39 @@
+From 609e1745d26d6f42d426018a4dd8d2342d6fc170 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Aug 2020 08:37:57 -0700
+Subject: [PATCH] Add -lxml2 to linker cmdline of xml is found
+
+When cross compiling for systems where static libs
+for libxml are not available cmake's detection mechanism
+resort to linking with libxml.so but doesnt use -lxml2
+liblldbHost.a however requires libxml on linker
+cmdline _after_ itself so its use of symbols from libxml2
+can be resolved. Here check for libxml2 being detected and
+add it if its found.
+
+Fixes
+minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/lib/libxml2.so is incompatible with elf32-i386
+| clang-11: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/libarchive-3.3.2/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thirdparty/libarchive-3.3.2/CMakeLists.txt b/thirdparty/libarchive-3.3.2/CMakeLists.txt
+index 0c1ea6f7..cde0cc51 100644
+--- a/thirdparty/libarchive-3.3.2/CMakeLists.txt
++++ b/thirdparty/libarchive-3.3.2/CMakeLists.txt
+@@ -1031,7 +1031,7 @@ ENDIF()
+ IF(LIBXML2_FOUND)
+   CMAKE_PUSH_CHECK_STATE()	# Save the state of the variables
+   INCLUDE_DIRECTORIES(${LIBXML2_INCLUDE_DIR})
+-  LIST(APPEND ADDITIONAL_LIBS ${LIBXML2_LIBRARIES})
++  LIST(APPEND ADDITIONAL_LIBS xml2)
+   SET(HAVE_LIBXML2 1)
+   # libxml2's include files use iconv.h
+   SET(CMAKE_REQUIRED_INCLUDES ${ICONV_INCLUDE_DIR} ${LIBXML2_INCLUDE_DIR})
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 92baa98314..37036ebbb4 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
 
-DEPENDS = "virtual/crypt expat flex python3 bison-native"
+DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2"
 RDEPENDS_${PN} = "python3-core"
 
 SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://fix-osspuuid-musl-compile.patch \
             file://fix-rocksdb-cross-compile.patch \
             file://remove_const_due_to_std_lock_guard.patch \
+            file://0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.28.0

