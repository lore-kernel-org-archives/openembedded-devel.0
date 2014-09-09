Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A56965D59
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 07:30:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s897UXhV005747
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 00:30:33 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 00:30:33 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 03:30:29 -0400
Message-ID: <a503177d7497f66c46e8471e43b38f2530a224f4.1410247589.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410247589.git.wenzong.fan@windriver.com>
References: <cover.1410247589.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-oe] talloc: ignore exit status of rmdir
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
X-List-Received-Date: Tue, 09 Sep 2014 07:30:38 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* fix do_insall errors:
  rmdir: failed to remove `.../talloc/2.0.1-r2/image/usr/bin': \
  No such file or directory

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 48c0915..ed3e2c1 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -29,7 +29,7 @@ do_install_append() {
     ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
     ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
     ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
-    rmdir ${D}${bindir}
+    rmdir ${D}${bindir} || true
 }
 
 PACKAGES += "${PN}-swig"
-- 
1.7.9.5


