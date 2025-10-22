Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A748FCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4817.1761099762506531900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aGyTdsXp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099764; x=1792635764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZfz7sN9mUEKS6BKRczSKN8NtNvBjtPbX4Kends/A00=;
  b=aGyTdsXp9ZBOqmi077eEqbp/m3RsH/2gows/9KJzleQzfv7MNJD6hTuz
   TmxBWVnLscpPGpxlshJ7UGZ+tdEOJgUewUlrwHFkEBFmb3TpC9leu8JgU
   qUWIOtpMOPlmVZnvGJH/ylrVYmhXAdkDk7mUQvTBrE5FhIbp3nc3fXYjs
   BJ5ypFwE0mzsht6Dq+f8ZL+jDUdj3Ck/JJW+13sRFk6ZURQuVCe6T3Mu2
   2DYV19w9MSDvHzh/IHCfCsz3QKiZ3NaPyRYvcmFOrGUhLhkIEIE29Do5L
   QUevO8Tfn3SqgRZ3AjhmxdSROqvJwXDa6sw6+VQd8h89Awlvl3w/EjKr/
   A==;
X-CSE-ConnectionGUID: ViGWt4KZSSOcFOHUj8r/NA==
X-CSE-MsgGUID: ka8iRsiaTXS9WbcD+rjE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216694839"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216694839"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:42 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9C68A42A33F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5338A1C0017C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BE9FE82C0E0;
	Wed, 22 Oct 2025 02:22:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 04/29] freediameter: upgrade 1.5.0 -> 1.6.0
Date: Wed, 22 Oct 2025 10:22:00 +0800
Message-ID: <20251022022227.226-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120851

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fixes-for-gcc-15.patch
0002-allow-build-with-cmake-4.patch
removed since they're included in 1.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../files/0001-fixes-for-gcc-15.patch         | 69 ----------------
 .../files/0002-allow-build-with-cmake-4.patch | 81 -------------------
 ...iameter_1.5.0.bb => freediameter_1.6.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 153 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch
 delete mode 100644 meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch
 rename meta-networking/recipes-protocols/freediameter/{freediameter_1.5.0.bb => freediameter_1.6.0.bb} (97%)

diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch b/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch
deleted file mode 100644
index 41aeec4ee0..0000000000
--- a/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a54f10082f819dadfa6931166e71edffadb565dd Mon Sep 17 00:00:00 2001
-From: Victor Seva <vseva@debian.org>
-Date: Sun, 23 Feb 2025 13:38:48 +0100
-Subject: [PATCH] fixes for gcc-15
-
-fixes #72
-
-Upstream-Status: Backport [https://github.com/freeDiameter/freeDiameter/commit/a54f10082f819dadfa6931166e71edffadb565dd]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- libfdcore/sctp.c | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/libfdcore/sctp.c b/libfdcore/sctp.c
-index 95e822e..a4a7f40 100644
---- a/libfdcore/sctp.c
-+++ b/libfdcore/sctp.c
-@@ -532,29 +532,29 @@ static int fd_setsockopt_prebind(int sk)
- 	/* SCTP_EXPLICIT_EOR: we assume implicit EOR in freeDiameter, so let's ensure this is known by the stack */
- 	#ifdef SCTP_EXPLICIT_EOR
- 	{
--		int bool;
-+		int _bool;
- 		
- 		if (TRACE_BOOL(ANNOYING)) {
- 			sz = sizeof(bool);
- 			/* Read socket defaults */
--			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, &sz)  );
--			if (sz != sizeof(bool))
-+			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, &sz)  );
-+			if (sz != sizeof(_bool))
- 			{
--				TRACE_DEBUG(INFO, "Invalid size of socket option: %d / %d", sz, (socklen_t)sizeof(bool));
-+				TRACE_DEBUG(INFO, "Invalid size of socket option: %d / %d", sz, (socklen_t)sizeof(_bool));
- 				return ENOTSUP;
- 			}
--			fd_log_debug( "Def SCTP_EXPLICIT_EOR value : %s", bool ? "true" : "false");
-+			fd_log_debug( "Def SCTP_EXPLICIT_EOR value : %s", _bool ? "true" : "false");
- 		}
- 
--		bool = 0;
-+		_bool = 0;
- 		
- 		/* Set the option to the socket */
--		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, sizeof(bool))  );
-+		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, sizeof(_bool))  );
- 		
- 		if (TRACE_BOOL(ANNOYING)) {
- 			/* Check new values */
--			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, &sz)  );
--			fd_log_debug( "New SCTP_EXPLICIT_EOR value : %s", bool ? "true" : "false");
-+			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, &sz)  );
-+			fd_log_debug( "New SCTP_EXPLICIT_EOR value : %s", _bool ? "true" : "false");
- 		}
- 	}
- 	#else /* SCTP_EXPLICIT_EOR */
-@@ -619,10 +619,10 @@ static int fd_setsockopt_prebind(int sk)
- 	
- 	#ifdef SCTP_RECVRCVINFO /* Replaces SCTP_SNDRCV */
- 	{
--		int bool = 1;
-+		int _bool = 1;
- 		
- 		/* Set the option to the socket */
--		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_RECVRCVINFO, &bool, sizeof(bool))  );
-+		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_RECVRCVINFO, &_bool, sizeof(_bool))  );
- 		
- 	}
- 	#else /* SCTP_RECVRCVINFO */
diff --git a/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch b/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index 89a215d975..0000000000
--- a/meta-networking/recipes-protocols/freediameter/files/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From a96a8f8debb457fd5bdcd34f005670678870ec70 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 20:58:10 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:24 (CMAKE_MINIMUM_REQUIRED):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/freeDiameter/freeDiameter/commit/45106adf3bf4192b274ef6c5536200a0e19c84f2]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt            | 6 +++---
- libfdcore/CMakeLists.txt  | 2 +-
- libfdproto/CMakeLists.txt | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 870e1ef..f1e6dc5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,8 @@
- # This file is the source for generating the Makefile for the project, using cmake tool (cmake.org)
- 
-+# CMake version
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.10)
-+
- # Name of the project
- PROJECT("freeDiameter")
- 
-@@ -20,9 +23,6 @@ SET(FD_PROJECT_VERSION_API 7)
- # The test framework, using CTest and CDash.
- INCLUDE(CTest)
- 
--# CMake version
--CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
--
- # Location of additional CMake modules
- SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
-diff --git a/libfdcore/CMakeLists.txt b/libfdcore/CMakeLists.txt
-index b1bc0f1..4fefcb7 100644
---- a/libfdcore/CMakeLists.txt
-+++ b/libfdcore/CMakeLists.txt
-@@ -2,7 +2,7 @@
- Project("freeDiameter core library" C)
- 
- # Configuration for newer cmake
--cmake_policy(VERSION 2.8.12)
-+cmake_policy(VERSION 3.10)
- 
- # Configuration parser
- BISON_FILE(fdd.y)
-diff --git a/libfdproto/CMakeLists.txt b/libfdproto/CMakeLists.txt
-index c7164fb..4cedf65 100644
---- a/libfdproto/CMakeLists.txt
-+++ b/libfdproto/CMakeLists.txt
-@@ -2,7 +2,7 @@
- Project("libfdproto" C)
- 
- # Configuration for newer cmake
--cmake_policy(VERSION 2.8.12)
-+cmake_policy(VERSION 3.10)
- 
- # List of source files for the library
- SET(LFDPROTO_SRC
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
similarity index 97%
rename from meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
rename to meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
index 31ac1fb9b7..887ca5c4a3 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 fd_pkgname = "freeDiameter"
 
 PV .= "+git"
-SRCREV = "f9f1e464e6c675d222b3be4cab9c13408d544c83"
+SRCREV = "5403feb543ed5e720165a4b3a3b4a365cdee28fb"
 SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=master \
     file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch \
     file://run-ptest \
@@ -24,8 +24,6 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
     file://install_test.patch \
     file://0001-tests-use-EXTENSIONS_DIR.patch \
     file://0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch \
-    file://0001-fixes-for-gcc-15.patch \
-    file://0002-allow-build-with-cmake-4.patch \
     "
 
 LICENSE = "BSD-3-Clause"
-- 
2.43.0


