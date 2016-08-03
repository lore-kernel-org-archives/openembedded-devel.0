Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EFA3C60853
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 12:10:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2016 05:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1018886347"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2016 05:10:51 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 75A776A4006
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 05:10:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Aug 2016 15:10:24 +0300
Message-Id: <1470226224-13589-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] pointercal: move recipe to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2016 12:10:51 -0000

xtscal is being replaced with xinput-calibrator in oe-core
and that made pointercal redundant. So, move it from oe-core to
meta-oe.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-graphics/pointercal/pointercal/COPYING |   2 ++
 .../pointercal/pointercal/pointercal               |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 +
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 +
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 +
 .../pointercal/pointercal/qemumips/pointercal      |   1 +
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 0 -> 36 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 +
 .../pointercal/pointercal/qemux86/pointercal       |   1 +
 .../recipes-graphics/pointercal/pointercal_0.0.bb  |  22 +++++++++++++++++++++
 10 files changed, 30 insertions(+)
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/COPYING
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemuppc/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal
 create mode 100644 meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb

diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/COPYING b/meta-gpe/recipes-graphics/pointercal/pointercal/COPYING
new file mode 100644
index 0000000..63f5293
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/COPYING
@@ -0,0 +1,2 @@
+This is a blank COPYING file, and should be filled in by original author in future.
+
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/pointercal
new file mode 100644
index 0000000..e69de29
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarm/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv6/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuarmv7/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemumips/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemuppc/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemuppc/pointercal
new file mode 100644
index 0000000000000000000000000000000000000000..c2d6e37bf0c0d956ba17ba9955613c4cee5a147a
GIT binary patch
literal 36
mcmXpsFt#*Q&;=n=3lPgl!O+0i%uK=9!qiZ~%+%D_i~#_8+XjmO

literal 0
HcmV?d00001

diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/pointercal
new file mode 100644
index 0000000..640053d
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86-64/pointercal
@@ -0,0 +1 @@
+1280 0 1002 0 960 328 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal
new file mode 100644
index 0000000..640053d
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal/qemux86/pointercal
@@ -0,0 +1 @@
+1280 0 1002 0 960 328 65536
diff --git a/meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb b/meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb
new file mode 100644
index 0000000..df735a5
--- /dev/null
+++ b/meta-gpe/recipes-graphics/pointercal/pointercal_0.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Touchscreen calibration data"
+SECTION = "base"
+PR = "r11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
+
+SRC_URI = "file://pointercal \
+           file://COPYING"
+
+S = "${WORKDIR}"
+
+do_install() {
+	# Only install file if it has a contents
+	if [ -s ${S}/pointercal ]; then
+	        install -d ${D}${sysconfdir}/
+	        install -m 0644 ${S}/pointercal ${D}${sysconfdir}/
+	fi
+}
+
+ALLOW_EMPTY_${PN} = "1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INHIBIT_DEFAULT_DEPS = "1"
-- 
2.4.0


