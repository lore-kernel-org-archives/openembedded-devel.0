Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7215C6D74B
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 02:42:46 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id o11so11633162qkg.8
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2019 19:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=V+U1hA0ud0O4NglKrrRDSbeXxpmTyw6EKkb65Qk7PoA=;
	b=aV0Q8CHMigjYyj822F5eacEh80V12MdxwR1NwmyXzagb+4q4osKHnZBv8475/seefn
	VPzFIpSaKBtY7m2qpz1CCuZTCvpTi2CovM+MpYDMS7No1tYhNgEkiwVirXIS1+Ig9z9p
	Ma3OcYWcB078HYZ1HhgCruI8xksmqISgEHAfwsqU7CWPT1eD5ZpXReA2b9mKg6M+epQC
	sv1LHGmDbz3YwZWcqv7VG6U/98jJpqVx7xLvLel7gNuZLT4EtK2ONk+7crp5iUd8NJTf
	bXLfHnujRa0knfE2OtrHmel9QwXCjxRMSrTwMuc1Ti6JWiB6mShh5nkD8jehWGfewdbG
	5vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=V+U1hA0ud0O4NglKrrRDSbeXxpmTyw6EKkb65Qk7PoA=;
	b=gq/m/09e60QBhnBUfaYDn1mx9Q/mxsHlx4x4tjeMn7KnxFEDr15jaiESjYiRZr+/SS
	/kyk1IlbHZBX+Wo7tGJE3AjIa9nbCTccWkXsQ8hRBUnFwIfJ9pg4pqgvTdPoJgv7gY5E
	NdDP9TYCmfhG52MkF2OdUkx1ErqOL1gc2fYbuG0Qkuwp+E32yLEy+TZApyCGTJjkVJfn
	xTAwETFtxVxsH2oMr7P/1U5mb1cKwtAok3pPITgPnA3SqKICqVDKkbWPnj9WYLWohVve
	44EUEh+NfF4F7C2//GCGYlPNXklJf+tzcT6CspiIPivgoz6f+uA+o/Vt5+BbwqegIYSe
	T1Fw==
X-Gm-Message-State: APjAAAUtdr3BhthgPg/XEeTykVUe3xAvotGTf1u2dlOJlwA8Wb8hzano
	xJNLpTVjq2iwcIJP7LaKIhLd1ogX30wGq+/jtlRf+4YQkLU=
X-Google-Smtp-Source: APXvYqyExrrbPIxxQMCrz0BCeR2OSdSZ2QGsUD3mZg0Ollm0Ppfdq5gTaawEDNhwAZDEwi3GJBPSWOgbTBHCnzMvhmM=
X-Received: by 2002:a37:c403:: with SMTP id d3mr21095724qki.212.1567996966630; 
	Sun, 08 Sep 2019 19:42:46 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Sep 2019 19:42:20 -0700
Message-ID: <CAMKF1sqsFw+0hO1rUpK6psQOo9+_Q9ok_Pohz9=dbw+7AD8YOg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-09-08
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
X-List-Received-Date: Mon, 09 Sep 2019 02:42:46 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.openembedded.org/wiki/Bitbake_World_Status_Zeus

== Failed tasks 2019-09-08 ==

INFO: jenkins-job.sh-1.8.46 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190908_140140.log

=== common (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/wayland/weston-init.bb:do_install

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemuarm64 (0) ===

=== qemux86 (3) ===
    * sources/meta-openembedded/meta-oe/recipes-core/safec/safec_3.4.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (15) ===
{| class=wikitable
|-
|| qemuarm || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190908_065258.log/
||
|-
|| qemuarm64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190908_073153.log/
||
|-
|| qemux86 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190908_050302.log/
||
|-
|| qemux86_64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190908_054120.log/
||
|}

=== PNBLACKLISTs (10) ===

=== QA issues (57) ===
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
||0 ||textrel
|-
||0 ||unknown-configure-option
|-
||1 ||build-deps
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (17) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190908_080636.log/
    * ERROR: 17 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
xscreensaver

    * ERROR: 2 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 2 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 10 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 3 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: runit different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: xscreensaver different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1567955196/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1567955196/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: atmel-qt-demo-init different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libcrypt-openssl-guess-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-config-perl-native different signature for
task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-helpers-perl-native different signature for
task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libextutils-installpaths-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libmodule-build-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: liburi-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-filter-buffertext-perl-native different signature
for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-sax-base-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: libxml-sax-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 10 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1567955196/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1567955196/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 17 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
xscreensaver


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-clang:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
directory"
meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
= "Kernel module Needs forward porting to kernel 5.2+"
meta-oe/recipes-dbs/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] =
"Since bbclass scons convert to python3, build mongodb failed"
meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
= " error: invalid use of incomplete type 'RCF::AsioIoService {aka
class boost::asio::io_service}; among others?"
meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
= "Kernel module Needs forward porting to kernel 5.2+"
meta-oe/recipes-extended/sysdig/sysdig_git.bb:PNBLACKLIST[sysdig] =
"configure: error: in
'TOPDIR/build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.4-r0/build/c-ares-prefix/src/c-ares'"
meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
"Needs forward porting to kernel 5.2+"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:PNBLACKLIST[vboxguestdrivers]
= "Needs forward porting to kernel 5.2+"
meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb:PNBLACKLIST[python3-cmd2]
= "Nothing RPROVIDES 'python3-colorama' (but python3-cmd2_0.9.16.bb
RDEPENDS on or otherwise requires it)"
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
PNBLACKLIST[evolution-data-server] = "Qemu usermode hangs forever on
abaco/kwaj builders when doing g-ir-scanner-qemuwrapper"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 0 issue: textrel


