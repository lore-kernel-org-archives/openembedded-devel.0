Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 589317C21E
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 00:04:03 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id e5so24337908qtr.12
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 16:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8kUSlFa+Ep/IxlF/UWXuQFfAaewL+MqI9Ftg6FxTqzw=;
	b=FW/f9vBPehNoN5ASm2mGp9lhEvxPPUYxh4H/c1c6xiTzTjyQCvXeS/9iMyo3E1CLFX
	1BB/bi4i22Xb/FeKPyimtAb0R2FnXCtAbfnOlpfObn9oSGW3/z3lOGMPEj6W5xAeo4Or
	BYmFp+CaStWvG8YDFrW87vVR6uPE5crkt8Cy8QEoRL7gNfkeyQ86c59x52wjeAVzpcsj
	meSTNHqGObPTluTOt/NjcTw5c9oJ8b0YYRpz7fwKZjFnYH379cNL+ulim8kKNiw6N+ET
	MjZhzTPfIAD1HijlYQKAC7sZcZ2x3erM0wbajDmrQGH9uRj+D1yMeGyKKS0DtTKGY+eT
	wrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8kUSlFa+Ep/IxlF/UWXuQFfAaewL+MqI9Ftg6FxTqzw=;
	b=WAjiCnD9bMnfcwiAdztc0zOdVe0r3VOwZwkfAlMphWBUcd9bXIZczZEG22/2UKTpX2
	Pw20GC5Mg42fB2c8NXycmhiLDyJL6HBSlKu1U0hg1orYAPWChi4QiSkP+lNJJytkGJ9V
	wku/nVucDXxlzcDGJ+niZuXZrK2moZ11o/gHZyGFd00DS4s0zP0HNn6RDDDsi4DS6j55
	Xj5onvmVMtCLccAcI5Iqpfp7RFxsqYWrKaNkonYKzrQCskg/DbnoWLhmBPRaOHoHLZob
	c014YWwzMjLEM0yzvGI3AjxQB/+Xl+dvSy5zLoXe1hsuzE+DO6Addgpeq/cFANGL0dDK
	SQKA==
X-Gm-Message-State: AJcUukeQyanXZ1XF/j2whk/UHFjSs+FIYnz1TU1OcugUcrE2e47vc+vm
	AZw+/IpTqtLO5J5Yqrs0lLu5KYbWXLScE9Pug75Pb3JRPoo=
X-Google-Smtp-Source: ALg8bN51+AFJs3fPx12ug33KXraqjezejQuxqfxjv/MYGcTa7OnKbE+40prBbkPp2a/pRA5Dt7LYhBBOmu2v13pbpew=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr26847787qva.50.1548806642901; 
	Tue, 29 Jan 2019 16:04:02 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jan 2019 16:03:36 -0800
Message-ID: <CAMKF1sr98AhU99UYP6p_nfymqj3oB7iC8gp0xfPQC5en8hYZCQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2019-01-28
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
X-List-Received-Date: Wed, 30 Jan 2019 00:04:03 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-01-28 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190129_155735.log

=== common (6) ===
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb:do_compile
    * sources/meta-openembedded/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb:do_package
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

=== qemux86_64 (2) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa

=== Number of failed tasks (42) ===
{| class=wikitable
|-
|| qemuarm || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190128_065104.log/
||
|-
|| qemuarm64 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190128_153550.log/
||
|-
|| qemux86 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190128_065115.log/
||
|-
|| qemux86_64 || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190128_182537.log/
||
|}
./jenkins-job.sh: line 546: cd: too many arguments

=== PNBLACKLISTs (0) ===

=== QA issues (144) ===
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
||0 ||unknown-configure-option
|-
||138 ||version-going-backwards
|-
||1 ||host-user-contaminated
|-
||1 ||textrel
|-
||4 ||build-deps
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190129_083926.log/


    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
./jenkins-job.sh: line 546: cd: too many arguments
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


