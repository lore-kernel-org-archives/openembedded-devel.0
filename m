Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4987F37B
	for <Openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2019 15:25:11 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id l9so78614988qtu.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2019 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nid5ZbTBwLd3Mpea4EGJyL4xQUZRr13JjyMf6OwPg9A=;
	b=IeVbPt6w2mUjOHcdsQxNbrbUF7Rw9VP65TdWM6SWPLGy9mdI2YzboxQSReUEbDPq/Z
	MqyF02t5K7AxWntjpQYttW1GPMwM+TmPYf3fsQkTanFIFUEoul2tHqDQ1+PK/KnTeffU
	P6lWYjYIAIXOEl4KbffRJlsO+Hb+TsWghVYHku43/OerGJq/ewgKvgCK1uFre/SqQ49a
	/qzqk8lWRj7O6HHdP/wpNpXacy4zqPdrH9Oa4vg323Vg+uX7RxogyJSrqfkSTrReoaNI
	WMsEsG1kDlDacwOK1T8/co/OVR2fdvkBf65qpwEC7725UgRVr/0CeEHqiyMPzzCpAt9M
	V15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nid5ZbTBwLd3Mpea4EGJyL4xQUZRr13JjyMf6OwPg9A=;
	b=ck7bII5kVlAX2IIfqQatg+Vbxs/AOCO9QyOuAbRYQF+COsI8UIjRHvfu4DnjUoO6Jb
	TeGSZpIMX4Y6QgUsu/vJ8ftniQewFsUFxt96VN7vKgzwokYAEz3C5UupRMt8wNrgCoEn
	LMCK4KcppJkRX0UZRUXFE+9jQFyNPjfKr5N47G+xkJiSqGTyzFFzUkO439GfG9DaMNY8
	WWky1dzkdGfU+fGChKXfDSoOLH4bGXYJlzAJPHzVco+evKgZWMl2fuUky1wEnU5evoL9
	BQApyGdHFb86sFYVwOEfzq1RPERGT9gep+ZsUWrKwglO7iHBBZ9R23fJtUaDhZOCnWUF
	xcjg==
X-Gm-Message-State: APjAAAVEy0WJ9ivLOvHy+YQrDEbjOjUAIaP+sk+A7x6ksUzRU79CerEn
	EsfG7U7OD8Q/EIQpKJQWOFVfhaIihhUKRsSK3lNn4JSg5ag=
X-Google-Smtp-Source: APXvYqwuPJSvQLPg6+w6mvgjQrNNZgBwpwg/DqqzeKu3LGdXKmVTndK5hgGuicgISbvP0UlAagRZGiAqn9vRhCmsTnY=
X-Received: by 2002:aed:3644:: with SMTP id e62mr100442893qtb.80.1564932309858;
	Sun, 04 Aug 2019 08:25:09 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Aug 2019 08:24:53 -0700
Message-ID: <CAMKF1sq-tNxaZE0xpnkyF4PcdL2RTFNyxhwmvxiZfJvwOEBfBQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-08-03
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
X-List-Received-Date: Sun, 04 Aug 2019 15:25:11 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-08-03 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190804_082137.log

=== common (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (6) ===
    * sources/meta-freescale/recipes-extended/dpdk/dpdk_18.11.bb:do_compile
    * sources/meta-freescale/recipes-extended/vpp-core/dpdkvpp.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.30.bb:do_package_qa

=== qemuarm64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile

=== qemux86 (3) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile

=== qemux86_64 (3) ===
    * build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.1+gitAUTOINC+baf311c42c-r0/build/openssl-prefix/src/openssl/target
    * sources/meta-openembedded/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb:do_package
    * sources/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb:do_compile

=== Number of failed tasks (38) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190803_170429.log/
||
|-
|| qemuarm64 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190803_222949.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190803_160814.log/
||
|-
|| qemux86_64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190803_211924.log/
||
|}

=== PNBLACKLISTs (3) ===

=== QA issues (60) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
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
||1 ||installed-vs-shipped
|-
||2 ||host-user-contaminated
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190804_034451.log/


    * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
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
sources/meta-clang:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-oe/recipes-dbs/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] =
"Since bbclass scons convert to python3, build mongodb failed"
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


count: 0 issue: textrel


count: 1 issue: build-deps
gparted-0.33.0: gparted rdepends on hicolor-icon-theme, but it isn't a
build dependency, missing hicolor-icon-theme in DEPENDS or
PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 56 issue: version-going-backwards

atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.169 to 0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.177 to 0:1.1-r2.176) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.169 to
0:1.1-r2.168) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.177 to
0:1.1-r2.176) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.184 to
0:1.0-r0.183) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.184 to 0:1.0-r0.183)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.236 to 0:1.0-r8.235)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.236 to 0:1.0-r8.235)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.236 to 0:1.0-r8.235)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.236 to 0:1.0-r8.235)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.236 to 0:1.0-r8.235)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.235 to 0:1.0-r3.234)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.235 to 0:1.0-r3.234)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.235 to 0:1.0-r3.234)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.235 to 0:1.0-r3.234)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.235 to 0:1.0-r3.234) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.236 to 0:1.0-r13.235) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.236 to 0:1.0-r13.235) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.236 to 0:1.0-r13.235)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.236 to 0:1.0-r13.235) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.236 to 0:1.0-r13.235) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.236 to 0:1.0-r13.235) [version-going-backwards]


