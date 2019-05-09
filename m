Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 66E0C7DFBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450J634H2nz6Y
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 18:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557417787;
	bh=h9gQXhCEC+kG2snlNWGaEULuL/YqnlEETBpfxcRCf+M=;
	h=From:To:Subject:Date:From;
	b=YJZVH94EUBhaXTzYyhpBBZ/W4S4xtZ5LVh93bshvPxmIlVRsFj2o8WvTvyuemYAEE
	jxeZxSShYRsf4z52iTzTZfX1FlARzRBEUzsLxa7ck1EyFVZFNzoBooDnUW6fmvn2aq
	U5vYJoTVHqnpnOjEstEOOfOCMMelxaukS6hbbV3AoXr6aVbQ7SmByWGFYQg7asFAmY
	AebGB04UB1qc/FiX6yscw9MCPwwIQVBYiIKTFZsZKLusRZiEmUZ6az60zpakG96jsf
	9d2/dGY499xPynA7SgcrfXg3VBsJ2oPrD/ANLLhpOnAtxgw3kivdLF/N4ynx3ha4Qm
	jva0UdBS70KUfgG+yJYJSEfoHgWjiDT+Qw9SCcElsrdJdMO6j+GZEMqCaPO2Z4mC85
	i17MsdzBCkCQKqJQbZ/BpcfI5B0AomIw2eY0totLHvUtcg4I4F4kf1/xl03AnGOjBe
	79vZYieffYGK+dItnZj5OoX9m2AGZyTzKSKRVx3fXkVktUY/YyC9gQcoSWY14X08ii
	/xnZSpH1H4ZLJ5wsJOM+PxSswGdXYrZGrOkFjjiysVbv2Ut8YDG1gz460Aa94c9vdj
	X1Sx+cn+Jz8SUzc0+CLOhGgXj1nA9tLpvqUvzWwZyoizIm639n9jVH02Sk7IEoVJYj
	pEj/u7e2zICb7djJ9rf+pN3I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 19:03:04 +0300
Message-Id: <20190509160306.857-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] postfix: Upgrade 3.4.1 -> 3.4.5
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
X-List-Received-Date: Thu, 09 May 2019 16:03:07 -0000

Remove patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../postfix/files/linux_5.x.patch             | 27 -------------------
 .../{postfix_3.4.1.bb => postfix_3.4.5.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.1.bb => postfix_3.4.5.bb} (66%)

diff --git a/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch b/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
deleted file mode 100644
index fbb811c06..000000000
--- a/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Recognise kernel 5.x versioning scheme
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/makedefs
-+++ b/makedefs
-@@ -543,7 +543,7 @@ EOF
- 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
- 		: ${PLUGIN_LD="${CC-gcc} -shared"}
- 		;;
--  Linux.[34].*)	SYSTYPE=LINUX$RELEASE_MAJOR
-+  Linux.[345].*)	SYSTYPE=LINUX$RELEASE_MAJOR
- 		case "$CCARGS" in
- 		 *-DNO_DB*) ;;
- 		 *-DHAS_DB*) ;;
---- a/src/util/sys_defs.h
-+++ b/src/util/sys_defs.h
-@@ -749,7 +749,7 @@ extern int initgroups(const char *, int)
-  /*
-   * LINUX.
-   */
--#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4)
-+#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5)
- #define SUPPORTED
- #define UINT32_TYPE	unsigned int
- #define UINT16_TYPE	unsigned short
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
similarity index 66%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
index 73380d8c6..3ce805553 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
@@ -4,9 +4,8 @@ SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patc
             file://postfix-install.patch \
             file://icu-config.patch \
             file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-            file://linux_5.x.patch \
            "
-SRC_URI[md5sum] = "d292bb49a1c79ff6d2eb9c5e88c51425"
-SRC_URI[sha256sum] = "8c9763f7a8ec70d499257b7f25bb50e1f3da8a4c43e59826ba8a26c4a778d0ce"
+SRC_URI[md5sum] = "093109941095390562166de766d4720d"
+SRC_URI[sha256sum] = "8b2ba54f9d2a049582a0ed3ee2dbe96ba57e278feea9cb4f80e1a61844e6319f"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.1


