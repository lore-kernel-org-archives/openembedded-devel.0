Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7F6747FF
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 05:35:11 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id n6-v6so683317qtl.4
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=y1avOzllE2hvImPUBVe5UMbkEJgLtQqjgHlfUmu0Ydo=;
	b=kzdF3x+zfDFl2G2qkXFMpjC6wbH0pavdBh82rTLmu1c4ugWumZnbXY8/f1sOkNd3BM
	9ihsNCwOFAyZMsTO20epfV8NueOGlC6RYlRHxlJy3jQx4d+FweDg4WTFH7f64jD4O2Fz
	wXNvLGpbMdL80fJ2IqBdUz0/KTGZ0tSzvEdRz/paRL/NUscOjbsLpe/r6hWkaGe8OAH9
	tLJt2LCaK9K2Tdc+NIh+GYF5wFPWfQ3lMA4qxmKLa1wTR4lDMWfuLDB9vPxUorG/tejY
	xYflp3rk/J5u+dMnYnXg/nvo1kNrlKpMznvDIDx9vtwzBMW0fgGw7cw0+odCgOTNss8G
	qU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=y1avOzllE2hvImPUBVe5UMbkEJgLtQqjgHlfUmu0Ydo=;
	b=tszPCYijXMYucni4XSpUwQVcGTNo4+NCnfM50Njnz+kKUsf96iTX9SlH9G2tUTm/SA
	KVuEiJb75I2y+QZDheX6w5tFY1/FTOKAl6iQjusrJWoPiXBX3HCW0YM5yamSHqK1XbEO
	dh2h8ol/sHaqiRj5aLGgT87zeq5ivUe04OJwBlA3MQCi7yhOxDxh6oNv9wqcCK+N3xjD
	q7yxc1C2DebCBnee/uecXhn9886tLYrjwl1PU/PfSHshCfqTmWO2n15tpIINPPEG8YMj
	zn/sftAgkiSvlPoUSLxQ4dsiydYveYJIc6La5KDgT8H8TAfmWiNkzuBS3G3OAga71ynq
	4iwQ==
X-Gm-Message-State: APzg51B0Tt6UxZkWwIeQtQFApYuBpOn29XylQD/RW1ruFgSVW7hspIbP
	ZERi3Vayrp0qHy0PXOhMNAuWX1BpeU+a8g4uwCXUvphm
X-Google-Smtp-Source: ANB0VdaCRIMzDiAKlxb1SAp1uxiim5b9nqiblyYCDVo6uMqPm6ax8UyVaWtr+sj4Nql11FhttvhflvNt+hXeT9mP9w8=
X-Received: by 2002:a0c:e205:: with SMTP id q5-v6mr143528qvl.224.1536730511800;
	Tue, 11 Sep 2018 22:35:11 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2018 22:34:45 -0700
Message-ID: <CAMKF1srNXih5E5Jfxzqi1BhUpduwLYYPBgjVKcix60c-JyL-tA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-09-11
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
X-List-Received-Date: Wed, 12 Sep 2018 05:35:11 -0000
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
||2018-09-11 ||6 ||3 ||14 ||3 ||0 ||0 ||0 ||6 ||0 ||0 ||32 ||0 ||0 ||1
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-09-11 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180911_192508.log

=== common (2) ===
    * sources/meta-96boards/recipes-graphics/wayland/weston_4.%.bbappend
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit-examples_git.bb:do_compile

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=== qemuarm64 (0) ===

=== qemux86 (10) ===
    * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb:do_compile
    * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.7.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (0) ===

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180910_181048.log/
||
|-
|| qemuarm64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180911_005717.log/
||
|-
|| qemux86 || 14 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180910_181047.log/
||
|-
|| qemux86_64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180911_030106.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (39) ===
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
||1 ||unknown-configure-option
|-
||32 ||version-going-backwards
|-
||6 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180911_161957.log/


    * ERROR: Nothing PROVIDES 'ndctl' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'yasm-native' (but
/home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb
DEPENDS on or otherwise requires it). Close matches:
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'yasm-native' (but
/home/jenkins/oe/world/oe-build/sources/meta-browser/recipes-browser/firefox/firefox_52.9.0esr.bb
DEPENDS on or otherwise requires it). Close matches:
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


