Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 39E7A75260
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 04:10:19 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id 125-v6so11682573vke.11
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 21:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CLuZ81xus2zWiM1AzgvGF00teITyY/MEK6eocHdh20c=;
	b=SWonK/W0q2Zx3gJAy+LpV+xVv2lUg2GyOGyk9bY/OXOE6kMJ0yca/kr0sjweLybjw/
	fAxFa3CEstmQX+Zv1Z2SuUZ/fdDF8xos6TxbUcTrzWQgCoI+vz+D2c6qdPX3yg4ObN7d
	FcQDaiwGOHNlXKPifAz7/c0nu2+TxbgFGa+y11RfikMEZIrUZnQ2DXRRKypTl+zT3B5p
	UCTQLfLwYXaCNufT65CwGgbug94pwKnHSTbxO6sN82OFgDVCEJ4x8IJVk6CL/lBdsSrT
	AV0+DWf3Hnd2K2bA/Mjau+qx69l2q57JGGVvhEKhfyInDd3d+GS8ymMz4o/KqfQzc0vq
	effw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CLuZ81xus2zWiM1AzgvGF00teITyY/MEK6eocHdh20c=;
	b=cnK+pw/FDKRW4b5uagifvLybVytp9Ei9WiLDNkdahrtUjvkLQDKrTqgWBxpYuoAYoC
	CLIZskgeuIQKjFVN4Qx7qAYYji1hLLR5Yyaa+Y9Kh5okhNDr8AQj6A3OOmH2buwosuAN
	GirwctO6rE9zvNlnmkIIfKCk6QwYHOmV4MfM2yy4eNHdfAYsRaOXYdnnHVv44dNB/2NU
	j08x2eEgzm9H2T9lDSaBKGHJiVQiem88Z9PLd+cVwtg9YmWQF2o/x8sx1aoj1zeeAJay
	kKRX4PpdQhVie+reGJ/RdEpOiUhM0b3s1qg9D8iklEROrVowqrMcFzR/doCxy+vMmTJM
	jBRg==
X-Gm-Message-State: AOUpUlEtDSp+H/4RqdJUvzNCMztss1hlENrocb+gzaiQqrG5+OGxVW+/
	z7BbNe+43pW3AGD0JfwZ1rqcVcx4rzPnl3BB1RKLKA==
X-Google-Smtp-Source: AAOMgpcrzvkgMmjuOi1NADPpYB9cId+ZowvgbXritI57bt9Gbp/Zmio5vTQQ0WQJ8wUG0HA7klWUAnB8iNVaHiREseM=
X-Received: by 2002:a1f:3984:: with SMTP id
	g126-v6mr5750847vka.28.1531195819565; 
	Mon, 09 Jul 2018 21:10:19 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2018 21:09:54 -0700
Message-ID: <CAMKF1spE0HvtxOaCCXSM=T-Ha_aK-=YvZCeyj6HL8vRuroENdA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-07-09
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
X-List-Received-Date: Tue, 10 Jul 2018 04:10:19 -0000
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

||2018-07-09 ||8 ||7 ||21 ||5 ||0 ||0 ||0 ||7 ||3 ||0 ||32 ||0 ||1 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-07-09 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180709_180314.log

=== common (4) ===
    * sources/meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.3.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb:do_package_qa

=== qemuarm (4) ===
    * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile

=== qemuarm64 (3) ===
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

=== qemux86_64 (0) ===

