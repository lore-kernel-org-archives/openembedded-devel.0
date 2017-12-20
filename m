Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 28CDF719B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 13:59:16 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 9so10029696wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F/ad/h0aWJHjEFAt/wNN5fyxBGFwkU5Lc6PhsKoHGVo=;
	b=isW8F1gVgdLuz0vozXwOp6Hneb1CUbn0k5vHAS2dw5NaIqr1mqhKlnFRIvA7X82hXK
	iiB3Q/LQTV86p08ZxCF+LFFu2Ox+K5UPwx6rHaqXRkmClFVRlGPpRqwsCC4x6yvQEpWP
	fxV/UOFIQfp3+1/RqBbtr35/OKNVW/jOrLTmZwTPWc35g/JzF5IJLrqycTgk8LX3LjpV
	WIphAcMCijkKhFLTCjlOnGWyUfSh5DFXbej1fqPrUi71WMxjRdMjtaIb+vQk/qaa4UDG
	8lL+toj7SQGav92T1RNnpkLD9R/HNl6XiUwLH5tE7dppKMx+XkN2Ft3WTkroJ8sYdQ70
	DrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F/ad/h0aWJHjEFAt/wNN5fyxBGFwkU5Lc6PhsKoHGVo=;
	b=X1datC6/wOO8fPUApnlhn/knwtS1FOa9gJI4TWMnaNfHJjuHar/8/CipbdDm1nL2No
	JGl5jURQCW4pBrnp9zpXcO0l0Pv+hI4r6SYleyuHwEAfh1zFejqlGnuNMFSSHnPH2Hba
	eUrQNYXghQ2LOiNLXTi98zDJTqD0/f4ukeU9qj6uCtcg9VlbUJ6fEyWr2KvFDnr8LLtH
	x6DQY26s+JAf8tC5QJp8mgdUrknajgppDEylcnpitIETE6iJ+8QCJCzIPxRHTgRJDkQ7
	yTZbQh5uq7WNmO6cdUwp2kQutmpBra49AbU94Dvp6y0P533D4rskTTw7aUY03MSouXdt
	EwkQ==
X-Gm-Message-State: AKGB3mKAhdu8B7sWHdn7GF13ZldYR/BCOWGMTQ+A5kaXots6E+31lDQi
	AZnJjCeP7N+hFEbpawNd5LzSUY4tO/qhn9CD57o=
X-Google-Smtp-Source: ACJfBotoVRzxUbusvKhwWL5/MBGkXJaSWl88Xg0S+XePJgkaRZedaSS4k2UjLAlO3+S+1pJ7SMVtAEDsi0QqP1YZ4w8=
X-Received: by 10.80.137.195 with SMTP id h3mr5493321edh.295.1513778357588;
	Wed, 20 Dec 2017 05:59:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.178.38 with HTTP; Wed, 20 Dec 2017 05:59:17 -0800 (PST)
In-Reply-To: <1f1db4cf-17aa-d1e3-4b0d-305d37dd029d@gmail.com>
References: <1f1db4cf-17aa-d1e3-4b0d-305d37dd029d@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 20 Dec 2017 14:59:17 +0100
Message-ID: <CAAQYJAvXqZhLxrM9dRtbMXLpPb8Qni_PLrVxhu2M7O2_4-kzog@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-12-17
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
X-List-Received-Date: Wed, 20 Dec 2017 13:59:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2017 at 8:49 PM, akuster808 <akuster808@gmail.com> wrote:
> This build included some meta-python changes that had v2 after the build
> started.
>
>
> =3D=3D Failed tasks 2017-12-17 =3D=3D
>
> INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20171219_092527.log
>
> =3D=3D=3D common (7) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb:do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1=
.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3=
.2.2.bb:do_install
>     * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.b=
b:do_configure
>     * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinypro=
xy_1.8.4.bb:do_prepare_recipe_sysroot
>     * meta-openembedded/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-e=
ngine_3.2.0.bb:do_compile
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtimageformats_git.bb:do_package_qa
>
> =3D=3D=3D qemuarm64 (4) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb:d=
o_compile
>

