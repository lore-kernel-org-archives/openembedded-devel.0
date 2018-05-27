Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE2A874A35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:35:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40820671"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jun 2018 10:35:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B9574B41E79
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 10:35:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Thu, 7 Jun 2018 10:35:22 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 27 May 2018 14:38:49 -0700
Message-ID: <1527457129-5874-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 5B9574B41E79.AD433
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] engine-pkcs11: has been merged to libp11, so deleted.
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
X-List-Received-Date: Thu, 07 Jun 2018 02:35:26 -0000
Content-Type: text/plain

Reference to https://github.com/OpenSC/engine_pkcs11,there is no need to maitain this recipe.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../engine-pkcs11/engine-pkcs11_0.2.2.bb           | 31 ----------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb

diff --git a/meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb b/meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb
deleted file mode 100644
index bc79f35..0000000
--- a/meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "A PKCS"
-DESCRIPTION = "\
-Engine_pkcs11 is an implementation of an engine for OpenSSL. It can be \
-loaded using code, config file or command line and will pass any function \
-call by openssl to a PKCS cards and software for using smart cards in PKCS"
-HOMEPAGE = "https://github.com/OpenSC/engine_pkcs11"
-SECTION = "Development/Libraries"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;beginline=1;endline=26;md5=973a19f8a6105de047f2adfbbfc04c33"
-DEPENDS = "openssl libp11"
-
-SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
-SRCREV = "132fcf2c8b319f9f4b2ebdc8dcb54ff496dc0519"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "\
-    --disable-static \
-    --libdir ${libdir}/engines \
-"
-
-do_install_append () {
-    rm -f ${D}${libdir}/engines/libpkcs11.la
-}
-
-FILES_${PN} += "${libdir}/engines/libpkcs11${SOLIBSDEV}"
-FILES_${PN}-dbg += "${libdir}/engines/.debug/"
-
-RDEPENDS_${PN} += "openssl libp11 opensc"
-- 
1.9.1




