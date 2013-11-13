Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id AA24F6CF08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:40:10 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2013 17:39:58 +0000
Message-Id: <1384364398-26192-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4.2
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH] libsmi: initial add 0.4.8
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
X-List-Received-Date: Wed, 13 Nov 2013 17:40:10 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
new file mode 100644
index 0000000..30af2b0
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A Library to Access SMI MIB Information"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
+
+SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/libsmi-0.4.8.tar.gz"
+
+SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
+SRC_URI[sha256sum] = "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
+
+inherit autotools
+
+PACKAGES += "${PN}-mibs ${PN}-pibs"
+
+FILES_${PN}-mibs += "${datadir}/mibs"
+FILES_${PN}-pibs += "${datadir}/pibs"
-- 
1.8.4.2


