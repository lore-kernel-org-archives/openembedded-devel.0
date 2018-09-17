Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B41879558
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:59:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFwVnc006677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:59:02 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:58:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:27 +0800
Message-ID: <4a8135752cc4b42fb49652ad84145fe60a8418e3.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/19] pidgin: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:59:21 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
index 088f08b..148e4b6 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
@@ -58,7 +58,9 @@ do_configure_prepend() {
 OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
 OE_LT_RPATH_ALLOW[export]="1"
 
-PACKAGES =+ "libpurple-dbg libpurple-dev libpurple libgnt-dbg libgnt libgnt-dev finch-dbg finch finch-dev ${PN}-data"
+PACKAGES =+ "libpurple-dev libpurple libgnt libgnt-dev finch finch-dev ${PN}-data"
+
+RPROVIDES_${PN}-dbg += "libpurple-dbg libgnt-dbg finch-dbg"
 
 LEAD_SONAME = "libpurple.so.0"
 FILES_libpurple     = "${libdir}/libpurple*.so.* ${libdir}/purple-2 ${bindir}/purple-* ${sysconfdir}/gconf/schemas/purple* ${datadir}/purple/ca-certs"
@@ -69,15 +71,10 @@ FILES_libpurple-dev = "${libdir}/libpurple*.la \
                        ${libdir}/purple-2/liboscar.so \
                        ${libdir}/purple-2/libymsg.so \
                        ${datadir}/aclocal"
-FILES_libpurple-dbg += "${libdir}/.debug/libpurple* \
-                        ${libdir}/purple-2/.debug"
 FILES_libgnt         = "${libdir}/libgnt.so.* ${libdir}/gnt/*.so"
 FILES_libgnt-dev     = "${libdir}/gnt/*.la"
-FILES_libgnt-dbg     = "${libdir}/gnt/.debug"
 FILES_finch          = "${bindir}/finch"
 FILES_finch-dev      = "${libdir}/finch/*.la"
-FILES_finch-dbg      = "${bindir}/.debug/finch \
-                        ${libdir}/finch/.debug"
 
 FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
            ${datadir}/applications"
-- 
2.7.4


