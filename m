Return-Path: <damann@sensoft.ca>
Received: from p01c12o141.mxlogic.net (p01c12o141.mxlogic.net [208.65.145.64])
	by mail.openembedded.org (Postfix) with ESMTP id 41B9F6FD28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 15:28:21 +0000 (UTC)
Received: from unknown [66.252.158.210] (EHLO SS08EX01.sensoft.ca)
	by p01c12o141.mxlogic.net(mxl_mta-8.1.0-0) over TLS secured channel
	with ESMTP id 61040245.0.26208.00-259.77195.p01c12o141.mxlogic.net
	(envelope-from <damann@sensoft.ca>); 
	Mon, 22 Sep 2014 09:28:28 -0600 (MDT)
X-MXL-Hash: 5420401c11ce1419-ef06eaf176538cd91f08ee9a44565f5836fa2a48
Received: from smart-dev.sensoft.ca (192.168.20.10) by SS08EX01.sensoft.ca
	(192.168.1.251) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 22 Sep 2014 11:28:21 -0400
From: Dominic Amann <damann@sensoft.ca>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Sep 2014 11:28:06 -0400
Message-ID: <1411399687-11026-1-git-send-email-damann@sensoft.ca>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [192.168.20.10]
X-AnalysisOut: [v=2.1 cv=e9QSSMZ/ c=1 sm=1 tr=0 a=+YBCmPgfixlKXhXEnacbWQ==]
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
X-List-Received-Date: Mon, 22 Sep 2014 15:28:27 -0000
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


