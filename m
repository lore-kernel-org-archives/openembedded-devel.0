Return-Path: <rtie@gmx.de>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Nov 2018 15:32:17 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id E458179DBC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 15:32:17 +0000 (UTC)
Received: from bob.localdomain ([87.245.7.122]) by mail.gmx.com (mrgmx001
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0MLNpK-1gJrlp2jI2-000cSz;
	Wed, 07 Nov 2018 16:27:15 +0100
From: Robert Tiemann <rtie@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2018 16:26:52 +0100
Message-Id: <20181107152652.98604-1-rtie@gmx.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CLhc7D7c67HZ4Ry/WWwkxXHssfLhVhd0tL5eDjWc+l7gJ1jFbm2
	1/LQ730rhpM+X8dPXATOl2c/2xxeHauaGhcDuSKh0+1M2cQ+K5efJ0tCndm6njU+AaiI5PL
	0mwyMKBtVluuEZ7Puh3Va3rc4wDtdtIH0OoPThvQUOtGjNtZpeAeEc1aWunUFDgbNO9NIav
	kOJjG2mGfdHoqKL97VgwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:9NJicLoUEcI=:bL3N2Bfx5He7+SzDSeOLlf
	1JbYIru56dJJa+10UW1TwdyXYdPXwTDKMzanoK0m14BPNEd1YmeXBOmwO07cL2u0zgVrloEVc
	H7HjDMRskxsG7t4sn+zY4fEJnje/Sny6VzTuet4jCWY5zI1IgvOtVfE1RriJiA4iSCmG7omuv
	yDcHc+aRvTRLNqnKsdkfmtMcu14xZ+z0PxIKjRJJusFMf7ngjuUwLAkPz6+CagPg8eW3W2p85
	O/apC1XkWkMhcvkr9WTyT/t9JlokojAGSCIPC1iaP6OFrgz6FqmCOVvVr10jVMiFQaeRKXhFL
	AAx7abKn2xSpuG8yddE4X/bxjCzMN1qvDLTyQCnRoJg9bLQ3Zmxt6GXCS4IgRS8T3Jx1Z//Yp
	MRQrHSqCLrh2LQqFPu7GPfPQmtDnsDj4ezOTDgTptrqHipMcY9JRTG2dYbz17ZlW93j+e4NqO
	BdyjVOrR6dLNrOGYHv4UW5WipCGRxkkLDW6KZ+LOj5EqpIggSAIDCt05rFzXXYjVIty84XQpI
	3R9cXX53bqS7tn5iLZBYRE+V63Ap0okjhs7iuoQM0bO5sdDcn2tkaz5atbora+DQkT91yxi0+
	aFsmc80EmXW5uEpWySLMYfdpg8R7lGRTTSVjuBRH64h2MXFrhtCMhFr7YvVgN+gzUim5sNCLU
	qG1IuicnL3JhBwIjvsP9muyqFd323SWxwFxfv6acp9irO0GpRfb7Iuv7a7HJxrr653KV1Jl8+
	O4xWYcQ1r8AVkf5ud0+mV+tVmyTb4gNXXZ6BOaKK/0yR62jZ4B/aKbcPMW/n460i0WAsAkeZr
	II3VGibcc2LpL8pKfyZcecEp3rR+lTSkdGeW0wSPbRDUy1nwgFTUCdAUN0fDskCNnYwZm7DPv
	slrxAs1hWFh/MJefU+ywS2MrmlKoOeJlBOc4szCxk=
Subject: [meta-networking][PATCH] curlpp: Fix packaging and reference to license
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
X-List-Received-Date: Wed, 07 Nov 2018 15:32:18 -0000
Content-Transfer-Encoding: 8bit

This patch fixes three issues:

1. The recipe used "libcurlpp" for its package base name. It defined
  PACKAGES and corresponding package contents manually, but the
  non-standard naming led to an error message when trying to depend on
  it (nothing provides curlpp needed by curlpp-dev).

  See also
  https://lists.yoctoproject.org/pipermail/poky/2018-February/011236.html.

  Fixed by removing PACKAGES and corresponding FILES_*, relying on
  automatic packaging now.

2. Upstream ships a license file (MIT), which is referenced by the
  recipe now (instead of the stock COPYING.MIT file).

3. There was a do_install_append() function which patched the
  installed curlpp.pc file. Since it seemed to be of no use, it was
  removed.

Signed-off-by: Robert Tiemann <rtie@gmx.de>
---
 .../recipes-support/curlpp/curlpp_0.8.1.bb     | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 340f57dc7..f92cf65cf 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "C++ library for client-side URL transfers"
 HOMEPAGE = "http://www.curlpp.org/"
 SECTION = "libdevel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fd0c9adf285a69aa3b4faf34384e1029"
 
 DEPENDS = "curl"
 DEPENDS_class-native = "curl-native"
@@ -10,24 +10,10 @@ DEPENDS_class-native = "curl-native"
 SRC_URI = "git://github.com/jpbarrette/curlpp.git"
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig binconfig
 
-do_install_append () {
-    sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/pkgconfig/curlpp.pc
-}
-
-PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
-
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-
-FILES_lib${BPN}-dev = "${includedir} \
-    ${libdir}/pkgconfig \
-    ${bindir}/*-config \
-"
-
-FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.19.0


