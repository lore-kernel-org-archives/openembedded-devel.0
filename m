Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C902E78B92
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 17:55:12 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id x18-v6so14140334uaj.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=L+8MKlaBOtQBK5iOtJLkhegSjiRE1v7pUjPAUSS2HwA=;
	b=edf6/Fvv+Px2SQNDdynD5wrKDzzQFQ1C8UJRK0+SHFUyvOyCGf/jr55YvN7iC+bU4a
	dYqPYmzvhlj792ZDeXG9KJm6Wm7e5rdqB9LwGwMU4M3wDmtNRw/KHtknnVBld5JJm7dT
	BkTlN9TJoWsKtbc0JjEWDUI5/Y0hizrRSbNBiZanqjYugjcqUPaFrLdHe8XcftEM4S75
	DTYr3Q00/q0lVwFCMpHnz0pPZBzm+maRN+9yvyvmxisOYuxinVZt1QUjfaBRiUnuJd7S
	xC0PKrDqxWiz9SxIp77F+fgi5Ox6eG+Wj3G4nYrlIN9oC6n+d3akkuTvT4gOyvVKFKsF
	ttPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=L+8MKlaBOtQBK5iOtJLkhegSjiRE1v7pUjPAUSS2HwA=;
	b=LM1LvS1NQFTkNq85BL7TvwiLdTqqplUS0AlXJiTTvBpThzYvd5f5D0vIGABsj2WWXz
	oGYajYo8jV2fuJO6sLj4ePwG/hAZQDh/dIbCnsBCsB7upbBQ85toEnh/LbDQfGRqkDv5
	fXgx+RjLMo+/YaOx3x0vhmI0au/P1huvT8DjIz1clTjylsslWjpbSMEWcDlPGIoMnQjh
	+ZA33g4FHczqZZJWVrNA79/Ea3mfGa9gzD9E3phoGA/A2cI6oNVXp66kCD6VG/kX0EtK
	tlr611+ZdBsH8yYhnhtmDfK2Q6Eso+oplL0a5Q6VRilOsvuoGyzR7Az48QY6WdGzPneo
	Dbuw==
X-Gm-Message-State: APt69E0k/slFYoVNiL43hWN12u/UkvCCtL9TdFpVfafvpgsPO4HUJzf5
	3Xt3WNFbAldM4fhinAboWbSRcIN9WoFC7jFt+K+rUA==
X-Google-Smtp-Source: ADUXVKKdGEfWWvrq6f3oOfNIShmmjFQ7IcFd1GJmUsPkNMazSMtSXsiJx85MdnqK4kX/Y2MoH+RWIX8xZjADnTNdBok=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr125348uac.164.1528739712905; 
	Mon, 11 Jun 2018 10:55:12 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jun 2018 10:54:46 -0700
Message-ID: <CAMKF1srcip24OkB-3HcsjxTuY=Tg9-AV5kmc4iGq52cXUgxrxw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-06-11
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
X-List-Received-Date: Mon, 11 Jun 2018 17:55:13 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2018-06-11 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180611_074339.log

=== common (8) ===
    * sources/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb:do_configure
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.0.2.bb:do_compile
    * virtual:native:sources/meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb:do_compile
    * virtual:native:sources/meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb:do_package_qa

=== qemuarm (7) ===
    * sources/meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/rdma-core/rdma-core_18.bb:do_install
    * sources/meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb:do_package

=== qemuarm64 (6) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb:do_fetch
    * sources/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb:do_fetch
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa

=== qemux86 (17) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-support/rdma-core/rdma-core_18.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (2) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb:do_compile

