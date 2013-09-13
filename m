Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F188860EE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 22:15:48 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2013 23:15:32 +0100
Message-Id: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCHv5] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 22:15:50 -0000

From: Jack Mitchell <jack@embed.me.uk>

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 v4 -> v5
 - Moved RDEPENDS to below do_install

 v3 -> v4
 - Added libgcc in RDEPENDS

 v2 -> v3
 - Removed DEPENDS on libgcc
 - Removed autogen.sh pre-configure as was unneeded

 v1 -> v2
 -added signed-off-by

 meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.3.bb

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
new file mode 100644
index 0000000..1bf2782
--- /dev/null
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
+HOMEPAGE = "https://github.com/jackmitch/libsoc"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
+
+inherit autotools
+
+SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
+SRC_URI = "git://github.com/jackmitch/libsoc.git"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "libgcc"
-- 
1.8.4


