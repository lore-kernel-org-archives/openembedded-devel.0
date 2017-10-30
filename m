Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7409471A32;
	Mon, 30 Oct 2017 13:08:00 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l8so12507883wre.12;
	Mon, 30 Oct 2017 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ir7pcj9WZjnqGeDWjhSIpj0lAFpkfDLRKdlWy/gJqao=;
	b=vQ5f04plrpjgWABDWvA5wdtuCYKJRhL6HYevwlYNdJuHD8g3CjUrtKnj5v/xwZQlAP
	OTr5H/8Uw+MaoxfWlUeSRygNfk1Wmg1eTj+y3VRItrDBR0I2CB90huwM2xUXDQPVHlB/
	WSWM35IJL64FXHh80ZUQZMJ6uXoWFNIhfxdbMf/8FNrcWrs/BXDbrSCxM0zweIxHQaKP
	loXP0MDeAFDUfs46QTZkcleRBRxLgIJwGyb0M2ZbpAF2OYhnVWxoiScmW0SJFtJdPwzP
	3ubTIHyL3jFJ5vX96MPpy8FK/C1PckIA79/fKeXwNCRndtKTtZnbMu/FcZNjiYi0qh6m
	xiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ir7pcj9WZjnqGeDWjhSIpj0lAFpkfDLRKdlWy/gJqao=;
	b=aAbEgOpZaPn2BQ9cHagLgqQ6Lp6Noah8mDPMozNORmqDNFU6HE0R6P0Z729VVQOSh2
	vkK0Vs74XpX+ZDCbAhhFqyoFnKTppYmUW/zOss13DshWj7y89i7KJ8Hw6zxItenLV3Ob
	MEmIoB2QNpsQ3bAQwWxXBnZfxDdYPxceTuGnaNdT6JasjAcCuPoWhwt6MvvH72078FCG
	SPApINHqiD5IvfN3+DhmSR/RWiHmeacXORCjzW8D3X8fY6YpOAgjBQxrvDSbqofHnZvT
	HGS0tV755WmPU4/MlT8MbkINRFowIuqdQr5/YIuZogx4+HvachOx1rgUxMTJ+83BUI3Q
	dLCA==
X-Gm-Message-State: AMCzsaVswSSrwu2yfnLzHLPYRrTJID5K1YzoU8MWUmC+BTOhdrNiYrhN
	MiNndA3jUObHvW4N8X4GNRmDfIL7Mv3oZPiGzmhD7A==
X-Google-Smtp-Source: ABhQp+TfHCUh7QadcZ+wD34MFftDW2PRvaZfKrUlCUMEgg5K4Uq9vTaKvxwLKrkMv9Lhmrt+JrLI8h4wMwkpA1oqur4=
X-Received: by 10.223.143.51 with SMTP id p48mr7113174wrb.104.1509368880574;
	Mon, 30 Oct 2017 06:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 30 Oct 2017 06:07:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Oct 2017 14:07:59 +0100
Message-ID: <CA+chaQeOgdntXPDWL8B2690weRRAEne-g-6-RWFcS+x7Ap_amg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-10-29
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
X-List-Received-Date: Mon, 30 Oct 2017 13:08:01 -0000
Content-Type: text/plain; charset="UTF-8"

A lot more issues reported for qemux86 this time, because now it's using
musl TCLIBC in these world builds.

This list isn't even complete, there were many more ERRORs being shown for
components being skipped e.g. because systemd isn't compatible with musl
(and then skipping everything depending on that and so on).
Summary: There were 76 WARNING messages shown.
Summary: There were 1648 ERROR messages shown, returning a non-zero exit
code.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='4'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all ||already-stripped
||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||qa_pseudo ||
|-
||2017-10-29 ||4 ||7 ||14 ||1 ||0 ||0 ||0 ||1 ||0 ||0 ||4 ||5 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||2 ||
|}

== Failed tasks 2017-10-29 ==

INFO: jenkins-job.sh-1.8.39 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171030_030413.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:
do_package_qa

=== qemuarm64 (6) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:
do_compile
    *
meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:
do_compile
    *
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:
do_install
    *
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_package_qa

=== qemux86 (14) ===
    *
meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:
do_package
    *
meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:
do_configure
    *
meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:
do_compile
    *
meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:
do_compile
    *
openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb:
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
do_package_qa

=== qemux86_64 (1) ===
    *
meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171029_040929.log/
|| http://errors.yoctoproject.org/Errors/Build/47845/
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171029_061855.log/
|| http://errors.yoctoproject.org/Errors/Build/47853/
|-
|| qemux86 || 14 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171029_040931.log/
|| http://errors.yoctoproject.org/Errors/Build/47855/
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171029_155849.log/
|| http://errors.yoctoproject.org/Errors/Build/47856/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (12) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
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
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||1 ||textrel
|-
||2 ||qa_pseudo
|-
||4 ||version-going-backwards
|-
||5 ||host-user-contaminated
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171029_113221.log/


    * ERROR: Nothing PROVIDES 'udev' (but
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
lvm2_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils-scripts_1.1.4.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/ofono/
ofono_1.20.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
libdevmapper_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/gstreamer/
gstreamer1.0-vaapi_1.12.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/
gammu_1.32.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
libinput_1.8.1.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/btrfs-tools/
btrfs-tools_4.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/glmark2/
glmark2_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
weston_2.0.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/webkit/
webkitgtk_2.16.6.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-driver/
xf86-video-intel_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/hidapi/
hidapi_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/thunar/
thunar_1.6.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libcec/
libcec_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils_1.1.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libcyusbserial/
libcyusbserial_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/usbmuxd/
usbmuxd_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/libgudev/
libgudev_231.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libatasmart/
libatasmart_0.19.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/hwloc/
hwloc_1.11.5.bb, /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/usbutils/
usbutils_008.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/
pulseaudio_10.0.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/dhcpcd/
dhcpcd_6.11.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/bluez5/
bluez5_5.46.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_1.12.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/clutter/
clutter-1.0_1.26.2.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-xserver/
xserver-xorg_1.19.3.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-utils/udevil/
udevil_0.4.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/
gnome-bluetooth_3.18.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pcsc-lite/
pcsc-lite_1.8.22.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pciutils/
pciutils_3.5.5.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/gnome-desktop/
gnome-desktop3_3.24.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/multipath-tools/
multipath-tools_0.7.1.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pcmciautils/
pcmciautils_018.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'udev' (but
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/usbutils/
usbutils_008.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/usbmuxd/
usbmuxd_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pciutils/
pciutils_3.5.5.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/clutter/
clutter-1.0_1.26.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
libdevmapper_2.02.171.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/hidapi/
hidapi_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/
gnome-bluetooth_3.18.2.bb,
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/btrfs-tools/
btrfs-tools_4.12.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/libgudev/
libgudev_231.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pcmciautils/
pcmciautils_018.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/gstreamer/
gstreamer1.0-vaapi_1.12.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/
gammu_1.32.0.bb, /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/gnome-desktop/
gnome-desktop3_3.24.2.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
libinput_1.8.1.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libcec/
libcec_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libatasmart/
libatasmart_0.19.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/webkit/
webkitgtk_2.16.6.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-utils/udevil/
udevil_0.4.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_1.12.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/
pulseaudio_10.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils-scripts_1.1.4.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils_1.1.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pcsc-lite/
pcsc-lite_1.8.22.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-driver/
xf86-video-intel_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
weston_2.0.0.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/dhcpcd/
dhcpcd_6.11.3.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/thunar/
thunar_1.6.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/multipath-tools/
multipath-tools_0.7.1.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
lvm2_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/ofono/
ofono_1.20.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/bluez5/
bluez5_5.46.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/hwloc/
hwloc_1.11.5.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/glmark2/
glmark2_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libcyusbserial/
libcyusbserial_git.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 1 issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 4 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-dbg went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-dev went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-ptest went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target went backwards which would break
package feeds from (0:1.0-r8.14 to 0:1.0-r8.13) [version-going-backwards]


count: 5 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase:
/qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: qtquickcontrols2:
/qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQuick/Controls.2/Material/qmldir
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript:
/qtscript-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 2 issue: qa_pseudo
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary
reproducibility
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:
ebcef48 bridge-utils: modify the AR to cross toolchain

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:
197811b qtwebengine: make test suite succeed

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

