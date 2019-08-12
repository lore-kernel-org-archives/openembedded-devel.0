Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 15BBF6BCDC
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 04:05:46 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id g17so5392110qkk.8
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zBo85f14BW17WiaKqVHf1GV6NnaHdG6c/ZJkSrtmUlI=;
	b=OS3AD8KivrIA62MEg64lvUiv1mSK/sXFnbSIdEMhIhgZLmQ8O0n87LGxjQ2LYCt1qe
	Op/Hs+LD9nggTszsq8TxZXUk5dFgu3biLB6fAWZLc/+IVgEJCvEMAt3Yh9NdgHhWJmz0
	EfwGULxxD/pPc6S5JFaCAAmJ7spwTWtkMbUl2ZLIhegGfgxlFw03eEM7SifFxCEgWMYL
	shUyj/u9f0thPCqQnZXTg1nTJH2Wpj0iFbbkz6k4HymKdaPWW6ingk4hUXwWiTxknCQ3
	FTkJYKq050qEG7UOnLLZFy49ztLe+EztOHOFjXs5UvvjVF88h4xfky5/Ybj9UKrd0uTH
	quGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zBo85f14BW17WiaKqVHf1GV6NnaHdG6c/ZJkSrtmUlI=;
	b=dnNCYYPravXbegVDc3fQm19wN3dcbRldpAV14cF83hZ6y6uSsiqNDPQfSk1mzc6/Ib
	RAahzqeJ8sE3XH4ZF1J346BGGf9Eey2VMllTyfUibRbtoB9FQ+0yh+9YMW/ZUfiwZqkA
	Tfs1hOneYDj+Ac6GZckhE+Mawtzxz9N4MSgmAkP+PFzctrFfe2bWbOIjrHVe1dekAcWA
	bqzbzeaNserWnRIg9AwytDDXpXcZdIJg00+NWndGdiUdVw4VMKcJET/zXrPmDEcBtzP1
	1bUR+IcjpHoFNfH5OFcUVaVG1AxQnr7oQIZ8th8G7DZu1EVVQdlXIrvV8X7hHsWGLAwF
	2PXw==
X-Gm-Message-State: APjAAAXs5FQKvGzUSUddMixHcsiDOYl3LqQdsgDmE2VG8GKfqlE+jkIj
	vRF1j0pLq+Q4Cmeupp2NLQqRhzBGjf7bkHrPQrASWsMFpkg=
X-Google-Smtp-Source: APXvYqwhmJSjxd3g9rIFdwJMLoqTuxyvWK0JEmclo0FOTbXHmEZzIwTRIBfdheGDwQaHFuaItuGL9c7V9JYsUi7p7po=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr19298097qkk.474.1565582747189;
	Sun, 11 Aug 2019 21:05:47 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 21:05:21 -0700
Message-ID: <CAMKF1spmCv1=Zm4FBLVTf-OrECFobjeQkZRVc8RzNkZX+W6N0A@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE world 2019-08-11
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
X-List-Received-Date: Mon, 12 Aug 2019 04:05:47 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-08-11 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190811_195557.log

=== common (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (6) ===
    * sources/meta-freescale/recipes-extended/dpdk/dpdk_18.11.bb:do_compile
    * sources/meta-freescale/recipes-extended/vpp-core/dpdkvpp.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/openembedded-core/meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb:do_compile

=== qemuarm64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile

=== qemux86 (3) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile

=== qemux86_64 (2) ===
    * build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.1+gitAUTOINC+baf311c42c-r0/build/openssl-prefix/src/openssl/target
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.30.bb:do_package_qa

=== Number of failed tasks (37) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190811_105925.log/
||
|-
|| qemuarm64 || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190811_133156.log/
||
|-
|| qemux86 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190811_145632.log/
||
|-
|| qemux86_64 || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190811_172248.log/
||
|}

=== PNBLACKLISTs (3) ===

=== QA issues (58) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
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
||1 ||host-user-contaminated
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190811_160010.log/


    * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
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
from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.178 to 0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.187 to 0:1.1-r2.186) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.178 to
0:1.1-r2.177) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.187 to
0:1.1-r2.186) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.190 to
0:1.0-r0.189) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.190 to 0:1.0-r0.189)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.242 to 0:1.0-r8.241)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.242 to 0:1.0-r8.241)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.242 to 0:1.0-r8.241)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.242 to 0:1.0-r8.241)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.242 to 0:1.0-r8.241)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.241 to 0:1.0-r3.240)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.241 to 0:1.0-r3.240)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.241 to 0:1.0-r3.240)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.241 to 0:1.0-r3.240)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.241 to 0:1.0-r3.240) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.242 to 0:1.0-r13.241) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.242 to 0:1.0-r13.241) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.242 to 0:1.0-r13.241)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.242 to 0:1.0-r13.241) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.242 to 0:1.0-r13.241) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.242 to 0:1.0-r13.241) [version-going-backwards]


