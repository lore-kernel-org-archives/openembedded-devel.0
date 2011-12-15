Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbALO-0005b5-Bj
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:23:26 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SN9PU4jJWdjit30nKeRio467A51nXjcJlIpyK1TVulE=;
	b=S4RpHt584YZXNq3wMtDtUi1GbW0Xo8H0hLTmpcWlne9YlwRAqNBrbzz8DEgR7I/EsA
	l79W43qIy6c66Ys3/xEJNFy64JBe7CDAbfFEOeU2fhBjSNdPKpZmkdMDYsLR+qTajzBo
	3tJtnH99j1OVKYe6y/GjN+UEH2J5AO5Njj1zU=
Received: by 10.213.35.18 with SMTP id n18mr391305ebd.148.1323951390818;
	Thu, 15 Dec 2011 04:16:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm23527552eeb.4.2011.12.15.04.16.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:52 +0100
Message-Id: <897c9f1a072c5a372cd1d367c308baa9685911a0.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
References: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 5/6] pixman, libav, libvpx, fftwf: bump PR after arm OVERRIDES changes in oe-core
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
X-List-Received-Date: Thu, 15 Dec 2011 12:23:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/pixman_0.24.0.bbappend                |    2 +-
 meta-oe/recipes-multimedia/libav/libav.inc         |    2 +-
 meta-oe/recipes-multimedia/webm/libvpx.inc         |    2 +-
 meta-oe/recipes-support/fftw/fftwf_3.2.2.bb        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend
index 61a9558..ea28422 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.0.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 DEPENDS += "perl-native"
 BBCLASSEXTEND = "native"
 
-PRINC = "6"
+PRINC = "7"
 
 SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
 
diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index c8277f9..89b14ca 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
 # faac faad2 lame schroedinger libgsm
 DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx.inc b/meta-oe/recipes-multimedia/webm/libvpx.inc
index 76e319f..fbece03 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx.inc
+++ b/meta-oe/recipes-multimedia/webm/libvpx.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2"
 S = "${WORKDIR}/libvpx-v${PV}"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.2.2.bb b/meta-oe/recipes-support/fftw/fftwf_3.2.2.bb
index da3fc6f..466ba8d 100644
--- a/meta-oe/recipes-support/fftw/fftwf_3.2.2.bb
+++ b/meta-oe/recipes-support/fftw/fftwf_3.2.2.bb
@@ -1,6 +1,6 @@
 require fftw.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz \
            file://vesperix-neon.patch \
-- 
1.7.8



