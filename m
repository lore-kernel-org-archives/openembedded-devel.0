Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 897A2601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:37:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ5bQNn009848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 21:37:26 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 21:37:25 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:37:20 +0800
Message-ID: <3584e12687e694948ee32c020cc2246e19376a76.1447910888.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447910888.git.jackie.huang@windriver.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/7 v2] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 19 Nov 2015 05:37:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
 - use ${SOLIBS} and ${SOLIBSDEV} instead of hardcoded suffix

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../talloc/{talloc_2.1.1.bb => talloc_2.1.3.bb}        | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/talloc/{talloc_2.1.1.bb => talloc_2.1.3.bb} (69%)

diff --git a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb b/meta-networking/recipes-support/talloc/talloc_2.1.3.bb
similarity index 69%
rename from meta-networking/recipes-support/talloc/talloc_2.1.1.bb
rename to meta-networking/recipes-support/talloc/talloc_2.1.3.bb
index 89c390f..83c8f8f 100644
--- a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-networking/recipes-support/talloc/talloc_2.1.3.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "5dffb86414218a91864ed4453ba9be07"
-SRC_URI[sha256sum] = "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
+SRC_URI[md5sum] = "3e285de2228ae67ff0a0f5cec658f627"
+SRC_URI[sha256sum] = "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
 
 inherit waf-samba
 
@@ -27,19 +27,17 @@ FILES_${PN} = ""
 FILES_${PN}-dev = ""
 FILES_${PN}-dbg = ""
 
-FILES_libtalloc = "${libdir}/libtalloc.so.2 \
-                   ${libdir}/libtalloc.so.2.1.1"
+FILES_libtalloc = "${libdir}/libtalloc${SOLIBS}"
 FILES_libtalloc-dbg = "/usr/src/debug/ \
-                   ${libdir}/.debug/libtalloc.so.2.1.1"
+                   ${libdir}/.debug/libtalloc${SOLIBS}"
 FILES_libtalloc-dev = "${includedir}/ \
-                   ${libdir}/libtalloc.so \
+                   ${libdir}/libtalloc${SOLIBSDEV} \
                    ${libdir}/pkgconfig/"
 
 FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
-                  ${libdir}/libpytalloc-util.so.2 \
-                  ${libdir}/libpytalloc-util.so.2.1.1 \
+                  ${libdir}/libpytalloc-util${SOLIBS} \
                  "
 FILES_pytalloc-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
-                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
-FILES_pytalloc-dev = "${libdir}/libpytalloc-util.so"
+                      ${libdir}/.debug/libpytalloc-util${SOLIBS}"
+FILES_pytalloc-dev = "${libdir}/libpytalloc-util${SOLIBSDEV}"
 RDEPENDS_pytalloc = "python"
-- 
1.9.1


