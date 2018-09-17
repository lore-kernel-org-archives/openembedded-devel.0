Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19B1A7963C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:56:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFuiB4016069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:56:44 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:56:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:15 +0800
Message-ID: <b299cc536575c6bae7e6817bb12698737548f0a0.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/19] gnuplot: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:56:44 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
index 4cc289d..f9fd8ae 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
@@ -60,10 +60,12 @@ do_install_append_class-target() {
     install -m 0644 ${WORKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
 }
 
-PACKAGES =+ "${PN}-x11-dbg ${PN}-x11"
+PACKAGES =+ "${PN}-x11"
+
+RPROVIDES_${PN}-dbg += "${PN}-x11-dbg"
+
 DESCRIPTION_${PN}-x11 = "X11 display terminal for Gnuplot."
 SECTION_${PN}-x11 = "x11/scientific"
 FILES_${PN}-x11 = "${libexecdir} ${datadir}/applications ${datadir}/pixmaps ${libdir}/X11 "
 
 FILES_${PN} += "${datadir}/texmf"
-FILES_${PN}-x11-dbg += "${libexecdir}/gnuplot/*/.debug"
-- 
2.7.4


