Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 140BD7E07C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYk1S9Rz7P
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489322;
	bh=PCtNeuhH0AJ+mOYaswQFGgiiSSa6JFjncvviNdZXwf0=;
	h=From:To:Subject:Date:From;
	b=Cz+3TOozU2ViWIVF1HJg8kD/7NIkrOu5PeHigIudRxF/7RByBg/ntXPdMjw+s339Q
	EXmQZbY412vWRYzfL+KtG3A0j+wQAxUs3LO+JewGBMpW8gEjzfUmt5IDaKvTT12UoN
	SdKviVsm4QI3X2XtfZppRhBYJKdPm3le4oQY3kMmKrwQY/KJPpLzTuIBkENZ3jYTxh
	T2GYGeB50T9Z9kcsOhpkxYgpIrKUMR+AKBplY0rdCetf/i5gG+PEImRMJ5FtdlrGVk
	HUAupnjmtr9LG2eZgLaMJkduDeD8wrw9+9MAY6tqEutHMO4z+un6/eYIBXhUlpihWm
	icvidOJuZeIqN7BIQAPRVPx4ZR8yITjyBUgmI3P+hALYR83pa+3AUswfXsOE1CRAHQ
	DEmKxpErGzoie/Mmxgfl19Xf+zHRz6Sf6JRRDhuHykU+3uFS8s9Q8du/E1xj1rvHuD
	KtC9g6U3nzmL9LWsQhj7RhZRrhByLBT7AfwWGj0sxAm48tPgrpv4cQX7uYo7rHKZGH
	hvlrYTkflbdWB2ACEbAS1NWQxLA8p98kIJN4Do+TW4xFOYAFtyaq/ctENUoIwxvFQb
	qnQRMbexgEVT64Ku+S0GNuNBG72DxqdeRqCXguacAchbXE8y6ziq6vohich2HS9NPc
	7/KwujFBRhMTcxnBd5LMMjWc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:15 +0300
Message-Id: <20190510115515.19491-19-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] catch2: Upgrade 2.6.1 -> 2.7.2
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
X-List-Received-Date: Fri, 10 May 2019 11:55:21 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{catch2_2.6.1.bb => catch2_2.7.2.bb}      |  5 ++-
 ...-Wdefaulted-function-deleted-warning.patch | 35 -------------------
 2 files changed, 2 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.6.1.bb => catch2_2.7.2.bb} (83%)
 delete mode 100644 meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch

diff --git a/meta-oe/recipes-test/catch2/catch2_2.6.1.bb b/meta-oe/recipes-test/catch2/catch2_2.7.2.bb
similarity index 83%
rename from meta-oe/recipes-test/catch2/catch2_2.6.1.bb
rename to meta-oe/recipes-test/catch2/catch2_2.7.2.bb
index 08d661640..b5c857329 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.6.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.7.2.bb
@@ -6,10 +6,9 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git \
-           file://0001-Fix-Wdefaulted-function-deleted-warning.patch \
           "
-# v2.6.1
-SRCREV = "dbbab8727c342733f75045483048cdcb52421e32"
+# v2.7.2
+SRCREV = "7c37501b070c0e9ea9cdedbeac2059f0a6b0a8ab"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch b/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch
deleted file mode 100644
index 555c71ad2..000000000
--- a/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a39e0eaa8318335260967ffd1d16388eb5a1d6d8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Feb 2019 12:57:00 -0800
-Subject: [PATCH] Fix -Wdefaulted-function-deleted warning
-
-Clang8 warns
-
-catch_interfaces_reporter.h:84:25: error: explicitly defaulted move assignment operator is implicitly deleted [-Werror,-Wdefaulted-function-deleted]
-|         AssertionStats& operator = ( AssertionStats && )     = default;
-|                         ^
-
-Upstream-Status: Submitted [https://github.com/catchorg/Catch2/pull/1537]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/internal/catch_interfaces_reporter.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/internal/catch_interfaces_reporter.h b/include/internal/catch_interfaces_reporter.h
-index 9d99c981..e5fbf8bb 100644
---- a/include/internal/catch_interfaces_reporter.h
-+++ b/include/internal/catch_interfaces_reporter.h
-@@ -80,8 +80,8 @@ namespace Catch {
- 
-         AssertionStats( AssertionStats const& )              = default;
-         AssertionStats( AssertionStats && )                  = default;
--        AssertionStats& operator = ( AssertionStats const& ) = default;
--        AssertionStats& operator = ( AssertionStats && )     = default;
-+        AssertionStats& operator = ( AssertionStats const& ) = delete;
-+        AssertionStats& operator = ( AssertionStats && )     = delete;
-         virtual ~AssertionStats();
- 
-         AssertionResult assertionResult;
--- 
-2.20.1
-
-- 
2.17.1


