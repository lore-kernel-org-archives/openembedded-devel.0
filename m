Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0A18B65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=tFFdbcxBqvj+za54hdqYtGvMgJqvsJwiUPfB9KpH2dg=; 
	b=f5OkhKOTekTrJZjgknwsEhCAEs2tTyaeU7mOS93LfUT2oWDpfVoMxRzHtd1QKXmgQty2jcPPctZcDcvK9dtMdwF06ZAnUzwLF/wzuf631aeOPapQcBgHndTgVVNZg6+r0iMY0oaIsAmSOUI7FfI1BWRC12luBVPLb/9OjDpZH7MiuYXn0qimzXw2DiBlsnWeJunrJB4EIpy03pw3Jc62CFPLDtJTHScAgprWBdqqHbijqXiD05L6lQftl27AhGEc3taTx5AK4kZ8l0p8QuFS4IlDCLB15L8nZywoZoOeuLTPbIMqZhwZ52J0h9ljaPz5pNReLroC5G02NuqLVCsHDg==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1htTH4-0001lC-N2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 10:50:54 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:50:26 +0200
Message-Id: <20190802085032.32687-4-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190802085032.32687-1-psaavedra@igalia.com>
References: <20190802085032.32687-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v6 04/10] ibus-pinyin: add ibus-pinyin recipe
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
X-List-Received-Date: Fri, 02 Aug 2019 08:50:54 -0000

PinYin engine for IBus.

Requires: pyzy

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb

diff --git a/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb b/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
new file mode 100644
index 000000000..a91ed33cb
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "PinYin engine for IBus."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+SECTION = "inputmethods"
+
+SRC_URI = "https://github.com/ibus/${PN}/archive/${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "9a794c76f3e8fa888c7a0a097de2ebf0"
+SRC_URI[sha256sum] = "79fc51517ab8dec696cbbbca9526459b59f4eb045492ea88e5f9e01160b905db"
+
+inherit distro_features_check autotools lib_package
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = "ibus enchant hunspell pyzy pyxdg"
+DEPENDS_append_class-target = " intltool-native glib-2.0-native"
+RDEPENDS_${PN} += " ibus enchant hunspell pyzy pyxdg"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF += "--disable-static \
+           --disable-boost \
+"
+
+FILES_${PN} += "${datadir}/ibus/component/pinyin.xml \
+"
+
+do_configure_prepend() {
+    export PYTHON=python3
+}
-- 
2.11.0


