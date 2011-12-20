Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1RcxwQ-00082K-Vz
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 12:33:07 +0100
Received: by eeit10 with SMTP id t10so2476721eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 03:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=pquDTMCpxV2H/hwbBt8H/4LukHJuIO3uzi7t1unoROo=;
	b=nvfKtMil2QVJFELJqiB5JzrMxlvQVXs5mMbaqvIb5I7REF2pnXp4z5cMf+ghCRumK9
	HlopaxcCjl6JYYen7RNeOh4Bn4cQv2p0uz1uewEHyDujg2n2VEjhdkM7YQ2PVX6rKaAC
	fmXxOGpMICbxkSlR3jlDI+cjHUCOycHM/J/ho=
Received: by 10.213.108.132 with SMTP id f4mr3633497ebp.35.1324380358955;
	Tue, 20 Dec 2011 03:25:58 -0800 (PST)
Received: from localhost.localdomain (qrc29-1-82-245-206-103.fbx.proxad.net.
	[82.245.206.103])
	by mx.google.com with ESMTPS id t59sm5566754eeh.10.2011.12.20.03.25.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 03:25:58 -0800 (PST)
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 12:01:20 +0100
Message-Id: <1324378880-6009-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [PATCH v3][meta-oe] vlc: rework dependencies
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
X-List-Received-Date: Tue, 20 Dec 2011 11:33:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * re-adds dropped depends as they are available now
 * adds libxpm as dependency as current vlc's config depends on it.
 * bumps PR
 * NOTE about ENTERPRISE_DISTRO : is that supposed to be still used or should this be replaced by something which respects COMMERCIAL_LICENSE setting ?

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc       |    5 ++---
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index aecfb3a..7353f90 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -3,9 +3,8 @@ HOMEPAGE = "http://www.videolan.org"
 LICENSE = "GPLv2"
 SECTION = "multimedia"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
-"
-#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm \
+           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
index fb69e05..9f53159 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 
 require vlc.inc
 
+PR = "r1"
+
 # work around build failure
 EXTRA_OECONF += " --enable-libxml2=no"
 
-- 
1.7.5.4



