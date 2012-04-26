Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOIk-0005LL-3Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:02 +0200
Received: by wera1 with SMTP id a1so777913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=xonNLvlqcn4X8sAYL2w5PzJRt7mTRt8p5YVBD46DT9c=;
	b=Ko4JzKqalyD2iQ36HoQxFCqgyY/HyCAldJdnQIpXW0x4F0Cd1PmigiDGhQtFYZsp6N
	HjwhXU0HWf5Fnslk3hRh/iHR/WcS6oTfFf96iVGg127zeZZjrMRob+BNNrqxHNHDCJjr
	5Nizg18UhXZsQkrqzttxAwFQWlnL7CdrYpvr1ueAppib5tjDMcSQ2RXPNaKIQxNjJR83
	kX/dQ8Jrd8Uv+np4PpOg24aKq+r7TFu5v96X7EYYQUhl31h0j9fkVeidf4W5Ol03IG+o
	khgmn+rZhTVRwIkSwbJGWU/2k05Cq05IwYo+c7lAuHuyH56n1u7DAgJDtiwDwglF4kUo
	r+gw==
Received: by 10.216.142.103 with SMTP id h81mr2395840wej.62.1335444625047;
	Thu, 26 Apr 2012 05:50:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm44570552wib.4.2012.04.26.05.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:50:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:05 +0200
Message-Id: <cover.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [[meta-oe][meta-efl] 00/15] kernel.bbclass sync, new efl release, systemd machine support, update for oe-core changes
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:02 -0000

