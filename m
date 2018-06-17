Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA18747BD
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 15:09:46 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id a5-v6so9209300uao.8
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6ExCI1I0AEZu5kmnUNj7fAU0eqGqBHMWGHL/Yz8wLfI=;
	b=t4b4Um/DykmZfHdyAqsPXudEeKzxvRCjFX+JqCWeJokLeEkh1SFYrum9p52inFaUSi
	IiQke6deWVWgYCF/Zl2nqLYPrReUJ+E3KDivMr4ndnzSwhwTaG1w4NGkYkd0nGe5nQ7a
	gRMwUojiKMLJmcKvb3fbmU0/6UkJOFBORXnYYpc+lTiH+Fe49dtq8Xh2cBBIxofhr+IY
	0ShfKEQaxwoQgy4zLpeD16OBW4yDV2gbkD9IP8OS+A3YG/SLAIK3mxegnmWOIXf6+0S3
	LZCU7pSidsdl75tahff9RcKx6h+J4KQrMce9bDGLfivVAS0DrF9QR/2MO/gDQtZ/pNhS
	0Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6ExCI1I0AEZu5kmnUNj7fAU0eqGqBHMWGHL/Yz8wLfI=;
	b=MH9gNQvgteJGNq/ECXeTYEcGEvaVmMiU0qT/5NrySUSFXOdvR3ZgnQIujHZWFBHLZ/
	rVi3YoTMfRoPqRYLMgDjHXuj8HI08Qg32Q6w76Up0BmZln1+sBElaT28ZYwC4vbUYBwC
	NlZKE8gman3PN750U4vYUW+LRxlcM7w/lMQiDxz6CzuyPQafTjIUCBU1XEHhuj+mnhWG
	MxImR0PsdwUBBU6XGHmoz1d+3uTd5Zf/npy1JhLfuAFmt7vT+OJ6HVnzwOlUDA52wG+d
	WW05vM5ZNef4QHMKxzd+zSZuhjAVVjUXmKehnR2lkXeXtN63n0/bm+n7v2mmSXtW0TqE
	mcQQ==
X-Gm-Message-State: APt69E3TVMktbgfBsyPcO6JZpQTVOQUUaYWTD4GcejrYn4NEvuS//Uuw
	K961zoEy7x1bMD4uhGcSaV0w1nr7R/5jPmznCj2M+w==
X-Google-Smtp-Source: ADUXVKLvpxwivmocP5nt9BEJYF25CyTeYYEaPTZwPXi4nbL2bAmYMGGSUsNBLRsHD8xvg5whjrMezeUa+TDfntrLhOE=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr6077799uad.49.1529248187482; 
	Sun, 17 Jun 2018 08:09:47 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Jun 2018 08:08:30 -0700
Message-ID: <CAMKF1sogLSfQ55cAk3wmFMcJuj577HvqCm82R+m8axxwj-zhQw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-06-16
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
X-List-Received-Date: Sun, 17 Jun 2018 15:09:47 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2018-06-16 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180617_043411.log

=== common (3) ===
    * sources/meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.27.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.0.2.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:do_compile

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb:do_package_qa

=== qemuarm64 (3) ===
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa

=== qemux86 (15) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/gd/gd_2.2.5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (2) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb:do_package_qa

