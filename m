Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id DCB30744E4
	for <Openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jul 2018 17:36:39 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id s23-v6so5598504vks.7
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jul 2018 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=+hn4CjMJNHqjORklobHM1uzLerGJBvqxQ0sU5pjVmTs=;
	b=p7F4WI7/VIkInFOzL08IzzbWsH0QnOk0CQLjGByVEdi+MWycXWLqQUjIHmOuWLmSlM
	DOg+QWOrp9KbrF9E6H4QlE8atpVAY40WbCNxcI9ci14LMp5opTNvjxpiFCtu+Mx/d5HF
	7bAsGK1DzKykhdGPbX5PIbsFrc6LQE+hvVpjxKfDhFKlkzVSruwObD4asJFRPJ5IaHNY
	4XEpzBwqtufr9/7WGKLg0LDDj+qSdp00GTdDl/wogK6f8EizZOzP0EMnDK4p+VDI/Ib8
	GxeXtEDYoTjQWRWeLgWkO6hJb3exTcq3NiXAlK5r0wpGFdEaZxNCdfujdfXqEzvss4Ba
	IUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+hn4CjMJNHqjORklobHM1uzLerGJBvqxQ0sU5pjVmTs=;
	b=aBKknjfP/6jHJZxbwaKhSU+qpaY36jT26jUf31txmOc0a8NklU8v8tvwk71hicwIxu
	YRTP4DuO4B2HnJmlGX89RJNCKYHUHZ8U1amowGr0Oip+0Fv9omSkMCwtwXcwC3Ip38O0
	eEIWZ22/ccsyEqyOpcmjzBe5nvuXimNzaAhEs1p8LBUPrsgEPG4PyG46al4YHQSmCM+Q
	UiJOOCxGYwF2xAOztZaP4LM2fMFhO0W7WzUs9GSzhvcnBN6yG7+dagINuJV5/eDxhSy5
	p0RWlvskWM/EDbAjlzaP6Sx5J91gWW2LY4EjwPXxj7St2kR80GI+P0r+zjW61gWvar1w
	Yqfg==
X-Gm-Message-State: APt69E32d8pHeovsLu0DPGm2QIwTj0wz24ZN1ymiAcORQqQLy29/ctxf
	0IGEg6t9350K5k+bGJqa3QNXj00BpOFiMgFnyk/ctg==
X-Google-Smtp-Source: AAOMgpctHE8ODG1GDOtFDPuc5yKVoOGom/UD/rzWfe2G72On49u64MCGstHKOEoX4nte9cwdLa2RqkNaEoTSYopQPxs=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr13197819vkb.28.1530466600396; 
	Sun, 01 Jul 2018 10:36:40 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jul 2018 10:36:14 -0700
Message-ID: <CAMKF1sq6NXUwi_uiL3NbkGrp3o3Vx+YMQnUV6d3=QR1bho1dSg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-06-30
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
X-List-Received-Date: Sun, 01 Jul 2018 17:36:41 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2018-06-30 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180701_072407.log

=== common (1) ===
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.2.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (3) ===
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile

=== qemuarm64 (4) ===
    * sources/meta-openembedded/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa

=== qemux86 (14) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb:do_package_qa

=== Number of failed tasks (29) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180630_155218.log/
||
|-
|| qemuarm64 || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180630_164546.log/
||
|-
|| qemux86 || 18 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180630_155227.log/
||
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180630_164536.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (41) ===
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
||7 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (7) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180630_173905.log/
    * ERROR: 7 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 4 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1530416345/signatures.qemux86.do_configure.sigdata.log
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1530416345/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1530416345/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different
signature for task do_package_write_ipk.sigdata between qemux86copy
and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for
task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 4 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1530416345/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 7 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted


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


