Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 912586D546
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=cGD+oHMbpbnrAJlnJJ/mMzc5d1rrqK5eWO9nfP6sU0w=; 
	b=emGA+6RblmIJsBLR14EMX4RGXaRhunNzyVHE6s8gM/YuRW5ThzrTHuiKv76nqXCZ7RvaqhZ6Ks8PaipsTzL3lJSLUcOE1ikPph8+Qv092cVdllbvBEdD7dkrjuZ0vU0HPxoMlha4/HfGQiQpZUPrt3ulpbePIf4Rd3v0Fzb1KUHbZhcODrVGMRdi3KXheBaw6Y1tq16uFENs4i69hkEG2sHyfGKrTXHViwHMl3jIW919PMja3O8l+NafLBLIJ04vcIztOLHmq3evOEmzLjbjFZEjkmBkV+Or5VDCT5dLnr635tFne4089umdHvhSDJD7u20JwxUpjKxtvlRylXp/vA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTBQB-000699-8P
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:59:23 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:59:15 +0100
Message-Id: <819c034981ec8a82600d767f34970cc27a73a8a4.1543694144.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543694144.git.psaavedra@igalia.com>
References: <cover.1543694144.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v3 6/7] ibus-table: add ibus-table recipe
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
X-List-Received-Date: Sat, 01 Dec 2018 19:59:24 -0000

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


