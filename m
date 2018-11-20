Return-Path: <uvv.mail@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A36266C432
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:07:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j10so900940wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 00:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xcPM4jpUozIjdHMS5O8iArOmaheNSQ7kSMy/ckNbPYM=;
	b=goKkGUMVLzei0WPBilTtQJLXreblihQLK1eVVVhg9Fc2XR09laHtaCzjYwFpOYr8Bx
	9onCyur+4UQeZA3fiIZBkXP0g/NDNbkD/qb5zkmlerWGIiegcnGdhi0PEa4s2roSNmfb
	n8wXtILEIm+lbmmfKFuYdjIvBFmnfX5h3UMtOIsC/HbJvz6jgX6PbnH76sX1/9iHPQfb
	aOuTfuXHuxa8ChwrHonIKdqsEpemkWjFFe3iONLcRf+LN4kVbjGismIjkW7cU7Erulha
	hwfhrWpUX1to3bqwMGBDc5TaXkvUdM64QsfFQy96vX1FfgCdwlzUiOf8R8qBzqy6xYyM
	H6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xcPM4jpUozIjdHMS5O8iArOmaheNSQ7kSMy/ckNbPYM=;
	b=GmgWENMo1PKqOWD6dvdRbkLVWU1BnaoJPjiOVSkjldzCa8HvTpj6iuG4n+Fvq3Z++c
	eSQ7c8afbVCLJib52lNrNURoJmDFVpqoRktaBZDoHesuba+0FvzuOX7HWkxgkZGa13LC
	/43ElRreovB9Gb5iJxEiWNM0U5Itak56WXk1SkdvDRHnCiuP3OAB5uXWg7EzBUK96ond
	d+iA+XdVJtIAUDM1OOEVCeww78N1g3yXPsvFpEIl6FJEJtTxXyXXW+DCFkGGEr8DPD4k
	1fjRsZPIGqBiAQJ7I9TuBypdiZhPFW/OP4ladMRZMbkEF6iGr1+GCavvoSjrv+UB3HPK
	9bsw==
X-Gm-Message-State: AA+aEWbFUWNqRWlHwzq/FvqPezD64tLleqo8RxIoAmCHM0GoIUyQ8o6+
	tak3f0jkHll+WUrQTfvFTzjwkEhlj8k=
X-Google-Smtp-Source: AFSGD/Wli5Eu4hPHzSAmimymt9yvcaQ7MlKFOY9XA5p3RDmzq7tJaGCEMiG3MvcV44jlAIecTxCcrw==
X-Received: by 2002:adf:aa94:: with SMTP id
	h20-v6mr944148wrc.216.1542701257229; 
	Tue, 20 Nov 2018 00:07:37 -0800 (PST)
Received: from localhost.localdomain (ip-109-42-2-155.web.vodafone.de.
	[109.42.2.155])
	by smtp.gmail.com with ESMTPSA id d5sm6210941wrx.22.2018.11.20.00.07.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Nov 2018 00:07:36 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 09:07:11 +0100
Message-Id: <20181120080711.129527-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v2] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Tue, 20 Nov 2018 08:07:37 -0000
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

According to build log http://errors.yoctoproject.org/Errors/Details/201286/
FindLibunwind wokred only for x86, arm, and x86_64. This patch extends the
cmake module to work with mips, ia64, ppc(64) and other architectures supported
by libunwind

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...0002-Find-Libunwind-during-configure.patch | 34 ++++++++++++++-----
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
index 3a6f824ea..9ee01bfc3 100644
--- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
@@ -1,11 +1,11 @@
 diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 --- a/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
-+++ b/cmake/FindLibunwind.cmake	2018-11-02 14:04:35.460437058 +0100
-@@ -0,0 +1,37 @@
++++ b/cmake/FindLibunwind.cmake	2018-11-19 16:07:17.652031645 +0100
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
++if (NOT Libunwind_FOUND)
++    message("Can't find libunwind library")
++endif()
++
 +add_library(unwind INTERFACE IMPORTED)
 +set_target_properties(unwind PROPERTIES
 +    INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
 +)
 diff -uNr a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2018-11-02 14:02:21.784835854 +0100
-+++ b/CMakeLists.txt	2018-11-02 14:03:16.796935594 +0100
+--- a/CMakeLists.txt	2018-11-19 15:55:05.293665965 +0100
++++ b/CMakeLists.txt	2018-11-19 15:57:37.828381535 +0100
 @@ -58,7 +58,6 @@
  check_include_file (execinfo.h HAVE_EXECINFO_H)
  check_include_file (glob.h HAVE_GLOB_H)
@@ -91,10 +108,9 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
    DESTINATION lib/cmake/glog)
  
  install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
-Binary files a/.git/index and b/.git/index differ
 diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-11-02 14:02:21.784835854 +0100
-+++ b/glog-config.cmake.in	2018-11-02 14:03:16.796935594 +0100
+--- a/glog-config.cmake.in	2018-11-19 15:55:05.293665965 +0100
++++ b/glog-config.cmake.in	2018-11-19 15:57:37.828381535 +0100
 @@ -4,4 +4,15 @@
  
  @gflags_DEPENDENCY@
-- 
2.19.1


