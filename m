Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD857BDB9
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 20:36:56 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l11so23826130qtp.0
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 12:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=xUTXXVWV3gaXMlw5sBkcQ75ZOlOQ9nmzIvQRXPDB1kI=;
	b=cy0r79qX1THByDovPojxBjgzufLBNsMTEMgSme6pANdEZ6AHMZq6BFDTTgnSWK0TI7
	p9XfNBHNjliIP9qovRbiFrAulBkuvyZLu5bx6X1nVOetr58zaP1ecSWy9l+/ABCsA4zW
	t6ERZeB8oifSLTbjDO/ZCXQ04W5pHCxf4Mb3QV012uA5ed7cPNek7tZPAOp/IUOhEr8W
	DjRiXt1j4oOHo34wovxNapfwDx0kKONeSZDd76sTjsjOtrOFx9vS3HKOoaV/ziHueFPa
	6REbUlCwRJSEfJ7djNrlCqTptVcfeBanGvrLeaiLCzuIvSAspbdzqdpfPGs9sL26oDWW
	b/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xUTXXVWV3gaXMlw5sBkcQ75ZOlOQ9nmzIvQRXPDB1kI=;
	b=FEkpaeT4LlKcJ76ptz0eXTDQJvu6BHmmjnzqMQYoMqCRfBjd185GUY8KckQ5aC2Z1N
	bwyX/G/vmk6AUwqGiEAHp/jCc45aAryWgB9JnxwpGXta0EGBbQyYyLYRAxotK0cAXA5T
	ggcD4fXvByA537+kYoPcgoed+MnxnC7ECPel9tuBufDTP0bEZ5kY2h1RFC5M6+cgRWVU
	qisIxvE8CfnVBmJnWgceWFnfxmSD0p2i2PUoNgwQpiea2Def+hiY3tf2CYwyUgJduBCv
	QHcX1k6gGji/oPtX32xX7uCIuNN888wLvkEJfT2Qxu/XBITJJooACWcplzOO96VXd4GI
	Tz1g==
X-Gm-Message-State: AA+aEWY/HC+Nf60SL6yPojWWadlRq7jRPEbmFfVzjsIlV/A5d1i+yM/9
	xdT6mLf4QWY/VeGyH5f5TLrEB1Xym8cMkdJ9VtEppYF4zBg=
X-Google-Smtp-Source: AFSGD/UwdYqEy12J5wnoxnxgwXxrJusZPhp3tsECu6ztwYXOgakPPvVlGmn7KldsJzjRXJqlQ+dOzvd2IdGgcsuVhAc=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr23962898qtk.253.1545251815693;
	Wed, 19 Dec 2018 12:36:55 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 12:36:28 -0800
Message-ID: <CAMKF1soL_+E-Yg6N78YVj09a0ujoGEjEvJuz_3vmNxcSh61BFw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-12-19
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
X-List-Received-Date: Wed, 19 Dec 2018 20:36:57 -0000
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
||2018-12-18 ||6 ||3 ||5 ||3 ||33 ||0 ||0 ||0 ||0 ||0 ||2624 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-12-18 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20181219_112425.log

