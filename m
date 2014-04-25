Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C15CA65D31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:15:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 17:15:50 +0100
Message-Id: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.2
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 1/4] htop: upgrade to 1.0.3 and apply brokensep
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
X-List-Received-Date: Fri, 25 Apr 2014 16:15:57 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

- Upgrade to 1.0.3
- Fix broken configure by applying brokensep
- Update location of tarballs as latest is not available
  on sourceforge

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/htop/htop_1.0.2.bb | 19 -------------------
 meta-oe/recipes-support/htop/htop_1.0.3.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/htop/htop_1.0.2.bb
 create mode 100644 meta-oe/recipes-support/htop/htop_1.0.3.bb

diff --git a/meta-oe/recipes-support/htop/htop_1.0.2.bb b/meta-oe/recipes-support/htop/htop_1.0.2.bb
deleted file mode 100644
index 234978b..0000000
--- a/meta-oe/recipes-support/htop/htop_1.0.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "htop process monitor"
-HOMEPAGE = "http://htop.sf.net"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
-
-DEPENDS = "ncurses"
-RDEPENDS_${PN} = "ncurses-terminfo"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz"
-
-LDFLAGS_append_libc-uclibc = " -lubacktrace"
-
-inherit autotools
-
-SRC_URI[md5sum] = "0d01cca8df3349c74569cefebbd9919e"
-SRC_URI[sha256sum] = "ee60657b044ece0df096c053060df7abf3cce3a568ab34d260049e6a37ccd8a1"
-
diff --git a/meta-oe/recipes-support/htop/htop_1.0.3.bb b/meta-oe/recipes-support/htop/htop_1.0.3.bb
new file mode 100644
index 0000000..85b0923
--- /dev/null
+++ b/meta-oe/recipes-support/htop/htop_1.0.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "htop process monitor"
+HOMEPAGE = "http://hisham.hm/htop"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
+
+DEPENDS = "ncurses"
+RDEPENDS_${PN} = "ncurses-terminfo"
+
+SRC_URI = "http://hisham.hm/${BPN}/releases/${PV}/${BP}.tar.gz"
+
+LDFLAGS_append_libc-uclibc = " -lubacktrace"
+
+inherit autotools-brokensep
+
+SRC_URI[md5sum] = "e768b9b55c033d9c1dffda72db3a6ac7"
+SRC_URI[sha256sum] = "055c57927f75847fdc222b5258b079a9542811a9dcf5421c615c7e17f55d1829"
-- 
1.9.2


