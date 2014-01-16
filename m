Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 420EA6E20F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:55:49 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:52:39 +0000
Message-Id: <1389880359-18841-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.5.2
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCH] libsoc: update to 0.5
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
X-List-Received-Date: Thu, 16 Jan 2014 13:55:49 -0000

From: Jack Mitchell <jack@embed.me.uk>

---
 meta-oe/recipes-support/libsoc/libsoc_0.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.5.bb

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.5.bb b/meta-oe/recipes-support/libsoc/libsoc_0.5.bb
new file mode 100644
index 0000000..c381799
--- /dev/null
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.5.bb
@@ -0,0 +1,14 @@
+SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
+HOMEPAGE = "https://github.com/jackmitch/libsoc"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
+
+inherit autotools
+
+SRCREV = "e5846ca199316603f0fec0748c57a781ced46950"
+SRC_URI = "git://github.com/jackmitch/libsoc.git"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "libgcc"
-- 
1.8.5.2


