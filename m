Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F72078C9E
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 02:03:26 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d19so12261359qkg.5
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 04 Nov 2018 18:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=xZ+e6NbF3AMYpXVNUFimlT3u6nx/OHR37WyujleTe+o=;
	b=Ug6tJU9fv4nSK3i0cgDWHyTRH+JjdulUWeFJt5q4vSFN/G7KySO6CrqPkFmyyyORmj
	Owbi+IAnV///ZGqFuQjxn6jncAOFxfHKmeowJqJ0YS/PtyVoSTbR8ZWQj5qd5iVXKyKV
	VbE3jKuB0vOV0jDPRvaiuayZ9xQQRsD+wGRLm2E6wDVnKu4rdDduufX8NNOOjwO0fvRw
	+3WLK/rzaLowjQ0RVP8wQKLkAclB8T1uBbAd/SPeVwszcEfxmUbxJ9HDwcEHWSlsy7Wd
	54LZTvNkmD9NyA9VvoEXQFwjc2smTecHHmwAMp6nR+fN1uGYFM6gFEkxyEVSB1miiu/B
	KAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xZ+e6NbF3AMYpXVNUFimlT3u6nx/OHR37WyujleTe+o=;
	b=c69NJrZtzgfV8452mLHya3BuGuURCeABX+RG57N8iUtgFDiAsO9Fr4Uq6fuQSNt1O5
	Y+i2pYDCAJAzmKKnKYydgcrRSmvzmhfWzEpYaXZIvO3N8t9fkez9BthNTvpiX6JCpWF5
	K6iW7Qu/NMYv/Dco47I08bZv6XNQU1Q9AmXDEOg0Oa9iKelCieQ3F5QOu/TuyYY40hQS
	ulBWOM/28edWGMNEkfvRd7Nq75/w3bNF56FHoNPn0rq4vpjr4aaET4VeeF0/qGdgb/gS
	dZjrJfXFlN8oGkQOc7Sa+JcsnFrdyPHRa2ca4BooHEJPZBhcEy+2uQyJ4GJjCjpPisTm
	8I5g==
X-Gm-Message-State: AGRZ1gLC+Gs3gLJB+mIGlJxJBGYJXC9H/IetncshXZwIepiz6w9w5yHL
	nnaXNvF3nv55z1kSHOIhePDaahTMyqPApYDIlu5xGXPzbj4=
X-Google-Smtp-Source: AJdET5ew2xZQ5VQDQfDyyQtlRGnuTJ80AlNowOrSGPs3AaLKAk2xDTCCsgnQIuhDVb/3eq3H8pov8vmxflrVaEMIByQ=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr19607261qke.2.1541383406979; 
	Sun, 04 Nov 2018 18:03:26 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Nov 2018 18:03:00 -0800
Message-ID: <CAMKF1souN2zmgnxkP_vTWNKN-LbbQA2iG70hGdrrd=NDmQ=wzw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-11-03
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
X-List-Received-Date: Mon, 05 Nov 2018 02:03:26 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='4'|Failed tasks    !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
||version-going-backwards ||host-user-contaminated
||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
||qa_pseudo ||
|-
||2018-11-03 ||9 ||8 ||7 ||4 ||0 ||0 ||0 ||1 ||3 ||0 ||6 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-11-03 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181104_175802.log

=== common (4) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
    * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install
    * sources/meta-freescale/recipes-kernel/linux/linux-imx-headers_4.9.123.bb:do_unpack
    * sources/meta-rust/recipes-devtools/rust/rust-llvm_1.27.1.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
    * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile

=== qemuarm64 (4) ===
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.11.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (2) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (28) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181102_205508.log/
||
|-
|| qemuarm64 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181103_080615.log/
||
|-
|| qemux86 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181102_205518.log/
||
|-
|| qemux86_64 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181103_094235.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (9) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||host-user-contaminated
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
||0 ||unknown-configure-option
|-
||1 ||textrel
|-
||3 ||build-deps
|-
||6 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181104_031212.log/


    * ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps


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


count: 1 issue: textrel
ELF binary '/tmp/work/aarch64-yoe-linux/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go'
has relocations in .text [textrel]


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


count: 6 issue: version-going-backwards
mpd-0.20.22: Package version for package mpd-dbg went backwards which
would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]
mpd-0.20.22: Package version for package mpd-dev went backwards which
would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]
mpd-0.20.22: Package version for package mpd-doc went backwards which
would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]
mpd-0.20.22: Package version for package mpd-locale went backwards
which would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]
mpd-0.20.22: Package version for package mpd-staticdev went backwards
which would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]
mpd-0.20.22: Package version for package mpd went backwards which
would break package feeds from (0:0.21-r0.0 to 0:0.20.22-r0.2)
[version-going-backwards]


