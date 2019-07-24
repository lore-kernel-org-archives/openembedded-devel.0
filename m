Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 704017F1B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=cGD+oHMbpbnrAJlnJJ/mMzc5d1rrqK5eWO9nfP6sU0w=; 
	b=Fl0CXedidYTfA4mTzCWU6oSLVy2gsmVGtBiQ5pLpJPCsla/eA7vfR9hdit+SrbAf+onH7lWahYRtSSwgkzWrg1NLdSds6hxoCQmFBM3+YPEb30feRw3r+cCutew3f2wniUsWewZkV1bouq/q1v9uiL8gp0USdB1f8pBcCUMue6lkUlt2RU454ws75tYJzDuZooV94tyX5DPefTe/wGbsJ5P56fU6sFzs4A7SG6hzEAjEyYp0gD/c8JmDH7dBYvWugUimsV79YTFQgnj2SBaq52CNxU2MafFsmMtgTZI7vlFY0XwRhz0sf0KYo1/Tbhr4n6rGCRQzDIZTFL0/yOcYcQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1hqIbr-0003aA-I5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 16:51:15 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 16:50:58 +0200
Message-Id: <20190724145100.88293-5-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724145100.88293-1-psaavedra@igalia.com>
References: <20190724145100.88293-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v5 5/7] ibus-table: add ibus-table recipe
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
X-List-Received-Date: Wed, 24 Jul 2019 14:59:01 -0000

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb

diff --git a/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb b/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
new file mode 100644
index 000000000..faa331031
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "framework for table based input methods using IBus"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SECTION = "inputmethods"
+
+SRC_URI = "https://github.com/kaio/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "1f7b3fab7271e409c9ef4c43f5c3fc78"
+SRC_URI[sha256sum] = "017bcd1cb9f5a79df46d1e4ac28f166ce2338938a2037ebe86783da0abca0c24"
+
+inherit distro_features_check autotools gettext lib_package gsettings
+
+DEPENDS = " ibus"
+RDEPENDS_${PN} += " ibus"
+
+BBCLASSEXTEND = "native"
+
+do_configure_prepend() {
+    export PYTHON=python3
+}
+
+FILES_${PN} += "${datadir}/ibus/component/pinyin.xml \
+  ${datadir}/metainfo \
+  ${datadir}/ibus \
+  ${datadir}/glib-2.0 \
+  ${datadir}/metainfo/ibus-table.appdata.xml \
+  ${datadir}/ibus/component/table.xml \
+  ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.engine.table.gschema.xml \
+"
-- 
2.11.0


