Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABBF7713A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 14:24:23 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9GEONJU014974; Fri, 16 Oct 2015 09:24:23 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015101609242356-2125874 ;
	Fri, 16 Oct 2015 09:24:23 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 17:24:20 +0300
Message-Id: <990b1c8517dc29833819890afb52fe5db0c51abc.1445005215.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7c7ebb1005d3ef6935ce80c02f7059ed7a021d10.1445005215.git.adrian.ratiu@ni.com>
References: <7c7ebb1005d3ef6935ce80c02f7059ed7a021d10.1445005215.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/16/2015 09:24:23 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/16/2015 09:24:23 AM,
	Serialize complete at 10/16/2015 09:24:23 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-16_10:, , signatures=0
Subject: [meta-oe][PATCH 3/3] x11vnc: use external libvncserver
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
X-List-Received-Date: Fri, 16 Oct 2015 14:24:25 -0000

By default x11vnc compiles its dependency libvncserver from sources
included in its own source tree. We override this behaviour to use
the externally provided libvncserver from a separate recipe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index ec0241f..7e92965 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -14,12 +14,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
-DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
+DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst libtasn1 p11-kit"
 
 inherit autotools-brokensep distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} libvncserver"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
 PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
+PACKAGECONFIG[libvncserver] = "--with-system-libvncserver,--without-system-libvncserver,libvncserver"
-- 
2.1.4