count: 138 issue: version-going-backwards
96boards-tools-0.12: Package version for package 96boards-tools-dbg
went backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-dbg
went backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-dev
went backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-dev
went backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-doc
went backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-doc
went backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-locale
went backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-locale
went backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-src
went backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools-src
went backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package
96boards-tools-staticdev went backwards which would break package
feeds from (0:0.12-r0.40 to 0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package
96boards-tools-staticdev went backwards which would break package
feeds from (0:0.12-r0.45 to 0:0.12-r0.44) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools went
backwards which would break package feeds from (0:0.12-r0.40 to
0:0.12-r0.39) [version-going-backwards]
96boards-tools-0.12: Package version for package 96boards-tools went
backwards which would break package feeds from (0:0.12-r0.45 to
0:0.12-r0.44) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.57 to
0:1.0-r0.56) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.57 to 0:1.0-r0.56)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.107 to 0:1.0-r8.106)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.107 to 0:1.0-r8.106)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.107 to 0:1.0-r8.106)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.107 to 0:1.0-r8.106)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.107 to 0:1.0-r8.106)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.107 to 0:1.0-r3.106)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.107 to 0:1.0-r3.106)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.107 to 0:1.0-r3.106)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.107 to 0:1.0-r3.106)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.107 to 0:1.0-r3.106) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.107 to 0:1.0-r13.106) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.107 to 0:1.0-r13.106) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.107 to 0:1.0-r13.106)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.107 to 0:1.0-r13.106) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.107 to 0:1.0-r13.106) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.107 to 0:1.0-r13.106) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-dbg went backwards which would break package feeds
from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-dbg went backwards which would break package feeds
from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-dev went backwards which would break package feeds
from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-dev went backwards which would break package feeds
from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-doc went backwards which would break package feeds
from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-doc went backwards which would break package feeds
from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-locale went backwards which would break package
feeds from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-locale went backwards which would break package
feeds from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-src went backwards which would break package feeds
from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-src went backwards which would break package feeds
from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-staticdev went backwards which would break package
feeds from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite-staticdev went backwards which would break package
feeds from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite went backwards which would break package feeds
from (0:8.2.0-r0.24 to 0:8.2.0-r0.23) [version-going-backwards]
phoronix-test-suite-8.2.0: Package version for package
phoronix-test-suite went backwards which would break package feeds
from (0:8.2.0-r0.26 to 0:8.2.0-r0.25) [version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dbg went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dbg went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dev went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-dev went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-doc went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-doc went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-locale went backwards which would break package feeds
from (0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-locale went backwards which would break package feeds
from (0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-src went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-src went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-staticdev went backwards which would break package feeds
from (0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth-staticdev went backwards which would break package feeds
from (0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.25 to 0:1.1+git0+2e1a393955-r0.24)
[version-going-backwards]
pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
pi-bluetooth went backwards which would break package feeds from
(0:1.1+git0+2e1a393955-r0.27 to 0:1.1+git0+2e1a393955-r0.26)
[version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dbg went
backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dbg went
backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dev went
backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dev went
backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-doc went
backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-doc went
backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-locale
went backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-locale
went backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-src went
backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-src went
backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-staticdev
went backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-staticdev
went backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts went
backwards which would break package feeds from (0:1.0-r10.40 to
0:1.0-r10.39) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts went
backwards which would break package feeds from (0:1.0-r10.45 to
0:1.0-r10.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dbg
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dbg
went backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dev
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dev
went backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-doc
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-doc
went backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-locale
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-locale
went backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-src
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-src
went backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package
volatile-binds-staticdev went backwards which would break package
feeds from (0:1.0-r0.40 to 0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package
volatile-binds-staticdev went backwards which would break package
feeds from (0:1.0-r0.45 to 0:1.0-r0.44) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds went
backwards which would break package feeds from (0:1.0-r0.45 to
0:1.0-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-dbg went
backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-dbg went
backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-doc went
backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-doc went
backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-locale
went backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-locale
went backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-src went
backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config-src went
backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config went
backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-config went
backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-start went
backwards which would break package feeds from (0:1.13-r0.40 to
0:1.13-r0.39) [version-going-backwards]
wcnss-config-1.13: Package version for package wcnss-start went
backwards which would break package feeds from (0:1.13-r0.45 to
0:1.13-r0.44) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dbg went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dbg went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dev went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dev went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-doc went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-doc went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-locale went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-locale went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-src went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-src went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-staticdev
went backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-staticdev
went backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]
weston-init-1.0: Package version for package weston-init went
backwards which would break package feeds from (0:1.0-r0.40 to
0:1.0-r0.39) [version-going-backwards]
weston-init-1.0: Package version for package weston-init went
backwards which would break package feeds from (0:1.0-r0.46 to
0:1.0-r0.45) [version-going-backwards]


count: 1 issue: host-user-contaminated
glibc-locale-2.28.9000: glibc-locale:
/glibc-binary-localedata-gez-et/usr/lib/locale/gez_ET/LC_MESSAGES/SYS_LC_MESSAGES
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


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
8c8ecec2 gitsmy.py: Fix unpack of submodules of submodules
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
ebc96f2f61 libtool: Fix ignoring compiler-rt libs
not included in master yet:
8df14b678e Change default debug split to make separate source packages
ac83d22eb5 arm-tunes: Remove -march option if mcpu is already added
a8ab788245 valgrind: Dont strip off -mcpu
bc79395e2f systemd: Update recent CVE patches
946f37d57f oeqa/manual: Add manual runtime 'compliance' testcases to json
f5083ba27e oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
8fe6728536 classes/icecc: Add ICECC_REMOTE_CPP variable
54cd9bd1b7 linux-firmware: recommend split up packages
973befb880 linux-firmware: split out liquidio firmware
35983262ca meta: add native and nativesdk variants to various recipes
to enable gtk+3-native/nativesdk
0070b50825 libepoxy: enable native/nativesdk variants
06451327a7 shared-mime-info: update the database also in native builds
f99921554f pixbufcache.bbclass: remove a dependency loop introduced by
enabling gtk+3-native
acc4f5d7f2 recipes: Add runit and related recipes
189b7ac42d oeqa: Recognise svlogd as another logger
252f21d32d glibc: Use master ( would be 2.29 release )
5465933bf5 binutils: Use master ( would be 2.32 )
2ce6e242d3 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
6ceb78f3f cpprest: update to 2.10.9, drop patches
not included in master yet:
12e66e89e openldap: improve reproducibility
5684e6aad yaffs2-utils: Set CLEANBROKEN
52e29be73 python-isodate: fix SUMMARY
d3d170eea python-rdflib: fix SUMMARY
9e9d9fb52 exo: upgrade 0.12.3 -> 0.12.4
914a0224d xfce4-whiskermenu-plugin: upgrade 2.3.0 -> 2.3.1
3593ada34 xfce4-battery-plugin: upgrade 1.1.1 -> 1.1.2
7c52d8ab7 libkcapi: Fix missing bash (for apps) and unneeded checksums
(for testapp) when building
7cf2f4996 libkcapi: Bump to v1.1.4
3893910f9 efivar: recommend required kernel module
f394ef48f civetweb: Bump to v1.11
f25ae4f0a nmap: Fix build with clang8/musl/libc++
cfb01aa31 libtdb: upgrade from 1.3.16 -> 1.3.17
36618f327 libmbim: Upgrade to 1.18.0
41817d8ae nodejs 8.14.0 -> 8.15.0
c049e0266 polkit: inherit distro_features_check
7735b4c80 ell: update to 0.17
fd7cd2b18 iwd: update to 0.14
12351cdd2 libvncserver: Update to latest commit post 0.9.12
bd6803523 libvncserver: make PACKAGECONFIG flags explicit
b4a91b39e sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
82abc2b qtbase: fix incomplete recipe changes from previous commit
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
0f62572 chromium: fix x11 dependency brought by at-spi2-core package.
not included in master yet:
624f984 firefox: Fix cmsghdr errors with musl
9dc8488 XXX
~/oe/world/yoe

