Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id B8A07600EA
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:06:25 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id s187-v6so9261128vke.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=E57gSJTy6erT5r9pMB5M23Uc+P5AdvaH+1O4X+hXdfg=;
	b=TDtsoM9ji/eM2/NPCLA2uxKdRvoDL//Q6RZXwlgmphHlILiiRo8FwNpbxvw1uZHQnE
	N3s2TOsCMx+M8tDl3z7p9IgBp0BqKRWe4Y8oXRgsNXySQ/RKi1nSP0htTVxOaHgtVd93
	2UNqkFDuHwGydFWlt9yKV+zuS85q0E7bGR+gUIYDmPgBHth8W2a0SKrws7lBTbgLzt1c
	KObs/ae465xj+0XxYpunWqNmwR5Pj3P/zTfNOBw4qgZg1cOXYOr6MfTh3Yb5itJ8Be43
	8AO7QMRieXWl/VP9lBXCE5YcDI4m5sGzN8B+Xp/HPrB0SSgDxkpqNvZQHd1Iz0WLn3eo
	d0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E57gSJTy6erT5r9pMB5M23Uc+P5AdvaH+1O4X+hXdfg=;
	b=CJtTCo0Nk2G/0ZUikeMWRVrlD+025hlU1dgl/FBbkSSb2LPgZaWu/G0jY7eSAE1/Es
	qMV+72UidMgbYdltdm+GBv0wqSNMTImUAn2HqsOHFvwsacb3lEXHpYh9iK2TYDms/CTn
	ECvpV/Ps6YuVVH/ASJno+oGRJqFlEAqIoSI5gwRAOPib40qpNWZNj3UdpSfMKUU7Zt+D
	aJi7VtFKMatfdjye4OyM6Awrm2HhpYB2Y/GQYqiWBONL07X5APeOYtw59pLJ4kCOCzQN
	4sYfjIz6U8IKyxqVhYbDIXLe6lmF+2kEGsFcI+58xu/8nHLd6zY+mARdG+VaSuwhJRPR
	sVpw==
X-Gm-Message-State: APt69E13+aN9ty0Uy6qJ4s7aC3auEiWZELXRDG8ljGIqpdfBXtxmQQrj
	ADY7/rFhO0SO5T6b6AKYp39BcLbOxYM3qeImW3ArPg==
X-Google-Smtp-Source: AAOMgpe8bEr1NXiS2wuRANzwAOOfTwar+BT9ZXbus8XorLQToZuNFD+aWVFFpQkTAB9IEkE7UVmPDX9ioB4JeVx37ZQ=
X-Received: by 2002:a1f:5244:: with SMTP id g65-v6mr12021vkb.28.1529989585880; 
	Mon, 25 Jun 2018 22:06:25 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jun 2018 22:05:59 -0700
Message-ID: <CAMKF1sri0w+y4b6OhN5mJaSb-ASn2z19=_C1M5jhmh8J1myGow@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-06-25
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
X-List-Received-Date: Tue, 26 Jun 2018 05:06:26 -0000
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
||2018-06-25 ||4 ||4 ||19 ||1 ||7 ||0 ||0 ||7 ||2 ||0 ||32 ||0 ||1 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-06-25 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180625_185607.log

=== common (1) ===
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.2.bb:do_compile

=== common-x86 (0) ===

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
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (28) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180625_072529.log/
||
|-
|| qemuarm64 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180625_081841.log/
||
|-
|| qemux86 || 19 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180625_072538.log/
||
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180625_081945.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (40) ===
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
||32 ||version-going-backwards
|-
||7 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (7) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180625_091239.log/
    * ERROR: 7 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 4 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1529953959/signatures.qemux86.do_configure.sigdata.log
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1529953959/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1529953959/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different
signature for task do_package_write_ipk.sigdata between qemux86copy
and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for
task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 4 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1529953959/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 7 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted


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


count: 7 issue: textrel
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
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
has relocations in .text [textrel]


count: 2 issue: build-deps
mbedtls-2.9.0: mbedtls-programs rdepends on hiawatha, but it isn't a
build dependency, missing hiawatha in DEPENDS or PACKAGECONFIG?
[build-deps]
mbedtls-2.9.0: mbedtls rdepends on hiawatha, but it isn't a build
dependency, missing hiawatha in DEPENDS or PACKAGECONFIG? [build-deps]


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
feeds from (0:1.0-r13.7 to 0:1.0-r13.6) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.7 to 0:1.0-r13.6) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.7 to 0:1.0-r13.6)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.7 to 0:1.0-r13.6) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.7 to 0:1.0-r13.6) [version-going-backwards]


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
a7c45eb tiptop: Fix parallel build issues
not included in master yet:
38d1327 pcmciautils: add (from oe-core)
01b0afc gperftools: add the setting of COMPATIBLE_HOST back
1477cf5 upm: Upgrade to latest and fix build with musl
eec73ed libhugetlbfs: Fix build on musl
aef6a9c libdc1394: libglu needs both openGL and X11 but not tvirtual/libgl
7516e84 python-pywbem: update to version 0.11.0 and add a python3 recipe
30226cd kpatch: Upgrade to 0.6.1 release
4a50bab corosync: Upgrade to 2.4.4
16fc3c4 corosync: add corosync.conf.example
6656d58 drbd-utils: 8.9.6 -> 9.4.0
12cc756 python-cryptography: 2.1.4 -> 2.2
7e66808 python-cryptography-vectors: 2.1.4 -> 2.2
835ab5e opensaf: Upgrade to 5.18.04
3ef9acf squid: Fix build with gcc8
dddf4bd corosync: corosync-qnetd.conf is now created under /run during runtime
badb14d civetweb: Fix paths to librt and libm, use -l linker option
872399c net-snmp: Refresh openssl support patch
4517d1c metacity: allow for warnings during compilation
935f031 kodi: Upgrade to upcoming kodi v18 'Leia'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
dd1ce3c README: Rework to start using GitHub for development
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
1cd38d7 Merge pull request #127 from rakuco/m67-87
not included in master yet:
~/oe/world/oe-build

