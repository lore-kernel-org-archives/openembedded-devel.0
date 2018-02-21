Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6F54578771
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:11:11 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id j24so1109875pff.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=h21oMpZv4f75mb76WFjt79tGVsN1pnN2j+Sv+Ec4Z+k=;
	b=VdpDf/4PSe6+9h6Dc+uDj4jbb+7ZIQ1KPpwGyMjifwai4kHUPG633bR7CGO+bIlKAv
	2C6XgYwT696wDHio4JqA4z2mQaiarKTYFxmC+JFF6QnPbReMOydTYkL7hi38LEO0utLb
	GDf9Mo29Z3BrTwdg1fGNXIiy42Y8CHmCsX1jXPGUMh2KQ84Y8oA/j4nJDYpleMPYGVff
	gmMcTXEQsb3gUaNSlpmfXMQ8gitPyZeGAa8z32Oc0RtVUSxZe4dDbC/wGvY5sOt6JbGr
	xMcnAQC1oPw/LKckWmCa/uah7duhIdi45iE+Q3Had1xNm3qfg66wnvfCVn/JB3SoOxLj
	/KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=h21oMpZv4f75mb76WFjt79tGVsN1pnN2j+Sv+Ec4Z+k=;
	b=gKtmLbqzD6kNa+R1spbuJ7jAqOpYDW7QakXoke79NekbFJlQblQ7kP38bwMrOtxVJT
	bvVTiXQ6bobPBcbxoj8q0OTFeSs3RUNpXHZwz7cmj97ypLMpwI6vdmSeBZJz2h6FUkkr
	psYLPlRK3vJasUbS4JvrGF7P+dDzDy4SbeaFDq2YhHmiDpmDZUAEwOPySf9tarenDe2l
	ASSjR7MCS/9dnKwAg2qDbVkX3xqub4v700A0n/B3HxDj8W3m07xNW2TKJZsdSDgiA7Va
	F1TVfWhd7YPeRV+f4ORbCMiXS9cWQb+a7uuwNbCoXDYsIq9B0WmFnheO+wLOCEUsxd4W
	TYHw==
X-Gm-Message-State: APf1xPBGTWvQfV0ij+rTaA4v1vZYHe4T5u+Nfldhfv3tDfUM65cPzEUW
	xnuapRylr1pZYiWEF7+d7zhckA==
X-Google-Smtp-Source: AH8x226h+yPBr1HfYFM3U9yhkMIB0IpjZ95Z72NCMH8lLTjCtGmCYSFZVb+UYXwIAKGGgdOxi6rIgA==
X-Received: by 10.101.91.3 with SMTP id y3mr3671614pgq.149.1519243872249;
	Wed, 21 Feb 2018 12:11:12 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c016:4f69:9bdb:2d17?
	([2601:202:4000:1184:c016:4f69:9bdb:2d17])
	by smtp.gmail.com with ESMTPSA id
	w83sm12381921pfi.171.2018.02.21.12.11.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 12:11:11 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c4d663ea-307a-1228-b256-a07ec9d689ae@gmail.com>
Date: Wed, 21 Feb 2018 12:11:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of the world, Failed tasks 2018-02-19
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
X-List-Received-Date: Wed, 21 Feb 2018 20:11:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

== Failed tasks 2018-02-19 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180221_044331.log

=== common (9) ===
    * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.4.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:do_packagedata
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_compile

=== common-x86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb:do_compile

=== qemuarm (8) ===
    * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_compile

=== qemuarm64 (4) ===
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_configure

=== qemux86 (18) ===
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-x11_64.0.3282.167.bb:do_patch
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (1) ===
    * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_compile

