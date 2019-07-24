Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 839607F1B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=tFFdbcxBqvj+za54hdqYtGvMgJqvsJwiUPfB9KpH2dg=; 
	b=pnJW4WE3A/YKw6JNIkDQSmIvsms+iyxKIa4DR1SUJB+de5hRhOpJbyOrNZO8e0DHi+vdzXrNs3LUGAUOr1w6P4DS0bYVwAGbbaiE7naPgOc1k/Qz5GIf6IXYjYHFu9tyt7l5iQX8kDEbE4pRXgIIm3X3DY1kiojInhDItpvh9w35mR4aklOFfaipxhyhEzDWrcsN3/24+UAmnlWrK4P8kIcbUkMMnFAJ7bQ+I9JkOpJlBC81sqxaa12l7XFlZDBE0Cr5F4voHNqUyINRUrKWmLTwywaGFCS1XUfhmj/VQr0QOZejhRvDgJ9wTm6GTrY1gsXScy/rTYsOw1QKgAIYPA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1hqIbq-0003aA-S2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 16:51:14 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 16:50:57 +0200
Message-Id: <20190724145100.88293-4-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724145100.88293-1-psaavedra@igalia.com>
References: <20190724145100.88293-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v5 4/7] ibus-pinyin: add ibus-pinyin recipe
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
X-List-Received-Date: Wed, 24 Jul 2019 14:59:28 -0000

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


