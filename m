Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id CC3F761CE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:58:04 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id B07EC60045;
	Fri, 13 Mar 2020 19:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584125885;
	bh=Gl17ShifQKuulzB/06knMo9hTGDBrneccZLR1BTfS5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DV0lyTMgnEHDeiK3GgntYr4JWKJHcV3tNansVT88zrcvqjC/dr5h+z2ShcF9sueDG
	y6eeac7YVXwidvAGNik7rLnqMGqmK97K6gsuiKVpjgTKtHI4aR+lb4+ugkXkwjc+IM
	24564xEQfQY86y9cqM1Ger/d6sO39YUcXImOOW3LAVrOcliu4IKbl65/jY5Jdg1Bnd
	i7b5+7kmG7ecO/xnWa8ytscZ8r3/2xhbBT0KefpCcidZLPoo2Wwx2CDYAzxnNrzdv1
	iYDRfZtN9Zt73urn0LG1ULZ8/Hv4hsYSHGcXs+xROWDGcCiL1ydpdXFGxhrC/jVkZW
	ZX56XabcwlIPA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2020 19:57:50 +0100
Message-Id: <1584125871-11210-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
References: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] iwd: upgrade 1.4 -> 1.5
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
X-List-Received-Date: Fri, 13 Mar 2020 18:58:05 -0000

Remove patch already in version

Fixes:

ver 1.5:
	Fix issue with handling missing NEW_WIPHY events.
	Fix issue with interface creation and NEW_WIPHY events.
	Fix issue with handling LastConnectedTime property change.
	Fix issue with PEAPv0 interoperability with Windows.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../iwd/0001-build-Support-missing-rawmemchr.patch | 62 ----------------------
 .../iwd/{iwd_1.4.bb => iwd_1.5.bb}                 | 10 ++--
 2 files changed, 4 insertions(+), 68 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-build-Support-missing-rawmemchr.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.4.bb => iwd_1.5.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Support-missing-rawmemchr.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Support-missing-rawmemchr.patch
deleted file mode 100644
index 733f5fe..0000000
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Support-missing-rawmemchr.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fcdddf2b726439e049992878f90da607414a1a47 Mon Sep 17 00:00:00 2001
-From: Denis Kenzior <denkenz@gmail.com>
-Date: Mon, 3 Feb 2020 11:54:28 -0600
-Subject: [PATCH] build: Support missing rawmemchr
-
-rawmemchr is a GNU extension in glibc that does not exist in musl.
-
-Upstream-status: Backport of https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=fcdddf2b726439e049992878f90da607414a1a47
-
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
-
----
- configure.ac  |  1 +
- src/missing.h | 10 ++++++++++
- src/wiphy.c   |  1 +
- 3 files changed, 12 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 5ae1401cae17..2d373a47ba68 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -128,6 +128,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
- 			[Directory for Ethernet daemon storage files])
- 
- AC_CHECK_FUNCS(explicit_bzero)
-+AC_CHECK_FUNCS(rawmemchr)
- 
- AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
- 
-diff --git a/src/missing.h b/src/missing.h
-index 2bb210ae3c81..2cc80aee5d38 100644
---- a/src/missing.h
-+++ b/src/missing.h
-@@ -27,3 +27,13 @@ static inline void explicit_bzero(void *s, size_t n)
-         __asm__ __volatile__ ("" : : "r"(s) : "memory");
- }
- #endif
-+
-+#ifndef HAVE_RAWMEMCHR
-+static inline void *rawmemchr(const void *s, int c)
-+{
-+_Pragma("GCC diagnostic push")
-+_Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
-+	return memchr(s, c, (size_t) -1);
-+_Pragma("GCC diagnostic pop")
-+}
-+#endif
-diff --git a/src/wiphy.c b/src/wiphy.c
-index 1da479db2dab..511bb27f52b8 100644
---- a/src/wiphy.c
-+++ b/src/wiphy.c
-@@ -37,6 +37,7 @@
- 
- #include "linux/nl80211.h"
- 
-+#include "src/missing.h"
- #include "src/iwd.h"
- #include "src/module.h"
- #include "src/ie.h"
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.5.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.5.bb
index f758781..4d4c699 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.5.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "ell"
 
-SRC_URI = " \
-    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
-    file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
-    file://0001-build-Support-missing-rawmemchr.patch \
-"
-SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
+SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+           file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
+           "
+SRCREV = "1ee7b985aaa294447d073bfe1242744784278a8e"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.7.4


