Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7F96E688
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 06:48:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7S6m9JR006164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 23:48:10 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 27 Aug 2017 23:48:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 14:47:24 +0800
Message-ID: <20170828064724.17260-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] multipath-tools: add rdepends on bash
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
X-List-Received-Date: Mon, 28 Aug 2017 06:48:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add rdepends on bash to fix QA Issue:
| ERROR: multipath-tools-0.7.1-r0 do_package_qa: QA Issue: /sbin/mpathconf
  contained in package multipath-tools requires /bin/bash, but no
  providers found in RDEPENDS_multipath-tools? [file-rdeps]

* Combine multiple assignments for PACKAGES and RDPENDS into one,
  re-order and re-group for related variables.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../multipath-tools/multipath-tools_0.7.1.bb       | 23 ++++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
index 610ba7a94..ccd08575e 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
@@ -92,22 +92,19 @@ do_install() {
     ${D}${sysconfdir}/multipath.conf.example
 }
 
-FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
-
-PACKAGES =+ "${PN}-libs"
-FILES_${PN}-libs = "${base_libdir}/lib*.so.* \
-                    ${base_libdir}/multipath/lib*.so*"
-RDEPENDS_${PN} += "${PN}-libs"
-
-PROVIDES += "device-mapper-multipath"
-RPROVIDES_${PN} += "device-mapper-multipath"
-RPROVIDES_${PN}-libs += "device-mapper-multipath-libs"
+PACKAGES =+ "${PN}-libs kpartx"
 
 FILES_${PN}-dev += "${base_libdir}/pkgconfig"
-
-PACKAGES =+ "kpartx"
+FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
+FILES_${PN}-libs = "${base_libdir}/lib*.so.* \
+                    ${base_libdir}/multipath/lib*.so* \
+                   "
 FILES_kpartx = "${base_sbindir}/kpartx \
                 ${nonarch_libdir}/udev/kpartx_id \
                "
 
-RDEPENDS_${PN} += "kpartx"
+RDEPENDS_${PN} += "${PN}-libs kpartx bash"
+
+PROVIDES += "device-mapper-multipath"
+RPROVIDES_${PN} += "device-mapper-multipath"
+RPROVIDES_${PN}-libs += "device-mapper-multipath-libs"
-- 
2.11.0


