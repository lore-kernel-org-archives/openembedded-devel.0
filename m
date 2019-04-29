Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 627457DC54
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:26:49 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g141so2090148qke.5
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=EHVYCdlFzWiU844f7iSUq8NnOqrfsVtyO6wEiWz240A=;
	b=SFnRkBGir8ueSFCwJrQSr6OLpmUrEi9P0Pe/ru9fMDYfvlH+ojpA6wekEzjd3690ZI
	3KWP2pC5P0FfwODV7mq5umGyrkKkof3Uu5vB670Jg1XzInqXRvoBSxjHAqoPLexKVEBb
	EBRQeyjysxKh8i/tOuWWX+W08K/SbDY+0DuY5IhSeJk/o5osiIZOWcV0Q5ZhDAOoW8aE
	5mM0o3Nb15MuuugkZC/KHsDZNaKLwPWEWet6hsjnUgtnhGWkvwD+79AOT/1dLq5WO8R7
	KIsZyAKwgs3AQMLEBlv4HzQ8nDXpWCgwt0s7ohtqHMkqw1z0ep+3bQ9evrj1JIehsp7e
	fTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EHVYCdlFzWiU844f7iSUq8NnOqrfsVtyO6wEiWz240A=;
	b=cv8Xd0TU3f9h8qy/Khqg7jW/fxC8VQBYFMmCy2EquXGbW337i0NvogjALN4OrWmNVb
	EiEyM/UDWjq1uzZSTC8JbpsQYw2Q6phaoQ2QJs5fSQDMnh/2Ft6LnKHCAenk+VBN2R3Q
	v0Seg88sl9PVX13AsOnD2YS2QeSbAnDh6CdGZ+QusjmomcVMlqGXvUJhwaWJTPujPJH8
	Eo85hTWft4PbaN9GYfb0jfd6sLZtU1lO9vOz2tQW/f+YwG6twITo+p4OXLIdWsrH+YE3
	v3qpmI1MlpCPBYzHFi2XX8TH791RHKtM3g7FzgoJ+opsqOfVQ5YLB14JjFJNza46uQ08
	/bbw==
X-Gm-Message-State: APjAAAVpIq5Ktmd0KPV/ZiUDUmsmaHf5AofVrOcb58Vm9dkfcTvtmI+H
	JoMY0QlSoayK+26hOv3GPgVbnotjWjhzsB8WbmEW3Rs+n7c=
X-Google-Smtp-Source: APXvYqweI+rHvyVzO1CqQH0C6kXnd6C0ExpFzZCbpCMOgXNrpzm5Fvh8e1dFZFOGS/AurVPV2VUMWuAQOMmCRV/NxyE=
X-Received: by 2002:a37:a849:: with SMTP id r70mr39323409qke.315.1556558809615;
	Mon, 29 Apr 2019 10:26:49 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 10:26:23 -0700
Message-ID: <CAMKF1spVRws2HV7W9w-mvMPwEVYaTqAdt=OGv_DnuLYiMRiBoQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE World, 2019-04-28
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
X-List-Received-Date: Mon, 29 Apr 2019 17:26:49 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-04-28 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190429_101843.log

=== common (1) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (10) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.103.bb:do_compile
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/cpupower/cpupower.bb:do_package
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:do_configure
    * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb:do_compile

=== qemuarm64 (5) ===
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (5) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.103.bb:do_patch
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_73.0.3683.103.bb:do_patch
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.33.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-core/systemd/systemd_242.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (45) ===
{| class=wikitable
|-
|| qemuarm || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190428_161133.log/
||
|-
|| qemuarm64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190428_200409.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190428_111238.log/
||
|-
|| qemux86_64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190428_132308.log/
||
|}

=== PNBLACKLISTs (2) ===

