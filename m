Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id B9C9560938;
	Mon, 28 Aug 2017 08:40:16 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id s199so14036479vke.1;
	Mon, 28 Aug 2017 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LjFudcJVSORDaf7uEnhbmfF2ozmL6DUg161kiZaQtOU=;
	b=AXSAhFOQ4L+VyPU4KC3E0st88n3yHY1+ym2aa37ZoruHwG736JW9OkBYu9L06V+z09
	wfpwYuqsQhARImHvR7NFrN+DuGqHdswZKfc54Z9Dxbwwrsddbs8PD1m9D4kAkd2yTeOS
	8v+PU+TYXpvve9PCrGNxY+HBAeNCiWKVeVjhVVQqerH7fYl3sYaru0QzBsZgOLegVx3l
	0hXH1OU8rRDcFJ2T++Yfp4ceT55vf6r9OuZjQU0OBBLnbe3JPT8j050dWlvUb+ACOk98
	0s+AgbB/lhURhbtcOpyps6umXy6OMIw4OMMDYcxkxZ6m+F4HpRwG+VDV+cQYkRxp75Fc
	GXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LjFudcJVSORDaf7uEnhbmfF2ozmL6DUg161kiZaQtOU=;
	b=cZmuCBvdkirOgXheuM8k20SFsGtK26b2mZm/yUmoUbE0LR+8XMckVUK9lot73HLzFg
	oQ5SJlNo7kuiQ+df1c5+iZRH/QXO0/uInRm+BLAl+c14r0RrSfSGNRfKwll3Xql5FC57
	a16722uZhNVxq7hfKeh7SkQvKgtuJkAasQDO6ycV+GhLZiFGxcUeRrlVIN9kBe5lV3ht
	KTibHuubn/lVkvYSzAhw2eNd6qwwA8S7brNrndeyC7OQhbYmsseTVtz+W80eFQLW14C0
	vfgepJcc3y+l1OTTb0nJnNIMZhB2iuXS/LQ3tc5FCc1tMvk7z9topgWDkDkMTfKUNhRj
	F7Rw==
X-Gm-Message-State: AHYfb5gEILKFNd5lZs0Q8qhKrwkPCsQIb8JFgd2XktuomxVRvCbAkzmo
	ZvjBUVM9jIuRJgx0GrwFdwXvymPUHXpF
X-Received: by 10.31.140.77 with SMTP id o74mr3464154vkd.1.1503909614273; Mon,
	28 Aug 2017 01:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 01:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 10:40:13 +0200
Message-ID: <CA+chaQcTA-CFVHj0ycyyc2JCn5O1cLeMGrrFB=VLkL2mipvcvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-08-26
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
X-List-Received-Date: Mon, 28 Aug 2017 08:40:17 -0000
Content-Type: text/plain; charset="UTF-8"

This one is with qt 5.9.0

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='3'|Failed tasks    !!|Signatures  !!colspan='14'|QA
!!Comment
|-
|| ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||
|-
||2017-08-26 ||9 ||10 ||7 ||4 ||0 ||0 ||3 ||0 ||2 ||232 ||2 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-08-26 ==

INFO: jenkins-job.sh-1.8.27 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170827_223414.log

=== common (6) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    *
meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa
    *
meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:
do_compile

=== common-x86 (1) ===
    *
meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb:
do_compile

=== qemuarm (3) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:
do_compile
    *
meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb:
do_compile

=== qemux86 (2) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170827_015147.log/
|| http://errors.yoctoproject.org/Errors/Build/45890/
|-
|| qemux86 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170826_080521.log/
|| http://errors.yoctoproject.org/Errors/Build/45886/
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170826_231146.log/
|| http://errors.yoctoproject.org/Errors/Build/45891/
|}

