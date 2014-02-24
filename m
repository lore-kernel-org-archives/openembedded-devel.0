Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 543436F2D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:45:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,535,1389740400"; d="scan'208";a="41669354"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 24 Feb 2014 15:45:52 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 24 Feb 2014 15:45:52 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 24 Feb 2014 15:45:52 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Feb 2014 15:40:41 +0100
Message-ID: <1393252841-1470-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xdelta3: add new recipe for version 3.0.8
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
X-List-Received-Date: Mon, 24 Feb 2014 14:45:52 -0000
Content-Type: text/plain

Useful command line tool for handling binary diff.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../xdelta/files/compilation-fix.patch             | 29 ++++++++++++++++++++++
 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb    | 15 +++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdelta/files/compilation-fix.patch
 create mode 100644 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb

diff --git a/meta-oe/recipes-support/xdelta/files/compilation-fix.patch b/meta-oe/recipes-support/xdelta/files/compilation-fix.patch
new file mode 100644
index 0000000..377a043
--- /dev/null
+++ b/meta-oe/recipes-support/xdelta/files/compilation-fix.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+http://code.google.com/p/xdelta/issues/detail?id=174
+
+Compilation fix:
+<code>
+| testing/regtest.cc:763:3: error: no matching function for call to 'max(xoff_t, size_t&)'
+</code>
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ testing/regtest.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testing/regtest.cc b/testing/regtest.cc
+index 12b712e..b63a1f9 100644
+--- a/testing/regtest.cc
++++ b/testing/regtest.cc
+@@ -12,7 +12,7 @@ public:
+     Options() : encode_srcwin_maxsz(1<<20), 
+ 		block_size(Constants::BLOCK_SIZE),
+ 		size_known(false) { }
+-    size_t encode_srcwin_maxsz;
++    xoff_t encode_srcwin_maxsz;
+     size_t block_size;
+     bool size_known;
+   };
+-- 
+1.8.5.4
+
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
new file mode 100644
index 0000000..16a72ee
--- /dev/null
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Xdelta is a tool for differential compression"
+DESCRIPTION = "Open-source binary diff, differential compression tools, \
+               VCDIFF (RFC 3284) delta compression."
+HOMEPAGE = "http://xdelta.org/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "http://xdelta.googlecode.com/files/${BPN}-${PV}.tar.xz \
+           file://compilation-fix.patch"
+SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3"
+SRC_URI[sha256sum] = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
+
+inherit autotools
-- 
1.8.5.4


