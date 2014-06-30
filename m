Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 405FD6028A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 12:32:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,575,1400018400"; d="scan'208";a="54080791"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 30 Jun 2014 14:32:28 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Mon, 30 Jun 2014 14:32:28 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Mon, 30 Jun 2014 14:32:27 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 14:32:26 +0200
Message-ID: <1404131546-10511-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xmlstarlet: fix S!=B failure
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
X-List-Received-Date: Mon, 30 Jun 2014 12:32:32 -0000
Content-Type: text/plain

Extra change: use ${BP}

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 ...001-usage2c.awk-fix-wrong-basename-regexp.patch | 37 ++++++++++++++++++++++
 .../recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb |  5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xmlstarlet/files/0001-usage2c.awk-fix-wrong-basename-regexp.patch

diff --git a/meta-oe/recipes-support/xmlstarlet/files/0001-usage2c.awk-fix-wrong-basename-regexp.patch b/meta-oe/recipes-support/xmlstarlet/files/0001-usage2c.awk-fix-wrong-basename-regexp.patch
new file mode 100644
index 0000000..24b187f
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/files/0001-usage2c.awk-fix-wrong-basename-regexp.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Submitted [sourceforge]
+
+From 75d789d0ea9716c9a9ae72f42a2fcfa907cf4a12 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Mon, 30 Jun 2014 13:52:25 +0200
+Subject: [PATCH] usage2c.awk: fix wrong basename regexp
+
+Previously not matching with filename argument with absolute path.
+
+Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
+---
+ usage2c.awk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/usage2c.awk b/usage2c.awk
+index 94b897a..9aea212 100755
+--- a/usage2c.awk
++++ b/usage2c.awk
+@@ -6,13 +6,13 @@ BEGIN {
+ }
+ 
+ # text in src/foo-bar.txt results in
+-#   static const char foo_text[] = {
++#   static const char foo_bar[] = {
+ #     't', 'h', 'e', ' ', 't', 'e', 'x', 't', ...
+ #   }
+ length(command_name) == 0 {
+     command_name = FILENAME;
+     sub(/\.txt$/, "", command_name);
+-    sub(/^([^\/]+\/)*/, "", command_name);
++    sub(/^.*\//, "", command_name);
+     gsub(/-/, "_", command_name);
+     printf("static const char %s[] = {\n", command_name);
+     progs = 0;
+-- 
+2.0.0
+
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
index 770ccab..d9a03c6 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
@@ -12,8 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c04760d09e8b0fe73283d0cc9e8bea53"
 
 DEPENDS = "libxml2 libxslt"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BPN}-${PV}.tar.gz \
-           file://configure.ac.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
+           file://configure.ac.patch \
+           file://0001-usage2c.awk-fix-wrong-basename-regexp.patch"
 SRC_URI[md5sum] = "0c6db295d0cf9ff0d439edb755b7e8f6"
 SRC_URI[sha256sum] = "47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba"
 
-- 
2.0.0


