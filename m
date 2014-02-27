Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 59BF86F0FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:01:26 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so2647977pad.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VRJKPasfJsaMJdqLlj883gB8F1meiUF8tOw/zAYLKLc=;
	b=wRjPGN2hIXQW7qt0AOBsRHBqO1koE5PHx6XFhLIgmOLWRZh9oWW3NrdfLrvtgbzxlP
	+FCkmQoWMJ6emYxxq7z/rlCpP0a5u58agQT3O6z72hT10Z9icwy/QcZd4FEdJyohQjYR
	MTwX7lWQyRVV+NuZ18IPWnPGjn/XPXk2p5bY/LK8BVEtlR58vM9J2NoTKtr8HRXOqpc/
	7n9CZ9++EiFuRsRyOxHoTpm9Ei0t1VUFzx1xjYmfsj31grP07NjcdP6qfWXOglMph5Xd
	uB0HMMYhaacUK9qTFYPAKXHhoz0WFP4yZyos8C/1dQy0TDnT30Vh31C4wKUGGP5LT0XD
	Mktg==
X-Received: by 10.67.5.39 with SMTP id cj7mr4068626pad.7.1393516885550;
	Thu, 27 Feb 2014 08:01:25 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	it4sm14767129pbc.39.2014.02.27.08.01.18 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 08:01:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 08:03:06 -0800
Message-Id: <1393516986-25391-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH v2] libmusicbrainz: workaround for build-native/do_configure
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
X-List-Received-Date: Thu, 27 Feb 2014 16:01:27 -0000

From: Tim Orling <TicoTimo@gmail.com>

Changes in v2:
    bump PR to r2 rather than drop (doh!)

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../musicbrainz/libmusicbrainz_git.bb              | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index f6a8f53..2928587 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat neon"
 
 PV = "5.0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
@@ -30,9 +30,55 @@ do_configure_prepend() {
           -DCMAKE_C_COMPILER=${BUILD_CC} \
           -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
           -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
-          ..
+          ${S} 
     make make-c-interface
     cd ..
+
+    # the first thing cmake_do_configure does is delete ${B}
+    # stash it first
+    cp -r build-native ..
+}
+
+# recreate default here, with work around for build-native
+cmake_do_configure() {
+	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
+		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
+	fi
+
+	if [ "${S}" != "${B}" ]; then
+		rm -rf ${B}
+		mkdir -p ${B}
+		cd ${B}
+	fi
+
+	# bring build-native back into build/
+	mv ../build-native .
+
+	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
+	if [ -e ${WORKDIR}/site-file.cmake ] ; then
+		OECMAKE_SITEFILE=" -C ${WORKDIR}/site-file.cmake"
+	else
+		OECMAKE_SITEFILE=""
+	fi
+
+	cmake \
+	  ${OECMAKE_SITEFILE} \
+	  ${S} \
+	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
+	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
+	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
+	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
+	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
+	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir} \
+	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
+	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir} \
+	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir} \
+	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir} \
+	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
+	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
+	  -DCMAKE_VERBOSE_MAKEFILE=1 \
+	  ${EXTRA_OECMAKE} \
+	  -Wno-dev
 }
 
 EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
-- 
1.8.3.2


