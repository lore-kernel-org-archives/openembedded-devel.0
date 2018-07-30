Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB0D78D50
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 08:42:49 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id b15-v6so11221274qtp.11
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 01:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Pn8EeTxqK+Dwnf3WYrlI5b+ZSGMYaPeBzP24ZYdnyng=;
	b=G8RWjTmwnN3oCxsqKGNQwCd5RHNTuyEx0nFcaHQJHFN4v5X/2eCHMfOC2gjZZR8aVN
	aKpNgR9c9By1gBOyAJMul7/BuMUDbk3zxO4Cvm1zW4kMYcBZYAqOyzW8iqg8CND+tQcn
	Y865hTBtRylRWYkACbV1pShEM/qDMWdYXT1dSdCpclDxQuxoSyhtm1P9HPoUlQC1smap
	3kYoo9/u/Mmu04ZbehoqPPG++x1PEUX8Sv/yi9vTJTyoiRsLfvOCI8bgWkbxg8Pc4LOj
	qHO25T8uEH2pVUmWpzAsytV97bgHszIjI9mBMjCplvyDkISNHUFWOlAkRLHIUAC3+uwq
	Xf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Pn8EeTxqK+Dwnf3WYrlI5b+ZSGMYaPeBzP24ZYdnyng=;
	b=NyGQdNOXxJwMnOJsPi0oBpgSoG99J3KzZJAesGKI5rTN3KlcxHAASdNfHE44ZRsRj+
	x9tuAyAzYDRHjwuIwzsUNB6floanByc7q4SMwR2EEx6FKPGpI+kbYV7ibsrnDxlxwjzl
	ZloqEAf7z0D/tjjMaL3OEXE4uA9qSB06MuxRig820k5j6bLvvnMhQRVINVKN//k2hTK7
	smdpHxrNgbd9F8sAhXi8tdgLlvZTpx5krXoYLmo+3UmQ7WhS+is8m4pY5ZAojIujY/v7
	hQVnwjt3ej17THE/xNfuxhU6lk01xseKOQHZYbYge79UXUCK3Eoz5HviorQGe7hNicsg
	bH1Q==
X-Gm-Message-State: AOUpUlEz2TiNxnrfqLSMcjRDNJ2JlNpfdfyGs2j9dg9eqxXeRuQiXYOD
	U7mntmMdg0GhGSYhC+ebGnbsC82G2DzAiwhmqcJ2nfUz
X-Google-Smtp-Source: AAOMgpeT0HB18zaJj2V7hS3yVmTWNKXg1K1b7n1zQTP5TY3yWPjSZq1pOKpXsS7wmIoQTig/h4Jo75Yu4HrQAJBkzPA=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr16177344qta.128.1532940169822; 
	Mon, 30 Jul 2018 01:42:49 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 01:42:23 -0700
Message-ID: <CAMKF1sr-FWzDDFR-vtDE2tyD6x8PNRDawg_B39refdBe9SRv1g@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-07-29
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
X-List-Received-Date: Mon, 30 Jul 2018 08:42:49 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.openembedded.org/wiki/Bitbake_World_Status_Thud

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
||2018-07-28 ||9 ||11 ||26 ||7 ||8 ||0 ||0 ||7 ||0 ||0 ||56 ||0 ||1
||1 ||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-07-28 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180729_223730.log

=== common (3) ===
    * sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_18.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb:do_configure

=== common-x86 (0) ===

=== qemuarm (6) ===
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=== qemuarm64 (6) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_68.0.3440.75.bb:do_compile
    * sources/meta-browser/recipes-browser/firefox/firefox_52.8.0esr.bb:do_configure
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit-examples_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa

=== qemux86 (21) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/rdma-core/rdma-core_18.1.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-bsp/efivar/efivar_0.31.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/cmake/cmake_3.11.4.bb:do_configure
    * sources/openembedded-core/meta/recipes-devtools/ruby/ruby_2.5.1.bb:do_configure
    * sources/openembedded-core/meta/recipes-graphics/cairo/cairo_1.14.12.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (53) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180728_120451.log/
