Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79207C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:43:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.6176.1659447813792759652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ApAlj5Yn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447812; i=@fujitsu.com;
	bh=2Uku2Xddj3Ui7g0EbpWdqP9bZCcudvSLsXHBFjX2y28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ApAlj5YnRvibJ2SYijw+E6/RGwrF9KkPJqGzHUbS3myZBsGh8uNnADB0r0fOhILty
	 pkr6ioUChcrE3RllrnGTda7xmTWeQcwc7OqumEjI6OrSoDc3UEimS7Fv5kWecCtLs0
	 11GQhC2zQZHGmiEIvveBIuV73dQM9xWoj5H9ggGhs7jnE5CSXue6JMga3Glkh/Ocxj
	 ydOWGh9YaWSh1DMDeK+eHKv873/VBespF5AfCBg3RGxZsZN6aXeFXk2lU6ZJZuC0Fh
	 F7oGnAOM1ASHdBYsMhdKE31ezuir+uL0okb6YUe6+bGM8oPxzEmAZSOW6k+aEmt0CZ
	 JwbQodxmA1mvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRWlGSWpSXmKPExsViZ8MxSZdZ62W
  Swf99WhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bmZTeYCvaoVCz5tpO9gfGnQhcjF4eQwBNG
  ibXHDzJBONeZJNq/n4dydjNKbH56kL2LkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF797w
  GqEBewk+lZMZQSxWYDi544vAqvnFXCSmP36PlhcQkBBYsrD90C9HBycAs4Sn/rtQcJCQCUdD5
  sZIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SirKTM8oyU3MzNE1NDDQNTQ01TUBsgz1Eqt0E/VSS3XLU4tLdIHc8mK91OJiveLK3OSc
  FL281JJNjMAgTilmSd3B2Nf3U+8QoyQHk5Ior5ziyyQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  ry3VIFygkWp6akVaZk5wIiCSUtw8CiJ8J7VAErzFhck5hZnpkOkTjF6c3w4dGUvM8fVKyBy6u
  x/+5k5loPJmV/bDjBzbNrXdYBZiCUvPy9VSpx3OcgIAZARGaV5cAtgieESo6yUMC8jAwODEE9
  BalFuZgmq/CtGcQ5GJWHeAyBTeDLzSuDueAV0IhPQiTpcL0BOLElESEk1MB1Sf3wtUH7jZMXJ
  wSs1z0k9W8Et9ueS3CyV00wtZU1VojHpMzSmrDZ65rtD74Wd0CUfId9J6y/cPyt8/eSPzX+rj
  O52KGVsPtMufsnzq8DvNXdd1hu1LFpbHtmi2pu17krXTev3M28El3r1JGydvLt40ospzMkLmr
  hsilJLPjz9GPnEWT80S1fvV+q6ndfluytcDH+7XlkuFqgeJn37QblUlsKW+x1xQZekzO0DRB8
  szJ94UsHxdumkRLto/jZOj1fM79VXTpTSVDBZxL7Td+skrvcawYyagvN2OFR8fTunKHZh5LLt
  vot3BXUezXD7r3LnzGxG7tMH5yqvYHRdbZrB+l91pidPW2il23FTcSWW4oxEQy3mouJEABprG
  FCHAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1659447811!129578!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30780 invoked from network); 2 Aug 2022 13:43:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:43:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4A0531000E9
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3D41F100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:43:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.12.0 -> 1.12.1
Date: Tue, 2 Aug 2022 21:43:11 +0800
Message-ID: <1659447791-24448-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
References: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:43:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98097

The following patches removed since they're included in 1.12.1:
0001-fix-unbundled-PCRE2-dependency.patch
0002-remove-providers-unitialization.patch

