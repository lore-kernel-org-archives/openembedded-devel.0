Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF30719AF
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 06:23:36 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id w26-v6so16294287qto.5
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2018 23:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=xsPgt7ZYm6YjcJLEU38eW705lcagh2C3TjWevk9WEag=;
	b=fWnCnRifgw3nyQFObxEW4Dq8xCUMOqpklwr6flpQuHRtyPzCBw4t8FrREtqPuQA7+h
	Epd/5IQNBZk4eHFqaqL7wy5mvAiw22PJbGG11ZCiMNajYg0x190mdBhThDURmNXJkryt
	U+emSOMavjb6FP7OeUMLFt2SLbLTTD/kYHGvp85bqxlleXINtMXHuNWD4wLBEgNo+Ivh
	aFh5qW7HSA/HlZuml9dEg8E8FwzbmlZ2Wt/uNypb9wpYTi+1IZM9rEb8S7916eMNMugK
	NoOV7OtkSBdnHZA58BEOw/austjVTRnZ1z/CA5g66Qjet2Wuw2KSV+dGPeNw1hcuJa+A
	+KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=xsPgt7ZYm6YjcJLEU38eW705lcagh2C3TjWevk9WEag=;
	b=I4+KTUCla1vnuzjyVM1/XATrLY5IU1GJgD0Im0Ha7WI8ND6hLJtxjGi7X7VAy/+gLv
	5vYz+ZvUDeQpb3a0T8fJlHfWB5GuIUbesbiomUHXsGcLdDGE7Vx1SGIbAqZRXgbty1Ag
	mXOh82KBltUCMQ+WgPcCRphuXZDiOXa0NEIM0PzXomO7v+6uL0uAyiGj693pBth5YKF5
	jWeho/sJJZ653ryf6/eTUCD1qdW3t7r15ffbdJ9ZV9QqN0SKPv1lOV5Ps6frJ3Xr7e/3
	YNZpwy7h0WpWcbpR5ZllwYpbv/Lvfmc3Hw+VjknfBMh1BAiSqUI08NuVGQ7OupKXnL/+
	coHg==
X-Gm-Message-State: AOUpUlEOKs1X+Jeur2ge9KGVnfdcxNd/SlzYbHk8YNR24jGU9efi5ukU
	g/dkP7tKB99IyQEf5Gb8BcgjB4AaXQ6YIxDEdOLpUw==
X-Google-Smtp-Source: AA+uWPzd+crwX7x3Ckn4plMXu6pDD7Nz79m0oOZHkx+q9m2Uz2ZssPpZSwGX/R7Z3KZod944vOg2zX0SiZ3A8Ht7qt4=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr14170442qvd.221.1534141416608; 
	Sun, 12 Aug 2018 23:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqaqH2U1vYHmzm-egPckwU_RVWB=PtwuGBdmwFMyzBdXw@mail.gmail.com>
In-Reply-To: <CAMKF1sqaqH2U1vYHmzm-egPckwU_RVWB=PtwuGBdmwFMyzBdXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Aug 2018 23:23:10 -0700
Message-ID: <CAMKF1spO_2XpYuwU7a=KtyDcbKwKRW6AbAsjah41QDkNMhVz0g@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-07-20
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
X-List-Received-Date: Mon, 13 Aug 2018 06:23:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all

The Jenkins nodes are on ship to come to mainland, as a result, we do
not have these reports as of now, I am expecting it to be another 3-4
weeks before they get installed in new locations and provisioned.
Until then I will rely on my local builders to keep the things going.

