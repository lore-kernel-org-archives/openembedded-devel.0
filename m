Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AD7066FF04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 10:14:10 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tB3AEBZ6030154 for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 04:14:11 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015120304141125-697421 ;
	Thu, 3 Dec 2015 04:14:11 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Dec 2015 12:14:08 +0200
Message-Id: <528c7250d3d05af3559c670540aa3880ed8700db.1449137319.git.adi@adirat.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3d301c4c4f1bdf278e3887d4b2f95f60e15f2b1f.1449137319.git.adi@adirat.com>
References: <3d301c4c4f1bdf278e3887d4b2f95f60e15f2b1f.1449137319.git.adi@adirat.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/03/2015 04:14:11 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/03/2015 04:14:11 AM,
	Serialize complete at 12/03/2015 04:14:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-03_01:, , signatures=0
Subject: [meta-oe][RESEND PATCH 3/3] x11vnc: use external libvncserver
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
X-List-Received-Date: Thu, 03 Dec 2015 10:14:11 -0000

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


