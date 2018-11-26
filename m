Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 83BEB6C568
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:56:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d18so18582603qto.8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=F8HX8GMudbgehNRJvHd68qKt2N/HPhJPSteT2i944vI=;
	b=gGRtAhxPhl/ybeboXUNmUngSkSO77Smjw+16pwwMxrmeISFMMtOZxMJFwtr/tvaVWN
	PuoH+cCLDkSKx8V9LUxZAu4Kbv4OpB3NEEwv1aPWAifPEolwrtyqHvIIYe/Jv8ZJIQf+
	8Xt/b6RXVOwGSuJUcrwDParXql8vl1YbOtkFKrCRkl3FOgELmMaOdW6uw+RYSvKUFDIg
	XzlbZ883hlk+h287sf++8WmXEoWUjZoVtpx60jrx8qD+wW9FNkaH5KWt4WLtCnaT6JBQ
	R9pZwdTpQ9Nt19+//Sxndx5FlO80gOcR8xt8qR2Rmihh9CB0mLoIO/HlFEuNDMGymUBJ
	qytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=F8HX8GMudbgehNRJvHd68qKt2N/HPhJPSteT2i944vI=;
	b=V2zIk7Kl9HoHVjQ2IQ8CR968hgH47HyCdduOC+OxHJbV02OjTIvvmFf9VCIf9p5n01
	zBHIU8UqTvrGdHYrRcSrEUl5q3bo2cZyGygJm3DFZdBZN+7QBVRVDj6Y/pykbaaicFXD
	3OUno0ZAMwua/ObqLShT/hKGVm9RBtju9Cz4FSqT5Pxu6JcYFD4RbN5LCcZswaqZx6Ev
	SAZCgnFTpHQ/rhs0pFustJfu5QVdYXgbmgAysswtTOZEYEcZ222Cq+D3HWcKb8a98rm1
	1zZ9mBJrPYNZ0HXrzd2Ty/ClypQW1RXkoAWeSpStqXhy3KJnVsY73fzsYqY8esn+CndU
	OeKg==
X-Gm-Message-State: AA+aEWYPu3igOe/MwcpsVRT9ZIWe/lsUFUfY/QcOLpSbY1znkvslbjr3
	8odjjpOlKG9XAGSHKorN+dZdu2ZG7BKSi6gHAvdQPjrT+KI=
X-Google-Smtp-Source: AFSGD/WMZC1ts5fnDDZdnss5Oyg3CGlF0J6NzB16edcNgySvPpmdlV883MK9G+2TjtKrCJZpyNUsKuoZYucA/iazzrk=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr26486008qtn.254.1543254975774;
	Mon, 26 Nov 2018 09:56:15 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 09:55:49 -0800
Message-ID: <CAMKF1srErP=AT_wQ2Bkkg5YNqnH72bmSvUBjav8W4hpvAk8Y2A@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-11-26
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
X-List-Received-Date: Mon, 26 Nov 2018 17:56:15 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='4'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
||version-going-backwards ||host-user-contaminated
||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
||qa_pseudo ||
|-
||2018-11-24 ||11 ||9 ||8 ||7 ||0 ||0 ||0 ||0 ||3 ||0 ||24 ||1 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-11-24 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181126_082702.log

=== common (5) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
    * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install
    * sources/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb:do_compile
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb:do_package_qa
    * sources/meta-openembedded/meta-networking/recipes-support/geoip/geoip_1.6.12.bb:do_fetch

=== common-x86 (0) ===

=== qemuarm (6) ===
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb:do_package
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
    * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile

=== qemuarm64 (4) ===
    * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (1) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_git.bb:do_package

=== Number of failed tasks (35) ===
{| class=wikitable
|-
|| qemuarm || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181123_224146.log/
||
|-
|| qemuarm64 || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181124_112648.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181123_224145.log/
||
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181124_065217.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (28) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||qa_pseudo
|-
||0 ||symlink-to-sysroot
|-
||0 ||textrel
|-
||0 ||unknown-configure-option
|-
||1 ||host-user-contaminated
|-
||24 ||version-going-backwards
|-
||3 ||build-deps
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181125_080250.log/


    * ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'libdvbcsa' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
DEPENDS on or otherwise requires it). Close matches:
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'libdvbcsa' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
DEPENDS on or otherwise requires it). Close matches:
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-*:
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 0 issue: textrel


