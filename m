Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CA84372718
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 09:47:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56523100"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2015 17:43:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0N9kL8D007361
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 17:46:21 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 23 Jan 2015 17:47:00 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jan 2015 17:46:16 +0800
Message-ID: <1422006376-4509-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH v2] opensc: add new recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 09:47:25 -0000
Content-Type: text/plain

OpenSC provides a set of libraries and utilities to work with smart cards.
Its main focus is on cards that support cryptographic operations,
and facilitate their use in security applications such as authentication,
mail encryption and digital signatures.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/opensc/opensc_0.14.0.bb | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc_0.14.0.bb

diff --git a/meta-oe/recipes-support/opensc/opensc_0.14.0.bb b/meta-oe/recipes-support/opensc/opensc_0.14.0.bb
new file mode 100644
index 0000000..bdb8d23
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc_0.14.0.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Smart card library and applications"
+DESCRIPTION = "OpenSC is a tool for accessing smart card devices. Basic \
+functionality (e.g. SELECT FILE, READ BINARY) should work on any ISO \
+7816-4 compatible smart card. Encryption and decryption using private \
+keys on the smart card is possible with PKCS \
+such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten \
+eID cards have also been confirmed to work."
+
+HOMEPAGE = "https://github.com/OpenSC/OpenSC/wiki"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
+SRC_URI[md5sum] = "1ee31dc2e89860458fd984e0cac9795e"
+SRC_URI[sha256sum] = "ffe8bcc704f2ab9a05c6781bc815f00eaf75cba0a1bd21e3142b9194a7bed5c9"
+
+S = "${WORKDIR}/OpenSC-${PV}"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+inherit autotools pkgconfig
+DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
+
+EXTRA_OECONF = " \
+    --disable-static \
+    --enable-openct \
+    --disable-pcsc \
+    --disable-ctapi \
+    --enable-doc \
+"
+EXTRA_OEMAKE = "DESTDIR=${D}"
+
+RDEPENDS_${PN} = "readline"
+
+FILES_${PN} += "\
+    ${libdir}/opensc-pkcs11.so \
+    ${libdir}/onepin-opensc-pkcs11.so \
+    ${libdir}/pkcs11-spy.so \
+"
+FILES_${PN}-dev += "\
+    ${libdir}/pkcs11/opensc-pkcs11.so \
+    ${libdir}/pkcs11/onepin-opensc-pkcs11.so \
+    ${libdir}/pkcs11/pkcs11-spy.so \
+"
-- 
1.8.4.2


