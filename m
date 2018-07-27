Return-Path: <prvs=674688ffdd=adrian.ratiu@ni.com>
X-Greylist: delayed 4454 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jul 2018 12:34:49 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 81B9C78D06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:34:49 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6RBKYZe015183 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:20:36 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2kewd36f7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:20:36 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6RBKZwM004230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:20:35 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 27 Jul 2018 06:20:35 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 27 Jul 2018 06:20:35 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 27 Jul 2018 06:20:34 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jul 2018 14:20:33 +0300
Message-ID: <20180727112033.12616-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][PATCH] libblockdev: cleanup/fix PACKAGECONFIG/dependencies
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
X-List-Received-Date: Fri, 27 Jul 2018 12:34:49 -0000
Content-Type: text/plain

It only makes sense to rdepend on lvm2 if lvm is enabled by the
configuration and the nss and volume-key dependencies are only needed
if --with-escrow is configured. These dependencies are quite big so
it's good to have a way to disable them.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-extended/libblockdev/libblockdev_2.18.bb  | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
index 4dbd04cd7..a58871f0c 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
@@ -12,8 +12,6 @@ inherit autotools python3native gobject-introspection
 
 DEPENDS += " \
     cryptsetup \
-    nss \
-    volume-key \
     libbytesize \
     btrfs-tools \
 "
@@ -26,16 +24,12 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} += " \
-    lvm2 \
-"
-
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python3 lvm dm kmod parted fs"
+PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
-PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools"
+PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm"
 PACKAGECONFIG[dmraid] = "--with-dmraid, --without-dmraid"
 PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
@@ -44,6 +38,7 @@ PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm"
 PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo"
+PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
 
-- 
2.18.0