The following changes since commit 1c2e52a30e7714931bb40a3812eff3cfd36def8a:

  xserver-common: drop xinput-calibrator call as it is done by xdg now (2012-04-25 13:58:56 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Andreas Oberritter (1):
  {kernel, module}.bbclass: don't run depmod for module packages during
    do_rootfs

Martin Jansa (13):
  kernel.bbclass: resync with oe-core version
  systemd.bbclass: allow recipe to inherit systemd with empty
    SYSTEMD_SERVICE
  systemd-machine-units: add machine specific recipe for BSPs
  e-base: bump EFL_SRCREV for 1.2
  meta-efl: add recipes for new released versions
  efl-from-svn.inc: rename
  eio: fix LIC_FILES_CHKSUM
  expedite: add LIC_FILES_CHKSUM
  README: keep PATCH prefix in subject-prefix, some people filter their
    inbox based on that
  qt4: rename bbappends to match 4.8.1 from oe-core
  librsvg, cairo, pixman, tiff, libgpg-error: remove native support,
    was moved to oe-core
  libusb*: remove native support, was moved to oe-core
  pango: native support and --disable-introspection moved to oe-core
    pango.inc

Saul Wold (1):
  kernel: Fix packaging issue

 meta-efl/README                                    |    2 +-
 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../{efl-from-svn.inc => efl-from-svn-recipes.inc} |   17 ++++-
 meta-efl/recipes-efl/e17/e-module.inc              |    2 +-
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    1 -
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    1 -
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |    1 -
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |    1 -
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/elmdentica_svn.bb         |    1 -
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |    1 -
 meta-efl/recipes-efl/e17/eve_svn.bb                |    1 -
 meta-efl/recipes-efl/e17/exalt_svn.bb              |    1 -
 meta-efl/recipes-efl/e17/expedite.inc              |   28 +++++++
 meta-efl/recipes-efl/e17/expedite_1.2.0.bb         |   10 +++
 meta-efl/recipes-efl/e17/expedite_svn.bb           |   35 ++-------
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    1 -
 meta-efl/recipes-efl/e17/exquisite_svn.bb          |    1 -
 meta-efl/recipes-efl/e17/places_svn.bb             |    2 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/e17/waker_svn.bb              |    1 -
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |    1 -
 meta-efl/recipes-efl/efl/ecore.inc                 |   20 +-----
 meta-efl/recipes-efl/efl/ecore_1.2.0.bb            |   11 +++
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    6 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                |    1 -
 meta-efl/recipes-efl/efl/edbus.inc                 |   14 +---
 meta-efl/recipes-efl/efl/edbus_1.2.0.bb            |   11 +++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    6 +-
 meta-efl/recipes-efl/efl/edje.inc                  |    4 +-
 meta-efl/recipes-efl/efl/edje_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/edje_svn.bb               |    6 +-
 meta-efl/recipes-efl/efl/eet_1.6.0.bb              |   10 +++
 meta-efl/recipes-efl/efl/eet_svn.bb                |    6 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/eeze_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    6 +-
 .../efl/efreet/changeset_trunk_r57435.patch        |   11 ---
 meta-efl/recipes-efl/efl/efreet_1.2.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    6 +-
 meta-efl/recipes-efl/efl/eina.inc                  |    2 -
 meta-efl/recipes-efl/efl/eina_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/eina_svn.bb               |    4 +-
 meta-efl/recipes-efl/efl/eio.inc                   |    1 +
 meta-efl/recipes-efl/efl/eio_1.0.0.bb              |   10 +++
 meta-efl/recipes-efl/efl/eio_svn.bb                |    6 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    1 -
 meta-efl/recipes-efl/efl/elementary.inc            |   71 +++++++++++++++++
 meta-efl/recipes-efl/efl/elementary_1.0.0.bb       |   10 +++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |   82 ++------------------
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/embryo.inc                |    7 +--
 meta-efl/recipes-efl/efl/embryo_1.2.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/emotion.inc               |   17 ++++
 meta-efl/recipes-efl/efl/emotion_1.0.0.bb          |   10 +++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |   25 ++----
 meta-efl/recipes-efl/efl/engrave_svn.bb            |    1 -
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/epeg_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/ethumb.inc                |   22 +++++
 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |   29 ++-----
 meta-efl/recipes-efl/efl/evas.inc                  |   27 +------
 meta-efl/recipes-efl/efl/evas_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/evas_svn.bb               |    6 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    1 -
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 -
 meta-efl/recipes-efl/efl/libeweather_svn.bb        |    1 -
 .../recipes-gnome/librsvg/librsvg_2.32.1.bbappend  |    2 -
 meta-gpe/README                                    |    2 +
 meta-initramfs/README                              |    2 +
 meta-multimedia/README                             |    2 +-
 meta-oe/README                                     |    2 +-
 meta-oe/classes/kernel.bbclass                     |   70 ++++++++--------
 meta-oe/classes/systemd.bbclass                    |   11 +--
 .../systemd/systemd-machine-units_1.0.bb           |   12 +++
 .../recipes-graphics/cairo/cairo_1.10.2.bbappend   |    2 -
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    5 -
 .../xorg-lib/pixman_0.25.2.bbappend                |    5 +-
 .../recipes-multimedia/libtiff/tiff_4.0.1.bbappend |    1 -
 ..._4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} |    0
 ..._4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} |    0
 .../libgpg-error/libgpg-error_1.10.bbappend        |    2 -
 .../libusb/libusb-compat_0.1.3.bbappend            |    6 --
 .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 -
 meta-xfce/README                                   |    2 +-
 toolchain-layer/README                             |    2 +-
 88 files changed, 427 insertions(+), 347 deletions(-)
 rename meta-efl/conf/distro/include/{efl-from-svn.inc => efl-from-svn-recipes.inc} (63%)
 create mode 100644 meta-efl/recipes-efl/e17/expedite.inc
 create mode 100644 meta-efl/recipes-efl/e17/expedite_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.6.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.2.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary.inc
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion.inc
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb.inc
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.2.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
 create mode 100644 meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
 delete mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
 rename meta-oe/recipes-qt/qt4/{qt4-embedded_4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} (100%)
 rename meta-oe/recipes-qt/qt4/{qt4-x11-free_4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} (100%)
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend

-- 
1.7.8.5



