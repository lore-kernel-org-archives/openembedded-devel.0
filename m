Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0208C606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:59:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2LAxBH4030062; Mon, 21 Mar 2016 05:59:11 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032105591241-24435 ;
	Mon, 21 Mar 2016 05:59:12 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 12:58:37 +0200
Message-Id: <0519adc696bdd1d936306f40171a8dd9ddf73e74.1458557752.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/21/2016 05:59:12 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/21/2016 05:59:12 AM,
	Serialize complete at 03/21/2016 05:59:12 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-21_05:, , signatures=0
Subject: [meta-oe][PATCH v3 1/2] ttf-pt-sans: add recipe
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
X-List-Received-Date: Mon, 21 Mar 2016 10:59:14 -0000

PT Sans is an open source licensed font released in 2010 by ParaType.
The ParaTypeFFL-1.3 license file has been submitted to OE-core.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
new file mode 100644
index 0000000..ac60a36
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "PT Sans Fonts"
+DESCRIPTION = "The PT Sans TTF font set"
+HOMEPAGE = "http://www.paratype.com/public/"
+
+SECTION = "x11/fonts"
+
+LICENSE = "ParaTypeFFL-1.3"
+LIC_FILES_CHKSUM = "file://../PT%20Free%20Font%20License_eng.txt;md5=d720f3a281ed81c3f4cfc465e11b1d0d"
+
+inherit allarch fontcache
+
+# Downloading from fedora because upstream doesn't version its zip file
+# and causes hash build failures
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-sans-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
+
+SRC_URI[md5sum] = "c3f5a0e20a75cf628387510a720924a7"
+SRC_URI[sha256sum] = "0164f824e03c32c99e8a225853ec168893a04a09ade132e93a674e85ae033b2e"
+
+do_install () {
+    install -d ${D}${datadir}/fonts/X11/TTF/
+    cd ..
+    for i in *.ttf; do
+        install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
+    done
+}
+
+FILES_${PN} += "${datadir}"
+
+pkg_postinst_${PN} () {
+    set -x
+    for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
+        mkfontdir $fontdir
+        mkfontscale $fontdir
+    done
+    for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
+        mkfontdir $fontdir
+        mkfontscale $fontdir
+    done
+}
-- 
2.7.3