count: 2 issue: host-user-contaminated
glibc-locale-2.30: glibc-locale:
/usr/lib/locale/es_PR/LC_MESSAGES/SYS_LC_MESSAGES is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
glibc-locale-2.30: glibc-locale: /usr/lib/locale/ht_HT/LC_NUMERIC is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 1 issue: installed-vs-shipped
pmdk: 28 installed and not shipped files. [installed-vs-shipped]


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
18d4a31f fetch2/wget: avoid 'maximum recursion depth' RuntimeErrors
when handling 403 codes
not included in master yet:
7aec8632 hashserv: SQL Optimizations
7bb79099 siggen: Import unihash code from OE-Core
19a6e356 cache: Add SimpleCache class
b707d0cb runqueue: Improve scenequeue processing logic
1f326f2c siggen: Add new unitaskhashes data variable which is cached
a0d941c7 siggen: Convert to use self.unitaskhashes
b410aba4 runqueue: Enable dynamic task adjustment to hash equivalency
ded2039e cooker/hashserv: Allow autostarting of a local hash server
using BB_HASHSERVE
bbd20113 hashserv: Turn off sqlite synchronous mode
13322807 prserv: Use a memory journal
9c67cbb5 hashserv: Use separate threads for answering requests and handling them
a5748196 hashserv: Switch from threads to multiprocessing
69aa311f runqueue: Clean up BB_HASHCHECK_FUNCTION API
9fda4510 siggen: Clean up task reference formats
b1bca5ab build/utils: Drop bb.build.FuncFailed
d1e621f5 tests/runqueue: Add hashserv+runqueue test
bf3d93bc bitbake: Bump version to 1.43.1 for API changes

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
18cdc087fd sstate: Reduce race windows
not included in master yet:
908cdd669b sanity.conf: Require bitbake 1.43.1
efe87ce4b2 classes/lib: Remove bb.build.FuncFailed
8a0291ac95 sstatesig: Move unihash siggen code to bitbake
9cf33e48e6 sstatesig: Add debug for incorrect hash server settings
1b9c7f87ec sstatesig: Adpat to recent bitbake hash equiv runqueue changes
aeba507d86 sstatesig: Update to handle BB_HASHSERVE
3869b5bdf8 sstate/sstatesig: Update to new form of BB_HASHCHECK_FUNCTION
d20f470250 sstatesig: Updates to match bitbake siggen changes
a87fb64522 libx11-diet: remove
5de1783748 recipes: Add runit and related recipes
2cdb933f07 oeqa: Recognise svlogd as another logger
1955e70697 glibc: Update to glibc 2.30
8f127dd766 mesa,llvm,meson: Update llvm to 8.0.1 plus define and use
LLVM version globally
583c842c5e musl: Update to master tip

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
c7e2778e0 poppler: update from 0.75.0 to 0.79.0
not included in master yet:
c4bb89164 dialog: upgrade 1.3-20190211 -> 1.3-20190728
72d7c7031 log4cplus: remove gold linker setting
da88c383e rsyslog: update from 8.1903.0 to 8.1907.0
71cb56871 meta-oe: Change some ftp:// URIs to http(s)://
c5372155f openldap: upgrade 2.4.47 -> 2.4.48
cd5566d00 python-cython: upgrade 0.29.12 -> 0.29.13
a58021bd4 libsodium: upgrade 1.0.17 -> 1.0.18
dd60555cd zstd: Update 1.4.0 -> 1.4.2
dab0e88e2 meta-oe: Use GNU_MIRROR in more recipes
91470d948 liblightmodbus: Add version 2.0.2
f16db6528 python-pycodestyle: upgrade 2.4.0 -> 2.5.0
a57e9bad0 python-lxml: upgrade 4.3.4 -> 4.4.0
c9fbe982f hwdata: upgrade 0.322 -> 0.326
68f1fdf23 pm-graph: fix time format parse error
ccf36c51a python-jsonpatch: upgrade 1.23 -> 1.24
e5b6e4ef9 icewm: add recipe
31c4542f2 python-pyasn1: upgrade 0.4.5 -> 0.4.6
bb1e38929 python-pyasn1-modules: upgrade 0.2.2 -> 0.2.6
4b5832ef4 python-pyparsing: upgrade 2.4.0 -> 2.4.2
b8a6aceea python-pytest-runner: upgrade 4.2 -> 5.1
0b958bd99 python-pytz: upgrade 2019.1 -> 2019.2
04473965b Netdata upgrade: 1.8.0 -> 1.16.0
723075594 metacity; upgrade from 3.30.1 to 3.32.0
403d7db5d cppzmq: bump to version 4.4.1
3c5db8fc6 klcc-cross: Recognise --unwindlib clang option
45e884888 libsub-exporter-progressive-perl: Remove unneeded DEPENDS_PN
58805f41a ufs-tool: add tool to access UFS (Universal Flash Storage) devices
501a565fe libedit: Delete
24116b8fb sysdig: Upgrade to 0.26.1+
d960560bf [wip] python-grpcio: Use gettid API from glibc 2.30+
f04952121 [wip] grpc: Update to 1.22.0
e0dd76a0c [wip] android-tools: Fix build with glibc 2.30

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
6463bea qt5everywheredemo: update HOMEPAGE
not included in master yet:
8da88b0 Allow enabling gui for native and nativesdk
8d2e1b4 qt5: Upgrade to Qt 5.13.0
c7f8827 qtremoteobjects: Use OE_PATH_EXTERNAL_HOST_BINS to enable
cmake to find repc
c8b3085 qtwebengine: refresh the patches to apply
8f0e741 qtwebengine: Fix build on aarch64
708be17 maliit-framework-qt5: Fix build when ptest is enabled
09913e9 qttools: Enable clang support when using clang

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
3a0df19 chromium: Fix stat64 related build with musl
not included in master yet:
~/oe/world/yoe

