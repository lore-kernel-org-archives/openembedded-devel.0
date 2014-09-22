Return-Path: <damann@sensoft.ca>
Received: from p01c12o147.mxlogic.net (p01c12o147.mxlogic.net [208.65.145.70])
	by mail.openembedded.org (Postfix) with ESMTP id C2A8B7148B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 15:28:40 +0000 (UTC)
Received: from unknown [66.252.158.210] (EHLO SS08EX01.sensoft.ca)
	by p01c12o147.mxlogic.net(mxl_mta-8.1.0-0) with ESMTP id
	d2040245.2b4256803940.54110.00-526.158536.p01c12o147.mxlogic.net
	(envelope-from <damann@sensoft.ca>); 
	Mon, 22 Sep 2014 09:28:45 -0600 (MDT)
X-MXL-Hash: 5420402d39f558a9-e1453677109fcd81e8930abc23a82e72dbd5bec6
Received: from unknown [66.252.158.210] (EHLO SS08EX01.sensoft.ca)
	by p01c12o147.mxlogic.net(mxl_mta-8.1.0-0) over TLS secured channel
	with ESMTP id 55e30245.0.48353.00-336.141499.p01c12o147.mxlogic.net
	(envelope-from <damann@sensoft.ca>); 
	Mon, 22 Sep 2014 09:20:57 -0600 (MDT)
X-MXL-Hash: 54203e5940e1f99c-4c9dd97e186f068f9f96db78725d769060488c95
Received: from smart-dev.sensoft.ca (192.168.20.10) by SS08EX01.sensoft.ca
	(192.168.1.251) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 22 Sep 2014 11:20:52 -0400
From: Dominic Amann <damann@sensoft.ca>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Sep 2014 11:20:32 -0400
Message-ID: <1411399233-10947-1-git-send-email-damann@sensoft.ca>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [192.168.20.10]
X-AnalysisOut: [v=2.1 cv=eLkHjRZ1 c=1 sm=1 tr=0 a=+YBCmPgfixlKXhXEnacbWQ==]
X-AnalysisOut: [:117 a=+YBCmPgfixlKXhXEnacbWQ==:17 a=_sLur_I5wLgA:10 a=VIn]
X-AnalysisOut: [PDrAyZ4UA:10 a=czRwm6Ba6okA:10 a=BLceEmwcHowA:10 a=YlVTAMx]
X-AnalysisOut: [IAAAA:8 a=-dGsusbfJyfx8UUQddIA:9]
X-Spam: [F=0.5000000000; CM=0.500; MH=0.500(2014092212); S=0.200(2014051901)]
X-MAIL-FROM: <damann@sensoft.ca>
X-SOURCE-IP: [66.252.158.210]
Subject: [meta-fsl-arm][PATCH] Fixed repo path for libmikmod, was changed in sourceforge
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
X-List-Received-Date: Mon, 22 Sep 2014 15:28:44 -0000
Content-Type: text/plain


Signed-off-by: Dominic Amann <damann@sensoft.ca>
---
 .../recipes-multimedia/mikmod/libmikmod_3.3.3.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
index 6a3077f..7f9651f 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-"
+    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz\
+	"
 SRC_URI[md5sum] = "0e0f9bce8f8e598ca292b41e0ae385c8"
 SRC_URI[sha256sum] = "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563168e270cf79b2437"
 
-- 
1.7.9.5


