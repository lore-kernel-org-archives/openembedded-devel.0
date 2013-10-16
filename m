Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC9C6D140
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:45:59 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Wed, 16 Oct 2013
	12:46:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Oct 2013 12:45:53 +0200
Message-ID: <727ee4f43f7202f10c64cbffc5bd2ff6f965a3aa.1381920288.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1381920288.git.anders@chargestorm.se>
References: <cover.1381920288.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 2/2] ktap: add initial recipe
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
X-List-Received-Date: Wed, 16 Oct 2013 10:46:00 -0000
Content-Type: text/plain

Ktap is a new scripting dynamic tracing tool for Linux.

From kernel v3.13 it'll live inside the kernel tree, but for earlier kernels,
this recipe will be usefull.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb | 19 +++++++++++++++++++
 meta-oe/recipes-kernel/ktap/ktap.inc           | 11 +++++++++++
 meta-oe/recipes-kernel/ktap/ktap_0.3.bb        | 17 +++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb

diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb b/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
new file mode 100644
index 0000000..12167ea
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
@@ -0,0 +1,19 @@
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require ktap.inc
+
+DESCRIPTION = "KTAP is a scripting dynamic tracing tool for Linux"
+
+inherit module
+
+# Only build the module
+MAKE_TARGETS = "mod"
+
+# Kernel module packages MUST begin with 'kernel-module-', otherwise
+# multilib image generation can fail.
+#
+# The following line is only necessary if the recipe name does not begin
+# with kernel-module-.
+#
+PKG_${PN} = "kernel-module-${PN}"
+
diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
new file mode 100644
index 0000000..7fde165
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -0,0 +1,11 @@
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+HOMEPAGE = "http://www.ktap.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL;md5=eb723b61539feef013de476e68b5c50a"
+
+SRCREV = "6a5100b77321ce5792dfea34fa500ea537b1858c"
+SRC_URI = "git://github.com/ktap/ktap.git"
+
+S = "${WORKDIR}/git"
+
diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.3.bb b/meta-oe/recipes-kernel/ktap/ktap_0.3.bb
new file mode 100644
index 0000000..f5dd62f
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktap/ktap_0.3.bb
@@ -0,0 +1,17 @@
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require ktap.inc
+
+SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
+DEPENDS = "ktap-module"
+
+# Only build the userspace app
+EXTRA_OEMAKE = "ktap"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/ktap ${D}${bindir}/
+}
+
+RDEPENDS_${PN} = "kernel-module-ktapvm"
+
-- 
1.8.4.rc3