||
|-
|| qemuarm64 || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180728_201203.log/
||
|-
|| qemux86 || 26 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180728_120459.log/
||
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180728_195754.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (63) ===
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
||1 ||unknown-configure-option
|-
||56 ||version-going-backwards
|-
||7 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (8) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180729_122723.log/
    * ERROR: 8 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted
phoronix-test-suite

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 5 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1532903243/signatures.qemux86.do_configure.sigdata.log
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1532903243/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1532903243/signatures.qemux86.do_package_write_ipk.sigdata.log
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
    * ERROR: 5 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1532903243/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 8 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted
phoronix-test-suite


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
ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test'
has relocations in .text [textrel]
ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go'
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


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 56 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.29 to 0:1.0-r8.28)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.29 to 0:1.0-r8.28)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.29 to 0:1.0-r8.28)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.29 to 0:1.0-r8.28)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.29 to 0:1.0-r3.28)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.29 to 0:1.0-r3.28)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.29 to 0:1.0-r3.28)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.29 to 0:1.0-r3.28) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.31 to 0:1.0-r13.30) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.31 to 0:1.0-r13.30) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.31 to 0:1.0-r13.30)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.31 to 0:1.0-r13.30) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.31 to 0:1.0-r13.30) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-dbg went
backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-dbg went
backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-dev went
backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-dev went
backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-doc went
backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-doc went
backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-locale went
backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-locale went
backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-staticdev
went backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2-staticdev
went backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2 went
backwards which would break package feeds from (0:0.9.2-r0.6 to
0:0.8.8-r0.0) [version-going-backwards]
python-cmd2-0.8.8: Package version for package python-cmd2 went
backwards which would break package feeds from (0:0.9.2-r0.7 to
0:0.8.8-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-dbg went backwards which would break package feeds from
(0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-dbg went backwards which would break package feeds from
(0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-dev went backwards which would break package feeds from
(0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-dev went backwards which would break package feeds from
(0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-doc went backwards which would break package feeds from
(0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-doc went backwards which would break package feeds from
(0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-locale went backwards which would break package feeds from
(0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-locale went backwards which would break package feeds from
(0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-staticdev went backwards which would break package feeds
from (0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0)
[version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser-staticdev went backwards which would break package feeds
from (0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0)
[version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser went backwards which would break package feeds from
(0:git-r0.14 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]
qtchooser-39+gitAUTOINC+a1b6736e4f: Package version for package
qtchooser went backwards which would break package feeds from
(0:git-r0.16 to 0:39+git0+a1b6736e4f-r0.0) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 1 issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


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
1620dbc server/process: Always place the server logfile in the build directory
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3644492 classes/package: fix variable name in comment
not included in master yet:
f50fefd mesa: Enable gallium-llvm on x86 and x86_64
7f36bee meson: Add risc-v to known architectures
b5772fd musl: Fix dirent struct alignment issue seen on armv5te
7367653 glibc-locale: Fix host-user-contaminated QA errors
e8db9a7 gcc-8: Upgrade to 8.2 release
d553b4a Revert "gnutls: rationalise libunistring arguments"

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
0aff7ab mozjs: add support for mips64-n32
not included in master yet:
d75280b samba: Delete remain of LSB.
5b85349 python-semver: add new recipe
ff33f47 php: actually enable openssl
b865577 vim/vim-tiny: fix multiple .bb files provide xxd
1dcc598 dracut: upgrade 047 -> 048
4d5cc64 aufs-util: upgrade to latest release 20180709
677ac69 xfsprogs: upgrade 4.14.0 -> 4.17.0
dbfd914 tslib: 1.15 -> 1.16
0835575 python-mccabe: add native and nativesdk
6beba13 python-pyperclip: add native and nativesdk
37049d7 python-pep8: add native and nativesdk
8760980 python-pyflakes: add native and nativesdk
b7e64bc python-prettytable: add native and nativesdk
e929ea7 python-cmd2: add native and nativesdk
4ad49ed python-isort: add native and nativesdk
cff57da meta-oe: update cpprest with patches uploaded in Debian, add
upstream proposed gcc-8 patch, add boost 1.63 build fix patch
cddf0cb meta-networking: drop duplicated websocketpp recipe
b1a3f65 meta-oe: update websocketpp to 0.8.1, drop all patches
95a8804 ndctl: Add the NDCTL package
e4031bc protobuf-c: fix build error with protobuf 3.6.0.1
6d960cf snort: upgrade 2.9.7.5 -> 2.9.11.1
c031adb yaffs2-utils: update to latest master
2f5819d protobuf: upgrade 3.5.1 -> 3.6.0.1
9cd4375 python-pyiface: Upgrade to version 0.0.9
37e7ce4 libgpiod: bump version to v1.1.1
e07b4b0 autofs: upgrade 5.1.2 -> 5.1.4
7b20dd0 c-ares: upgrade 1.13.0 -> 1.14.0
d4f05ee drbd-utils: upgrade 9.4.0 -> 9.5.0
d4610b9 freeradius: upgrade 3.0.15 -> 3.0.17
82d57ef geoip: upgrade 1.6.11 -> 1.6.12
65ad10f libldb: upgrade 1.3.1 -> 1.4.1
cc29c92 libtdb: upgrade 1.3.15 -> 1.3.16
dab3f6a libtevent: upgrade 0.9.36 -> 0.9.37
ac53fb2 netcat-openbsd: 1.105 -> 1.190
bbff397 libtalloc: upgrade 2.1.11 -> 2.1.14
36c5536 pps-tools: use ${PN} for RDEPENDS
0049076 meta-python: add python-crcmod recipe
95930af meta-python: add python-inflection recipe
70f1e5f mozjs: disable MOZ_GLUE_IN_PROGRAM in standalone builds
ddcbc71 python-idna: remove bundled egg-info from source
bdf573a ipvdasm: upgrade 1.26 -> 1.29
c4eaf6e python-pyiface: Upgrade to version 0.0.10
e9fa640 libftdi: Extend for nativesdk
e945560 clean up var-DISTUTILS_INSTALL_ARGS
b387903 python-dateutil: add dependency on setuptools-scm-native
7c407d7 rygel: remove obsolete ossp-uuid dependency
140bf68 postgresql: use util-linux's uuid
3dc82fc apache2: upgrade 2.4.33 -> 2.4.34
59a2da1 rsyslog: fix race in parallel builds
104eb4d python-stevedore: Upgrade to 1.29.0
645018e python-txws: Add missing dep on python-six-native
9b743db python-mock: fix license from Apache-2.0 to BSD-2-Clause
d00b7bd libusb-compat: add (from oe-core)
c41ed7f libblockdev: cleanup/fix PACKAGECONFIG/dependencies
f83eca9 python-daemon: fix build dependencies to use the native
version rather than target for docutils
fdece14 python-stevedore: add pbr-native to the build dependencies
ff01089 pax-utils: add (from oe-core)
9746410 python-pymongo: update to version 3.7.1
e2ffd57 python-tornado: upgrade to version 5.1
c382f33 python-ndg-httpsclient: update to version 0.5.1
cb98080 python-vobject: update to version 0.9.6.1
d8bf7a2 python-cmd2: update to use the latest 2.7 supported release
b989920 python-can: update to version 2.2.1
594ad7f python-pyasn1: update to version 0.4.4
d381c29 python-pbr: update to version 4.2.0
04d7944 python-cryptography-vectors: update to version 2.3
1fc824b python-cryptography: update to version 2.3
e8a53f6 python3-meh: update to version 0.47
0ed9c43 python3-ordered-set: update to version 3.0.1
1a43ea0 python-alembic: update to version 1.0.0
5d0406a python-parse: update to version 1.8.4
53fddf6 samba: LDB 1.4.0 breaks Samba < 4.9
fc336c3 python3-bandit: Add missing dependency on pbr native
8eb8d03 python-greenlet: update to version 0.4.14
da0b413 libopenmpt: add recipe
7fca2bd kodi: Upgrade to upcoming kodi v18 'Leia'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
4587cc3 qtchooser: drop useless patch, set PV
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
2ae23f1 chromium-x11: Update to 68.0.3440.75.
not included in master yet:
~/oe/world/oe-build

