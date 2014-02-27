Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id D354B6028A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 07:12:52 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id un15so2138460pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J56UoupRVXy6NtSpgeC2n5DEau78zd4raoYmoBE7zD8=;
	b=S6W13YpbP0nlycvvX9yR10AaDN7XYStrg/TcdXDtM9sYNFwbwImg1NrV0E+dg7LS5X
	h35xwPUnBjuWUmAz/ywrJ6WftuE6MS4vR5caP8a7m8eCHv85KO3jnugfNrRESWN1KBv0
	Asxb3x/rvnS4cEdhgdOpk8BmXBh4t2dcI6tEWPKRe7qpQOOWnoFdEdxgzvbmVxHCLBQq
	q48RA2pIHxI8uK7gIXDrFHUL/XiXFdfrTiz0S2zwq9In+BhZaS6Xk9uVXMYcaNlcXNFc
	NGOpwzqvbIIwJLOubfTBgbs9JOkJtLfEeLbX3s0yhcI9XX9ot89fxs3HnDurXLjiDqYc
	0/sg==
X-Received: by 10.66.26.130 with SMTP id l2mr3344338pag.107.1393485173434;
	Wed, 26 Feb 2014 23:12:53 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ug9sm7166026pbc.11.2014.02.26.23.12.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 23:12:48 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2014 23:14:31 -0800
Message-Id: <1393485271-24402-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] libmusicbrainz: workaround for build-native/do_configure
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
X-List-Received-Date: Thu, 27 Feb 2014 07:12:52 -0000

From: Tim Orling <TicoTimo@gmail.com>

* drop PR
* default cmake_do_configure deletes build/ which wipes out build-native
* workaround to stash build-native first
* <ugly>hack</ugly>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../musicbrainz/libmusicbrainz_git.bb              | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index f6a8f53..b4d1ad3 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat neon"
 
 PV = "5.0.1+git${SRCPV}"
-PR = "r1"
 
 SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
@@ -30,9 +29,55 @@ do_configure_prepend() {
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


