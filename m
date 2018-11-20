Return-Path: <uvv.mail@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85A626B50B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:56:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u13-v6so2559596wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pJSgsC3eDy0jB8hlCy6NX2FvsjkMUN2jPsacUhsx4Qs=;
	b=Mp2kH9mKTuuaJbcce8dcyzAzsqehDs4fyE59xb9d2rx6jdfbg6n1jatOhCc0oNoWqz
	tdRWsugOOg8yOwthpdNRw0ZPLtYuGXcsRkNgaivxVncDkzH//FRp7jeqlCV/LYmuSEgt
	+jTgaWbCli2CnghgOp29Tge4SdycoIbiaX0+DAaOK89egPkQ+/QHaCQ6+umeayUGfDc4
	S43+tiEpOkVQ7tZAVBYOQOahByGcDpSFzctBTYiiF3eL8yYHBLdW4mZlOUQjPd4Fb5f1
	BYDtBIHO1VPGnR9s9pfioVyHvDdmJ8U+6q7PBeheLcPaDQkLcx7G1tnr1L0euB0lL9kc
	3dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pJSgsC3eDy0jB8hlCy6NX2FvsjkMUN2jPsacUhsx4Qs=;
	b=cdMaXOc51+RONzmc3KroZcNZgUPFScdff4v9wY+smNgBOd8ck1eBr/7LmvQG/icJKb
	Ff6j+XtTDzQLh9/HNtajvd08FQ9roF4lnqEwq3N4160VzjPWF2BQWg5hyVnbC4sv+W5+
	v/Hpv7giq3imRrOXImqcI9xOQUwIx3MQkGKrqXW0pNh3/MOKhU7u+cBAk8r2D26+o+3P
	DI5M3O0VVL6OTvsHnNrDyFFJcSnE1kAcJyxpgVEqXhh3Dcmfl/wDx1qEwDqVEv6KcmCN
	T34vN2v+N9qMxXU6gZdWA8nDAOeNoFBfP0bnOoC2MV3X7zwfgqvNnlSK1riMJPric541
	Sohw==
X-Gm-Message-State: AA+aEWYOXTlrI41DQZ0BsiHTSbE6/xogfqLY1intxDiVf3QZDsdjAjPq
	Wn41gvH3TRke1teW8gG3nDXoXBnf+1I=
X-Google-Smtp-Source: AFSGD/UxRGXC2wCyp1MHysaz9//ZRDXoO6wf+o5gx67KVH08s9XPcNS2XnKccMG8S3655ifpKUXqKg==
X-Received: by 2002:a1c:8803:: with SMTP id k3mr2451821wmd.84.1542725809835;
	Tue, 20 Nov 2018 06:56:49 -0800 (PST)
Received: from uvv-vm.intra.brkr.corp (ip-109-42-2-155.web.vodafone.de.
	[109.42.2.155]) by smtp.gmail.com with ESMTPSA id
	n15sm11965189wrt.21.2018.11.20.06.56.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Nov 2018 06:56:49 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 15:56:31 +0100
Message-Id: <20181120145631.70102-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v3] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Tue, 20 Nov 2018 14:56:50 -0000
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

According to build log http://errors.yoctoproject.org/Errors/Details/201286/
FindLibunwind wokred only for x86, arm, and x86_64. This patch extends the
cmake module to work with mips, ia64, ppc(64) and other architectures supported
by libunwind

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...0002-Find-Libunwind-during-configure.patch | 53 +++++++++++--------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
index 3a6f824ea..15cf67fd2 100644
--- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
@@ -1,11 +1,11 @@
 diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 --- a/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
-+++ b/cmake/FindLibunwind.cmake	2018-11-02 14:04:35.460437058 +0100
-@@ -0,0 +1,37 @@
++++ b/cmake/FindLibunwind.cmake	2018-11-20 15:53:48.799078114 +0100
+@@ -0,0 +1,54 @@
 +# - Try to find libunwind
 +# Once done this will define
 +#
-+#  LIBUNWIND_FOUND - system has libunwind
++#  Libunwind_FOUND - system has libunwind
 +#  unwind - cmake target for libunwind
 +
 +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
@@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 +
 +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
 +    set(LIBUNWIND_ARCH "arm")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
++    set(LIBUNWIND_ARCH "aarch64")
 +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
-+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
 +    set(LIBUNWIND_ARCH "x86_64")
 +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
 +    set(LIBUNWIND_ARCH "x86")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
++    set(LIBUNWIND_ARCH "ppc64")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
++    set(LIBUNWIND_ARCH "ppc32")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
++    set(LIBUNWIND_ARCH "mips")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
++    set(LIBUNWIND_ARCH "hppa")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
++    set(LIBUNWIND_ARCH "ia64")
 +endif()
 +
 +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}" DOC "unwind library platform")
@@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 +
 +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
 +
-+add_library(unwind INTERFACE IMPORTED)
-+set_target_properties(unwind PROPERTIES
-+    INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
-+)
++if (Libunwind_FOUND)
++    add_library(unwind INTERFACE IMPORTED)
++    set_target_properties(unwind PROPERTIES
++        INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
++    )
++else()
++    message("Can't find libunwind library")
++endif()
 diff -uNr a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2018-11-02 14:02:21.784835854 +0100
-+++ b/CMakeLists.txt	2018-11-02 14:03:16.796935594 +0100
+--- a/CMakeLists.txt	2018-11-20 15:49:07.576278417 +0100
++++ b/CMakeLists.txt	2018-11-20 15:49:32.106819928 +0100
 @@ -58,7 +58,6 @@
  check_include_file (execinfo.h HAVE_EXECINFO_H)
  check_include_file (glob.h HAVE_GLOB_H)
@@ -91,23 +108,13 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
    DESTINATION lib/cmake/glog)
  
  install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
-Binary files a/.git/index and b/.git/index differ
 diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-11-02 14:02:21.784835854 +0100
-+++ b/glog-config.cmake.in	2018-11-02 14:03:16.796935594 +0100
-@@ -4,4 +4,15 @@
+--- a/glog-config.cmake.in	2018-11-20 15:49:07.576278417 +0100
++++ b/glog-config.cmake.in	2018-11-20 15:52:32.330418489 +0100
+@@ -4,4 +4,6 @@
  
  @gflags_DEPENDENCY@
  
-+# Record the state of the CMake module path when this script was
-+# called so that we can ensure that we leave it in the same state on
-+# exit as it was on entry, but modify it locally.
-+set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
-+
-+set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
 +find_dependency (Libunwind)
-+
-+# Restore original module path
-+set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
 +
  include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
-- 
2.19.1