count: 1 issue: build-deps
gparted-0.33.0: gparted rdepends on hicolor-icon-theme, but it isn't a
build dependency, missing hicolor-icon-theme in DEPENDS or
PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 56 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.222 to 0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.228 to 0:1.1-r2.227) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.222 to
0:1.1-r2.221) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.228 to
0:1.1-r2.227) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.226 to
0:1.0-r0.225) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.226 to 0:1.0-r0.225)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.278 to 0:1.0-r8.277)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.278 to 0:1.0-r8.277)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.278 to 0:1.0-r8.277)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.278 to 0:1.0-r8.277)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.278 to 0:1.0-r8.277)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.276 to 0:1.0-r3.275)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.276 to 0:1.0-r3.275)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.276 to 0:1.0-r3.275)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.276 to 0:1.0-r3.275)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.276 to 0:1.0-r3.275) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.276 to 0:1.0-r13.275) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.276 to 0:1.0-r13.275) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.276 to 0:1.0-r13.275)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.276 to 0:1.0-r13.275) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.276 to 0:1.0-r13.275) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.276 to 0:1.0-r13.275) [version-going-backwards]


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
89dd570e bitbake-user-manual: Improve the example for Removal
(Override Style Syntax)
not included in master yet:
37e957d3 bitbake: hashserv: Add request statistics
d4ed71cb bitbake: hashserve: Log I/O waits and SQL time
ef45fe62 bitbake: hashserv: Add more threads
c02247d7 runqueue: Fix task migration problems

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
d41606244c oeqa/selftest: Tweak binutils tests tags as toolchain/user and system
not included in master yet:
3b2f4f198f recipes: Add runit and related recipes

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
8d4d608b4 apache2: fix multilib file conflicts
not included in master yet:
86b4e8df8 xfsdump: support usrmerge
25b2a4df8 python-paste: upgrade 3.1.1 -> 3.2.0
0797189c3 libnet-dns-perl: upgrade 1.20 -> 1.21
0c05d4987 grpc: don't use unexisting gettid function on glibc 2.29, it
has been implemented only in 2.30
26ca08541 grpc: Change gettid patch with the upstream merged version
391d79571 hwdata: upgrade 0.326 -> 0.327
e7b382602 samba: Fix configure tests to work with clang
6b236cd02 dejagnu: Remove, moved to oe-core
720a2ffe8 ltrace: Fix build on mips
3bf4c102a python3-twine: Initial commit of 1.13.0
7a706c066 python3-pytest-asyncio: Initial commit of 0.10.0
dce0799b1 wireguard: Upgrade 20190702 to 20190905
fb34a7c58 python-jinja2: Make asyncio specific to python3 module alone
48471748f python3-cmd2: Add to blacklist
ace2fc493 remmina: Add recipe for the remmina remote desktop client
b4937b5d6 nodejs: Mark incompatible with risc-v
eca729d98 drbd,netkit-rusers: Blacklist packages
649d491b2 vboxguestdrivers,can-isotp,bpftool: Add to Blacklist
3061ead8c strongswan: Fix do_patch fuzz
c789bc116 sysdig: Upgrade to 0.26.4

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
53500ad qtdeclarative: Use qmlcachegen provided by OE instead of system one.
not included in master yet:
a41cd9e qtwayland: remove workaround for missing private headers (QTBUG-71340)
725c87d qtwayland: do not reference private modules in cmake Qt5WaylandClient
4d8f350 qtwebengine: Rename jasoncpp to jsoncpp
e8aa2dd qtwebengine: Add pulseaudio support
8799d3b qtserialbus: Fix build with 5.2+ kernel headers
dc502d5 qtwebengine: Fix compile failure with 5.2+ kernel headers
12ea469 qttools: Add CONFIG+=config_clang_done when not building with clang
aa00625 qt5-creator: Fix clangformat with clang 9.x

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
e4ac6bb chromium: Update to 76.0.3808.132.
not included in master yet:
~/oe/world/yoe

