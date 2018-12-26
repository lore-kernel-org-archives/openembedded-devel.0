Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 445256B005
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 07:19:04 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id y16so8948351qki.7
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 23:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MM6/rpivKTcV2uJ9UaaY148nS8SoaQSiRVayQyDufVk=;
	b=vLuk9I0AuzKg2FFyBzcS17elKck4OUoVL4svL1YV5BZJmzCBr/XhY/t3qWuj6KMDGn
	jdSdHbuqKqORptfQxJoXlEqrY0ISCOhOIL4vdk+QnCVdDy76xcXpFM81C7FWwedqtj2U
	oi1236l44zqy3cITTc3X6z4zKQ8bWXzsjy+AvWwnucXXQvY9jjWxGnWvF2Ge3FTGHSCL
	6QloWAv0saG15mDZH+i05R0Y1bqwYgEufInEjIHzvo1XHOsO64IcZmhs0EieiEv90vAy
	W3VRAcneVblaOADkMtIiqr989ZUEJmttIKmwHES+svTGPDzFFNfe9VRyivTdn0D0cL1h
	9x2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MM6/rpivKTcV2uJ9UaaY148nS8SoaQSiRVayQyDufVk=;
	b=O3ioYYVzfCJNkyFYrSRZ2ZQEP3WlR5XbvTytkUX9jP5HgISVw0A4gKz3TcLmal3v+z
	piZpBhKMzJYJ8RI6Fl0RefrAObXITOMBmO1T1M8vQAxaU09T456bjZr7aEI9y6KHrd2Y
	hcNxRsX/HxOyqDcDk8nqMTAEVWFnZqPD2We/U6f1XQedSs96gyeEJWacOknb6YAXomfa
	Ysd52NUxAJgt7t/flkCKhu0fxih06sfYcDB8dp4b/ENsnsUOm2sKcMObXz9hXoRDE1Js
	10r9JSuPaxU3pcCDU/nhhGPT5aBrBG3ZB+rZ7GF+iDYi8GaMuy+5POx+olUncj2lmWxP
	VVIQ==
X-Gm-Message-State: AJcUukcruXxhENzV1NAZSON1j2SVAQIixOjWZBuwE3x89sxigvLQHQS/
	qii7VscX/fxvOiZ5yh++CVUGuLJNtLiYNyWrxZuv9k+4994=
X-Google-Smtp-Source: ALg8bN61fXHqdWoeMFBhqWf8M4OJyVRV5OFCgW5mkM4/l6Z2QKwuQiLO3DF8amylbOq3qRM785rJ8FwVqhEV6ENJO8g=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr17379436qkm.102.1545808744271; 
	Tue, 25 Dec 2018 23:19:04 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Dec 2018 23:18:38 -0800
Message-ID: <CAMKF1spchmVtYRoGqoiu-UWupQYapDbsp9+-5qn+C3NTqvAsPA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-12-24
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
X-List-Received-Date: Wed, 26 Dec 2018 07:19:04 -0000
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
||2018-12-24 ||9 ||6 ||8 ||6 ||33 ||0 ||0 ||1 ||3 ||0 ||32 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-12-24 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20181225_221132.log

=== common (5) ===
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== common-x86 (0) ===

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (0) ===

=== qemux86 (3) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/cargo/cargo_0.31.0.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (29) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20181224_111538.log/
||
|-
|| qemuarm64 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20181224_205316.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20181224_111543.log/
||
|-
|| qemux86_64 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20181224_193909.log/
||
|}
./jenkins-job.sh: line 534: cd: too many arguments

=== PNBLACKLISTs (0) ===

=== QA issues (36) ===
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
||32 ||version-going-backwards
|-
||3 ||build-deps
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (33) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20181225_180454.log/
    * ERROR: 33 issues were found in these recipes: 96boards-tools
cargo-native gedit gvfs libblockdev ndctl oprofile
packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
packagegroup-self-hosted phoronix-test-suite phpmyadmin python3-blivet
rust-native thunar udisks2 umip xscreensaver

    * ERROR: 7 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 7 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 10 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 2 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 6 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: gedit different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: gvfs different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: umip different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: 7 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemux86.do_configure.sigdata.log
    * ERROR: gedit different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: gvfs different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: umip different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 7 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: gedit different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: gvfs different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: python3-blivet different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: thunar different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: umip different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: xscreensaver different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 10 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: cargo-native different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: cargo-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: rust-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different
signature for task do_package_write_ipk.sigdata between qemux86copy
and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for
task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phoronix-test-suite different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 6 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545793494/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 33 issues were found in these recipes: 96boards-tools
cargo-native gedit gvfs libblockdev ndctl oprofile
packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
packagegroup-self-hosted phoronix-test-suite phpmyadmin python3-blivet
rust-native thunar udisks2 umip xscreensaver


PNBLACKLISTs:
./jenkins-job.sh: line 534: cd: too many arguments
openembedded-core:
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
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv5e-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
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


