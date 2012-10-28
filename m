Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSV96-0005gn-8W
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2012 16:51:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2012 08:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,667,1344236400"; d="scan'208";a="239506781"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.101])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2012 08:37:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Oct 2012 15:37:21 +0000
Message-Id: <cover.1351438401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/4] Tidying
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
X-List-Received-Date: Sun, 28 Oct 2012 15:51:28 -0000

Some tidy-ups for the whole meta-openembedded repository. No actual
output or behaviour changes but the bb.data replacement should speed up
parsing very slightly.


The following changes since commit 1571c2c566c51799eceea2aabe13d1c3116f36b3:

  samba: update documentation2.patch to apply (2012-10-26 13:00:24 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup3
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup3

Paul Eggleton (4):
  Remove PRIORITY
  Remove NATIVE_INSTALL_WORKS
  mysql5-native: remove PSTAGING_DISABLED
  Replace bb.data.* with d.*

 meta-efl/recipes-efl/efl/edje-fpu.inc              |    2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |    2 +-
 meta-efl/recipes-efl/efl/evas.inc                  |    4 +--
 meta-gnome/recipes-gnome/abiword/abiword.inc       |    2 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   16 +++++------
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    4 +--
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |    8 +++---
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |    2 +-
 .../recipes-support/goffice/goffice_0.8.17.bb      |    2 +-
 .../recipes-devtools/klibc/klibc-utils.inc         |    4 +--
 meta-oe/classes/gitpkgv.bbclass                    |    4 +--
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc   |    2 +-
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |    1 -
 .../hostapd/hostap-daemon_1.0.bb                   |    1 -
 .../sshfs-fuse/sshfs-fuse_2.4.bb                   |    1 -
 .../fakeroot/fakeroot-native_1.12.4.bb             |    6 ++---
 meta-oe/recipes-core/glib-2.0/glibmm.inc           |    2 +-
 meta-oe/recipes-core/meta/distro-feed-configs.bb   |    4 +--
 .../proxy-libintl/proxy-libintl_20100902.bb        |    2 +-
 meta-oe/recipes-devtools/lemon/lemon.inc           |    1 -
 .../libcanberra/libcanberra_0.26.bb                |    2 +-
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb    |    2 +-
 .../mercurial/mercurial-native_1.9.bb              |    1 -
 meta-oe/recipes-devtools/orc/orc.inc               |    2 +-
 .../python/python-cheetah_2.4.4.bb                 |    1 -
 .../recipes-devtools/python/python-docutils_0.5.bb |    1 -
 meta-oe/recipes-devtools/vala/vala.inc             |    2 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |    4 +--
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
 meta-oe/recipes-multimedia/libav/libav.inc         |    4 +--
 meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    2 +-
 meta-oe/recipes-multimedia/live555/live555.inc     |    2 +-
 meta-oe/recipes-navigation/navit/navit-fpu.inc     |    2 +-
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |    4 +--
 meta-oe/recipes-support/freerdp/freerdp.inc        |    2 +-
 meta-oe/recipes-support/links/links.inc            |    2 +-
 meta-oe/recipes-support/lzma/lzma.inc              |    2 +-
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |    4 ---
 meta-oe/recipes-support/nano/nano.inc              |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |   12 ++++-----
 .../recipes-support/openldap/openldap_2.4.23.bb    |   16 +++++------
 meta-oe/recipes-support/pidgin/pidgin.inc          |    6 ++---
 meta-oe/recipes-support/poppler/poppler-fpu.inc    |    2 +-
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb  |    2 --
 meta-oe/recipes-support/vim/vim.inc                |    4 +--
 meta-systemd/classes/systemd.bbclass               |   28 ++++++++++----------
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |    2 +-
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb |    4 +--
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb       |    2 +-
 50 files changed, 89 insertions(+), 104 deletions(-)

-- 
1.7.9.5



