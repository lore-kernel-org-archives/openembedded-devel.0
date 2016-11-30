Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id E1DC36014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:55:59 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id x190so195292059qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=TBbiXl7gz/qxkCLxH/3PEG01R0ockP/QAxk+kg4EMJQ=;
	b=i1uZhQGCX3NIvq8AeJeQdGEeF23ypMzvVtRq5YV9njWxFjY/h7DXiaWYMLzO+W6NoH
	tS4E4B9KAjTM3QKqe+yKcdixE82qRRQ/orlBEcBJcSs5KIjHIF3NG1mhBF4JTmiQtoZZ
	zEBfnVVUuf5lifC3mX91+/vSPqscWU++4jMi9xa4smZmYcmgwsHuGFSHWZOg82iQpms/
	+WmXwkL3BSBbSml7hzEoK2ZOuvxNxYEgbEKMU10T7oVZlwi3bELu57ggf0yrgcjnQXrX
	AosJf2wLiKEN301etuxU9prkAs/OGvnBdldjmcA2P5AUEVRhC9TknjyiBLTY0/QKsk66
	mnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=TBbiXl7gz/qxkCLxH/3PEG01R0ockP/QAxk+kg4EMJQ=;
	b=eFcuy+448px7+/csIfpjJQJKZOFY8/1amOTU9hTL7Vx7MOLuVzsGqcbwzjvgKPNYiR
	8vgLR0Lridr3yQ1tc6Dxrh+Pj4ZfQr555P7GGhEzPxVMbeMV8LO4S0ByrJepuqcDGDjv
	tnAIlTXSCebgL1CxMW5u4zCuPMNkykmumnEjTR2ehX/xkZ1hDQ3Fu2Ss3tCeG7Socozx
	2PwGqRLX1fKicov6is3cN3C08t/SAxuEQ65zjpW8Fsav1ZxweS/SXFNm3wtyouxwaCgR
	li7LkIz5fVSsnWzwecvh3UH/xx1UaDsr9u1TI3uG2RLsA8CI9ylNrZh9SmqdhScYgPQa
	G4HQ==
X-Gm-Message-State: AKaTC03V3klXPT3iW7vCfiqdQiiJc2m32SS6GR5QjWpijdFPbZmbZjdX/iRu4Efk5Y1oLw==
X-Received: by 10.55.100.204 with SMTP id y195mr29807022qkb.23.1480470960343; 
	Tue, 29 Nov 2016 17:56:00 -0800 (PST)
Received: from [10.22.11.46] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	x13sm32349024qkb.45.2016.11.29.17.55.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 17:55:59 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1480439625.git.akuster808@gmail.com>
	<CA+chaQd+aSRQRT9XCUnmfwmOxcLAYbk3oRFcLaJ+r7w-XEBcmg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <62e11add-ebba-e3fd-072c-54f15bde613a@gmail.com>
Date: Tue, 29 Nov 2016 17:55:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQd+aSRQRT9XCUnmfwmOxcLAYbk3oRFcLaJ+r7w-XEBcmg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 00/69] Morty pull request, cover letter only
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
X-List-Received-Date: Wed, 30 Nov 2016 01:56:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/29/2016 09:51 AM, Martin Jansa wrote:
> > mpv: Add libvdpau to DEPENDS
>
> Doesn't this need libvdpau which isn't in morty?

crud. thanks for catching that.

