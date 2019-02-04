Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE2C37C22E
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 06:21:26 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id b8so4344015qtj.1
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 22:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=0I6sopKR/KQycoJ1NaY1ZwYgnta6SDQ7coDNJxgW9bA=;
	b=H5FDwpJUwLBXA80XQnU6kHIAr5GQPKrZUscXD/EYzFVyRe4nlwqiTiDbrl7yd2aPDb
	0FXmPEWvf40ip4RS2fEC00uvxRhQz3OUf226E1oCDEU5oUJnc/b+tWSxCOSup4QCohOk
	+rk3LMS1sZKe9kMP9nvwXvztTiPNFtUxwKAikwEUGfTxDiXdilE5u6chhrpS2+O599ou
	tLF9o4ZBu/hNXsR1wh/BAOj1BvVTn1gPx87jCA2RuGshIBMLf+KUxjYepY99WEHQ8nhl
	H3YTZL5UXGRDGx+10bbPGTRwU4b/fLTeMhHcL0mkg2A1FHRTpG3MFMZoOLbK+qgNfXjX
	aofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=0I6sopKR/KQycoJ1NaY1ZwYgnta6SDQ7coDNJxgW9bA=;
	b=sRU0/ojvrCs28uMJoNRJI9Hl6mlej0duI3UaIl8Yt8ddmV2hb2ex8OSHQ0CXL8OnDr
	zSX1nAObAqoyMkub/h9AnxLL7+a3FjQkWr58Ik+5DUyC97FaMoOsmmaOc3wdjKLjC2Ar
	Y7bOrcTulpIlJSZjBWwafCQ6mlS4bnlH79sua1gsnvZhhXzrel4TUbwctcZSZf+OU289
	SVlN4RQsuRJ+auwiLxYY3kWbqu/8abD5/1S4UbmLs2pB8HLGocQ2rBZw+CC6CyrpBYiA
	qKFUoh/zkKpuOWG2bsp9zhyEONlzFxjepf0ZAS+H5WZTFvbFZznTsGeAavqGnoHEgftc
	Hi5g==
X-Gm-Message-State: AHQUAuboG0qbp8y6gQwJImIAy0EShHkid/bEfin+Mtye7nBs319OiuFq
	Paz4OhSFkTFdndbUkDC7QvO9ph7VCtc+HBRzd3jZfryM
X-Google-Smtp-Source: AHgI3Ias2x8fAK9H8PHExQ3Mcsgk3BY+2Q7T1wRq0lYh+krXuhBZn5ILV7cnWg146nbMDK4P/9NMMRpgvSLbzNSiU5Q=
X-Received: by 2002:ac8:67d3:: with SMTP id r19mr3590856qtp.196.1549261287011; 
	Sun, 03 Feb 2019 22:21:27 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Feb 2019 22:21:01 -0800
Message-ID: <CAMKF1srt4BCf=bcCkmpiWNGaYDs5k8K8nTsrMmWzP8n+C6vVug@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2019-02-03
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
X-List-Received-Date: Mon, 04 Feb 2019 06:21:27 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-02-03 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190203_215544.log

=== common (5) ===
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.31.1.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== common-x86 (1) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb:do_compile

=== qemux86 (2) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/cargo/cargo_0.31.0.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_package_qa

=== Number of failed tasks (39) ===
{| class=wikitable
|-
|| qemuarm || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190203_110732.log/
||
|-
|| qemuarm64 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190203_122452.log/
||
|-
|| qemux86 || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190203_110742.log/
||
|-
|| qemux86_64 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190203_131212.log/
||
|}
ls: cannot access 'openembedded-core': No such file or directory
ls: cannot access 'meta-*': No such file or directory

=== PNBLACKLISTs (0) ===

