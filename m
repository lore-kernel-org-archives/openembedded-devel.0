Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 94AEA73176
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 01:04:15 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6Q002I1DMKGH80@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 May 2016 20:03:57 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=8nJEP1OIZ-IA:10 a=yrkiwgmsf1kA:10	a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
	a=Q4-j1AaZAAAA:8 a=SqkWosRfKb6ZopUkWgMA:9	a=wPNLvfGTeEIA:10
Received: by 100.15.86.14 with SMTP id 79e4a9b8; Fri, 06 May 2016 01:03:57 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 95673161FEC; Thu,
	5 May 2016 21:03:56 -0400 (EDT)
Date: Thu, 05 May 2016 21:03:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160506010356.GK27602@denix.org>
References: <cover.1462223302.git.akuster808@gmail.com>
MIME-version: 1.0
In-reply-to: <cover.1462223302.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: akuster@mvista.com
Subject: Re: [PATCH 00/77] [krogoth][V2] next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 01:04:19 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

FWIW, I built several different TI platforms using meta-oe krogoth-next branch 
with this pull request w/o any issues.

Acked-by: Denys Dmytriyenko <denys@ti.com>


On Mon, May 02, 2016 at 02:10:35PM -0700, Armin Kuster wrote:
> V2: rebase
> 
> Since Yocto 2.1 released on April 29th, this syncs with the latest changes found in
> that release.
> 
> please consider these for krogoth-next.
> 
> The following changes since commit cb87e40af9abc66ef3c720c863487329a39aa47a:
> 
>   samba: remove dependency on ctdb (2016-05-02 12:25:38 -0400)
> 
> are available in the git repository at:
> 
>   git://github.com/akuster/meta-openembedded akuster/krogoth-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/krogoth-next
> 
> Adrian Dudau (1):
>   umip: unblacklist and disable parallel make
> 
> Andre McCurdy (2):
>   fcgi: update SRC_URI to match new path to fcgi-2.4.0.tar.gz archive
>   libtinyxml2: update 2.2.0 -> 3.0.0
> 
> Andreas Müller (3):
>   poppler: update to 0.4.1
>   xfce4-whiskermenu-plugin: update to 1.5.3
>   xfce4-weather-plugin: update to 0.8.7
> 
> André Draszik (1):
>   rsnapshot: use ${bindir} as rsync location
> 
> Armin Kuster (4):
>   c-ares: Add package to networking
>   udisk2: fix build issue with missing depends
>   xcursorgen: fix License issue
>   flite: fix license issue.
> 
> Dai Caiyun (1):
>   hwdata: add new recipe
> 
> Denys Dmytriyenko (1):
>   ne10: use bb.debug for debug messages
> 
> Derek Straka (25):
>   adduser: update to 3.114
>   libcapture-tiny-perl: update to 0.36
>   libclass-method-modifiers-perl: update to 2.11
>   libcrypt-openssl-random-perl: update to 0.11
>   libcurses-perl: update to 1.34
>   libdbd-sqlite-perl: update to 1.50
>   libdbi-perl: update to 1.634
>   libencode-perl: update to 2.83
>   libextutils-config-perl: update to 0.008
>   libextutils-installpaths-perl: update to 0.011
>   libhtml-parser-perl: update to 3.72
>   python-cython: update to 0.24
>   python-dateutil: update to 2.5.2
>   python-decorator: update to 4.0.9
>   python-whoosh: update to 2.7.4
>   nginx: update to 1.9.14
>   apache2: update to 2.4.20
>   python-parted: update to version 3.10.7
>   libxml++: update to the latest stable version (2.38.1)
>   libio-pty-perl: update to version 1.12
>   log4cplus: update to version 1.2.0
>   libgee: update to the latest stable version (0.18.0)
>   bootchart: update to 1.17
>   concurrencykit: update to version 0.5.1
>   libubox: update to the latest git version for bug fixes
> 
> Fabio Berton (12):
>   python-bcrypt: Add recipe for version 2.0.0
>   python-blinker: Add recipe for version 1.4
>   python-flask-bcrypt: Add recipe for version 0.7.1
>   python-flask-bootstrap: Add recipe for version 3.3.5.7
>   python-flask-navigation: Add recipe for version 0.2.0
>   python-flask-sqlalchemy: Add recipe for version 2.1
>   python-flask-wtf: Add recipe for version 0.12
>   python-pam: Add recipe for version 1.8.2
>   python-wtforms: Add recipe for version 2.0.2
>   python-dominate: Add recipe for version 2.2.0
>   python-netaddr: Add recipe for version 0.7.18
>   python-visitor: Add recipe for version 0.1.2
> 
> Goran Cengic (1):
>   crash: add cross package
> 
> Hongxu Jia (2):
>   gnome-themes: fix icon-name-mapping not found
>   libbonobo.inc: add libbonobo-bin package by lib_package class
> 
> Ioan-Adrian Ratiu (2):
>   openconnect: add recipe
>   vpnc: stage vpnc-script
> 
> Jacob Stiffler (1):
>   llvm: correct fix for the multilib libdir
> 
> Jonathan Liu (2):
>   nodejs: update to 4.4.2
>   nodejs: update to 4.4.3
> 
> Karlsson, Johnny (1):
>   Add simple-mtpfs recipe
> 
> Koen Kooi (1):
>   mozjs: fix armeb builds
> 
> Li xin (2):
>   mozjs_17.0.0.bb: Fix do_srpm error
>   mariadb: Fix rootfs creation errors
> 
> Manuel Bachmann (1):
>   wayland-fits: update, get out of PNBLACKLIST
> 
> Mark Asselstine (1):
>   mozjs: fix configure host contamination
> 
> Nicolas Dechesne (1):
>   openbox: add run time dependency on openbox-theme-clearlooks
> 
> Pascal Bach (2):
>   libmodbus: add support for the libmodbus development release
>   gtest, gmock: allow building gtest-native and gmock-native
> 
> Ross Burton (7):
>   meta-oe: use bb.utils.contains() instead of base_contains()
>   meta-webserver: use bb.utils.contains() instead of base_contains()
>   meta-xfce: use bb.utils.contains() instead of base_contains()
>   meta-multimedia: use bb.utils.contains() instead of base_contains()
>   meta-efl: use bb.utils.contains() instead of base_contains()
>   meta-gnome: use bb.utils.contains() instead of base_contains()
>   meta-initramfs: use bb.utils.contains() instead of base_contains()
> 
> Roy Li (1):
>   krb5: add native and nativesdk extend
> 
> Stephano Cetola (1):
>   initramfs-{debug,kexecboot}-image: zero out the rootfs_extra_space in
>     initramfs images
> 
> Zhixiong Chi (1):
>   krb5-CVE-2016-3119.patch
> 
>  meta-efl/recipes-efl/e17/e-wm.inc                  |   4 +-
>  meta-efl/recipes-efl/efl/entrance_svn.bb           |   2 +-
>  .../simple-mtpfs/simple-mtpfs_git.bb               |  13 ++
>  meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |   3 +-
>  .../gnome-keyring/gnome-keyring_2.32.1.bb          |   4 +-
>  .../gnome-session/gnome-session_2.32.1.bb          |   2 +-
>  .../gnome-settings-daemon_2.32.1.bb                |   2 +-
>  .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |   2 +-
>  .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |   5 +-
>  .../recipes-bsp/images/initramfs-debug-image.bb    |   1 +
>  .../images/initramfs-kexecboot-image.bb            |   2 +
>  .../recipes-devtools/dracut/dracut_git.bb          |   2 +-
>  .../recipes-connectivity/gupnp/gssdp.inc           |   2 +-
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |   6 +-
>  .../fluidsynth/fluidsynth_1.1.6.bb                 |   2 +-
>  .../recipes-multimedia/libao/libao_1.2.0.bb        |   2 +-
>  .../recipes-multimedia/mpg123/mpg123_1.22.4.bb     |  18 +-
>  .../recipes-multimedia/musicpd/mpd_0.19.10.bb      |   2 +-
>  .../openal/openal-soft_1.15.1.bb                   |   4 +-
>  .../recipes-multimedia/sox/sox_14.4.0.bb           |   4 +-
>  .../openconnect/openconnect_git.bb                 |  18 ++
>  .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |   7 +
>  .../recipes-support/c-ares/c-ares_1.11.0.bb        |  13 ++
>  meta-oe/licenses/ManishSingh                       |  19 ++
>  meta-oe/licenses/flite                             |  32 ++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |   2 +-
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   2 +-
>  .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   |   2 +-
>  .../krb5/krb5/krb5-CVE-2016-3119.patch             |  36 ++++
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  17 +-
>  .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |   2 +-
>  meta-oe/recipes-connectivity/umip/umip_1.0.bb      |   2 +-
>  .../recipes-connectivity/zabbix/zabbix_2.4.7.bb    |   2 +-
>  .../libxml++_ptest.patch                           |   0
>  .../libxml/{libxml++-2.37.1 => libxml++}/run-ptest |   0
>  .../{libxml++_2.37.1.bb => libxml++_2.38.1.bb}     |   4 +-
>  meta-oe/recipes-core/llvm/llvm.inc                 |   4 +-
>  .../packagegroups/packagegroup-basic.bb            |  10 +-
>  .../packagegroups/packagegroup-boot.bb             |   2 +-
>  .../recipes-devtools/bootchart/bootchart_git.bb    |   6 +-
>  .../concurrencykit/concurrencykit/cross.patch      |  16 +-
>  .../concurrencykit/concurrencykit_git.bb           |   6 +-
>  .../libgee/{libgee_0.16.1.bb => libgee_0.18.0.bb}  |   4 +-
>  meta-oe/recipes-devtools/libubox/libubox_git.bb    |   2 +-
>  .../{log4cplus_1.1.1.bb => log4cplus_1.2.0.bb}     |   6 +-
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   2 +-
>  .../nodejs/{nodejs_4.4.1.bb => nodejs_4.4.3.bb}    |   6 +-
>  ...bio-pty-perl_1.10.bb => libio-pty-perl_1.12.bb} |   6 +-
>  .../recipes-extended/corosync/corosync_2.3.5.bb    |   2 +-
>  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          |   2 +-
>  .../konkretcmpi/konkretcmpi-native_0.9.2.bb        |   2 +-
>  meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb  |   2 +-
>  meta-oe/recipes-extended/libmodbus/libmodbus.inc   |  13 ++
>  .../recipes-extended/libmodbus/libmodbus_3.0.6.bb  |  14 +-
>  .../recipes-extended/libmodbus/libmodbus_3.1.2.bb  |   7 +
>  ...0001-add-support-for-big-endian-32bit-ARM.patch |  26 +++
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |  15 +-
>  .../openlmi/openlmi-providers_0.6.0.bb             |   2 +-
>  .../recipes-extended/openwsman/openwsman_2.6.2.bb  |   4 +-
>  meta-oe/recipes-extended/polkit/polkit_0.113.bb    |   6 +-
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |   4 +-
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |   6 +-
>  .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |   6 +-
>  .../smartmontools/smartmontools_6.4.bb             |   4 +-
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |  14 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb       |   2 +-
>  meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb        |  18 +-
>  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb  |   2 +-
>  meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |   4 +-
>  .../terminus-font/terminus-font_4.38.bb            |   8 +-
>  .../recipes-graphics/wayland/wayland-fits_git.bb   |   5 +-
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   2 +-
>  meta-oe/recipes-kernel/crash/crash_7.1.3.bb        |  23 ++-
>  meta-oe/recipes-kernel/ktap/ktap.inc               |   4 +-
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   2 +-
>  .../recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb |   2 +-
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |   4 +-
>  meta-oe/recipes-support/emacs/emacs.inc            |   4 +-
>  meta-oe/recipes-support/espeak/espeak_1.37.bb      |   2 +-
>  meta-oe/recipes-support/fftw/fftwf_3.3.4.bb        |   2 +-
>  meta-oe/recipes-support/gradm/gradm_3.1.bb         |   4 +-
>  meta-oe/recipes-support/hwdata/hwdata_0.288.bb     |  21 ++
>  .../libcanberra/libcanberra_0.30.bb                |   6 +-
>  meta-oe/recipes-support/libee/libee.inc            |   2 +-
>  .../libmicrohttpd/libmicrohttpd_0.9.34.bb          |   2 +-
>  .../libtinyxml2/libtinyxml2_3.0.0.bb               |  15 ++
>  .../recipes-support/libtinyxml2/libtinyxml2_git.bb |  37 ----
>  .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |   2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc              |   4 +-
>  meta-oe/recipes-support/mysql/mariadb.inc          |   5 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |   4 +-
>  meta-oe/recipes-support/openct/openct_0.6.20.bb    |   4 +-
>  meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb |   4 +-
>  .../fix-qt4e-library-dependencies.patch            |  28 ---
>  .../{poppler_0.37.0.bb => poppler_0.41.0.bb}       |   4 +-
>  meta-oe/recipes-support/postgresql/postgresql.inc  |   2 +-
>  .../rsnapshot/configure-fix-cmd_rsync.patch        |   2 +-
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   6 +-
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |   4 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb     |   2 +-
>  meta-oe/recipes-support/vim/vim_7.4.769.bb         |   4 +-
>  meta-oe/recipes-test/gmock/gmock_1.7.0.bb          |   2 +-
>  meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |   2 +-
>  .../{adduser_3.113+nmu3.bb => adduser_3.114.bb}    |   8 +-
>  ...y-perl_0.30.bb => libcapture-tiny-perl_0.36.bb} |   4 +-
>  ...1.bb => libclass-method-modifiers-perl_2.12.bb} |   4 +-
>  ....04.bb => libcrypt-openssl-random-perl_0.11.bb} |   6 +-
>  ...bcurses-perl_1.32.bb => libcurses-perl_1.34.bb} |   6 +-
>  ...ite-perl_1.40.bb => libdbd-sqlite-perl_1.50.bb} |   4 +-
>  .../{libdbi-perl_1.628.bb => libdbi-perl_1.634.bb} |   6 +-
>  ...bencode-perl_2.76.bb => libencode-perl_2.83.bb} |   6 +-
>  ...l_0.007.bb => libextutils-config-perl_0.008.bb} |   6 +-
>  ...0.bb => libextutils-installpaths-perl_0.011.bb} |   6 +-
>  ...er-perl_3.71.bb => libhtml-parser-perl_3.72.bb} |   6 +-
>  .../recipes-devtools/python/python-bcrypt_2.0.0.bb |  15 ++
>  .../recipes-devtools/python/python-blinker_1.4.bb  |   8 +
>  .../recipes-devtools/python/python-cython.inc      |   4 +-
>  ...thon-cython_0.23.4.bb => python-cython_0.24.bb} |   0
>  .../recipes-devtools/python/python-dateutil.inc    |   4 +-
>  ...-dateutil_2.5.1.bb => python-dateutil_2.5.2.bb} |   0
>  .../recipes-devtools/python/python-decorator.inc   |   4 +-
>  ...ecorator_4.0.2.bb => python-decorator_4.0.9.bb} |   0
>  .../python/python-dominate_2.2.0.bb                |  10 +
>  .../python/python-flask-bcrypt_0.7.1.bb            |  12 ++
>  .../python/python-flask-bootstrap_3.3.5.7.bb       |  10 +
>  .../python/python-flask-navigation_0.2.0.bb        |  12 ++
>  .../python/python-flask-sqlalchemy_2.1.bb          |  12 ++
>  .../import-simplejson-as-json.patch                |  28 +++
>  .../python/python-flask-wtf_0.12.bb                |  17 ++
>  .../python/python-netaddr_0.7.18.bb                |   8 +
>  .../recipes-devtools/python/python-pam_1.8.2.bb    |  12 ++
>  .../python/python-visitor_0.1.2.bb                 |   8 +
>  .../recipes-devtools/python/python-whoosh.inc      |   4 +-
>  ...thon-whoosh_2.7.3.bb => python-whoosh_2.7.4.bb} |   0
>  .../python/python-wtforms_2.0.2.bb                 |  13 ++
>  ...on3-cython_0.23.4.bb => python3-cython_0.24.bb} |   0
>  ...dateutil_2.5.1.bb => python3-dateutil_2.5.2.bb} |   0
>  ...corator_4.0.2.bb => python3-decorator_4.0.9.bb} |   0
>  ...on3-whoosh_2.7.3.bb => python3-whoosh_2.7.4.bb} |   0
>  ...yparted_3.10.5.bb => python-pyparted_3.10.7.bb} |   4 +-
>  ...2-native_2.4.18.bb => apache2-native_2.4.20.bb} |   4 +-
>  .../{apache2_2.4.18.bb => apache2_2.4.20.bb}       |   8 +-
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |   4 +-
>  .../recipes-httpd/hiawatha/hiawatha_9.2.bb         |   2 +-
>  .../recipes-httpd/monkey/monkey_1.5.6.bb           |   2 +-
>  .../nginx/nginx-1.9.14/nginx-cross.patch           | 211 +++++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +-
>  .../nginx/{nginx_1.9.12.bb => nginx_1.9.14.bb}     |   4 +-
>  .../recipes-httpd/nostromo/nostromo_1.9.5.bb       |   2 +-
>  meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb  |   2 +-
>  ...ugin_0.8.6.bb => xfce4-weather-plugin_0.8.7.bb} |   4 +-
>  ..._1.5.2.bb => xfce4-whiskermenu-plugin_1.5.3.bb} |   4 +-
>  .../xfce4-power-manager_1.4.4.bb                   |   4 +-
>  .../xfce4-settings/xfce4-settings_git.bb           |   8 +-
>  154 files changed, 861 insertions(+), 336 deletions(-)
>  create mode 100644 meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>  create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
>  create mode 100644 meta-oe/licenses/ManishSingh
>  create mode 100644 meta-oe/licenses/flite
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch
>  rename meta-oe/recipes-core/libxml/{libxml++-2.37.1 => libxml++}/libxml++_ptest.patch (100%)
>  rename meta-oe/recipes-core/libxml/{libxml++-2.37.1 => libxml++}/run-ptest (100%)
>  rename meta-oe/recipes-core/libxml/{libxml++_2.37.1.bb => libxml++_2.38.1.bb} (84%)
>  rename meta-oe/recipes-devtools/libgee/{libgee_0.16.1.bb => libgee_0.18.0.bb} (83%)
>  rename meta-oe/recipes-devtools/log4cplus/{log4cplus_1.1.1.bb => log4cplus_1.2.0.bb} (64%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.1.bb => nodejs_4.4.3.bb} (93%)
>  rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.10.bb => libio-pty-perl_1.12.bb} (54%)
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
>  create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.288.bb
>  create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
>  delete mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
>  rename meta-oe/recipes-support/poppler/{poppler_0.37.0.bb => poppler_0.41.0.bb} (93%)
>  rename meta-perl/recipes-perl/adduser/{adduser_3.113+nmu3.bb => adduser_3.114.bb} (89%)
>  rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.30.bb => libcapture-tiny-perl_0.36.bb} (90%)
>  rename meta-perl/recipes-perl/libclass/{libclass-method-modifiers-perl_2.11.bb => libclass-method-modifiers-perl_2.12.bb} (84%)
>  rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-random-perl_0.04.bb => libcrypt-openssl-random-perl_0.11.bb} (56%)
>  rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.32.bb => libcurses-perl_1.34.bb} (78%)
>  rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.40.bb => libdbd-sqlite-perl_1.50.bb} (88%)
>  rename meta-perl/recipes-perl/libdb/{libdbi-perl_1.628.bb => libdbi-perl_1.634.bb} (82%)
>  rename meta-perl/recipes-perl/libencode/{libencode-perl_2.76.bb => libencode-perl_2.83.bb} (89%)
>  rename meta-perl/recipes-perl/libextutils/{libextutils-config-perl_0.007.bb => libextutils-config-perl_0.008.bb} (73%)
>  rename meta-perl/recipes-perl/libextutils/{libextutils-installpaths-perl_0.010.bb => libextutils-installpaths-perl_0.011.bb} (75%)
>  rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.71.bb => libhtml-parser-perl_3.72.bb} (70%)
>  create mode 100644 meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-blinker_1.4.bb
>  rename meta-python/recipes-devtools/python/{python-cython_0.23.4.bb => python-cython_0.24.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-dateutil_2.5.1.bb => python-dateutil_2.5.2.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb => python-decorator_4.0.9.bb} (100%)
>  create mode 100644 meta-python/recipes-devtools/python/python-dominate_2.2.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-pam_1.8.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-visitor_0.1.2.bb
>  rename meta-python/recipes-devtools/python/{python-whoosh_2.7.3.bb => python-whoosh_2.7.4.bb} (100%)
>  create mode 100644 meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb
>  rename meta-python/recipes-devtools/python/{python3-cython_0.23.4.bb => python3-cython_0.24.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-dateutil_2.5.1.bb => python3-dateutil_2.5.2.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.9.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-whoosh_2.7.3.bb => python3-whoosh_2.7.4.bb} (100%)
>  rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.10.5.bb => python-pyparted_3.10.7.bb} (91%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.18.bb => apache2-native_2.4.20.bb} (91%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.18.bb => apache2_2.4.20.bb} (96%)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.12.bb => nginx_1.9.14.bb} (66%)
>  rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.6.bb => xfce4-weather-plugin_0.8.7.bb} (72%)
>  rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.2.bb => xfce4-whiskermenu-plugin_1.5.3.bb} (63%)
> 
> -- 
> 2.3.5
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

