Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 867F465EB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:12:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1042,1389740400"; d="scan'208";a="51109909"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 13 May 2014 10:12:27 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 13 May 2014 10:12:27 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 13 May 2014 10:12:26 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 May 2014 10:12:34 +0200
Message-ID: <1399968754-14711-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] jq: add new recipe for version 1.3
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
X-List-Received-Date: Tue, 13 May 2014 08:12:28 -0000
Content-Type: text/plain

jq is like sed but for JSON data. It's a very useful tool with no dependency.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../jq/files/automake-once-fix.patch               | 29 ++++++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.3.bb              | 23 +++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq_1.3.bb

diff --git a/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch b/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
new file mode 100644
index 0000000..0a1d1a2
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Applied
+https://github.com/stedolan/jq/commit/f0d1c39b5bbb4ccc517773eb635ba7f38ec7da1a
+
+Fixes build with automake-1.14
+
+diff --git a/configure.ac b/configure.ac
+index 76a49a9..d6d2d38 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,7 +4,7 @@ AC_INIT([jq], [1.3], [mu@netsoc.tcd.ie],
+ dnl Created autoconf implementation thompson@dtosolutions, 26NOV12
+ AC_PREREQ([2.61])
+ AC_CONFIG_AUX_DIR([config])
+-AM_INIT_AUTOMAKE([parallel-tests foreign])
++AM_INIT_AUTOMAKE([parallel-tests foreign -Wall])
+ AM_SILENT_RULES([yes])
+ AC_PROG_CC
+ AC_PROG_CC_STDC
+@@ -66,7 +66,6 @@ AC_SUBST([BUNDLER], ["$bundle_cmd"])
+ 
+ dnl AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_HEADERS(config.h)
+-AM_INIT_AUTOMAKE([-Wall])
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+ 
+-- 
+1.8.5.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.3.bb b/meta-oe/recipes-devtools/jq/jq_1.3.bb
new file mode 100644
index 0000000..c58b472
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq_1.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Lightweight and flexible command-line JSON processor"
+DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
+               filter and map and transform structured data with the same \
+               ease that sed, awk, grep and friends let you play with text."
+HOMEPAGE = "http://stedolan.github.io/jq/"
+BUGTRACKER = "https://github.com/stedolan/jq/issues"
+SECTION = "utils"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=244a1fb9cf472474a062d67069dec653"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://stedolan.github.io/${BPN}/download/source/${BP}.tar.gz \
+           file://automake-once-fix.patch \
+"
+SRC_URI[md5sum] = "26081b05d22525eca5cbdd8f9f4db17d"
+SRC_URI[sha256sum] = "623f23c36abfc1d96d85020cf421b56f90a229d566f26a4a0d3e8536244bfed7"
+
+inherit autotools
+
+# Don't build documentation (generation requires ruby)
+EXTRA_OECONF = "--disable-docs"
-- 
1.8.5.4


