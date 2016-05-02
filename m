Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 084507001D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 19:13:11 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gh9so1185437pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2016 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=BS0HHVry196uIR6QwsHuNAiNe6SFf1/L1uFBFbhJHGU=;
	b=TGz/keL6Lbp7zF/vuUC2/AGsA89nn2dTo75VIdfFTWIAiE9BWFbRShSbd7XAQELDo8
	5qZ8RNLxc/VPcP4VQBWl3AjWVkB/TyEsYbdWPQ3LOC2Sqi2Aveyly+xz4nXI8bm85SJo
	+YOkKLWdqxMCxbRuS588phj/HJgxwSfpkrqDTJwgNWRttKj1yfWY4rJWveWNXe5e2yIS
	FYkx8b/deXqbJ8fKPOqsva2W6NGs4EjwgDGIRx8BiAArhrz7ZWSAhR/O2AUJkVjSFt7D
	QMYHNjRrCRdlZ+cO2YXt3y8pCPB+isuQsR3qJmz7II0+IXWyid5+78Ccy5GrHXfOGoAE
	MWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BS0HHVry196uIR6QwsHuNAiNe6SFf1/L1uFBFbhJHGU=;
	b=PQpZp635uWihCZEWBFlZOZy7m60U59XGqm+dqvPG+70q9XhL1TLgd+MIonCc3lgkJt
	u7deavuqx1XCkUFMU9iXd84QQ8N4ZG8TS74MbndUXD8al0Ru2lvhyS26Gq09DlUShhdz
	myo7GMx7+HhH4PnGhzXwgUSPAGjlp8Q4TUJCQHVZoUk/549Sf2H9KtPKyXUK0D8kxm/h
	LWXmOWj97Fvv6K2Ffm/b/Y7SfVvsb1hLuu5eeZDz5xMRYJSEtL/b7ghPHFkETjH4jiUs
	1IQX/yNVwc0HC5/gVxmABFUQWS6/sUHpqDASdX4jcDryRJdfhJdkGVnDEAuXLsLHTOS7
	C7+w==
X-Gm-Message-State: AOPr4FXLbZ5RAOyYeQmvauU5lvISbHUzbL1JM7SH1XRzZ0tru90x2kQbf9WTm/nZAZ371Q==
X-Received: by 10.67.21.177 with SMTP id hl17mr37678085pad.39.1462216392710;
	Mon, 02 May 2016 12:13:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:8ba:6f17:decb:d1a6?
	([2601:202:4000:1239:8ba:6f17:decb:d1a6])
	by smtp.googlemail.com with ESMTPSA id
	t8sm47557852paw.16.2016.05.02.12.13.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 12:13:11 -0700 (PDT)
To: akuster@mvista.com, openembedded-devel@lists.openembedded.org
References: <cover.1462202701.git.akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5727A6C7.9060505@gmail.com>
Date: Mon, 2 May 2016 12:13:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1462202701.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/91] [krogoth] next, pull request
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
X-List-Received-Date: Mon, 02 May 2016 19:13:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


Looks like Joe pushed in some changes to krogoth. I will rebase and
resubmit.

- armin