=== Number of failed tasks (44) ===
{| class=wikitable
|-
|| qemuarm || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180616_215715.log/
||
|-
|| qemuarm64 || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180616_225009.log/
||
|-
|| qemux86 || 21 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180616_215724.log/
||
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180616_225023.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (39) ===
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
||0 ||unknown-configure-option
|-
||1 ||installed-vs-shipped
|-
||32 ||version-going-backwards
|-
||3 ||build-deps
|-
||5 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180616_234457.log/


    * ERROR: Nothing PROVIDES 'libmad' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'ffmpeg' (but
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
which would break package feeds from (0:1.0-r8.3 to 0:1.0-r8.2)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.3 to 0:1.0-r8.2)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.3 to 0:1.0-r8.2)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.3 to 0:1.0-r8.2)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.3 to 0:1.0-r3.2)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.3 to 0:1.0-r3.2)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.3 to 0:1.0-r3.2)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.3 to 0:1.0-r3.2) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.3 to 0:1.0-r13.2) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.3 to 0:1.0-r13.2) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.3 to 0:1.0-r13.2)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.3 to 0:1.0-r13.2) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.3 to 0:1.0-r13.2) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 1 issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


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
~/oe/world/oe-build ~/oe/world/oe-build

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
0558650 runqueue.py: Initial implementation of per task process limits
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
83c9405 alsa-tools: rewrite packaging
not included in master yet:

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
d9e257a telnetd: Fix deadlock on cleanup
not included in master yet:
0f29f2e spice: Update to git hash to pick up gcc8 fixes.
89033c1 lcdproc: Update to 0.5.9
339898c libconfig: update to 1.7.2
8f3e6f4 nano: Upgrade 2.9.7 -> 2.9.8
5ebc5d2 samba: add dynamic packages regexp for auth and pdb modules
7b61d61 libxfce4ui: upgrade 4.12.1-> 4.13.4
457190e libxfce4util: upgrade 4.12.1 -> 4.13.1
f41e173 xfconf: upgrade 4.12.1 -> 4.13.4
3e4c440 xfce4-mixer: fix build after update of xfconf
409780a ristretto: fix build after update of xfconf
13f311d xfce4-settings: fix build after update of xfconf
5f31db6 xfce4-panel: upgrade 4.12.2 -> 4.13.3
eb0fe21 thunar: upgrade 1.6.15 -> 1.8.0
4cc750c thunar-volman: update 0.8.1 -> 0.9.0
0b95063 thunar-archive-plugin: upgrade 0.3.1 -> 0.4.0
fa0bde4 thunar-media-tags-plugin: upgrade 0.2.1 -> 0.3.0
02457b6 xfce4-whiskermenu-plugin: upgrade 2.1.7 -> 2.2.0
362ff15 xfce4-taskmanager: upgrade 1.2.0 -> 1.2.1
bf1f153 mousepad: upgrade 0.4.0 -> 0.4.1
98c0ffb xfce4-terminal: upgrade 0.8.7.3 -> 0.8.7.4
255e45e xfce4-cpufreq-plugin: upgrade 1.1.3 -> 1.2.0
cfdd6c2 packagegroup-xfce-extended: add mousepad
2ad5cea various classes recipes: Remove FILES entries for dbg/dev packages
ae41c0e thunar-plugin.bbclass: pack GTK3 plugins properly
5554fd1 libgpiod: add packageconfig for C++ bindings
edf011c libsodium: update to 1.0.16
a752aef mercurial: upgrade to 4.6.1
7ad706c ne10: Use `cp -d ...` instead of `cp -a ...` to install a symbolic link
3823bca rdma-core: Update to version 18
4e070b5 celt051: Fix building testcases
91e95fe cpprest: Fix build with gcc-8
f543763 wireshark: Update to 2.6 release
877934f netkit-telnet: Switch to update-alternatives
d3b1e56 libqb: Fix build with gold
3774977 open-vm-tools: Upgrade to 10.2.5
0ce7d3d syslog-ng: update to 3.15.1
ea97e32 collectd: fix libvirt PACKAGECONFIG
c8f3816 htpdate: Add recipe
1d6ea95 modemmanager: Fix build with musl provide canonicalize_file_name()
ad81290 stunnel: Use nogroup rather then nobody for group
803a69a move cpprest to meta-oe
52904e7 spice: Fix build with musl

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
1ac92b6 qtbase: Add packageconfigs for renameat2 and getentropy use
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
1cd38d7 Merge pull request #127 from rakuco/m67-87
not included in master yet:
~/oe/world/oe-build