=== Number of failed tasks (41) ===
{| class=wikitable
|-
|| qemuarm || 8 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180709_054120.log/
||
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180709_065312.log/
||
|-
|| qemux86 || 21 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180709_054129.log/
||
|-
|| qemux86_64 || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180709_065147.log/
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



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180709_080715.log/


    * ERROR: Nothing RPROVIDES 'libconfig-general-perl' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-networking/recipes-support/tgt/tgt_git.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'libconfig-general-perl' (but
/home/jenkins/oe/world/oe-build/sources/meta-openembedded/meta-networking/recipes-support/tgt/tgt_git.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/oe-build/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'qttranslations-qt' (but
/home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
RDEPENDS on or otherwise requires it)
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


count: 7 issue: textrel
ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test'
has relocations in .text [textrel]
ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
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
which would break package feeds from (0:1.0-r8.19 to 0:1.0-r8.18)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.19 to 0:1.0-r8.18)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.19 to 0:1.0-r8.18)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.19 to 0:1.0-r8.18)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.19 to 0:1.0-r3.18)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.19 to 0:1.0-r3.18)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.19 to 0:1.0-r3.18)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.19 to 0:1.0-r3.18) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.21 to 0:1.0-r13.20) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.21 to 0:1.0-r13.20) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.21 to 0:1.0-r13.20)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.21 to 0:1.0-r13.20) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.21 to 0:1.0-r13.20) [version-going-backwards]


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
9876b5d runqueue: Stop on first unsatisfied dependency
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
f57363d minicom: remove dead URL from UPSTREAM_CHECK_URI
not included in master yet:

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
b56fc26 ristretto: upgrade 0.8.2 -> 0.8.3
not included in master yet:
2731baf openldap: upgrade 2.4.45 -> 2.4.46
771914f rsyslog: upgrade 8.29.0 -> 8.36.0
e58a58c krb5: Upgrade to 1.16.1
a19bb52 nodejs: update to 8.11.3
b837e58 paho-mqtt-c: Upgrade to 1.2.1
7ccfc9d cmpi-bindings: rename
d490ac2 strongswan: upgrade 5.6.2 -> 5.6.3
67bc173 open-isns: upgrade 0.97 -> 0.98
485de7b openipmi: upgrade 2.0.24 -> 2.0.25
ffc77e6 python-ldap: upgrade 2.4.41 -> 2.4.45
703aa8c samba: upgrade 4.7.6 -> 4.7.8
b80f1d7 NetworkManager: upgrade 1.10.6 -> 1.10.10
476d08c networkmanager-openvpn: upgrade 1.2.8 -> 1.2.10
841fbbf phpmyadmin: upgrade 4.7.9 -> 4.8.2
8b0f77d phoronix-test-suite: upgrade to 8.0.1
317605f p7zip: simplify recipe
8b0c1c3 tbb: check the version of the cross gcc instead of host gcc
0b35b7e postfix: upgrade 3.2.2 -> 3.2.6
215ac24 python-pyiface: Upgrade to 0.0.7
7041cdd drbd-utils: add submodule drbd-headers into SRC_URI
04da00b libbytesize: Upgrade to 1.3
fb420dd xfsdump: upgrade 3.1.7 -> 3.1.8
7040a75 aufs-util: upgrade 4.4 -> 4.9
a04f595 apache2: upgrade 2.4.29 -> 2.4.33
e5b5114 wireless-regdb: Bump version to latest upstream 2018.05.31
20e3c3e wireless-regdb: Add wireless-regdb-static package with static
regulatory data
8603b76 kernel_wireless_regdb: Add class for embedding regulatory data
into older kernel
1e7e4e9 iscsitarget: Remove recipe as it is no longer supported to
build with linux kernel >= 4.14
a34ac8d kpatch: Mark it incompatible with musl
e65b1c4 python3-lxml,python3-protobuf: Set CLEANBROKEN
b0cfa32 mcelog: Upgrade to 159
0badc5c python-asn1crypto: fix DESCRIPTION, HOMEPAGE and LICENSE.
497c0a6 tgt: Migrate recipe from meta-openstack layer
22da2d2 kselftest: Add a recipe on kernel selftest
e3154b6 iozone3: Upgrade to 482
18b6dcc vim: update to 8.1.0172
371a97b python-panda: add cython to DEPENDS
359312e kodi: Upgrade to upcoming kodi v18 'Leia'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
0263af7 qt5: add option to build Qt5 statically
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
8e159ff chromium-x11: Import patch to fix the build with GCC 8
not included in master yet:
~/oe/world/oe-build

