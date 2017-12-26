Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C435860125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 05:52:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBQ5qsLM015152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 21:52:54 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Dec 2017 21:52:53 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Dec 2017 13:50:46 +0800
Message-ID: <20171226055046.20835-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hwloc: fix multilib problem
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
X-List-Received-Date: Tue, 26 Dec 2017 05:52:53 -0000
Content-Type: text/plain

Use libhwloc instead of lib${PN} to fix problem in case of multilib.
Otherwise, when installing lib32-hwloc into image, we would have the
following error at do_rootfs.

  - nothing provides lib32-liblib32-hwloc = 1.11.5-r0 needed by lib32-hwloc-1.11.5-r0.corei7_32

Also, fix FILES variable for libhwloc to not contain .so link file.
This would fix the QA issue, and the INSANE_SKIP line is no longer needed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
index d7fdd823c..5a335b924 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -24,9 +24,6 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
 PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,libpciaccess,libpciaccess"
 
 # Split hwloc library into separate subpackage
-PACKAGES_prepend = " lib${PN} "
-FILES_lib${PN} += "${libdir}/lib${PN}.so*"
-RDEPENDS_${PN} += "lib${PN} (= ${EXTENDPKGV})"
-
-# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
-INSANE_SKIP_lib${PN} += "dev-so"
+PACKAGES_prepend = " libhwloc "
+FILES_libhwloc += "${libdir}/libhwloc.so.*"
+RDEPENDS_${PN} += "libhwloc (= ${EXTENDPKGV})"
-- 
2.13.0