count: 32 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.75 to 0:1.0-r8.74)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.75 to 0:1.0-r8.74)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.75 to 0:1.0-r8.74)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.75 to 0:1.0-r8.74)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.75 to 0:1.0-r3.74)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.75 to 0:1.0-r3.74)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.75 to 0:1.0-r3.74)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.75 to 0:1.0-r3.74) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.75 to 0:1.0-r13.74) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.75 to 0:1.0-r13.74) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.75 to 0:1.0-r13.74)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.75 to 0:1.0-r13.74) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.75 to 0:1.0-r13.74) [version-going-backwards]


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
5eaf9e7b utils: Add aarch64 support to ioprio_set
not included in master yet:
f02114cb server/process: Ensure socket has a timeout set

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
95659bed3f populate_sdk_ext.bbclass: Include site.conf in parsing for
contents for local.conf
not included in master yet:
0c9db0ae7d python/python3: use cc_basename to replace CC for checking compiler
bb3eb6bc41 python-native: fix one do_populate_sysroot warning
08a205f872 netbase: add entry to /etc/hosts according to /etc/hostname
b81c8650d0 sstate: add support for caching shared workdir tasks
702be42dc9 glibc: Remove site_config and glibc-initial
fc230822d8 gcc: Drop gcc-cross-initial and use gcc-cross instead
8652df3a0d gcc: Drop the -initial versions of the compiler
0c2f6dfa2f recipes: Drop virtual/libc-for-gcc
c64531600d newlib: Move away from gcc-initial dependency
0d5fb4428f libssp: Remove dependency on gcc-initial
7dd8829d3e musl: Move away from gcc-initial dependency
9abdb4d6ca tcmode-default: Drop pinnings for gcc-initial based recipes
e02724e8f8 base.bbclass, classextend.py: Drop catering to gcc-initial
7756cb7d17 oeqa/concurrencytest: fix for locating meta-selftest
f4c68c39e7 crosssdk/cross-canadian: Set LIBCOVERRIDE correctly
6fc9bb5698 glibc: Enable --with-default-link
d4cb282bc6 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
6efe313b46 glibc: Upgrade towards 2.29 release
dac5dc5067 grub2: Fix passing null to printf formats
bb36d9dc8c gnupg: Upgrade to 2.2.12 release
81059437a5 gnupg: Do not apply -Woverride-init guard for gcc >= 9
6fa05e5ace nfs-utils: Disable format-overflow as Werror
8fab7b23ef musl: Update to latest master
a5641cac42 libxcrypt: Upgrade to 4.4.2
c90ec03d07 gdb: Backport a fix to build with gcc9
1adae92573 valgrind: Fix x86_64 build failure with gcc9
38e9e09104 ffmpeg: Backport patch to fix build with gcc9
4e1fa57743 binutils: Upgrade to latest on 2.31 release branch
5cce276d4a binutils: Upgrade to upcoming 2.32 release

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e052ea1b7 rocksdb: Upgrade to 5.17.2
not included in master yet:
6f98c3f30 sharutils 4.15.2: BBCLASSEXTEND to native and nativesdk
47d5d2897 kexecboot: update to latest master (7409a1e0aaea)
547ba317d spirv-shader-generator: Initial recipe for SPIRV-Cross
a96e6d718 openjpeg: fix build for multilib
d8730f432 libvpx: bump to 1.7.0
640002ded modemmanager: Fix build with gcc9
d596859cd breakpad: Update to latest
79ab090e2 ltrace: Fix a NULL string use
2552c8e91 opensaf: Upgrade to 5.18.09
56fe916ab libgpiod: Rrecommend python3 only for PN-python package
e0d9dd2ac srecord: GPL-3.0 and LGPL-3.0 is correct license
390498950 ttf-droid: Delete from staging install area instead of sources
3d33a2ecd lio-utils: Switch SRC_URI to use datera mirror on github
bf5cc7e1f breakpad: Fix build with gcc9 on x86
55f2541bf miniupnpd: Fix cross compile on OE
5f063ad3b open-vm-tools: Upgrade to 10.3.5
de4926446 tvheadend: Add dependency on dvb-apps
e1db44b73 mozjs: Remove -Werror=format from CXXFLAGS
b67fff759 python-msgpack: Upgrade to 0.6.0
7227733cb python-grpcio: Upgrade to 1.17.1
3b59515c5 python-pyflame: Upgrade to 1.6.7
22ddd2cd3 redis: Update to 4.0.12
91e539772 android-tools: Disable for powerpc/powerpc64
24d17a8d4 wifi-test-suite: Initial recipe for wifi test suite.

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
201fcf2 qt5-plugin-generic-vboxtouch: fix segfault
not included in master yet:
c6be23d qt5: upgrade to latest revision in 5.12
c8d5ef5 qt5: upgrade to latest revision in 5.12
6531fa7 qtbase: use v5.12.0 as base
299a326 qtbase: update xinput PACKAGECONFIG
57aab31 qtwayland: update PACKAGECONFIG options
b7b0a78 qtdeclarative: remove qtxmlpatterns PACKAGECONFIG
725fc1f qtxmlpatterns: add qtdeclarative PACKAGECONFIG
2be2731 libqofono: add dependency on qtxmlpatterns
f1a5e8a qtwebengine: include sources in the debug package, add x11 PACKAGECONFIG
8c7797b qtbase: add env variable for host bin suffix
d45b966 qtwebengine: update chromium musl patchset
77edae5 qtconnectivity: drop patch resolved upstream
44f4fc3 qt5everywheredemo: add dependency on qtxmlpatterns
bd9d830 qt3d-runtime: drop patch resolved upstream
5443af9 qtwayland: revert one patch from 5.12 branch to make it
compatible with 5.12.0 qtbase
1b755b2 qttranslations, packagegroup-qt5-toolchain-target: drop qmlviewer
7cc177d qtwebkit-examples: drop recipe
f69fc40 qtwebengine: Fix build with musl/gcc9
c67abd6 qtbase: Fix build with gcc 4.8
51e0780 qtbase: replace the fix for gcc-4.8 with the one from upstream

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
a01bbed chromium-x11: Update to 71.0.3578.98.
not included in master yet:
8410145 firefox: Fix cmsghdr errors with musl

