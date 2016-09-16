Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B410731CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 11:19:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 16 Sep 2016 04:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="761927835"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2016 04:19:20 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 777536A4006
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 04:18:55 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2016 14:19:14 +0300
Message-Id: <1474024757-10162-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1474024757-10162-1-git-send-email-maxin.john@intel.com>
References: <1474024757-10162-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/4] pointercal: move recipe from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2016 11:19:20 -0000

Move pointercal recipe from oe-core layer.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-gpe/recipes-bsp/pointercal/pointercal/COPYING |   2 ++
 .../recipes-bsp/pointercal/pointercal/pointercal   |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 +
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 +
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 +
 .../pointercal/pointercal/qemumips/pointercal      |   1 +
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 0 -> 36 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 +
 .../pointercal/pointercal/qemux86/pointercal       |   1 +
 meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb  |  22 +++++++++++++++++++++
 10 files changed, 30 insertions(+)
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
 create mode 100644 meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb

diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/COPYING b/meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
new file mode 100644
index 0000000..63f5293
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/COPYING
@@ -0,0 +1,2 @@
+This is a blank COPYING file, and should be filled in by original author in future.
+
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/pointercal
new file mode 100644
index 0000000..e69de29
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
new file mode 100644
index 0000000..abd84ca
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemumips/pointercal
@@ -0,0 +1 @@
+8313 4 -8526 7 8334 -82604 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
new file mode 100644
index 0000000000000000000000000000000000000000..c2d6e37bf0c0d956ba17ba9955613c4cee5a147a
GIT binary patch
literal 36
mcmXpsFt#*Q&;=n=3lPgl!O+0i%uK=9!qiZ~%+%D_i~#_8+XjmO

literal 0
HcmV?d00001

diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
new file mode 100644
index 0000000..640053d
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
@@ -0,0 +1 @@
+1280 0 1002 0 960 328 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
new file mode 100644
index 0000000..640053d
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal/qemux86/pointercal
@@ -0,0 +1 @@
+1280 0 1002 0 960 328 65536
diff --git a/meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb
new file mode 100644
index 0000000..fcfd038
--- /dev/null
+++ b/meta-gpe/recipes-bsp/pointercal/pointercal_0.0.bb
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
+    # Only install file if it has a contents
+    if [ -s ${S}/pointercal ]; then
+        install -d ${D}${sysconfdir}/
+        install -m 0644 ${S}/pointercal ${D}${sysconfdir}/
+    fi
+}
+
+ALLOW_EMPTY_${PN} = "1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INHIBIT_DEFAULT_DEPS = "1"
-- 
2.4.0


