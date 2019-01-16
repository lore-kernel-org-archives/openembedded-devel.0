Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 85DB57C035
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:01:40 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id o8so3068768qkk.11
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=M8GfQqZy5qRegLPP1gGqB+3450ctb6uWkrhDZNeYHX4=;
	b=qIPZeQ5V0YjZ1er/V7oNNksAPMpK9zCO5c1BB8MFbkyE+wvrKntyZ1/sBOzNa5CLGp
	MjjVdb6Pu2PmVOyOujgtGXTlR2Q4NjKdx4kIoeFbv4oCUp0JIpGiD7jTEr/e7A2WZFLE
	juH5L0CvlbvNcUgzbQlncvWwxN+FiVcwcU06qvw5PTNKtYUadsE8X6T1d+TE7bdrPfmk
	yc2SfVPp5YoZICfN6Cvxd58HvOuxPckap9MXmkvsJOrAE/kgnhHAe72OycgRjWJEMnk2
	k47WmZ3z4emiJFKdzrSem/TDGHFe+2AMXdhDwnK6uf7wBTo8lEWM4OIe9q7bzDFnF3zo
	cIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=M8GfQqZy5qRegLPP1gGqB+3450ctb6uWkrhDZNeYHX4=;
	b=bJ2UCUL1H2v2BJHY3POZKlakLxw8pEm7L2MPWJcbsgGTHrr2QVeJscGdaQSyTAYOTF
	JbZJI66HI+XdXhdX6oMaT+VMsE3euLIpcY4QiKDooS2Q6VAjwAc9+jR3hQAc2epSCKBQ
	Ke9jBiNDs0vrJ5aHe6R/XPXDlxmHggSpbca9PogYnAyl8W11nu4MxSo54F5ExYh4S6KY
	oVHR0Ld131OEI3xyKL2NKSRz5r7PqNVZXq5PseteCbuTgyC6WtJS2CWBQwuHACoVJGIa
	8uxFbz9QRKtEl1QvCnklTwhJXHXzBjXYM3JNKcz4l0oWODpPH3aMfcA3RzOEPinixfRZ
	2esg==
X-Gm-Message-State: AJcUukcFZwNowcMxNHsw0fBv/D4XgLGVszkoyudRwfUHjlFI/rCQ+BSj
	4QvreyJ4Zgc3V1y4Iukz0BmgK68gn39esoi/YPTUMl6LHIs=
X-Google-Smtp-Source: ALg8bN7UXwEncqp83iFhUf3RYYrKTPxg/74LEtIc2EuEg9vBhnQlQCC5VZ4/niTHTPc20t+B5kHXifGha8KauFj/fkI=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr5404953qka.206.1547618500728; 
	Tue, 15 Jan 2019 22:01:40 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jan 2019 22:01:14 -0800
Message-ID: <CAMKF1sotBuWAOPzpbkeSGdB1YkPRDA_sHyy-6gSmT4bfA_rxPg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2019-01-15
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
X-List-Received-Date: Wed, 16 Jan 2019 06:01:40 -0000
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
||2019-01-15 ||7 ||9 ||6 ||8 ||0 ||0 ||0 ||1 ||4 ||0 ||0 ||1 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2019-01-15 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190115_214142.log

=== common (2) ===
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.31.1.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (4) ===
    * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (2) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/cargo/cargo_0.31.0.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_package_qa

=== Number of failed tasks (30) ===
{| class=wikitable
|-
|| qemuarm || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190114_101213.log/
||
|-
|| qemuarm64 || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190114_205201.log/
||
|-
|| qemux86 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190114_101223.log/
||
|-
|| qemux86_64 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190115_000202.log/
||
|}
./jenkins-job.sh: line 546: cd: too many arguments

=== PNBLACKLISTs (0) ===

=== QA issues (6) ===
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
||0 ||version-going-backwards
|-
||1 ||host-user-contaminated
|-
||1 ||textrel
|-
||4 ||build-deps
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190115_140523.log/


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


count: 0 issue: version-going-backwards


count: 1 issue: host-user-contaminated
glibc-locale: /glibc-binary-localedata-pap-aw/usr/lib/locale/pap_AW/LC_MESSAGES/SYS_LC_MESSAGES
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
52a144a7 bs4/element: Fix DeprecationWarning
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
06662be193 strace: add lost Upstream-Status
not included in master yet:
b9d780c7ee classes/buildhistory: display modified git branches
fa7020c040 perl: fix yet another race failure
ff01fcdf3c meta: Fix Deprecated warnings from regexs
4518c01a08 binutils: Use master ( would be 2.32 )
41315506af gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
6d29d2b359 glibc: Use master ( would be 2.29 release )
40f96ced68 recipes: Add runit and related recipes
32f037577c oeqa: Recognise svlogd as another logger

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
612128b46 dhcpcd: upgrade to dhcpcd 7.0.8
not included in master yet:
eb6cf3686 haveged: Upgrade 1.9.4
6fc561ce1 openal-soft: Upgrade to 1.19.1
1ed152e32 lockdev: Switch to use archive tarballs for SRC_URI
070fb5825 sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
82abc2b qtbase: fix incomplete recipe changes from previous commit
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
a01bbed chromium-x11: Update to 71.0.3578.98.
not included in master yet:
8410145 firefox: Fix cmsghdr errors with musl

