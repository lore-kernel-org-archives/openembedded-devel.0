Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id DC4ED71A74
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:06:38 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id B2E7CB81614; Wed, 30 Nov 2016 13:06:37 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:06:37 +0100
Message-Id: <1480507597-21843-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] imagemagick: use correct major version in program suffix
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
X-List-Received-Date: Wed, 30 Nov 2016 12:06:39 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../imagemagick/imagemagick_7.0.2.bb               | 46 +++++++++++-----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index 74fe369..cfaa7c3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -20,7 +20,7 @@ inherit autotools pkgconfig update-alternatives
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first
-EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-perl --disable-openmp --without-xml --disable-opencl"
+EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --disable-openmp --without-xml --disable-opencl"
 
 CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
@@ -51,40 +51,40 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "animate compare composite conjure convert display \
     identify import mogrify montage stream"
 
-ALTERNATIVE_TARGET[animate] = "${bindir}/animate.im6"
-ALTERNATIVE_TARGET[compare] = "${bindir}/compare.im6"
-ALTERNATIVE_TARGET[composite] = "${bindir}/composite.im6"
-ALTERNATIVE_TARGET[conjure] = "${bindir}/conjure.im6"
-ALTERNATIVE_TARGET[convert] = "${bindir}/convert.im6"
-ALTERNATIVE_TARGET[display] = "${bindir}/display.im6"
-ALTERNATIVE_TARGET[identify] = "${bindir}/identify.im6"
-ALTERNATIVE_TARGET[import] = "${bindir}/import.im6"
-ALTERNATIVE_TARGET[mogrify] = "${bindir}/mogrify.im6"
-ALTERNATIVE_TARGET[montage] = "${bindir}/montage.im6"
-ALTERNATIVE_TARGET[stream] = "${bindir}/stream.im6"
+ALTERNATIVE_TARGET[animate] = "${bindir}/animate.im7"
+ALTERNATIVE_TARGET[compare] = "${bindir}/compare.im7"
+ALTERNATIVE_TARGET[composite] = "${bindir}/composite.im7"
+ALTERNATIVE_TARGET[conjure] = "${bindir}/conjure.im7"
+ALTERNATIVE_TARGET[convert] = "${bindir}/convert.im7"
+ALTERNATIVE_TARGET[display] = "${bindir}/display.im7"
+ALTERNATIVE_TARGET[identify] = "${bindir}/identify.im7"
+ALTERNATIVE_TARGET[import] = "${bindir}/import.im7"
+ALTERNATIVE_TARGET[mogrify] = "${bindir}/mogrify.im7"
+ALTERNATIVE_TARGET[montage] = "${bindir}/montage.im7"
+ALTERNATIVE_TARGET[stream] = "${bindir}/stream.im7"
 
 ALTERNATIVE_${PN}-doc = "animate.1 compare.1 composite.1 conjure.1 \
     convert.1 display.1 identify.1 import.1 mogrify.1 montage.1 stream.1"
 
 ALTERNATIVE_LINK_NAME[animate.1] = "${mandir}/man1/animate.1"
-ALTERNATIVE_TARGET[animate.1] = "${mandir}/man1/animate.im6.1"
+ALTERNATIVE_TARGET[animate.1] = "${mandir}/man1/animate.im7.1"
 ALTERNATIVE_LINK_NAME[compare.1] = "${mandir}/man1/compare.1"
-ALTERNATIVE_TARGET[compare.1] = "${mandir}/man1/compare.im6.1"
+ALTERNATIVE_TARGET[compare.1] = "${mandir}/man1/compare.im7.1"
 ALTERNATIVE_LINK_NAME[composite.1] = "${mandir}/man1/composite.1"
-ALTERNATIVE_TARGET[composite.1] = "${mandir}/man1/composite.im6.1"
+ALTERNATIVE_TARGET[composite.1] = "${mandir}/man1/composite.im7.1"
 ALTERNATIVE_LINK_NAME[conjure.1] = "${mandir}/man1/conjure.1"
-ALTERNATIVE_TARGET[conjure.1] = "${mandir}/man1/conjure.im6.1"
+ALTERNATIVE_TARGET[conjure.1] = "${mandir}/man1/conjure.im7.1"
 ALTERNATIVE_LINK_NAME[convert.1] = "${mandir}/man1/convert.1"
-ALTERNATIVE_TARGET[convert.1] = "${mandir}/man1/convert.im6.1"
+ALTERNATIVE_TARGET[convert.1] = "${mandir}/man1/convert.im7.1"
 ALTERNATIVE_LINK_NAME[display.1] = "${mandir}/man1/display.1"
-ALTERNATIVE_TARGET[display.1] = "${mandir}/man1/display.im6.1"
+ALTERNATIVE_TARGET[display.1] = "${mandir}/man1/display.im7.1"
 ALTERNATIVE_LINK_NAME[identify.1] = "${mandir}/man1/identify.1"
-ALTERNATIVE_TARGET[identify.1] = "${mandir}/man1/identify.im6.1"
+ALTERNATIVE_TARGET[identify.1] = "${mandir}/man1/identify.im7.1"
 ALTERNATIVE_LINK_NAME[import.1] = "${mandir}/man1/import.1"
-ALTERNATIVE_TARGET[import.1] = "${mandir}/man1/import.im6.1"
+ALTERNATIVE_TARGET[import.1] = "${mandir}/man1/import.im7.1"
 ALTERNATIVE_LINK_NAME[mogrify.1] = "${mandir}/man1/mogrify.1"
-ALTERNATIVE_TARGET[mogrify.1] = "${mandir}/man1/mogrify.im6.1"
+ALTERNATIVE_TARGET[mogrify.1] = "${mandir}/man1/mogrify.im7.1"
 ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
-ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im6.1"
+ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
-ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im6.1"
+ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
-- 
2.7.4


