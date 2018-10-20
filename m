Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 218D879D13
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2018 14:49:37 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id l41-v6so41571638qtl.8
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2018 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=SVZU/htsZKn3HSrJLPI2nCzBjkVBy9nKMHmCkxwhGYk=;
	b=Tx5lmT30aAzNy+HX1sSx1pmvSRDqYHI2pXdQ56ZF8F3v3TEMsAp5g5chqTEZg4trLC
	9PXmE9o/np+q3rBUsoH9+iDlCdJrfTQGNfsY/NRiyth/AJWamC0GmegL71FEPBi10iuM
	jaE7Xk5itMeYjeVZGQxV+fuSsOXbUzFbltmhGBUZV1Wetgdr4TklHPcWExNkxbEM3me7
	S5zLbmSd4jP63+LySNag6fWRyNWAsbG08YhTa4S7aExH+xPxDIaMTZBi1DaQ/4xLppud
	fbn3Qb0HVJYbU1t/40esX2gbHDzR5HhVSRcnwolkVYM+FQZNBmOB0CMfza2sUuZHthUb
	M8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=SVZU/htsZKn3HSrJLPI2nCzBjkVBy9nKMHmCkxwhGYk=;
	b=bpuM97ekLaSep1ONPoajbV2Rj5xgr2Ar+958EtokwuKWaTjo3EcrGKGM426vxs52Z/
	0AGPtJsKbdjWxC0iIc5NGrSDzmPz0c96LmOI1j8tmyJO/NM6xgMiDmfhTe+TzGey3XDn
	+nKBNy0vdw9uDRbuzaJ5hXmJWGtChgNibov+anB9/7YEzz5HtssHzvYK1ydVnGhLzYSy
	hNd9om9rbJ6AqsUVlYQYJhAxGx0g9a1ullrwPVZTpLseziFr8CQeSK+wIerqVwouJh+1
	EgG7SvGYuJyK+ytqJ7nMBRe9mdOaFZjzgavl0rvDLPR3+XHoJozY6m6X9bG+pPibwANH
	wXaQ==
X-Gm-Message-State: ABuFfoih0A34Qq7LnL4HpzzvvC0VcKj6Vb1OS4geaBpf19UL2dHc2AZB
	jUIu2h7/f+SyQ3y6jqOM8Nh+hSSCCDEFgBrJOGKE0fOnNYOBJw==
X-Google-Smtp-Source: ACcGV61J/ZJY8WXIf2592IFmvh37MI1M8F46NabzG9M5Mh/ZB9NG0K6b4PKe488OXQ6AfUry8FvVBySM7flU88UFQxU=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr22879758qvd.224.1540046977468;
	Sat, 20 Oct 2018 07:49:37 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Oct 2018 15:49:11 +0100
Message-ID: <CAMKF1spCL_xjQrs7NLuQhM_m1eGJNb7bQP+ASa+3v-FEzmwbhA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-10-20
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
X-List-Received-Date: Sat, 20 Oct 2018 14:49:37 -0000
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
||2018-10-18 ||4 ||0 ||2 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-10-18 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181020_074622.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_package_qa
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile

=== qemuarm64 (0) ===

=== qemux86 (2) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb:do_compile_ptest_base

=== qemux86_64 (0) ===

=== Number of failed tasks (6) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181018_071705.log/
||
|-
|| qemuarm64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181018_180151.log/
||
|-
|| qemux86 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181018_071711.log/
||
|-
|| qemux86_64 || 0 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181018_192657.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (0) ===
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
||0 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181019_141025.log/


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


count: 0 issue: version-going-backwards


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
5463c16 test/data: Add new tests for task checksum changing/not changing
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
1127759 qemux86/gstreamer: Move kernel module recommendation to the
machine configuration
not included in master yet:
bde0e52 systemd: Remove items that made this machine (qemu) specific

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
d7d0cc5 nodejs: Enable system ICU support
not included in master yet:
5559ea5 cpuid: upgrade 20170122 -> 20180519
e6978e6 glog: enable building shared library again
336242e keepalived: remove update-rc.d settings
fc26880 Khronos: Add Khronos LICENSE
7eb7a22 zlog: fix up library path for multilib
dd2f7c1 wireshark: update to 2.6.4
7023d0f cpupower: Update LIC_FILES_CHKSUM
1d7ae74 catch2: new package
256de49 opencl-headers: Initial recipe for OpenCL headers
bc14dcc sharutils: CVE-2018-1000097
b461c40 opencl-icd-loader: Initial recipe for OpenCL ICD loader
d6bd1ed dracut: 048->049
02fd051 hwdata:0.315->0.316
df9f15c ipc-run: 0.99->20180523.0
107eefe python-requests: fix CVE-2018-18074
e499d11 gnulib: Security fix for CVE-2018-17942
3e6226f strongswan: upgrade to 5.7.1
104a87a libnet-dns-sec-perl: add recipe for 1.10
632a6d1 libnet-dns-perl: upgrade 1.17 -> 1.18; enable ptest
56fe12a udisks2: Upgrade to 2.7.8
9981811 gstreamer: Remove machine specific append
60a8ded libeigen: update to 3.3.5
a5591f7 radvd: remove update-rc.d settings
897c10b vim: alternatify xxd
cdd3e9a toybox: Fix paths to match OE conventions

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
5832bf2 qtbase: don't use thumb for armv[45]
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
75640e1 chromium-ozone-wayland: Fix libdrm on glibc >= 2.25
not included in master yet:
~/oe/world/yoe

