Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F72B6D9A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:24:17 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2013 17:23:54 +0000
Message-Id: <1384363435-25984-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4.2
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 1/2] libgc: initial add 7.2
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
X-List-Received-Date: Wed, 13 Nov 2013 17:24:18 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/libgc/libgc_7.2d.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgc/libgc_7.2d.bb

diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
new file mode 100644
index 0000000..b472a5d
--- /dev/null
+++ b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Garbage Collection Library"
+DESCRIPTION = "The GC library provides a garbage collector for C and C++."
+HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
+
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://doc/README;beginline=1;endline=37;md5=9f4fd307082acf7a8af3e3897245163b  \
+                    file://README.QUICK;beginline=1;endline=23;md5=293ea42f3f606426deefadd5dd8ddd15 \
+"
+
+SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "91340b28c61753a789eb6077675d87d2"
+SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b511c5e"
+
+S = "${WORKDIR}/gc-7.2"
+
+inherit autotools
+
+PACKAGES =+ "${PN}-docs"
+FILES_${PN}-docs = "/usr/share/gc"
-- 
1.8.4.2


