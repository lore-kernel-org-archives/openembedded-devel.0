Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Yyr-0003Aw-6q
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:01:25 +0200
Received: by fxi1 with SMTP id 1so1786584fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mjSnPtmc2cbHzn9weqjSFXarP/toKNdL7SpYDmpEtcs=;
	b=p4EFSCiPqdyg1PnhVoRfe5Hh42VpI4tNxZvEA1KmLp/xSZtnzU3haf+Qal5D8i7s4Y
	0rWDRzLxpfcqsRoq4PF6T0KO6qnn6JCaiaBbWMmO4Olv3XWEvtAIpmFsnBiTT9b1teRO
	DkPs1fuGjSoJrqs+L7m/Na8kOA5+uFqTiFDLE=
Received: by 10.223.36.68 with SMTP id s4mr2869029fad.92.1316181370610;
	Fri, 16 Sep 2011 06:56:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm10614200fag.21.2011.09.16.06.56.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:00 +0200
Message-Id: <cover.1316181282.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-oe][PATCH 00/10] Pull request #22
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
X-List-Received-Date: Fri, 16 Sep 2011 14:01:25 -0000

First few "safe" changes from jansa/x11.. more stuff will come 
when oe-core-contrib/jansa/x11 is applied in oe-core..

The following changes since commit 9c4ff53d2fa688581d257eb7e045f9e6a20470d3:

  vlc: update to 1.1.11 and fix xml2 build (2011-09-15 15:59:26 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (10):
  connman: drop initscript file used by SHR
  vlc: drop depends not yet in meta-oe
  xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc
    to RDEPENDS on xserver-xf86-config from oe-core and bsp layers
  pointercal-xinput: move machine specific files to their bsp layers,
    remove SECTION
  xserver-xorg: drop 1.9.4 and git version
  xcb: drop from meta-oe, now it's in oe-core
  xorg-app: use xorg-app-common.inc from oe-core
  xorg-driver: use .inc files from oe-core
  task-x11: define better default XSERVER/XSERVER_COMMON values and
    make whole recipe MACHINE_ARCH
  libdrm-2.4.25: drop from meta-oe, now there is 2.4.26 in oe-core

 .../connman/connman/shr/connman                    |   42 -
 meta-oe/recipes-core/tasks/task-x11.bb             |   10 +-
 .../recipes-graphics/drm/libdrm-2.4.25/glamo.patch | 1095 --------------------
 .../drm/libdrm-2.4.25/installtests.patch           |   49 -
 meta-oe/recipes-graphics/drm/libdrm_2.4.25.bb      |   37 -
 .../recipes-graphics/xcb/libpthread-stubs_0.3.bb   |   25 -
 meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend   |    2 -
 .../recipes-graphics/xcb/xcb-proto_1.6.bbappend    |    2 -
 .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 -
 .../pointercal-xinput/nokia900/pointercal.xinput   |    2 -
 .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 -
 .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |    4 +-
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    4 +-
 meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb     |    4 +-
 meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb |    4 +-
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    4 +-
 meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb  |    4 +-
 .../recipes-graphics/xorg-app/xorg-app-common.inc  |   15 -
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb    |    4 +-
 meta-oe/recipes-graphics/xorg-app/xterm_266.bb     |    4 +-
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    4 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 +-
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    5 +-
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    4 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    4 +-
 .../xorg-driver/xf86-video-omapfb_git.bb           |    5 +-
 .../xorg-driver/xorg-driver-common.inc             |   40 -
 .../xorg-driver/xorg-driver-input.inc              |    4 -
 .../xorg-driver/xorg-driver-video.inc              |    4 -
 .../xorg-xserver/xorg-xserver-common.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch |   22 -
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 -
 .../hack-fbdev-ignore-return-mode.patch            |   39 -
 .../xserver-xorg-1.9.4/randr-support.patch         |  102 --
 .../xserver-xorg-conf/am3517-evm/xorg.conf         |   29 -
 .../xserver-xorg-conf/am37x-evm/xorg.conf          |   29 -
 .../xserver-xorg-conf/archos5/xorg.conf            |   29 -
 .../xserver-xorg-conf/archos5it/xorg.conf          |   29 -
 .../xserver-xorg-conf/at91sam9263ek/xorg.conf      |   11 -
 .../xserver-xorg-conf/at91sam9g45ek/xorg.conf      |   23 -
 .../xserver-xorg-conf/babbage/xorg.conf            |   56 -
 .../xserver-xorg-conf/beagleboard/xorg.conf        |   29 -
 .../xorg-xserver/xserver-xorg-conf/bug/xorg.conf   |   75 --
 .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |   37 -
 .../xserver-xorg-conf/cm-t35/xorg.conf             |   29 -
 .../xserver-xorg-conf/dm37x-evm/xorg.conf          |   29 -
 .../xserver-xorg-conf/eee701/xorg.conf             |   97 --
 .../xserver-xorg-conf/htcdream/xorg.conf           |   69 --
 .../xserver-xorg-conf/htcleo/xorg.conf             |   73 --
 .../xserver-xorg-conf/igep0020/xorg.conf           |   29 -
 .../xorg-xserver/xserver-xorg-conf/ion/xorg.conf   |   51 -
 .../xserver-xorg-conf/iphone3g/xorg.conf           |   29 -
 .../xorg-xserver/xserver-xorg-conf/mh355/xorg.conf |   47 -
 .../xserver-xorg-conf/nokia800/xorg.conf           |   29 -
 .../xserver-xorg-conf/nokia900/xorg.conf           |   62 --
 .../xserver-xorg-conf/om-gta01/xorg.conf           |   49 -
 .../xserver-xorg-conf/om-gta02/xorg.conf           |   55 -
 .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   24 -
 .../xserver-xorg-conf/omap3-touchbook/xorg.conf    |   25 -
 .../xorg-xserver/xserver-xorg-conf/omap3/xorg.conf |   29 -
 .../xserver-xorg-conf/omap3evm/xorg.conf           |   29 -
 .../xserver-xorg-conf/omapzoom/xorg.conf           |   29 -
 .../xserver-xorg-conf/omapzoom2/xorg.conf          |   29 -
 .../xserver-xorg-conf/omapzoom36x/xorg.conf        |   29 -
 .../xorg-xserver/xserver-xorg-conf/overo/xorg.conf |   29 -
 .../xserver-xorg-conf/palmpre/xorg.conf            |   58 -
 .../xserver-xorg-conf/ronetix-pm9263/xorg.conf     |   47 -
 .../xorg-xserver/xserver-xorg-conf/spitz/xorg.conf |   49 -
 .../xserver-xorg-conf/vortex86sx/xorg.conf         |   13 -
 .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 -
 .../xserver-xorg-conf/xilinx-virtex5/xorg.conf     |   38 -
 .../xorg-xserver/xserver-xorg-conf_0.1.bb          |   17 -
 .../xorg-xserver/xserver-xorg_1.10.2.bb            |    2 +-
 .../xorg-xserver/xserver-xorg_1.9.4.bb             |   31 -
 .../xorg-xserver/xserver-xorg_git.bb               |   38 -
 meta-oe/recipes-multimedia/vlc/vlc.inc             |    3 +-
 77 files changed, 34 insertions(+), 3088 deletions(-)
 delete mode 100755 meta-oe/recipes-connectivity/connman/connman/shr/connman
 delete mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.25/glamo.patch
 delete mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
 delete mode 100644 meta-oe/recipes-graphics/drm/libdrm_2.4.25.bb
 delete mode 100644 meta-oe/recipes-graphics/xcb/libpthread-stubs_0.3.bb
 delete mode 100644 meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb

-- 
1.7.6.1



