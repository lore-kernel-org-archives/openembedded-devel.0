Received: from mail-qc0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TumaC-0002YB-Hc
	for openembedded-devel@openembedded.org; Mon, 14 Jan 2013 17:08:33 +0100
Received: by mail-qc0-f182.google.com with SMTP id k19so2551729qcs.41
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jan 2013 07:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NdhFDLDB+58vA8lzfE3xI90sirqOC8iOVUKOJjFg7XU=;
	b=VvFTbfNTeykGrb+LHftQKS7GYu22WJF7yWOr4tR7XbfiF3OGgeADh3blZ28YexHD3a
	OCCO1S1UZbzSIFONLOrg2js9SOP4k9d1RzSJHMH1fTeZurvZtng8vg9ni0v11+yArQoQ
	8L686JND1HMzD9+1EJ/PtykPuGZjMUe6UVfCsHXaOWPm036Y4kuaYLFyypYj1rUftqsA
	WI7jp2SskaRLGocPWmoY6/NoHZI7351dMyVcPfMkjvykJKwXZQLMvUme4s0FwnxdTIO5
	HY7k45JraQn2+waxx3W8h9LV/KGRNi73ZIzgA08167VtMjLpuC1UW/RD+FKxGxHpu8mL
	xCoQ==
X-Received: by 10.49.127.145 with SMTP id ng17mr83395862qeb.25.1358178781241; 
	Mon, 14 Jan 2013 07:53:01 -0800 (PST)
Received: from localhost.localdomain ([96.240.164.36])
	by mx.google.com with ESMTPS id gm4sm10014077qab.12.2013.01.14.07.53.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 07:53:00 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Mon, 14 Jan 2013 10:52:54 -0500
Message-Id: <1358178774-13647-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358178774-13647-1-git-send-email-philip@balister.org>
References: <1358178774-13647-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH v2 3/3] gnuradio : Update to version 3.6.3.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 16:08:35 -0000

 * Fix packaging issues for the examples package.
 * Disable build for machines without neon, since cmake detection is broken.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index aca2f97..e1a023f 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -4,8 +4,6 @@ SECTION =  "apps"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
-
 DEPENDS = "uhd gsl fftwf python alsa-lib boost cppunit \
            swig-native python-numpy python-pygtk orc qt4-x11-free qwt"
 
@@ -23,11 +21,6 @@ RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs \
 
 C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-#do_configure_append() {
-#	find ${S} -name Makefile | xargs sed -i s:'-I${STAGING_INCDIR_NATIVE'::g
-#	find ${S} -name Makefile | xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g
-#}
-
 do_configure_prepend() {
 	${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S}/gr-vocoder/lib/generate_codebook -lm
 	echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocoder/lib/generate_codebook.txt
@@ -39,7 +32,7 @@ do_compile_prepend() {
 	cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2
 }
 
-PACKAGES =+ "\
+PACKAGES += " \
   ${PN}-examples \
   ${PN}-grc \
 "
@@ -53,20 +46,21 @@ FILES_${PN} += "${prefix}/etc/gnuradio/*"
 
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
+                    ${datadir}/gnuradio/examples/*/.debug \
 		   "
 FILES_${PN}-examples = "${datadir}/gnuradio/examples"
 
-PV = "3.5.3"
+PV = "3.6.3"
 
 FILESPATHPKG_prepend = "gnuradio-git:"
 
-SRCREV = "f621a52f779381cfe550b4278b83e701a747944c"
+SRCREV = "607a6fa3f80e08298ce7b3ee74ffca1590c05164"
 
 # Make it easy to test against developer repos and branches
 GIT_REPO = "gnuradio.git"
 GIT_BRANCH = "master"
 
-SRC_URI = "git://gnuradio.org/git/${GIT_REPO};branch=${GIT_BRANCH};protocol=http \
+SRC_URI = "git://gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
 "
 
 S="${WORKDIR}/git"
@@ -78,3 +72,9 @@ EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE -DENABLE_GR_QTGUI=ON -DENABLE_GR_WXGUI=O
 
 EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
 
+# Only builds for machines with neon instructions. Problem is in upstream cmake.
+python () {
+        if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d):
+                raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
+}
+
-- 
1.7.11.7