count: 1 issue: host-user-contaminated
glibc-locale-2.30: glibc-locale:
/usr/lib/locale/so_SO.ISO-8859-1/LC_PAPER is owned by uid 3004, which
is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]


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
8c26b451 knotty: Fix for the Second Keyboard Interrupt
not included in master yet:
a93ca226 runqueue: Handle covered tasks when rehashing

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
30a2af80f5 libx11: replace libtool patch with upstreamed patch
not included in master yet:
34196d2913 musl: Update to master tip
4e00ceaf38 deb: allow custom dpkg command
933286bdcb grub/grub-efi: fix conflict for aach64
a99791672e man-db:upgrade 2.8.5 -> 2.8.6.1
022d642b0c cmake: 3.14.5 -> 3.15.1
cdde0265b1 python3-mako: 1.0.14 -> 1.1.0
1f64ecf92f ovmf: Update to version edk2-stable201905
b9851d612b ovmf: Set PV
435d1f8ffe ovmf: Use HOSTTOOLS' python3
daaf9d7bd8 ovmf: Generate test Platform key and first Key Exchange Key
5e47316ae6 runqemu: Add support to handle EnrollDefaultKeys PK/KEK1 certificate
8b76048da9 sstatesig: Fix leftover splitting issue from siggen change
42293d7540 image_types_wic.bbclass: Copy the .wks and .env files to
deploy image dir
56add7cc54 wic: Add partition type for msdos partition tables
8e48b4d6c4 wic: Make disk partition size consistently computed
e6d51c9472 dpkg: Provide update-alternative for start-stop-daemon
90edb9c2e2 maintainers.inc: give python recipes to Oleksandr Kravchuk
4e9659f24e python-numpy: remove the python 2.x version of the recipe
6508c47e49 python3-numpy: update to 1.17.0
bd79b5ee67 python-scons: remove the python 2.x version of the recipe
727f582d4f python-nose: remove the python 2.x version of the recipe
6befdbfa83 libinput: update to 1.14.0
15e2d87e19 wpa-supplicant: update to 2.9
681e658f0e python3-pygobject: remove python3-setuptools from RDEPENDS
3409049f6e aspell: update to 0.60.7
b95417164f screen: Backport fix for an implicit function declaration
6d57d8f8f5 e2fsprogs: 1.44.5 -> 1.45.3
21dcf03310 python3-pygobject: Add missing pkgutil RDEPENDS
8246e17925 recipes: Add runit and related recipes
5f270a499f oeqa: Recognise svlogd as another logger
54f0ce78b3 oeqa/buildgalculator.py: Add dependency on gtk+3

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
cb036c840 hostapd: upgrade 2.8 -> 2.9
not included in master yet:
b2c96a97f xfce4-datetime-setter: add recipe
58c865e46 nodejs: 10.16.0 -> 10.16.2
493aa5b89 snort: upgrade 2.9.14 -> 2.9.14.1
ff074c9bf kpatch: upgrade 0.61 -> 0.71
a6043b70a mongodb: add mongo shell as a PACKAGECONF option
5f0f3e0ea python-pandas: remove the python 2.x version of the recipe
ae88e1a5d gvfs: upgrade from 1.40.0 to 1.40.2
2ea549618 python3-pillow: Provide python3-imaging
3947b77ac glmark2: Upgrade SRCREV to latest
21e53693a python3-websockets: upgrade to 8.0.2
ac31a6d34 python3-multidict: upgrade to 4.5.2
8f3d728b3 python-engineio: upgrade to 3.9.3
54645121c python-socketio: upgrade to 4.3.1
311dfa83b python-aiohttp.inc: add missing RDEPENDS
e70ba86d7 python-async-timeout: add asyncio to RDEPENDS
8d2633b8d python-socketio.inc: add missing RDEPENDS
c5f294f46 sysdig: Upgrade to 0.26.1+

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
74b9cb0 firefox: Avoid crash on opening about:support on certain SoC
not included in master yet:
~/oe/world/yoe

