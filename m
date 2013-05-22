Return-Path: <philip.balister@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id A6782608CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 10:35:39 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id bv4so2728310qab.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 03:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Cn328KSuRHI2ydcduD2m++P5bdVtEvv8b4ux/FS3Ktk=;
	b=RkkWJkaHFwTmEgmI43DIKsFKAwX0f5ucvAePt4Wh1hKXplWrKc6w+LJVpPE++/gCfw
	L/ryJI6dsZw/w3HXJUkWHZ7JcRrC1qVSeHB+W6tJnkECOh+IdTaKI4+ikNKa8t1QhWOy
	sFO2xvNgpra6C+lq5qwseRDrj8CoeyG6LUnH9m5f6hZ77M+Hsz1Adjrig/Tt2CkjhM37
	8ilIbe0ach/Y/c8UU4BmAt6iIufCgUeXllHg4CEAnFiW359Oecgg1JTJuVKHNaSKRxrT
	O7c3V6tdIcPeSn2M3vjJJP9rgtp+trpGw6BLWUFYJv6IikuCtYsN8N0hs5wU3qLCJEsg
	NfNw==
X-Received: by 10.224.105.75 with SMTP id s11mr6420131qao.40.1369218940623;
	Wed, 22 May 2013 03:35:40 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-170-171.ronkva.east.verizon.net. [96.240.170.171])
	by mx.google.com with ESMTPSA id hs4sm6455076qeb.8.2013.05.22.03.35.39
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 03:35:39 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 06:35:37 -0400
Message-Id: <1369218937-26345-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCHv3] gnuradio : Update recipe to build for all machines.
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
X-List-Received-Date: Wed, 22 May 2013 10:35:39 -0000

Also updated the git repo address after recent changes in hosting.

The recipe failed to build for machines without neon as a tune feature.
The cmake config options have been changed so that it configures properly
now.

Also dropped documentation from build to work around a doc generation problem.

Test on armv7a, x86, and x86-64.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index edd4615..45f4c77 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -70,7 +70,7 @@ SRCREV = "5f69899e059e9bea58f92af61f70fc3f63825087"
 GIT_REPO = "gnuradio.git"
 GIT_BRANCH = "master"
 
-SRC_URI = "git://gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
+SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
 "
 
 S="${WORKDIR}/git"
@@ -82,21 +82,18 @@ EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE \
                  -DENABLE_GR_FCD=OFF \
                  -DENABLE_GR_WXGUI=OFF \
                  -DENABLE_GR_VIDEO_SDL=OFF \
+                 -DENABLE_SPHINX=OFF -DENABLE_DOXYGEN=OFF \
                  -DIMPORT_EXECUTABLES=${S}/gr-vocoder/lib/generate_codebook.txt \
                  -DQT_HEADERS_DIR=${STAGING_INCDIR}/qt4 \
                  -DQT_QTCORE_INCLUDE_DIR=${STAGING_INCDIR}/qt4/QtCore \
                  -DQT_LIBRARY_DIR=${STAGING_LIBDIR} \
                  -DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so \
                  -DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so \
+                 ${@base_contains('TUNE_FEATURES', 'neon', \
+                     '-Dhave_mfpu_neon=1', '-Dhave_mfpu_neon=0', d)} \
 "
 
 inherit distutils-base cmake pkgconfig
 
 EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
 
-# Only builds for machines with neon instructions. Problem is in upstream cmake.
-python () {
-    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d):
-        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
-}
-
-- 
1.7.11.7


