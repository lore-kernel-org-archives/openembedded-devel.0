Return-Path: <net147@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 02D09601DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 12:17:25 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so11223233pdd.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TdcFU+B8CsoqMxiqf6amAMG40iAuAFwa5NunElPBo98=;
	b=F4MdIDo7kK66dNe1jlITNKyD+FOeBR7s+547fWqwRGx0ZEbV4zWM0PBIA48o2xC/wy
	a3hY7e7l6lo9I3a+vpYwk97y4OOQh386rwUsHZ8Oxqh1WryhTMNFUjNkbbM0Bm3AhFz8
	MSxPSFJBJ0LZ2vVTDRDTUXnQplwNAKgz83RLXpId5JWuuSRkCiKxucmOTh237dkG/flL
	PYN47l17SAinwboLpFfdqgffc7dVTd/Ns3Z9E55AoM1bDAaxMuJ+1YQh2yKEL7B5xFUb
	1K3ZRIHU/nejIaudlT1h8fVwcmmm1sDnk1LW7FkYXgWwXYYBrUKCw8JjS6koFCuPaxUa
	MOKg==
X-Received: by 10.66.87.5 with SMTP id t5mr2543316paz.169.1371125847157;
	Thu, 13 Jun 2013 05:17:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id l4sm23222356pbo.6.2013.06.13.05.17.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 05:17:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 22:31:45 +1000
Message-Id: <1371126705-15849-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] llvm3.2: replace LLVM_RELEASE with PV
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
X-List-Received-Date: Thu, 13 Jun 2013 12:17:26 -0000

Setting LLVM_RELEASE is redundant as the version can be retrieved from
PV instead.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
index 673892f..71a53c1 100644
--- a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
@@ -18,8 +18,7 @@ inherit autotools perlnative pythonnative
 
 LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-LLVM_RELEASE = "3.2"
-LLVM_DIR = "llvm${LLVM_RELEASE}"
+LLVM_DIR = "llvm${PV}"
 
 EXTRA_OECONF += "--disable-assertions \
                  --enable-debug-runtime \
@@ -92,7 +91,7 @@ do_install() {
 
 	install -d ${D}${libdir}/${LLVM_DIR}
 	mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-	ln -s ${LLVM_DIR}/libLLVM-${LLVM_RELEASE}.so ${D}${libdir}/libLLVM-${LLVM_RELEASE}.so
+	ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
 
 	install -d ${D}${docdir}/${LLVM_DIR}
 	mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
@@ -102,5 +101,5 @@ SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${LLVM_RELEASE}
+	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
-- 
1.8.3


