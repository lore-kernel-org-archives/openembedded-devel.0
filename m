Return-Path: <frederic.paut@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 90DB6610FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 15:02:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Oct 2013 08:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1019,1371106800"; d="scan'208";a="404266023"
Received: from fpaut-mobl2.mp.intel.com ([10.237.24.36])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2013 08:02:00 -0700
From: Frederic PAUT <frederic.paut@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Oct 2013 17:02:00 +0200
Message-Id: <1380726120-29331-1-git-send-email-frederic.paut@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] cloudeebus recipe (v0.6.0)
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
X-List-Received-Date: Wed, 02 Oct 2013 15:02:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cloudeebus, D-Bus for the cloud, is a component that provides
D-Bus proxies for JavaScript. Unlike a web runtime, it doesn’t
rely on any custom web browser API, but on HTML5 WebSockets and
python D-Bus bindings.
Cloudeebus can be used as a web API fast prototyping tool.
---
 .../recipes-devtools/python/cloudeebus_0.6.0.bb    |   42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/cloudeebus_0.6.0.bb

diff --git a/meta-oe/recipes-devtools/python/cloudeebus_0.6.0.bb b/meta-oe/recipes-devtools/python/cloudeebus_0.6.0.bb
new file mode 100644
index 0000000..0bb3668
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/cloudeebus_0.6.0.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "A component which enables calling DBus methods and registering on DBus signals from Javascript"
+HOMEPAGE = "https://github.com/01org/cloudeebus"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+DEPENDS += " python"
+
+SRC_URI = "\
+  git://github.com/01org/cloudeebus.git;protocol=http;branch=master \
+"
+SRCREV = "b5cc957eeabfe98cb996baf8e5a0ac848993c3d4"
+
+DEPENDS_${PN} = "python python-setuptools"
+RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
+
+
+S = "${WORKDIR}/git"
+
+inherit distutils 
+
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --single-version-externally-managed \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
+
+do_install_prepend() {
+  install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
+}
+
+do_install() {
+
+  distutils_do_install
+
+  install -d ${D}${datadir}/doc/${BPN}/
+  install -m 0644 ${S}/README.md ${D}${datadir}/doc/${BPN}/
+}
+
+FILES_${PN} += "${datadir}/${BPN}"
+FILES_${PN} += "${sysconfdir}/dbus-1/system.d/org.cloudeebus.conf"
+
-- 
1.7.10.4


