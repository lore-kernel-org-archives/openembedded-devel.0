Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 492D47807B;
	Tue,  5 Sep 2017 12:27:43 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id o22so6759109vke.1;
	Tue, 05 Sep 2017 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Yg58h5cJL2SI5eRarmcPVEtVCtYY9Ph6p2RQthL/l+0=;
	b=IZzpqIeakVMzryn4cvxIiwAkEdMU0N3AvPrZJxstHkrSE2kfE+q5UzSodO073ugYjv
	u47UX7uzk2mRz+jYVfZmWfNDrz+MTp3OYumZgZVp97QnoZ+F/t9g0e2vsBhaeOxautOY
	TtzeP70qgDJsr6ES7Xk4L6GedNtDIkbDzR1/SRlYiVBHQI0up5iAGNzkHMiXJbXL8Jem
	9bayiDnrJrPSmKUmJP4NvWaxkmUXYgeJBJ2KBcYLlh3u5cZb7QG5LcVfYmbICUq3w2yN
	oTRqLSBIjjsS+2SHiF+AUdBXVQ/ojD4gqXYMAhFQy+BRCVszErhXA5UnZGcb00p/SZ66
	M0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Yg58h5cJL2SI5eRarmcPVEtVCtYY9Ph6p2RQthL/l+0=;
	b=nw3CsB/wibUPiIFwU9u9ztow8W7+EHPIVHqGnELOLA8xzJuiCy4mLtlMUSEPlzMxDk
	ipBtk5BI1D8Y0p6cQBCyRD+GDtp5pMZMxhJHbPgC1rhV2jq7tWXUC88vTql1fH8+pd5y
	SQXiG4s+YW48clkrFY0ydd3Ejy5tpAvprcxgOesGLDba8kFb8kN1pJWtJz8bYby0xkkl
	l3pYRRPcs6uOqf8grnJVr5BxV+giVYcDMHJH5X/bUbNuf12/c2bE+hx9X4JsLysAjV4Q
	hYsPccNdtBFK+cAk6hqreMojLZ1Au8N9bHn+ouaIkVZolq0zRGpX9IBLad5mFSh1Dcsq
	wKkw==
X-Gm-Message-State: AHPjjUhXCoktrkI5mdSJyhglTrOa0256TQngGb61o01gNad77RMWcr4E
	1ba3JtBosS24aHHkgfOq7EToaFD8gXJa
X-Google-Smtp-Source: ADKCNb6IkmWCkNhfQvo4I1FHh28T1nmnPGiJO8QEBMNwD5PsmXry1OGGxt1wumqiYru84N5HYT2t0hH0BWzLImysZyk=
X-Received: by 10.31.224.134 with SMTP id x128mr1927330vkg.1.1504614460740;
	Tue, 05 Sep 2017 05:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Tue, 5 Sep 2017 05:27:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Sep 2017 14:27:40 +0200
Message-ID: <CA+chaQc0LHs+h3ABA4hVHWmC4a4zeNCPmOd6buEko3LXrfhGSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-09-03
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
X-List-Received-Date: Tue, 05 Sep 2017 12:27:45 -0000
Content-Type: text/plain; charset="UTF-8"

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
||2017-09-03 ||3 ||3 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||415 ||2 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-09-03 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170905_020831.log

=== common (2) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    *
meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_git.bb:
do_fetch

=== common-x86 (0) ===

=== qemuarm (1) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (8) ===
{| class=wikitable
|-
|| qemuarm || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170902_204951.log/
|| http://errors.yoctoproject.org/Errors/Build/46191/
|-
|| qemux86 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170902_204951.log/
|| http://errors.yoctoproject.org/Errors/Build/46193/
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170903_234031.log/
|| http://errors.yoctoproject.org/Errors/Build/46223/
|}

=== PNBLACKLISTs (4) ===

=== QA issues (422) ===
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
||2 ||host-user-contaminated
|-
||415 ||version-going-backwards
|-
||5 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170903_195055.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
?= "Depends on blacklisted system-config-keyboard-native - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-qt5:
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