- armin
>
> On Tue, Nov 29, 2016 at 6:15 PM, Armin Kuster <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
>
>     Please consider these changes for meta-oe morty branch.
>
>     The following changes since commit
>     659d9d3f52bad33d7aa1c63e25681d193416d76e:
>
>       meta-openembedded: Add me to morty maintainer's list (2016-11-15
>     15:14:32 +0100)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/meta-openembedded-contrib
>     <http://git.openembedded.org/meta-openembedded-contrib>
>     akuster/morty-next
>     http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next
>     <http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next>
>
>     Andreas Müller (1):
>       Revert "physfs: move to sources found at github/supertux"
>
>     André Draszik (2):
>       asio: DEPENDS on openssl
>       asio: fix a musl compilation warning
>
>     Armin Kuster (1):
>       wireshark: install missing header files
>
>     Hongxu Jia (1):
>       ttf-abyssinica: update SRC_URI
>
>     Jackie Huang (28):
>       openjpeg: rename the download file
>       gtkmm: add x11 to REQUIRED_DISTRO_FEATURES
>       pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
>       libunique: add x11 to REQUIRED_DISTRO_FEATURES
>       dconf: add x11 to REQUIRED_DISTRO_FEATURES
>       evince: add x11 to REQUIRED_DISTRO_FEATURES
>       gnome-disk-utility: add x11 to REQUIRED_DISTRO_FEATURES
>       gtksourceview2: add x11 to REQUIRED_DISTRO_FEATURES
>       libwnck: add x11 to REQUIRED_DISTRO_FEATURES
>       libxklavier: add x11 to REQUIRED_DISTRO_FEATURES
>       packagegroup-xfce-base: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-pulseaudio-plugin: add x11 to REQUIRED_DISTRO_FEATURES
>       thunar-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce-panel-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce-app.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
>       exo: add x11 to REQUIRED_DISTRO_FEATURES
>       garcon: add x11 to REQUIRED_DISTRO_FEATURES
>       gtk-xfce-engine: add x11 to REQUIRED_DISTRO_FEATURES
>       libxfce4ui: add x11 to REQUIRED_DISTRO_FEATURES
>       thunar: add x11 to REQUIRED_DISTRO_FEATURES
>       thunar-volman: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-appfinder: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-panel: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-power-manager: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-session: add x11 to REQUIRED_DISTRO_FEATURES
>       xfce4-settings: add x11 to REQUIRED_DISTRO_FEATURES
>       xfdesktop: add x11 to REQUIRED_DISTRO_FEATURES
>       xfwm4: add x11 to REQUIRED_DISTRO_FEATURES
>
>     Junxian.Xiao (1):
>       apache2: include .load files in modules.d
>
>     Kai Kang (1):
>       python-m2crypto: inherit siteinfo
>
>     Khem Raj (14):
>       meta_oe_security_flags: Disable PIE for
>         s3c64xx-gpio/s3c24xx-gpio/cpufrequtils
>       meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
>       krb5: Add -fPIC to compile flags
>       libplist: Remove rpaths surgically
>       lockdev: Pretend GNU libc on musl
>       libqmi: Fix build with clang
>       openldap: Fix Build error due to missing -fPIC
>       md5deep: Fix build with clang
>       flashrom: Remove redundant const qualifier
>       fribidi: Fix build with security flags turned on
>       libmad: Fix build with clang
>       modemmanager: Fix build with clang
>       vlc: Add packageconfig for vdpau
>       mpv: Add libvdpau to DEPENDS
>
>     Koen Kooi (1):
>       android-tools: fix do_install
>
>     Philip Balister (1):
>       fftw: Remove the fftw-dev package dependency on non-existent fftw
>         package.
>
>     Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com> (2):
>       iscsi-initiator-utils: fix postinstall and systemd service file
>       edac-utils: fix systemd service
>
>     Robert Yang (1):
>       lftp: fix PACKAGECONFIG[readline]
>
>     Tim Orling (1):
>       mariadb: use faster download URL
>
>     Ting Liu (1):
>       xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on
>         ppc64
>
>     Wang Xin (2):
>       lksctp-tools: 1.0.16 -> 1.0.17
>       drbd-utils: 8.9.3 -> 8.9.6
>
>     Wenzong Fan (4):
>       opencv: fix QA issue
>       libeigen: set tarball name as ${BP}.tar.bz2
>       opencv: checking existence of /usr/lib
>       rsnapshot: fix host path in rsnapshot.conf.default
>
>     Yi Zhao (6):
>       aoetools: fix QA warning for GNU_HASH
>       nuttcp: fix QA warning for GNU_HASH
>       zeroconf: fix QA warning for GNU_HASH
>       tsocks: fix QA warning for GNU_HASH
>       vblade: fix QA warning for GNU_HASH
>       tunctl: fix QA warning for GNU_HASH
>
>     dengke.du@windriver.com <mailto:dengke.du@windriver.com> (1):
>       augeas: fix QA warning
>
>      .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52
>     --------------
>      .../recipes-support/physfs/physfs_2.0.3.bb
>     <http://physfs_2.0.3.bb>         | 13 ++++
>      .../recipes-support/physfs/physfs_git.bb <http://physfs_git.bb> 
>              | 15 ----
>      meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
>     <http://dconf_0.18.0.bb>  |  4 +-
>      meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
>     <http://evince_3.18.2.bb>   | 4 +-
>      .../gnome-disk-utility_2.32.0.bb
>     <http://gnome-disk-utility_2.32.0.bb>                  |  5 +-
>      .../gtksourceview/gtksourceview2_2.10.5.bb
>     <http://gtksourceview2_2.10.5.bb>  |  4 +-
>      meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
>     <http://libwnck_2.31.0.bb> | 4 +-
>      .../recipes-gnome/libxklavier/libxklavier_5.3.bb
>     <http://libxklavier_5.3.bb>   |  3 +
>      meta-multimedia/recipes-multimedia/vlc/vlc.inc     | 7 +-
>      .../recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb>        |  2 +-
>      .../files/iscsi-initiator.service                  | 1 +
>      .../iscsi-initiator-utils/files/set_initiatorname  | 12 ++++
>      .../iscsi-initiator-utils_2.0-873.bb
>     <http://iscsi-initiator-utils_2.0-873.bb>              | 27 +++----
>      .../vblade/files/makefile-add-ldflags.patch        | 19 +++++
>      .../recipes-daemons/vblade/vblade_20.bb <http://vblade_20.bb>   
>             |  4 +-
>      .../tsocks/tsocks/makefile-add-ldflags.patch       | 19 +++++
>      .../recipes-protocols/tsocks/tsocks_1.8beta5.bb
>     <http://tsocks_1.8beta5.bb>    |  4 +-
>      .../zeroconf/zeroconf/makefile-add-ldflags.patch   | 19 +++++
>      .../recipes-protocols/zeroconf/zeroconf_0.9.bb
>     <http://zeroconf_0.9.bb>  |  1 +
>      .../aoetools/aoetools/makefile-add-ldflags.patch   | 31 ++++++++
>      .../recipes-support/aoetools/aoetools_36.bb
>     <http://aoetools_36.bb>        |  1 +
>      .../{drbd-utils_8.9.3.bb <http://drbd-utils_8.9.3.bb> =>
>     drbd-utils_8.9.6.bb <http://drbd-utils_8.9.6.bb>}  |  6 +-
>      ...sctp-tools_1.0.16.bb <http://sctp-tools_1.0.16.bb> =>
>     lksctp-tools_1.0.17.bb <http://lksctp-tools_1.0.17.bb>} |  4 +-
>      .../recipes-support/nuttcp/nuttcp_7.2.1.bb
>     <http://nuttcp_7.2.1.bb>         |  2 +-
>      meta-networking/recipes-support/tunctl/tunctl.inc  | 4 +-
>      .../tunctl/tunctl/makefile-add-ldflags.patch       | 19 +++++
>      .../recipes-support/wireshark/wireshark_2.2.1.bb
>     <http://wireshark_2.2.1.bb>   | 31 ++++++--
>      .../conf/distro/include/meta_oe_security_flags.inc | 6 ++
>      meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
>     <http://krb5_1.13.6.bb>   |  4 +-
>      .../libqmi/libqmi/0001-Detect-clang.patch          | 84
>     ++++++++++++++++++++++
>      .../recipes-connectivity/libqmi/libqmi_1.16.0.bb
>     <http://libqmi_1.16.0.bb>   | 4 +-
>      .../modemmanager/enum-conversion.patch             | 21 ++++++
>      ...modemmanager_1.6.0.bb <http://modemmanager_1.6.0.bb> =>
>     modemmanager_1.6.4.bb <http://modemmanager_1.6.4.bb>} |  8 ++-
>      .../android-tools/android-tools_5.1.1.r37.bb
>     <http://android-tools_5.1.1.r37.bb>  | 24 ++++---
>      .../recipes-devtools/libfribidi/fribidi_0.19.7.bb
>     <http://fribidi_0.19.7.bb>  | 1 +
>      .../0001-ichspi.c-Fix-build-with-clang.patch       | 29 ++++++++
>      .../recipes-extended/flashrom/flashrom_0.9.6.1.bb
>     <http://flashrom_0.9.6.1.bb>  |  1 +
>      .../libimobiledevice/libplist_1.8.bb <http://libplist_1.8.bb>   
>                | 10 ++-
>      .../files/0001-Fix-errors-found-by-clang.patch     | 32 +++++++++
>      meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
>     <http://md5deep_4.4.bb>    | 1 +
>      meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
>     <http://gtkmm_2.24.3.bb>         |  4 +-
>      meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
>     <http://libunique_1.1.6.bb> | 4 +-
>      .../recipes-graphics/openjpeg/openjpeg_2.1.1.bb
>     <http://openjpeg_2.1.1.bb>    |  2 +-
>      .../ttf-fonts/ttf-abyssinica_1.500.bb
>     <http://ttf-abyssinica_1.500.bb>     |  2 +-
>      meta-oe/recipes-graphics/xorg-app/xterm_325.bb
>     <http://xterm_325.bb>     |  2 +-
>      ...4-Remove-clang-unsupported-compiler-flags.patch | 43 +++++++++++
>      .../recipes-multimedia/libmad/libmad_0.15.1b.bb
>     <http://libmad_0.15.1b.bb>    |  1 +
>      meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>     <http://mpv_0.15.0.bb>   |  2 +-
>      .../pulseaudio/pavucontrol_3.0.bb <http://pavucontrol_3.0.bb>  
>     |  4 +-
>      meta-oe/recipes-support/asio/asio.inc              | 2 +-
>      ...01-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 64
>     +++++++++++++++++
>      meta-oe/recipes-support/asio/asio_1.10.6.bb
>     <http://asio_1.10.6.bb>        |  5 +-
>      meta-oe/recipes-support/augeas/augeas.inc          | 3 +
>      .../recipes-support/edac-utils/edac-utils_git.bb
>     <http://edac-utils_git.bb>  |  1 +
>      .../recipes-support/edac-utils/files/edac.service  | 1 -
>      meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>     <http://fftw_3.3.4.bb>         |  2 +
>      meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
>     <http://libeigen_3.2.8.bb> | 2 +-
>      meta-oe/recipes-support/lockdev/lockdev_git.bb
>     <http://lockdev_git.bb>     | 2 +
>      meta-oe/recipes-support/mysql/mariadb.inc          | 2 +-
>      meta-oe/recipes-support/opencv/opencv_3.1.bb
>     <http://opencv_3.1.bb>  |  4 +-
>      .../recipes-support/openldap/openldap_2.4.44.bb
>     <http://openldap_2.4.44.bb>    |  2 +-
>      meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
>     <http://rsnapshot_git.bb> |  2 +
>      .../python/python-m2crypto_0.23.0.bb
>     <http://python-m2crypto_0.23.0.bb>        |  2 +-
>      .../recipes-httpd/apache2/apache2_2.4.23.bb
>     <http://apache2_2.4.23.bb>        |  1 +
>      meta-xfce/classes/thunar-plugin.bbclass            | 4 +-
>      meta-xfce/classes/xfce-app.bbclass                 | 4 +-
>      meta-xfce/classes/xfce-panel-plugin.bbclass        | 4 +-
>      .../pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
>     <http://xfce4-pulseaudio-plugin_0.2.4.bb>   |  2 +-
>      meta-xfce/recipes-xfce/exo/exo_0.11.1.bb <http://exo_0.11.1.bb> 
>              |  5 +-
>      meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
>     <http://garcon_0.4.0.bb>      |  4 +-
>      .../gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
>     <http://gtk-xfce-engine_3.2.0.bb>       | 4 +-
>      .../recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
>     <http://libxfce4ui_4.12.1.bb>   |  4 +-
>      .../packagegroups/packagegroup-xfce-base.bb
>     <http://packagegroup-xfce-base.bb> |  4 +-
>      .../thunar-volman/thunar-volman_0.8.1.bb
>     <http://thunar-volman_0.8.1.bb>  |  4 +-
>      meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
>     <http://thunar_1.6.10.bb>     |  4 +-
>      .../xfce4-appfinder/xfce4-appfinder_4.12.0.bb
>     <http://xfce4-appfinder_4.12.0.bb>      | 4 +-
>      .../recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
>     <http://xfce4-panel_4.12.0.bb> |  4 +-
>      .../xfce4-power-manager_1.6.0.bb
>     <http://xfce4-power-manager_1.6.0.bb>                  |  4 +-
>      .../xfce4-session/xfce4-session_4.12.1.bb
>     <http://xfce4-session_4.12.1.bb> |  4 +-
>      .../xfce4-settings/xfce4-settings_git.bb
>     <http://xfce4-settings_git.bb>  |  4 +-
>      .../recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
>     <http://xfdesktop_4.12.3.bb>     |  4 +-
>      meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
>     <http://xfwm4_4.12.3.bb>       |  4 +-
>      83 files changed, 618 insertions(+), 154 deletions(-)
>      delete mode 100644
>     meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
>      create mode 100644
>     meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
>     <http://physfs_2.0.3.bb>
>      delete mode 100644
>     meta-filesystems/recipes-support/physfs/physfs_git.bb
>     <http://physfs_git.bb>
>      create mode 100644
>     meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname
>      create mode 100644
>     meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
>      create mode 100644
>     meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
>      create mode 100644
>     meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
>      create mode 100644
>     meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
>      rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.3.bb
>     <http://drbd-utils_8.9.3.bb> => drbd-utils_8.9.6.bb
>     <http://drbd-utils_8.9.6.bb>} (86%)
>      rename
>     meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.16.bb
>     <http://lksctp-tools_1.0.16.bb> => lksctp-tools_1.0.17.bb
>     <http://lksctp-tools_1.0.17.bb>} (94%)
>      create mode 100644
>     meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
>      create mode 100644
>     meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
>      create mode 100644
>     meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
>      rename
>     meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.0.bb
>     <http://modemmanager_1.6.0.bb> => modemmanager_1.6.4.bb
>     <http://modemmanager_1.6.4.bb>} (88%)
>      create mode 100644
>     meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
>      create mode 100644
>     meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
>      create mode 100644
>     meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
>      create mode 100644
>     meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
>
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


