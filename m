Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAidW-0003sw-Tm
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:32:51 +0200
Received: by bke11 with SMTP id 11so5354032bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5UryjT6Tn0RogexkNxBslxpJ9unOdLOS5DkcxLKwMUo=;
	b=SFg9a6GGwIMgxxcjE8p4OOsRYwPH5jH/+KVVxnWcY8/vXd/2aYCysDIwWdao/Q+ahY
	NY813FC6GnYTYMWDVtXSymU0DAdasHGyowDCuBW6yml6THzi9rn/UA+ONYOriXkAenT6
	ip+n1WeSVvqYP2t+gxDgLW4uQq4OMcOhcUkoM=
Received: by 10.223.52.141 with SMTP id i13mr18992395fag.74.1317648429205;
	Mon, 03 Oct 2011 06:27:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b10sm21299018fam.1.2011.10.03.06.27.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:27:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:00 +0200
Message-Id: <cover.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <20111003114741.GO7364@jama.jama.net>
References: <20111003114741.GO7364@jama.jama.net>
Subject: [meta-oe][meta-efl][PATCHv2 00/25] Pull request #23
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
X-List-Received-Date: Mon, 03 Oct 2011 13:32:51 -0000

Hi,

this patchset depends on oe-core changes from:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010393.html
but first few patches from that patchset are already in master-next and we need to
be ready to adapt.

And some changes depend on
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010447.html

Regards,

