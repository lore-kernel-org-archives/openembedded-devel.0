Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12F8965D2C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 01:49:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3B1nNcW008894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 18:49:23 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 18:49:22 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 09:50:13 +0800
Message-ID: <1397181013-2452-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] bonnie++: update to version 1.03e
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
X-List-Received-Date: Fri, 11 Apr 2014 01:49:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
* use BPN in the file name in SRC_URI.
* install binaries in bindir and sbindir instead of base_bindir and base_sbindir.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{bonnie++_1.03c.bb => bonnie++_1.03e.bb}       |   22 +++++++++-----------
 1 file changed, 10 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03c.bb => bonnie++_1.03e.bb} (48%)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
similarity index 48%
rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
index bff0d72..828d762 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
@@ -1,13 +1,14 @@
 SUMMARY = "Tests large file IO and creation/deletion of small files"
 HOMEPAGE = "http://www.coker.com.au/bonnie++/"
+SECTION = "benchmark/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
 
-SRC_URI = "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
+SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
            file://gcc-4.3-fixes.patch \
 "
-SRC_URI[md5sum] = "77a1ba78f37bdd7f024b67e1e36ad151"
-SRC_URI[sha256sum] = "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac89396043b49612a26"
+SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
+SRC_URI[sha256sum] = "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
 
 inherit autotools
 
@@ -17,16 +18,13 @@ EXES = "bonnie++ zcav"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install () {
-    install -d ${D}/bin
-    install -d ${D}/sbin
-    install -m 0755 ${EXES} ${D}/sbin
-    install -m 0755 ${SCRIPTS} ${D}/bin
+    install -d ${D}/${bindir}
+    install -d ${D}/${sbindir}
+    install -m 0755 ${EXES} ${D}/${sbindir}
+    install -m 0755 ${SCRIPTS} ${D}/${bindir}
 }
 
 PACKAGES =+ "bonnie-scripts"
 
-FILES_${PN} = "${base_sbindir}"
-FILES_bonnie-scripts = "${base_bindir}"
-
-
-
+FILES_${PN} = "${sbindir}"
+FILES_bonnie-scripts = "${bindir}"
-- 
1.7.9.5


