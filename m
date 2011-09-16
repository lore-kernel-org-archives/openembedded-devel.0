Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Yz8-0003Aw-Gw
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:01:42 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1786584fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fuEjG4GocDODvjbIuUEdw8pJlEBNmZI7z6blis2HWEg=;
	b=r2MZZyOu1tebwMKsofXHMaj0kV2O638SgFB7U6Qod37TkEsF9yl1XPSgUVonn3cQFD
	F6xj6U2ZK8ApCv8AlA/pRug7AijN58RUhfwRTCx/waouO3fMXQ463stw4ufzx3NVoJp2
	0+zySm6CbSg/co/oupJdEPf+JAl3LS595/reg=
Received: by 10.223.101.84 with SMTP id b20mr494886fao.94.1316181392120;
	Fri, 16 Sep 2011 06:56:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm1269304fah.24.2011.09.16.06.56.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:07 +0200
Message-Id: <e18a18842f027546d0a38396d498246513d338fa.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/10] vlc: drop depends not yet in meta-oe
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
X-List-Received-Date: Fri, 16 Sep 2011 14:01:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index ce608dc..aecfb3a 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -4,7 +4,8 @@ LICENSE = "GPLv2"
 SECTION = "multimedia"
 
 DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+"
+#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
-- 
1.7.6.1