count: 3 issue: build-deps
glide-0.13.2: glide rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-dep-0.5.0: go-dep rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-helloworld-0.1: go-helloworld rdepends on libstd-rs, but it isn't a
build dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]


count: 0 issue: file-rdeps


count: 24 issue: version-going-backwards
btrfs-tools-4.17.1: Package version for package btrfs-tools-dbg went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-dbg went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-dev went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-dev went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-doc went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-doc went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-locale
went backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-locale
went backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-staticdev
went backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools-staticdev
went backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.22) [version-going-backwards]
btrfs-tools-4.17.1: Package version for package btrfs-tools went
backwards which would break package feeds from (0:4.19-r0.0 to
0:4.17.1-r0.24) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dbg went backwards which would break package feeds from
(0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dbg went backwards which would break package feeds from
(0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dev went backwards which would break package feeds from
(0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dev went backwards which would break package feeds from
(0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-doc went backwards which would break package feeds from
(0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-doc went backwards which would break package feeds from
(0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-locale went backwards which would break package feeds
from (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-locale went backwards which would break package feeds
from (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-staticdev went backwards which would break package feeds
from (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-staticdev went backwards which would break package feeds
from (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth went backwards which would break package feeds from
(0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth went backwards which would break package feeds from
(0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]


count: 1 issue: host-user-contaminated
dvb-apps: /dvb-apps/usr/share/dvb/av7110_loadkeys/hauppauge2.rc5 is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 0 issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report
~/oe/world/yoe ~/oe/world/yoe

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
7414b35 fetch: don't use shell=True when listing ar files
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
04469ab u-boot: Upgrade 2018.07 -> 2018.11
not included in master yet:
80d1749 mdadm: improve the run-ptest
988449b musl: Update to latest trunk

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
c26b10b opensc: 0.18.0 version fix fetch error
not included in master yet:
2c96816 ndctl: fix compile issue
e5d86e6 packagegroup-meta-oe: fix build issues
0b22b1d sblim-sfc-common: use official SPDX license for EPL
4e41e8e mpd: update to 0.21.3
02ce43f Bump libiio version to 0.15
2d50225 Fix python-idna egg-info permissions
094fdd1 bdwgc: upgrade 7.6.0 -> 7.6.8
87fd823 Copy breakpad .sym file in appropriate folder.
04c9acc Adds python3 syslog dependency to python3-systemd
6d71116 modemmanager: Update flag for disabling mbim
317377a dvb-apps: linux dvb apps package support
7c6cbf3 krb5: Upgrade to 1.16.2
0d79a62 geoip: add downloadfilename for geoip database files
8c953a9 librelp: Upgrade to 1.2.18
1c64b39 glog: fixed the build for mips and other platforms
f322116 openwsman: Upgrade to 2.6.8
09afca3 evince: Drop x11 requirement
0a6c80a vboxguestdrivers: upgrade to 5.2.22
af4b62a Revert "net-snmp: improve reproducibility"
912520f net-snmp: Reproducibility: Fixed path to /bin/uname
185df9d net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
8864ad1 net-snmp: Reproducibility: Don't check build host for /etc/printcap
a03b78d net-snmp: Reproducibility: Set NETSNMP_CONFIGURE_OPTIONS null
c1a8b18 net-snmp: Simplify sed expressions
d5737d5 ell: remove unused patch
dc3d610 ell: update to 0.15
80ea593 iwd: add version 0.12
e3b69d7 libcereal: Add native and nativesdk classes
10b342a dvb-apps: Fix build with kernel > 4.14
7f2d117 mosquitto: update to 1.5.4
8e43f2c python*-paho-mqtt: upgrade to 1.4.0
e68e5a8 python3-bandit: upgrade to 1.5.1
5d8e676 sedutil: fix compile errors on big endian architectures
3a25eb1 python3-multidict: Workaround for broken make clean
5be3b44 postgresql: Allow successful run of postgresql-setup
856bdf0 Add a working Tvheadend recipe
9affff2 libzip: new package
e86ad8e libserialport: new package
1765e48 doxygen: new native package
ffe2650 libsigrok: new package
7a22679 libsigrokdecode: new package
5430b13 sigrok-cli: new package

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
18f82a8 python-pyqt5: Disable parallel install
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
261dba7 chromium: Fix the x86 build with GCC 8.
not included in master yet:
~/oe/world/yoe