=== QA issues (62) ===
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
||1 ||installed-vs-shipped
|-
||1 ||textrel
|-
||1 ||unknown-configure-option
|-
||3 ||build-deps
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190428_213732.log/


    * ERROR: Nothing RPROVIDES 'qca-tools' (but
/home/jenkins/oe/world/yoe/sources/meta-freescale/recipes-fsl/packagegroups/packagegroup-fsl-qca6174.bb,
/home/jenkins/oe/world/yoe/sources/meta-freescale/recipes-fsl/packagegroups/packagegroup-fsl-qca9377.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'qca-tools' (but
/home/jenkins/oe/world/yoe/sources/meta-freescale/recipes-fsl/packagegroups/packagegroup-fsl-qca6174.bb,
/home/jenkins/oe/world/yoe/sources/meta-freescale/recipes-fsl/packagegroups/packagegroup-fsl-qca9377.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
= " error: invalid use of incomplete type 'RCF::AsioIoService {aka
class boost::asio::io_service}; among others?"
sources/meta-qcom:
sources/meta-qt5:
sources/meta-raspberrypi:
sources/meta-riscv:
sources/meta-rust:
sources/meta-ti:
sources/meta-variscite-fslc:
sources/meta-yoe:
sources/openembedded-core:
meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
"Don't build this"
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
PNBLACKLIST[smartrefrigerator] = "Needs porting to QT > 5.6"
PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
PNBLACKLIST[homeautomation] = "Needs porting to QT > 5.6"
PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
PNBLACKLIST[applicationlauncher] = "Needs porting to QT > 5.6"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 1 issue: textrel
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
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


count: 56 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.113 to 0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.121 to 0:1.1-r2.120) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.113 to
0:1.1-r2.112) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.121 to
0:1.1-r2.120) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.130 to
0:1.0-r0.129) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.130 to 0:1.0-r0.129)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.180 to 0:1.0-r8.179)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.180 to 0:1.0-r8.179)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.180 to 0:1.0-r8.179)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.180 to 0:1.0-r8.179)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.180 to 0:1.0-r8.179)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.180 to 0:1.0-r3.179)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.180 to 0:1.0-r3.179)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.180 to 0:1.0-r3.179)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.180 to 0:1.0-r3.179)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.180 to 0:1.0-r3.179) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.180 to 0:1.0-r13.179) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.180 to 0:1.0-r13.179) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.180 to 0:1.0-r13.179)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.180 to 0:1.0-r13.179) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.180 to 0:1.0-r13.179) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.180 to 0:1.0-r13.179) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 1 issue: installed-vs-shipped
cpupower: 3 installed and not shipped files. [installed-vs-shipped]


