Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 802936FF84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 02:00:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2212839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 10:00:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1618541890E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 09:59:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 09:59:54 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 17:59:53 -0800
Message-ID: <1451959193-25475-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451873454-5272-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1451873454-5272-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 1618541890E7.AD274
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] engine-pkcs11: 0.1.8 -> 0.2.0
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
X-List-Received-Date: Tue, 05 Jan 2016 02:00:18 -0000
Content-Type: text/plain

Upgrade engine-pkcs11 from 0.1.8 to 0.2.0.

1) Modify LIC_FILES_CHKSUM,since the LICENSE file has changed,and the LICENSE has also changed.
2) Fix error: QA Issue: engine-pkcs11: Files/directories were installed but not shipped in any package:
   /usr/lib/openssl/engines/libpkcs11.la
   /usr/lib/openssl/engines/libpkcs11.so

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{engine-pkcs11_0.1.8.bb => engine-pkcs11_0.2.0.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/engine-pkcs11/{engine-pkcs11_0.1.8.bb => engine-pkcs11_0.2.0.bb} (64%)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
similarity index 64%
rename from meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
rename to meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
index a511cfb..f2a2258 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
@@ -6,11 +6,11 @@ call by openssl to a PKCS cards and software for using smart cards in PKCS"
 HOMEPAGE = "https://github.com/OpenSC/engine_pkcs11"
 SECTION = "Development/Libraries"
 LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://doc/README;md5=d2ab6bf8854463fa6bf98f5bb6dfc47c"
+LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=973a19f8a6105de047f2adfbbfc04c33"
 DEPENDS = "openssl libp11"
 
-SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
-SRCREV = "bb775c32dba8cc4b4381a53da7ab5d7b22b7921d"
+SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git;protocol=http"
+SRCREV = "6909d6761c8820e1750fa0bf4fa8532c82f34e35"
 
 S = "${WORKDIR}/git"
 
@@ -22,8 +22,8 @@ EXTRA_OECONF = "\
 "
 
 do_install_append () {
-    rm -f ${D}${libdir}/openssl/engines/engine_pkcs11.la
+    rm -f ${D}${libdir}/openssl/engines/libpkcs11.la
 }
 
-FILES_${PN} += "${libdir}/openssl/engines/engine_pkcs11.so*"
+FILES_${PN} += "${libdir}/openssl/engines/libpkcs11.so*"
 FILES_${PN}-dbg += "${libdir}/openssl/engines/.debug/*"
-- 
1.9.1




