Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B21C7822A;
	Sun, 29 Oct 2017 14:03:05 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b9so11509452wmh.0;
	Sun, 29 Oct 2017 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jPaxnvX4FHylW+DetsEAfl/nP7Ik+10JYtGAP1HOxmU=;
	b=liXmCNs8q2iwS+L2JouwSWQCAUNTOo0A/ayStDcDn+MUxspq2/96spSYBHkvYAf3gM
	+YsXvlC7o1mTehi7VDcUsesNwGNu9rUm/MqyrpqWavNFHKFZGK1pXc7TchD8TWvFmipL
	7KjjABEnDm8KGrzIBVIJPwdYBZj8vmmJV2cMx1f06XZW4Zt77QqBhNVlPeRfuVTwjPlP
	3ammDdeUJD4YU9heP+RsX66NTpXkDo/t4b+EQpR/JaYHrhgTws4FleUxoiYzyZkt3Tlo
	sqXUJeA8VNu7YHU8HXjHFeZ1KzmOadr26FGicV9+qKFBoLpaT82Z5RQELGATBfqz3Wa7
	SkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jPaxnvX4FHylW+DetsEAfl/nP7Ik+10JYtGAP1HOxmU=;
	b=WvQhdgg4yh8SBTTGnhzGx0BUoOEngE1GaEG9EOR8x6IbhgZHSicYwBW4ShnbfNk+0z
	aXg92a1rslRRBjyLsftxRkPqx24mqxtf0j2+PhsVGCvhSMW8xnvyMW/CcOzYubwkzJS1
	osja4cm3hkeR8ADXtR/9HLcwB4asY5xJCFBYcsg+gdPrvN0fosDc7hsQNOH3znxxBosb
	yF41y5ikvXxnUmRaCPG/dTAsOZ2Y0MYDUDh/K4ER8dzaaVpjQAXbdD1h6xU5aPt/P4PP
	rvxzlNMeLHeT7zL5+c5p/hCNlqfOBqv3ShoHtmagN7wf65+wzy8WkkSmFinx2lTDNK8x
	tjhg==
X-Gm-Message-State: AMCzsaVCY5J5VPHF9Xm+lJ/KRgt6ZK8WzR0GTskw1YL4/vQH4jTLj8Oa
	ccrqFe4o4cP9CKhYAZT9Ky0MP11Ef0APARrF0cKVew==
X-Google-Smtp-Source: ABhQp+Tvu+EvDabDQCPAQdQ1gCMAi/eK2KGV52eWdXYZgrGXNL7Me/5iF5LN7MkD11pZA20Y3RLx3CkgZl2YlZDMyjA=
X-Received: by 10.28.58.81 with SMTP id h78mr1618378wma.10.1509285785431; Sun,
	29 Oct 2017 07:03:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Sun, 29 Oct 2017 07:03:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 29 Oct 2017 15:03:04 +0100
Message-ID: <CA+chaQeH4D1Kds-zGmFvFroueyjVRsHfg1KFbQaK8pPOsjjpBA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-10-27
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
X-List-Received-Date: Sun, 29 Oct 2017 14:03:07 -0000
Content-Type: text/plain; charset="UTF-8"

This is first report which includes qemuarm64 MACHINE.

Next one will use musl for qemux86 build (other MACHINEs will continue to
use default glibc).

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='4'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all ||already-stripped
||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||qa_pseudo ||
|-
||2017-10-27 ||4 ||7 ||1 ||1 ||0 ||0 ||0 ||3 ||0 ||0 ||0 ||5 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||83 ||
|}

== Failed tasks 2017-10-27 ==

INFO: jenkins-job.sh-1.8.39 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171029_035859.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:
do_package_qa

=== qemuarm64 (6) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:
do_compile
    *
meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:
do_compile
    *
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:
do_install
    *
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_package_qa

=== qemux86 (1) ===
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
do_package_qa

=== qemux86_64 (1) ===
    *
meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa

=== Number of failed tasks (13) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171027_092326.log/
|| http://errors.yoctoproject.org/Errors/Build/47783/
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171028_211559.log/
|| http://errors.yoctoproject.org/Errors/Build/47836/
|-
|| qemux86 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171027_091257.log/
|| http://errors.yoctoproject.org/Errors/Build/47784/
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171027_133824.log/
|| http://errors.yoctoproject.org/Errors/Build/47787/
|}

=== PNBLACKLISTs (1) ===
=== QA issues (91) ===
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
||0 ||version-going-backwards
|-
||3 ||textrel
|-
||5 ||host-user-contaminated
|-
||83 ||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171028_203040.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
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


count: 3 issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 0 issue: version-going-backwards


count: 5 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase:
/qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: qtquickcontrols2:
/qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQuick/Controls.2/Material/qmldir
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript:
/qtscript-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 83 issue: qa_pseudo
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/i586-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/i586-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/i586-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/armv5te-oe-linux-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
python3-smmap-0.9.0: This
/work/core2-64-oe-linux/python3-smmap/0.9.0-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
python-vobject-0.9.5: This
/work/core2-64-oe-linux/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
qsiv-1.1: This /work/i586-oe-linux/qsiv/1.1-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/i586-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/core2-64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
qt5nmapcarousedemo-1.0: This
/work/core2-64-oe-linux/qt5nmapcarousedemo/1.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/i586-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/core2-64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/i586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/i586-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/i586-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 25 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/i586-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/i586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/i586-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/i586-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/i586-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/i586-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/i586-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/i586-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/i586-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/i586-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/aarch64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/i586-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/armv5te-oe-linux-gnueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/i586-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/aarch64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary
reproducibility
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:
ebcef48 bridge-utils: modify the AR to cross toolchain

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:
197811b qtwebengine: make test suite succeed

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

