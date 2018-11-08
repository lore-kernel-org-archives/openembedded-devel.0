Return-Path: <rtie@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id A016C79E37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 07:39:44 +0000 (UTC)
Received: from bob.localdomain ([87.245.7.122]) by mail.gmx.com (mrgmx003
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0LtIdP-1fMBys03vH-012nom;
	Thu, 08 Nov 2018 08:39:45 +0100
From: Robert Tiemann <rtie@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Nov 2018 08:38:18 +0100
Message-Id: <20181108073818.126938-1-rtie@gmx.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HKySmExXQYm7Q1oSIHYup1hs5itzX3Ea7XblRNJ5+WVJOLIjT7E
	E7WOFLU0d7NpVFhQKEZF/Rdbj5dO2pO4mgyKBguefXaSPQjeRwQUDVToQkN8t6lzSajm7Ix
	shtJqomMnYKUrZ4I8f7vsqdx4RYUUHFC6/0K/RdClilxw/tfUCnYl6kYnAbgOLDDaSF0Wf1
	3JJCOS0w42ubJDFkVzN4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:4GwNbxKH3zg=:13XoGw9VC8ApwjLaatvfii
	S3Q1LOuusr5FEMVTW6iFheXVaGC4LD9liwoh+DBRaBUsm0mQZl7fJVljIfWC1WVAg4Fq+up1r
	fa7phFoE8jmmM9ORjZghflXAmnZFGxJJymuEfzvXnKOhLhWVwiAMmyTjOnDkr47ugYbrehFLL
	1LhyBGP9YaBpDOnLX9LAKG0fHqkm+iBWOzTD6gykNnYFJOQLkF25R3Y/1TKA4nbRNonqmMI0S
	aeJHm0ZFd7MYllqB4aTxuFevknCd9Jp1geLF8e+ETI1nKMAtSu4qm3lHOrgqeTqhmu4BAQYmL
	b6gztMgXCa7gvp27gE2YEJcdiHHeVKTh8+w1GXCsAnf4roA6gJ8df9Ewf8M5/zOA0lNrMBby7
	zDxhO/YRXF2HNkHEp7oRDeJN1EEPFMuRzuEorKuW2zkC51e9mNZSA2YV18LnoJLh0dyfcANyV
	UeDV1hQNt5AnoAQFsBRbhAFvjZrHTQk9jhheab0Ef0dhuD23MmrJyUi46b1y9sayHvrard8Ey
	6UFWaADF4huCwr/j3PldLTb0MXfKVppjO40GDVwEOot/FppMX3uwS8DqNgBwWNKtL5vlWrtpa
	bqP7TFanIyY3T2WmLNQrhM4o9PoR6zA3LXnSZL7ciXVbWsW2qXYb9KHfCsA63hws6DBi0S0O6
	aaNHOZG2YjVKubmBati8msrdiPcrYvDyjzRA2xbMbIuioRVFU1d3iZQGfBS0yiM2dO3/6iO+A
	FXd5qBglm264eqYQ/E/jFMu1lEJN3UJC3cim0zy052Ae1bZSf7et7YSAFUIlNUMhl+iDZe5yc
	qovRhmDrJmRWLQaB/LoeVlMboHez0uDca6IKHAZKgKeJ5HriQNtin0rYBbZhYY1mMEBDGs+44
	ME3bAdLIoWND6pyzYJTQ+tkWcRAX4eKjLM3JvwhEg=
Subject: [meta-networking][PATCH v2] curlpp: Fix packaging and reference to license
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
X-List-Received-Date: Thu, 08 Nov 2018 07:39:45 -0000
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
 .../recipes-support/curlpp/curlpp_0.8.1.bb      | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 340f57dc7..799cf8611 100644
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
@@ -15,19 +15,4 @@ S = "${WORKDIR}/git"
 
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


