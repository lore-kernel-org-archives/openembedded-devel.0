Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 548B4795DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:57:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFuGNo006597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:56:42 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:56:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:13 +0800
Message-ID: <e4963093b3296e046eb17b43b6b39faf0010b279.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/19] libtalloc: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:57:01 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
index 89aea20..9a463a6 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
@@ -37,13 +37,13 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
-PACKAGES += "pytalloc pytalloc-dbg pytalloc-dev"
+PACKAGES += "pytalloc pytalloc-dev"
+
+RPROVIDES_${PN}-dbg += "pytalloc-dbg"
 
 FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
                   ${libdir}/libpytalloc-util.so.2 \
                   ${libdir}/libpytalloc-util.so.2.1.1 \
                  "
-FILES_pytalloc-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
-                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
 FILES_pytalloc-dev = "${libdir}/libpytalloc-util.so"
 RDEPENDS_pytalloc = "python"
-- 
2.7.4


