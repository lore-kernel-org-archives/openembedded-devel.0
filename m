Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cjM-0007eY-1E
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:02:20 +0200
Received: by bke11 with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ij3ZxGV1l08fLxQEjiib6cgfbP9A4kE1NL4gtcTU3t4=;
	b=KdMWcWTzAYppr4TtphaUCFjNTuW4d9Iiy9vgVlUbh5pw+2cNrMonBcuZCSjVoNHu6O
	Oay4WTv50LJFvvGoJkl5x9iB+K/x56OJSY/HU/MvpJq+bLZHe3CcCZZ+8uBDiEzZeH7H
	9NRNm6wQcKMrBF0EEWST3tH5JB78tq4pGoGn4=
Received: by 10.204.157.132 with SMTP id b4mr7684959bkx.164.1317387407816;
	Fri, 30 Sep 2011 05:56:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm4886917bkd.6.2011.09.30.05.56.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:56:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:39 +0200
Message-Id: <cover.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-oe][meta-efl][PATCH 00/15] Pull request #23
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
X-List-Received-Date: Fri, 30 Sep 2011 13:02:20 -0000

Hi,

this patchset depends on oe-core changes from:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010393.html
but first few patches from that patchset are already in master-next and we need to 
be ready to adapt.

Patch 2 will be needed as soon as 
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010401.html
is applied

and patches 9-15 depends on xserver-xf86, libx11 and mesa patches in oe-core

The following changes since commit 6786f3118988e625b7ad8d7758c94e302789693f:

  tcp-wrappers: Use the recipe from oe-core (2011-09-27 17:40:02 -0700)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (15):
  glib-2.0: upgrade from 2.29.3+git to 2.30.0 release
  xorg-driver: use renamed .inc from oe-core
  libxft, libxrender, renderproto: move native BBCLASSEXTENDs to
    oe-core
  xf86-video-omapfb: merged to oe-core
  recipes: use allarch instead of PACKAGE_ARCH = all
  e-base: bump EFL_SRCREV
  e-wm: include /usr/lib/enlightenment/modules/wizard/favorites/.order
    in FILES+${PN}
  e-wm-theme-illume-efenniht, exquisite-theme-illume,
    elementary-theme-efenniht: add LIC_FILES_CHKSUM
  xserver-xorg: drop 1.10.2 and use xserver-xf86-lite-1.11.0 from
    oe-core instead
  libx11: drop here, 1.4.4 should be in oe-core
  task-x11: use xserver-xf86-lite as default XSERVER
  xf86-video-glamo: change RDEPENDS for xserver-xf86-dri-lite
  mesa: drop, there should be mesa-7.11 in oe-core
  talloc: drop from meta-oe, no longer needed by mesa
  glx-use-tls: moved to oe-core with mesa recipes

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e17/e-wm-theme-illume-efenniht/LICENSE         |   25 +
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |   11 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   23 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |   12 +-
 .../recipes-efl/e17/exquisite-theme-illume/LICENSE |   25 +
 .../efl/elementary-theme-efenniht/LICENSE          |   25 +
 .../efl/elementary-theme-efenniht_svn.bb           |    9 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    6 +-
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |    5 +-
 meta-oe/classes/glx-use-tls.bbclass                |    7 -
 ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 -
 .../0005-glib-mkenums-interpreter.patch.patch      |   25 -
 .../60_wait-longer-for-threads-to-die.patch        |   24 +-
 .../glib-2.0/remove.test.for.qsort_r.patch         |   77 +-
 .../{glib-2.0_git.bb => glib-2.0_2.30.0.bb}        |   21 +-
 meta-oe/recipes-core/tasks/task-x11.bb             |    4 +-
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    6 +-
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
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    2 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    2 +-
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    2 +-
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    2 +-
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
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |   27 -
 55 files changed, 182 insertions(+), 3732 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
 create mode 100644 meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
 create mode 100644 meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
 delete mode 100644 meta-oe/classes/glx-use-tls.bbclass
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
 rename meta-oe/recipes-core/glib-2.0/{glib-2.0_git.bb => glib-2.0_2.30.0.bb} (61%)
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
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb

-- 
1.7.6.1



