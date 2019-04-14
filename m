Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id D488D7D900
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 01:13:24 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z17so15419959qts.13
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2019 18:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=idZA65D26WMwZdRYsARjW1pGQL4JaWyAT5Bg4gP70WQ=;
	b=JO7dVUOOGrkdyOIlWwiqBQYux3tGQgJaq5UwTw7ceBD1pN862gPyZl7AEmA5oviD+r
	R145mocjcF7ryeiC2bzMHdNSWkJYISB71TBKYn4OCoTT4m2nlhWyYYQgESPv3fgT5yhi
	Xg6HbJqsu3YHV95dx5JRowWooXpPQ6sicRzNoarFje0IiE0/YnOksomb8BcJlptWZKlj
	YVsCAtkcYA4Ce3+qMk2CHUs5f5zW0NqSzB9hhV+7uyANGynugOKAVd0mBQYfd0TMKpOl
	4BudcD1w8iqcSW8praN7lMsOdIJNYVG4skFIhxoQq79q0X8ZyspdWj6G6XTUZ1Xn9zgn
	QSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=idZA65D26WMwZdRYsARjW1pGQL4JaWyAT5Bg4gP70WQ=;
	b=GsN2Y8sZgAViW6gI4Wdah2x+yfUMj7/DV9L862e9rL6jJPdr5gKU+56YPm9NOqwn+H
	O6Zr8QHB8Sy6N5lWKlJPP4Pwb2x37Zd/dcL9tBcg2HlqM7nw9b1qWoLKKUP0Ls45ZJnY
	ffaP1xwdF54L4D29c8oh1cDU4QeFv4zxGuRi9CwyCB3OXhoS/VY+NZNkXzxgInhKDUui
	kVOHAUirMAWI1o4N22A/mYl7s+wUQn9sQnpeISm3p4dPUjhamEG7KM/nQdThF6wr6Mwo
	lHYp0hpqNGj8u4/aeWb32J+y9FHAgeziBrmZvFt99Knmk4MXcjRfGWtSIW7MEcFj0UBl
	WH1w==
X-Gm-Message-State: APjAAAWsqLFos8uaxOAgIlyKZ0fSkm1BhYCPH91wj0aQsVXgjaeVBMho
	b8WouGnUZGMA0JlCBZcgpkt5zixlvuLt1VSz5bt06HZJVg8=
X-Google-Smtp-Source: APXvYqynvW7yZbIP7loNqHZsJk9lz2aKUxnlGNCLNj6p9ZrYveYBXA1z89gDliFiQ+XYtSdJYfFTmW+tG4zaEf58x4s=
X-Received: by 2002:a0c:b0ef:: with SMTP id p44mr41500637qvc.127.1555204405130;
	Sat, 13 Apr 2019 18:13:25 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Apr 2019 18:12:59 -0700
Message-ID: <CAMKF1so3sR7fJ7gV7SqfqajEg-BrjqgjUdcYwWMqa2OQKsh_sQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE World, 2019-04-12
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
X-List-Received-Date: Sun, 14 Apr 2019 01:13:25 -0000
Content-Type: text/plain; charset="UTF-8"

== Failed tasks 2019-04-12 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190413_180526.log

=== common (6) ===
    * sources/meta-freescale/recipes-bsp/firmware-qca/firmware-qca6174_2.0.1.bb:do_unpack
    * sources/meta-freescale/recipes-bsp/firmware-qca/firmware-qca9377_2.0.1.bb:do_unpack
    * sources/meta-freescale/recipes-bsp/firmware-qca/qca-tools_2.0.1.bb:do_unpack
    * sources/meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.12.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== common-x86 (1) ===
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
    * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (6) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.103.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa

=== qemux86 (5) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.103.bb:do_patch
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_73.0.3683.103.bb:do_patch
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.33.0.bb:do_compile

=== qemux86_64 (1) ===
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure

=== Number of failed tasks (52) ===
{| class=wikitable
|-
|| qemuarm || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190411_114626.log/
||
|-
|| qemuarm64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190411_223111.log/
||
|-
|| qemux86 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190411_114635.log/
||
|-
|| qemux86_64 || 15 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190412_003807.log/
||
|}

=== PNBLACKLISTs (2) ===

=== QA issues (44) ===
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
||1 ||textrel
|-
||3 ||build-deps
|-
||40 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190412_132011.log/


    * ERROR: Nothing PROVIDES 'ell' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'ell' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'ell' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
= " error: invalid use of incomplete type 'RCF::AsioIoService {aka
class boost::asio::io_service}; among others?"
sources/meta-qcom:
sources/meta-qt5:
sources/meta-raspberrypi:
sources/meta-riscv:
sources/meta-rust:
sources/meta-ti:
sources/meta-variscite-fslc:
sources/meta-yoe:
sources/openembedded-core:
meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
"Don't build this"
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
'/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]


