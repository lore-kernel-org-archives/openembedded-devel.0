Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAC872623
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 03:32:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45308111"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 11:29:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH3VvXK009282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 11:31:57 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 11:32:32 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 11:32:13 +0800
Message-ID: <1418787133-32070-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] engine-pkcs11: Add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 03:32:32 -0000
Content-Type: text/plain

Engine_pkcs11 is an implementation of an engine for OpenSSL. It can be
loaded using code, config file or command line and will pass any function
call by openssl to a PKCS cards and software for using smart cards in PKCS

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../engine-pkcs11/engine-pkcs11_0.1.8.bb           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
new file mode 100644
index 0000000..d665242
--- /dev/null
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A PKCS"
+DESCRIPTION = "\
+Engine_pkcs11 is an implementation of an engine for OpenSSL. It can be \
+loaded using code, config file or command line and will pass any function \
+call by openssl to a PKCS cards and software for using smart cards in PKCS"
+HOMEPAGE = "https://github.com/OpenSC/engine_pkcs11"
+SECTION = "Development/Libraries"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://doc/README;md5=d2ab6bf8854463fa6bf98f5bb6dfc47c"
+DEPENDS = "openssl libp11"
+
+SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
+SRCREV = "bb775c32dba8cc4b4381a53da7ab5d7b22b7921d"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "\
+    --disable-static \
+    --libdir ${libdir}/openssl \
+"
+
+do_install_append () {
+    rm -f ${D}${libdir}/openssl/engines/engine_pkcs11.la
+}
+
+FILES_${PN} += "/usr/lib/openssl/engines/engine_pkcs11.so*"
+FILES_${PN}-dbg += "/usr/lib/openssl/engines/.debug/*"
-- 
1.8.3.1