The following changes since commit b297ece0b5663aca97d30927a32c20ccce97eb2a:

  systemd: update to latest git (2011-10-02 20:08:50 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (25):
  xorg-driver: use renamed .inc from oe-core
  libxft, libxrender, renderproto: move native BBCLASSEXTENDs to
    oe-core
  xf86-video-omapfb: merged to oe-core
  xserver-xorg: drop 1.10.2 and use xserver-xf86-lite-1.11.0 from
    oe-core instead
  libx11: drop here, 1.4.4 should be in oe-core
  mesa: drop, there should be mesa-7.11 in oe-core
  talloc: drop from meta-oe, no longer needed by mesa
  glx-use-tls: moved to oe-core with mesa recipes
  recipes: use allarch instead of PACKAGE_ARCH = all
  glib-2.0: drop 2.29.3+git from meta-oe, there should be 2.30.0 in
    oe-core
  gdbus-binding-tool: drop from meta-oe, superseeded by glib-2.30.0
    where it's included
  pango: upgrade to 1.29.4
  poppler-data: upgrade from 0.4.0 to 0.4.5
  poppler: upgrade from 0.12.3 to 0.18.0
  python-cython: upgrade to 0.15.1 because 0.13 doesn't work with
    python-2.7.2
  python-cython: add patch to fix build error with some distutils
    packages
  pidgin: package purple-2/libymsg.so to libpurple-dev
  e-base: bump EFL_SRCREV
  e-wm: include /usr/lib/enlightenment/modules/wizard/favorites/.order
    in FILES+${PN}
  e-wm-theme-illume-efenniht, exquisite-theme-illume,
    elementary-theme-efenniht: add LIC_FILES_CHKSUM
  elementary: fir order of PACKAGES
  epdf: fix build with poppler >= 0.16
  elementary, ethumb, libeflvala: bump PR to rebuild against newer
    poppler
  python-efl: use INC_PR
  elfe: bump PR to rebuild against newer poppler

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../recipes-devtools/python/python-ecore_svn.bb    |    1 +
 .../recipes-devtools/python/python-edbus_svn.bb    |    1 +
 .../recipes-devtools/python/python-edje_svn.bb     |    1 +
 meta-efl/recipes-devtools/python/python-efl.inc    |    2 +-
 .../python/python-elementary_svn.bb                |    1 +
 .../recipes-devtools/python/python-emotion_svn.bb  |    1 +
 .../recipes-devtools/python/python-evas_svn.bb     |    1 +
 .../e17/e-wm-theme-illume-efenniht/LICENSE         |   25 +
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |   11 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   23 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |   12 +-
 .../recipes-efl/e17/exquisite-theme-illume/LICENSE |   25 +
 .../efl/elementary-theme-efenniht/LICENSE          |   25 +
 .../efl/elementary-theme-efenniht_svn.bb           |    9 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    4 +-
 .../efl/epdf/epdf.poppler-0.16.api.change.patch    |   11 +
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    6 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    1 +
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 +
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    6 +-
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |    5 +-
 meta-oe/classes/glx-use-tls.bbclass                |    7 -
 meta-oe/recipes-core/glib-2.0/glib-2.0.inc         |    6 -
 ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 -
 .../0005-glib-mkenums-interpreter.patch.patch      |   25 -
 .../60_wait-longer-for-threads-to-die.patch        |   33 -
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   38 -
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 -
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |   24 -
 .../recipes-core/glib-2.0/glib-2.0/no-iconv.patch  |  104 -
 .../glib-2.0/remove.test.for.qsort_r.patch         |   54 -
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb      |   32 -
 meta-oe/recipes-core/glib-2.0/glib.inc             |   38 -
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    6 +-
 .../gdbus-binding-tool/gdbus-binding-tool/COPYING  |  482 ----
 .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |   37 -
 ...pend-docs-to-_Extension.extension.__doc__.patch |   27 +
 ...thon-cython_0.13.bb => python-cython_0.15.1.bb} |   11 +-
 meta-oe/recipes-graphics/mesa/README               |   12 -
 meta-oe/recipes-graphics/mesa/mesa-7.10.2.inc      |   19 -
 .../recipes-graphics/mesa/mesa-7.10.2/glamo.patch  | 2425 --------------------
 .../recipes-graphics/mesa/mesa-7.10.2/uclibc.patch |   26 -
 meta-oe/recipes-graphics/mesa/mesa-common.inc      |   49 -
 meta-oe/recipes-graphics/mesa/mesa-dri.inc         |   27 -
 meta-oe/recipes-graphics/mesa/mesa-dri_7.10.2.bb   |    4 -
 meta-oe/recipes-graphics/mesa/mesa-xlib.inc        |    5 -
 meta-oe/recipes-graphics/mesa/mesa-xlib_7.10.2.bb  |    4 -
 meta-oe/recipes-graphics/mesa/mesa_7.10.2.bb       |    6 -
 .../pango/pango-1.28.3/no-tests.patch              |   10 -
 .../pango/pango-1.29.4/no-tests.patch              |   11 +
 meta-oe/recipes-graphics/pango/pango_1.28.3.bb     |    9 -
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    9 +
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    4 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 +-
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    4 +-
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    4 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    4 +-
 .../xf86-video-omapfb/0001-blacklist-tv-out.patch  |   28 -
 ...virtual-size-when-configuring-framebuffer.patch |   26 -
 .../xf86-video-omapfb/0003-force-plain-mode.patch  |   26 -
 .../0004-Attempt-to-fix-VRFB.patch                 |  320 ---
 .../xorg-driver/xf86-video-omapfb_git.bb           |   27 -
 .../xorg-lib/libx11-1.4.3/keysymdef_include.patch  |   19 -
 .../libx11-1.4.3/x11_disable_makekeys.patch        |   29 -
 meta-oe/recipes-graphics/xorg-lib/libx11.inc       |   52 -
 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb  |   11 -
 .../xorg-lib/libxft_2.2.0.bbappend                 |    1 -
 .../xorg-lib/libxrender_0.9.6.bbappend             |    1 -
 .../xorg-proto/renderproto_0.11.1.bbappend         |    1 -
 .../xorg-xserver/xorg-xserver-common.inc           |  126 -
 .../50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch |   61 -
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 -
 .../hack-fbdev-ignore-return-mode.patch            |   39 -
 .../xserver-xorg-1.10.2/randr-support.patch        |  102 -
 .../replace-pkgconfig-sdkdir-poking.patch          |   33 -
 .../xorg-xserver/xserver-xorg_1.10.2.bb            |   33 -
 .../recipes-navigation/navit/navit-icons_svn.bb    |    7 +-
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb |    7 +-
 meta-oe/recipes-support/pidgin/pidgin.inc          |    3 +-
 ...poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} |    6 +-
 meta-oe/recipes-support/poppler/poppler_0.12.3.bb  |   10 -
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |   10 +
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |   27 -
 85 files changed, 213 insertions(+), 4594 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
 create mode 100644 meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
 create mode 100644 meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
 create mode 100644 meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch
 delete mode 100644 meta-oe/classes/glx-use-tls.bbclass
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0.inc
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib.inc
 delete mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool/COPYING
 delete mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
 rename meta-oe/recipes-devtools/python/{python-cython_0.13.bb => python-cython_0.15.1.bb} (68%)
 delete mode 100644 meta-oe/recipes-graphics/mesa/README
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2.inc
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2/glamo.patch
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2/uclibc.patch
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-common.inc
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-dri_7.10.2.bb
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-xlib.inc
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa_7.10.2.bb
 delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch
 create mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.28.3.bb
 create mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-blacklist-tv-out.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} (77%)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.12.3.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb

-- 
1.7.7