count: 6 issue: textrel
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libglapi/usr/lib/libglapi.so.0.0.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles1-mesa/usr/lib/libGLESv1_CM.so.1.1.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles2-mesa/usr/lib/libGLESv2.so.2.0.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgl-mesa/usr/lib/libGL.so.1.2.0'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 32 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.9 to 0:1.0-r8.8)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.9 to 0:1.0-r8.8)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.9 to 0:1.0-r8.8)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.9 to 0:1.0-r8.8)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.9 to 0:1.0-r3.8)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.9 to 0:1.0-r3.8)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.9 to 0:1.0-r3.8)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.9 to 0:1.0-r3.8) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.9 to 0:1.0-r13.8) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.9 to 0:1.0-r13.8) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.9 to 0:1.0-r13.8)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.9 to 0:1.0-r13.8) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.9 to 0:1.0-r13.8) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 0 issue: installed-vs-shipped


count: 1 issue: unknown-configure-option
gstd-1.0: gstd: configure was passed unrecognised options:
--disable-gtk-doc [unknown-configure-option]


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
464d033 runqueue: Ensure setscene tasks that aren't covered get built
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
882d31b mesa: disable LLVM on x86
not included in master yet:
075b7f6 harfbuzz: remove stale pkg.m4
f0b865a lrzsz: CVE-2018-10195
d7dc9e2 pkgconf: don't use alternatives
196c7e4 yasm: remove
362e6ad gdb: Add bison-native dependency
6c40e1a libdrm:2.4.93 -> 2.4.94
ad8ef2b gdb: PACKAGECONFIG for tui
c81dfe9 xserver-xorg: config: fix NULL value detection for ID_INPUT being unset
a849160 wic: squashfs does support partition uuid.
85d0864 systemd: set split-bin to true by default
1f37a73 sysprof: Fix build with clang
547e52c gst-validate: Fix build on musl
1a88f4e qemu: patch for CVE-2018-15746
9eeff27 libx11: Upgrade 1.6.5 ->1.6.6
0875848 ghostscript: fix CVE-2018-15908 & CVE-2018-15909 &
CVE-2018-15910 & CVE-2018-15911
b89ad1c bind: patch for CVE-2018-5740
4625757 attr: use u-a for setfattr
2866dba libgloss_3.0.0.bb: Fix up mv pattern to include libnosys
d6287ea tclibc: For newlib and baremetal disable some security features
8e09e03 tclibc-baremetal.inc: Remove BASEDEPENDS on compilerlibs
bf70172 serf: Document and add upstream status field for 0003-gen_def.patch
afa7f7c wayland: upgrade to 1.16.0
27faa6b weston: upgrade to 5.0.0

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
131eb1f split net-snmp-libs into smaller packages
not included in master yet:
99c7136 libpwquality: clean up python3-libpwquality
b336c4a cpprest: bump version to 2.10.6, drop clang 747 patch: upstream
8cb0272 xmlstarlet: Disable PARALLEL_MAKE (again)
90467a8 python-pyflame: skip for aarch64 as well
c2fd2b4 pmdk: Initial commit of the PMDK SDK
317b341 gstd: Upgrade to latest and fix unrecognised options to configure

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
9ffdd55 qtscript: Update the custom patch from mainline
not included in master yet:
16eb842 qtscript: Fix build on musl
0ebee59 qt3d-runtime: Fix compile errors as seen with mips/musl
74c0945 qtwebkit: Fix build with musl
3065292 qtwebkit: Fix conflicts with -I and -isystem
7e6a42e qt5-creator: Fix building botan for all non-x86 arches
099ef3e qt5-creator: Strip out redundant RPATH

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
f2e6235 chromium-x11: Enable builds with clang
not included in master yet:
ff59505 chromium: Refactor clang patch to fix chromium-ozone-wayland

