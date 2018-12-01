Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 46B416D75E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=tFFdbcxBqvj+za54hdqYtGvMgJqvsJwiUPfB9KpH2dg=; 
	b=EnIPGwD6t/39KbGD0s0V/Fn0ELdfS+qDVsNaY62+Gjs9NJv9xA6Q0YjZe9Eg+oUqdXUBTK+DGX5oX4J+ER25Yax6DsbRuNS8rZbsyQtRr3/D5d+8wJSt16Zin9niHcLboctD6qkzRDarpShMQ9N9gtZZQV8OrvYemxCMXZz1XZXeCBv8IJm84tDDQCjUEOLBIS/fy6tNvpxpUH9ql04AGXsaydTINCADMAShF/9HQ630e/R44bCSPsy0kl/Rz+me8jtpS179wJBfz8KwwAlSNsZf7JFL9rDkhW/j7sga+zvmZ0f49KBXI5w+v4JgT4wcnSub+egt+1YxUSRnjV0B3g==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTAdg-0001Ej-Rs
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:09:16 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:06:34 +0100
Message-Id: <7b97fcb5f473bf0c4ab6128825981b0959c593b2.1543690801.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543690801.git.psaavedra@igalia.com>
References: <cover.1543690801.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v2 5/7] ibus-pinyin: add ibus-pinyin recipe
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
X-List-Received-Date: Sat, 01 Dec 2018 19:09:16 -0000

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


