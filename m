Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C305A65C93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 12:42:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,772,1400018400"; d="scan'208";a="55832589"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 31 Jul 2014 14:42:47 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 31 Jul 2014 14:42:47 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Thu, 31 Jul 2014 14:42:46 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Jul 2014 14:42:39 +0200
Message-ID: <1406810559-10578-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <20140731100745.GW16445@jama>
References: <20140731100745.GW16445@jama>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] jq: upgrade to 1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 12:42:49 -0000
Content-Type: text/plain

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../jq/files/automake-once-fix.patch               | 29 ----------------------
 .../recipes-devtools/jq/{jq_1.3.bb => jq_1.4.bb}   |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
 rename meta-oe/recipes-devtools/jq/{jq_1.3.bb => jq_1.4.bb} (79%)

diff --git a/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch b/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
deleted file mode 100644
index 0a1d1a2..0000000
--- a/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Applied
-https://github.com/stedolan/jq/commit/f0d1c39b5bbb4ccc517773eb635ba7f38ec7da1a
-
-Fixes build with automake-1.14
-
-diff --git a/configure.ac b/configure.ac
-index 76a49a9..d6d2d38 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,7 @@ AC_INIT([jq], [1.3], [mu@netsoc.tcd.ie],
- dnl Created autoconf implementation thompson@dtosolutions, 26NOV12
- AC_PREREQ([2.61])
- AC_CONFIG_AUX_DIR([config])
--AM_INIT_AUTOMAKE([parallel-tests foreign])
-+AM_INIT_AUTOMAKE([parallel-tests foreign -Wall])
- AM_SILENT_RULES([yes])
- AC_PROG_CC
- AC_PROG_CC_STDC
-@@ -66,7 +66,6 @@ AC_SUBST([BUNDLER], ["$bundle_cmd"])
- 
- dnl AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_HEADERS(config.h)
--AM_INIT_AUTOMAKE([-Wall])
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
- 
--- 
-1.8.5.4
-
diff --git a/meta-oe/recipes-devtools/jq/jq_1.3.bb b/meta-oe/recipes-devtools/jq/jq_1.4.bb
similarity index 79%
rename from meta-oe/recipes-devtools/jq/jq_1.3.bb
rename to meta-oe/recipes-devtools/jq/jq_1.4.bb
index c58b472..6e50803 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.3.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.4.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=244a1fb9cf472474a062d67069dec653"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://stedolan.github.io/${BPN}/download/source/${BP}.tar.gz \
-           file://automake-once-fix.patch \
 "
-SRC_URI[md5sum] = "26081b05d22525eca5cbdd8f9f4db17d"
-SRC_URI[sha256sum] = "623f23c36abfc1d96d85020cf421b56f90a229d566f26a4a0d3e8536244bfed7"
+SRC_URI[md5sum] = "e3c75a4f805bb5342c9f4b3603fb248f"
+SRC_URI[sha256sum] = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d"
 
 inherit autotools
 
-- 
2.0.0