=== PNBLACKLISTs (1) ===
=== QA issues (239) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
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
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||232 ||version-going-backwards
|-
||2 ||file-rdeps
|-
||2 ||host-user-contaminated
|-
||3 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (4) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170827_050201.log/
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 3 issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 2 issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync
requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync?
[file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package
corosync requires /tmp/hosttools/bash, but no providers found in
RDEPENDS_corosync? [file-rdeps]


count: 232 issue: version-going-backwards
abiword-3.0.2: Package version for package abiword-clipart went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-dbg went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-dev went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-doc went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-locale went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-meta went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-applix went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-babelfish went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-bmp went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-clarisworks went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-collab went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-command went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-docbook went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-eml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-epub went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-freetranslation
went backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-garble went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-gdict went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-gimp went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-google went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-hancom went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-hrtext went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-iscii went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-kword went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-latex went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-loadbindings went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mathview went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mht went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mif went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mswrite went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-opendocument went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-openwriter went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-openxml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-opml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-paint went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-passepartout went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-pdb went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-pdf went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-presentation went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-s5 went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-sdw went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-t602 went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-urldict went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-wikipedia went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-wml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-xslfo went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-staticdev went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-strings went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-systemprofiles went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-templates went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-dbg
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-dev
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-doc
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ca went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-cs went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-da went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-de went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-el went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-en-gb went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-es went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-et went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-eu went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-fi went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-fr went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-gl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-he went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-hu went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-id went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-it went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ja went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ko went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-nb went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-nl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pa went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pt-br went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ro went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ru went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sk went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sv went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-th went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-zh-cn went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-zh-tw went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-staticdev went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates went
backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-dbg went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-dev went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-doc went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-am went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ar went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ast went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-as went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-az went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-be went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bg went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bn-in went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bs went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ca+valencia went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ca went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-cs went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-cy went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-da went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-de went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-dz went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-el went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-au went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-ca went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-gb went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en+shaw went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-eo went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-es went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-et went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-eu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ga went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-gl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-gu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-he went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-id went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-is went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-it went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ja went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ka went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-kn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ko went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ku went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-lt went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-lv went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mai went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ml went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ms went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nb went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ne went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-oc went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-or went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pt-br went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pt went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ro went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ru went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-rw went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-si went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sq went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sr+latin went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sv went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ta went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-te went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-th went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-tr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ug went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-uk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-vi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-wa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-xh went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-cn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-hk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-tw went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-staticdev went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libcamel-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libcamel went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libebook-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libebook went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libecal-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libecal went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-book-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-book went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-cal-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-cal went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserver-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserverui-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserverui went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserver went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dbg went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dev went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-doc went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-locale went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-staticdev went backwards which would break package
feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl went backwards which would break package feeds from
(0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dbg went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dbg went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dev went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dev went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-doc went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-doc went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-staticdev went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-staticdev went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-locale went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-locale went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-mkspecs went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-mkspecs went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmldesigner went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmldesigner went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins-dbg went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins-dbg went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-staticdev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-staticdev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]


count: 2 issue: host-user-contaminated
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libIos.so is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libQmlProjectManager.so is owned
by uid 3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:
a064963 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf being
added)
not included in master yet:
338cc89 report-error: Allow to upload reports automatically
f492b98 buildhistory.bbclass: metadata-revs show repo parent
eb590e9 metadata-revs: provide more information
7860d90 qemux86: Add identical qemux86copy variant for tests
9fdb66a reproducible_build.bbclass: initial support for binary
reproducibility
097476c cpio: provide cpio-replacement-native
c3b689d image_types.bbclass: improve cpio image reproducibility
cbd025c rootfs-postcommands.bbclass: support binary reproducibility
c0f57c9 insane.bbclass: write QA issues to log file only when they are in
ERROR_QA or WARN_QA

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:
6ff499b dnsmasq: disable the service by default
ca0e943 rdate: Fix build with hardening
7e3d8e4 strongswan: Include stdint.h for uintptr_t
217431e netkit-rpc: Fix build with hardening flags
f3819cc netkit-telnet: Fix build with hardening
048e071 ncftp: Upgrade to 3.2.6
61495a9 autofs: Add build dependency on libnsl2
96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
7feddb1 security_flags.inc: Delete
a4723a6 pptp-linux: Upgrade to 1.9.0
ab4774e ebtables: replace ebtables-save perl script with bash rewrite
3a96b76 pimd: Upgrade to 2.3.2
aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
92bc7d2 rdate: Define logwtmp if libc != glibc
a04b53f netkit-ftp: Include sys/types.h for u_long definition
feb1653 postfix: Disable nis support on musl
93ee634 zeroconf: Fix build with musl
163c868 netperf: change SRC_URI to git repository
4c2b4c4 ippool: Fix build errors found with hardening flags
5ebba48 openflow: Fix build with musl
610e392 xl2tpd: Update to 1.3.9
53982a0 c-ares: update 1.12.0 -> 1.13.0
b101101 radvd: 2.14 -> 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -> 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
cc37aef python3-blivet: add recipe 2.2.0
ad94afe python3-blivetgui: add recipe 2.1.5
47fb79b librcf: Add -latomic to LDFLAGS
6599b98 upower: update 0.99.4 -> 0.99.5
b720216 geany: update 1.30.1 -> 1.31
29805cb geany-plugins: update 1.30 -> 1.31
c94d8e7 python-wrapt: update to version 1.10.11
69a7670 python-cmd2: update to version 0.7.6
353a2ab python-sqlalchemy: update to version 1.1.13
363c33c python-pytest: update to version 3.2.1
38c6ecb python-pyro4: update to version 4.61
07c7d83 php: move to version 7.1.8 from 7.1.7
03eaf98 gsoap: Upgrade to 2.8.51
16a43c3 caps: Mark ARCH empty
5d25280 mailcap: upgrade to 2.1.48
17dbbb3 mailx: Force mailx to build with openssl10
ac85ad1 php: disable this version by default
7b9dfb7 freeradius: Upgrade to 3.0.15
4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108
a99294b vlock: add new recipe
1e2f4b9 fontforge: update to 20170731 to fix CVEs
5567b2a wireshark: 2.2.7 -> 2.2.8
632f250 start-stop-daemon: Only create a link in ${base_sbindir} if
necessary
d8811b9 python-chardet: Extend to native and nativesdk
ebd41b0 openobex: disable building documentation
ac15d80 openwsman: rename to 2.6.3
da135d6 iproute2: add bbappend for supporting tipc tool
cebccb3 tipcutils: add runtime dependency for iproute2-tipc
f920d63 mariadb: 5.5.55 -> 5.5.57
64ee547 rsyslog: fix CVE-2017-12588
cc02e10 rsyslog: install logrotate configuration file into correct location
56d6e0a libvpx: upgrade to 1.6.1
a4ee06b quagga: update to 1.2.1
961abc1 gd: update to 2.2.4
cb686c3 efivar: Upgrade to 0.31
3706ca2 openvpn: 2.4.2 -> 2.4.3
de9860c python*-ptyprocess: add v0.5.2
fab2dd5 python*-pexpect: add v4.2.1
543455e ipsec-tools: fix CVE-2016-10396
6c775f9 multipath-tools: add bash to RDEPENDS
5141a9b python3-pykickstart: tweak shebang to python3
52f0eb1 xmlrpc-c: add perl to RDEPENDS
92d6a0f phpmyadmin: upgrade to 4.7.3
3716024 pcsc-lite: Update to 1.8.22
d3af646 python-requests: Update to version 2.18.4
e3057cc sthttpd: update to 2.27.1
c9f10ab glibmm: fix perl path
3a8e526 postgresql: update to 9.4.13
4c2ea5a Dhrystone: add recipe 2.1
c2a4bdf makedumpfile: update to 1.6.2
6ce999e mozjs: customize HOST_CFLAGS
f3e09bd adduser: use get_perl_version instead of PERLVERSION
a17cffb iperf3: 3.1.3 -> 3.2
40916b0 webmin: add systemd service file
598c29c python-markupsafe: Extend to build native version too
a7f2d3a vim: update to 8.0.0983
9756937 python-m2crypto: Upgrade to 0.26.0
87f7ea5 gnulib: upgrade to 2017-08-20.18
0c7c8fb collectd: 5.7.1 -> 5.7.2
54b071b netcf: upgrade to latest 0.2.8
0c0ef1d tftp-hpa: add systemd unit files
d1f41a0 gperftools: fixup HOMEPAGE
8f5ed1d openconnect: fix parallel compilation failure
5d15b1c gnome-keyring: Fix compatibility with gcr 3 in oe-core
863d51e openconnect: upgrade to 7.08
4dd9884 gflags: add runtime dependency on bash
f3fc0cc logcheck: update to 1.3.18 and move to meta-perl
3815615 python-pycrypto: Security fix CVE-2013-7459
3d85015 logwarn: set correct paths and add missing dependency
c2dbb9b openldap: fix native LDFLAGS build error
166bf62 xorg-fonts-100dpi: unblacklist recipe
a60ac1c recipes: remove blacklisted recipes
69529c6 meta-ruby: remove this now pretty empty layer
61e8314 meta-efl: remove this now pretty empty layer
07ed328 meta-systemd: remove this now pretty empty layer
7b0f2ca meta-gpe: remove this now pretty empty layer
73eccec imagemagick: 7.0.5 -> 7.0.6_9
524e123 libmodule-build-perl: upgrade to v0.4224 and fix qa error
05db9b0 enscript ndisc6: specify target location of perl
51c6073 python*-pylint: upgrade to v1.7.2 and fix qa error
75ba188 python*-astroid: use SPDX compatible license identifier
5332d4f mpich: Define PERL variable and pass to configure
5c2bbb5 wireguard-tools: Add bash to rdeps
3b00593 enscript: Define PERL variable
9773412 udevil: Add missing rdep on bash
ac8a952 libbonobo: Pass PERL_PATH to do_configure
bbcaa21 openl2tp: Add bash to rdeps
2e5566d python-paho-mqtt: licensing improvements
535065f python-paho-mqtt: fix downloading during do_compile
cd3949d libhugetlbfs: Define HUGETLB_LDSCRIPT_PATH
1a7fdc6 efibootmgr: Upgrade to 0.15
c814630 efivar: Fix build with clang
155a8a1 evolution-data-server: Fix build with clang
aeabfe1 wvstreams: Fix parallel build
f7c8d6b squid: Disable format-truncation warning only with gcc
95ba434 squid: Fix QA errors about wrong perl interpreter
4fb1f38 libreport: fix typo of SRC_URI
652998f python-html5lib: add Python3 support
a6fbb22 python-webencodings: add Python3 support
da14eb2 python-beautifulsoup4: add new recipe for both python2 and python3
c01288b multipath-tools: RDEPEND on bash
ca1e184 wireguard: Upgrade to 20170810 snapshot

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata
3963daa qtwebkit: Backport a patch to fix build with icu-59
7efcea9 qt3d: Fix build with clang
c74e5b8 qtbase: remove qtbase-native from DEPENDS
1619723 gstreamer1.0-plugins-bad: add qt5 packageconfig
d82317c qtbase: refresh the patches
246ec7b qtwebengine: refresh patches
142f888 qt3d: refresh patches
3522d3d qtbase: fix Krogoth build regression from efa8aaf
d9f4b6e meta-toolchain-qt5: don't rely on COREBASE/LICENSE
209e7e6 qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation,
qtwayland: disable gold to work around binutils bug
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing
support
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

