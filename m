Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED9AC00A5A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.63230.1699041739596554532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WecqzeKy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nlm2h7Dk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96c780ef-cfc07ba5-c281-4f14-8be0-c0e25f80d070-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bpVchkl2YSWxE4WQJzr7F+Qf++8On1S3fMsjVhSlqog=;
	b=WecqzeKyIJxfOIGOSWvD7YYum7E2Om40a/S7GWu6rXSP2warjiBluO+CHEjKQcqU
	di1v4sIFwuo1dLQZgES0XtoFyWOZELpG50qH4+eKpWL1Rh2YNCpHhSoTISUQHXcLvNw
	q83VLEwKKzsayMjj2yVJmOgGU5YmY7ER+Xd3nxOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bpVchkl2YSWxE4WQJzr7F+Qf++8On1S3fMsjVhSlqog=;
	b=Nlm2h7DkyOb45kS1CT/nKNORIkyGNYmKaqHSjByQwM+bnfCEflPBC2qViDlx/nII
	3YRabgTc84g38O/jlooQ0/81AyMooRYgUultGsiFwxli22attqR12uFr8iqR7xG9ieM
	wyYPKA4xRw/OoHmSO0E8ibcZ0ZgsU7AdsrSRR7S8=
Content-Type: multipart/mixed; boundary="===============7635195225286736034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] p8platform: upgrading to 8 FAILED
Message-ID: <0101018b96c780ef-cfc07ba5-c281-4f14-8be0-c0e25f80d070-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106079

--===============7635195225286736034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p8platform* to *8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p8platform-upgrade-2.1.0.1-8.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 80395fc33eaffdb1573314eb1d9cd1ff6a510667 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:32:52 +0000
Subject: [PATCH] p8platform: upgrade 2.1.0.1 -> 8

---
 ...DME.md-with-basic-build-instructions.patch |  54 ++++++
 ...ule-via-https-instead-of-git-ssh-to-.patch |  19 +++
 ...-p8-platform-config-fix-lookup-paths.patch |  35 ++++
 .../0004-Fix-Win64-compile-warnings.patch     |  45 +++++
 ...reset-behaviour-in-case-of-broadcast.patch |  23 +++
 ...ude-timeutils-defines-when-building-.patch |  38 +++++
 ...th-vs2019.-include-pdb-files.-suppor.patch | 159 ++++++++++++++++++
 ...e-updated-support-scripts-for-vs2019.patch |  16 ++
 .../0009-changed-default-to-vs2019.patch      |  16 ++
 ...th-vs2019-and-also-include-pdb-files.patch |  63 +++++++
 ...-StringUtils-fix-build-with-std-c-17.patch |  31 ++++
 .../p8platform/p8platform_git.bb              |  20 ++-
 12 files changed, 515 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0001-Update-README.md-with-basic-build-instructions.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0002-reference-submodule-via-https-instead-of-git-ssh-to-.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0003-p8-platform-config-fix-lookup-paths.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0004-Fix-Win64-compile-warnings.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0005-Fix-CEvent-auto-reset-behaviour-in-case-of-broadcast.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0006-fixed-don-t-include-timeutils-defines-when-building-.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0007-changed-build-with-vs2019.-include-pdb-files.-suppor.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0008-changed-use-updated-support-scripts-for-vs2019.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0009-changed-default-to-vs2019.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0010-build-with-vs2019-and-also-include-pdb-files.patch
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform/0011-StringUtils-fix-build-with-std-c-17.patch

diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0001-Update-README.md-with-basic-build-instructions.patch b/meta-oe/recipes-extended/p8platform/p8platform/0001-Update-README.md-with-basic-build-instructions.patch
new file mode 100644
index 000000000..a03416eca
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0001-Update-README.md-with-basic-build-instructions.patch
@@ -0,0 +1,54 @@
+From fe904839a820b94b4420fe324cc11d75c0b90f38 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <opdenkamp@users.noreply.github.com>
+Date: Thu, 13 Jul 2017 12:49:27 +0200
+Subject: [PATCH] Update README.md with basic build instructions
+
+---
+ README.md | 39 +++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/README.md b/README.md
+index 02de9cd..25af515 100644
+--- a/README.md
++++ b/README.md
+@@ -1,3 +1,38 @@
+-# platform
+-Platform support library used by libCEC and binary add-ons for Kodi
++![Pulse-Eight logo](https://pulseeight.files.wordpress.com/2016/02/pulse-eight-logo-white-on-green.png?w=200)
+ 
++# About
++This library provides platform specific support for other libraries, and is used by libCEC and binary add-ons for Kodi
++
++# Supported platforms
++
++## Linux, BSD & Apple OS X
++To compile this library on Linux, you'll need the following dependencies:
++* [cmake 2.6 or better] (http://www.cmake.org/)
++* a supported C++ 11 compiler
++
++Follow these instructions to compile and install the library:
++```
++apt-get update
++apt-get install cmake build-essential
++git clone https://github.com/Pulse-Eight/platform.git
++mkdir platform/build
++cd platform/build
++cmake ..
++make -j4
++sudo make install
++sudo ldconfig
++```
++
++## Microsoft Windows
++To compile this library on Windows, you'll need the following dependencies:
++* [cmake 2.6 or better] (http://www.cmake.org/)
++* [Visual Studio 2013 (v120) or 2015 (v140)] (https://www.visualstudio.com/)
++
++Follow these instructions to compile and install the library:
++```
++git clone https://github.com/Pulse-Eight/platform.git
++cd platform
++git submodule update --init --recursive
++cd 
++build.cmd
++```
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0002-reference-submodule-via-https-instead-of-git-ssh-to-.patch b/meta-oe/recipes-extended/p8platform/p8platform/0002-reference-submodule-via-https-instead-of-git-ssh-to-.patch
new file mode 100644
index 000000000..a036591ff
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0002-reference-submodule-via-https-instead-of-git-ssh-to-.patch
@@ -0,0 +1,19 @@
+From a2c815aaa16848a817dca88d18e2c2a4af3aaa0a Mon Sep 17 00:00:00 2001
+From: Thibault Jochem <tryumk@gmail.com>
+Date: Wed, 15 Feb 2017 07:21:35 +0100
+Subject: [PATCH] reference submodule via https instead of git/ssh to allow
+ public clone (without ssh key registered to github).
+
+---
+ .gitmodules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.gitmodules b/.gitmodules
+index 1bb4d48..5dd42f2 100644
+--- a/.gitmodules
++++ b/.gitmodules
+@@ -1,3 +1,3 @@
+ [submodule "support"]
+ 	path = support
+-	url = git@github.com:Pulse-Eight/libcec-support.git
++	url = https://github.com/Pulse-Eight/libcec-support.git
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0003-p8-platform-config-fix-lookup-paths.patch b/meta-oe/recipes-extended/p8platform/p8platform/0003-p8-platform-config-fix-lookup-paths.patch
new file mode 100644
index 000000000..fb9e4be8b
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0003-p8-platform-config-fix-lookup-paths.patch
@@ -0,0 +1,35 @@
+From 8b3fbb1670f1602d2a9eca38ac25d961276baa2a Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 6 Feb 2017 14:04:47 +0100
+Subject: [PATCH] p8-platform-config: fix lookup paths
+
+Use the proper methods to find the headers and the library.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ p8-platform-config.cmake.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/p8-platform-config.cmake.in b/p8-platform-config.cmake.in
+index 47f30f1..f59418d 100644
+--- a/p8-platform-config.cmake.in
++++ b/p8-platform-config.cmake.in
+@@ -10,7 +10,7 @@
+ #
+ # propagate these properties from one build system to the other
+ set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR@.@p8-platform_VERSION_MINOR@")
+-set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++find_path (p8-platform_INCLUDE_DIRS p8-platform/os.h)
+ set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
+ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+@@ -19,7 +19,7 @@ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+ if(WIN32)
+   set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
+ else(WIN32)
+-  set (p8-platform_LIBRARY "-L@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
++  find_library (p8-platform_LIBRARY p8-platform)
+ endif(WIN32)
+ set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
+ mark_as_advanced (p8-platform_LIBRARY)
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0004-Fix-Win64-compile-warnings.patch b/meta-oe/recipes-extended/p8platform/p8platform/0004-Fix-Win64-compile-warnings.patch
new file mode 100644
index 000000000..152fcb920
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0004-Fix-Win64-compile-warnings.patch
@@ -0,0 +1,45 @@
+From 4258e47f331d2302e944947d8dcd61baccd6620d Mon Sep 17 00:00:00 2001
+From: Zoltan Csizmadia <zcsizmadia@gmail.com>
+Date: Mon, 7 Aug 2017 22:51:03 -0500
+Subject: [PATCH] Fix Win64 compile warnings
+
+---
+ src/util/StringUtils.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/util/StringUtils.cpp b/src/util/StringUtils.cpp
+index 510e2d5..3df26ce 100644
+--- a/src/util/StringUtils.cpp
++++ b/src/util/StringUtils.cpp
+@@ -668,7 +668,7 @@ vector<string> StringUtils::Split(const std::string& input, const std::string& d
+   size_t sizeS2 = delimiter.size();
+   size_t isize = input.size();
+ 
+-  vector<unsigned int> positions;
++  vector<size_t> positions;
+ 
+   newPos = input.find(delimiter, 0);
+ 
+@@ -687,11 +687,11 @@ vector<string> StringUtils::Split(const std::string& input, const std::string& d
+ 
+   // numFound is the number of delimiters which is one less
+   // than the number of substrings
+-  unsigned int numFound = positions.size();
++  size_t numFound = positions.size();
+   if (iMaxStrings > 0 && numFound >= iMaxStrings)
+     numFound = iMaxStrings - 1;
+ 
+-  for ( unsigned int i = 0; i <= numFound; i++ )
++  for ( size_t i = 0; i <= numFound; i++ )
+   {
+     string s;
+     if ( i == 0 )
+@@ -1058,7 +1058,7 @@ std::string StringUtils::CreateUUID()
+   if (!m_uuidInitialized)
+   {
+     /* use current time as the seed for rand()*/
+-    srand(time(NULL));
++    srand((unsigned int)time(NULL));
+     m_uuidInitialized = true;
+   }
+ 
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0005-Fix-CEvent-auto-reset-behaviour-in-case-of-broadcast.patch b/meta-oe/recipes-extended/p8platform/p8platform/0005-Fix-CEvent-auto-reset-behaviour-in-case-of-broadcast.patch
new file mode 100644
index 000000000..d29c52864
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0005-Fix-CEvent-auto-reset-behaviour-in-case-of-broadcast.patch
@@ -0,0 +1,23 @@
+From 070e97c7ba33963bdc6fe178b15275abf47fc1ab Mon Sep 17 00:00:00 2001
+From: Sergey Shramchenko <sergey.shramchenko@gmail.com>
+Date: Tue, 7 Aug 2018 20:08:33 +0300
+Subject: [PATCH] Fix CEvent auto-reset behaviour in case of broadcast signal.
+
+---
+ src/threads/mutex.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/threads/mutex.h b/src/threads/mutex.h
+index 8dbbffd..1ae0ef0 100644
+--- a/src/threads/mutex.h
++++ b/src/threads/mutex.h
+@@ -351,7 +351,8 @@ namespace P8PLATFORM
+     {
+       CLockObject lock(m_mutex);
+       bool bReturn(m_bSignaled);
+-      if (bReturn && (--m_iWaitingThreads == 0 || !m_bBroadcast) && m_bAutoReset)
++      --m_iWaitingThreads;
++      if (bReturn && (m_iWaitingThreads == 0 || !m_bBroadcast) && m_bAutoReset)
+         m_bSignaled = false;
+       return bReturn;
+     }
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0006-fixed-don-t-include-timeutils-defines-when-building-.patch b/meta-oe/recipes-extended/p8platform/p8platform/0006-fixed-don-t-include-timeutils-defines-when-building-.patch
new file mode 100644
index 000000000..6312cbb83
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0006-fixed-don-t-include-timeutils-defines-when-building-.patch
@@ -0,0 +1,38 @@
+From c4d29a92db53d4ff84b4e01da497f01a68bca6d6 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Fri, 3 Apr 2020 11:14:29 +0200
+Subject: [PATCH] fixed: don't include timeutils defines when building swig on
+ windows
+
+---
+ src/util/timeutils.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/util/timeutils.h b/src/util/timeutils.h
+index f22184f..1196504 100644
+--- a/src/util/timeutils.h
++++ b/src/util/timeutils.h
+@@ -44,7 +44,7 @@
+ 
+ namespace P8PLATFORM
+ {
+-  #if defined(__WINDOWS__)
++  #if defined(__WINDOWS__) && !defined(SWIGPYTHON)
+   struct timezone
+   {
+     int	tz_minuteswest;
+@@ -68,12 +68,12 @@ namespace P8PLATFORM
+     pcur_time->tv_usec = current.millitm * 1000L;
+     if (tz)
+     {
+-      tz->tz_minuteswest = current.timezone;	/* minutes west of Greenwich  */
++      tz->tz_minuteswest = current.timezone;  /* minutes west of Greenwich  */
+       tz->tz_dsttime = current.dstflag;	      /* type of dst correction  */
+     }
+     return 0;
+   }
+-  #endif
++  #endif // defined(__WINDOWS__) && !defined(SWIGPYTHON)
+ 
+   inline int64_t GetTimeMs()
+   {
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0007-changed-build-with-vs2019.-include-pdb-files.-suppor.patch b/meta-oe/recipes-extended/p8platform/p8platform/0007-changed-build-with-vs2019.-include-pdb-files.-suppor.patch
new file mode 100644
index 000000000..4e12c24a2
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0007-changed-build-with-vs2019.-include-pdb-files.-suppor.patch
@@ -0,0 +1,159 @@
+From 309d21526d717aa382311e06d51342892d86f3a3 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Thu, 23 Apr 2020 15:50:13 +0200
+Subject: [PATCH] changed: build with vs2019. include pdb files. support path
+ with spaces
+
+---
+ CMakeLists.txt        | 50 ++++++++++++++++++++++++++++++++++---------
+ windows/build-lib.cmd | 16 ++++++++++----
+ windows/build.cmd     | 12 ++++++-----
+ 3 files changed, 59 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7144b0b..4a7ad80 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -23,9 +23,9 @@ if(WIN32)
+ endif()
+ 
+ set(p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform")
+-IF(WIN32)
++if(WIN32)
+   LIST(APPEND p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform/windows")
+-ENDIF(WIN32)
++endif(WIN32)
+ set(p8-platform_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
+ 
+ if(NOT ${CORE_SYSTEM_NAME} STREQUAL "")
+@@ -38,23 +38,47 @@ set(SOURCES src/util/StringUtils.cpp)
+ 
+ add_library(p8-platform ${SOURCES} ${PLAT_SOURCES})
+ target_link_libraries(p8-platform ${p8-platform_LIBRARIES})
+-set_target_properties(p8-platform PROPERTIES VERSION ${p8-platform_VERSION_MAJOR}.${p8-platform_VERSION_MINOR}.${p8-platform_VERSION_PATCH}
+-                                              SOVERSION ${p8-platform_VERSION_MAJOR})
++set_target_properties(p8-platform
++    PROPERTIES
++    VERSION ${p8-platform_VERSION_MAJOR}.${p8-platform_VERSION_MINOR}.${p8-platform_VERSION_PATCH}
++    SOVERSION ${p8-platform_VERSION_MAJOR})
++
++if(WIN32)
++  if (MSVC)
++    # generate pdb in release mode too
++    set_target_properties(p8-platform
++        PROPERTIES
++        COMPILE_PDB_NAME_DEBUG p8-platform${CMAKE_DEBUG_POSTFIX}
++        COMPILE_PDB_NAME_RELEASE p8-platform
++        COMPILE_PDB_NAME_MINSIZEREL p8-platform
++        COMPILE_PDB_NAME_RELWITHDEBINFO p8-platform)
++
++    if (${WIN64})
++      # default setting that got removed in recent vs versions, generates a warning if set
++      string(REPLACE "/arch:SSE2" "" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
++    endif(${WIN64})
++
++  endif(MSVC)
++
++  if (NOT ${WIN64})
++    add_definitions(-D_USE_32BIT_TIME_T)
++  endif(NOT ${WIN64})
++endif(WIN32)
+ 
+ install(TARGETS p8-platform DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(FILES src/os.h DESTINATION include/p8-platform)
+-IF(WIN32)
+-  INSTALL(FILES src/windows/dlfcn-win32.h
++if(WIN32)
++  install(FILES src/windows/dlfcn-win32.h
+                 src/windows/os-socket.h
+                 src/windows/os-threads.h
+                 src/windows/os-types.h
+           DESTINATION include/p8-platform/windows)
+-ELSE(WIN32)
++else(WIN32)
+   install(FILES src/posix/os-socket.h
+                 src/posix/os-threads.h
+                 src/posix/os-types.h
+           DESTINATION include/p8-platform/posix)
+-ENDIF(WIN32)
++endif(WIN32)
+ install(FILES src/sockets/cdevsocket.h
+               src/sockets/socket.h
+               src/sockets/tcp.h
+@@ -71,11 +95,17 @@ install(FILES src/util/atomic.h
+               src/util/util.h
+         DESTINATION include/p8-platform/util)
+ 
+-IF(NOT WIN32)
++if(MSVC)
++  # install generated pdb
++  install(FILES $<TARGET_FILE_DIR:p8-platform>/p8-platform.pdb
++          DESTINATION "${CMAKE_INSTALL_LIBDIR}")
++endif(MSVC)
++
++if(NOT WIN32)
+   configure_file(p8-platform.pc.in p8-platform.pc @ONLY)
+   install(FILES ${CMAKE_BINARY_DIR}/p8-platform.pc
+           DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+-ENDIF(NOT WIN32)
++endif(NOT WIN32)
+ 
+ # config mode
+ configure_file (p8-platform-config.cmake.in
+diff --git a/windows/build-lib.cmd b/windows/build-lib.cmd
+index 5d5bf1a..875bfce 100644
+--- a/windows/build-lib.cmd
++++ b/windows/build-lib.cmd
+@@ -11,14 +11,22 @@ SET VSVERSION=%3
+ SET INSTALLPATH=%4
+ IF [%4] == [] GOTO missingparams
+ 
++SET INSTALLPATH=%INSTALLPATH:"=%
+ SET BUILDTARGET=%INSTALLPATH%\cmake\%BUILDARCH%
+ SET TARGET=%INSTALLPATH%\%BUILDARCH%
+ 
+-call %MYDIR%..\support\windows\cmake\generate.cmd %BUILDARCH% nmake %MYDIR%..\ %BUILDTARGET% %TARGET% %BUILDTYPE% %VSVERSION% static
+-call %MYDIR%..\support\windows\cmake\build.cmd %BUILDARCH% %BUILDTARGET% %VSVERSION%
+-goto exit
++CALL "%MYDIR%..\support\windows\cmake\generate.cmd" %BUILDARCH% nmake "%MYDIR%..\" "%BUILDTARGET%" "%TARGET%" %BUILDTYPE% %VSVERSION% static
++CALL "%MYDIR%..\support\windows\cmake\build.cmd" %BUILDARCH% "%BUILDTARGET%" %VSVERSION%
++GOTO exit
+ 
+ :missingparams
+-echo "build-lib.cmd requires 4 parameters"
++ECHO.%~dp0 requires 4 parameters
++ECHO.  %~dp0 [architecture] [type] [version] [install path]
++ECHO.
++ECHO. architecture:    amd64 x86
++ECHO. type:            Release Debug
++ECHO. version:         Visual Studio version (2019)
++ECHO. install path:    installation path without quotes
++exit /b 99
+ 
+ :exit
+\ No newline at end of file
+diff --git a/windows/build.cmd b/windows/build.cmd
+index 1f796a6..9bf76fb 100644
+--- a/windows/build.cmd
++++ b/windows/build.cmd
+@@ -6,13 +6,15 @@ SETLOCAL
+ 
+ SET MYDIR=%~dp0
+ SET BUILDTYPE=Release
+-SET VSVERSION=12
++SET VSVERSION=2019
+ SET INSTALLPATH=%MYDIR%..\build
+ 
+-rmdir %MYDIR%..\build /s /q
++IF EXIST "%MYDIR%..\build" (
++  RMDIR /s /q "%MYDIR%..\build"
++)
+ 
+-for %%T in (amd64 x86) do (
+-  call %MYDIR%\build-lib.cmd %%T %BUILDTYPE% %VSVERSION% %INSTALLPATH%
++FOR %%T IN (amd64 x86) DO (
++  CALL "%MYDIR%\build-lib.cmd" %%T %BUILDTYPE% %VSVERSION% "%INSTALLPATH%"
+ )
+ 
+-rmdir %MYDIR%..\build\cmake /s /q
++RMDIR /s /q "%MYDIR%..\build\cmake"
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0008-changed-use-updated-support-scripts-for-vs2019.patch b/meta-oe/recipes-extended/p8platform/p8platform/0008-changed-use-updated-support-scripts-for-vs2019.patch
new file mode 100644
index 000000000..528944f06
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0008-changed-use-updated-support-scripts-for-vs2019.patch
@@ -0,0 +1,16 @@
+From 4f38abdf7f429a0baf3a8bd33c7982e15983f308 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Sat, 25 Apr 2020 09:58:29 +0200
+Subject: [PATCH] changed: use updated support scripts for vs2019
+
+---
+ support | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support b/support
+index 1149a12..d0a6b56 160000
+--- a/support
++++ b/support
+@@ -1 +1 @@
+-Subproject commit 1149a12c79595a03a1915585159d5e6952484325
++Subproject commit d0a6b566f9723fbab971cbcc17696f6da06bf879
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0009-changed-default-to-vs2019.patch b/meta-oe/recipes-extended/p8platform/p8platform/0009-changed-default-to-vs2019.patch
new file mode 100644
index 000000000..5c16aa694
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0009-changed-default-to-vs2019.patch
@@ -0,0 +1,16 @@
+From db5633fcfac7e049b489d10f35905c0261c2ebdc Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Sat, 25 Apr 2020 10:57:29 +0200
+Subject: [PATCH] changed: default to vs2019
+
+---
+ support | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support b/support
+index d0a6b56..7c41211 160000
+--- a/support
++++ b/support
+@@ -1 +1 @@
+-Subproject commit d0a6b566f9723fbab971cbcc17696f6da06bf879
++Subproject commit 7c4121112af37d641ea02383d53b50a38087115a
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0010-build-with-vs2019-and-also-include-pdb-files.patch b/meta-oe/recipes-extended/p8platform/p8platform/0010-build-with-vs2019-and-also-include-pdb-files.patch
new file mode 100644
index 000000000..8792003d5
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0010-build-with-vs2019-and-also-include-pdb-files.patch
@@ -0,0 +1,63 @@
+From 2f19606e07a4eeffa6d374118d5754e51ab72287 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Thu, 9 Jul 2020 22:30:25 +0200
+Subject: [PATCH] build with vs2019 and also include pdb files
+
+---
+ CMakeLists.txt        |  2 +-
+ support               |  2 +-
+ windows/build-lib.cmd | 16 +++++++++++++++-
+ 3 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4a7ad80..f5b2ff8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,7 +13,7 @@ set(p8-platform_NAME p8-platform)
+ set(p8-platform_DESCRIPTION "Pulse-Eight platform support library")
+ set(p8-platform_VERSION_MAJOR 2)
+ set(p8-platform_VERSION_MINOR 1)
+-set(p8-platform_VERSION_PATCH 0)
++set(p8-platform_VERSION_PATCH 1)
+ 
+ set(CMAKE_POSITION_INDEPENDENT_CODE on)
+ 
+diff --git a/support b/support
+index 7c41211..416da1d 160000
+--- a/support
++++ b/support
+@@ -1 +1 @@
+-Subproject commit 7c4121112af37d641ea02383d53b50a38087115a
++Subproject commit 416da1d0e60ee2397f31d4eb8f85886a9ef3327a
+diff --git a/windows/build-lib.cmd b/windows/build-lib.cmd
+index 875bfce..fe985a7 100644
+--- a/windows/build-lib.cmd
++++ b/windows/build-lib.cmd
+@@ -15,6 +15,20 @@ SET INSTALLPATH=%INSTALLPATH:"=%
+ SET BUILDTARGET=%INSTALLPATH%\cmake\%BUILDARCH%
+ SET TARGET=%INSTALLPATH%\%BUILDARCH%
+ 
++rem Check support submodule
++IF NOT EXIST "%MYDIR%..\support\windows\cmake\build.cmd" (
++  rem Try to init the git submodules
++  cd "%MYDIR%.."
++  git submodule update --init -r >nul 2>&1
++
++  IF NOT EXIST "%MYDIR%..\support\windows\cmake\build.cmd" (
++    ECHO.*** support git submodule has not been checked out ***
++    ECHO.
++    ECHO.See docs\README.windows.md
++    EXIT /b 2
++  )
++)
++
+ CALL "%MYDIR%..\support\windows\cmake\generate.cmd" %BUILDARCH% nmake "%MYDIR%..\" "%BUILDTARGET%" "%TARGET%" %BUILDTYPE% %VSVERSION% static
+ CALL "%MYDIR%..\support\windows\cmake\build.cmd" %BUILDARCH% "%BUILDTARGET%" %VSVERSION%
+ GOTO exit
+@@ -29,4 +43,4 @@ ECHO. version:         Visual Studio version (2019)
+ ECHO. install path:    installation path without quotes
+ exit /b 99
+ 
+-:exit
+\ No newline at end of file
++:exit
diff --git a/meta-oe/recipes-extended/p8platform/p8platform/0011-StringUtils-fix-build-with-std-c-17.patch b/meta-oe/recipes-extended/p8platform/p8platform/0011-StringUtils-fix-build-with-std-c-17.patch
new file mode 100644
index 000000000..c9792f64b
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform/0011-StringUtils-fix-build-with-std-c-17.patch
@@ -0,0 +1,31 @@
+From 300089ced2b8322db1197b76becd78bcea4de088 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Thu, 10 Sep 2020 11:32:55 -0700
+Subject: [PATCH] StringUtils: fix build with -std=c++17
+
+---
+ src/util/StringUtils.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/StringUtils.cpp b/src/util/StringUtils.cpp
+index 3df26ce..e8effd5 100644
+--- a/src/util/StringUtils.cpp
++++ b/src/util/StringUtils.cpp
+@@ -453,7 +453,7 @@ static int isspace_c(char c)
+ 
+ std::string& StringUtils::TrimLeft(std::string &str)
+ {
+-  str.erase(str.begin(), ::find_if(str.begin(), str.end(), ::not1(::ptr_fun(isspace_c))));
++  str.erase(str.begin(), ::find_if(str.begin(), str.end(), [](char s) { return isspace_c(s) == 0; }));
+   return str;
+ }
+ 
+@@ -466,7 +466,7 @@ std::string& StringUtils::TrimLeft(std::string &str, const char* const chars)
+ 
+ std::string& StringUtils::TrimRight(std::string &str)
+ {
+-  str.erase(::find_if(str.rbegin(), str.rend(), ::not1(::ptr_fun(isspace_c))).base(), str.end());
++  str.erase(::find_if(str.rbegin(), str.rend(), [](char s) { return isspace_c(s) == 0; }).base(), str.end());
+   return str;
+ }
+ 
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index bb9574feb..db082d154 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -4,10 +4,22 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
 
-PV = "2.1.0.1+git${SRCPV}"
-
-SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
-SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
+PV = "8"
+
+SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https \
+           file://0001-Update-README.md-with-basic-build-instructions.patch \
+           file://0002-reference-submodule-via-https-instead-of-git-ssh-to-.patch \
+           file://0003-p8-platform-config-fix-lookup-paths.patch \
+           file://0004-Fix-Win64-compile-warnings.patch \
+           file://0005-Fix-CEvent-auto-reset-behaviour-in-case-of-broadcast.patch \
+           file://0006-fixed-don-t-include-timeutils-defines-when-building-.patch \
+           file://0007-changed-build-with-vs2019.-include-pdb-files.-suppor.patch \
+           file://0008-changed-use-updated-support-scripts-for-vs2019.patch \
+           file://0009-changed-default-to-vs2019.patch \
+           file://0010-build-with-vs2019-and-also-include-pdb-files.patch \
+           file://0011-StringUtils-fix-build-with-std-c-17.patch \
+           "
+SRCREV = "2d90f98620e25f47702c9e848380c0d93f29462b"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7635195225286736034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5019 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:a707986b25b363d04f58df4ecac98147946d3c1f"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 142 Local 131 Mirrors 0 Missed 11 Current 157 (92% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_recipe_qa_setscene)
NOTE: recipe p8platform-8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p8platform-8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 877 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_fetch)
NOTE: recipe p8platform-8-r0: task do_fetch: Started
NOTE: recipe p8platform-8-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_unpack)
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe p8platform-8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p8platform-8-r0: task do_unpack: Started
NOTE: recipe p8platform-8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p8platform-8-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_patch)
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_collect_spdx_deps)
NOTE: recipe p8platform-8-r0: task do_patch: Started
NOTE: recipe p8platform-8-r0: task do_collect_spdx_deps: Started
NOTE: recipe p8platform-8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe p8platform-8-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 881 tasks of which 876 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103173228.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103173228.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: p8platform-8-r0 do_patch: Applying patch '0008-changed-use-updated-support-scripts-for-vs2019.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/p8platform/8/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/p8platform/8/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0008-changed-use-updated-support-scripts-for-vs2019.patch
File support is not a regular file -- refusing to patch
1 out of 1 hunk ignored -- rejects in file 
Patch 0008-changed-use-updated-support-scripts-for-vs2019.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/p8platform/8/temp/log.do_patch.3789321
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/p8platform/p8platform_git.bb:do_patch) failed with exit code '1'

--===============7635195225286736034==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p8platform-upgrade-2.1.0.1-8.patch"

RnJvbSA4MDM5NWZjMzNlYWZmZGIxNTczMzE0ZWIxZDljZDFmZjZhNTEwNjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzozMjo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHA4
cGxhdGZvcm06IHVwZ3JhZGUgMi4xLjAuMSAtPiA4CgotLS0KIC4uLkRNRS5tZC13aXRoLWJhc2lj
LWJ1aWxkLWluc3RydWN0aW9ucy5wYXRjaCB8ICA1NCArKysrKysKIC4uLnVsZS12aWEtaHR0cHMt
aW5zdGVhZC1vZi1naXQtc3NoLXRvLS5wYXRjaCB8ICAxOSArKysKIC4uLi1wOC1wbGF0Zm9ybS1j
b25maWctZml4LWxvb2t1cC1wYXRocy5wYXRjaCB8ICAzNSArKysrCiAuLi4vMDAwNC1GaXgtV2lu
NjQtY29tcGlsZS13YXJuaW5ncy5wYXRjaCAgICAgfCAgNDUgKysrKysKIC4uLnJlc2V0LWJlaGF2
aW91ci1pbi1jYXNlLW9mLWJyb2FkY2FzdC5wYXRjaCB8ICAyMyArKysKIC4uLnVkZS10aW1ldXRp
bHMtZGVmaW5lcy13aGVuLWJ1aWxkaW5nLS5wYXRjaCB8ICAzOCArKysrKwogLi4udGgtdnMyMDE5
Li1pbmNsdWRlLXBkYi1maWxlcy4tc3VwcG9yLnBhdGNoIHwgMTU5ICsrKysrKysrKysrKysrKysr
KwogLi4uZS11cGRhdGVkLXN1cHBvcnQtc2NyaXB0cy1mb3ItdnMyMDE5LnBhdGNoIHwgIDE2ICsr
CiAuLi4vMDAwOS1jaGFuZ2VkLWRlZmF1bHQtdG8tdnMyMDE5LnBhdGNoICAgICAgfCAgMTYgKysK
IC4uLnRoLXZzMjAxOS1hbmQtYWxzby1pbmNsdWRlLXBkYi1maWxlcy5wYXRjaCB8ICA2MyArKysr
KysrCiAuLi4tU3RyaW5nVXRpbHMtZml4LWJ1aWxkLXdpdGgtc3RkLWMtMTcucGF0Y2ggfCAgMzEg
KysrKwogLi4uL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybV9naXQuYmIgICAgICAgICAgICAgIHwgIDIw
ICsrLQogMTIgZmlsZXMgY2hhbmdlZCwgNTE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0v
cDhwbGF0Zm9ybS8wMDAxLVVwZGF0ZS1SRUFETUUubWQtd2l0aC1iYXNpYy1idWlsZC1pbnN0cnVj
dGlvbnMucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
cDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDItcmVmZXJlbmNlLXN1Ym1vZHVsZS12aWEtaHR0cHMt
aW5zdGVhZC1vZi1naXQtc3NoLXRvLS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2Uv
cmVjaXBlcy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwMy1wOC1wbGF0Zm9ybS1j
b25maWctZml4LWxvb2t1cC1wYXRocy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2Uv
cmVjaXBlcy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwNC1GaXgtV2luNjQtY29t
cGlsZS13YXJuaW5ncy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwNS1GaXgtQ0V2ZW50LWF1dG8tcmVzZXQt
YmVoYXZpb3VyLWluLWNhc2Utb2YtYnJvYWRjYXN0LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA2LWZpeGVk
LWRvbi10LWluY2x1ZGUtdGltZXV0aWxzLWRlZmluZXMtd2hlbi1idWlsZGluZy0ucGF0Y2gKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBs
YXRmb3JtLzAwMDctY2hhbmdlZC1idWlsZC13aXRoLXZzMjAxOS4taW5jbHVkZS1wZGItZmlsZXMu
LXN1cHBvci5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1leHRlbmRl
ZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwOC1jaGFuZ2VkLXVzZS11cGRhdGVkLXN1cHBvcnQt
c2NyaXB0cy1mb3ItdnMyMDE5LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA5LWNoYW5nZWQtZGVmYXVsdC10
by12czIwMTkucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMTAtYnVpbGQtd2l0aC12czIwMTktYW5kLWFsc28t
aW5jbHVkZS1wZGItZmlsZXMucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMTEtU3RyaW5nVXRpbHMtZml4LWJ1
aWxkLXdpdGgtc3RkLWMtMTcucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0
ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDEtVXBkYXRlLVJFQURNRS5tZC13aXRoLWJh
c2ljLWJ1aWxkLWluc3RydWN0aW9ucy5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9w
OHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwMS1VcGRhdGUtUkVBRE1FLm1kLXdpdGgtYmFzaWMtYnVp
bGQtaW5zdHJ1Y3Rpb25zLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MC4uYTAzNDE2ZWNhCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDAxLVVwZGF0ZS1SRUFETUUubWQtd2l0aC1iYXNpYy1i
dWlsZC1pbnN0cnVjdGlvbnMucGF0Y2gKQEAgLTAsMCArMSw1NCBAQAorRnJvbSBmZTkwNDgzOWE4
MjBiOTRiNDQyMGZlMzI0Y2MxMWQ3NWMwYjkwZjM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogTGFycyBPcCBkZW4gS2FtcCA8b3BkZW5rYW1wQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNv
bT4KK0RhdGU6IFRodSwgMTMgSnVsIDIwMTcgMTI6NDk6MjcgKzAyMDAKK1N1YmplY3Q6IFtQQVRD
SF0gVXBkYXRlIFJFQURNRS5tZCB3aXRoIGJhc2ljIGJ1aWxkIGluc3RydWN0aW9ucworCistLS0K
KyBSRUFETUUubWQgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0K
KyAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlm
ZiAtLWdpdCBhL1JFQURNRS5tZCBiL1JFQURNRS5tZAoraW5kZXggMDJkZTljZC4uMjVhZjUxNSAx
MDA2NDQKKy0tLSBhL1JFQURNRS5tZAorKysrIGIvUkVBRE1FLm1kCitAQCAtMSwzICsxLDM4IEBA
CistIyBwbGF0Zm9ybQorLVBsYXRmb3JtIHN1cHBvcnQgbGlicmFyeSB1c2VkIGJ5IGxpYkNFQyBh
bmQgYmluYXJ5IGFkZC1vbnMgZm9yIEtvZGkKKyshW1B1bHNlLUVpZ2h0IGxvZ29dKGh0dHBzOi8v
cHVsc2VlaWdodC5maWxlcy53b3JkcHJlc3MuY29tLzIwMTYvMDIvcHVsc2UtZWlnaHQtbG9nby13
aGl0ZS1vbi1ncmVlbi5wbmc/dz0yMDApCisgCisrIyBBYm91dAorK1RoaXMgbGlicmFyeSBwcm92
aWRlcyBwbGF0Zm9ybSBzcGVjaWZpYyBzdXBwb3J0IGZvciBvdGhlciBsaWJyYXJpZXMsIGFuZCBp
cyB1c2VkIGJ5IGxpYkNFQyBhbmQgYmluYXJ5IGFkZC1vbnMgZm9yIEtvZGkKKysKKysjIFN1cHBv
cnRlZCBwbGF0Zm9ybXMKKysKKysjIyBMaW51eCwgQlNEICYgQXBwbGUgT1MgWAorK1RvIGNvbXBp
bGUgdGhpcyBsaWJyYXJ5IG9uIExpbnV4LCB5b3UnbGwgbmVlZCB0aGUgZm9sbG93aW5nIGRlcGVu
ZGVuY2llczoKKysqIFtjbWFrZSAyLjYgb3IgYmV0dGVyXSAoaHR0cDovL3d3dy5jbWFrZS5vcmcv
KQorKyogYSBzdXBwb3J0ZWQgQysrIDExIGNvbXBpbGVyCisrCisrRm9sbG93IHRoZXNlIGluc3Ry
dWN0aW9ucyB0byBjb21waWxlIGFuZCBpbnN0YWxsIHRoZSBsaWJyYXJ5OgorK2BgYAorK2FwdC1n
ZXQgdXBkYXRlCisrYXB0LWdldCBpbnN0YWxsIGNtYWtlIGJ1aWxkLWVzc2VudGlhbAorK2dpdCBj
bG9uZSBodHRwczovL2dpdGh1Yi5jb20vUHVsc2UtRWlnaHQvcGxhdGZvcm0uZ2l0CisrbWtkaXIg
cGxhdGZvcm0vYnVpbGQKKytjZCBwbGF0Zm9ybS9idWlsZAorK2NtYWtlIC4uCisrbWFrZSAtajQK
KytzdWRvIG1ha2UgaW5zdGFsbAorK3N1ZG8gbGRjb25maWcKKytgYGAKKysKKysjIyBNaWNyb3Nv
ZnQgV2luZG93cworK1RvIGNvbXBpbGUgdGhpcyBsaWJyYXJ5IG9uIFdpbmRvd3MsIHlvdSdsbCBu
ZWVkIHRoZSBmb2xsb3dpbmcgZGVwZW5kZW5jaWVzOgorKyogW2NtYWtlIDIuNiBvciBiZXR0ZXJd
IChodHRwOi8vd3d3LmNtYWtlLm9yZy8pCisrKiBbVmlzdWFsIFN0dWRpbyAyMDEzICh2MTIwKSBv
ciAyMDE1ICh2MTQwKV0gKGh0dHBzOi8vd3d3LnZpc3VhbHN0dWRpby5jb20vKQorKworK0ZvbGxv
dyB0aGVzZSBpbnN0cnVjdGlvbnMgdG8gY29tcGlsZSBhbmQgaW5zdGFsbCB0aGUgbGlicmFyeToK
KytgYGAKKytnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL1B1bHNlLUVpZ2h0L3BsYXRmb3Jt
LmdpdAorK2NkIHBsYXRmb3JtCisrZ2l0IHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0IC0tcmVjdXJz
aXZlCisrY2QgCisrYnVpbGQuY21kCisrYGBgCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMt
ZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDItcmVmZXJlbmNlLXN1Ym1vZHVsZS12
aWEtaHR0cHMtaW5zdGVhZC1vZi1naXQtc3NoLXRvLS5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwMi1yZWZlcmVuY2Utc3VibW9kdWxlLXZp
YS1odHRwcy1pbnN0ZWFkLW9mLWdpdC1zc2gtdG8tLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMC4uYTAzNjU5MWZmCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDAyLXJlZmVyZW5jZS1zdWJt
b2R1bGUtdmlhLWh0dHBzLWluc3RlYWQtb2YtZ2l0LXNzaC10by0ucGF0Y2gKQEAgLTAsMCArMSwx
OSBAQAorRnJvbSBhMmM4MTVhYWExNjg0OGE4MTdkY2E4OGQxOGUyYzJhNGFmM2FhYTBhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVGhpYmF1bHQgSm9jaGVtIDx0cnl1bWtAZ21haWwu
Y29tPgorRGF0ZTogV2VkLCAxNSBGZWIgMjAxNyAwNzoyMTozNSArMDEwMAorU3ViamVjdDogW1BB
VENIXSByZWZlcmVuY2Ugc3VibW9kdWxlIHZpYSBodHRwcyBpbnN0ZWFkIG9mIGdpdC9zc2ggdG8g
YWxsb3cKKyBwdWJsaWMgY2xvbmUgKHdpdGhvdXQgc3NoIGtleSByZWdpc3RlcmVkIHRvIGdpdGh1
YikuCisKKy0tLQorIC5naXRtb2R1bGVzIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvLmdpdG1vZHVsZXMgYi8uZ2l0
bW9kdWxlcworaW5kZXggMWJiNGQ0OC4uNWRkNDJmMiAxMDA2NDQKKy0tLSBhLy5naXRtb2R1bGVz
CisrKysgYi8uZ2l0bW9kdWxlcworQEAgLTEsMyArMSwzIEBACisgW3N1Ym1vZHVsZSAic3VwcG9y
dCJdCisgCXBhdGggPSBzdXBwb3J0CistCXVybCA9IGdpdEBnaXRodWIuY29tOlB1bHNlLUVpZ2h0
L2xpYmNlYy1zdXBwb3J0LmdpdAorKwl1cmwgPSBodHRwczovL2dpdGh1Yi5jb20vUHVsc2UtRWln
aHQvbGliY2VjLXN1cHBvcnQuZ2l0CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDMtcDgtcGxhdGZvcm0tY29uZmlnLWZpeC1sb29r
dXAtcGF0aHMucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBs
YXRmb3JtLzAwMDMtcDgtcGxhdGZvcm0tY29uZmlnLWZpeC1sb29rdXAtcGF0aHMucGF0Y2gKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5mYjllNGJlOGIKLS0tIC9kZXYvbnVs
bAorKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAw
MDMtcDgtcGxhdGZvcm0tY29uZmlnLWZpeC1sb29rdXAtcGF0aHMucGF0Y2gKQEAgLTAsMCArMSwz
NSBAQAorRnJvbSA4YjNmYmIxNjcwZjE2MDJkMmE5ZWNhMzhhYzI1ZDk2MTI3NmJhYTJhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5
OThAZnJlZS5mcj4KK0RhdGU6IE1vbiwgNiBGZWIgMjAxNyAxNDowNDo0NyArMDEwMAorU3ViamVj
dDogW1BBVENIXSBwOC1wbGF0Zm9ybS1jb25maWc6IGZpeCBsb29rdXAgcGF0aHMKKworVXNlIHRo
ZSBwcm9wZXIgbWV0aG9kcyB0byBmaW5kIHRoZSBoZWFkZXJzIGFuZCB0aGUgbGlicmFyeS4KKwor
U2lnbmVkLW9mZi1ieTogU2FtdWVsIE1hcnRpbiA8cy5tYXJ0aW40OUBnbWFpbC5jb20+CitTaWdu
ZWQtb2ZmLWJ5OiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgorLS0t
CisgcDgtcGxhdGZvcm0tY29uZmlnLmNtYWtlLmluIHwgNCArKy0tCisgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3A4LXBsYXRm
b3JtLWNvbmZpZy5jbWFrZS5pbiBiL3A4LXBsYXRmb3JtLWNvbmZpZy5jbWFrZS5pbgoraW5kZXgg
NDdmMzBmMS4uZjU5NDE4ZCAxMDA2NDQKKy0tLSBhL3A4LXBsYXRmb3JtLWNvbmZpZy5jbWFrZS5p
bgorKysrIGIvcDgtcGxhdGZvcm0tY29uZmlnLmNtYWtlLmluCitAQCAtMTAsNyArMTAsNyBAQAor
ICMKKyAjIHByb3BhZ2F0ZSB0aGVzZSBwcm9wZXJ0aWVzIGZyb20gb25lIGJ1aWxkIHN5c3RlbSB0
byB0aGUgb3RoZXIKKyBzZXQgKHA4LXBsYXRmb3JtX1ZFUlNJT04gIkBwOC1wbGF0Zm9ybV9WRVJT
SU9OX01BSk9SQC5AcDgtcGxhdGZvcm1fVkVSU0lPTl9NSU5PUkAiKQorLXNldCAocDgtcGxhdGZv
cm1fSU5DTFVERV9ESVJTIEBwOC1wbGF0Zm9ybV9JTkNMVURFX0RJUlNAIEBDTUFLRV9JTlNUQUxM
X1BSRUZJWEAvaW5jbHVkZSkKKytmaW5kX3BhdGggKHA4LXBsYXRmb3JtX0lOQ0xVREVfRElSUyBw
OC1wbGF0Zm9ybS9vcy5oKQorIHNldCAocDgtcGxhdGZvcm1fTElCUkFSWV9ESVJTICJAQ01BS0Vf
TElCUkFSWV9PVVRQVVRfRElSRUNUT1JZQCIpCisgc2V0IChwOC1wbGF0Zm9ybV9MSU5LRVJfRkxB
R1MgIkBwOC1wbGF0Zm9ybV9MSU5LRVJfRkxBR1NAIikKKyBzZXQgKHA4LXBsYXRmb3JtX0NPTkZJ
R19WQVJTICJAcDgtcGxhdGZvcm1fQ09ORklHX1ZBUlNAIikKK0BAIC0xOSw3ICsxOSw3IEBAIHNl
dCAocDgtcGxhdGZvcm1fQ09ORklHX1ZBUlMgIkBwOC1wbGF0Zm9ybV9DT05GSUdfVkFSU0AiKQor
IGlmKFdJTjMyKQorICAgc2V0IChwOC1wbGF0Zm9ybV9MSUJSQVJZICJAQ01BS0VfSU5TVEFMTF9Q
UkVGSVhAL0BDTUFLRV9JTlNUQUxMX0xJQkRJUkAvcDgtcGxhdGZvcm0ubGliIikKKyBlbHNlKFdJ
TjMyKQorLSAgc2V0IChwOC1wbGF0Zm9ybV9MSUJSQVJZICItTEBDTUFLRV9JTlNUQUxMX1BSRUZJ
WEAvQENNQUtFX0lOU1RBTExfTElCRElSQCAtbHA4LXBsYXRmb3JtIikKKysgIGZpbmRfbGlicmFy
eSAocDgtcGxhdGZvcm1fTElCUkFSWSBwOC1wbGF0Zm9ybSkKKyBlbmRpZihXSU4zMikKKyBzZXQg
KHA4LXBsYXRmb3JtX0xJQlJBUklFUyAke3A4LXBsYXRmb3JtX0xJQlJBUll9ICJAcDgtcGxhdGZv
cm1fTElCUkFSSUVTQCIpCisgbWFya19hc19hZHZhbmNlZCAocDgtcGxhdGZvcm1fTElCUkFSWSkK
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZv
cm0vMDAwNC1GaXgtV2luNjQtY29tcGlsZS13YXJuaW5ncy5wYXRjaCBiL21ldGEtb2UvcmVjaXBl
cy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwNC1GaXgtV2luNjQtY29tcGlsZS13
YXJuaW5ncy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjE1MmZj
YjkyMAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wOHBsYXRm
b3JtL3A4cGxhdGZvcm0vMDAwNC1GaXgtV2luNjQtY29tcGlsZS13YXJuaW5ncy5wYXRjaApAQCAt
MCwwICsxLDQ1IEBACitGcm9tIDQyNThlNDdmMzMxZDIzMDJlOTQ0OTQ3ZDhkY2Q2MWJhY2NkNjYy
MGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBab2x0YW4gQ3Npem1hZGlhIDx6Y3Np
em1hZGlhQGdtYWlsLmNvbT4KK0RhdGU6IE1vbiwgNyBBdWcgMjAxNyAyMjo1MTowMyAtMDUwMAor
U3ViamVjdDogW1BBVENIXSBGaXggV2luNjQgY29tcGlsZSB3YXJuaW5ncworCistLS0KKyBzcmMv
dXRpbC9TdHJpbmdVdGlscy5jcHAgfCA4ICsrKystLS0tCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy91dGlsL1N0cmlu
Z1V0aWxzLmNwcCBiL3NyYy91dGlsL1N0cmluZ1V0aWxzLmNwcAoraW5kZXggNTEwZTJkNS4uM2Rm
MjZjZSAxMDA2NDQKKy0tLSBhL3NyYy91dGlsL1N0cmluZ1V0aWxzLmNwcAorKysrIGIvc3JjL3V0
aWwvU3RyaW5nVXRpbHMuY3BwCitAQCAtNjY4LDcgKzY2OCw3IEBAIHZlY3RvcjxzdHJpbmc+IFN0
cmluZ1V0aWxzOjpTcGxpdChjb25zdCBzdGQ6OnN0cmluZyYgaW5wdXQsIGNvbnN0IHN0ZDo6c3Ry
aW5nJiBkCisgICBzaXplX3Qgc2l6ZVMyID0gZGVsaW1pdGVyLnNpemUoKTsKKyAgIHNpemVfdCBp
c2l6ZSA9IGlucHV0LnNpemUoKTsKKyAKKy0gIHZlY3Rvcjx1bnNpZ25lZCBpbnQ+IHBvc2l0aW9u
czsKKysgIHZlY3RvcjxzaXplX3Q+IHBvc2l0aW9uczsKKyAKKyAgIG5ld1BvcyA9IGlucHV0LmZp
bmQoZGVsaW1pdGVyLCAwKTsKKyAKK0BAIC02ODcsMTEgKzY4NywxMSBAQCB2ZWN0b3I8c3RyaW5n
PiBTdHJpbmdVdGlsczo6U3BsaXQoY29uc3Qgc3RkOjpzdHJpbmcmIGlucHV0LCBjb25zdCBzdGQ6
OnN0cmluZyYgZAorIAorICAgLy8gbnVtRm91bmQgaXMgdGhlIG51bWJlciBvZiBkZWxpbWl0ZXJz
IHdoaWNoIGlzIG9uZSBsZXNzCisgICAvLyB0aGFuIHRoZSBudW1iZXIgb2Ygc3Vic3RyaW5ncwor
LSAgdW5zaWduZWQgaW50IG51bUZvdW5kID0gcG9zaXRpb25zLnNpemUoKTsKKysgIHNpemVfdCBu
dW1Gb3VuZCA9IHBvc2l0aW9ucy5zaXplKCk7CisgICBpZiAoaU1heFN0cmluZ3MgPiAwICYmIG51
bUZvdW5kID49IGlNYXhTdHJpbmdzKQorICAgICBudW1Gb3VuZCA9IGlNYXhTdHJpbmdzIC0gMTsK
KyAKKy0gIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8PSBudW1Gb3VuZDsgaSsrICkKKysg
IGZvciAoIHNpemVfdCBpID0gMDsgaSA8PSBudW1Gb3VuZDsgaSsrICkKKyAgIHsKKyAgICAgc3Ry
aW5nIHM7CisgICAgIGlmICggaSA9PSAwICkKK0BAIC0xMDU4LDcgKzEwNTgsNyBAQCBzdGQ6OnN0
cmluZyBTdHJpbmdVdGlsczo6Q3JlYXRlVVVJRCgpCisgICBpZiAoIW1fdXVpZEluaXRpYWxpemVk
KQorICAgeworICAgICAvKiB1c2UgY3VycmVudCB0aW1lIGFzIHRoZSBzZWVkIGZvciByYW5kKCkq
LworLSAgICBzcmFuZCh0aW1lKE5VTEwpKTsKKysgICAgc3JhbmQoKHVuc2lnbmVkIGludCl0aW1l
KE5VTEwpKTsKKyAgICAgbV91dWlkSW5pdGlhbGl6ZWQgPSB0cnVlOworICAgfQorIApkaWZmIC0t
Z2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA1
LUZpeC1DRXZlbnQtYXV0by1yZXNldC1iZWhhdmlvdXItaW4tY2FzZS1vZi1icm9hZGNhc3QucGF0
Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDUt
Rml4LUNFdmVudC1hdXRvLXJlc2V0LWJlaGF2aW91ci1pbi1jYXNlLW9mLWJyb2FkY2FzdC5wYXRj
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmQyOWM1Mjg2NAotLS0gL2Rl
di9udWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZv
cm0vMDAwNS1GaXgtQ0V2ZW50LWF1dG8tcmVzZXQtYmVoYXZpb3VyLWluLWNhc2Utb2YtYnJvYWRj
YXN0LnBhdGNoCkBAIC0wLDAgKzEsMjMgQEAKK0Zyb20gMDcwZTk3YzdiYTMzOTYzYmRjNmZlMTc4
YjE1Mjc1YWJmNDdmYzFhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFNlcmdleSBT
aHJhbWNoZW5rbyA8c2VyZ2V5LnNocmFtY2hlbmtvQGdtYWlsLmNvbT4KK0RhdGU6IFR1ZSwgNyBB
dWcgMjAxOCAyMDowODozMyArMDMwMAorU3ViamVjdDogW1BBVENIXSBGaXggQ0V2ZW50IGF1dG8t
cmVzZXQgYmVoYXZpb3VyIGluIGNhc2Ugb2YgYnJvYWRjYXN0IHNpZ25hbC4KKworLS0tCisgc3Jj
L3RocmVhZHMvbXV0ZXguaCB8IDMgKystCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvc3JjL3RocmVhZHMvbXV0ZXguaCBiL3Ny
Yy90aHJlYWRzL211dGV4LmgKK2luZGV4IDhkYmJmZmQuLjFhZTBlZjAgMTAwNjQ0CistLS0gYS9z
cmMvdGhyZWFkcy9tdXRleC5oCisrKysgYi9zcmMvdGhyZWFkcy9tdXRleC5oCitAQCAtMzUxLDcg
KzM1MSw4IEBAIG5hbWVzcGFjZSBQOFBMQVRGT1JNCisgICAgIHsKKyAgICAgICBDTG9ja09iamVj
dCBsb2NrKG1fbXV0ZXgpOworICAgICAgIGJvb2wgYlJldHVybihtX2JTaWduYWxlZCk7CistICAg
ICAgaWYgKGJSZXR1cm4gJiYgKC0tbV9pV2FpdGluZ1RocmVhZHMgPT0gMCB8fCAhbV9iQnJvYWRj
YXN0KSAmJiBtX2JBdXRvUmVzZXQpCisrICAgICAgLS1tX2lXYWl0aW5nVGhyZWFkczsKKysgICAg
ICBpZiAoYlJldHVybiAmJiAobV9pV2FpdGluZ1RocmVhZHMgPT0gMCB8fCAhbV9iQnJvYWRjYXN0
KSAmJiBtX2JBdXRvUmVzZXQpCisgICAgICAgICBtX2JTaWduYWxlZCA9IGZhbHNlOworICAgICAg
IHJldHVybiBiUmV0dXJuOworICAgICB9CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0
ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDYtZml4ZWQtZG9uLXQtaW5jbHVkZS10aW1l
dXRpbHMtZGVmaW5lcy13aGVuLWJ1aWxkaW5nLS5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1leHRl
bmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwNi1maXhlZC1kb24tdC1pbmNsdWRlLXRpbWV1
dGlscy1kZWZpbmVzLXdoZW4tYnVpbGRpbmctLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMC4uNjMxMmNiYjgzCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA2LWZpeGVkLWRvbi10LWluY2x1
ZGUtdGltZXV0aWxzLWRlZmluZXMtd2hlbi1idWlsZGluZy0ucGF0Y2gKQEAgLTAsMCArMSwzOCBA
QAorRnJvbSBjNGQyOWE5MmRiNTNkNGZmODRiNGUwMWRhNDk3ZjAxYTY4YmNhNmQ2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbTogTGFycyBPcCBkZW4gS2FtcCA8bGFyc0BvcGRlbmthbXAu
ZXU+CitEYXRlOiBGcmksIDMgQXByIDIwMjAgMTE6MTQ6MjkgKzAyMDAKK1N1YmplY3Q6IFtQQVRD
SF0gZml4ZWQ6IGRvbid0IGluY2x1ZGUgdGltZXV0aWxzIGRlZmluZXMgd2hlbiBidWlsZGluZyBz
d2lnIG9uCisgd2luZG93cworCistLS0KKyBzcmMvdXRpbC90aW1ldXRpbHMuaCB8IDYgKysrLS0t
CisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlm
ZiAtLWdpdCBhL3NyYy91dGlsL3RpbWV1dGlscy5oIGIvc3JjL3V0aWwvdGltZXV0aWxzLmgKK2lu
ZGV4IGYyMjE4NGYuLjExOTY1MDQgMTAwNjQ0CistLS0gYS9zcmMvdXRpbC90aW1ldXRpbHMuaAor
KysrIGIvc3JjL3V0aWwvdGltZXV0aWxzLmgKK0BAIC00NCw3ICs0NCw3IEBACisgCisgbmFtZXNw
YWNlIFA4UExBVEZPUk0KKyB7CistICAjaWYgZGVmaW5lZChfX1dJTkRPV1NfXykKKysgICNpZiBk
ZWZpbmVkKF9fV0lORE9XU19fKSAmJiAhZGVmaW5lZChTV0lHUFlUSE9OKQorICAgc3RydWN0IHRp
bWV6b25lCisgICB7CisgICAgIGludAl0el9taW51dGVzd2VzdDsKK0BAIC02OCwxMiArNjgsMTIg
QEAgbmFtZXNwYWNlIFA4UExBVEZPUk0KKyAgICAgcGN1cl90aW1lLT50dl91c2VjID0gY3VycmVu
dC5taWxsaXRtICogMTAwMEw7CisgICAgIGlmICh0eikKKyAgICAgeworLSAgICAgIHR6LT50el9t
aW51dGVzd2VzdCA9IGN1cnJlbnQudGltZXpvbmU7CS8qIG1pbnV0ZXMgd2VzdCBvZiBHcmVlbndp
Y2ggICovCisrICAgICAgdHotPnR6X21pbnV0ZXN3ZXN0ID0gY3VycmVudC50aW1lem9uZTsgIC8q
IG1pbnV0ZXMgd2VzdCBvZiBHcmVlbndpY2ggICovCisgICAgICAgdHotPnR6X2RzdHRpbWUgPSBj
dXJyZW50LmRzdGZsYWc7CSAgICAgIC8qIHR5cGUgb2YgZHN0IGNvcnJlY3Rpb24gICovCisgICAg
IH0KKyAgICAgcmV0dXJuIDA7CisgICB9CistICAjZW5kaWYKKysgICNlbmRpZiAvLyBkZWZpbmVk
KF9fV0lORE9XU19fKSAmJiAhZGVmaW5lZChTV0lHUFlUSE9OKQorIAorICAgaW5saW5lIGludDY0
X3QgR2V0VGltZU1zKCkKKyAgIHsKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRl
ZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwNy1jaGFuZ2VkLWJ1aWxkLXdpdGgtdnMyMDE5Li1p
bmNsdWRlLXBkYi1maWxlcy4tc3VwcG9yLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA3LWNoYW5nZWQtYnVpbGQtd2l0aC12czIwMTkuLWlu
Y2x1ZGUtcGRiLWZpbGVzLi1zdXBwb3IucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwLi40ZTEyYzI0YTIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW9lL3JlY2lwZXMt
ZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDctY2hhbmdlZC1idWlsZC13aXRoLXZz
MjAxOS4taW5jbHVkZS1wZGItZmlsZXMuLXN1cHBvci5wYXRjaApAQCAtMCwwICsxLDE1OSBAQAor
RnJvbSAzMDlkMjE1MjZkNzE3YWEzODIzMTFlMDZkNTEzNDI4OTJkODZmM2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbTogTGFycyBPcCBkZW4gS2FtcCA8bGFyc0BvcGRlbmthbXAuZXU+
CitEYXRlOiBUaHUsIDIzIEFwciAyMDIwIDE1OjUwOjEzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hd
IGNoYW5nZWQ6IGJ1aWxkIHdpdGggdnMyMDE5LiBpbmNsdWRlIHBkYiBmaWxlcy4gc3VwcG9ydCBw
YXRoCisgd2l0aCBzcGFjZXMKKworLS0tCisgQ01ha2VMaXN0cy50eHQgICAgICAgIHwgNTAgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQorIHdpbmRvd3MvYnVpbGQt
bGliLmNtZCB8IDE2ICsrKysrKysrKystLS0tCisgd2luZG93cy9idWlsZC5jbWQgICAgIHwgMTIg
KysrKysrLS0tLS0KKyAzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0
aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAor
aW5kZXggNzE0NGIwYi4uNGE3YWQ4MCAxMDA2NDQKKy0tLSBhL0NNYWtlTGlzdHMudHh0CisrKysg
Yi9DTWFrZUxpc3RzLnR4dAorQEAgLTIzLDkgKzIzLDkgQEAgaWYoV0lOMzIpCisgZW5kaWYoKQor
IAorIHNldChwOC1wbGF0Zm9ybV9JTkNMVURFX0RJUlMgIiR7Q01BS0VfSU5TVEFMTF9QUkVGSVh9
L2luY2x1ZGUvcDgtcGxhdGZvcm0iKQorLUlGKFdJTjMyKQorK2lmKFdJTjMyKQorICAgTElTVChB
UFBFTkQgcDgtcGxhdGZvcm1fSU5DTFVERV9ESVJTICIke0NNQUtFX0lOU1RBTExfUFJFRklYfS9p
bmNsdWRlL3A4LXBsYXRmb3JtL3dpbmRvd3MiKQorLUVORElGKFdJTjMyKQorK2VuZGlmKFdJTjMy
KQorIHNldChwOC1wbGF0Zm9ybV9MSUJSQVJJRVMgJHtDTUFLRV9USFJFQURfTElCU19JTklUfSkK
KyAKKyBpZihOT1QgJHtDT1JFX1NZU1RFTV9OQU1FfSBTVFJFUVVBTCAiIikKK0BAIC0zOCwyMyAr
MzgsNDcgQEAgc2V0KFNPVVJDRVMgc3JjL3V0aWwvU3RyaW5nVXRpbHMuY3BwKQorIAorIGFkZF9s
aWJyYXJ5KHA4LXBsYXRmb3JtICR7U09VUkNFU30gJHtQTEFUX1NPVVJDRVN9KQorIHRhcmdldF9s
aW5rX2xpYnJhcmllcyhwOC1wbGF0Zm9ybSAke3A4LXBsYXRmb3JtX0xJQlJBUklFU30pCistc2V0
X3RhcmdldF9wcm9wZXJ0aWVzKHA4LXBsYXRmb3JtIFBST1BFUlRJRVMgVkVSU0lPTiAke3A4LXBs
YXRmb3JtX1ZFUlNJT05fTUFKT1J9LiR7cDgtcGxhdGZvcm1fVkVSU0lPTl9NSU5PUn0uJHtwOC1w
bGF0Zm9ybV9WRVJTSU9OX1BBVENIfQorLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTT1ZFUlNJT04gJHtwOC1wbGF0Zm9ybV9WRVJTSU9OX01BSk9SfSkKKytz
ZXRfdGFyZ2V0X3Byb3BlcnRpZXMocDgtcGxhdGZvcm0KKysgICAgUFJPUEVSVElFUworKyAgICBW
RVJTSU9OICR7cDgtcGxhdGZvcm1fVkVSU0lPTl9NQUpPUn0uJHtwOC1wbGF0Zm9ybV9WRVJTSU9O
X01JTk9SfS4ke3A4LXBsYXRmb3JtX1ZFUlNJT05fUEFUQ0h9CisrICAgIFNPVkVSU0lPTiAke3A4
LXBsYXRmb3JtX1ZFUlNJT05fTUFKT1J9KQorKworK2lmKFdJTjMyKQorKyAgaWYgKE1TVkMpCisr
ICAgICMgZ2VuZXJhdGUgcGRiIGluIHJlbGVhc2UgbW9kZSB0b28KKysgICAgc2V0X3RhcmdldF9w
cm9wZXJ0aWVzKHA4LXBsYXRmb3JtCisrICAgICAgICBQUk9QRVJUSUVTCisrICAgICAgICBDT01Q
SUxFX1BEQl9OQU1FX0RFQlVHIHA4LXBsYXRmb3JtJHtDTUFLRV9ERUJVR19QT1NURklYfQorKyAg
ICAgICAgQ09NUElMRV9QREJfTkFNRV9SRUxFQVNFIHA4LXBsYXRmb3JtCisrICAgICAgICBDT01Q
SUxFX1BEQl9OQU1FX01JTlNJWkVSRUwgcDgtcGxhdGZvcm0KKysgICAgICAgIENPTVBJTEVfUERC
X05BTUVfUkVMV0lUSERFQklORk8gcDgtcGxhdGZvcm0pCisrCisrICAgIGlmICgke1dJTjY0fSkK
KysgICAgICAjIGRlZmF1bHQgc2V0dGluZyB0aGF0IGdvdCByZW1vdmVkIGluIHJlY2VudCB2cyB2
ZXJzaW9ucywgZ2VuZXJhdGVzIGEgd2FybmluZyBpZiBzZXQKKysgICAgICBzdHJpbmcoUkVQTEFD
RSAiL2FyY2g6U1NFMiIgIiIgQ01BS0VfQ1hYX0ZMQUdTICR7Q01BS0VfQ1hYX0ZMQUdTfSkKKysg
ICAgZW5kaWYoJHtXSU42NH0pCisrCisrICBlbmRpZihNU1ZDKQorKworKyAgaWYgKE5PVCAke1dJ
TjY0fSkKKysgICAgYWRkX2RlZmluaXRpb25zKC1EX1VTRV8zMkJJVF9USU1FX1QpCisrICBlbmRp
ZihOT1QgJHtXSU42NH0pCisrZW5kaWYoV0lOMzIpCisgCisgaW5zdGFsbChUQVJHRVRTIHA4LXBs
YXRmb3JtIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9KQorIGluc3RhbGwoRklM
RVMgc3JjL29zLmggREVTVElOQVRJT04gaW5jbHVkZS9wOC1wbGF0Zm9ybSkKKy1JRihXSU4zMikK
Ky0gIElOU1RBTEwoRklMRVMgc3JjL3dpbmRvd3MvZGxmY24td2luMzIuaAorK2lmKFdJTjMyKQor
KyAgaW5zdGFsbChGSUxFUyBzcmMvd2luZG93cy9kbGZjbi13aW4zMi5oCisgICAgICAgICAgICAg
ICAgIHNyYy93aW5kb3dzL29zLXNvY2tldC5oCisgICAgICAgICAgICAgICAgIHNyYy93aW5kb3dz
L29zLXRocmVhZHMuaAorICAgICAgICAgICAgICAgICBzcmMvd2luZG93cy9vcy10eXBlcy5oCisg
ICAgICAgICAgIERFU1RJTkFUSU9OIGluY2x1ZGUvcDgtcGxhdGZvcm0vd2luZG93cykKKy1FTFNF
KFdJTjMyKQorK2Vsc2UoV0lOMzIpCisgICBpbnN0YWxsKEZJTEVTIHNyYy9wb3NpeC9vcy1zb2Nr
ZXQuaAorICAgICAgICAgICAgICAgICBzcmMvcG9zaXgvb3MtdGhyZWFkcy5oCisgICAgICAgICAg
ICAgICAgIHNyYy9wb3NpeC9vcy10eXBlcy5oCisgICAgICAgICAgIERFU1RJTkFUSU9OIGluY2x1
ZGUvcDgtcGxhdGZvcm0vcG9zaXgpCistRU5ESUYoV0lOMzIpCisrZW5kaWYoV0lOMzIpCisgaW5z
dGFsbChGSUxFUyBzcmMvc29ja2V0cy9jZGV2c29ja2V0LmgKKyAgICAgICAgICAgICAgIHNyYy9z
b2NrZXRzL3NvY2tldC5oCisgICAgICAgICAgICAgICBzcmMvc29ja2V0cy90Y3AuaAorQEAgLTcx
LDExICs5NSwxNyBAQCBpbnN0YWxsKEZJTEVTIHNyYy91dGlsL2F0b21pYy5oCisgICAgICAgICAg
ICAgICBzcmMvdXRpbC91dGlsLmgKKyAgICAgICAgIERFU1RJTkFUSU9OIGluY2x1ZGUvcDgtcGxh
dGZvcm0vdXRpbCkKKyAKKy1JRihOT1QgV0lOMzIpCisraWYoTVNWQykKKysgICMgaW5zdGFsbCBn
ZW5lcmF0ZWQgcGRiCisrICBpbnN0YWxsKEZJTEVTICQ8VEFSR0VUX0ZJTEVfRElSOnA4LXBsYXRm
b3JtPi9wOC1wbGF0Zm9ybS5wZGIKKysgICAgICAgICAgREVTVElOQVRJT04gIiR7Q01BS0VfSU5T
VEFMTF9MSUJESVJ9IikKKytlbmRpZihNU1ZDKQorKworK2lmKE5PVCBXSU4zMikKKyAgIGNvbmZp
Z3VyZV9maWxlKHA4LXBsYXRmb3JtLnBjLmluIHA4LXBsYXRmb3JtLnBjIEBPTkxZKQorICAgaW5z
dGFsbChGSUxFUyAke0NNQUtFX0JJTkFSWV9ESVJ9L3A4LXBsYXRmb3JtLnBjCisgICAgICAgICAg
IERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9L3BrZ2NvbmZpZykKKy1FTkRJRihO
T1QgV0lOMzIpCisrZW5kaWYoTk9UIFdJTjMyKQorIAorICMgY29uZmlnIG1vZGUKKyBjb25maWd1
cmVfZmlsZSAocDgtcGxhdGZvcm0tY29uZmlnLmNtYWtlLmluCitkaWZmIC0tZ2l0IGEvd2luZG93
cy9idWlsZC1saWIuY21kIGIvd2luZG93cy9idWlsZC1saWIuY21kCitpbmRleCA1ZDViZjFhLi44
NzViZmNlIDEwMDY0NAorLS0tIGEvd2luZG93cy9idWlsZC1saWIuY21kCisrKysgYi93aW5kb3dz
L2J1aWxkLWxpYi5jbWQKK0BAIC0xMSwxNCArMTEsMjIgQEAgU0VUIFZTVkVSU0lPTj0lMworIFNF
VCBJTlNUQUxMUEFUSD0lNAorIElGIFslNF0gPT0gW10gR09UTyBtaXNzaW5ncGFyYW1zCisgCisr
U0VUIElOU1RBTExQQVRIPSVJTlNUQUxMUEFUSDoiPSUKKyBTRVQgQlVJTERUQVJHRVQ9JUlOU1RB
TExQQVRIJVxjbWFrZVwlQlVJTERBUkNIJQorIFNFVCBUQVJHRVQ9JUlOU1RBTExQQVRIJVwlQlVJ
TERBUkNIJQorIAorLWNhbGwgJU1ZRElSJS4uXHN1cHBvcnRcd2luZG93c1xjbWFrZVxnZW5lcmF0
ZS5jbWQgJUJVSUxEQVJDSCUgbm1ha2UgJU1ZRElSJS4uXCAlQlVJTERUQVJHRVQlICVUQVJHRVQl
ICVCVUlMRFRZUEUlICVWU1ZFUlNJT04lIHN0YXRpYworLWNhbGwgJU1ZRElSJS4uXHN1cHBvcnRc
d2luZG93c1xjbWFrZVxidWlsZC5jbWQgJUJVSUxEQVJDSCUgJUJVSUxEVEFSR0VUJSAlVlNWRVJT
SU9OJQorLWdvdG8gZXhpdAorK0NBTEwgIiVNWURJUiUuLlxzdXBwb3J0XHdpbmRvd3NcY21ha2Vc
Z2VuZXJhdGUuY21kIiAlQlVJTERBUkNIJSBubWFrZSAiJU1ZRElSJS4uXCIgIiVCVUlMRFRBUkdF
VCUiICIlVEFSR0VUJSIgJUJVSUxEVFlQRSUgJVZTVkVSU0lPTiUgc3RhdGljCisrQ0FMTCAiJU1Z
RElSJS4uXHN1cHBvcnRcd2luZG93c1xjbWFrZVxidWlsZC5jbWQiICVCVUlMREFSQ0glICIlQlVJ
TERUQVJHRVQlIiAlVlNWRVJTSU9OJQorK0dPVE8gZXhpdAorIAorIDptaXNzaW5ncGFyYW1zCist
ZWNobyAiYnVpbGQtbGliLmNtZCByZXF1aXJlcyA0IHBhcmFtZXRlcnMiCisrRUNITy4lfmRwMCBy
ZXF1aXJlcyA0IHBhcmFtZXRlcnMKKytFQ0hPLiAgJX5kcDAgW2FyY2hpdGVjdHVyZV0gW3R5cGVd
IFt2ZXJzaW9uXSBbaW5zdGFsbCBwYXRoXQorK0VDSE8uCisrRUNITy4gYXJjaGl0ZWN0dXJlOiAg
ICBhbWQ2NCB4ODYKKytFQ0hPLiB0eXBlOiAgICAgICAgICAgIFJlbGVhc2UgRGVidWcKKytFQ0hP
LiB2ZXJzaW9uOiAgICAgICAgIFZpc3VhbCBTdHVkaW8gdmVyc2lvbiAoMjAxOSkKKytFQ0hPLiBp
bnN0YWxsIHBhdGg6ICAgIGluc3RhbGxhdGlvbiBwYXRoIHdpdGhvdXQgcXVvdGVzCisrZXhpdCAv
YiA5OQorIAorIDpleGl0CitcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKK2RpZmYgLS1naXQg
YS93aW5kb3dzL2J1aWxkLmNtZCBiL3dpbmRvd3MvYnVpbGQuY21kCitpbmRleCAxZjc5NmE2Li45
YmY3NmZiIDEwMDY0NAorLS0tIGEvd2luZG93cy9idWlsZC5jbWQKKysrKyBiL3dpbmRvd3MvYnVp
bGQuY21kCitAQCAtNiwxMyArNiwxNSBAQCBTRVRMT0NBTAorIAorIFNFVCBNWURJUj0lfmRwMAor
IFNFVCBCVUlMRFRZUEU9UmVsZWFzZQorLVNFVCBWU1ZFUlNJT049MTIKKytTRVQgVlNWRVJTSU9O
PTIwMTkKKyBTRVQgSU5TVEFMTFBBVEg9JU1ZRElSJS4uXGJ1aWxkCisgCistcm1kaXIgJU1ZRElS
JS4uXGJ1aWxkIC9zIC9xCisrSUYgRVhJU1QgIiVNWURJUiUuLlxidWlsZCIgKAorKyAgUk1ESVIg
L3MgL3EgIiVNWURJUiUuLlxidWlsZCIKKyspCisgCistZm9yICUlVCBpbiAoYW1kNjQgeDg2KSBk
byAoCistICBjYWxsICVNWURJUiVcYnVpbGQtbGliLmNtZCAlJVQgJUJVSUxEVFlQRSUgJVZTVkVS
U0lPTiUgJUlOU1RBTExQQVRIJQorK0ZPUiAlJVQgSU4gKGFtZDY0IHg4NikgRE8gKAorKyAgQ0FM
TCAiJU1ZRElSJVxidWlsZC1saWIuY21kIiAlJVQgJUJVSUxEVFlQRSUgJVZTVkVSU0lPTiUgIiVJ
TlNUQUxMUEFUSCUiCisgKQorIAorLXJtZGlyICVNWURJUiUuLlxidWlsZFxjbWFrZSAvcyAvcQor
K1JNRElSIC9zIC9xICIlTVlESVIlLi5cYnVpbGRcY21ha2UiCmRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDgtY2hhbmdlZC11c2Ut
dXBkYXRlZC1zdXBwb3J0LXNjcmlwdHMtZm9yLXZzMjAxOS5wYXRjaCBiL21ldGEtb2UvcmVjaXBl
cy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4cGxhdGZvcm0vMDAwOC1jaGFuZ2VkLXVzZS11cGRhdGVk
LXN1cHBvcnQtc2NyaXB0cy1mb3ItdnMyMDE5LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMC4uNTI4OTQ0ZjA2Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA4LWNoYW5nZWQtdXNlLXVwZGF0
ZWQtc3VwcG9ydC1zY3JpcHRzLWZvci12czIwMTkucGF0Y2gKQEAgLTAsMCArMSwxNiBAQAorRnJv
bSA0ZjM4YWJkZjdmNDI5YTBiYWYzYThiZDMzYzc5ODJlMTU5ODNmMzA4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogTGFycyBPcCBkZW4gS2FtcCA8bGFyc0BvcGRlbmthbXAuZXU+CitE
YXRlOiBTYXQsIDI1IEFwciAyMDIwIDA5OjU4OjI5ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGNo
YW5nZWQ6IHVzZSB1cGRhdGVkIHN1cHBvcnQgc2NyaXB0cyBmb3IgdnMyMDE5CisKKy0tLQorIHN1
cHBvcnQgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCisKK2RpZmYgLS1naXQgYS9zdXBwb3J0IGIvc3VwcG9ydAoraW5kZXggMTE0OWExMi4uZDBh
NmI1NiAxNjAwMDAKKy0tLSBhL3N1cHBvcnQKKysrKyBiL3N1cHBvcnQKK0BAIC0xICsxIEBACist
U3VicHJvamVjdCBjb21taXQgMTE0OWExMmM3OTU5NWEwM2ExOTE1NTg1MTU5ZDVlNjk1MjQ4NDMy
NQorK1N1YnByb2plY3QgY29tbWl0IGQwYTZiNTY2Zjk3MjNmYmFiOTcxY2JjYzE3Njk2ZjZkYTA2
YmY4NzkKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wOHBsYXRmb3JtL3A4
cGxhdGZvcm0vMDAwOS1jaGFuZ2VkLWRlZmF1bHQtdG8tdnMyMDE5LnBhdGNoIGIvbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDA5LWNoYW5nZWQtZGVmYXVs
dC10by12czIwMTkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi41
YzE2YWE2OTQKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhw
bGF0Zm9ybS9wOHBsYXRmb3JtLzAwMDktY2hhbmdlZC1kZWZhdWx0LXRvLXZzMjAxOS5wYXRjaApA
QCAtMCwwICsxLDE2IEBACitGcm9tIGRiNTYzM2ZjZmFjN2UwNDliNDg5ZDEwZjM1OTA1YzAyNjFj
MmViZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBMYXJzIE9wIGRlbiBLYW1wIDxs
YXJzQG9wZGVua2FtcC5ldT4KK0RhdGU6IFNhdCwgMjUgQXByIDIwMjAgMTA6NTc6MjkgKzAyMDAK
K1N1YmplY3Q6IFtQQVRDSF0gY2hhbmdlZDogZGVmYXVsdCB0byB2czIwMTkKKworLS0tCisgc3Vw
cG9ydCB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKKworZGlmZiAtLWdpdCBhL3N1cHBvcnQgYi9zdXBwb3J0CitpbmRleCBkMGE2YjU2Li43YzQx
MjExIDE2MDAwMAorLS0tIGEvc3VwcG9ydAorKysrIGIvc3VwcG9ydAorQEAgLTEgKzEgQEAKKy1T
dWJwcm9qZWN0IGNvbW1pdCBkMGE2YjU2NmY5NzIzZmJhYjk3MWNiY2MxNzY5NmY2ZGEwNmJmODc5
CisrU3VicHJvamVjdCBjb21taXQgN2M0MTIxMTEyYWYzN2Q2NDFlYTAyMzgzZDUzYjUwYTM4MDg3
MTE1YQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhw
bGF0Zm9ybS8wMDEwLWJ1aWxkLXdpdGgtdnMyMDE5LWFuZC1hbHNvLWluY2x1ZGUtcGRiLWZpbGVz
LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8w
MDEwLWJ1aWxkLXdpdGgtdnMyMDE5LWFuZC1hbHNvLWluY2x1ZGUtcGRiLWZpbGVzLnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uODc5MjAwM2Q1Ci0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8w
MDEwLWJ1aWxkLXdpdGgtdnMyMDE5LWFuZC1hbHNvLWluY2x1ZGUtcGRiLWZpbGVzLnBhdGNoCkBA
IC0wLDAgKzEsNjMgQEAKK0Zyb20gMmYxOTYwNmUwN2E0ZWVmZmE2ZDM3NDExOGQ1NzU0ZTUxYWI3
MjI4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IExhcnMgT3AgZGVuIEthbXAgPGxh
cnNAb3BkZW5rYW1wLmV1PgorRGF0ZTogVGh1LCA5IEp1bCAyMDIwIDIyOjMwOjI1ICswMjAwCitT
dWJqZWN0OiBbUEFUQ0hdIGJ1aWxkIHdpdGggdnMyMDE5IGFuZCBhbHNvIGluY2x1ZGUgcGRiIGZp
bGVzCisKKy0tLQorIENNYWtlTGlzdHMudHh0ICAgICAgICB8ICAyICstCisgc3VwcG9ydCAgICAg
ICAgICAgICAgIHwgIDIgKy0KKyB3aW5kb3dzL2J1aWxkLWxpYi5jbWQgfCAxNiArKysrKysrKysr
KysrKystCisgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAoraW5kZXgg
NGE3YWQ4MC4uZjViMmZmOCAxMDA2NDQKKy0tLSBhL0NNYWtlTGlzdHMudHh0CisrKysgYi9DTWFr
ZUxpc3RzLnR4dAorQEAgLTEzLDcgKzEzLDcgQEAgc2V0KHA4LXBsYXRmb3JtX05BTUUgcDgtcGxh
dGZvcm0pCisgc2V0KHA4LXBsYXRmb3JtX0RFU0NSSVBUSU9OICJQdWxzZS1FaWdodCBwbGF0Zm9y
bSBzdXBwb3J0IGxpYnJhcnkiKQorIHNldChwOC1wbGF0Zm9ybV9WRVJTSU9OX01BSk9SIDIpCisg
c2V0KHA4LXBsYXRmb3JtX1ZFUlNJT05fTUlOT1IgMSkKKy1zZXQocDgtcGxhdGZvcm1fVkVSU0lP
Tl9QQVRDSCAwKQorK3NldChwOC1wbGF0Zm9ybV9WRVJTSU9OX1BBVENIIDEpCisgCisgc2V0KENN
QUtFX1BPU0lUSU9OX0lOREVQRU5ERU5UX0NPREUgb24pCisgCitkaWZmIC0tZ2l0IGEvc3VwcG9y
dCBiL3N1cHBvcnQKK2luZGV4IDdjNDEyMTEuLjQxNmRhMWQgMTYwMDAwCistLS0gYS9zdXBwb3J0
CisrKysgYi9zdXBwb3J0CitAQCAtMSArMSBAQAorLVN1YnByb2plY3QgY29tbWl0IDdjNDEyMTEx
MmFmMzdkNjQxZWEwMjM4M2Q1M2I1MGEzODA4NzExNWEKKytTdWJwcm9qZWN0IGNvbW1pdCA0MTZk
YTFkMGU2MGVlMjM5N2YzMWQ0ZWI4Zjg1ODg2YTllZjMzMjdhCitkaWZmIC0tZ2l0IGEvd2luZG93
cy9idWlsZC1saWIuY21kIGIvd2luZG93cy9idWlsZC1saWIuY21kCitpbmRleCA4NzViZmNlLi5m
ZTk4NWE3IDEwMDY0NAorLS0tIGEvd2luZG93cy9idWlsZC1saWIuY21kCisrKysgYi93aW5kb3dz
L2J1aWxkLWxpYi5jbWQKK0BAIC0xNSw2ICsxNSwyMCBAQCBTRVQgSU5TVEFMTFBBVEg9JUlOU1RB
TExQQVRIOiI9JQorIFNFVCBCVUlMRFRBUkdFVD0lSU5TVEFMTFBBVEglXGNtYWtlXCVCVUlMREFS
Q0glCisgU0VUIFRBUkdFVD0lSU5TVEFMTFBBVEglXCVCVUlMREFSQ0glCisgCisrcmVtIENoZWNr
IHN1cHBvcnQgc3VibW9kdWxlCisrSUYgTk9UIEVYSVNUICIlTVlESVIlLi5cc3VwcG9ydFx3aW5k
b3dzXGNtYWtlXGJ1aWxkLmNtZCIgKAorKyAgcmVtIFRyeSB0byBpbml0IHRoZSBnaXQgc3VibW9k
dWxlcworKyAgY2QgIiVNWURJUiUuLiIKKysgIGdpdCBzdWJtb2R1bGUgdXBkYXRlIC0taW5pdCAt
ciA+bnVsIDI+JjEKKysKKysgIElGIE5PVCBFWElTVCAiJU1ZRElSJS4uXHN1cHBvcnRcd2luZG93
c1xjbWFrZVxidWlsZC5jbWQiICgKKysgICAgRUNITy4qKiogc3VwcG9ydCBnaXQgc3VibW9kdWxl
IGhhcyBub3QgYmVlbiBjaGVja2VkIG91dCAqKioKKysgICAgRUNITy4KKysgICAgRUNITy5TZWUg
ZG9jc1xSRUFETUUud2luZG93cy5tZAorKyAgICBFWElUIC9iIDIKKysgICkKKyspCisrCisgQ0FM
TCAiJU1ZRElSJS4uXHN1cHBvcnRcd2luZG93c1xjbWFrZVxnZW5lcmF0ZS5jbWQiICVCVUlMREFS
Q0glIG5tYWtlICIlTVlESVIlLi5cIiAiJUJVSUxEVEFSR0VUJSIgIiVUQVJHRVQlIiAlQlVJTERU
WVBFJSAlVlNWRVJTSU9OJSBzdGF0aWMKKyBDQUxMICIlTVlESVIlLi5cc3VwcG9ydFx3aW5kb3dz
XGNtYWtlXGJ1aWxkLmNtZCIgJUJVSUxEQVJDSCUgIiVCVUlMRFRBUkdFVCUiICVWU1ZFUlNJT04l
CisgR09UTyBleGl0CitAQCAtMjksNCArNDMsNCBAQCBFQ0hPLiB2ZXJzaW9uOiAgICAgICAgIFZp
c3VhbCBTdHVkaW8gdmVyc2lvbiAoMjAxOSkKKyBFQ0hPLiBpbnN0YWxsIHBhdGg6ICAgIGluc3Rh
bGxhdGlvbiBwYXRoIHdpdGhvdXQgcXVvdGVzCisgZXhpdCAvYiA5OQorIAorLTpleGl0CitcIE5v
IG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKKys6ZXhpdApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybS8wMDExLVN0cmluZ1V0aWxzLWZpeC1i
dWlsZC13aXRoLXN0ZC1jLTE3LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxh
dGZvcm0vcDhwbGF0Zm9ybS8wMDExLVN0cmluZ1V0aWxzLWZpeC1idWlsZC13aXRoLXN0ZC1jLTE3
LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYzk3OTJmNjRiCi0t
LSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhw
bGF0Zm9ybS8wMDExLVN0cmluZ1V0aWxzLWZpeC1idWlsZC13aXRoLXN0ZC1jLTE3LnBhdGNoCkBA
IC0wLDAgKzEsMzEgQEAKK0Zyb20gMzAwMDg5Y2VkMmI4MzIyZGIxMTk3Yjc2YmVjZDc4YmNlYTRk
ZTA4OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEx1a2FzIFJ1c2FrIDxsb3J1c2Fr
QGdtYWlsLmNvbT4KK0RhdGU6IFRodSwgMTAgU2VwIDIwMjAgMTE6MzI6NTUgLTA3MDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gU3RyaW5nVXRpbHM6IGZpeCBidWlsZCB3aXRoIC1zdGQ9YysrMTcKKworLS0t
Cisgc3JjL3V0aWwvU3RyaW5nVXRpbHMuY3BwIHwgNCArKy0tCisgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy91dGlsL1N0
cmluZ1V0aWxzLmNwcCBiL3NyYy91dGlsL1N0cmluZ1V0aWxzLmNwcAoraW5kZXggM2RmMjZjZS4u
ZThlZmZkNSAxMDA2NDQKKy0tLSBhL3NyYy91dGlsL1N0cmluZ1V0aWxzLmNwcAorKysrIGIvc3Jj
L3V0aWwvU3RyaW5nVXRpbHMuY3BwCitAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0YXRpYyBpbnQgaXNz
cGFjZV9jKGNoYXIgYykKKyAKKyBzdGQ6OnN0cmluZyYgU3RyaW5nVXRpbHM6OlRyaW1MZWZ0KHN0
ZDo6c3RyaW5nICZzdHIpCisgeworLSAgc3RyLmVyYXNlKHN0ci5iZWdpbigpLCA6OmZpbmRfaWYo
c3RyLmJlZ2luKCksIHN0ci5lbmQoKSwgOjpub3QxKDo6cHRyX2Z1bihpc3NwYWNlX2MpKSkpOwor
KyAgc3RyLmVyYXNlKHN0ci5iZWdpbigpLCA6OmZpbmRfaWYoc3RyLmJlZ2luKCksIHN0ci5lbmQo
KSwgW10oY2hhciBzKSB7IHJldHVybiBpc3NwYWNlX2MocykgPT0gMDsgfSkpOworICAgcmV0dXJu
IHN0cjsKKyB9CisgCitAQCAtNDY2LDcgKzQ2Niw3IEBAIHN0ZDo6c3RyaW5nJiBTdHJpbmdVdGls
czo6VHJpbUxlZnQoc3RkOjpzdHJpbmcgJnN0ciwgY29uc3QgY2hhciogY29uc3QgY2hhcnMpCisg
Cisgc3RkOjpzdHJpbmcmIFN0cmluZ1V0aWxzOjpUcmltUmlnaHQoc3RkOjpzdHJpbmcgJnN0cikK
KyB7CistICBzdHIuZXJhc2UoOjpmaW5kX2lmKHN0ci5yYmVnaW4oKSwgc3RyLnJlbmQoKSwgOjpu
b3QxKDo6cHRyX2Z1bihpc3NwYWNlX2MpKSkuYmFzZSgpLCBzdHIuZW5kKCkpOworKyAgc3RyLmVy
YXNlKDo6ZmluZF9pZihzdHIucmJlZ2luKCksIHN0ci5yZW5kKCksIFtdKGNoYXIgcykgeyByZXR1
cm4gaXNzcGFjZV9jKHMpID09IDA7IH0pLmJhc2UoKSwgc3RyLmVuZCgpKTsKKyAgIHJldHVybiBz
dHI7CisgfQorIApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZv
cm0vcDhwbGF0Zm9ybV9naXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcDhwbGF0Zm9y
bS9wOHBsYXRmb3JtX2dpdC5iYgppbmRleCBiYjk1NzRmZWIuLmRiMDgyZDE1NCAxMDA2NDQKLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybV9naXQuYmIK
KysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3A4cGxhdGZvcm0vcDhwbGF0Zm9ybV9naXQu
YmIKQEAgLTQsMTAgKzQsMjIgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2xpYmNlYy5wdWxzZS1laWdo
dC5jb20vIgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vc3JjL29zLmg7bWQ1PTc1MjU1NWZhOTRlODIwMDVkNDVmZDIwMWZlZTViZDMzIgog
Ci1QViA9ICIyLjEuMC4xK2dpdCR7U1JDUFZ9IgotCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vUHVsc2UtRWlnaHQvcGxhdGZvcm0uZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMi
Ci1TUkNSRVYgPSAiYTdjZDBkNTc4MGVkODBhNGU3MDQ4MGQxNjUwNzQ5ZjI5ZThhMWZiMiIKK1BW
ID0gIjgiCisKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9QdWxzZS1FaWdodC9wbGF0Zm9y
bS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGZpbGU6Ly8w
MDAxLVVwZGF0ZS1SRUFETUUubWQtd2l0aC1iYXNpYy1idWlsZC1pbnN0cnVjdGlvbnMucGF0Y2gg
XAorICAgICAgICAgICBmaWxlOi8vMDAwMi1yZWZlcmVuY2Utc3VibW9kdWxlLXZpYS1odHRwcy1p
bnN0ZWFkLW9mLWdpdC1zc2gtdG8tLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDMtcDgt
cGxhdGZvcm0tY29uZmlnLWZpeC1sb29rdXAtcGF0aHMucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAwNC1GaXgtV2luNjQtY29tcGlsZS13YXJuaW5ncy5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly8wMDA1LUZpeC1DRXZlbnQtYXV0by1yZXNldC1iZWhhdmlvdXItaW4tY2FzZS1vZi1icm9h
ZGNhc3QucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNi1maXhlZC1kb24tdC1pbmNsdWRl
LXRpbWV1dGlscy1kZWZpbmVzLXdoZW4tYnVpbGRpbmctLnBhdGNoIFwKKyAgICAgICAgICAgZmls
ZTovLzAwMDctY2hhbmdlZC1idWlsZC13aXRoLXZzMjAxOS4taW5jbHVkZS1wZGItZmlsZXMuLXN1
cHBvci5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA4LWNoYW5nZWQtdXNlLXVwZGF0ZWQt
c3VwcG9ydC1zY3JpcHRzLWZvci12czIwMTkucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAw
OS1jaGFuZ2VkLWRlZmF1bHQtdG8tdnMyMDE5LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MTAtYnVpbGQtd2l0aC12czIwMTktYW5kLWFsc28taW5jbHVkZS1wZGItZmlsZXMucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vMDAxMS1TdHJpbmdVdGlscy1maXgtYnVpbGQtd2l0aC1zdGQtYy0x
Ny5wYXRjaCBcCisgICAgICAgICAgICIKK1NSQ1JFViA9ICIyZDkwZjk4NjIwZTI1ZjQ3NzAyYzll
ODQ4MzgwYzBkOTNmMjk0NjJiIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIK
Cg==

--===============7635195225286736034==--