=== QA issues (61) ===
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
||4 ||build-deps
|-
||56 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190203_203744.log/


    * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'tearsofsteel-1080p' (but
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
ls: cannot access 'openembedded-core': No such file or directory
ls: cannot access 'meta-*': No such file or directory
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
'/tmp/work/armv5e-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]


count: 4 issue: build-deps
glide-0.13.2: glide rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-dep-0.5.0: go-dep rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-helloworld-0.1: go-helloworld rdepends on libstd-rs, but it isn't a
build dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
sysdig-0.24.2+gitAUTOINC+831d167d4f: sysdig rdepends on libcurl, but
it isn't a build dependency, missing curl in DEPENDS or PACKAGECONFIG?
[build-deps]


count: 0 issue: file-rdeps


count: 56 issue: version-going-backwards
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dbg went backwards which would break package feeds
from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-dev went backwards which would break package feeds
from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-doc went backwards which would break package feeds
from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-locale went backwards which would break package
feeds from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-src went backwards which would break package feeds
from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.38 to 0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package
atmel-qt-demo-init-staticdev went backwards which would break package
feeds from (0:1.1-r2.40 to 0:1.1-r2.39) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.38 to
0:1.1-r2.37) [version-going-backwards]
atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
went backwards which would break package feeds from (0:1.1-r2.40 to
0:1.1-r2.39) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.62 to
0:1.0-r0.61) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.62 to 0:1.0-r0.61)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.112 to 0:1.0-r8.111)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.112 to 0:1.0-r8.111)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.112 to 0:1.0-r8.111)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.112 to 0:1.0-r8.111)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.112 to 0:1.0-r8.111)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.112 to 0:1.0-r3.111)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.112 to 0:1.0-r3.111)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.112 to 0:1.0-r3.111)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.112 to 0:1.0-r3.111)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.112 to 0:1.0-r3.111) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.112 to 0:1.0-r13.111) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.112 to 0:1.0-r13.111) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.112 to 0:1.0-r13.111)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.112 to 0:1.0-r13.111) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.112 to 0:1.0-r13.111) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.112 to 0:1.0-r13.111) [version-going-backwards]


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
0ec98c01 gitsm: The fetcher did not process some recursive submodules properly.
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
29e064ac6b devtool: add --all option to check-upgrade-status
not included in master yet:
8eeb5bae02 libsolv: Drop now uneeded musl patch
cbb003a050 recipes: Add runit and related recipes
9643c92d08 oeqa: Recognise svlogd as another logger
ddad3d08be ipk_write_pkg: add error output
e929972d5f binutils: Use master ( would be 2.32 )
6b81d437d4 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
fd853f349e multilib_header: Place a #include guard to avoid infinite
inclusion of headers
a00ac0345a llvm,mesa: Upgrade to upcoming 8.0.0 release
aa40eacdc5 image_types.bbclass: Limit xz's memory greed to 70 percent
of total RAM
7d1f01269d send-error-report: Use https instead of http protocol

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
bd6803523 libvncserver: make PACKAGECONFIG flags explicit
not included in master yet:
ee93134f9 python-vcversioner: remove egg generation
ac179bc18 python3-vcversioner: remove egg generation
9ada8b130 jq: update to 1.6
69c990334 python-twisted: Remove ${PN}-src
055da2bce php: upgrade to 5.6.39
677a32a2b irssi: Upgrade from 1.0.4 to 1.1.2
9c4f08ba8 cpuburn-arm: Move cpuburn-neon to cpuburn-arm and add more tests
21e3bb57f mosh: Upgrade to 1.3.2
6fd901de5 tinymembench: Fix build with clang assembler
920265d47 xmlrpc-c: Update to 1.51.03
3dc2b5118 jsonrpc: Update to 1.1.1
e3a9b1a97 asio: Update to 1.12.2
fe08cf354 jack: Fix build when using libc++
c4432a5f6 mozjs: Fix symbol visibility with clang/libc++
b730bd799 Split ntpq into an own package
db13bed51 wireless-regdb: update 2018.05.31 -> 2018.10.24
ddb7d61ee wireguard: use ${nonarch_base_libdir} for modules
44fee7587 wireguard: udpate to 20190123 version
f58ae7a64 botan: Upgrade to 2.9.0
2feb6f1d9 libeigen: update from 3.3.5 -> 3.3.7
e87151411 libgit2: Fix install for multilib
1234670bb libgit2: upgrade 0.27.4 -> 0.27.8
6d9694f48 vim: improve reproducibility
e49842903 vim: Fix "--enable-gtk2-test" unrecognized option error
7b48bd2be vim: Enable GUI support for x11 DISTRO_FEATURES
e10659da3 libwebsockets: fix multilib install
6c21a3f62 libwebsockets: upgrade 3.0.0 -> 3.1.0
c3a5c5c3e python-slip-dbus: update to 0.6.5
53cb161e6 python-slip-dbus: add a python3 version of the recipe
5ca9c8850 dibbler: Fix build with clang/libc++
53b9c69fb libqmi: Update to 1.22.0
f3682953e networkmanager: fix QA issue when using modemmanager and ppp
in PACKAGECONFIG
ad8709feb pam-ssh-agent-auth: Port to work with openssl 1.1.x
b284f2b45 rtmpdump: Switch to using GNU TLS instead of openssl10
ace62392d oscam: Update to latest svn revision 11491
64784f756 lshw: BBCLASSEXTEND to native
c5f0ba664 nmap: Fix typo in pcre PACKAGECONFIG
fe157b9cb nmap: Include additional FILES path for certs
78f210eb3 owfs: Inherit systemd
20188e783 sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
82abc2b qtbase: fix incomplete recipe changes from previous commit
not included in master yet:
fa27c56 qtconnectivity: Fix build with clang/libc++
7ef1089 maliit-framework,maliit-plugins: Fix build with libc++
264066e qt5-plugin-generic-vboxtouch: Fix build with clang/libc++
92fe2ef qtwebengine: Fix build with clang/libc++ on aarch64

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
0f62572 chromium: fix x11 dependency brought by at-spi2-core package.
not included in master yet:
624f984 firefox: Fix cmsghdr errors with musl
9dc8488 XXX
~/oe/world/yoe

