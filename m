Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 17CC7700F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 04:07:58 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id d6so3693036pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2018 20:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=FuBrZwlyZsWjKRG0aZgh67K4a1eAg5PdBIrIccRGSdQ=;
	b=YbPzMIlThZzWb2ZQrTWvF/oSP5osUn++Bg1Dp2xWvU34GrnMIpUZ7mzKOkD23u2D9A
	7IhwwyosMNzeZhMNXoPlyN6B0fgfxAOpo/jkphRaw1CN95K6S+vLH4VtCbYXjUO3JlB5
	06N07VX9Z0NAOTwvNKJoYMBaLO0HOed3BURrCLieD/fTxoRBBSXKOSbOocXEK9j9NPhQ
	Ow9HyfGT1l5gqQZ/QHRTwv5MPOA1+mJRhogZL+n9M1lQYMUAO7V7j1WmNAR6K5fZUaHu
	icOsr6iOFw+OjkBFCCd/pr6ZyFINqlylns2rK1uV1s/ElrIsqaCUlOLu+Uixd6aOYMvG
	CkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=FuBrZwlyZsWjKRG0aZgh67K4a1eAg5PdBIrIccRGSdQ=;
	b=GIeZqmoOAU8doTx+GYsK64vZtVh+U/5cnm2D8TbfdegImb8eC/Qzp356rikJ2x5XEQ
	afpt4fu7fEzqfBMSCC6LzsBMZe2o3Xghoo0iiDMM0NSx7ToGzXaTnY+ZttGpl4RTI7Zv
	pVcsh4bhM3uaHlTj9gg5QV12F/f2HKQdUqbBzRQThzaGhz7NhAUuApwGwqO3o7+sm8WM
	ArIptgnWfO2DCIhdPQOBf1qKLe2FDCdI5ipHTlZEONrzKJEBeMa0imYVudjqBT4sbRiV
	tEOsm90UcB8c6z8cmgrOqLnA/h7y2qeanGIrGNUuD5IeMjHTbmLXCqJsT2KYORmvGkku
	Xrdg==
X-Gm-Message-State: AKGB3mLxknEZ+9tZ+hrHNHf4czgIdXSiVXbH+NB/skpkPhPBZQUtgyNA
	cINGC/D7jpsGNQ1k3+B/1gbsJw==
X-Google-Smtp-Source: ACJfBotABkkttSoCKekyO2hxY1yktsM+QV8yj/uZKsGncfx5z0/JovgyjAyJHb9yosZnvvMxULtk/w==
X-Received: by 10.98.227.21 with SMTP id g21mr134085pfh.152.1515384479778;
	Sun, 07 Jan 2018 20:07:59 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:d3a:c846:b190:ee80?
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	z74sm25517254pfi.123.2018.01.07.20.07.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jan 2018 20:07:59 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8acb3bd4-1f17-6ac6-305a-f9dfcd22ada7@gmail.com>
Date: Sun, 7 Jan 2018 20:07:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2018-01-05
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
X-List-Received-Date: Mon, 08 Jan 2018 04:07:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


=3D=3D Failed tasks 2018-01-05 =3D=3D

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180107_110750.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_fetch
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_configure
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3=
=2E2.2.bb:do_install
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguar=
d-module_0.0.20170810.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.b=
b:do_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_=
compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
ompile

=3D=3D=3D qemuarm64 (5) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:d=
o_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
onfigure

=3D=3D=3D qemux86 (29) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-x11_62.0.3202.94.bb:=
do_compile
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compil=
e
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_=
4.7.0.bb:do_patch
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-u=
tils/iscsi-initiator-utils_2.0.874.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
=2E17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
=2E3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.5=
0.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
=2E8beta5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.=
bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6=
=2E1.bb:do_compile

=3D=3D=3D Number of failed tasks (64) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/=
log.world.qemuarm.20180104_092440.log/ || http://errors.yoctoproject.org/=
Errors/Build/50242/
|-
|| qemuarm64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemuarm64.20180105_125631.log/ || http://errors.yoctoproject=
=2Eorg/Errors/Build/50363/
|-
|| qemux86 	|| 35	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20180104_092657.log/ || http://errors.yoctoproject.org=
/Errors/Build/50241/
|-
|| qemux86_64 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemux86-64.20180105_124411.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D

=3D=3D=3D QA issues (543) =3D=3D=3D
{| class=3Dwikitable
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
|-
||537	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20180106_200351.log/


    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPE=
NDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' h=
as relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.=
148' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-es-co/usr/lib/l=
ocale/es_CO/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-gu-in/usr/lib/l=
ocale/gu_IN/LC_NUMERIC is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-mai-np/usr/lib/=
locale/mai_NP/LC_PAPER is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]