Thanks
-Khem
On Fri, Jul 20, 2018 at 4:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> == Failed tasks 2018-07-20 ==
>
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180720_125830.log
>
> === common (3) ===
>     * sources/openembedded-core/meta/recipes-graphics/wayland/weston_4.0.0.bb:do_compile
>     * sources/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb:do_compile
>     * virtual:native:sources/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb:do_compile
>
> === common-x86 (1) ===
>     * sources/meta-qt5/recipes-qt/qt5/qtremoteobjects_git.bb:do_compile
>
> === qemuarm (9) ===
>     * sources/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_18.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile
>     * sources/openembedded-core/meta/recipes-bsp/grub/grub-efi_2.02.bb:do_mkimage
>     * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.27.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb:do_compile
>     * sources/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb:do_compile
>     * sources/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb:do_compile
>
> === qemuarm64 (5) ===
>     * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qtwebkit-examples_git.bb:do_compile
>     * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-devtools/go/go_1.9.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa
>
> === qemux86 (24) ===
>     * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb:do_compile
>     * sources/meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
>     * sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb:do_compile
>     * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
>     * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
>     * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
>     * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
>     * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.115.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
>     * sources/meta-openembedded/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>     * sources/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.7.bb:do_compile
>     * sources/openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.6.bb:do_compile
>     * sources/openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
>     * sources/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb:do_compile
>     * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.28.0.bb:do_compile
>     * sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.1.bb:do_compile
>
> === qemux86_64 (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_git.bb:do_install
>
> === Number of failed tasks (66) ===
> {| class=wikitable
> |-
> || qemuarm || 12 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180720_043926.log/
> ||
> |-
> || qemuarm64 || 13 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180720_054152.log/
> ||
> |-
> || qemux86 || 30 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180720_043933.log/
> ||
> |-
> || qemux86_64 || 11 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180720_053436.log/
> ||
> |}
>
> === PNBLACKLISTs (0) ===
>
> === QA issues (7) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||build-deps
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
> |-
> ||0 ||invalid-pkgconfig
> |-
> ||0 ||ldflags
> |-
> ||0 ||libdir
> |-
> ||0 ||pkgname
> |-
> ||0 ||qa_pseudo
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||unknown-configure-option
> |-
> ||0 ||version-going-backwards
> |-
> ||1 ||host-user-contaminated
> |-
> ||1 ||installed-vs-shipped
> |-
> ||7 ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180720_072140.log/
>
>
>     * ERROR: Nothing RPROVIDES 'qttranslations-qt' (but
> /home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> in /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'qttranslations-qt' (but
> /home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'qttranslations-qt' (but
> /home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> /home/jenkins/oe/world/oe-build/build/tmpfs/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-*:
> PNBLACKLIST[android-system] = "depends on lxc from
> meta-virtualiazation which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 0 issue: libdir
>
>
> count: 7 issue: textrel
> ELF binary '/tmp/work/aarch64-bec-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test'
> has relocations in .text [textrel]
> ELF binary '/tmp/work/aarch64-bec-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
> has relocations in .text [textrel]
> glide-0.13.1: ELF binary
> '/tmp/work/i586-bec-linux-musl/glide/0.13.1-r0/packages-split/glide/usr/bin/glide'
> has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary
> '/tmp/work/aarch64-bec-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test'
> has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary
> '/tmp/work/i586-bec-linux-musl/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep'
> has relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
> '/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
> has relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
> '/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
> has relocations in .text [textrel]
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 0 issue: version-going-backwards
>
>
> count: 1 issue: host-user-contaminated
> glibc-locale-2.27: glibc-locale:
> /glibc-binary-localedata-hy-am/usr/lib/locale/hy_AM/LC_MEASUREMENT.tmp
> is owned by uid 3004, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
>
>
> count: 1 issue: installed-vs-shipped
> rdist: 1 installed and not shipped files. [installed-vs-shipped]
>
>
> count: 0 issue: unknown-configure-option
>
>
> count: 0 issue: symlink-to-sysroot
>
>
> count: 0 issue: invalid-pkgconfig
>
>
> count: 0 issue: pkgname
>
>
> count: 0 issue: ldflags
>
>
> count: 0 issue: compile-host-path
>
>
> count: 0 issue: qa_pseudo
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
> ~/oe/world/oe-build ~/oe/world/oe-build
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 9876b5d runqueue: Stop on first unsatisfied dependency
> not included in master yet:
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> ff0b682 systemd-boot: upgrade to 239
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 6a0efef ell: update to 0.6
> not included in master yet:
> 1bc94ef ell: update patch status to backport
> e8c2ef6 glibmm: Upgrade to 2.56.0
> 7d06612 augeas: Upgrade to 1.10.1
> d683635 libkcapi: Add new recipe for v1.1.1
> 017f4a6 volume-key: Upgrade to 0.3.10
> f8904d0 mbedtls: Upgrade to 2.11.0
> be597c0 blueman: Package orphan'ed files when systemd is enabled
> cccf8fc rsyslog: Disable valgrind support on risv64
> 2de6f8d nanomsg: add recipe
> 50e8ed5 mozjs: 17.0.0 -> 52.8.1
> 5cf053a polkit: 0.113 -> 0.115
> d3cbf50 nativesdk-lvm2: Fix installed-vs-shipped errors
> 0f162eb libgnome-keyring: Force ARM ISA on arm arches <= v5
> 1be211b ndctl: Add the NDCTL package
> 3780374 bonnie++: Upgrade to 1.04
> b593619 tinyalsa: Add -fPIC to compile flags
> 79ece49 libmxml: update to current git master (ba3cca8)
> 9395425 python-py.inc: add ${PYTHON_PN}-setuptools-scm-native to DEPENDS
> ad56caf xf86-video-ati: 7.8.0 -> 18.0.1
> 03dc6a0 vim: provide xxd
> b7435f8 libblockdev: 2.16 -> 2.18
> 891ab7b mm-common: 0.9.11 -> 0.9.12
> 8e03525 multipath-tools: upgrade 0.7.1 -> 0.7.7
> ebb9f48 numactl: 2.0.11 -> 2.0.12
> cde33c2 oprofile: 1.1.0 -> 1.1.2
> c0ce321 pps-tools: 0.0.0+gitX -> 1.0.2
> e52df9c python-pygobject: 3.28.0 -> 3.28.3
> 8629b9c tclap: upgrade 1.2.1 -> 1.2.2
> b53a3e4 udisks2: 2.7.6 -> 2.7.7
> f5e6d90 cryptsetup: Upgrade to 2.0.3
> 7f84733 cppzmq: use cmake to install the package
> b6fdd31 libnice: Upgrade to 0.1.14
> d1781cc libiio: fix build of python bindins
> c138008 python-pyzmq, python3-pyzmq: update to 17.1.0
> 359700b samba: Delete remain of LSB.
> 4d5c1e9 liblockfile: Upgrade to 1.14
> a3e6422 protobuf-c: fix build error with protobuf 3.6.0.1
> d1aff96 fio: Upgrade to 3.7
> 076f010 ser2net: upgrade to version 3.5
> 4145f16 ctdb: Has been integrated into samba. So, there is no need to
> maitain this recipe anymore.
> 1437175 mozjs: add support for mips64-n32
> 4255d9d kodi: Upgrade to upcoming kodi v18 'Leia'
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 2736dcf qtbase: Add a kde PACKAGECONFIG
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> d807b90 chromium-x11: Update to 67.0.3396.99
> not included in master yet:
> ~/oe/world/oe-build

