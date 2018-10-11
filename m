Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0647C6022F
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 17:28:09 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l9-v6so10785598qtf.5
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=KV40Ors2DaBH3lZagPLLdmr8Vc6kAATF3BO26gn4BcA=;
	b=QlJeR73R102I0dLZM6Om6gcOCeXEdS6VPlXVhmFp1oD/Ub1E8LmzrMgXHjbAY5fYum
	Pty6wXmWS3i4cgqy5CMeTjrcm45Lb8jILnDia79+1Y4NYXczI99d0V/5qrnbJrymJ7Rw
	0dW6fTaiXr2jXEItbyepaUufmZNKVI9906JqliKbAcaR6ASo0DYYbDPCts1yF/gq7M5u
	ib/w7QeiBNy/7cO3jg9gw88GsCl4XrqPcWotEv5f+8dogu3vR3csR2GIJfJVqazp05gs
	X0gFuSBrH7zWs6I2OFR4k1JFIBQyEfrwArO/tI6Wwi891gcbes/1hza5ufSVPPMAsmMJ
	78mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KV40Ors2DaBH3lZagPLLdmr8Vc6kAATF3BO26gn4BcA=;
	b=qS5CETN66JTcqVhBxThYf7no0E/YWLA4Nplyx33lRdBv2P8r+cDR9umqu3kfuFcuK9
	K66bHPGqaf/tq2jBL0IpcJasM1kSAaUE81FJHjLmdgLeMjPeWTPpgyognG9d3wNR+YaD
	84lcSbQD9knKBgYcfCZpxLKm6HCtquk1PnKwdOv/MlxWqeSp0RRcn/n9sIqi67bxqEqt
	oCZTLjJaHW78RQG6W6vlVQHrt9jokZew1sqFfeGwIiXxyZXS6mAq1Eu74axtAssC5ShE
	p4FueZ24gRY3OqJWB5udKwdjocf9ch/g1KdOrnwZkbOEXveDiMaLLUavrSx+CNtjIpuq
	pR0Q==
X-Gm-Message-State: ABuFfojexBXP5WB2c5QowAPRu1sDvRdp87xkkT/bGr+PDc5jXE/nug/O
	SReKgfGjm6elmJ1GnNKu/zy7z704sEzkFUE92FxcF641
X-Google-Smtp-Source: ACcGV63rx3da6CRFgKNrm4wt2DPjeluJ1AUyZJf4ICJAjphcHHQejel3Lv5lt5nm1UMw45YA/aQ3ZDOPYNJbLViKrlo=
X-Received: by 2002:aed:3031:: with SMTP id 46-v6mr2495256qte.29.1539278890266;
	Thu, 11 Oct 2018 10:28:10 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Oct 2018 10:27:44 -0700
Message-ID: <CAMKF1spQ3K0fHrFF9=7nXGPR3gsLFf+jtnrib4E4-VSZYdVJvA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-10-11
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
X-List-Received-Date: Thu, 11 Oct 2018 17:28:10 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2018-10-10 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181011_102118.log

=== common (0) ===

=== common-x86 (1) ===
    * sources/meta-freescale-3rdparty/recipes-bsp/u-boot/u-boot-boundary-fw-utils_2018.07.bb:do_fetch

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_package_qa
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=== qemuarm64 (1) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_71.0.3545.0.r589108.igalia.1.bb:do_compile

=== qemux86 (1) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (9) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181010_090138.log/
||
|-
|| qemuarm64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181010_160727.log/
||
|-
|| qemux86 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181010_090144.log/
||
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181010_184514.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (70) ===
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
||70 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181011_065446.log/


    * ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps


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


count: 0 issue: textrel


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 70 issue: version-going-backwards
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-cat went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-chroot went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-cpio went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-dd went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-dmesg went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-false went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-fstype went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-gunzip went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-gzip went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-halt went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-ipconfig went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-kill went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-kinit went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-ln went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-losetup went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-ls went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-minips went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-mkdir went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-mkfifo went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-mknod went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-mount went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-mv went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-nfsmount went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-nuke went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-pivot-root went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-poweroff went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-readlink went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-reboot went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-resume went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-run-init went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-sh went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-sleep went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-sync went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-true went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-umount went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-uname went backwards which would break package
feeds from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils went backwards which would break package feeds from
(0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package
klibc-static-utils-zcat went backwards which would break package feeds
from (0:2.0.4-r0.1 to 0:2.0.4-r0.0) [version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.8 to 0:1.0-r8.5)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.8 to 0:1.0-r8.5)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.8 to 0:1.0-r8.5)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.8 to 0:1.0-r8.5)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.8 to 0:1.0-r3.5)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.8 to 0:1.0-r3.5)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.8 to 0:1.0-r3.5)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.8 to 0:1.0-r3.5) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.8 to 0:1.0-r13.5) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.8 to 0:1.0-r13.5) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.8 to 0:1.0-r13.5)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.8 to 0:1.0-r13.5) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.8 to 0:1.0-r13.5) [version-going-backwards]


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
ac15028 main: Fix environment handling for UI module imports
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
d0d55ad libxml2: Make it compatible with externalsrc
not included in master yet:
6c60ccd testimage: Ensure opkg/apt test suites are run
8603d30 fixes

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
463fd3d nodejs: Revert unintended changes (not ready yet)
not included in master yet:
2d842ee glog: upgrade 0.3.4 -> 0.3.5
f818700 openvpn: enable sysvinit
8a71561 postfix: update to 3.3.1
ed5c1c1 openldap: Reproducibility: Remove user, hostname, pwd from
version string
c1b4548 crda: Fix usrmerge install path
e0c6a33 libmpdclient: update to 2.16
ccfe7ac libmpdclient: make TCP support optional
c249286 babeld: Add Babel routing protocol recipe
09ae486 openvpn: update to 2.4.6
aa19346 klibc-static-utils: really fix build for x86 with security flags enabled
8e3db63 crash: Update from 7.2.3 to to 7.2.4
62d21c0 nvme-cli: add recipe
b11ad53 gflags: add nativesdk to BBCLASSEXTEND
1b68e3e c-ares: add nativesdk to BBCLASSEXTEND
f72160a grpc: fix grpc_cpp_plugin interpfor nativesdk

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
0c7eb25 layer.conf: Add thud to LAYERSERIES_COMPAT
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
4f39525 chromium: Check for toolchain being clang as well for deciding
on is_clang
not included in master yet:
~/oe/world/yoe

