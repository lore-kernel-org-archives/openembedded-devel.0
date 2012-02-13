Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwyLq-0007jS-3D
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:02:02 +0100
Received: by eaal10 with SMTP id l10so1517922eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tdlUxtfBn5k5wvPfFGKknJkx+S8QL5AskKdoZE2xK2Y=;
	b=kYdBxFQIumrbH2KWG70fSNKvHUiYNKXUXeV6Xn+8dkGVE1IuLrnMf6P5uC6jWGX5MN
	UVdCGrysxzSdD3NUbA1dzpS9QiEA670lFwy43zoVDyzkxxe+b3KuxZKGE/IEO2DNXFYD
	8CgJODpNynBz7Sv/Y4OEIv4DKn+HroXR76c9A=
Received: by 10.14.126.10 with SMTP id a10mr5374257eei.42.1329148432702;
	Mon, 13 Feb 2012 07:53:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm62336395eei.3.2012.02.13.07.53.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:53:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:53:41 +0100
Message-Id: <cover.1329148318.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 0/4] PR bumps for missing libz.la, gdb python support moved to oe-core, ecore fix
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
X-List-Received-Date: Mon, 13 Feb 2012 16:02:02 -0000

Please apply only after similar patchset is applied in oe-core.

The following changes since commit 724ec1ea4ff52b88bf1f6970557e44768214fd7b:

  systemd: move to v40 and don't kill user processes on exit (2012-02-07 16:06:19 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  ecore: move /usr/lib/ecore/immodules/xim.so from ${PN}-dev to
    ${PN}-imf"
  libgcrypt: drop .bbappend, native is now provided by oe-core
  recipes: bump PR to rebuild .la files without libz.la
  gdb-cross-canadian: drop .bbappned, doesn't work for me, fixed
    version sent to oe-core

 .../recipes-devtools/python/python-ecore_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 .../python/python-elementary_svn.bb                |    2 +-
 .../recipes-devtools/python/python-evas_svn.bb     |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/ecore.inc                 |   11 +++++++----
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    1 +
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    1 +
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    2 +-
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |    2 ++
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |    2 ++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |    2 +-
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |    2 +-
 .../gobject-introspection_git.bb                   |    1 +
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb       |    2 ++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb  |    2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |    1 +
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |    2 +-
 .../libgpewidget/libgpewidget_0.117.bb             |    2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    2 ++
 .../gdb/gdb-cross-canadian_7.4.bbappend            |   20 --------------------
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |    2 ++
 .../mml-widget/gtkmathview_0.8.0.bb                |    2 ++
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb         |    2 +-
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb   |    2 ++
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb |    2 ++
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 ++
 .../recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb  |    2 +-
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |    2 ++
 .../libsdl-image/libsdl-image_1.2.10.bb            |    2 +-
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    2 ++
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    2 ++
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb  |    2 +-
 .../imagemagick/imagemagick_6.4.4.bb               |    2 +-
 .../libgcrypt/libgcrypt_1.5.0.bbappend             |    2 --
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |    2 +-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |    2 +-
 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb     |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |    2 ++
 51 files changed, 68 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.4.bbappend
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend

-- 
1.7.8.4



