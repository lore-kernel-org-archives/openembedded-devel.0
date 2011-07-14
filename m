Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhNqk-0007WR-78
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:29:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2011 08:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,529,1304319600"; d="scan'208";a="25856507"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.207])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2011 08:25:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:25:07 +0100
Message-Id: <cover.1310656986.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe] [PATCH 0/3] minor cleanup
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
X-List-Received-Date: Thu, 14 Jul 2011 15:29:14 -0000

Tidy up a few things in meta-openembedded.

The following changes since commit 7a8b1010e850b0338f05eacf181e78462355eac6:

  icon-naming-utils: Inherit perlnative (2011-07-13 09:01:16 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup

Paul Eggleton (3):
  Drop PRIORITY variable
  pango: remove inherit of flow-lossage.bbclass
  classes: remove qt4e.bbclass

 meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb      |    1 -
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |    1 -
 .../libgpewidget/libgpewidget_0.117.bb             |    1 -
 meta-oe/classes/qt4e.bbclass                       |   17 -----------------
 .../bluez/bluez-hcidump_2.0.bb                     |    1 -
 meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb  |    1 -
 meta-oe/recipes-connectivity/iw/iw_0.9.20.bb       |    1 -
 meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb |    1 -
 meta-oe/recipes-core/systemd/systemd_git.bb        |    1 -
 .../recipes-devtools/libfribidi/fribidi_0.19.2.bb  |    1 -
 .../python/python-argparse_1.2.1.bb                |    1 -
 .../python/python-cheetah_2.4.4.bb                 |    1 -
 .../recipes-devtools/python/python-cython_0.13.bb  |    1 -
 .../python/python-dateutil_1.4.1.bb                |    1 -
 .../recipes-devtools/python/python-numeric_24.2.bb |    1 -
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    1 -
 .../recipes-devtools/python/python-pexpect_2.3.bb  |    1 -
 .../python/python-pyalsaaudio_0.4.bb               |    1 -
 .../recipes-devtools/python/python-pyserial_2.4.bb |    1 -
 .../python/python-setuptools_0.6c11.bb             |    1 -
 .../python/python-vobject_0.8.1c.bb                |    1 -
 meta-oe/recipes-extended/tzdata/tzdata.inc         |    1 -
 meta-oe/recipes-graphics/cairo/cairo.inc           |    1 -
 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc  |    1 -
 meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb   |    5 ++---
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    1 -
 meta-oe/recipes-graphics/xorg-lib/pixman.inc       |    1 -
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    1 -
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    1 -
 meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb       |    1 -
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |    1 -
 meta-oe/recipes-support/atk/atk.inc                |    1 -
 meta-oe/recipes-support/atk/atk_1.30.0.bb          |    1 -
 .../ca-certificates_20090814+nmu2.bb               |    1 -
 meta-oe/recipes-support/check/check_0.9.5.bb       |    1 -
 meta-oe/recipes-support/evtest/evtest_1.25.bb      |    1 -
 meta-oe/recipes-support/fftw/benchfft_3.1.bb       |    1 -
 meta-oe/recipes-support/fftw/fftw.inc              |    1 -
 meta-oe/recipes-support/flite/flite.inc            |    1 -
 meta-oe/recipes-support/htop/htop_0.9.bb           |    1 -
 meta-oe/recipes-support/inih/libinih_git.bb        |    1 -
 meta-oe/recipes-support/libgcrypt/libgcrypt.inc    |    1 -
 meta-oe/recipes-support/libiconv/libiconv.inc      |    1 -
 .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |    1 -
 .../recipes-support/nfs-utils/nfs-utils_1.1.2.bb   |    1 -
 meta-oe/recipes-support/ntp/ntp.inc                |    1 -
 .../recipes-support/portaudio/portaudio-v19_svn.bb |    1 -
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb    |    1 -
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    1 -
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |    1 -
 51 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/classes/qt4e.bbclass

-- 
1.7.4.1