On 05/02/2016 08:33 AM, Armin Kuster wrote:
> Since Yocto 2.1 released on April 29th, this syncs with the latest changes found in
> that release.
> 
> please consider these for krogoth-next.
> 
> The following changes since commit abd1795729501a13608da67054b9cbf185404be3:
> 
>   cyrus-sasl: Drop unneeded group addition (2016-04-19 10:03:20 -0400)
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
> Armin Kuster (5):
>   c-ares: Add package to networking
>   udisk2: fix build issue with missing depends
>   xcursorgen: fix License issue
>   flite: fix license issue.
>   samba: fix QA warnings.
> 
> Christopher Larson (3):
>   ctdb: disable the service by default
>   ctdb: rdepend on procps
>   ctdb: drop duplicated DESCRIPTION
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
> Fabio Berton (13):
>   lldpd: Update to version 0.9.2
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
> Jagadeesh Krishnanjanappa (1):
>   iscsitarget: resolve build error with linux kernel 4.3 and above
> 
> Joe MacDonald (5):
>   samba: Update to latest stable
>   libldb: Update to latest stable
>   libtevent: Update to latest stable
>   libtdb: Update to latest stable
>   libtalloc: Update to latest stable
> 
> Johannes Pointner (1):
>   samba: add volatile file to support readonly rootfs
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
> Mark Asselstine (2):
>   dnsmasq: get systemd only working again
>   mozjs: fix configure host contamination
> 
> Nicolas Dechesne (1):
>   openbox: add run time dependency on openbox-theme-clearlooks
> 
> Pascal Bach (2):
>   libmodbus: add support for the libmodbus development release
>   gtest, gmock: allow building gtest-native and gmock-native
> 
> Richard Leitner (1):
>   samba: fix paths in sysv initscript
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
>  meta-efl/recipes-efl/e17/e-wm.inc                  |     4 +-
>  meta-efl/recipes-efl/efl/entrance_svn.bb           |     2 +-
>  .../simple-mtpfs/simple-mtpfs_git.bb               |    13 +
>  meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |     3 +-
>  .../gnome-keyring/gnome-keyring_2.32.1.bb          |     4 +-
>  .../gnome-session/gnome-session_2.32.1.bb          |     2 +-
>  .../gnome-settings-daemon_2.32.1.bb                |     2 +-
>  .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |     2 +-
>  .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |     5 +-
>  .../recipes-bsp/images/initramfs-debug-image.bb    |     1 +
>  .../images/initramfs-kexecboot-image.bb            |     2 +
>  .../recipes-devtools/dracut/dracut_git.bb          |     2 +-
>  .../recipes-connectivity/gupnp/gssdp.inc           |     2 +-
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |     6 +-
>  .../fluidsynth/fluidsynth_1.1.6.bb                 |     2 +-
>  .../recipes-multimedia/libao/libao_1.2.0.bb        |     2 +-
>  .../recipes-multimedia/mpg123/mpg123_1.22.4.bb     |    18 +-
>  .../recipes-multimedia/musicpd/mpd_0.19.10.bb      |     2 +-
>  .../openal/openal-soft_1.15.1.bb                   |     4 +-
>  .../recipes-multimedia/sox/sox_14.4.0.bb           |     4 +-
>  .../openconnect/openconnect_git.bb                 |    18 +
>  ...1-waf-sanitize-and-fix-added-cross-answer.patch |    60 -
>  ...-Adds-a-new-mode-to-samba-cross-compiling.patch |   112 -
>  ...-readability-of-cross-answers-generated-b.patch |    66 -
>  ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |    72 -
>  .../0005-build-unify-and-fix-endian-tests.patch    |   169 -
>  ...sing-of-cross-answers-file-in-case-answer.patch |    36 -
>  .../samba-4.1.12/01-fix-force-user-sec-ads.patch   |  1448 -
>  .../samba/samba-4.1.12/02-fix-ipv6-join.patch      |   266 -
>  .../samba-4.1.12/03-net-ads-kerberos-pac.patch     |   962 -
>  .../samba/samba-4.1.12/04-ipv6-workaround.patch    |   211 -
>  .../05-fix-gecos-field-with-samlogon.patch         | 29894 -------------------
>  .../06-fix-nmbd-systemd-status-update.patch        |    97 -
>  .../07-fix-idmap-ad-getgroups-without-gid.patch    |    42 -
>  .../08-fix-idmap-ad-sfu-with-trusted-domains.patch |    44 -
>  .../09-fix-smbclient-echo-cmd-segfault.patch       |    35 -
>  ...improve-service-principal-guessing-in-net.patch |   180 -
>  ...x-overwriting-of-spns-during-net-ads-join.patch |   329 -
>  ...ted-spns-from-AD-during-keytab-generation.patch |   159 -
>  .../samba/samba-4.1.12/13-fix-aes-enctype.patch    |   988 -
>  .../samba/samba-4.1.12/14-fix-dnsupdate.patch      |    51 -
>  .../15-fix-netbios-name-truncation.patch           |   154 -
>  .../16-do-not-check-xsltproc-manpages.patch        |    52 -
>  .../samba-4.1.12/17-execute-prog-by-qemu.patch     |    22 -
>  .../18-avoid-get-config-by-native-ncurses.patch    |    22 -
>  ...systemd-daemon-is-contained-by-libsystemd.patch |    42 -
>  .../samba-4.1.12/21-avoid-sasl-unless-wanted.patch |    10 -
>  .../00-fix-typos-in-man-pages.patch                |     0
>  ...006-avoid-using-colon-in-the-checking-msg.patch |     0
>  .../16-do-not-check-xsltproc-manpages.patch        |    43 +
>  ...-import-target-module-while-cross-compile.patch |    19 +-
>  .../21-add-config-option-without-valgrind.patch    |     0
>  .../samba/samba-4.4.2/volatiles.03_samba           |     3 +
>  .../samba/{samba_4.1.12.bb => samba_4.4.2.bb}      |    91 +-
>  .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |     7 +
>  .../lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb}       |     4 +-
>  ...pdated_bio_struct_of_linux_v4.3_and_above.patch |    75 +
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |     8 +-
>  .../recipes-support/c-ares/c-ares_1.11.0.bb        |    13 +
>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    11 +-
>  .../recipes-support/dnsmasq/dnsmasq.inc            |    21 +-
>  ...nsmasq.service => dnsmasq-noresolvconf.service} |     7 +-
>  .../dnsmasq/files/dnsmasq-resolvconf-helper        |    62 +
>  .../dnsmasq/files/dnsmasq-resolvconf.service       |    17 +
>  ...-import-target-module-while-cross-compile.patch |    19 +-
>  .../libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb}  |     4 +-
>  .../{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb}     |     5 +-
>  .../libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb}    |     4 +-
>  .../{libtevent_0.9.25.bb => libtevent_0.9.28.bb}   |     4 +-
>  meta-oe/licenses/ManishSingh                       |    19 +
>  meta-oe/licenses/flite                             |    32 +
>  .../libhugetlbfs/libhugetlbfs_git.bb               |     2 +-
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |     2 +-
>  .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   |     2 +-
>  .../krb5/krb5/krb5-CVE-2016-3119.patch             |    36 +
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |    17 +-
>  .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |     2 +-
>  meta-oe/recipes-connectivity/umip/umip_1.0.bb      |     2 +-
>  .../recipes-connectivity/zabbix/zabbix_2.4.7.bb    |     2 +-
>  .../libxml++_ptest.patch                           |     0
>  .../libxml/{libxml++-2.37.1 => libxml++}/run-ptest |     0
>  .../{libxml++_2.37.1.bb => libxml++_2.38.1.bb}     |     4 +-
>  meta-oe/recipes-core/llvm/llvm.inc                 |     4 +-
>  .../packagegroups/packagegroup-basic.bb            |    10 +-
>  .../packagegroups/packagegroup-boot.bb             |     2 +-
>  .../recipes-devtools/bootchart/bootchart_git.bb    |     6 +-
>  .../concurrencykit/concurrencykit/cross.patch      |    16 +-
>  .../concurrencykit/concurrencykit_git.bb           |     6 +-
>  .../libgee/{libgee_0.16.1.bb => libgee_0.18.0.bb}  |     4 +-
>  meta-oe/recipes-devtools/libubox/libubox_git.bb    |     2 +-
>  .../{log4cplus_1.1.1.bb => log4cplus_1.2.0.bb}     |     6 +-
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |     2 +-
>  .../nodejs/{nodejs_4.4.1.bb => nodejs_4.4.3.bb}    |     6 +-
>  ...bio-pty-perl_1.10.bb => libio-pty-perl_1.12.bb} |     6 +-
>  .../recipes-extended/corosync/corosync_2.3.5.bb    |     2 +-
>  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          |     2 +-
>  .../konkretcmpi/konkretcmpi-native_0.9.2.bb        |     2 +-
>  meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb  |     2 +-
>  meta-oe/recipes-extended/libmodbus/libmodbus.inc   |    13 +
>  .../recipes-extended/libmodbus/libmodbus_3.0.6.bb  |    14 +-
>  .../recipes-extended/libmodbus/libmodbus_3.1.2.bb  |     7 +
>  ...0001-add-support-for-big-endian-32bit-ARM.patch |    26 +
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |    15 +-
>  .../openlmi/openlmi-providers_0.6.0.bb             |     2 +-
>  .../recipes-extended/openwsman/openwsman_2.6.2.bb  |     4 +-
>  meta-oe/recipes-extended/polkit/polkit_0.113.bb    |     6 +-
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |     4 +-
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |     6 +-
>  .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |     6 +-
>  .../smartmontools/smartmontools_6.4.bb             |     4 +-
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |    14 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb       |     2 +-
>  meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb        |    18 +-
>  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb  |     2 +-
>  meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |     4 +-
>  .../terminus-font/terminus-font_4.38.bb            |     8 +-
>  .../recipes-graphics/wayland/wayland-fits_git.bb   |     5 +-
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |     2 +-
>  meta-oe/recipes-kernel/crash/crash_7.1.3.bb        |    23 +-
>  meta-oe/recipes-kernel/ktap/ktap.inc               |     4 +-
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |     2 +-
>  .../recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb |     2 +-
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |     4 +-
>  meta-oe/recipes-support/emacs/emacs.inc            |     4 +-
>  meta-oe/recipes-support/espeak/espeak_1.37.bb      |     2 +-
>  meta-oe/recipes-support/fftw/fftwf_3.3.4.bb        |     2 +-
>  meta-oe/recipes-support/gradm/gradm_3.1.bb         |     4 +-
>  meta-oe/recipes-support/hwdata/hwdata_0.288.bb     |    21 +
>  .../libcanberra/libcanberra_0.30.bb                |     6 +-
>  meta-oe/recipes-support/libee/libee.inc            |     2 +-
>  .../libmicrohttpd/libmicrohttpd_0.9.34.bb          |     2 +-
>  .../libtinyxml2/libtinyxml2_3.0.0.bb               |    15 +
>  .../recipes-support/libtinyxml2/libtinyxml2_git.bb |    37 -
>  .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |     2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc              |     4 +-
>  meta-oe/recipes-support/mysql/mariadb.inc          |     5 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |     4 +-
>  meta-oe/recipes-support/openct/openct_0.6.20.bb    |     4 +-
>  meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb |     4 +-
>  .../fix-qt4e-library-dependencies.patch            |    28 -
>  .../{poppler_0.37.0.bb => poppler_0.41.0.bb}       |     4 +-
>  meta-oe/recipes-support/postgresql/postgresql.inc  |     2 +-
>  .../rsnapshot/configure-fix-cmd_rsync.patch        |     2 +-
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |     6 +-
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |     4 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb     |     2 +-
>  meta-oe/recipes-support/vim/vim_7.4.769.bb         |     4 +-
>  meta-oe/recipes-test/gmock/gmock_1.7.0.bb          |     2 +-
>  meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |     2 +-
>  .../{adduser_3.113+nmu3.bb => adduser_3.114.bb}    |     8 +-
>  ...y-perl_0.30.bb => libcapture-tiny-perl_0.36.bb} |     4 +-
>  ...1.bb => libclass-method-modifiers-perl_2.12.bb} |     4 +-
>  ....04.bb => libcrypt-openssl-random-perl_0.11.bb} |     6 +-
>  ...bcurses-perl_1.32.bb => libcurses-perl_1.34.bb} |     6 +-
>  ...ite-perl_1.40.bb => libdbd-sqlite-perl_1.50.bb} |     4 +-
>  .../{libdbi-perl_1.628.bb => libdbi-perl_1.634.bb} |     6 +-
>  ...bencode-perl_2.76.bb => libencode-perl_2.83.bb} |     6 +-
>  ...l_0.007.bb => libextutils-config-perl_0.008.bb} |     6 +-
>  ...0.bb => libextutils-installpaths-perl_0.011.bb} |     6 +-
>  ...er-perl_3.71.bb => libhtml-parser-perl_3.72.bb} |     6 +-
>  .../recipes-devtools/python/python-bcrypt_2.0.0.bb |    15 +
>  .../recipes-devtools/python/python-blinker_1.4.bb  |     8 +
>  .../recipes-devtools/python/python-cython.inc      |     4 +-
>  ...thon-cython_0.23.4.bb => python-cython_0.24.bb} |     0
>  .../recipes-devtools/python/python-dateutil.inc    |     4 +-
>  ...-dateutil_2.5.1.bb => python-dateutil_2.5.2.bb} |     0
>  .../recipes-devtools/python/python-decorator.inc   |     4 +-
>  ...ecorator_4.0.2.bb => python-decorator_4.0.9.bb} |     0
>  .../python/python-dominate_2.2.0.bb                |    10 +
>  .../python/python-flask-bcrypt_0.7.1.bb            |    12 +
>  .../python/python-flask-bootstrap_3.3.5.7.bb       |    10 +
>  .../python/python-flask-navigation_0.2.0.bb        |    12 +
>  .../python/python-flask-sqlalchemy_2.1.bb          |    12 +
>  .../import-simplejson-as-json.patch                |    28 +
>  .../python/python-flask-wtf_0.12.bb                |    17 +
>  .../python/python-netaddr_0.7.18.bb                |     8 +
>  .../recipes-devtools/python/python-pam_1.8.2.bb    |    12 +
>  .../python/python-visitor_0.1.2.bb                 |     8 +
>  .../recipes-devtools/python/python-whoosh.inc      |     4 +-
>  ...thon-whoosh_2.7.3.bb => python-whoosh_2.7.4.bb} |     0
>  .../python/python-wtforms_2.0.2.bb                 |    13 +
>  ...on3-cython_0.23.4.bb => python3-cython_0.24.bb} |     0
>  ...dateutil_2.5.1.bb => python3-dateutil_2.5.2.bb} |     0
>  ...corator_4.0.2.bb => python3-decorator_4.0.9.bb} |     0
>  ...on3-whoosh_2.7.3.bb => python3-whoosh_2.7.4.bb} |     0
>  ...yparted_3.10.5.bb => python-pyparted_3.10.7.bb} |     4 +-
>  ...2-native_2.4.18.bb => apache2-native_2.4.20.bb} |     4 +-
>  .../{apache2_2.4.18.bb => apache2_2.4.20.bb}       |     8 +-
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |     4 +-
>  .../recipes-httpd/hiawatha/hiawatha_9.2.bb         |     2 +-
>  .../recipes-httpd/monkey/monkey_1.5.6.bb           |     2 +-
>  .../nginx/nginx-1.9.14/nginx-cross.patch           |   211 +
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |     2 +-
>  .../nginx/{nginx_1.9.12.bb => nginx_1.9.14.bb}     |     4 +-
>  .../recipes-httpd/nostromo/nostromo_1.9.5.bb       |     2 +-
>  meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb  |     2 +-
>  ...ugin_0.8.6.bb => xfce4-weather-plugin_0.8.7.bb} |     4 +-
>  ..._1.5.2.bb => xfce4-whiskermenu-plugin_1.5.3.bb} |     4 +-
>  .../xfce4-power-manager_1.4.4.bb                   |     4 +-
>  .../xfce4-settings/xfce4-settings_git.bb           |     8 +-
>  200 files changed, 1157 insertions(+), 35960 deletions(-)
>  create mode 100644 meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/01-fix-force-user-sec-ads.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/02-fix-ipv6-join.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/03-net-ads-kerberos-pac.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/04-ipv6-workaround.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/05-fix-gecos-field-with-samlogon.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/06-fix-nmbd-systemd-status-update.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/07-fix-idmap-ad-getgroups-without-gid.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/08-fix-idmap-ad-sfu-with-trusted-domains.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/09-fix-smbclient-echo-cmd-segfault.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/10-improve-service-principal-guessing-in-net.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/11-fix-overwriting-of-spns-during-net-ads-join.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/12-add-precreated-spns-from-AD-during-keytab-generation.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/13-fix-aes-enctype.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/14-fix-dnsupdate.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/15-fix-netbios-name-truncation.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/16-do-not-check-xsltproc-manpages.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/17-execute-prog-by-qemu.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/18-avoid-get-config-by-native-ncurses.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/19-systemd-daemon-is-contained-by-libsystemd.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-unless-wanted.patch
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/00-fix-typos-in-man-pages.patch (100%)
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/0006-avoid-using-colon-in-the-checking-msg.patch (100%)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/16-do-not-check-xsltproc-manpages.patch
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/20-do-not-import-target-module-while-cross-compile.patch (79%)
>  mode change 100755 => 100644
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/21-add-config-option-without-valgrind.patch (100%)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/volatiles.03_samba
>  rename meta-networking/recipes-connectivity/samba/{samba_4.1.12.bb => samba_4.4.2.bb} (82%)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb} (94%)
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
>  create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
>  rename meta-networking/recipes-support/dnsmasq/files/{dnsmasq.service => dnsmasq-noresolvconf.service} (49%)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
>  rename meta-networking/recipes-support/libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb} (92%)
>  rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb} (91%)
>  rename meta-networking/recipes-support/libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb} (87%)
>  rename meta-networking/recipes-support/libtevent/{libtevent_0.9.25.bb => libtevent_0.9.28.bb} (88%)
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

