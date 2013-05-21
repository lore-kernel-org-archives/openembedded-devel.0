Return-Path: <philip.balister@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3A43460897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:32:40 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id j11so340446qag.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=C1DdK1GHnygz1GIq9r2X8INuPzlPsI2YJUuDrz/olLo=;
	b=sGLobLQuNgJcXwI62VYYeDvHhgXpZhS5N7WIVdyun+RA6E9zvlg27v3qoskORuLX06
	UmoYQCmRLsA02i0VcB3RCc2pRcZ8ED+iG52O7eKzWKHtCIhw++3i195lTs7TpR1GMffn
	L5PcDiB30Brwl5dz8Q+IT0xosO74WuYMaZlPPhdV+J2nbu+9T3JGg7h+NTE+ZofpYhA6
	Nw6yQTqLDyaZyw+IeeFj6MYTK086+Vs48WxqvVyXNYrWlR3YZXXLQwf87niRoB2k6hbZ
	Y/vCFTKZoXqWGQtYigON3xK7nS1c4nn+y11m2bUMfwQ4+sfP39oZpgIf5ROeZWmSfcjV
	BC6Q==
X-Received: by 10.49.75.134 with SMTP id c6mr2190363qew.47.1369139560507;
	Tue, 21 May 2013 05:32:40 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-30-249.nwrknj.east.verizon.net. [71.171.30.249])
	by mx.google.com with ESMTPSA id j10sm1925396qeh.0.2013.05.21.05.32.39
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 05:32:39 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2013 08:32:36 -0400
Message-Id: <1369139556-19324-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCHv2] gnuradio : Update recipe to build on all machines again.
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
X-List-Received-Date: Tue, 21 May 2013 12:32:40 -0000

Also updated the git repo address after recent changes in hosting.

The recipe failed to build for machines without neon as a tune feature.
The cmake config options have been changed so that it configures properly
now.

Disable documentation to prevent build failures on some machines,

Tested on armv7a, x86, and x86-64.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb         | 11 ++++-------
 ...hd-firmware_003.005.002.bb => uhd-firmware_003.005.003.bb} |  0
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/uhd/{uhd-firmware_003.005.002.bb => uhd-firmware_003.005.003.bb} (100%)

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
diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
rename to meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
-- 
1.7.11.7


