Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D323665D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 10:05:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9OA58CG002292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 03:05:08 -0700 (PDT)
Received: from pek-lpgtest9.wrs.com (128.224.153.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 24 Oct 2014 03:05:07 -0700
From: Hongjun Yang <Hongjun.Yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Oct 2014 18:05:04 +0800
Message-ID: <1414145104-32486-1-git-send-email-Hongjun.Yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] sharutils: Add new package
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
X-List-Received-Date: Fri, 24 Oct 2014 10:05:09 -0000
Content-Type: text/plain

From: "Hongjun.Yang" <hongjun.yang@windriver.com>

Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
---
 .../sharutils-4.14/fix-for-cross-compiling.patch   | 29 ++++++++++++++++++++++
 .../recipes-support/sharutils/sharutils_4.14.bb    | 18 ++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils_4.14.bb

diff --git a/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch b/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
new file mode 100644
index 0000000..86a7da6
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
@@ -0,0 +1,29 @@
+From 990234af84a5399017d1c4fe03c5c756a8e51e23 Mon Sep 17 00:00:00 2001
+From: Hongjun Yang <Hongjun.Yang@windriver.com>
+Date: Tue, 20 Aug 2013 09:41:43 +0800
+Subject: [PATCH] fix cross compiling issue
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 6ee98e0..8067f54 100755
+--- a/configure
++++ b/configure
+@@ -26965,7 +26965,7 @@ fi
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-- 
+1.8.1.4
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
new file mode 100644
index 0000000..49981e7
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
@@ -0,0 +1,18 @@
+SUMMARY = "This is the set of GNU shar utilities."
+HOMEPAGE = "http://www.gnu.org/software/sharutils/"
+SECTION = "console/utils"
+LICENSE="GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit gettext autotools-brokensep
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/sharutils/sharutils-4.14.tar.gz \
+	   file://fix-for-cross-compiling.patch \
+	  "
+
+SRC_URI[md5sum] = "5686c11131b4c4c0841f8f3ef34d136a"
+SRC_URI[sha256sum] = "90f5107c167cfd1b299bb211828d2586471087863dbed698f53109cd5f717208"
+
+do_configure () {
+	oe_runconf
+}
-- 
1.9.1


