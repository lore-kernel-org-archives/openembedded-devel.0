Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy56-0001xL-1q
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:25:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6E9J026832
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:14 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6ENT007159
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:14 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHc028612;
	Mon, 14 May 2012 11:06:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:25 -0500
Message-ID: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 00/69] Update package LICENSE settings
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
X-List-Received-Date: Mon, 14 May 2012 16:25:09 -0000
Content-Type: text/plain

All,

The attached patches update the LICENSE field in the packages to
have the actual version of the GPL or LGPL license instead of just
using the generic GPL or LGPL terms.  This is to make it easier to
know if a package is licensed under the GPLv3 license or not.

Many of these changes were either back-ports from oe-core or I used
oe-core as a guideline and went into the source code to verify the
licensing.

Please consider these for the 2011.03 maintenance branch as well.

Chase Maupin (69):
  gnutls: update LICENSE setting
  libtasn1: update LICENSE setting
  bonnie: Update LICENSE field version
  canutils: Update LICENSE field version
  debianutils: Update LICENSE field version
  gtk+: Update LICENSE field version for 2.20.1
  gnome-keyring: Update LICENSE field version
  gnome-vfs: Update LICENSE field version
  hicolor-icon-theme: Update LICENSE field version
  hostap-daemon: Update LICENSE field version
  liba52: Update LICENSE field version
  atk: Update LICENSE field version
  audiofile: Update LICENSE field version
  avahi: Update LICENSE field version
  cairo: Update LICENSE field version
  libcap2: Update LICENSE field version
  libcroco: Update LICENSE field version
  esound: Update LICENSE field version
  faac: Update LICENSE field version
  faad2: Update LICENSE field version
  flac: Update LICENSE field version
  libgcrypt: Update LICENSE field version
  gdbm: Update LICENSE field version
  libgpg-error: Update LICENSE field version
  libical: Update LICENSE field version
  libid3tag: Update LICENSE field version
  libidl: Update LICENSE field version
  libmad: Update LICENSE field version
  libmodplug: Update LICENSE field version
  lame: Update LICENSE field version
  mpeg2dec: Update LICENSE field version
  mysql5: Update LICENSE field version
  libnl: Update LICENSE field version
  libproxy: Update LICENSE field version
  librsvg: Update LICENSE field version
  libsamplerate0: Update LICENSE field version
  schroedinger: Update LICENSE field version
  libsdl: Update LICENSE field version
  libsidplay: Update LICENSE field version
  libsndfile1: Update LICENSE field version
  libsocketcan: Update LICENSE field version
  libsoup-2.4: Update LICENSE field version
  libvisual: Update LICENSE field version
  x264: Update LICENSE field version
  libxv: Update LICENSE field version
  lmbench: Update LICENSE field version
  makedevs: Update LICENSE field version
  nfs-utils: Update LICENSE field version
  orbit2: Update LICENSE field version
  pango: Update LICENSE field version
  shared-mime-info: Update LICENSE field version
  wireless-tools: Update LICENSE field version
  gnome-common: Update LICENSE field version
  cups: Update LICENSE field version
  gnome-mime-data: Update LICENSE field version
  gtk-doc: Update LICENSE field version
  intltool: Update LICENSE field version
  libart-lgpl: Update LICENSE field version
  libdaemon: Update LICENSE field version
  libdiscid: Update LICENSE field version
  libglade: Update LICENSE field version
  libmikmod: Update LICENSE field version
  libmusicbrainz: Update LICENSE field version
  neon: Update LICENSE field version
  libnfnetlink: Update LICENSE field version
  python-pycairo: Update LICENSE field version
  python-pygobject: Update LICENSE field version
  python-pygtk: Update LICENSE field version
  time: Update LICENSE field version

 recipes/atk/atk_1.30.0.bb                          |    4 ++--
 recipes/audiofile/audiofile_0.2.6.bb               |    4 ++--
 recipes/avahi/avahi.inc                            |    4 ++--
 recipes/bonnie/bonnie++.inc                        |    3 ++-
 recipes/cairo/cairo_1.10.0.bb                      |    4 +++-
 recipes/cups/cups_1.2.12.bb                        |    4 ++--
 recipes/debianutils/debianutils.inc                |    4 ++--
 recipes/esound/esound_0.2.36.bb                    |    4 ++--
 recipes/faac/faac_1.24.bb                          |    4 ++--
 recipes/faad2/faad2_2.7.bb                         |    4 +++-
 recipes/flac/flac_1.2.1.bb                         |    4 +++-
 recipes/gdbm/gdbm_1.8.3.bb                         |    4 ++--
 recipes/gnome/gnome-common.inc                     |    2 +-
 recipes/gnome/gnome-common_2.28.0.bb               |    2 ++
 recipes/gnome/gnome-keyring_2.28.2.bb              |    4 ++--
 recipes/gnome/gnome-mime-data_2.18.0.bb            |    4 ++--
 recipes/gnome/gnome-vfs_2.24.1.bb                  |    4 ++--
 recipes/gnome/libart-lgpl.inc                      |    4 ++--
 recipes/gnome/libproxy_0.2.3.bb                    |    4 ++--
 recipes/gnome/libsoup-2.4_2.32.2.bb                |    4 +++-
 recipes/gnome/orbit2_2.14.17.bb                    |    4 ++++
 recipes/gnutls/gnutls.inc                          |   10 +++++++---
 recipes/gnutls/libtasn1_1.7.bb                     |    8 +++++---
 recipes/gtk+/gtk+_2.20.1.bb                        |    4 +++-
 recipes/gtk-doc/gtk-doc.bb                         |    4 ++--
 .../hicolor-icon-theme/hicolor-icon-theme_0.11.bb  |    4 ++--
 recipes/hostap/hostap-daemon-0.7.inc               |    2 +-
 recipes/hostap/hostap-daemon_0.7.3.bb              |    2 +-
 recipes/intltool/intltool.inc                      |    4 ++--
 recipes/lame/lame_3.98.2.bb                        |    4 ++--
 recipes/liba52/liba52_0.7.4.bb                     |    4 ++--
 recipes/libcap/libcap2_2.20.bb                     |    4 ++--
 recipes/libcroco/libcroco_0.6.2.bb                 |    4 +++-
 recipes/libdaemon/libdaemon_0.13.bb                |    4 ++--
 recipes/libdiscid/libdiscid.inc                    |    2 +-
 recipes/libdiscid/libdiscid_0.2.2.bb               |    2 ++
 recipes/libgcrypt/libgcrypt_1.4.1.bb               |    4 ++++
 recipes/libglade/libglade_2.6.4.bb                 |    4 ++++
 recipes/libgpg-error/libgpg-error_1.4.bb           |    4 +++-
 recipes/libical/libical_0.44.bb                    |    4 ++--
 recipes/libid3tag/libid3tag_0.15.1b.bb             |    4 ++--
 recipes/libidl/libidl-native_0.8.13.bb             |    2 +-
 recipes/libidl/libidl.inc                          |    2 +-
 recipes/libidl/libidl_0.8.13.bb                    |    2 +-
 recipes/libmad/libmad_0.15.1b.bb                   |    4 ++--
 recipes/libmikmod/libmikmod_3.1.12.bb              |    4 ++--
 recipes/libmodplug/libmodplug_0.8.7.bb             |    4 ++--
 recipes/libnfnetlink/libnfnetlink_1.0.0.bb         |    4 +++-
 recipes/libnl/libnl_2.0.bb                         |    5 ++++-
 recipes/librsvg/librsvg_2.26.2.bb                  |    4 ++--
 recipes/libsamplerate/libsamplerate0_0.1.7.bb      |    4 ++--
 recipes/libsdl/libsdl-1.2.14.inc                   |    4 ++--
 recipes/libsidplay/libsidplay_1.36.59.bb           |    4 ++--
 recipes/libsndfile/libsndfile1_1.0.24.bb           |    4 ++--
 recipes/libvisual/libvisual_0.4.0.bb               |    4 ++--
 recipes/lmbench/lmbench_3.0-a9.bb                  |    4 ++--
 recipes/makedevs/makedevs_1.0.0.bb                 |    4 ++--
 recipes/mpeg2dec/mpeg2dec_0.4.0b.bb                |    4 ++--
 recipes/musicbrainz/libmusicbrainz.inc             |    2 +-
 recipes/musicbrainz/libmusicbrainz_3.0.2.bb        |    2 +-
 recipes/mysql/mysql5_5.1.40.inc                    |    4 ++--
 recipes/neon/neon_0.25.5.bb                        |    4 ++--
 recipes/nfs-utils/nfs-utils_1.1.2.bb               |    4 ++--
 recipes/pango/pango_1.24.4.bb                      |    4 +++-
 recipes/python/python-pycairo_1.8.0.bb             |    4 ++--
 recipes/python/python-pygobject_2.20.0.bb          |    4 ++--
 recipes/python/python-pygtk_2.16.0.bb              |    4 ++--
 recipes/schroedinger/schroedinger_1.0.9.bb         |    4 +++-
 recipes/shared-mime-info/shared-mime-info_0.51.bb  |    4 +++-
 recipes/socketcan/canutils.inc                     |    4 ++--
 recipes/socketcan/libsocketcan.inc                 |    4 ++--
 recipes/time/time.inc                              |    4 ++--
 recipes/vlc/x264_r2245.bb                          |    4 ++--
 recipes/wireless-tools/wireless-tools.inc          |    2 +-
 recipes/wireless-tools/wireless-tools_29.bb        |    2 +-
 recipes/xorg-lib/libxv_1.0.6.bb                    |    4 ++--
 76 files changed, 168 insertions(+), 120 deletions(-)



