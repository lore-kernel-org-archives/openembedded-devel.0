Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UbuVq-0001e3-0u
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 17:18:07 +0200
Received: by mail-vb0-f49.google.com with SMTP id q12so5218299vbe.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2013 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=XKD2FCF+dPzcMCms2aPe3Na94VllfTIxKpM6ZvrIHN4=;
	b=YkDULhdPA1p8/seC7M4klZ+mtF1q3V8TOOQDlV35MXgTp6jzKIUoo6BOYg97YeOsmR
	fOkFl1P27WgnXGZ9W2bpOZE6ybbKdE9KWmHGC9+UgthfMwlf12e1u6AxCfYZHs5dVzLG
	JQaf7v0Fx2RVugWF3pHvx9dXBZ5jZASOEKHA/WJ5ZGCV8tMDE3WZtPh87BPsSfA28+/3
	Ff/e4bFmX53RUGpWdYtoko6iA6RkLKrPKiDMOp9dKluv7l/JBHmQxH4ygPcc4Qdp0kQo
	so2QTIKzUnuZqZnmi2V98noSyWauf0hdqhHPnkH1vStEDz8IUvcZEMivy3MKqwNKs+md
	E2Cw==
X-Received: by 10.220.82.3 with SMTP id z3mr18875467vck.18.1368457190052;
	Mon, 13 May 2013 07:59:50 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-30-249.nwrknj.east.verizon.net. [71.171.30.249])
	by mx.google.com with ESMTPSA id q5sm13394127vdj.5.2013.05.13.07.59.48
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 07:59:49 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 10:59:45 -0400
Message-Id: <1368457185-8140-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] gnuradio : Update recipe to build on all machines again.
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
X-List-Received-Date: Mon, 13 May 2013 15:18:12 -0000

Also updated the git repo address after recent changes in hosting.

The recipe failed to build for machines without neon as a tune feature.
The cmake config options have been changed so that it configures properly
now.

Test on armv7a, x86, and x86-64.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index edd4615..9e6998b 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -70,7 +70,7 @@ SRCREV = "5f69899e059e9bea58f92af61f70fc3f63825087"
 GIT_REPO = "gnuradio.git"
 GIT_BRANCH = "master"
 
-SRC_URI = "git://gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
+SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
 "
 
 S="${WORKDIR}/git"
@@ -88,15 +88,11 @@ EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE \
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