count: 1 issue: unknown-configure-option
gnome-desktop3-3.32.0: gnome-desktop3: configure was passed
unrecognised options: docs [unknown-configure-option]


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
07b6054b bb: siggen: Print more info when basehash are mis-matched
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
09276dc76a utils/multiprocess_launch: Improve failing subprocess output
not included in master yet:
bd7f7226e3 dbus: fix ptest failure
134f29c1a1 resulttool: add ltp test support
40659d202c logparser: Add decoding ltp logs
b46eb6e4c3 ltp: add runtime test
10480abeb3 resulttool: add LTP compliance section
4aeeba1d5c logparser: Add LTP compliance section
b719ec69cf ltp_compliance: add new runtime
eb4ba23cf8 manual compliance: remove bits done at runtime
153dfba000 gettext: add ptest support
4021e86a31 FIXME: test ltp
4334cd5c11 libsoup: Upgrade from 2.64.2 to 2.66.1
e60584cc87 Adding back wrapper and using OEPYTHON3HOME variable for python3
abfa672b25 bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
656f39bc58 linux-yocto-rt/4.19: fix merge conflict in lru_drain
f4066c5943 linux-yocto/5.0: port RAID configuration tweaks from master
0cf0ce38c0 linux-yocto/5.0: integrate TCP timeout / hang fix
1f28a0795a python3: Drop ptest hack
183ab4f06e recipes: Add runit and related recipes
f527331839 oeqa: Recognise svlogd as another logger
98e120346d gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
d42cce95a sip: Update to 4.19.16.
not included in master yet:
00c294329 python-mako: upgrade 1.0.7 -> 1.0.9
5cfab0866 python-msgpack: upgrade 0.6.0 -> 0.6.1
e8a23eb77 python-paste: upgrade 3.0.6 -> 3.0.8
77e5da1f2 python-psutil: upgrade 5.4.6 -> 5.6.1
ab8911fd0 drbd: fix compile errors
5494c6a5c drbd-utils: fix file conflict with base-files
bd58350ad python-py: upgrade 1.6.0 -> 1.8.0
02d6caa20 python-pymongo: upgrade 3.7.1 -> 3.7.2
a48732d3a openhpi: fix failure of ptest case ohpi_035
b4b8c0699 python-pyopenssl: upgrade 18.0.0 -> 19.0.0
fe75adf3c python-pytz: upgrade 2018.5 -> 2019.1
13615d959 python-stevedore: upgrade 1.29.0 -> 1.30.1
855be6408 xfconf: fix 'Failed to get connection to xfconfd' during do_rootfs
d9b57a724 fltk: upgrade 1.3.4-2 -> 1.3.5
f066c4485 samba: install bundled libs into seperate packages
6a3e1fa0d samba: rework localstatedir package split
e85ac4aef python-pbr: upgrade 4.2.0 -> 5.1.3
29e17f9c0 squid: Link with libatomic on mips/ppc
7fc432d0f openbox: Add python-shell as a runtime dependency
90558c531 apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS
e7f13b68f apache2: Correct packaging of build and doc related files
b92735f69 python-cython: upgrade 0.28.5 -> 0.29.6
0c6230de5 python-editor: upgrade 1.0.3 -> 1.0.4
15dffd322 python-jinja2: upgrade 2.10 -> 2.10.1
80cdc95a3 python-lxml: upgrade 4.3.1 -> 4.3.3
980435a7d nghttp2: update to 1.38
b655a3ea6 fluidsynth: upgrade 2.0.4 -> 2.0.5
e8ffbaddb xl2tpd: update to 1.3.14
3539fb4e8 indent: Upgrade to 2.2.12
fcc90826d nano: update to 4.1
649cec1ed hostapd: Upgrade to 2.8
df0d8394a hwdata: Upgrade to 0.322
1f1796a13 python-alembic: upgrade 1.0.0 -> 1.0.9
7ccc3bd1d python-cffi: upgrade 1.12.2 -> 1.12.3
c6efe8bd5 python-hyperlink: upgrade 18.0.0 -> 19.0.0
4a57a1dd1 python-twisted: upgrade 18.4.0 -> 19.2.0
720569b01 python-zopeinterface: upgrade 4.5.0 -> 4.6.0
f87865645 python-decorator: upgrade 4.3.0 -> 4.4.0
dcbd4f998 ntp: upgrade 4.2.8p12 -> 4.2.8p13
56334e874 Revert "ell: remove recipe"
2ee9870de ledmon: Mark as incompatible on musl instead of adding bogus patch
6e0c2fe90 ne10: set NE10_TARGET_ARCH with an override instead of
anonymous python
f8c35bf72 networkmanager-openvpn: update to 1.8.10
e921d06c8 wpan-tools: update to 0.9
ddb60b7b9 uftp: update to 4.9.9
6d570415b vblade: add UPSTREAM_CHECK_URI
cbc9c80bc traceroute: add UPSTREAM_CHECK_URI
0d3d62129 nuttcp: update to 8.2.2
5874c91b7 nfacct: add UPSTREAM_CHECK_URI
0689e8ffb nftables: add UPSTREAM_CHECK_URI
14aa9c795 apache2: add back patch for set perlbin
7d4e662a1 libopus: use armv7a, aarch64 overrides when adding ne10 dependency
f0b50982f rrdtool: Upgrade to 1.7.1
f81e0dbaa libdev-checklib-perl: add new recipe
b5fc98905 v4l-utils: upgrade 1.16.0 -> 1.16.5
30f882806 cpprest: update to 2.10.13, drop 32bit build fix upstream
022be2565 libnetfilter-queue: update to 1.0.3
1f7a67a3d libdbd-mysql-perl: Upgrade to 4.050
bbf3fd1a8 sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
8586caf qt5: update SRCREVs after v5.12.3 tags were downmerged to 5.12 branch
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
164e929 chromium-ozone-wayland: Fix regression with VizDisplayCompositor
not included in master yet:
~/oe/world/yoe

