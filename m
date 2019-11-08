Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 28DDB7FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:10:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA86Amhf000803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Nov 2019 22:10:48 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 7 Nov 2019 22:10:48 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 22:10:48 -0800
Message-ID: <20191108061048.20492-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe] gtkwave: add the libtirpc dependence and config
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
X-List-Received-Date: Fri, 08 Nov 2019 06:10:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the oe-core commit "libtirpc: create the symbol link for rpc
header files" create the symbol link of header files, so during
checking it will find the related header files, then it will use
the old PRC_LDADD value "-lrpc" other than "-ltirpc".
So we add the option "--with-tirpc" to the configure command and
add the dependence.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index 310c41067..2be8d7bb7 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -11,13 +11,13 @@ SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
 SRC_URI[sha256sum] = "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
 
 inherit pkgconfig autotools gettext texinfo
-DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
+DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0 libtirpc"
 RDEPENDS_${PN} = "tk-lib"
 
 # depends on gtk+ which has this restriction
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.23.0