=== common (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.71.0.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile

=== qemuarm64 (0) ===

=== qemux86 (3) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/cargo/cargo_0.31.0.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (17) ===
{| class=wikitable
|-
|| qemuarm || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20181217_231844.log/
||
|-
|| qemuarm64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20181218_105114.log/
||
|-
|| qemux86 || 5 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20181217_231850.log/
||
|-
|| qemux86_64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20181218_050126.log/
||
|}
./jenkins-job.sh: line 529: cd: too many arguments

=== PNBLACKLISTs (0) ===

=== QA issues (2624) ===
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
||2624 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (33) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20181219_074214.log/
    * ERROR: 33 issues were found in these recipes: 96boards-tools
cargo-native gedit gvfs libblockdev ndctl oprofile
packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
packagegroup-self-hosted phoronix-test-suite phpmyadmin python3-blivet
rust-native thunar udisks2 umip xscreensaver

    * ERROR: 7 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 7 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 10 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 2 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 6 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: gedit different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: gvfs different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: umip different signature for task do_configure.sigdata
between qemux86copy and qemux86
    * ERROR: 7 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemux86.do_configure.sigdata.log
    * ERROR: gedit different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: gvfs different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: umip different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 7 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: gedit different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: gvfs different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: libblockdev different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: ndctl different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: python3-blivet different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: thunar different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: udisks2 different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: umip different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: xscreensaver different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 10 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: cargo-native different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: cargo-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: rust-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different
signature for task do_package_write_ipk.sigdata between qemux86copy
and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for
task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phoronix-test-suite different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 6 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1545237734/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 33 issues were found in these recipes: 96boards-tools
cargo-native gedit gvfs libblockdev ndctl oprofile
packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
packagegroup-self-hosted phoronix-test-suite phpmyadmin python3-blivet
rust-native thunar udisks2 umip xscreensaver


PNBLACKLISTs:
./jenkins-job.sh: line 529: cd: too many arguments
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


count: 2624 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.72 to 0:1.0-r8.71)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.72 to 0:1.0-r8.71)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.72 to 0:1.0-r8.71)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.72 to 0:1.0-r8.71)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.72 to 0:1.0-r3.71)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.72 to 0:1.0-r3.71)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.72 to 0:1.0-r3.71)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.72 to 0:1.0-r3.71) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.72 to 0:1.0-r13.71) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.72 to 0:1.0-r13.71) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.72 to 0:1.0-r13.71)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.72 to 0:1.0-r13.71) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.72 to 0:1.0-r13.71) [version-going-backwards]
perl-5.24.4: Package version for package perl-dbg went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dbg went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dbg went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dbg went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dev went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dev went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dev went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-dev went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-doc went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-doc went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-doc went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-doc went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-lib went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-lib went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-lib went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-lib went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-misc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-misc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-misc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-misc went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-anydbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-anydbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-anydbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-anydbm-file went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-cpan went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result-test went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result-test went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result-test went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result-test went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-app-prove-state-result went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove-state
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove-state
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove-state
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove-state
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-app-prove went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-archive-tar-constant went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-archive-tar-constant went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-archive-tar-constant went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-archive-tar-constant went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar-file
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-archive-tar went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-arybase went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-arybase went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-arybase went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-arybase went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-attribute-handlers went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-attribute-handlers went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-attribute-handlers went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-attribute-handlers went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-attributes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-attributes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-attributes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-attributes went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-exception-system went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-exception-system went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-exception-system went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-exception-system went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-exception
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-exception
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-exception
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-exception
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-hints
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-hints
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-hints
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-hints
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guardstack went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guardstack went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guardstack went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guardstack went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guard went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guard went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guard went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-autodie-scope-guard went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-skip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-skip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-skip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-skip went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie-util went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autodie went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autoloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autoloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autoloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autoloader went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autosplit went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autosplit went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autosplit went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autosplit went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autouse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autouse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autouse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-autouse went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-base went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-concise went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-concise went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-concise went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-concise went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-debug went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-debug went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-debug went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-debug went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-deparse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-deparse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-deparse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-deparse went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-benchmark went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-benchmark went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-benchmark went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-benchmark went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigint went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bignum went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bignum went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bignum went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bignum went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-blib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-blib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-blib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-blib went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-op-private went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-op-private went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-op-private went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-op-private went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-showlex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-showlex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-showlex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-showlex went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-terse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-terse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-terse went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-terse went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-b went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-b went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-b went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-xref went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-xref went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-xref went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-b-xref went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes-heavy went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-bytes went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp-heavy went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-carp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module--charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module--charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module--charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-charnames went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module--charnames went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-charnames went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-class-struct went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-class-struct went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-class-struct went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-class-struct went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-compress-raw-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-compress-raw-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-compress-raw-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-compress-raw-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-raw-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-raw-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-raw-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-raw-zlib
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-zlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-compress-zlib
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-extensions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-extensions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-extensions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-extensions
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-git went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-git went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-git went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-git went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-heavy went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-perl-v
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-perl-v
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-perl-v
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config-perl-v
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-config went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-constant went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-constant went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-constant went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-constant went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-corelist went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-corelist went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-corelist went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-corelist went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpanplus went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpanplus went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpanplus went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpanplus went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpan went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cpan went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cwd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cwd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cwd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-cwd went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-data-dumper went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-data-dumper went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-data-dumper went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-data-dumper went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-dbm-filter-compress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-dbm-filter-compress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-dbm-filter-compress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-dbm-filter-compress went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-encode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-encode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-encode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-encode
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-int32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-int32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-int32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-int32
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-null
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-null
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-null
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-null
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-utf8
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-utf8
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-utf8
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter-utf8
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dbm-filter went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-db went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-db went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-db went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-db went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-deprecate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-deprecate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-deprecate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-deprecate went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-peek went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-peek went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-peek went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-peek went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-ppport went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-ppport went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-ppport went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-ppport went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-selfstubber
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-selfstubber
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-selfstubber
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-devel-selfstubber
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-diagnostics went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-diagnostics went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-diagnostics went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-diagnostics went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-base went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-file went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-md5 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-md5 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-md5 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-md5 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-sha went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-sha went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-sha went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest-sha went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-digest went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dirhandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dirhandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dirhandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dirhandle went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvalue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvalue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvalue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvalue went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dumpvar went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dynaloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dynaloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dynaloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-dynaloader went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-alias went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-alias went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-alias went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-alias went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-byte went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-byte went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-byte went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-byte went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-changes
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-changes
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-changes
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-changes
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-cjkconstants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-cjkconstants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-cjkconstants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-cjkconstants went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn-hz went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn-hz went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn-hz went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn-hz went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-cn went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-configlocal-pm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-configlocal-pm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-configlocal-pm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-configlocal-pm went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-config
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-config
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-config
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-config
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-ebcdic
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-ebcdic
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-ebcdic
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-ebcdic
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoder
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-encoding
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-gsm0338
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-gsm0338
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-gsm0338
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-gsm0338
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-guess went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-guess went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-guess went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-guess went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-h2z
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-h2z
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-h2z
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-h2z
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-jis7
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-jis7
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-jis7
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp-jis7
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-jp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr-2022-kr
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr-2022-kr
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr-2022-kr
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr-2022-kr
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-kr went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-makefile-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-makefile-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-makefile-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-makefile-pl went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header-iso-2022-jp went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header-iso-2022-jp went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header-iso-2022-jp went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header-iso-2022-jp went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-mime-header went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-mime-name
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-mime-name
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-mime-name
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-mime-name
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--pm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--pm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--pm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--pm went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-readme
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-readme
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-readme
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-readme
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-symbol
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-symbol
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-symbol
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-symbol
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--t went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--t went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--t went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode--t went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-tw went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-tw went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-tw went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-tw went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-unicode-utf7 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-unicode-utf7 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-unicode-utf7 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-encode-unicode-utf7 went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-unicode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-unicode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-unicode
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode-unicode
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encode went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding-warnings
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding-warnings
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding-warnings
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding-warnings
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-encoding went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-english went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-english went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-english went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-english went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-env went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-env went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-env went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-env went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-errno went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-errno went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-errno went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-errno went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-experimental went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-experimental went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-experimental went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-experimental went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter-heavy
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter-heavy
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter-heavy
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter-heavy
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-exporter went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-base went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-aix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-aix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-aix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-aix went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-android went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-android went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-android went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-android went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-cygwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-cygwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-cygwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-cygwin went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-darwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-darwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-darwin went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-darwin went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-dec-osf went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-dec-osf went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-dec-osf went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-dec-osf went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-os2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-os2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-os2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-os2 went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-unix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-unix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-unix went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-unix went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-vms went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-vms went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-vms went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-vms went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-bcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-bcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-bcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-bcc went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-gcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-gcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-gcc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-gcc went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-msvc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-msvc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-msvc went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows-msvc went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-cbuilder-platform-windows went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-cbuilder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-cbuilder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-cbuilder
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-cbuilder
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-command-mm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-command-mm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-command-mm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-command-mm went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-command
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-command
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-command
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-command
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-base went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-proxysubs went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-proxysubs went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-proxysubs went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-proxysubs went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-utils went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-utils went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-utils went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-utils went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-constant
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-constant
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-constant
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-constant
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-xs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-xs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-xs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-constant-xs went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-embed
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-embed
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-embed
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-embed
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-installed went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-installed went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-installed went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-installed went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-install
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-install
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-install
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-install
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-liblist-kid went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-liblist-kid went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-liblist-kid went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-liblist-kid went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-liblist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-liblist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-liblist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-liblist
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-config went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-config went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-config went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-config went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-locale went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-version went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-version went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-version went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker-version went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-makemaker went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-manifest
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-manifest
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-manifest
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-manifest
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-miniperl
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-miniperl
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-miniperl
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-miniperl
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mkbootstrap went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mkbootstrap went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mkbootstrap went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mkbootstrap went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mksymlists went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mksymlists went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mksymlists went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mksymlists went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-aix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-aix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-aix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-aix
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-any
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-any
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-any
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-any
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-beos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-beos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-beos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-beos
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-cygwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-cygwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-cygwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-cygwin went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-darwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-darwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-darwin went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-mm-darwin went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-dos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-dos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-dos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-dos
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-macos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-macos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-macos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-macos
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-nw5
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-nw5
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-nw5
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-nw5
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-os2
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-qnx
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-qnx
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-qnx
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-qnx
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-unix
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-uwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-uwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-uwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-uwin
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vms
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-vos
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win32
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win95
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win95
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win95
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-mm-win95
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-my went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-my went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-my went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-my went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-packlist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-packlist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-packlist
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-packlist
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-constants went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-countlines went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-countlines went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-countlines went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-countlines went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-eval went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-eval went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-eval went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-eval went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-utilities went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-utilities went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-utilities went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-parsexs-utilities went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-parsexs
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-parsexs
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-parsexs
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-parsexs
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-testlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-testlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-testlib
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-testlib
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-cmd went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-cmd went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-cmd went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-cmd went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-inputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-inputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-inputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-inputmap went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-outputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-outputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-outputmap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-outputmap went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-type went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-type went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-type went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-extutils-typemaps-type went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-typemaps
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-typemaps
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-typemaps
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-extutils-typemaps
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fatal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fatal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fatal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fatal went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fcntl went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fcntl went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fcntl went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fcntl went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-feature went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-feature went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-feature went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-feature went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fields went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fields went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fields went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-fields went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-basename
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-basename
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-basename
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-basename
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filecache went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filecache went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filecache went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filecache went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-compare went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-compare went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-compare went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-compare went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-copy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-copy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-copy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-copy went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-dosglob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-dosglob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-dosglob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-dosglob went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-fetch went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-fetch went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-fetch went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-fetch went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-find went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-globmapper
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-globmapper
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-globmapper
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-globmapper
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-glob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-glob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-glob went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-glob went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filehandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filehandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filehandle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filehandle went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-path went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-path went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-path went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-path went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-amigaos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-amigaos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-amigaos
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-amigaos
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-cygwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-cygwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-cygwin
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-cygwin
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-epoc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-epoc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-epoc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-epoc
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-file-spec-functions went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-file-spec-functions went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-file-spec-functions went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-file-spec-functions went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-mac
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-mac
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-mac
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-mac
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-os2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-os2
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-unix
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-vms
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-vms
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-win32
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-spec-win32
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-stat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-stat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-stat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-stat went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-temp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-temp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-temp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-file-temp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filetest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filetest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filetest went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filetest went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-simple
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-simple
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-simple
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-simple
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-util-call
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-util-call
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-util-call
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-filter-util-call
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-findbin went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-findbin went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-findbin went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-findbin went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-long went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-long went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-long went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-long went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-std went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-std went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-std went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-getopt-std went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-hash-util-fieldhash went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-hash-util-fieldhash went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-hash-util-fieldhash went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-hash-util-fieldhash went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-hash-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-hash-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-hash-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-hash-util went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-http-tiny went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-http-tiny went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-http-tiny went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-http-tiny went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-collate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-collate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-collate went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-collate went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langinfo
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langinfo
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langinfo
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langinfo
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-detect went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-detect went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-detect went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-detect went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-list went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-list went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-list went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-i18n-langtags-list went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langtags
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langtags
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langtags
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-i18n-langtags
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-if went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-if went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-if went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-if went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-integer went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-integer went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-integer went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-integer went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-bzip2 went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-deflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-deflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-deflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-deflate went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-base-common went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-base-common went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-base-common went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-base-common went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-base
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-base
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-base
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-base
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-bzip2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-bzip2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-bzip2
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-bzip2
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-deflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-deflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-deflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-deflate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-gzip-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-gzip-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-gzip-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-gzip-constants went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-gzip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-gzip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-gzip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-gzip
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-rawdeflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-rawdeflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-rawdeflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-rawdeflate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zip-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zip-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zip-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zip-constants went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-zip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-zip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-zip
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-compress-zip
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-constants went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-constants went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-extra went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-extra went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-extra went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-compress-zlib-extra went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-dir went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-dir went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-dir went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-dir went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-file went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-handle went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-pipe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-pipe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-pipe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-pipe went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-poll went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-poll went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-poll went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-poll went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-seekable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-seekable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-seekable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-seekable went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-select went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-inet
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-inet
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-inet
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-inet
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-ip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-ip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-ip went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-ip went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-unix
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket-unix
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-socket went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-bunzip2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-bunzip2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-bunzip2 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-bunzip2 went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-identity went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-inflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-inflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-inflate went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-adapter-inflate went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyinflate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyuncompress went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyuncompress went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyuncompress went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-anyuncompress went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-base went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-bunzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-bunzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-bunzip2 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-bunzip2 went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-gunzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-gunzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-gunzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-gunzip went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-inflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-inflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-inflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-inflate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-rawinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-rawinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-rawinflate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-rawinflate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-unzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-unzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-unzip went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-io-uncompress-unzip went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-zlib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-zlib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-zlib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-io-zlib went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-cmd went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-msg went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-msg went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-msg went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-msg went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open2 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open2 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open2 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open2 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-open3 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sharedmem
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sharedmem
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sharedmem
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sharedmem
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sysv went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sysv went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sysv went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ipc-sysv went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp-boolean
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp-boolean
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp-boolean
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp-boolean
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-json-pp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-less went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-less went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-less went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-less went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-lib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-lib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-lib went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-lib went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util-xs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util-xs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util-xs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-list-util-xs went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-loaded went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-loaded went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-loaded went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-loaded went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-load went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-load went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-load went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-load went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-constants went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-constants went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-country went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-currency went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langext went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langfam went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-language went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-codes went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-codes went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-langvar went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-codes went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-codes went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-codes went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-codes went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-retired went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script-retired went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-codes-script went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-codes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-codes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-codes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-codes went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-country
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-country
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-country
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-country
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-currency
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-currency
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-currency
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-currency
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-language
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-language
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-language
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-language
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-gutsloader went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-gutsloader went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-gutsloader went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-gutsloader went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-guts went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-guts went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-guts went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-guts went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-simple went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-simple went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-simple went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-locale-maketext-simple went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-maketext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-maketext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-maketext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-maketext
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-script
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-script
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-script
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale-script
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-locale went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigfloat-trace went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigfloat-trace went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigfloat-trace went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigfloat-trace went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigfloat
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigfloat
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigfloat
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigfloat
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-calcemu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-calcemu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-calcemu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-calcemu went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-calc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-calc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-calc
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-calc
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-fastcalc went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-fastcalc went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-fastcalc went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-math-bigint-fastcalc went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-trace
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-trace
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-trace
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint-trace
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigint went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-bigrat went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-complex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-complex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-complex went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-complex went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-trig went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-trig went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-trig went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-math-trig went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-anydbm-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-anydbm-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-anydbm-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-anydbm-file went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expirefile went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expirefile went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expirefile went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expirefile went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expiretest went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expiretest went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expiretest went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-memoize-expiretest went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-expire
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-expire
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-expire
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-expire
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-ndbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-ndbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-ndbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-ndbm-file
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-sdbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-sdbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-sdbm-file
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-sdbm-file
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-storable
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-storable
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-storable
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize-storable
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-memoize went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-metadata went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-metadata went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-metadata went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-metadata went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-meta-notation
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-meta-notation
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-meta-notation
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-meta-notation
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-base64 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-base64 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-base64 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-base64 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-quotedprint
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-quotedprint
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-quotedprint
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mime-quotedprint
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mro went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mro went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mro went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-mro went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-cmd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-cmd went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-config went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-config went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-domain went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-domain went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-domain went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-domain went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-a went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-a went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-a went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-a went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-dataconn
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-dataconn
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-dataconn
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-dataconn
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-e went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-e went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-e went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-e went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-i went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-i went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-i went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-i went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-l went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-l went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-l went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp-l went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ftp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-hostent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-hostent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-hostent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-hostent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netrc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netrc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netrc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-netrc went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-nntp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-nntp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-nntp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-nntp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ping went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ping went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ping went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-ping went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-pop3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-pop3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-pop3 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-pop3 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-protoent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-protoent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-protoent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-protoent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-servent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-servent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-servent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-servent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-smtp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-smtp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-smtp went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-smtp went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-time went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-time went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-time went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-net-time went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-next went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-next went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-next went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-next went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ok went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-ok went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-ok went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-ok went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-opcode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-opcode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-opcode went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-opcode went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-open went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-open went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-open went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-open went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ops went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ops went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ops went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-ops went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overloading went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overloading went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overloading went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overloading went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload-numbers
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload-numbers
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload-numbers
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload-numbers
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-overload went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-o went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-o went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-o went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-o went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-params-check went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-params-check went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-params-check went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-params-check went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parse-cpan-meta
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parse-cpan-meta
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parse-cpan-meta
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-parse-cpan-meta
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl5db went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl5db went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl5db went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl5db went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlfaq went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlfaq went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlfaq went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlfaq went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-encoding
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-encoding
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-mmap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-mmap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-mmap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-mmap went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-scalar
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-scalar
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-scalar
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-scalar
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-perlio-via-quotedprint went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-perlio-via-quotedprint went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-perlio-via-quotedprint went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-perlio-via-quotedprint went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-via went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-via went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-via went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio-via went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perlio went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl-ostype went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl-ostype went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl-ostype went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-perl-ostype went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-checker went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-checker went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-checker went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-checker went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-escapes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-escapes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-escapes went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-escapes went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-find went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-find went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-functions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-functions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-functions
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-functions
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-html went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-html went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-html went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-html went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-inputobjects
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-inputobjects
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-inputobjects
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-inputobjects
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-man went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-man went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-man went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-man went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parselink
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parselink
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parselink
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parselink
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parser went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parseutils
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parseutils
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parseutils
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-parseutils
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-baseto went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-baseto went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-baseto went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-baseto went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-getoptsoo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-getoptsoo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-getoptsoo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-getoptsoo went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toansi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toansi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toansi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toansi went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tochecker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tochecker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tochecker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tochecker went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toman
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toman
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toman
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toman
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tonroff went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tonroff went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tonroff went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-tonroff went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-topod
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-topod
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-topod
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-topod
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-tortf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-tortf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-tortf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-tortf
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toterm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toterm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toterm went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-toterm went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-totext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-totext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-totext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-perldoc-totext went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-totk
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-totk
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-totk
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-totk
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toxml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toxml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toxml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc-toxml
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-perldoc went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-plaintext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-plaintext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-plaintext
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-plaintext
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-select went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-select went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-blackbox went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-blackbox went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-blackbox went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-blackbox went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-checker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-checker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-checker went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-checker went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-debug
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-debug
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-debug
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-debug
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpastext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpastext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpastext went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpastext went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpasxml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpasxml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpasxml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-dumpasxml went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmlbatch went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmlbatch went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmlbatch went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmlbatch went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmllegacy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmllegacy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmllegacy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-htmllegacy went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-html
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-html
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-html
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-html
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-linksection went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-linksection went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-linksection went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-linksection went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-methody went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-methody went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-methody went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-methody went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-progress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-progress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-progress went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-progress went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserendtoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserendtoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserendtoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserendtoken went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserstarttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserstarttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserstarttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparserstarttoken went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertexttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertexttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertexttoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertexttoken went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertoken went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparsertoken went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparser went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparser went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparser went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-pullparser went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-rtf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-rtf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-rtf
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-rtf
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-search
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-search
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-search
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-search
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-simpletree went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-simpletree went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-simpletree went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-simpletree went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-textcontent went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-textcontent went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-textcontent went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-textcontent went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-text
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-text
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-text
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-text
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-tiedoutfh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-tiedoutfh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-tiedoutfh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-tiedoutfh went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodedumb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodedumb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodedumb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodedumb went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodesmart went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodesmart went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodesmart went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcodesmart went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcode went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcode went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcode went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-transcode went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-xhtml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-xhtml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-xhtml
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-simple-xhtml
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-xmloutstream went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-xmloutstream went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-xmloutstream went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-simple-xmloutstream went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-color
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-color
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-color
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-color
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-text-overstrike went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-text-overstrike went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-text-overstrike went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-pod-text-overstrike went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-termcap
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-termcap
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-termcap
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text-termcap
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-text went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-usage went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-usage went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-usage went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-pod-usage went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-posix went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-posix went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-posix went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-posix went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-re went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-re went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-re went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-re went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-safe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-safe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-safe went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-safe went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-scalar-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-scalar-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-scalar-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-scalar-util went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sdbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sdbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sdbm-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sdbm-file went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-search-dict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-search-dict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-search-dict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-search-dict went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selectsaver went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selectsaver went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selectsaver went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selectsaver went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selfloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selfloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selfloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-selfloader went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sigtrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sigtrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sigtrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sigtrap went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-socket went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-socket went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sort went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sort went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sort went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sort went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-storable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-storable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-storable went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-storable went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-strict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-strict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-strict went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-strict went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-subs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-subs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-subs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-subs went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sub-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sub-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sub-util went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sub-util went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-modules went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-modules went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-modules went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-modules went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-symbol went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-symbol went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-symbol went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-symbol went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-hostname went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-hostname went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-hostname went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-hostname went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-syslog went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-syslog went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-syslog went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-sys-syslog went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-base went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-base went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-base went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-base went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-color went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-parallelsession went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-parallelsession went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-parallelsession went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-parallelsession went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console-session went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-console went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file-session went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file-session went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-file went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-session went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-session went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-session went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-formatter-session went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness-env
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness-env
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness-env
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness-env
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-harness went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-object went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-object went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-object went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-object went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-aggregator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-aggregator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-aggregator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-aggregator went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-grammar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-grammar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-grammar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-grammar went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-array went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-array went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-array went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-array went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iteratorfactory went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iteratorfactory went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iteratorfactory went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iteratorfactory went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-process went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-process went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-process went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-process went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-stream went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-stream went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-stream went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator-stream went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-iterator went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-multiplexer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-multiplexer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-multiplexer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-multiplexer went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-bailout went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-bailout went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-bailout went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-bailout went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-comment went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-comment went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-comment went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-comment went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-resultfactory went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-resultfactory went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-resultfactory went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-resultfactory went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-plan went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-plan went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-plan went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-plan went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-pragma went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-pragma went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-pragma went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-pragma went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-test went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-test went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-test went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-test went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-unknown went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-unknown went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-unknown went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-unknown went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-version went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-version went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-version went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-version went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-result
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-result
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-result
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-result
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-yaml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-yaml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-yaml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-result-yaml went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-job went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-job went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-job went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-job went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-spinner went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-spinner went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-spinner went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler-spinner went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-scheduler went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-executable went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-executable went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-executable went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-executable went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-file went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-file went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-file went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-file went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-handle went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-handle went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-handle went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-handle went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-perl went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-perl went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-perl went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-perl went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-rawtap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-rawtap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-rawtap went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler-rawtap went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-sourcehandler went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-source
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-source
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-source
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser-source
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tap-parser went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-reader went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-reader went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-reader went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-reader went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-writer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-writer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-writer went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tap-parser-yamlish-writer went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-ansicolor
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-ansicolor
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-ansicolor
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-ansicolor
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-cap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-cap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-cap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-cap went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-complete
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-complete
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-complete
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-complete
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-readline
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-readline
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-readline
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-term-readline
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-io-scalar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-io-scalar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-io-scalar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-io-scalar went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-module went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-module went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-module went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-module went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester-color went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester-color went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-builder-tester went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-builder went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-builder went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-builder went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-builder went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-harness went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-harness went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-more went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-more went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-more went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-more went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-simple went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-simple went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capturerunner went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capturerunner went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capturerunner went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capturerunner went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-capture went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-delegate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-delegate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-delegate went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-test-tester-delegate went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-tester went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-tester went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-tester went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-tester went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-use-ok went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-use-ok went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-use-ok went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test-use-ok went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-test went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-abbrev went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-abbrev went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-abbrev went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-abbrev went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-balanced
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-balanced
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-balanced
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-balanced
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-parsewords
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-parsewords
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-parsewords
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-parsewords
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-tabs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-tabs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-tabs went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-tabs went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-wrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-wrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-wrap went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-text-wrap went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-queue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-queue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-queue went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-queue went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread-semaphore
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads-shared
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads-shared
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads-shared
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads-shared
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-threads went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-thread went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-array went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-array went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-array went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-array went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-file went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-file went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-handle went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-handle went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tie-hash-namedcapture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tie-hash-namedcapture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tie-hash-namedcapture went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-tie-hash-namedcapture went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-hash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-hash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-hash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-hash went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-memoize went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-memoize went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-refhash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-refhash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-refhash went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-refhash went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-scalar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-scalar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-scalar went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-scalar went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-stdhandle
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-stdhandle
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-stdhandle
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-stdhandle
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-substrhash
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-substrhash
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-substrhash
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-tie-substrhash
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-gmtime went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-gmtime went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-gmtime went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-gmtime went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-hires went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-hires went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-hires went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-hires went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-localtime
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-localtime
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-localtime
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-localtime
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-local went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-local went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-local went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-local went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-piece went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-piece went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-piece went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-piece went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-seconds went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-seconds went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-seconds went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-seconds went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-tm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-tm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-tm went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-time-tm went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-big5 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-big5 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-big5 went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-big5 went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-gb2312 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-gb2312 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-gb2312 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-gb2312 went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-jisx0208 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-jisx0208 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-jisx0208 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-jisx0208 went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-korean went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-korean went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-korean went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-korean went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-pinyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-pinyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-pinyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-pinyin went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-stroke went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-stroke went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-stroke went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-stroke went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-zhuyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-zhuyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-zhuyin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-cjk-zhuyin went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-af went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-af went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-af went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-af went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ar went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ar went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-as went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-as went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-as went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-as went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-az went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-az went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-az went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-az went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-be went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-be went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-be went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-be went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-bn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-bn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-bn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-bn went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ca went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ca went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ca went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ca went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cs went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cs went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-cy went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-da went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-da went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-da went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-da went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-de-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-de-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-de-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-de-phone went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ee went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ee went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ee went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ee went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-eo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-eo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-eo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-eo went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es-trad went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es-trad went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es-trad went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es-trad went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-es went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-et went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-et went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-et went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-et went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fa went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fil went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fil went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fil went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fil went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi-phone went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi-phone went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fi went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-fo went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-gu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-gu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-gu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-gu went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ha went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ha went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ha went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ha went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-haw went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-haw went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-haw went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-haw went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hi went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hr went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hu went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hu went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hy went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-hy went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ig went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ig went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ig went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ig went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-is went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-is went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-is went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-is went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ja went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ja went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ja went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ja went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kk went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kl went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kn went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kok went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kok went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kok went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-kok went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ko went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ko went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ko went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ko went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ln went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ln went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ln went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ln went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lt went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-lv went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mk went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ml went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ml went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mr went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mt went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-mt went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nb went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nb went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nn went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nso went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nso went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nso went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-nso went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-om went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-om went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-om went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-om went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-or went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-or went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-or went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-or went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pa went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-pl went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ro went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ro went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ro went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ro went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sa went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sa went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-se went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-se went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-se went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-se went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si-dict went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si-dict went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si-dict went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si-dict went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-si went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sk went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sl went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sl went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sq went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sq went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sq went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sq went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sr went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv-refo went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv-refo went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv-refo went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv-refo went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-sv went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ta went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ta went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ta went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ta went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-te went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-te went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-te went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-te went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-th went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-th went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-th went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-th went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tn went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tn went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-to went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-to went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-to went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-to went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tr went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-tr went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-uk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-uk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-uk went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-uk went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ur went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ur went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ur went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-ur went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-vi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-vi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-vi went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-vi went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wae went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wae went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wae went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wae went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-wo went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-yo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-yo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-yo went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-yo went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-big5 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-big5 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-big5 went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-big5 went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-gb went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-gb went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-gb went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-gb went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-pin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-pin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-pin went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-pin went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-strk went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-strk went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-strk went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-strk went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh went backwards which would break
package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh went backwards which would break
package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-zhu went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-zhu went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-zhu went backwards which would
break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package
perl-module-unicode-collate-locale-zh-zhu went backwards which would
break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-collate
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-collate
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-collate
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-collate
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-normalize
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-normalize
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-normalize
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-normalize
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-ucd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-ucd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-ucd went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicode-ucd went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicore went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicore went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicore went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-unicore went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-universal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-universal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-universal went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-universal went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-grent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-grent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-grent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-grent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-pwent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-pwent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-pwent went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-user-pwent went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8-heavy went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8-heavy went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8 went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-utf8 went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vars went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vars went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vars went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vars went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version-regex
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version-regex
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version-regex
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version-regex
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-version went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vmsish went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vmsish went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vmsish went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-vmsish went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings-register
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings-register
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings-register
went backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings-register
went backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-warnings went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-xsloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.27) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-xsloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-xsloader went
backwards which would break package feeds from (0:5.28.1-r0.0 to
0:5.24.4-r0.37) [version-going-backwards]
perl-5.24.4: Package version for package perl-module-xsloader went
backwards which would break package feeds from (0:5.28.1-r0.1 to
0:5.24.4-r0.30) [version-going-backwards]
perl-5.24.4: Package version for package perl-pod went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-pod went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-pod went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-pod went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-ptest went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl-ptest went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl-ptest went backwards
which would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl-ptest went backwards
which would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.27)
[version-going-backwards]
perl-5.24.4: Package version for package perl went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.30)
[version-going-backwards]
perl-5.24.4: Package version for package perl went backwards which
would break package feeds from (0:5.28.1-r0.0 to 0:5.24.4-r0.37)
[version-going-backwards]
perl-5.24.4: Package version for package perl went backwards which
would break package feeds from (0:5.28.1-r0.1 to 0:5.24.4-r0.30)
[version-going-backwards]


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
5eaf9e7b utils: Add aarch64 support to ioprio_set
not included in master yet:
f02114cb server/process: Ensure socket has a timeout set

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
14c291e1fb gcc-runtime: Add missing libc dependency
not included in master yet:
7e2ab991fa python/python3: use cc_basename to replace CC for checking compiler
ced915026d python-native: fix one do_populate_sysroot warning
aee47f3e82 netbase: add entry to /etc/hosts according to /etc/hostname
a09e2db43a sstate: add support for caching shared workdir tasks
c104a34166 grub2: Fix passing null to printf formats
6f364ff8c4 gnupg: Upgrade to 2.2.12 release
0224fec86b glibc: Upgrade towards 2.29 release
2486349782 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
b3ab29bdbb gcc-runtime: Drop building libmpx

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
ff6bead16 doxygen: Use SOURCEFORGE_MIRROR for SRC_URI
not included in master yet:
03cc27a60 modemmanager: Fix build with clang
8a4457898 waf-cross-answers: Add cross-answers-mips64el.txt
2a3c90d2a klibc: Fix build with clang
ace39a5ed nginx: update to version 1.15.7
06dbfb857 kexec-tools-klibc: fix build for mipsel and mips64el
6356e84d6 nginx: update stable version to 1.14.2
179a1b9ea gtest: update to 1.8.1
6230bda5e cpprest: inherit pkg-config to find brotli library
b758150d3 samba: fix build on qemumips64 with musl
9dde42319 kexec-tools-klibc: update to 2.0.18
3eb2001cd geoip: update SRC_URI
39a33ccca net-snmp: reproducibility: Strip host paths from ptest files
ad435ce50 bdwgc: upgrade 7.6.8 -> 7.6.10
69d7508ff s-suite: push SRCREV to version 3.0
89d92066b flatbuffers: update to 1.10.0
74c70e4e3 kexec-tools-klibc: implement the --no-dtb option for older
mips kernels
e96091be3 catch2: Upgrade to 2.5.0 release
8e9b063db collectd: Upgrade to 5.8.1 release
4f7807e30 opensc: Upgrade to 0.19.0
9aa4b0e3e rocksdb: Upgrade to 5.17.2
f664e60a8 efivar: 36 -> 37
9032c9150 libreport: 2.9.6 -> 2.9.7
abfa3264c python3-blivet: 3.1.1 -> 3.1.2
e3c01a487 python3-blivetgui: 2.1.9 -> 2.1.10
1cb43abbb python-pyparted/python3-pyparted: drop incorrect and redundant PV
e4a420466 usermode: 1.112 -> 1.113
f615ed05d lvm2/libdevmapper: drop unnecessary UPSTREAM_CHECK_URI and
UPSTREAM_CHECK_REGEX
6a557faa3 efibootmgr: fix conflicting types for 'efi_set_verbose'

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
9fc65c0 qtwebengine: Configure Ninja to honor PARALLEL_MAKE
not included in master yet:
0344856 qt5: upgrade to 5.11.3
815b81c qtbase: Fix build with clang/musl
20c2ef3 qtconnectivity: Ignore -Waddress-of-temporary when using clang
6f614f0 qtbase: Drop QMAKE_WAYLAND_SCANNER from clang mkspecs file
19c2b35 maliit: Disable tests
2493add qtwebkit: Fix build with clang
a8cd752 qt5-creator: Enable clang plugin support when clang is used as toolchain
50a58f3 qtbase: Consider clang when computing QMAKE_CXX.COMPILER_MACROS
8bff930 qtbase: Fix build with gcc9

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
a01bbed chromium-x11: Update to 71.0.3578.98.
not included in master yet:
~/oe/world/yoe

