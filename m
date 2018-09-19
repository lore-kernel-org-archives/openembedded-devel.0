Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1569605C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:21:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J2LKZd025076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2018 19:21:30 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 18 Sep 2018 19:21:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 19 Sep 2018 10:31:03 +0800
Message-ID: <7ff6a7aef33e79e3b5aa392be7e9b9be18eca613.1537324153.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537324153.git.hongxu.jia@windriver.com>
References: <cover.1537324153.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2 12/19] xerces-c: split one dpg package
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
X-List-Received-Date: Wed, 19 Sep 2018 02:21:55 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index 9bc4ea3..0951307 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -24,24 +24,21 @@ do_install_prepend () {
 }
 
 PACKAGES = "libxerces-c \
-    libxerces-c-dbg \
     libxerces-c-dev \
     xerces-c-samples \
-    xerces-c-samples-dbg \
     libxerces-c-staticdev \
+    ${PN}-dbg \
 "
 
+RPROVIDES_${PN}-dbg += "libxerces-c-dbg xerces-c-samples-dbg"
+
 FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
-FILES_libxerces-c-dbg = "${libdir}/.debug \
-    ${prefix}/src/debug \
-"
 FILES_libxerces-c-dev = "${libdir}/lib*.la \
     ${libdir}/libxerces-c.so \
     ${libdir}/pkgconfig/xerces-c.pc \
     ${includedir}/xercesc \
 "
 FILES_xerces-c-samples = "${bindir}/*"
-FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
 FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


