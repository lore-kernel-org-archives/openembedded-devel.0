Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A01876536
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:20:06 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8U7K1Rt020187 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 02:20:01 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015093002200151-777281 ;
	Wed, 30 Sep 2015 02:20:01 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 10:20:00 +0300
Message-Id: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/30/2015 02:20:01 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/30/2015 02:20:01 AM,
	Serialize complete at 09/30/2015 02:20:01 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
Subject: [meta-oe][PATCH] meta-oe: recipes-graphics: add libvncserver recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 07:20:07 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../libvncserver/libvncserver_0.9.10.bb              | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
new file mode 100644
index 0000000..841506a
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "library for easy implementation of a RDP/VNC server"
+HOMEPAGE = "https://libvnc.github.io"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
+
+DEPENDS += "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
+RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
+
+inherit autotools pkgconfig
+
+SRC_URI  = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-0.9.10.tar.gz"
+
+SRC_URI[md5sum] = "e1b888fae717b06896f8aec100163d27"
+SRC_URI[sha256sum] = "ed10819a5bfbf269969f97f075939cc38273cc1b6d28bccfb0999fba489411f7"
+
+S = "${WORKDIR}/${PN}-LibVNCServer-${PV}"
+
+EXTRA_OEMAKE_append=" SUBDIRS='libvncserver' "
-- 
2.1.4


