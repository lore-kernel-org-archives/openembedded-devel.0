Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1SyOjb-0001vO-8V for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 16:56:43 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q76EivCe000826
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2012 09:44:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q76EivIH017746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2012 09:44:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 6 Aug 2012 09:44:57 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q76EivY6026973;	Mon, 6 Aug 2012 09:44:57 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1SyOeB-0002WX-B7; Mon, 06 Aug 2012 09:51:07 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Aug 2012 09:50:57 -0500
Message-ID: <1344264657-9666-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [for-denzil][meta-oe][PATCH] ltrace: Fix make error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 14:56:43 -0000
Content-Type: text/plain

* Fixes the make: invalid option -- '/' error

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
index 109bf82..9fd423f 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
@@ -5,7 +5,7 @@ DEPENDS = "elfutils binutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-PR = "r4"
+PR = "r5"
 
 # ltrace is not ported to sh3/sh4 targets at this time
 COMPATIBLE_TARGET_SYS = "(?!sh[34])"
@@ -52,7 +52,7 @@ do_compile() {
 		sparc*)   LTRACE_ARCH=sparc ;;
 		x86_64*)  LTRACE_ARCH=x86_64 ;;
 	esac
-	oe_runmake LDFLAGS=${TARGET_LDFLAGS} LIBS="-lsupc++ -liberty -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH}
+	oe_runmake LDFLAGS="${TARGET_LDFLAGS}" LIBS="-lsupc++ -liberty -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH}
 }
 
 do_install() {
-- 
1.7.0.4