count: 0 issue: host-user-contaminated


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
701f76f bitbake-user-manual: Added hard-spacing to "_remove" example.
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
14b5854 xserver-xorg: fix CVE-2018-14665
not included in master yet:
9a49329 go-dep: disable PTEST_ENABLED for mips and mips64
8cd6047 gdbm: fix ptest failure
15a9776 python3: Fix python3-pyvenv run-time dependency
877c0f8 archiver: Drop unwanted directories
ed3dc4b nss: update to 3.39 includes CVE-2018-12384
64440f6 nspr: Update to 4.20
e51ce22 gnutls: update to 3.6.4
7c5a390 libpcre2: update to 10.32
9f361ce curl: update to 7.61.1
62f9626 openssh: Update to 7.9 primarily bug fixes
d44daaa libsm: update to 1.2.3
ef9f9e6 libx11: update to 1.6.7 and sytle cleanup
916fc66 libxcb: update to 1.13.1
3f32d77 xkeyboard-config: update to 2.25
20a78c6 xf86-input-libinput: update to 0.28.1
f43d54a dhcp: fix issue with new bind changes
d780044 tzcode-native: update to 2018g
1e4e8f4 tzdata: update to 2018g
4208c6e oe-init-buildenv/base: Relax python version checks in favour
of HOSTTOOLS manipulation
f1adb88 nasm: fix CVE-2018-1000667
88f6274 kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
276ee8c xserver-xorg: update to 1.20.3
fe14516 v86d: Make cross compilation working on more architectures
d2eb0b1 connman: update to 1.36
0f99c67 bind: update to latest LTS 9.11.5
1660f49 go: Change from TARGET_ARCH to TUNE_PKGARCH
5c5e042 crosssdk: Remove usage of host flags for cross-compilation
25f6c15 oeqa/runtime/ptest: Inject results+logs into stored json results file
738d8ce systemd: fix CVE-2018-15686
622b33e systemd: fix CVE-2018-15687
de022f3 systemd: fix CVE-2018-15688
02b4338 qemu: fix for CVE-2018-10839
ebf6b68 unzip: fix for CVE-2018-18384
82d686e xf86-video-intel: update to latest
e183f65 openssl: fix CVE-2018-0734 for both 1.0.2p and 1.1.1
963de58 openssl: fix CVE-2018-0735 for 1.1.1
a55fa4a libgpg-error: Support build for native on ppc64/ppc64le hosts
2d80bd1 elfutils: 0.173 -> 0.174
625ce14 elfutils: fix CVE-2018-18520 & CVE-2018-18521 & CVE-2018-18310

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
f1511d2 libssh: Do not use thumb-1 ISA on armv5
not included in master yet:
3cb2263 uftrace: Support x86
2aa7059 geoip: update md5sum and sha256sum
57bcd4d lvm2: update SRC_URI
5cf604e vlan: update SRC_URI
32e5f35 netkit-telnet: update SRC_URI
4d53ab2 netcat-openbsd: update SRC_URI
17a4e82 uriparser: Allow native build
2731f21 python-pyiface: Upgrade to 0.0.11
12c3945 python-twisted: Add more python-twisted-* packages to the "meta" package
a21e2ae civetweb: remove redundant EXTRA_OECMAKE_class-native
b5dd680 civetweb: disable tests
2417acf libyui: make resulting cmake config relocatable
8d7a7ad libyui-ncurses: fix ncurses find module
bcbbace netkit-telnet: fix qa warnings of alternative target
4222cac xfconf: 4.13.5 -> 4.13.6
76bfed5 xfce4-clipman-plugin: 1.4.2 -> 1.4.3
c1bc28f xfce4-notifyd: 0.4.2 -> 0.4.3
f27c15d thunar: 1.8.1 -> 1.8.2
31d7012 libwnck3: 3.24.1 -> 3.30.0
fae12ca gvfs: 1.36.2 -> 1.39.1
6570a8d libio-socket-ssl-perl: 2.059 -> 2.060
57d261c lcov: Fix perl module dependencies
5f94a97 adduser: 3.117 -> 3.118
e9e2148 apache2: Fix CVE-2018-11763
1627aa0 xfce4-settings: upgrade 4.12.3 -> 4.12.4
4be3dce networkmanager: upgrade 1.10.10 -> 1.14.4
fd23b9c dbus-broker: fetch submodules too
334d73d v4l-utils: update to 1.16.0
60f3d46 mariadb: Upgrade to 5.5.62
7163946 rapidjson: Allow empty package
40a43f5 network-manager-applet: change default buildclass
e15f5c0 pcsc-lite: fix SRC_URI

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
5832bf2 qtbase: don't use thumb for armv[45]
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
b5fa3f5 Add dependency on meta-rust
not included in master yet:
~/oe/world/yoe

