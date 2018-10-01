Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 74C0775542
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 22:15:26 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id c25-v6so15923130qtp.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Gqd+gDtINzwgBeG/xPilhsvU5bIlhjwgW/ASynRZX3I=;
	b=REh6ld11imxRwQRqTKSUntBaAmf2fqxb/VJWr6ihvGv193vKcoqJmQFtleP7eDXCRv
	uiiD8yCESxZvJ48agPg+peXIfC2zAj4bkS9bKVS/sTCrXuM46p5rdtbaEzsTepD9c/+U
	NxEWZlEpWNbPnz7HAObHB03ZHVWnVxoS1QBr0qf4BoK8LlZ+R5hIon5AXrG6DFZSZtru
	RoSLwIJk3/lMgVMtuTnDAdxOH5fyoXzQLGakFOwszPb1joXRSTK/6wo5QZojVVByMJcA
	TuqGUVsGl/AlP4cKAXwcwQqs1+f66deHskCZAHnt09FZ88SeNzj7V2Zn3Pn/B7uxOJPw
	Wqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Gqd+gDtINzwgBeG/xPilhsvU5bIlhjwgW/ASynRZX3I=;
	b=qHlxVMZnRzHPfCRsFI2G9Hqon6p7DJD0PElRhpornI4FJK+LgJa5IN6jkXw61P1oOc
	tUdpIUZtuiYPZm8jMN5IlytWZy/ybLN4dJMWgb33v+NLYDsqHe9MGCxJO7yJSrvdjaIu
	qvXvMGFNlhep8IMoZPC0P74CSmul+hyRUTb67QRtdcZXzMrdbo6TZLuMnh8QCihEqTmj
	N3bBcLlW1tMZjFd0CcJU0hR/GoE6VtKQGFAI4sZvYAAlOqzdfBMiJ7uYDirQZWbt5SYc
	sjbavz4KO5fVw5Rn248t9FPcTPkBbJf0Moe2WZylTxJJj1eWNDAwz36GpoXxergMZ9M4
	iLjQ==
X-Gm-Message-State: ABuFfogvyTCdldp+fQIgAG47uwote9WN+DKtzlxKwLXiJTWc7HJIGl+y
	BABAHtZaJVPR7+RipuqlP2JrD4yCpZYh//4xM5Z3M/9G
X-Google-Smtp-Source: ACcGV61VwjrL3kBT32xn3QFzMpWpzLmHgjfgPYFBdOCPCTWbtR4dH8bNDky3JO+n5wFyrTBIn22bBPCMPSPfZg9Evd8=
X-Received: by 2002:ac8:7584:: with SMTP id
	s4-v6mr10655647qtq.161.1538432126789; 
	Mon, 01 Oct 2018 15:15:26 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Oct 2018 15:15:00 -0700
Message-ID: <CAMKF1sqEnYgiDpLF0yATTc0QDvF=uHXAnKnf9YjD9-tHhOaCJQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-09-30
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
X-List-Received-Date: Mon, 01 Oct 2018 22:15:26 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2018-09-30 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181001_065432.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_package_qa
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=== qemuarm64 (1) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_71.0.3545.0.r589108.igalia.1.bb:do_compile

=== qemux86 (5) ===
    * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (1) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_52.9.0esr.bb:do_configure

=== Number of failed tasks (11) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180929_225721.log/
||
|-
|| qemuarm64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180930_074205.log/
||
|-
|| qemux86 || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180929_225729.log/
||
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180930_073358.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (38) ===
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
||32 ||version-going-backwards
|-
||6 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181001_013557.log/


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


count: 6 issue: textrel
mesa-18.1.9: ELF binary
'/tmp/work/i586-yoe-linux-musl/mesa/2_18.1.9-r0/packages-split/libglapi/usr/lib/libglapi.so.0.0.0'
has relocations in .text [textrel]
mesa-18.1.9: ELF binary
'/tmp/work/i586-yoe-linux-musl/mesa/2_18.1.9-r0/packages-split/libgles1-mesa/usr/lib/libGLESv1_CM.so.1.1.0'
has relocations in .text [textrel]
mesa-18.1.9: ELF binary
'/tmp/work/i586-yoe-linux-musl/mesa/2_18.1.9-r0/packages-split/libgles2-mesa/usr/lib/libGLESv2.so.2.0.0'
has relocations in .text [textrel]
mesa-18.1.9: ELF binary
'/tmp/work/i586-yoe-linux-musl/mesa/2_18.1.9-r0/packages-split/libgl-mesa/usr/lib/libGL.so.1.2.0'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-yoe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-yoe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 32 issue: version-going-backwards
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
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.5 to 0:1.0-r13.4) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.5 to 0:1.0-r13.4) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.5 to 0:1.0-r13.4)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.5 to 0:1.0-r13.4) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.5 to 0:1.0-r13.4) [version-going-backwards]


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
9c6b39a fetch2/gitsm.py: Rework the git submodule fetcher
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
4dad156 glibc-package.inc: correct intention for deleting /usr/lib as needed
not included in master yet:
5360f7d sysklogd: Re-enable alternatives for syslogd.8 man page
d3af6f2 python3: move sqlite files into python-sqlite
7686c3f python: mark the tests modules as special when updating the manifest
0f1d34d python: move sqlite module into python-sqlite
be018ce groff: fix multilib install file conflicts
5bf2f84 bind: fix multilib install file conflicts
db97661 glibc: refresh patch to also fix qemuppc
fe9b45e libepoxy: fix PACKAGECONFIG to get rid of required opengl distro feature
474cfbc webkitgtk: fix to build without opengl
571b054 multilib.bbclass: fix do_package_qa_multilib error
183cc9c mime.bbclass: fix do_package_qa_multilib error of lib32-fltk
5e5820a libsdl2: disable sndio explicitly to avoid inconsistent result
adb3b90 multilib: avoid expanding grub and grub-efi to multilib
0a433e4 archiver: check tasks exist before adding dependencies
51f67fb archiver: generalise task running when in configured mode
d3b1cce go.bbclass: Add -buildmode=pie for non mips arch

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5f23d82 libblockdev: correct PACKAGECONFIG
not included in master yet:
ceeb9c4 mongodb: Consolidate COMPATIBLE_HOST
b769242 tinyproxy: Refresh patches
57d8e2c net-snmp: improve reproducibility
70a0692 botan: Add recipe
08ab868 grpc-native: Fix buld on ubuntu 14.04 with gcc 4.8
a5ebab5 thunar-shares-plugin: add pam to REQUIRED_DISTRO_FEATURES
14a9f80 mpd: fix yocto-check-layer issue with mulitmedia

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
4fb1e60 qt: package all files in ${PN}-examples
not included in master yet:
0cf5966 qt5-creator: upgrade to 4.7.1+
f11e942 qt5-creator: fix build with QMAKE_AR
0bc9d7e layer.conf: Add thud to LAYERSERIES_COMPAT
5689b14 qt5-creator: Pick native tools from native sysroot e.g. lrelease etc.
346b65e qt5-creator: Check before editing translation Makefile

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
5072063 chromium: Remove 0001-memcpy-used-without-including-string.h.patch
not included in master yet:
~/oe/world/yoe

