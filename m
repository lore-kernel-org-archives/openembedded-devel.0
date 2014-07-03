Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41F0E6AC7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s632Q0fE029719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 19:26:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:25:52 -0700
Message-ID: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8 V2] use BPN in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 02:26:00 -0000
Content-Type: text/plain

* V2:
  - Create te commit based on each meta-x dir.
  - Add more info to each commit message
  - Create a PULL on meta-openembedded-contrib

* V1:
  Fixed SRC_URI:
  - ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
  - ${P} -> ${BP}

  Otherwise we would meet do_fetch errors when we do the multilib, native
  or nativesdk build.

// Robert

The following changes since commit 87bbe91686e1bbc9036aacd924162f17db214aad:

  Uprev memcached from upstream (2014-06-29 23:30:49 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/fix_srcuri

for you to fetch changes up to 3445e77ae21966009965085fffac5b592aa0d7b6:

  meta-xfce: use BPN in SRC_URI (2014-07-02 19:02:19 -0700)

----------------------------------------------------------------
Robert Yang (8):
      meta-filesystems: use BPN in SRC_URI
      meta-gnome: use BPN in SRC_URI
      meta-gpe: use BPN in SRC_URI
      meta-multimedia: use BPN in SRC_URI
      meta-networking: use BPN in SRC_URI
      meta-oe: use BPN in SRC_URI
      meta-webserver: use BPN in SRC_URI
      meta-xfce: use BPN in SRC_URI

 .../sshfs-fuse/sshfs-fuse_2.5.bb                   |    2 +-
 .../unionfs-fuse/unionfs-fuse_0.26.bb              |    2 +-
 .../recipes-support/physfs/physfs_2.0.3.bb         |    2 +-
 .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |    2 +-
 .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |    2 +-
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |    2 +-
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
 .../nonworking/gcalctool/gcalctool_5.32.0.bb       |    2 +-
 .../recipes-graphics/minilite/minilite_0.50.bb     |    2 +-
 .../coriander/coriander_2.0.2.bb                   |    2 +-
 .../fluidsynth/fluidsynth_1.1.6.bb                 |    2 +-
 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |    2 +-
 .../recipes-multimedia/musicpd/mpd_0.18.9.bb       |    2 +-
 .../openal/openal-soft_1.15.1.bb                   |    2 +-
 .../recipes-support/memcached/memcached_1.4.17.bb  |    2 +-
 meta-oe/classes/gpe.bbclass                        |    2 +-
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |    2 +-
 .../nbench-byte/nbench-byte_2.2.3.bb               |    2 +-
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    2 +-
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |    2 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb   |    2 +-
 .../libtorrent/libtorrent_0.13.3.bb                |    2 +-
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |    2 +-
 .../rtorrent/rtorrent_0.9.3.bb                     |    2 +-
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |    2 +-
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |    2 +-
 meta-oe/recipes-devtools/geany/geany_1.23.bb       |    2 +-
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb       |    2 +-
 .../recipes-devtools/python/python-dateutil_1.5.bb |    2 +-
 .../recipes-devtools/python/python-ldap_2.3.9.bb   |    2 +-
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |    2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb  |    2 +-
 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |    2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |    2 +-
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |    2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |    2 +-
 .../mml-widget/gtkmathview_0.8.0.bb                |    2 +-
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |    2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |    2 +-
 meta-oe/recipes-graphics/babl/babl_0.1.10.bb       |    2 +-
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb      |    2 +-
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |    2 +-
 meta-oe/recipes-graphics/libsexy/libsexy.inc       |    2 +-
 .../recipes-graphics/nonworking/slim/slim_1.3.2.bb |    2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |    2 +-
 .../xorg-data/xorg-data-common.inc                 |    2 +-
 .../audiofile/audiofile_0.2.7.bb                   |    2 +-
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb      |    2 +-
 meta-oe/recipes-multimedia/libass/libass.inc       |    2 +-
 meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    2 +-
 .../nonworking/minidlna/minidlna_1.0.25.bb         |    2 +-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |    2 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |    2 +-
 .../foxtrotgps/foxtrotgps_1.1.1.bb                 |    2 +-
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb     |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |    2 +-
 meta-oe/recipes-support/asio/asio.inc              |    2 +-
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |    2 +-
 meta-oe/recipes-support/libol/libol_0.3.18.bb      |    2 +-
 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb     |    2 +-
 .../nonworking/syslog-ng/syslog-ng.inc             |    2 +-
 .../recipes-support/openldap/openldap_2.4.23.bb    |    2 +-
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |    2 +-
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb     |    2 +-
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb |    2 +-
 .../recipes-support/poppler/poppler-data_0.4.6.bb  |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb  |    2 +-
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb   |    2 +-
 meta-oe/recipes-support/zile/zile_2.4.9.bb         |    2 +-
 .../recipes-httpd/hiawatha/hiawatha_9.2.bb         |    2 +-
 .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb     |    2 +-
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |    2 +-
 meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb      |    2 +-
 75 files changed, 75 insertions(+), 75 deletions(-)

