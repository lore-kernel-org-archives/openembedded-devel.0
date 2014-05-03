Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E23A460782
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 17:02:01 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id jy13so6930707veb.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NEhf+0hLesQtirWziVHHCWgAt+ZHImgcSiWQxTHe4I0=;
	b=IYYgKt8ByepOuOwJ27xuf0fUwxfAt+5Pr54GqCcVVhmByJNNkBbLpCExpMBcasQmEP
	OMiecAyvPWVCaPaJdAjG0iVTkjvDJ/dC2/6SHI6UjFwCTdi/gVWHXl4X/4awx1gads4K
	veT+wo1hx0nlADtre9cbfzuvxzyTW/IvlyiTSv2gOfwA61G3uzHdjV2J4/R2pV5Bxwf9
	hDJ+eyEAlBf4l73CMf2ikltHUiPQKs8ZmbW6dzIhj1qSIAeOUc6yPWUMp8jgUQNjw4ih
	XTSceoTKRmEhYxoPjSjsPMa/A8vgNUgH5p2BO/cfIkA2jWwrCqfkz9eqa+QOaQOpZu3z
	9zgw==
X-Received: by 10.221.44.73 with SMTP id uf9mr8281867vcb.9.1399136522899;
	Sat, 03 May 2014 10:02:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xr10sm3744128vec.2.2014.05.03.10.02.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 May 2014 10:02:02 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 19:02:17 +0200
Message-Id: <1399136538-6276-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][WIP][PATCH 1/2] recipes: blacklist few recipes failing in world builds for last couple of months
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
X-List-Received-Date: Sat, 03 May 2014 17:02:05 -0000

* these are failing for last couple months, blacklist them until someone
  steps up and starts maintaining them
* see http://www.openembedded.org/wiki/Bitbake_World_Status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb            | 1 +
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb                 | 3 +++
 meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb          | 2 ++
 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb                        | 3 +++
 .../recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb  | 5 +++++
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb                           | 1 +
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb                   | 2 ++
 meta-oe/recipes-support/emacs/emacs_23.4.bb                          | 2 ++
 8 files changed, 19 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
index f0b58b9..9a26642 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
+PNBLACKLIST[ifuse] = "depends on blacklisted libimobiledevice"
 DEPENDS = "fuse libimobiledevice"
 
 SRC_URI = " \
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 5c93284..4b65152 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -9,6 +9,9 @@ DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2d
 
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
+# multiple issues
+PNBLACKLIST[xbmc] = "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
+
 PV = "11.0+gitr${SRCPV}"
 PR = "r14"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Eden \
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
index acb1b1a..4839271 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://www.snort.org/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
+PNBLACKLIST[snort] = "depends on blacklisted daq"
+
 DEPENDS = "libpcap libpcre daq libdnet"
 
 
diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 2675e2a..508e304 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
+# fails in 50% of builds
+PNBLACKLIST[daq] = "| make: *** No rule to make target `install'.  Stop."
+
 DEPENDS = "libpcap libpcre "
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
index 555cce1..9f2cc49 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -5,6 +5,11 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
 "
 
+#| configure:17888: checking for native large file support
+#| configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
+#| configure:17893: error: cannot run test program while cross compiling
+PNBLACKLIST[libimobiledevice] = "cannot run test program while cross compiling"
+
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index d12973c..a7d6349 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
 SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
 
+PNBLACKLIST[tk] = "work/core2-64-oe-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to 'FcFontRenderPrepare'"
 S = "${WORKDIR}/tk${PV}/unix"
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
 inherit autotools
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 2437884..65fab1f 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -13,6 +13,8 @@ RCONFLICTS_${PN} = "mplayer"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
+PNBLACKLIST[mplayer2] = "Requires newer libav which has negative D_P"
+
 SRC_URI = "git://repo.or.cz/mplayer.git \
     file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
 "
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 36e8f0c..3db5da6 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -2,6 +2,8 @@ require emacs.inc
 
 PR = "r4"
 
+PNBLACKLIST[emacs] = "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
+
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
-- 
1.9.1


