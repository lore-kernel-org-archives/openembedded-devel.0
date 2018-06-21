Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3216D75441
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 23:10:43 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id z16-v6so3116221uaz.10
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=JxPVOVdjhSXf1s/8QIbtpDXBycY66tbHN5zn3ICyI6w=;
	b=CN/UZl4bgfMNdTQRMvvf8uDYDs2tl0xw/mpTZHB1hsocq6Kg/WDDkEvsZ4P4VfjVM0
	tKSLKfSg8jmSZH5CVKYSBkAhZRkFiRwpAiTIWrlUHEa0rlF24fNFVMasDBi/W1oleM96
	XkGr6F2XhdNJowK8Enj7RrLxFISEE1JACw3J10VGtBm9jxBjRMYCFXoKHdWT7iZmCLxG
	z6nMnjw0qfJ6UBfuUsJ4NmzjDuNs2q/1L8E3IGht4KIkZlvaBugU/rery1qAWnMterFc
	0sxgYYE9V20xZpSd+asvL+HFY87GFGpXj1O4vJczqaQKfE6LjbMFaOT2eY8UlM7ZznoN
	Z3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=JxPVOVdjhSXf1s/8QIbtpDXBycY66tbHN5zn3ICyI6w=;
	b=avPV2Rj8zE2YSUuIy7KvO0/iYN81hP1mHQ0H0vMVpXYa6cZUI97Tjpc7p6n4XID1hg
	a4hgUd3Rk6SR/Elkau1AGf09dsUCztFvDyS43989KkiT/FYmCjPP5CvtFLSR6XIF6fdI
	VAjuUsh3dK24VoEvulrvfNRRZ0KN+pNAiXjpEkpcmzv/t2CeapHQwiu26TQ2ozDfa+QP
	h9Iv36Vo0HunbOAprGatbFFQBdbjiqbb/7BxQsRqdNJsNOl2OtWm4un93f7R17o7Kr0p
	dlm0DAlVE2jD9IybbiGSNE3W+iNkAJ2YWw0VW9GxS9JTWVYFC7Q/mXHpvi+iVM37qz/L
	KCEA==
X-Gm-Message-State: APt69E3xSPfX4vcJXnd+fMu0SYrGxNmhafHovl64u73zvaiV3Ll8QXlT
	lW2tkz7wDMx5M8WYhPRK1/UC04niisITs6xT0Vl35w==
X-Google-Smtp-Source: ADUXVKKFCz+xzSK6jV+F9km7bBcMUgKOsKDLi/OVX0KIVpxpmZp2eM3oYHk39kI+J88/WbmidT4mKQE+yio9EKLFX3k=
X-Received: by 2002:a9f:3b9b:: with SMTP id
	r27-v6mr17466463uah.191.1529622643683; 
	Thu, 21 Jun 2018 16:10:43 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jun 2018 16:10:17 -0700
Message-ID: <CAMKF1soW0Uo+HM=YTSecYODPaeHvmnj4ZKm1bxYdk7XZC5hCdA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-06-21
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
X-List-Received-Date: Thu, 21 Jun 2018 23:10:43 -0000
Content-Type: text/plain; charset="UTF-8"

For complete status see
https://www.openembedded.org/wiki/Bitbake_World_Status_Thud

== Failed tasks 2018-06-21 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180621_114140.log

=== common (2) ===
    * sources/meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.27.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.2.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:do_compile

=== qemuarm (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile

=== qemuarm64 (3) ===
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa

=== qemux86 (16) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb:do_package_qa
    * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile

=== Number of failed tasks (36) ===
{| class=wikitable
|-
|| qemuarm || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180621_034606.log/
||
|-
|| qemuarm64 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180621_060146.log/
||
|-
|| qemux86 || 21 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180621_034611.log/
||
|-
|| qemux86_64 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180621_060205.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (14) ===
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
||1 ||installed-vs-shipped
|-
||2 ||build-deps
|-
||5 ||textrel
|-
||8 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180621_082314.log/


    * ERROR: Nothing PROVIDES 'ffmpeg' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_18.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'libmad' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_18.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'mpeg2dec' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_18.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps


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


count: 5 issue: textrel
ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test'
has relocations in .text [textrel]
ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.6-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
has relocations in .text [textrel]
glide-0.13.1: ELF binary
'/tmp/work/i586-bec-linux-musl/glide/0.13.1-r0/packages-split/glide/usr/bin/glide'
has relocations in .text [textrel]
go-dep-0.4.1: ELF binary
'/tmp/work/aarch64-bec-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test'
has relocations in .text [textrel]
go-dep-0.4.1: ELF binary
'/tmp/work/i586-bec-linux-musl/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep'
has relocations in .text [textrel]


count: 2 issue: build-deps
mbedtls-2.9.0: mbedtls-programs rdepends on hiawatha, but it isn't a
build dependency, missing hiawatha in DEPENDS or PACKAGECONFIG?
[build-deps]
mbedtls-2.9.0: mbedtls rdepends on hiawatha, but it isn't a build
dependency, missing hiawatha in DEPENDS or PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 8 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.5 to 0:1.0-r8.4)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.5 to 0:1.0-r8.4)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.5 to 0:1.0-r8.4)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.5 to 0:1.0-r8.4)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.5 to 0:1.0-r3.4)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.5 to 0:1.0-r3.4)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.5 to 0:1.0-r3.4)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.5 to 0:1.0-r3.4) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 1 issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


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
~/oe/world/oe-build ~/oe/world/oe-build

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
4937ed3 bitbake-user-manual: Added "number_threads" varflag
not included in master yet:
8efa782 fetch2: Use correct check in parameter handling in uri_replace()

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
85981cb gcc-8: Enable fp arch extention when fpu is available
not included in master yet:

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
52904e7 spice: Fix build with musl
not included in master yet:
5b8395e evince: update 3.28.1 -> 3.28.2
5bea574 spice: Uprev to latest and add opus PKGCONFIG
a44aca6 xfce4-panel: fix QA issue 'installed-vs-shipped'
8195786 minicoredumper: Update to latest
f245613 iscsi-initiator-utils: Update to latest
ce57958 thunar: fix QA issue 'installed-vs-shipped'
029ad49 xfce4: package libtool files if they are installed
4846b3d syslog-ng: repackage json related conf files
a2f02d1 tiptop: Add missing deps on flex and bison
6457b3d syslog-ng: fix syslog-ng startup problem with systemd
639af7f gd: Replace strncpy with memccpy to fix -Wstringop-truncation.
c3722cc opensaf:Modified PACKAGECONFIG to fix the following error:
a5ea75f engine-pkcs11: has been merged to libp11, so deleted.
28fab4c python-pytest: Fix conflict error as following:
f097a2d mozjs: Update Double-Conversion inside mozjs
b707fa7 README: fix links to repos and improve formatting
1bcd15e devmem2: ensure word is 32-bit, add support for 64-bit long
a7c45eb tiptop: Fix parallel build issues
951544d kodi: Upgrade to upcoming kodi v18 'Leia'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
1ac92b6 qtbase: Add packageconfigs for renameat2 and getentropy use
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
1cd38d7 Merge pull request #127 from rakuco/m67-87
not included in master yet:
~/oe/world/oe-build

