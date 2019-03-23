Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 135056C13D
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 23:15:17 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id k2so6552163qtm.1
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=OgbSK1EilwKD8YHqeml1Ychdm73xckxMJn6YsAvqzY0=;
	b=MD4LeqISZ/tFIm49yHNSA4rIY0/lK0u5Nnq/4H3JD6z4eB9qb3BsuAKGmNlOjzeqbP
	0v+TzQz5aUfqhS0ivVaSilfpCyzyC9H8cZHH6LLEbwTSTE4bLLC8x3l8xF5EOP6NDu53
	vn6pzcgAT8DiPVnrvbX9YXCd4mUs/r4l0H1XlzPMcuPxekIrc4+1AbVifxw0oU3jbgVe
	XuY4zWRvqPa7CYEkZj2kG8wnDIZrn6jfd4trLPbJomRlT8fvaGKty0miT2rTTomrG/UQ
	/sFyIBg9tF7fksc5ihtOcebtJqT5sO8tPVAkcQO2D+4auPiBrM0G7y5BJLyiK+u3LnCh
	uNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=OgbSK1EilwKD8YHqeml1Ychdm73xckxMJn6YsAvqzY0=;
	b=gHKTt0tNTjQ7pkFQQGyU1BIXB1Yy3FNcBgNZcJgIO1RfgSMHhOhDekH6q1Eoc5i8hy
	VZPIPfSwJ319Ag8EaVnsyCbCh70dbVEtT1QH3BYdDGred3h7HRXGs+FFZlXQvDvTdoB+
	ipqbD56fmVCcYBVvE1iz2pSoZsH4EKIP7cS3P1I6+X+iyV6EdvkDTpt8IkQyFzPrISKM
	LEWHxpxSoaBKw56zroCp50qf/TPdMS/0mhbiXhGjDValU/YlluVO61JkpTkvwHqB0h0c
	jd7tJVNGBZ7NB0Fk6/B0xVfkkN/y8Wv40cnQ+FBeXZwaB9Tc9ZOW+rzE2oul/SYXxxTR
	VIOw==
X-Gm-Message-State: APjAAAVCRfpJLpC5+z5Ec0LbZw3sPdXso3Schj/VAQ59DFL3cuK4C0Ct
	B8onin08O/j0UZBVNbn9X0kM8RUbd6RFosElJLnKWz0M
X-Google-Smtp-Source: APXvYqy00cUdE/v16twg99ZngTTljn9leliAMh+SgR5v3CHLUR98T0twN2X3Ue71+cMGSyHfZtvlSYnH3MksZ838m/4=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr14036676qte.196.1553382918608; 
	Sat, 23 Mar 2019 16:15:18 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Mar 2019 16:14:52 -0700
Message-ID: <CAMKF1srHHSWZ3M5cSwkdsArVV4JhGfsPxBpzk3d4MyL4bEtRqw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE World, 2019-03-22
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
X-List-Received-Date: Sat, 23 Mar 2019 23:15:18 -0000
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
||2019-03-22 ||11 ||12 ||11 ||13 ||0 ||0 ||0 ||1 ||3 ||0 ||42 ||3 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2019-03-22 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190323_160908.log

=== common (3) ===
    * sources/meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (8) ===
    * sources/meta-openembedded/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb:do_populate_lic
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (6) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.75.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (5) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.75.bb:do_patch
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_73.0.3683.75.bb:do_patch
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.33.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/ninja/ninja_1.9.0.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (47) ===
{| class=wikitable
|-
|| qemuarm || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190321_215508.log/
||
|-
|| qemuarm64 || 12 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190322_083451.log/
||
|-
|| qemux86 || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190322_065600.log/
||
|-
|| qemux86_64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190322_170754.log/
||
|}

=== PNBLACKLISTs (2) ===

=== QA issues (49) ===
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
||1 ||textrel
|-
||3 ||build-deps
|-
||3 ||host-user-contaminated
|-
||42 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190322_231438.log/


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
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
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


count: 1 issue: textrel
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
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


count: 42 issue: version-going-backwards
os-release-1.0: Package version for package os-release-dbg went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release-src went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went
backwards which would break package feeds from (0:1.0-r0.102 to
0:1.0-r0.101) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards
which would break package feeds from (0:1.0-r0.102 to 0:1.0-r0.101)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.152 to 0:1.0-r8.151)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.152 to 0:1.0-r8.151)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.152 to 0:1.0-r8.151)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-src went backwards
which would break package feeds from (0:1.0-r8.152 to 0:1.0-r8.151)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.152 to 0:1.0-r8.151)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.152 to 0:1.0-r3.151)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.152 to 0:1.0-r3.151)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.152 to 0:1.0-r3.151)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-src went backwards which would break
package feeds from (0:1.0-r3.152 to 0:1.0-r3.151)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.152 to 0:1.0-r3.151) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.152 to 0:1.0-r13.151) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.152 to 0:1.0-r13.151) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.152 to 0:1.0-r13.151)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.152 to 0:1.0-r13.151) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-src went backwards which would break package
feeds from (0:1.0-r13.152 to 0:1.0-r13.151) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.152 to 0:1.0-r13.151) [version-going-backwards]


