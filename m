Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1Sx0sS-0000ZX-Vz for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 21:16:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q72J4SIE016694
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2012 14:04:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q72J4Sf7029090
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2012 14:04:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 2 Aug 2012 14:04:27 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q72J4Rt8032595;	Thu, 2 Aug 2012 14:04:27 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1Sx0lk-0003CE-4p; Thu, 02 Aug 2012 14:09:12 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2012 14:09:01 -0500
Message-ID: <1343934541-12253-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-oe][PATCH] ltrace: Fix make error
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
X-List-Received-Date: Thu, 02 Aug 2012 19:16:09 -0000
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