count: 5 issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 415 issue: version-going-backwards
gedit-2.30.4: Package version for package gedit-dbg went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-dev went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-doc went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-af went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-am went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ar went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ast went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-as went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-az went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-be+latin went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-be went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bg went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bn-in went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-br went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bs went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ca+valencia went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ca went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-crh went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-cs went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-cy went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-da went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-de went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-dz went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-el went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en-ca went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en-gb went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en+shaw went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-eo went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-es went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-et went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-eu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ga went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-gl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-gu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-he went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hy went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-id went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-is went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-it went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ja went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ka went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-kk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-kn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ko went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ku went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-la went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-lt went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-lv went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mai went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mg went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ml went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ms went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nb went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nds went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ne went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-oc went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-or went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ps went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pt-br went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pt went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ro went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ru went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-rw went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-si went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sq went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sr+latin went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sv went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ta went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-te went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-th went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-tk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-tr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-uk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-vi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-wa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-xh went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-cn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-hk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-tw went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-staticdev went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit went backwards which would
break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-dbg went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-dev went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-doc went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-az went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-cs went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-da went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-de went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-en-gb went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-es went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-eu went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-fi went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-fr went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-hu went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-id went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-is went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-it went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ja went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-nl went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pa went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pl went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pt-br went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ro went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ru went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-rw went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sk went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sr went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sv went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-uk went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-vi went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-zh-cn went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-zh-tw went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-staticdev went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2 went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-bash-completion went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-dbg went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-dev went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-ftp went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-doc went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-sftp went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-trash went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-af went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ar went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ast went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-as went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-be+latin went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-be went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bg went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bn-in went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bs went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ca+valencia went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ca went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-cs went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-da went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-de went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-el went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-en-gb went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-en+shaw went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-eo went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-es went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-et went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-eu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fa went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fur went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ga went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-gl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-gu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-he went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-hi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-hu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-id went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-it went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ja went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-kk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-kn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ko went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ku went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-lt went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-lv went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mai went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ml went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nb went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nds went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-oc went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-or went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pa went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pt-br went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pt went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ro went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ru went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sq went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sr+latin went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sv went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ta went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-te went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-tg went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-th went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-tr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ug went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-uk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-vi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-cn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-hk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-tw went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-staticdev went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs went backwards which would
break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-bin went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-camlibs went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-dbg went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-dev went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-doc went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-cs went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-da went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-de went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-es went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-eu went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-fi went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-fr went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-hu went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-it went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-ja went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-nl went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-pl went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-pt-br went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-ru went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sk went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sr went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sv went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-uk went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-vi went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-zh-cn went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-zh-tw went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-staticdev went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2 went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphotoport went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-dbg went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-dev went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-doc went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-af went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ar went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-bg went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-bn-in went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ca went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-cs went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-da went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-de went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-el went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-es went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-et went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-eu went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fa went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fi went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-gl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-he went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-hr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-hu went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-id went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-it went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ja went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ko went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-lt went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ml went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ms went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nb went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nn went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ps went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pt-br went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pt went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ru went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sk went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sv went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-tr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-uk went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ur-pk went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ur went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-vi went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-zh-cn went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-zh-tw went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-staticdev went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-aruco-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-aruco went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bgsegm-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bgsegm went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bioinspired-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bioinspired went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-calib3d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-calib3d went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ccalib-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ccalib went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-core-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-core went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-dpm-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-dpm went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-face-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-face went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-features2d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-features2d went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-flann-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-flann went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-fuzzy-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-fuzzy went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-highgui-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-highgui went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgcodecs-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgcodecs went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-img-hash-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-img-hash went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgproc-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgproc went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-line-descriptor-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-line-descriptor went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ml-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ml went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-objdetect-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-objdetect went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-optflow-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-optflow went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-phase-unwrapping-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-phase-unwrapping went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-photo-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-photo went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-plot-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-plot went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-reg-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-reg went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-rgbd-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-rgbd went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-saliency-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-saliency went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-shape-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-shape went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stereo-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stereo went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stitching-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stitching went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-structured-light-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-structured-light went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-superres-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-superres went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-surface-matching-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-surface-matching went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-tracking-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-tracking went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ts-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ts went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-video-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videoio-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videoio went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videostab-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videostab went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-video went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xfeatures2d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xfeatures2d went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ximgproc-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ximgproc went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xobjdetect-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xobjdetect went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xphoto-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xphoto went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-apps went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-dbg went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-dev went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-doc went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-locale went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-samples went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-staticdev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv went backwards which would break package
feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package python3-opencv went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which would
break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which would
break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]


count: 2 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT is owned
by uid 3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-nn-no.iso-8859-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
7234f33 cooker: Ensure parseConfiguration clears parsecache_valid
not included in master yet:
3ca419d world-image: add extra target
1e4c0af fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
dd75644 insane.bbclass: Warn if ${COREBASE}/LICENSE is used
not included in master yet:
ba0ece9 report-error: Allow to upload reports automatically
91ce1d7 buildhistory.bbclass: metadata-revs show repo parent
63337cc metadata-revs: provide more information
99c01ed qemux86: Add identical qemux86copy variant for tests
95364c1 reproducible_build.bbclass: initial support for binary
reproducibility
a03b5e3 cpio: provide cpio-replacement-native
51748e3 image_types.bbclass: improve cpio image reproducibility
6e998e7 rootfs-postcommands.bbclass: support binary reproducibility
61b23db insane.bbclass: write QA issues to log file only when they are in
ERROR_QA or WARN_QA
781b774 sstate.bbclass: Do not cause build failures due to setscene errors

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc != glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -> 1.13.0
f636b27 radvd: 2.14 -> 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -> 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -> 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -> 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with
clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -> 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy Makefile.in.in from gettext-native
ef87d81 lxdm: Copy Makefile.in.in from gettext-native
a541332 ndisc6: Fix build with clang and update to latest on git
88b25b5 mosquitto: add from meta-intel-iot-middleware and update
264cc34 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
55934c2 iptraf-ng: Add new recipe
0308d95 sblim-sfcb: Fix build with musl
65a1f34 libmtp: fix build issue
109e1e2 libexecinfo: fix complie issue
dafc329 pmtools: use update-alternatives for acpixtract
e91e2c3 openjpeg: upgrade to 2.2.0
0160874 vpnc: Reduce lifetime value to widely-compatible value
2ecb705 pam-ssh-agent-auth: Get newer version of config.sub and
config.guess scripts
9f94216 python-matplotlib: Upgrade to 2.0.2
24dab55 wireshark: update to 2.2.9

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:

