Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1RcgBk-00058T-O8
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 17:35:45 +0100
Received: by eeit10 with SMTP id t10so1770484eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 08:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=g/Jch5m7+Nz7Ipe8kFqg1101JKcIOkcz9iUQCTtAYgE=;
	b=lOnP2kgYLtqYpx2cCupwDNk+zm5AOD42tH+GNxne9yudzeN45nAO3lViM0S1mk7B8G
	pp6FlfHDl5scyHSFWECmNqMeNUpukVdC27/uga+uhcmeaobBduzcLGKZEcyjD/nmO1Pt
	9m5kxeI9M1cRNleoSr8CPlrjCMLa0piSueo14=
Received: by 10.213.32.142 with SMTP id c14mr4962496ebd.77.1324312110739;
	Mon, 19 Dec 2011 08:28:30 -0800 (PST)
Received: from localhost.localdomain (qrc29-1-82-245-206-103.fbx.proxad.net.
	[82.245.206.103])
	by mx.google.com with ESMTPS id q28sm46389314eea.6.2011.12.19.08.28.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:28:29 -0800 (PST)
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2011 17:28:14 +0100
Message-Id: <1324312094-24426-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [[meta-oe]] vlc: re-add dropped depends as they are available now and add libxpm as dependency as current vlc's config depends on it.
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
X-List-Received-Date: Mon, 19 Dec 2011 16:35:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index aecfb3a..375e42e 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -4,8 +4,7 @@ LICENSE = "GPLv2"
 SECTION = "multimedia"
 
 DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
-"
-#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
@@ -13,7 +12,7 @@ inherit autotools gettext
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1"
+DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1 libxpm"
 
 LEAD_SONAME = "libvlc.so.5"
 
-- 
1.7.5.4