count: 3 issue: host-user-contaminated
glibc-locale-2.29: glibc-locale:
/glibc-binary-localedata-ca-es/usr/lib/locale/ca_ES/LC_NAME is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
glibc-locale-2.29: glibc-locale:
/glibc-binary-localedata-ks-in/usr/lib/locale/ks_IN/LC_NUMERIC is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.29: glibc-locale:
/glibc-binary-localedata-sw-tz/usr/lib/locale/sw_TZ/LC_PAPER is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]


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
e1f25240 fetch2: Fix undefined variable issues
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
91e3b2a762 goarch: Add riscv64
not included in master yet:
9328559ad4 mesa: Update 18.3.4 -> 19.0.0
b3ac039971 insane: improve license checksumming logic
ce57bc0d35 libpcre: update patch status
ad1d982a40 qemu: fix CVE-2019-3812
5cc6a8d0b5 libcroco: fix CVE-2017-7961
55dd891648 python: fix CVE-2018-14647 in python-native too
5c9fd45fc2 libexif: disable documentation neatly
46e1a50d35 meson: warn if the default value from
meson.get_cross_property() is being used
4ecce097b4 meson: support multiple cross configuration files
264d43fb65 wayland: upgrade 1.16.0 -> 1.17.0
7d93d0897a glibc: fix CVE-2019-9169
a6336d408d glew: Fix build errors at recipes depending on glew
998e47fc9d llvm: Enable RTTI support in preparation for new mesa
83d6b09332 qemumips64: change tune to mips64r2
4149b4005f devtool: prevent starting git gc in background
57b8eb6063 ninja: upate to 1.9.0
ed20961e4a mdadm: add mdmon service to support Intel VROC
dbc674def4 mdadm: add udev rules to create by-partuuid for MD devices
d9e1f45ab6 udev-extraconf: move md* and dm* from mount blacklist
3a92812136 initramfs-framework: mount efivarfs to make Intel VROC work well
f54a902295 initramfs-framework: add lvm module
c4be279552 init-install: add support for install image to Intel VROC raid disk
6f06fcee1b init-install: fix a typo which will led delete section
failed when use sed
be6253ec45 linux-yocto: fix wrongfully used qemuarma15 in place of qemuarmv5
f878213b51 u-boot: install dumpimage and fit_check_sign in u-boot-tools
a4aa66ef64 recipes: Add runit and related recipes
f7f5009772 oeqa: Recognise svlogd as another logger
1732120cbb gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
27be61b11c cross-canadian.bbclass: Do not override LIBCOVERRIDE with
SDK libc override

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5ea50a047 packagegroup-meta-multimedia: Remove gst 0.10 related packages
not included in master yet:
01a7a7819 openconnect: update to 8.02
f096abd39 wolfssl: update to 3.15.7
5e70e778a mosquitto: update to 1.5.8
521a3b032 packagegroup-tools-bluetooth: fix rdepends
50979151e igmpproxy: update to 0.2.1
f38ae87b5 libev: update to 4.25
bac3f1dc4 libuv: update to 1.27.0
f216dadcd cppunit: update to 1.14.0
93ddf9927 cxxtest: update to 4.4
ad3e07a72 libgtop: 2.38.0 -> 2.40.0
440edf54e gvfs: 1.39.92 -> 1.40.0
4ce1fb535 utilities: Fix build failure with -Werror=maybe-uninitialized
6cb4e90fc python3-pillow: add 5.4.1
f0c1ee77d nodejs: fix target ldflags using
f67f786b0 nbench-byte: update SRC_URI
3a9b5f466 log4cplus: update to 2.0.3
eed2859e3 gyp: add recipe
10d4e414a python3-pylyrics: add recipe
c04704290 python3-kconfiglib: add
6b04815b4 cpprest: update to 2.10.11
74bab845c physfs: upgrade 3.0.1 -> 3.0.2
7ed921f88  recipes-support/libutempter: Fix the macro string concatenation.
57183b3ca imagemagick: fix typo in summary
61c73067c rsyslog: Update from 8.37.0 to 8.1903.0
02c72c25b sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
0b0a608 qtbase: let user decide how to link openssl to Qt5 libraries
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
ce064f7 chromium-ozone-wayland: ship libminigbm.so if it exists
not included in master yet:
~/oe/world/yoe

