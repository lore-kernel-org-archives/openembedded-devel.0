Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.14658.1594397953150481798
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 09:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RH6Wpoas;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: philip.balister@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id o38so4856849qtf.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=SmV8BopIicHtPykBPbHnxLFZ5n/nu2NfZpedZF05yLQ=;
        b=RH6WpoasUUONHWkChjTBQ2CwGCoqHppjSLyc1wUb67aSUcQKV99ZRdB5DD4SxyFef5
         qDGKgIDAFr5HjWxfijLTy4O+yloFEXkfVDFpNX6at+dTQOv++yMOBWxl0UJyad9MBniF
         bcK7AOw+rDhhBzNOaSmcxE6E8lLzi2NlFzFRvPIWyyPSSVw5j0knprLCPtb4FsNJEwa5
         ksj+ULD8QhGS0O0NATtl1AIFp3JcwHLO7e0ftBpdCJ7DDFMWRyB44+N32Eq5+raZ7ckp
         LWX+IvTPo376X8EnDIv5yVJANkLWOIUzUO9K81MfnuFw3/qml1/UPC/cV2GyEwzu6fjR
         3iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=SmV8BopIicHtPykBPbHnxLFZ5n/nu2NfZpedZF05yLQ=;
        b=Qajipxjl/LJVoL88sHaebQ1juAIP20m6b8tAtwV8FU0TImW1CDlwFASaAJdyQ6oa5v
         Iw9yASJBZhyih1DaIXBnALZV3ftMZnqV8Ahysvbo75S5h7KlxuB/gh2YtuVFT3tIbFmd
         7ZlT+qLY2RGBNN4PgyPYkpJ0rEZacg2lK5yxSyiMB1FAhH6OKlErn4NSaLw3apoBRP9v
         +SczR08rE2k9NEh8EXTUCK+NwvrSllzZD4Zeh3EtHShVzqPedg7+5uzIDe6ijIJbs6R5
         u/f/whuCkYRzjaq+Whre5Mid9U2CmaIYf6N2WF8tNmdNaNBZh0oCuUDxCt0mu3STSYcE
         Qm9Q==
X-Gm-Message-State: AOAM533cKiHZtCaesZe95ueIZGgutVs838n9hLorD3LmSb7h58Vx7hOq
	3DY/NEWItydnavgfekijkV7ZV32pTaM=
X-Google-Smtp-Source: ABdhPJxAb8xgwoRBsz4rb3hCfdCUU2tlxQHQXtUOX0NTXX+cqqC0/aGRx8ixIR0qo7n/lbwMTebn5Q==
X-Received: by 2002:ac8:4251:: with SMTP id r17mr69062206qtm.372.1594397951818;
        Fri, 10 Jul 2020 09:19:11 -0700 (PDT)
Return-Path: <philip.balister@gmail.com>
Received: from prague.hsd1.va.comcast.net ([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
        by smtp.gmail.com with ESMTPSA id t35sm8528866qth.79.2020.07.10.09.19.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 09:19:10 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-python][PATCHv2] python3-pybind11: Use cmake to build and add -native version
Date: Fri, 10 Jul 2020 12:19:06 -0400
Message-Id: <20200710161906.7297-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6

 * Switch to git repo to pick up cmake files for recipes to use
 * Use cmake to build innstead of pypi so cmake files are included in sysroot
 * Disable tests to prevent configure failure (I tried adding pytest asa DEPEND)
 * Patch out cmake that strips output to prevent QA failures
 * Do not check pointer length for installed python when cross compiling.
 * With this I can build gnuradio using pybind11.

Signed-off-by: Philip Balister <philip@balister.org>
---
 ...t-check-pointer-size-when-cross-compiling.patch | 30 +++++++++++++++++
 .../0001-Do-not-strip-binaries.patch               | 39 ++++++++++++++++++++++
 .../python/python3-pybind11_2.5.0.bb               | 17 ++++++++--
 3 files changed, 83 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
new file mode 100644
index 000000000..6455c95e7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
@@ -0,0 +1,30 @@
+From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Fri, 10 Jul 2020 10:14:59 -0400
+Subject: [PATCH] Do not check pointer size when cross compiling.
+
+It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
+| CMake Error at tools/FindPythonLibsNew.cmake:127 (message):
+|   Python config failure: Python is 64-bit, chosen compiler is 32-bit
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ tools/FindPythonLibsNew.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
+index d0c8fa2..8479e70 100644
+--- a/tools/FindPythonLibsNew.cmake
++++ b/tools/FindPythonLibsNew.cmake
+@@ -123,7 +123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
+ 
+ # Make sure the Python has the same pointer-size as the chosen compiler
+ # Skip if CMAKE_SIZEOF_VOID_P is not defined
+-if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
++if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
+     if(PythonLibsNew_FIND_REQUIRED)
+         math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
+         math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
+-- 
+2.25.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
new file mode 100644
index 000000000..07ab9a03b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -0,0 +1,39 @@
+From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Wed, 8 Jul 2020 09:41:43 -0400
+Subject: [PATCH] Do not strip binaries.
+
+ * OpenEmbedded strips them after creating debug packages.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ tools/pybind11Tools.cmake | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
+index a3603ab..b4c8f63 100644
+--- a/tools/pybind11Tools.cmake
++++ b/tools/pybind11Tools.cmake
+@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
+ 
+   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
+ 
+-  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    # Strip unnecessary sections of the binary on Linux/Mac OS
+-    if(CMAKE_STRIP)
+-      if(APPLE)
+-        add_custom_command(TARGET ${target_name} POST_BUILD
+-                           COMMAND ${CMAKE_STRIP} -x $<TARGET_FILE:${target_name}>)
+-      else()
+-        add_custom_command(TARGET ${target_name} POST_BUILD
+-                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
+-      endif()
+-    endif()
+-  endif()
+-
+   if(MSVC)
+     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
+     # needed for bigger binding projects due to the limit to 64k addressable sections
+-- 
+2.25.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index dc3b8f6ad..46bba8d8d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 +3,18 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
-SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
+DEPENDS = "boost"
 
-inherit pypi setuptools3
+SRC_URI = "git://github.com/pybind/pybind11.git \
+           file://0001-Do-not-strip-binaries.patch \
+           file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
+          "
+SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
+
+inherit cmake python3native
-- 
2.13.6

