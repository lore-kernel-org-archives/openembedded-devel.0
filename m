Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6606ADB4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:06 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id m6so1383490wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=i/OenXmYf1MK/dnhcX+TOXp4a3VuEQm3BuSwsHT5AO0=;
	b=smnyQa9VBTmG3lvWTlmoEjbxhPfxyksxclP/DXg9FWmA4tt2Ey/wd19hBWPYhTfKwy
	GLrBb8Dv48w1uwSE3L4JnPhO+stU96Lub8xgQ0/g5u9hcy9cjtC0Ouf/r6dzi+QPbZ0o
	h3qLG/P0O+CnlgsqBBvpI+2GM9Dis3oXSYK9DqbxVnbG6guWa7OwI2VCRxFKuDRuGqQQ
	oR0Van1Z8OhwaUuMoQgKsBtgS+16j4nLxK3elJWNul1+jmJ9udz47DZWPQ28G/JFDsIJ
	q00TMVqnyYIdUESy//8pVvnVM110HIP+ddKhlSdVu9cMeY7nBsxoYaSX2lKRqLOWgAvt
	s0IA==
X-Received: by 10.194.21.138 with SMTP id v10mr3950313wje.16.1371907747233;
	Sat, 22 Jun 2013 06:29:07 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.05
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:06 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:37 +0100
Message-Id: <1371907719-8868-5-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 4/6] vlc: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:07 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 531a018..f3d8a03 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -3,8 +3,7 @@ HOMEPAGE = "http://www.videolan.org"
 LICENSE = "GPLv2"
 SECTION = "multimedia"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
@@ -65,11 +64,12 @@ EXTRA_OECONF = "\
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
-    ${@base_conditional('ENTERPRISE_DISTRO', '1', \
-	'--disable-mad --disable-id3tag --disable-a52 --disable-libmpeg2', \
-	'--enable-mad --enable-id3tag --enable-a52 --enable-libmpeg2', d)} \
 "
 
+PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[id3tag] = "--enable-id3tag,--disable-id3tag,libid3tag"
+PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
+PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
 
 do_configure() {
     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
-- 
1.8.3.1