count: 7 issue: textrel
ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test'
has relocations in .text [textrel]
ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.6-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
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
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
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
which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.11 to 0:1.0-r3.10)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.11 to 0:1.0-r3.10)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.11 to 0:1.0-r3.10)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.13 to 0:1.0-r13.12) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.13 to 0:1.0-r13.12) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.13 to 0:1.0-r13.12)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.13 to 0:1.0-r13.12) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.13 to 0:1.0-r13.12) [version-going-backwards]


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
4937ed3 bitbake-user-manual: Added "number_threads" varflag
not included in master yet:
8efa782 fetch2: Use correct check in parameter handling in uri_replace()

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
6f8f984 initrdscripts/init-live.sh: fix mounts w/ spaces fail to move
to real rootfs
not included in master yet:

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
4517d1c metacity: allow for warnings during compilation
not included in master yet:
d9bb8ad dracut: upgrade 046 -> 047
0f010cb logcheck: Update the repo link
8778dc8 ifenslave:Update the repo link
38d227b Add recipe for cereal, a header-only C++11 serialization library.
00d5219 bpftool: add new recipe
d56219b mosquitto: minor recipe cleanups
8ef250d python(3)-hyperlink: upgrade 17.3.1 -> 18.0.0
5fc8680 python(3)-protobuf: upgrade 3.5.2 -> 3.6.0
fc5d2e5 python-dbus: upgrade 1.2.6 -> 1.2.8
958d240 python(3)-pytest-runner: upgrade 3.0 -> 4.2
c8cec04 python3-ordered-set: upgrade 2.0.2 -> 3.0.0
064e5ab python-pip: upgrade 9.0.3 -> 10.0.1
91fc7e1 python(3)-twisted: upgrade 17.9.0 -> 18.4.0
65f5e0f python-ipaddress: upgrade 1.0.19 -> 1.0.22
9facbad python(3)-certifi: upgrade 2018.1.18 -> 2018.4.16
6383aa7 python(3)-pyopenssl: upgrade 17.5.0 -> 18.0.0
cb4371f python(3)-urllib3: upgrade 1.22 -> 1.23
7f7778e python(3)-ndg-httpsclient: upgrade 0.4.4 -> 0.5.0
720c3af python(3)-pyasn1: upgrade 0.4.2 -> 0.4.3
2002c44 python(3)-lxml: upgrade 4.2.1 -> 4.2.2
1a1360d python(3)-automat: upgrade 0.6.0 -> 0.7.0
b5ac1d0 python3-requests-file: upgrade 1.4.2 -> 1.4.3
51d413c python3-prctl: upgrade 1.6.1 -> 1.7
4d7532d python(3)-attrs: upgrade 17.4.0 -> 18.1.0
becd0a6 python(3)-requests: upgrade 2.18.4 -> 2.19.1
5a1c7c3 python(3)-idna: upgrade 2.6 -> 2.7
70ac050 waf-cross-answers: Added file for arm bigendian which for
aarch64BE multilib.
590f187 libnih: Fix do_package error when enable mutilib.
76e5f66 liblogging: upgrade to 1.0.6
e0a7f73 log4cplus: upgrade to 2.0.1
79024b5 iceauth: Upgrade to 1.0.8
b2bd3b0 gperftools: Upgrade to 2.7
b951fc7 libndp: Upgrade to 1.7
2041c5b hwdata: Upgrade to 0.312
bd28761 libedit: Upgrade to 20180525-3.1
dd2a634 libfastjson: Upgrade to 0.99.8
6a659ef fltk: Upgrade to 1.3.4-2
45edb2d dialog: Upgrade to 1.3-20180621
e43a831 libgphoto2: Upgrade to 2.5.17
211c8d6 hwloc: Upgrade to 1.11.10
b6c0c92 glade: Upgrade to 3.22.1
3e2d529 dbus-broker: Upgrade to latest and fix build on musl
f6c7adb kea: Upgrade to 1.4.0 release
175bf73 python-ptyprocess: update to version 0.6.0
145408a python-cython: update to version 0.28.3
0a5c61c protobuf: misc recipe cleanup
3c49eca protobuf-c: misc recipe cleanup
09eb0ca apache2: Add PACKAGECONFIG zlib option for mod_deflate
661375e dnsmasq: upgrade 2.78 -> 2.79
188097b php: upgrade 7.2.4 -> 7.2.7
54aa4c4 postgresql: upgrade 9.4.17 -> 9.4.18
6e47ace syslog-ng: upgrade 3.15.1 -> 3.16.1
318c957 vim/vim-tiny: upgrade 8.0.0983 -> 8.1.0.116
5933e85 python-pytz: update to version 2018.5
86553eb python-lxml: update to version 4.2.3
b2163c1 python-pybind11: update to version 2.2.3
831fcf6 python-babel: update to version 2.6.0
28b42e5 python-dateutil: update to version 2.7.3
09ed17b python-pyjwt: update to version 1.6.4
4ef58ec python-pyasn1-modules: update to version 0.2.2
3f0923b python-pyiface: update to version 0.0.6
a45ebba python-pandas: update to version 0.23.1
bc30a93 python-cryptography-vectors: update to version 2.2.2
3ee1d8b python-cryptography: update to version 2.2.2
7d58e8a python-zopeinterface: update to version 4.5.0
a5509f6 python-pymongo: update to version 3.7.0
e8e5947 python-pymisp: update to version 2.4.92.1
e57d080 python-pyperclip: update to version 1.6.2
f7e8cd8 python-pexpect: update to version 4.6.0
6a6e398 python-alembic: update to version 0.9.10
553ced6 kodi: Upgrade to upcoming kodi v18 'Leia'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
65c85d3 qt5/qtscript: Fix qtscript cross compile error
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
1cd38d7 Merge pull request #127 from rakuco/m67-87
not included in master yet:
~/oe/world/oe-build

