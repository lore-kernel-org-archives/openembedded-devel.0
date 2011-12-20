Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Rcx6r-0003Tn-Hh
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 11:39:49 +0100
Received: by eeit10 with SMTP id t10so2434418eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=y9ZX6rEpcU6wL4pErOF807lL9Zx9CkQtmX1jxhey+wg=;
	b=ti7CZSoozVBRUiVoRQ1suCxwJcz8stYFZ4AlEF8Qm5GX/cnVM2+3MuZ1B9+/oAcIBE
	2snRJXQrTN9lgE2KRTtnnYvfdZJsFRuX081eujyTJEiIxANYQYnOXeZQB/fvzN21v3SE
	k19dVl8/4fQpFSJfck9a5cE1KxZ6vH5FsoI/w=
Received: by 10.14.47.79 with SMTP id s55mr729728eeb.69.1324377163235;
	Tue, 20 Dec 2011 02:32:43 -0800 (PST)
Received: from localhost.localdomain (qrc29-1-82-245-206-103.fbx.proxad.net.
	[82.245.206.103])
	by mx.google.com with ESMTPS id s16sm5152338eef.2.2011.12.20.02.32.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 02:32:42 -0800 (PST)
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 11:32:26 +0100
Message-Id: <1324377146-5691-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [PATCH v2][meta-oe] vlc: rework dependencies and removed ENTERPRISE_DISTRO as it should be covered by COMMERCIAL_LICENSE now
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
X-List-Received-Date: Tue, 20 Dec 2011 10:39:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * re-adds dropped depends as they are available now
 * removes ENTERPRISE_DISTRO as sugested by Martin Jansa
 * and adds libxpm as dependency as current vlc's config depends on it.
 * bumps PR

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc       |    3 +--
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index aecfb3a..c431f69 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -4,8 +4,7 @@ LICENSE = "GPLv2"
 SECTION = "multimedia"
 
 DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
-"
-#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+           libmad libid3tag liba52 mpeg2dec libxpm"
 
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