=== Number of failed tasks (80) ===
{| class=wikitable
|-
|| qemuarm 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20180218_142004.log/ || http://errors.yoctoproject.org/Errors/Build/53665/
|-
|| qemuarm64 	|| 19	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20180219_155544.log/ || http://errors.yoctoproject.org/Errors/Build/53752/
|-
|| qemux86 	|| 28	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20180218_142004.log/ || http://errors.yoctoproject.org/Errors/Build/53664/
|-
|| qemux86_64 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20180219_152126.log/ || http://errors.yoctoproject.org/Errors/Build/53753/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (6) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||qa_pseudo
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||3	||host-user-contaminated
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20180220_232937.log/


    * ERROR: Nothing PROVIDES 'libpam' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in /home/jenkins/oe/world/shr-core/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264' has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-za/usr/lib/locale/en_ZA/LC_MEASUREMENT is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-mg-mg/usr/lib/locale/mg_MG/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nan-tw+latin/usr/lib/locale/nan_TW@latin/LC_CTYPE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 0	issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
1cf084c bitbake-user-manual: Added google-repo fetcher and REPODIR var.
not included in master yet: 
a01844e world-image: add extra target
770e595 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
cf35551 ltp: fix knob to control numa support
not included in master yet: 
d45f0ef waf.bbclass: check that waf exists before trying to execute it
51e3f5f libpam: be more strict about user's sanity
003531d iputils: add libidn dependency
3d8ed10 insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
f9f1c3a kernel-devicetree.bbclass: Use lowercase names for shell variables
79106a7 kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
f02a4c3 kernel.bbclass: use the consistent naming schema for initramfs
401a1d4 kernel.bbclass: move variables for kernel artifacts names to separate bbclass
e560aeb report-error: Allow to upload reports automatically
1a86ca0 sstate.bbclass: Do not cause build failures due to setscene errors
788c81e nativesdk-icecc-toolchain: Fix LIC_FILES_CHKSUM md5
2d696dc buildhistory.bbclass: metadata-revs show repo parent
6078457 metadata-revs: provide more information
2b2d59d qemux86: Add identical qemux86copy variant for tests
8ef5345 reproducible_build.bbclass: initial support for binary reproducibility
66272b4 cpio: provide cpio-replacement-native
238152c image_types.bbclass: improve cpio image reproducibility
fb90a5d rootfs-postcommands.bbclass: support binary reproducibility
d6d993b Revert "libepoxy: convert to meson build"
e14bcbb make-mod-scripts: change how some kernel module tools are built
4734075 make-mod-scripts: openssl for lttng-modules v1
43b88fc utils.py: Fix parallel_make limit
53f19fe pseudo: update to latest master
fd81a81 pseudo: bump SRCREV
5c69d85 Revert "pseudo: bump SRCREV"
c760ce6 pseudo.inc: drop --enable-epoll

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
0277d70 libcdio: update to version 2.0.0
not included in master yet: 
94ec700 wireguard: udpate to 20171221 version
df70f7a cim-schema-exper: 2.39.0 -> 2.50.0
ae25284 waf-cross-answers: Add cross-answers-aarch64_be.txt
962653b classes/recipes: Convert SkipPackage -> SkipRecipe
ef3aeac libgpiod: fix packaging of tools
8be761f samba: Add packagegroup
8562963 net-snmp: Fix compiler options with paths in net-snmp-config
cf41617 obexftp: use makefile instead of ninja cmake generator
69fdb96 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
1d769c0 dracut: 045 -> 046
cc1cdb1 geoipupdate: 2.4.0 -> 2.5.0
24dbba4 hwdata: 0.291 -> 0.298
a5ae85c ipc-run: 0.94 -> 0.96
f0ed491 tiptop: 2.3 -> 2.3.1
4d5aa07 libqmi: Update to version 1.20.0
1a962d7 mdns: Do not include nss.h with musl
1760264 alsa-oss: Upgrade to 1.0.28
373744b iscsi-initiator-utils: Upgrade to 2.0.876
427651e samba: Refresh musl pam patch
dbe51dc libyui-ncurses: Fix build with musl
96a2cd6 miniupnpd: update to 2.0.20180203 and add systemd service
764487a wireshark: Update Package to 2.2.12
15e12b0 wireshark: update to new 2.4 series
9cfaa3a python3-twisted: remove python3-twisted-src
617d02c opensaf: Upgrade to 5.18.02
7ea75fd libtalloc: Upgrade to 2.1.11
ee9af4a gtk-doc: fix build failures for libgdata and libunique
21378a4 python-cython: fill in missing rdepends
2c77a19 python-pyparsing: add nativesdk support
fe7bc75 python-cython: add nativesdk support
762c083 postfix: adapt pkg_postinst to postinst_intercept
09a106b geoip: 1.6.9 -> 1.6.11
6e83325 imsettings: 1.7.2 -> 1.7.3
740bc75 python-smbus: remove sed to replace i2c path
9f5059d python-pytest: update to version 3.4.0
5e2a971 python-cmd2: update to version 0.8.0
25917b3 python-pycryptodome: update to version 3.4.11
e630cdf python-msgpack: update to version 0.5.2
0a66e15 python-greenlet: update to version 0.4.13
f2950ac python-django: update to version 1.11.10
7484ead python-webcolors: update to version 1.8
95b3d77 tomoyo-tools: 20140601 -> 20170102
370ea57 waf-samba.bbclass: No longer inherit waf.bbclass
dae0a08 tk: 8.6.6 -> 8.6.8
d7828d2 php: update stable version 5.6.31 -> 5.6.33
c58f853 dhcpcd: update to 6.11.5
d7cf2db xrdp: enable cpliboard

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
3f2f3a0 qtbase: fix pcre PACKAGECONFIG
not included in master yet: 
6919759 qt5: refactor ptest
557ae92 Upgrade to Qt 5.10.1
2b7fc84 packagegroup-qt5-toolchain-target: Add qtcharts and qtmqtt

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
a413b4f Merge pull request #96 from rakuco/m64-167
not included in master yet: 


