Received: from mail-qc0-f176.google.com ([209.85.216.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TtleO-0000uS-R2
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 21:56:30 +0100
Received: by mail-qc0-f176.google.com with SMTP id n41so1377809qco.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 12:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=moCuOrj/KzJrSmGyMR6ij6r05Zsv0H3luUp7eB4P5mI=;
	b=WvP+v7t0d3fakDirngTPlDSFMdpFcVR8oYS6IpcUHhHypbodBvXhPAPuMLQf94wI4E
	1AB+Nc20Isl7R0cLlxoRzyyrl8EIQMtLLaui1ozcStD+236WyDQ7P6mYs2wwyvAGSBRL
	Ldc2zh9eTmruCvR1Sgw3DyMTAy74tFF1GBNiKNxUaRUkmzOLL3Y4mVBUlFEmZ6LXy1Uu
	lOp/JeMxhfOzo6Ca500i41KFHUZk96pP0BqhnhUsoPgLFiN8zJX/2Tj3N05sdiWWovSP
	2J1qlRW056E4CiTsXCSJprvzaSBkcLLsrg90igrEI0V3YKKjABLog5XAa0OJptniG3nW
	eNCw==
X-Received: by 10.49.29.135 with SMTP id k7mr74472773qeh.39.1357936873235;
	Fri, 11 Jan 2013 12:41:13 -0800 (PST)
Received: from localhost.localdomain ([96.240.164.36])
	by mx.google.com with ESMTPS id hr3sm4424378qab.4.2013.01.11.12.41.12
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 12:41:12 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2013 15:41:01 -0500
Message-Id: <1357936861-8245-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1357936861-8245-1-git-send-email-philip@balister.org>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 3/3] gnuradio : Update to version 3.6.3.
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
X-List-Received-Date: Fri, 11 Jan 2013 20:56:33 -0000

Also fixes pakcaging issues for the examples package.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index aca2f97..f084149 100644
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
-- 
1.7.11.7



