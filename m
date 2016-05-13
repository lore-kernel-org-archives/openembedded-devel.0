Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mail.openembedded.org (Postfix) with ESMTP id CE0A960721
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 18:25:27 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O74000VGOHQYSA0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 May 2016 13:25:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=alK4_DS-AAAA:8	a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
	a=mVG6GTcMzoc8hLaSjAMA:9
Received: by 100.15.86.14 with SMTP id 2797e349; Fri, 13 May 2016 18:25:12 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AD742161FF8;	Fri,
	13 May 2016 14:25:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 14:24:54 -0400
Message-id: <1463163894-23103-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [krogoth][PATCH] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Fri, 13 May 2016 18:25:29 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The opencv-java is not always generated so we ought to include it,
only if it is available. The opencv-locales is not available and ought
to be skipped.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c1f9802..789512f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -79,7 +79,8 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+PACKAGES += "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
+             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)}"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
@@ -104,7 +105,7 @@ python populate_packages_prepend () {
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
     bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 
-- 
2.2.0