=C2=A0This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
dcd58d3 toaster: corrupted patch for bldcollector URL file
not included in master yet:=20
73fcf8d world-image: add extra target
245cb55 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
65652f4 site/common: Allow ac_cv_path_SED to be overridden
not included in master yet:=20
96c92af kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
e808e33 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
ce5f114 kernel.bbclass: use the consistent naming schema for initramfs
576dd51 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
6389eb4 report-error: Allow to upload reports automatically
464b7e0 buildhistory.bbclass: metadata-revs show repo parent
b23005e metadata-revs: provide more information
a553548 qemux86: Add identical qemux86copy variant for tests
cffaeea reproducible_build.bbclass: initial support for binary reproducib=
ility
13f91f3 cpio: provide cpio-replacement-native
6ee6a06 image_types.bbclass: improve cpio image reproducibility
7e6f963 rootfs-postcommands.bbclass: support binary reproducibility
c81bfcf sstate.bbclass: Do not cause build failures due to setscene error=
s
00de676 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
4c78225 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
29a4983 python-pandas: add json to the RDEPENDS list
not included in master yet:=20
6337a5b open-isns: Fix build with musl
06c3e1e bridge-utils: modify the AR to cross toolchain
a160c6e ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
108fdae dovecot: Fix parallel build
265a92e dnsmasq: update SRC_URI for versions 2.69 and earlier
a63b09d postfix: fix send mail failure and eliminate warning
fa78560 openvpn: Upgrade 2.4.3 -> 2.4.4
81e55eb arptables: Fix do_install task
31da858 lksctp-tools: update and remove from blacklist
e8c4e1e freediameter: add new recipe
d7cc25f net-snmp: support openssl without 3des
eeba4c8 stunnel: fix compile error when openssl disable des support
5b92ebb bridge-utils: update to v1.6
9c41e16 corosync: 2.4.2 -> 2.4.3
4e7fed1 cyrus-sasl: virtual/db isn't used by core, change to db
b8083bf postfix: virtual/db isn't used by core, change to db
e09b019 networkmanager: add consolekit only when x11 is enabled
b8b2e6f iscsi-initiator-utils: check file existence before moving
2bc069b iscsi-initiator-utils: remove the distro_features_check
c8e8e00 open-isns: add sysvinit support
fac6329 libtalloc: update to version 2.1.10
216480e libtevent: update to version 0.99.33
1f9c16d libtdb: update to version 1.3.15
bd10fae libldb: update to version 1.2.2
5775a9d Revert "samba: add missing RDEPENDS"
3ebf330 samba: move to version 4.7.0
004f79f pcmciautils: add (from oe-core)
dfcc5b1 chrony: Update to version 3.2
07f9f00 site: move from meta-oe to meta-networking
115ddeb inetutils: make -syslog rconflict with other system loggers
de6783f net-snmp: fix invalid paths in target net-snmp-config
b033a7a cifs-utils: mount.cifs should build without samba dependency
6d89a24 wireshark: Update to 2.2.11
3613b1b tinyproxy: 'nobody' should belong to 'nogroup'
844b794 postfix: drop NATIVE_INSTALL_WORKS
1faf0df smstools3: update to 3.1.21; drop uneeded patches
2343558 smstools3: remove bash dependency on packaged scripts
78d1be7 stat: add the recipe from oe-core
4492ce3 protobuf: update to version 3.5.1
67726fd jsoncpp: update to version 1.8.4
9963d8f python-attrs: update to version 17.4.0
c48002a python-pandas: update to version 0.22.0
3d527b9 pypi: remove class that was added to oe-core
79a9f58 python-werkzeug: update to version 0.14
30d38b2 python-grpcio: update to version 1.8.2
2c3560d python-grpcio-tools: update to version 1.8.2
8769835 python-jsonpointer: add a python3 version of the recipe
2c764f5 python-jsonpatch: add a python3 version of the recipe
cd2da46 python-jsonpatch: update to version 1.21
50d9e43 nginx: update dev version to 1.13.8
3c99243 python-protobuf: update to version 3.5.1
dba99d4 openl2tp: add ptest support
58e118a kexec-tools-klibc: update to fix build issues after core changes.=

c2ba695 tinyproxy: fix build ERROR

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
3cf0bbb qtbase_git: install qt.conf for the target
not included in master yet:=20
0fd9104 packagegroup-qt5-qtcreator-debug: remove qtdeclarative-plugins

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet:=20


