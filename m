Return-Path: <uvv.mail@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 597486AC00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:18:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r11-v6so5718920wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m1UELdfY8c/36tExovSz9lGMlWr3E0iiUCD4wBprHRo=;
	b=tCA8XpTc4RHcVmyWetqo+HMhjsVQVssFo5Unqz61W3SFmyfwMjWHRvC7i2NR8Tfs0Z
	nQ0TN7RJ6jkgz93FGRGn3vUt93d9POtlRJoBbCgIbmf85hCJHIsz8tbDAGu0+oG4Vh0v
	XPWLxcamas8nryPot/dF6V7pML49ZriJICIeOXJl8O+PP1jGetmNijK9MTEk2GxB737W
	rHvXN8kyhud1LwVeYTvrWp15hijAtqN1Bi7uZAKcRh/p/PKqOaEre+O6LCNEcfFBjCBa
	WKRVR4JlZXcklxIZWsYCszNN9xSCWF9Asi6o/5rMwiKcvuWhH5ybE7LZjWIQiRvBX7UE
	YUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m1UELdfY8c/36tExovSz9lGMlWr3E0iiUCD4wBprHRo=;
	b=T2N/rmQDta8cf1EZZndyuknfA2LyQ8KpV4a1wyTxkO+gqJUq9Y6w/0ZumWUGJh/k+K
	Yfi8rDi2/19LMewDDDHAu6gOAgHCexqGQ/5fzEeFasr9H3NSFQHhkzbIdksK1+nQrZru
	FktYNW/imV9k8om5ce3qfqEIvPwyqwKCZDBfs8Bq8ubNXoVHWwsj7ISm8ThqnHSQj3tt
	OjZxtEMWYnbqxv0XMp3NxwNeVBEWucYMJEHh1J+pN04Hq67CmGv1kT1CZfAj0ehWGdPv
	9L50WTid10nxvLQsuIf1c6SQ0jH4ihtmiPALenQuv1GcO3RhiSiv5GxgzUfg/GhODQSU
	a0Mg==
X-Gm-Message-State: AGRZ1gIzY0gvB4UTgUpUZw3ZoBRD9RqV0ik/63Et24ykYUOOBfDRHHpm
	S6XNdtnKKvWQ5ZrdFdoaRi6kVJkP
X-Google-Smtp-Source: AJdET5dZKGW6j4gbMMh9xjZ4vADqKNW/+n7qWl3cB2cKsz+UGnhDI8XBMQ4RbCE6qJXCJtBzMbs/bg==
X-Received: by 2002:a1c:4108:: with SMTP id o8mr7001652wma.91.1542640734577;
	Mon, 19 Nov 2018 07:18:54 -0800 (PST)
Received: from localhost.localdomain (ip-109-42-2-236.web.vodafone.de.
	[109.42.2.236]) by smtp.gmail.com with ESMTPSA id
	t5sm20028310wmd.15.2018.11.19.07.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 07:18:53 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:18:19 +0100
Message-Id: <20181119151819.124335-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Mon, 19 Nov 2018 15:18:54 -0000
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
index 3a6f824ea..4ad302cbe 100644
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
++    message(FATAL_ERROR "Can't find libunwind library")
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