Hello,

I had no time before but I plan to fix/mask the 2 failing -klibc
recipes for aarch64 very soon.
Cheers
Andrea


> =3D=3D=3D qemux86 (29) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_compile
>     * meta-browser/recipes-browser/chromium/chromium-x11_62.0.3202.94.bb:=
do_compile
>     * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
>     * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_=
4.7.0.bb:do_patch
>     * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-u=
tils/iscsi-initiator-utils_2.0.874.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
.17.07.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
.3.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.5=
0.9.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
.8beta5.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_comp=
ile
>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.3.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3=
274.0.r517731.igalia.1.bb:do_configure
>
> =3D=3D=3D Number of failed tasks (64) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 9     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm.20171217_061219.log/ || http://errors.yoctoproject=
.org/Errors/Build/49645/
> |-
> || qemuarm64    || 11    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm64.20171217_192737.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/49656/
> |-
> || qemux86      || 36    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86.20171217_061210.log/ ||
> |-
> || qemux86_64   || 8     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86-64.20171217_181152.log/ || http://errors.yoctoproj=
ect.org/Errors/Build/49649/
> |}
>
> =3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D
>
> =3D=3D=3D QA issues (1733) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||1416  ||version-going-backwards
> |-
> ||1     ||host-user-contaminated
> |-
> ||1     ||installed-vs-shipped
> |-
> ||2     ||textrel
> |-
> ||313   ||qa_pseudo
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20171218_190339.log/
>
>
>     * ERROR: Nothing RPROVIDES 'python3-blinker' (but /home/jenkins/oe/wo=
rld/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-=
flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb =
RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'python3-blinker' (but /home/jenkins/oe/wo=
rld/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-=
flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-qt5:
> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 2        issue: textrel
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has=
 relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.14=
8' has relocations in .text [textrel]
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 1416     issue: version-going-backwards
>
> SEE logs ...
>
> count: 1        issue: host-user-contaminated
> qtimageformats-5.9.2+gitAUTOINC+dc6dc3b088: qtimageformats: /qtimageforma=
ts-plugins/usr/lib/qt5/plugins/imageformats/libqicns.so is owned by uid 300=
4, which is the same as the user running bitbake. This may be due to host c=
ontamination [host-user-contaminated]
>
>
> count: 1        issue: installed-vs-shipped
> rdist: 1 installed and not shipped files. [installed-vs-shipped]
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
> count: 313      issue: qa_pseudo
>
> see logs
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> ebce92b providers: Fix determinism issue
> not included in master yet:
> 23e9fb1 world-image: add extra target
> 0ebe0f9 fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:
> cf5c44a python-scons: upgrade to v3.0.1; use pypi.bbclass
> not included in master yet:
> d63975b kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
> ccda139 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
> 176b478 kernel.bbclass: use the consistent naming schema for initramfs
> 3257088 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
> 89b9ca1 report-error: Allow to upload reports automatically
> 25c290f buildhistory.bbclass: metadata-revs show repo parent
> a3a69b0 metadata-revs: provide more information
> db2a7ad qemux86: Add identical qemux86copy variant for tests
> cfdd497 reproducible_build.bbclass: initial support for binary reproducib=
ility
> 8068c7d cpio: provide cpio-replacement-native
> 2f55c6c image_types.bbclass: improve cpio image reproducibility
> 88da2ef rootfs-postcommands.bbclass: support binary reproducibility
> 0679219d sstate.bbclass: Do not cause build failures due to setscene erro=
rs
> 1d5af55 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> 817437f insane.bbclass: use package_qa_handle_error for do_qa_pseudo
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:
> acfb841 python3-dominate: new recipe
> not included in master yet:
> 40963dc bridge-utils: modify the AR to cross toolchain
> e2c1ca5 ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
> 8b51d74 dovecot: Fix parallel build
> c311a15 dnsmasq: update SRC_URI for versions 2.69 and earlier
> 94b31f9 postfix: fix send mail failure and eliminate warning
> a929047 openvpn: Upgrade 2.4.3 -> 2.4.4
> 81c58a0 arptables: Fix do_install task
> 8c2659a lksctp-tools: update and remove from blacklist
> 1b3d96f freediameter: add new recipe
> eb89348 net-snmp: support openssl without 3des
> 52d39f5 stunnel: fix compile error when openssl disable des support
> b32978c bridge-utils: update to v1.6
> 0db1b25 corosync: 2.4.2 -> 2.4.3
> bb807ea cyrus-sasl: virtual/db isn't used by core, change to db
> e593280 postfix: virtual/db isn't used by core, change to db
> f5e515e networkmanager: add consolekit only when x11 is enabled
> ac8940a iscsi-initiator-utils: check file existence before moving
> 933c8b1 iscsi-initiator-utils: remove the distro_features_check
> fddd4e9 open-isns: add sysvinit support
> 946b260 libtalloc: update to version 2.1.10
> f30ec2b libtevent: update to version 0.99.33
> 79f04d0 libtdb: update to version 1.3.15
> 4fcfa5b libldb: update to version 1.2.2
> 05ca3a2 Revert "samba: add missing RDEPENDS"
> 817c88a samba: move to version 4.7.0
> d217018 pcmciautils: add (from oe-core)
> 13842e8 chrony: Update to version 3.2
> c29eccb site: move from meta-oe to meta-networking
> e0c937c python-flask-bootstrap: move core of recipe to a .inc file
> 85e2aca python3-flask-bootstrap: new recipe
> d6043f2 python-flask-sqlalchemy: move core of recipe to a .inc file
> 3edf535 python3-flask-sqlalchemy: new recipe
> 6e5ab26 python-flask-wtf: move core of recipe to a .inc file
> 36e2aa8 python3-flask-wtf: new recipe
> 7e41245 python-visitor: move core of recipe to a .inc file
> 01ecbe4 python3-visitor: new recipe
> dc1f726 python-wtforms: move core of recipe to a .inc file
> 13cd7ce python3-wtforms: new recipe
> d6c746d python[3]-editor: new recipes
> eeac0bf python[3]-alembic: new recipes
> e4e3bec python[3]-fask-migrate: new recipes
> aac8349 python[3]-flask-nav: new recipes
> e8d6a21 python[3]-flask-uploads: new recipes
> e7c8f42 python[3]-flask-script: new recipes
> 7d08ec3 python[3]-flask-mail: new recipes
> 8362bf4 python[3]-flask-user: new recipes
> ac2bc88 python[3]-speaklater: new recipes
> a740b4e python[3]-flask-babel: new recipes
> 6ae571f python[3]-xstatic: new recipes
> 4fded11 python[3]-xstatic-font-awesome: new recipes
> 1382688 python[3]-flask-xstatic: new recipes
> 36688df openldap: fix QA Warning
> 4847acd passwdqc: add pam-passwdqc to RDEPENDS
> 56b43a9 glade: 3.20.0 -> 3.20.2
> d175bee nghttp: cleaned up the recipe
> a3a4c4b python-pyroute2: uprev to v0.4.21 (from 0.3.22)
> d81d5c1 inetutils: make -syslog rconflict with other system loggers
> ae435c3 net-snmp: fix invalid paths in target net-snmp-config
> f5abf3e xrdp: Add some scripts and patches
> 7836de2 gvfs: update 1.32.1 -> 1.34.1
> b3e39c3 plymouth: do not install systemd units manually
> c2aec27 plymouth: packageconfig gtk needs gtk+3 as depends
> e4cfcc1 plymouth: fix path to systemd-tty-ask-password-agent
> 7400d08 open-isns: Fix build with musl
> 6ecb460 tinyproxy: 'nobody' should belong to 'nogroup'
> 21f6462 Move RDEPENDS on libasound-module to bluez4 since it has been rem=
oved from bluez5
> 429c354 cifs-utils: mount.cifs should build without samba dependency
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> 06d1c47 qtwebengine: make test suite succeed
> not included in master yet:
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> 4dda3fb Merge pull request #79 from msisov/add-ozone-wayland-recipe
> not included in master yet:
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

