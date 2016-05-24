Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1E7673169
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498889"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:56 +0300
Message-Id: <16a409eae0c906d31b18cc657006d74ca41ebc66.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/8] python-dbus: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:56:08 -0000

oe-core provides only python3-dbus now, so python-dbus
still has to be provided for a few recipes in meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/python/python-dbus_1.2.0.bb   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-dbus_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.0.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.0.bb
new file mode 100644
index 0000000..95ba920
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Python bindings for the DBus inter-process communication system"
+SECTION = "devel/python"
+HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0b83047ce9e948b67c0facc5f233476a"
+DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b09cd2d1a057cc432ce944de3fc06bf7"
+SRC_URI[sha256sum] = "e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df"
+S = "${WORKDIR}/dbus-python-${PV}"
+
+inherit distutils-base autotools pkgconfig
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python3-docutils-native"
+PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python3-docutils-native python3-epydoc-native"
+
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
+RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
+
+FILES_${PN}-dev += "${libdir}/pkgconfig"
+
+do_install_append() {
+    # Remove files that clash with python3-dbus; their content is same
+    rm ${D}${includedir}/dbus-1.0/dbus/dbus-python.h ${D}${libdir}/pkgconfig/dbus-python.pc
+}
-- 
2.8.1


