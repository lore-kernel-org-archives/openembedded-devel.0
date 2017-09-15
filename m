Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 597AD72F63
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 09:34:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8F9Y5xF026449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 02:34:05 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 15 Sep 2017 02:34:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Sep 2017 17:21:08 +0800
Message-ID: <20170915092108.24077-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libp11: 0.4.0 -> 0.4.7
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
X-List-Received-Date: Fri, 15 Sep 2017 09:34:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade libp11 from 0.4.0 to 0.4.7.

* the parallel make issue has been fix in upstream, so remove
  restriction of parallel make
* update FILES

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libp11/{libp11_0.4.0.bb => libp11_0.4.7.bb}                | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.0.bb => libp11_0.4.7.bb} (63%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.0.bb b/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
similarity index 63%
rename from meta-oe/recipes-support/libp11/libp11_0.4.0.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.7.bb
index d88006c36..949c33752 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
@@ -9,16 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
+SRCREV = "64569a391897bd29c5060b19fa4613e619e59277"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-# Currently, Makefile dependencies are incorrectly defined which causes build errors
-# The number of jobs is high
-# See https://github.com/OpenSC/libp11/issues/94
-PARALLEL_MAKE = ""
 EXTRA_OECONF = "--disable-static"
 
 do_install_append () {
@@ -26,5 +22,5 @@ do_install_append () {
     rm -rf ${D}${docdir}/${BPN}
 }
 
-FILES_${PN} += "${libdir}/pkcs11${SOLIBS}"
-FILES_${PN}-dev += "${libdir}/pkcs11${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/engines/pkcs11.so"
+FILES_${PN}-dev += "${libdir}/engines/libpkcs11${SOLIBSDEV}"
-- 
2.14.1