=== Number of failed tasks (78) ===
{| class=wikitable
|-
|| qemuarm || 15 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180611_045942.log/
||
|-
|| qemuarm64 || 18 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180611_055718.log/
||
|-
|| qemux86 || 28 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180611_045951.log/
||
|-
|| qemux86_64 || 17 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180611_055701.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (40) ===
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
||1 ||installed-vs-shipped
|-
||1 ||unknown-configure-option
|-
||32 ||version-going-backwards
|-
||3 ||build-deps
|-
||5 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180611_065634.log/


    * ERROR: Nothing PROVIDES 'mpeg2dec' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'mpeg2dec' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'ffmpeg' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps


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


count: 5 issue: textrel
ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test'
has relocations in .text [textrel]
ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.6-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace'
has relocations in .text [textrel]
glide-0.13.1: ELF binary
'/tmp/work/i586-bec-linux-musl/glide/0.13.1-r0/packages-split/glide/usr/bin/glide'
has relocations in .text [textrel]
go-dep-0.4.1: ELF binary
'/tmp/work/aarch64-bec-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test'
has relocations in .text [textrel]
go-dep-0.4.1: ELF binary
'/tmp/work/i586-bec-linux-musl/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep'
has relocations in .text [textrel]


count: 3 issue: build-deps
hiawatha-10.7: hiawatha rdepends on mbedtls, but it isn't a build
dependency, missing mbedtls in DEPENDS or PACKAGECONFIG? [build-deps]
mbedtls-2.9.0: mbedtls-programs rdepends on hiawatha, but it isn't a
build dependency, missing hiawatha in DEPENDS or PACKAGECONFIG?
[build-deps]
mbedtls-2.9.0: mbedtls rdepends on hiawatha, but it isn't a build
dependency, missing hiawatha in DEPENDS or PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 32 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.1 to 0:1.0-r8.0)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.1 to 0:1.0-r8.0)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.1 to 0:1.0-r8.0)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.1 to 0:1.0-r8.0)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.1 to 0:1.0-r3.0)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.1 to 0:1.0-r3.0)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.1 to 0:1.0-r3.0)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.1 to 0:1.0-r3.0) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.1 to 0:1.0-r13.0) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.1 to 0:1.0-r13.0) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.1 to 0:1.0-r13.0)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.1 to 0:1.0-r13.0) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.1 to 0:1.0-r13.0) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 1 issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 1 issue: unknown-configure-option
collectd-5.8.0: collectd: configure was passed unrecognised options:
--disable-libvirt [unknown-configure-option]


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
~/oe/world/oe-build ~/oe/world/oe-build

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
11b6a5d fetch/gitsm: avoid live submodule fetching during unpack()
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
23f15c6 rpm: Fix patch to ensure variables aren't used uninitialised
not included in master yet:

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
bb57bac libgpiod: add packageconfig for python bindings
not included in master yet:
fb99ffc metacity: fix version number typo 3.38.0 -> 3.28.0
d2760fa libtevent: refresh patch
108f770 grpc: rely on cmake.bbclass to put cmake package files in dev package
89e234d c-ares: rely on cmake.bbclass to put cmake package files in dev package
a69be13 openobex: rely on cmake.bbclass to put cmake package files in
dev package
d4f3f48 rocksdb: rely on cmake.bbclass to put cmake package files in dev package
79745a7 capnproto: rely on cmake.bbclass to put cmake package files in
dev package
397b5e3 json-spirit: rely on cmake.bbclass to put cmake package files
in dev package
6b31ae1 librcf: rely on cmake.bbclass to put cmake package files in dev package
bcf384e msgpack_c: rely on cmake.bbclass to put cmake package files in
dev package
fa7d5a3 rapidjson: rely on cmake.bbclass to put cmake package files in
dev package
1fdf571 glm: rely on cmake.bbclass to put cmake package files in dev package
bfa9251 openjpeg: rely on cmake.bbclass to put cmake package files in
dev package
8536660 ceres-solver: rely on cmake.bbclass to put cmake package files
in dev package
caa365a gflags: rely on cmake.bbclass to put cmake package files in dev package
8497426 libftdi: rely on cmake.bbclass to put cmake package files in dev package
b1331ed libssh: rely on cmake.bbclass to put cmake package files in dev package
854cc28 libtinyxml2: rely on cmake.bbclass to put cmake package files
in dev package
e148ac4 libwebsockets: rely on cmake.bbclass to put cmake package
files in dev package
4b9e0f5 redis: Update to 4.0.8
2d07e06 poco: variable cleanup
a5e0b35 libssh: variable cleanup
c3715c4 libftdi: variable cleanup
3840d75 gflags: variable cleanup
c1a59b6 ceres-solver: variable cleanup
037f6cf openjpeg: variable cleanup
97b976c glm: variable cleanup
675b25b msgpack-c: variable cleanup
61610d1 json-spirit: variable cleanup
ba2b7b5 capnproto: variable cleanup
06b8b46 openobex: variable cleanup
db30312 c-ares: variable cleanup
5009a6e grpc: variable cleanup
2ac6f5f iozone3: add UPSTREAM_CHECK_REGEX
8baf92b libhugetlbfs: add UPSTREAM_CHECK_GITTAGREGEX
c98b20e lmbench: add UPSTREAM_CHECK_URI
10b0ee8 lmsensors: add RECIPE_UPSTREAM_VERSION
f8d257d libnet: add UPSTREAM_CHECK_URI
44ba923 libmcrypt: add UPSTREAM_CHECK_URI
b843c66 mariadb: add UPSTREAM_CHECK_URI
1cbcc0d log4cplus: add UPSTREAM_CHECK_URI
742507d haveged: add UPSTREAM_CHECK_URI
e56cd4a hwloc: add UPSTREAM_CHECK_URI
82bb934 iotop: add UPSTREAM_CHECK_URI
045625d libpwquality: add UPSTREAM_CHECK_URI
2ea3658 libreport: add UPSTREAM_CHECK_GITTAGREGEX
716de25 rsyslog: add UPSTREAM_CHECK_URI
346c294 crash: add UPSTREAM_CHECK_URI
aed7cd1 makedumpfile: add UPSTREAM_CHECK_URI
c943278 libestr: add UPSTREAM_CHECK_URI
a6cc373 lvm2: add UPSTREAM_CHECK_URI
0a7e6a2 mce-inject: add UPSTREAM_CHECK_COMMITS
0f73b8b sdparm: add UPSTREAM_CHECK_REGEX
421ad4b sg3-utils: add UPSTREAM_CHECK_REGEX
530f07a syslog-ng: add UPSTREAM_CHECK_URI
da28163 thin-provisioning-tools: add UPSTREAM_CHECK_GITTAGREGEX
cd58494 unixodbc: add UPSTREAM_CHECK_URI
ba53d13 civetweb: Add new recipe with git-based version
ecdf58a radvd: Fix missing yacc error.
1bc3e98 libeigen: fix splitting files into packages
543bb9c hostapd: fix the bug for PATCHTOOL = "patch"
09c64e1 turbostat: add the recipe of turbostat to meta-oe
20e3b57 rygel: Update license to LGPLv2.1
66ac5a4 ntop: add UPSTREAM_CHECK_URI
48275e6 ipvsadm: add UPSTREAM_CHECK_URI
a94d142 net-snmp: add UPSTREAM_CHECK_URI
f6d550c netkit-telnet: add UPSTREAM_CHECK_URI
30ff258 ebtables: add RECIPE_UPSTREAM_VERSION
2eca506 dlm: add UPSTREAM_CHECK_URI
5a84cab autofs: add UPSTREAM_CHECK_URI
04fdc39 vsftpd: add UPSTREAM_CHECK_URI
3398935 vblade: add UPSTREAM_CHECK_URI
c32ef17 rdist: add UPSTREAM_CHECK_URI
bf70a8d vlan: add UPSTREAM_CHECK_URI
d3d2698 tiptop: Add aarch64 into COMPATIBLE_HOST.
75540ab python-lockfile: Fix build error as following:
068b4ae Added python-periphery package
2fa7002 Added python sijax package
d37415e Added python-flask-sijax package
222e65c Revert "libxml++: only include when x11 in DISTRO_FEATURES"
aeca018 android-tools: use fixed SRCREVs instead of tag name
792cd22 ubi-utils-klibc_2.0.2: upgrade to git rev 64f61a9
777fd5f corosync: add UPSTREAM_CHECK_REGEX
7ddbea7 libdnet: add UPSTREAM_CHECK_GITTAGREGEX
ecf08df netcf: add UPSTREAM_CHECK_GITTAGREGEX
ee0d27d strongswan: add UPSTREAM_CHECK_REGEX
8519549 c-ares: add UPSTREAM_CHECK_GITTAGREGEX
336fd11 cyrus-sasl: add UPSTREAM_CHECK_REGEX
8c0acd0 drbd-utils: add UPSTREAM_CHECK_URI
8521600 snort: add UPSTREAM_CHECK_URI
54309af fuse: add UPSTREAM_CHECK_URI
a69cab2 ntfs-3g-ntfsprogs: add UPSTREAM_CHECK_URI
e868c6d yaffs2-utils: add UPSTREAM_CHECK_COMMITS
0731eef aufs-util: add UPSTREAM_CHECK_COMMITS
b8bcf73 python3-pykickstart: add UPSTREAM_CHECK_GITTAGREGEX
17b50d2 python3-blivet: add UPSTREAM_CHECK_GITTAGREGEX
80afe08 python-protobuf: add UPSTREAM_CHECK_REGEX
bcf176e python-click: add UPSTREAM_CHECK_REGEX
9044bb2 xdebug: add UPSTREAM_CHECK_REGEX
2560ea4 Fixed an install error in Samba with LSB distros
e0f7b26 fwts: Upgrade to V18.05.00
24c24fb lowpan-tools: Fix build with gcc-8
5500ca6 openocd: Upgrade to latest tip of master
e46a11d mosquitto: upgrade to 1.4.15
9236224 jansson: update 2.9 -> 2.11
61868e1 iscsi-initiator-utils: Update to latest master
aeaa543 nmap: move recipe from meta-security to meta-oe
85ea52c adduser: fix HOMEPAGE
f5a3718 htop: upgrade to 2.2.0
268b4bd pam-plugin-ccreds: add recipe
b1d047c libmxml: add recipe
bd650da postfix: Remove useless file makedeps.out of postfix
5a0e681 libtinyxml2: update to 6.2.0
97c33d0 python-cryptography: Add python-pytz in RDEPENDS to fix ptest failures
8576a85 mosquitto: add mosquitto-examples package
101af9d mosquitto: add default configuration file
2ac1799 nodejs: 8.9.4 -> 8.11.2
faa20de lshw: Add new recipe with B.02.18 version
3db24e5 mbedtls: update to 2.9.0
c277560 thrift: add support for openssl 1.1x
a88860d syslog-ng: update to 3.15.1
69898da net-snmp: add support for openssl 1.1x
0a73917 telnetd: Fix deadlock on cleanup
46dd4e1 spice: Update to git hash to pick up gcc8 fixes.
592c1d0 wireshark: Update to 2.6 release
278ffea celt051: Fix building testcases
d202a3f rdma-core: Update to version 18
8d1689d cpprest: Fix build with gcc-8
470a8db rdma-core: Fix build with musl
8cd89d2 modemmanager: Fix build with musl provide canonicalize_file_name()
9bc6291 lcdproc: Update to 0.5.9
92c702f libsodium: update to 1.0.16
fe61957 libconfig: update to 1.7.2
affd3b1 mercurial: upgrade to 4.6.1
061545d nano: Upgrade 2.9.7 -> 2.9.8
00791a6 samba: add dynamic packages regexp for auth and pdb modules
38b413c libxfce4ui: upgrade 4.12.1-> 4.13.4
e028147 libxfce4util: upgrade 4.12.1 -> 4.13.1
eb75c9a xfconf: upgrade 4.12.1 -> 4.13.4
1e5cb44 xfce4-mixer: fix build after update of xfconf
3073962 ristretto: fix build after update of xfconf
e69564b xfce4-settings: fix build after update of xfconf
fb8eb04 xfce4-panel: upgrade 4.12.2 -> 4.13.3
500ed96 thunar: upgrade 1.6.15 -> 1.8.0
dd86acd thunar-volman: update 0.8.1 -> 0.9.0
e57b104 thunar-archive-plugin: upgrade 0.3.1 -> 0.4.0
af4153e thunar-media-tags-plugin: upgrade 0.2.1 -> 0.3.0
fa4d196 xfce4-whiskermenu-plugin: upgrade 2.1.7 -> 2.2.0
6f6b8ff xfce4-taskmanager: upgrade 1.2.0 -> 1.2.1
96c4673 mousepad: upgrade 0.4.0 -> 0.4.1
b7dbfef9 xfce4-terminal: upgrade 0.8.7.3 -> 0.8.7.4
021c060 xfce4-cpufreq-plugin: upgrade 1.1.3 -> 1.2.0
7aac21a packagegroup-xfce-extended: add mousepad
21c11a4 various classes recipes: Remove FILES entries for dbg/dev packages
0c93d2c thunar-plugin.bbclass: pack GTK3 plugins properly

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
73f99f2 gstreamer1.0-plugins-{good,bad}: move the qt5 PACKAGECONFIG
from bad to good bbappend
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
5fcadda Merge pull request #126 from schnitzeltony/master
not included in master yet:
~/oe/world/oe-build