Changelog:
==========
- GH #3677 PocoFoundationConfig.cmake should now check for PCRE2
- GH #3686 SIGSEGV in OSSL_PROVIDER_unload with static OpenSSL3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-fix-unbundled-PCRE2-dependency.patch | 25 -------------
 ...0002-remove-providers-unitialization.patch | 35 -------------------
 .../poco/{poco_1.12.0.bb => poco_1.12.1.bb}   | 11 +++---
 3 files changed, 4 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
 delete mode 100644 meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
 rename meta-oe/recipes-support/poco/{poco_1.12.0.bb => poco_1.12.1.bb} (94%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
deleted file mode 100644
index 1a9d23cee4..0000000000
--- a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f049898c8bf058ed187de8e5fab20abeaab1f3b6 Mon Sep 17 00:00:00 2001
-From: Alex Fabijanic <alex@pocoproject.org>
-Date: Sat, 9 Jul 2022 19:13:04 +0200
-Subject: [PATCH] fix(cmake): PocoFoundationConfig.cmake should now check for
- PCRE2 #3677
-
-Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3677]
-
----
- Foundation/cmake/PocoFoundationConfig.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Foundation/cmake/PocoFoundationConfig.cmake b/Foundation/cmake/PocoFoundationConfig.cmake
-index 46c2d3fc00..82c5788940 100644
---- a/Foundation/cmake/PocoFoundationConfig.cmake
-+++ b/Foundation/cmake/PocoFoundationConfig.cmake
-@@ -2,7 +2,7 @@ if(@POCO_UNBUNDLED@)
- 	include(CMakeFindDependencyMacro)
- 	list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
- 	find_dependency(ZLIB REQUIRED)
--	find_dependency(PCRE REQUIRED)
-+	find_dependency(PCRE2 REQUIRED)
- endif()
- 
- include("${CMAKE_CURRENT_LIST_DIR}/PocoFoundationTargets.cmake")
diff --git a/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch b/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
deleted file mode 100644
index 7d24b79f14..0000000000
--- a/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c976c32e5249cb8a2433e7abfa095c1fe8dc4f8e Mon Sep 17 00:00:00 2001
-From: Alex Fabijanic <alex@pocoproject.org>
-Date: Wed, 13 Jul 2022 12:53:52 +0200
-Subject: [PATCH] fix(OpenSSLInitializer): remove providers unitialization
- #3562 #3567
-
-Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3562]
-
----
- Crypto/src/OpenSSLInitializer.cpp | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/Crypto/src/OpenSSLInitializer.cpp b/Crypto/src/OpenSSLInitializer.cpp
-index 4678d22299..c537c3f9c2 100644
---- a/Crypto/src/OpenSSLInitializer.cpp
-+++ b/Crypto/src/OpenSSLInitializer.cpp
-@@ -157,18 +157,6 @@ void OpenSSLInitializer::uninitialize()
- #endif
- 		delete [] _mutexes;
- #endif
--
--#if OPENSSL_VERSION_NUMBER >= 0x30000000L
--		OSSL_PROVIDER* provider = nullptr;
--		if ((provider = _defaultProvider.exchange(nullptr)))
--		{
--			OSSL_PROVIDER_unload(provider);
--		}
--		if ((provider = _legacyProvider.exchange(nullptr)))
--		{
--			OSSL_PROVIDER_unload(provider);
--		}
--#endif
- 	}
- }
- 
diff --git a/meta-oe/recipes-support/poco/poco_1.12.0.bb b/meta-oe/recipes-support/poco/poco_1.12.1.bb
similarity index 94%
rename from meta-oe/recipes-support/poco/poco_1.12.0.bb
rename to meta-oe/recipes-support/poco/poco_1.12.1.bb
index c3b52c8885..daf9ec00b6 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.1.bb
@@ -8,13 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = " \
-    git://github.com/pocoproject/poco.git;branch=master;protocol=https \
-    file://0001-fix-unbundled-PCRE2-dependency.patch \
-    file://0002-remove-providers-unitialization.patch \
-    file://run-ptest \
-   "
-SRCREV = "4ba8595ed83841d1fa240716b5652adc3772c36b"
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+           file://run-ptest \
+           "
+SRCREV = "92fac970d4b6161fd58335bfe1492689ba5a80a3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