count: 3 issue: build-deps
glide-0.13.2: glide rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-dep-0.5.0: go-dep rdepends on libstd-rs, but it isn't a build
dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]
go-helloworld-0.1: go-helloworld rdepends on libstd-rs, but it isn't a
build dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
[build-deps]


count: 0 issue: file-rdeps


count: 40 issue: version-going-backwards
apache2-2.4.34: Package version for package apache2-dbg went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.80)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-dbg went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.85)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-dev went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.80)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-dev went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.85)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-doc went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.80)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-doc went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.85)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-scripts went
backwards which would break package feeds from (0:2.4.39-r0.0 to
0:2.4.34-r0.80) [version-going-backwards]
apache2-2.4.34: Package version for package apache2-scripts went
backwards which would break package feeds from (0:2.4.39-r0.0 to
0:2.4.34-r0.85) [version-going-backwards]
apache2-2.4.34: Package version for package apache2-src went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.80)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2-src went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.85)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2 went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.80)
[version-going-backwards]
apache2-2.4.34: Package version for package apache2 went backwards
which would break package feeds from (0:2.4.39-r0.0 to 0:2.4.34-r0.85)
[version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs-dbg went
backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs-dev went
backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs-doc went
backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs-locale
went backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs-src went
backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package
python-attrs-staticdev went backwards which would break package feeds
from (0:19.1.0-r0.0 to 0:18.1.0-r0.85) [version-going-backwards]
python-attrs-18.1.0: Package version for package python-attrs went
backwards which would break package feeds from (0:19.1.0-r0.0 to
0:18.1.0-r0.85) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-dbg went backwards which would break package
feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-dev went backwards which would break package
feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-doc went backwards which would break package
feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-locale went backwards which would break package
feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-src went backwards which would break package
feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4-staticdev went backwards which would break
package feeds from (0:4.7.1-r0.0 to 0:4.6.0-r0.83)
[version-going-backwards]
python-beautifulsoup4-4.6.0: Package version for package
python-beautifulsoup4 went backwards which would break package feeds
from (0:4.7.1-r0.0 to 0:4.6.0-r0.83) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-dbg went backwards which would break package feeds from
(0:2019.3.9-r0.0 to 0:2018.8.13-r0.85) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-dev went backwards which would break package feeds from
(0:2019.3.9-r0.0 to 0:2018.8.13-r0.85) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-doc went backwards which would break package feeds from
(0:2019.3.9-r0.0 to 0:2018.8.13-r0.85) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-locale went backwards which would break package feeds
from (0:2019.3.9-r0.0 to 0:2018.8.13-r0.85) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-src went backwards which would break package feeds from
(0:2019.3.9-r0.0 to 0:2018.8.13-r0.85) [version-going-backwards]
python-certifi-2018.8.13: Package version for package
python-certifi-staticdev went backwards which would break package
feeds from (0:2019.3.9-r0.0 to 0:2018.8.13-r0.85)
[version-going-backwards]
python-certifi-2018.8.13: Package version for package python-certifi
went backwards which would break package feeds from (0:2019.3.9-r0.0
to 0:2018.8.13-r0.85) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-dbg went
backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-dev went
backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-doc went
backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-locale
went backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-src went
backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi-staticdev
went backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]
python-cffi-1.11.5: Package version for package python-cffi went
backwards which would break package feeds from (0:1.12.2-r0.0 to
0:1.11.5-r0.84) [version-going-backwards]


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
57e765e3 utils: Make prune_suffix prune a suffix
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
30c001cdbc insane.bbclass: Trigger unrecognzed configure option for meson
not included in master yet:
2c6fff3fe3 sanity: check_perl_modules bug fix
6b9963a58e opkg: add ptest
051e1c27bb recipetool: add missed module
5bad5eb5f4 systemd: install libnss-myhostname.so when myhostname be enabled
55acc9b477 ruby: make ext module fiddle can compile success
46f47b700e ruby: add ptest
68b9243729 kernel-devsrc: check for localversion files in the kernel source tree
72aace12a4 cogl: fix compile error caused by -Werror=maybe-uninitialized
a19a6201c8 ccmake.bbclass: Fix up un-escaped quotes in output formatting
6bef61d36f resulttool/manualexecution: Refactor and remove duplicate code
0eb4048bc5 perf: workaround the error cased by maybe-uninitialized warning
dbbc17a6b3 python3: add a tr-tr locale for test_locale ptest
d55c8978e8 go.bbclass: Remove unused override
d1134433ba goarch.bbclass: Simplify logic
d6a577c9d1 e2fsprogs: Skip slow ptest tests
bdf914c6b6 python3 fixup
ef0366db3f oeqa/runtime/ptest: Increase ptest timeout to 750s
e72c007c0e libatomic-ops:upgrade 7.6.8 -> 7.6.10
6c2cefdccf libgpg-error:upgrade 1.35 -> 1.36
543a2d36be libxft:upgrade 2.3.2 -> 2.3.3
47afff051a libxxf86dga:upgrade 1.1.4 -> 1.1.5
ae61fcf984 nss:upgrade 3.42.1 -> 3.43
ba6cfd495a sysprof:upgrade 3.30.2 -> 3.32.0
afc1180dff libtirpc:upgrade 1.0.3 -> 1.1.4
8b6d34ca38 xtrans:upgrade 1.3.5 -> 1.4.0
f9be1bf791 iproute2: update to 5.0.0
21247a0eff curl: update to 7.64.1
b8b7f9e9e2 libxext: update to 1.3.4
a74f30a87e x11perf: update to 1.6.1
fef822adfc libxdmcp: update to 1.1.3
8de21e4340 libxkbfile: update 1.1.0
efc7cde80c libxvmc: update to 1.0.11
d2e196ad85 libxrandr: update to 1.5.2
f9fc1b4db1 connman: update to 1.37
e4e70162db ethtool: update to 5.0
7db28cc123 tar: update to 1.32
0f9c010178 ffmpeg: update to 4.1.2
ca047f7c72 librepo: update to 1.9.6
29ae29ce91 libxmu: update to 1.1.3
6213940522 libxcrypt: update to 4.4.4
b8399a33e3 wget: update to 1.20.2
ec3fe3fdb8 libsecret: 0.18.8
a4b1f528eb createrepo-c: update to 0.12.2
476df1051e libinput: update to 1.13.0
db9cb17ada harfbuzz:upgrade 2.3.1 -> 2.4.0
a5714a40b3 dropbear: update to 2019.78
600e7718f0 cronie: update to 1.5.4
5b0b5cf180 weston: upgrade 5.0.0 -> 6.0.0
828c03fbbf libyaml: update to 0.2.2
a4ecd1a10c fontconfig: update to 2.13.1
b077402ce3 makedepend: update to 1.0.6
ca7bf983ee u-boot: Upgrade from 2019.01 to 2019.04
8c070ab063 gnutls: upgrade 3.6.5 -> 3.6.7
21e6801961 iw: upgrade 4.14 -> 5.0.1
c1c973c3b7 recipes: Add runit and related recipes
ab47e3e4e0 oeqa: Recognise svlogd as another logger
1d05130b40 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
515b3ffc75 gcc-cross-canadian: Make baremetal specific code generic

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
4a9deabbc lcdproc: Fix parallel build
not included in master yet:
6cd2bf04d smcroute: update to 2.4.4
495fff296 phytool: update to v2
c7b4b505c fwknop: update to 2.6.10
d4a87d6ed cifs-utils: update to 6.9
e23c5d206 keepalived: update to 2.0.15
807ecc405 usbredir: update to 0.8.0
b4a41340e open-isns: update to 0.99
0884fd8a0 nanomsg: update to 1.1.5
d17e065dd stunnel: update to 5.51
1077f7da3 babeld: update to 1.8.4
2285583bb drbd-utils: update to 9.8.0
313225236 drbd: update to 9.0.17-1
71117c3cf gvfs: remove executable permission from systemd user services
809933241 gd: fix compile error caused by -Werror=maybe-uninitialized
009e6efc5 python-cryptography: Move linker flag to .inc
937f96ccf macchanger: update to 1.7.0
4cf971e9a wolfssl: update to 4.0.0
f4a59c5dd ell: remove recipe
b3f296ae6 analyze-suspend: update to 5.3
e8db74cfb udisks2: upgrade 2.8.1 -> 2.8.2
fab25b251 parole: upgrade 1.0.1 -> 1.0.2
888706bed ristretto: upgrade 0.8.3 -> 0.8.4
3cabe2fee python-flask-socketio: move to meta-python directory
fb39a42a3 xlsatoms: upgrade 1.1.2 -> 1.1.3
5d04cdebd xrdb: upgrade 1.1.1 -> 1.2.0
948fb6f5f xrefresh: upgrade 1.0.5 -> 1.0.6
1b2fdea8f xsetroot: upgrade 1.1.1 -> 1.1.2
6c996d638 xstdcmap: upgrade 1.0.3 -> 1.0.4
4bc2baded xbitmaps: upgrade 1.1.1 -> 1.1.2
d219ba7a2 squid: upgrade squid 3.5.28 -> 4.6
a12a37659 ledmon: control hard disk led for RAID arrays
f035da4c3 chrony: update to 3.4
256f9738a wireshark: upgrade 3.0.0 -> 3.0.1
a5806d71c fatresize_1.0.2.bb: Add recipe for fatresize command line tool
fc144a142 networkmanager: rework musl build
be6481ca9 lua: upgrade from v5.3.4 to v5.3.5
0477c7611 multipath-tools: fix up patch to avoid segfault
35d7162c8 sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
a4bf240 qtbase-native: add native libdir to search path
not included in master yet:
95974f4 qtbase, qtmultimedia: refresh patches to apply cleanly and
update them on github.com/meta-qt5 forks

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
2848153 chromium: Update to 73.0.3683.103
not included in master yet:
~/oe/world/yoe

