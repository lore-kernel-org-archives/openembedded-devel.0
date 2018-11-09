Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id F15116C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=skdyvrlTF40/wO6YbFg3Ruw7zs8w4eLNGkUXXQHcm38=; 
	b=RXz8kTu8T2Z67x2oLy2xU8s14Sl2ROlb8Y/4bh9p1GV5KtO3doh6GwJ3q7uWaIT3gfggZMdOxLNqSBxuSNdtpwcvX1uC5zcWI+v35FDSdOJB/mGG+WHk42OphfxtmEAQzQx0AZlUbbNBdeKKBhuGGYanozAgZMlE5C9+G5kgD3Um0SlCp32DU6/VguVveYCWN/Gqz0jhHrLLeZnnpDsRRjdlQUfXemuC7TN2qoe8JQ6aPiUD0wiexKWrXQnyOzPVQzBGwi24/Nn8mTUDze2Gq9FTuZXvxjiRLv042MZqsj7S9HFF3Xt08oqnDRrm8Z4jwAbZGDG5IKlVJnlEILsjeQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gL6NO-0003YN-LZ
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 13:59:06 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Nov 2018 13:58:56 +0100
Message-Id: <53128169505b79acee12bba4c31948e02cd2490f.1541767729.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1541767729.git.psaavedra@igalia.com>
References: <cover.1541767729.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH 4/6] ibus-pinyin: add ibus-pinyin recipe
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
X-List-Received-Date: Fri, 09 Nov 2018 13:14:39 -0000

PinYin engine for IBus.

Requires: pyzy
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


