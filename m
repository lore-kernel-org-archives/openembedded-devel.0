Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 731C972201
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 02:11:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44314461"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2014 10:08:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB22BUXu019101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 10:11:30 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Dec 2014 10:11:54 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 10:11:04 +0800
Message-ID: <1417486264-1878-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] pkcs11-helper : add new recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 02:12:00 -0000
Content-Type: text/plain

PKCS#11 is a published standard. PKCS#11 is the de-facto standard
to access cryptographic devices.
pkcs11-helper is a library that simplifies the interaction with
PKCS#11 providers for end-user applications using a simple API
and optional OpenSSL engine.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../pkcs11-helper/pkcs11-helper_1.11.bb            | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb

diff --git a/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb b/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb
new file mode 100644
index 0000000..9d08d25
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A library for using PKCS"
+DESCRIPTION = "pkcs11-helper is a library that simplifies the interaction with PKCS \
+providers for end-user applications using a simple API and optional OpenSSL \
+engine. The library allows using multiple PKCS enumerating available token \
+certificates, or selecting a certificate directly by serialized id, handling \
+card removal and card insert events, handling card ie-insert to a different \
+slot, supporting session expiration and much more all using a simple API."
+
+HOMEPAGE = "git://github.com/OpenSC/pkcs11-helper.git"
+SECTION = "Development/Libraries"
+
+LICENSE = "GPLv2 BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4948810631bcac142af53d32df5b6ee1 \
+    file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
+    file://COPYING.BSD;md5=f79f90ea7a106796af80b5d05f1f8da1"
+
+SRC_URI = "git://github.com/OpenSC/pkcs11-helper.git"
+SRC_URI[md5sum] = "9f62af9f475901b89355266141306673"
+SRC_URI[sha256sum] = "494ec59c93e7c56c528f335d9353849e2e7c94a6b1b41c89604694e738113386"
+
+S = "${WORKDIR}/git"
+SRCREV = "e7adf8f35be232a4f04c53b4ac409be52792093e"
+
+DEPENDS = "zlib nettle gnutls gmp openssl"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " --disable-static --enable-doc "
-- 
1.8.4.2


