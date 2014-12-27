Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 79CEE72875
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:33:10 +0000 (UTC)
Received: (qmail 8695 invoked by uid 1003); 27 Dec 2014 19:33:10 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@108.44.89.75)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	27 Dec 2014 19:33:10 -0000
Message-ID: <549F096F.8040704@balister.org>
Date: Sat, 27 Dec 2014 14:33:03 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/27] [Dizzy-next] pull request
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
X-List-Received-Date: Sat, 27 Dec 2014 19:33:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

What about Saul's resolvconf fixes?

Philip

On 12/27/2014 12:21 PM, Armin Kuster wrote:
> Please consider these changes for Dizzy-next
> 
> The following changes since commit 510b7a9d8d5dda07120df5866507742a626478c1:
> 
>   krb5: fix CVE-2014-5351 (2014-12-01 14:24:53 +0100)
> 
> are available in the git repository at:
> 
>   https://github.com/akuster/meta-openembedded.git akuster/dizzy-next
>   https://github.com//tree/akuster/dizzy-next
> 
> Andreas Müller (1):
>   glibmm: add perl to RDEPENDS_{PN}-dev
> 
> Awais Belal (1):
>   enca: fix broken automake
> 
> Belal, Awais (2):
>   mplayer2: use autotools-brokensep (B = S)
>   mplayer2: cleanup empty directories
> 
> Chong.Lu@windriver.com (2):
>   samba: add winbind.service to winbind package
>   samba: fix error messages when startup samba service
> 
> Chris Morgan (1):
>   dfu-util: Point to gitorious.org repository as gnumonks.org is down
> 
> Gary S. Robertson (2):
>   libhugetlbfs: Make cross-devel recognize all ix86 arches
>   libhugetlbfs: Fix page size & text offset for arm arches
> 
> Jackie Huang (5):
>   postfix.inc: Remove references to buildmachine paths in target
>     makedefs.out
>   rrdtool: inherit cpan-base to help build perl modules
>   rrdtool: add missing dependency on groff-native
>   hostapd: several fixes for init script
>   rfkill: fix the SRC_URI
> 
> Javier Viguera (1):
>   xserver-common: disable TCP connections
> 
> Kai Kang (1):
>   polarssl: add dependency openssl
> 
> Kang Kai (2):
>   libnet-ssleay-perl: avoid host contamination
>   meta-gnome: fix typo of directory name
> 
> Liu Jian (1):
>   lvm2: add lvm.con to CONFFILES
> 
> Martin Jansa (3):
>   iotop: Drop python-distutils from RDEPENDS
>   PNBLACKLIST: use weak assignments
>   xf86-video-glamo: fix build with xserver 1.16
> 
> Peter Bigot (3):
>   imagemagick: update URI to allow fetching current and previous
>     releases
>   obexd: conflict with bluez5
>   obex-data-server: conflict with bluez5
> 
> Robert Yang (1):
>   libcanberra: fix installed-vs-shipped warning
> 
> Wenzong Fan (1):
>   sethdlc: fix host contamination
> 
>  .../recipes-filesystems/ifuse/ifuse_1.1.2.bb       |  2 +-
>  .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |  2 +-
>  meta-gnome/recipes-connectivity/obex/obexd_0.48.bb |  2 +
>  .../glade/glade3_%.bbappend                        |  0
>  meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb          |  2 +-
>  .../gnome-menus/gnome-menus3_3.10.1.bb             |  2 +-
>  .../gnome-panel/gnome-panel3_3.0.2.bb              |  2 +-
>  .../recipes-gnome/gweather/libgweather3_3.0.2.bb   |  2 +-
>  meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |  2 +-
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |  2 +-
>  .../coriander/coriander_2.0.2.bb                   |  2 +-
>  .../dleyna/renderer-service-upnp_0.3.0.bb          |  2 +-
>  .../polarssl/polarssl_1.3.8.bb                     |  1 +
>  .../files/sethdlc-fix-host-contamination.patch     | 42 ++++++++++++++++
>  .../recipes-connectivity/sethdlc/sethdlc.bb        |  3 +-
>  .../recipes-daemons/postfix/postfix.inc            |  5 ++
>  .../lksctp-tools/lksctp-tools_1.0.16.bb            |  2 +-
>  .../0001-Makefile-Recognize-all-ix86-arches.patch  | 32 ++++++++++++
>  ...rch64-fix-page-size-not-properly-computed.patch | 32 ------------
>  ...s-arm-arches-fix-page-size-and-text-offse.patch | 57 ++++++++++++++++++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |  3 +-
>  .../recipes-connectivity/hostapd/hostapd-2.2/init  | 27 ++++++++--
>  .../libimobiledevice/libimobiledevice_1.1.4.bb     |  2 +-
>  .../obex/obex-data-server_0.4.6.bb                 |  1 +
>  meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |  2 +-
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |  1 +
>  meta-oe/recipes-connectivity/samba/samba.inc       |  8 ++-
>  meta-oe/recipes-connectivity/soft66/soft66_git.bb  |  2 +-
>  .../zeroc-ice/zeroc-ice_3.5.1.bb                   |  2 +-
>  meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb     |  2 +
>  meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |  2 +-
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb  | 20 ++++----
>  .../recipes-extended/subsurface/subsurface_git.bb  |  2 +-
>  meta-oe/recipes-extended/zsh/zsh.inc               |  2 +-
>  .../recipes-graphics/clutter/clutter-box2d_git.bb  |  2 +-
>  meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb        |  2 +-
>  .../xorg-driver/xf86-input-mtev_git.bb             |  2 +-
>  ...-glamo.h-use-const-for-jbt6k74_state_path.patch | 29 +++++++++++
>  .../xorg-driver/xf86-video-glamo_git.bb            |  1 +
>  ...15-xserver-common-disable-TCP-connections.patch | 24 +++++++++
>  .../xserver-common/xserver-common_1.34.bb          |  1 +
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |  5 +-
>  meta-oe/recipes-navigation/omgps/omgps_svn.bb      |  2 +-
>  meta-oe/recipes-qt/qconnman/qconnman-e_git.bb      |  2 +-
>  meta-oe/recipes-qt/qconnman/qconnman_git.bb        |  2 +-
>  meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb  |  2 +-
>  meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |  2 +-
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb   |  9 ++--
>  meta-oe/recipes-support/emacs/emacs_23.4.bb        |  2 +-
>  .../enca/enca/libenca-003-iconv.patch              | 28 +++++++++++
>  meta-oe/recipes-support/enca/enca_1.9.bb           |  3 +-
>  .../imagemagick/imagemagick_6.8.9.bb               |  2 +-
>  .../libcanberra/libcanberra_0.29.bb                |  2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc              |  2 +
>  .../recipes-support/maliit/maliit-framework_git.bb |  2 +-
>  .../recipes-support/maliit/maliit-plugins_git.bb   |  2 +-
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |  2 +-
>  .../vala-terminal/vala-terminal_git.bb             |  2 +-
>  .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb |  8 ++-
>  meta-webserver/recipes-php/modphp/modphp5.inc      |  2 +-
>  meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb  |  2 +-
>  61 files changed, 325 insertions(+), 91 deletions(-)
>  rename meta-gnome/{recipe-devtools => recipes-devtools}/glade/glade3_%.bbappend (100%)
>  create mode 100644 meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
>  delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
>  create mode 100644 meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
> 

