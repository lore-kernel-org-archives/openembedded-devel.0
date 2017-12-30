Return-Path: <bill.randle@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 73A10600B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2017 23:18:20 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id o64so30597708oia.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2017 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i8bEdgJ3wHZBKDBkBeHZFDUQ56V8+w3AgTq1ovq0DEc=;
	b=h/jVdzNrZ2LIfw3bFr1+65QRQbfpwpGRTEF/5NnnlfFMjlNt/be3EBRfS4+femSirV
	fB6WSJvv/mR8MdGg0nZGLjEbPwORtjhkt+fDHW5tJUinJUFadopHS7dWgyEjEc0rua53
	9dplLJ9SWCXDxsOU9e9SAaZCyGLoOox/UTatjT0BVW7XpKq72AtMqFG92yENop48LkCc
	onHY+yo/y9ulQV3qq9u+Aj/G7vQHCGxjQ9aFrlXDLeL1JGeRRV7y+rf/AWaR+vE0ywdk
	Fs/fp94dj7KB7KQRneW5+tF+yryLEYkGefYL6TXLhuzEemcXLA6JYamk+0iJYtSwcbsC
	EX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i8bEdgJ3wHZBKDBkBeHZFDUQ56V8+w3AgTq1ovq0DEc=;
	b=umfdXUplFuSWpvkxuTHG5DdiKt4pS9Hc+CjR0DYMIR6HQm626ruqJWUE0Y2hu8/cJZ
	7hQOYBzEPU7HINTFtKBtPFWPwfPijhnfXCp94M6BpV1sJuBJa3yh44W5itf15lMVggQ7
	yD9kmpTP3ZDcmQ5g85h+JZLWobhe/4gjprWMo05l6K5fJMRpey59yDqBjTRGgDtD1zOj
	SavwrovtQpp8vyJIXU434vKcHw5h59odeiBoASVAiAHAQ+CDVEx/ZUHBtpITXNWT71aW
	yBxHp8LfwsdmSoTjxcG9/4qkaMJd/LxNYqRw7IyJKRxPLH3FI8LS+5dNOmxskz9vDXhg
	Sg4Q==
X-Gm-Message-State: AKGB3mIy6QOD5UnE72TnBdAjxwFnllRmsWhbapcIRQ3RDI1a0mXmkYGD
	Vjc03MdqIH9M2Wl7Du8OsE1q0/PhKSKAhdXTHy4=
X-Google-Smtp-Source: ACJfBovYDsy6G9aAin2zxhRKebHFyKtWbgZ+cNBnKRZGT8s9p2O24j/Zxqf2QiFneCqt45fnKuJ7/crex0qMBD+RDwU=
X-Received: by 10.202.71.207 with SMTP id u198mr25810922oia.280.1514675899571; 
	Sat, 30 Dec 2017 15:18:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Sat, 30 Dec 2017 15:18:18 -0800 (PST)
In-Reply-To: <02a1862d-11eb-db95-d1d1-3c9a612a0024@gmail.com>
References: <02a1862d-11eb-db95-d1d1-3c9a612a0024@gmail.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Sat, 30 Dec 2017 15:18:18 -0800
Message-ID: <CA+n--H_qFGcz+wkefaKz0uANV8=dBqmfa3vjpDQBM=DZOqrxeA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-12-28
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
X-List-Received-Date: Sat, 30 Dec 2017 23:18:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As to smstools3, there was a RDEPENDS for /bin/bash in the earlier .bb
file, but I removed it because the scripts worked fine for me on
Busybox (no bash) and it seemed a shame to force installing bash just
for this. I'll take a look the scripts and see if they really do
require bash, and if so, can be tweaked to not use any bashisms.

    -Bill

On Sat, Dec 30, 2017 at 2:33 PM, akuster808 <akuster808@gmail.com> wrote:
> Last planned build for 2017.
>
> Thanks to all who submit updates, fixes and comments.
>
> Happy New Year Too all.
>
>
> kind regards,
>
> Armin
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT START=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'4'|Failed tasks                     !!|=
Signatures                 !!colspan=3D'15'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemuarm64     ||qemux86       ||qemux86=
_64    ||all   ||already-stripped      ||libdir        ||textrel       ||bu=
ild-deps    ||file-rdeps    ||version-going-backwards       ||host-user-con=
taminated        ||installed-vs-shipped  ||unknown-configure-option      ||=
symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||ldflags    =
   ||compile-host-path     ||qa_pseudo     ||
> |-
> ||2017-12-28    ||10    ||12    ||35    ||8     ||0     ||0             |=
|0             ||2             ||0             ||3             ||1420      =
    ||1             ||1             ||0             ||0             ||0    =
         ||0             ||0             ||0             ||9             ||
> |}
>
> =3D=3D Failed tasks 2017-12-28 =3D=3D
>
> INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20171230_093533.log
>
> =3D=3D=3D common (7) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3=
.2.2.bb:do_install
>     * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguar=
d-module_0.0.20170810.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.b=
b:do_configure
>     * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinypro=
xy_1.8.4.bb:do_prepare_recipe_sysroot
>     * meta-openembedded/meta-oe/recipes-connectivity/smstools3/smstools3_=
3.1.21.bb:do_package_qa
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (3) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
ompile
>
> =3D=3D=3D qemuarm64 (5) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb:d=
o_compile
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_c=
onfigure
>
> =3D=3D=3D qemux86 (28) =3D=3D=3D
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
>     * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_compile
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
> =3D=3D=3D Number of failed tasks (65) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 10    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm.20171228_172031.log/ || http://errors.yoctoproject=
.org/Errors/Build/49924/
> |-
> || qemuarm64    || 12    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemuarm64.20171228_202957.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/49930/
> |-
> || qemux86      || 35    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86.20171228_172043.log/ || http://errors.yoctoproject=
.org/Errors/Build/49925/
> |-
> || qemux86_64   || 8     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/sumo/log.world.qemux86-64.20171228_203427.log/ || http://errors.yoctoproj=
ect.org/Errors/Build/49929/
> |}
>
> =3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D
>
> =3D=3D=3D QA issues (1436) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
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
> ||1420  ||version-going-backwards
> |-
> ||1     ||host-user-contaminated
> |-
> ||1     ||installed-vs-shipped
> |-
> ||2     ||textrel
> |-
> ||3     ||file-rdeps
> |-
> ||9     ||qa_pseudo
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20171228_232322.log/
>
>
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
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
> count: 3        issue: file-rdeps
> smstools3-3.1.21: /usr/bin/sendsms contained in package smstools3 require=
s /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]
> smstools3-3.1.21: /usr/bin/sms2unicode contained in package smstools3 req=
uires /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]
> smstools3-3.1.21: /usr/bin/unicode2sms contained in package smstools3 req=
uires /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]
>
>
> count: 1420     issue: version-going-backwards
> adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme=
-cursors went backwards which would break package feeds from (0:3.26.0-r0.8=
 to 0:3.26.0-r0.7) [version-going-backwards]
> adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme=
-hires went backwards which would break package feeds from (0:3.26.0-r0.8 t=
o 0:3.26.0-r0.7) [version-going-backwards]
> adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme=
-symbolic-hires went backwards which would break package feeds from (0:3.26=
.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
> adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme=
-symbolic went backwards which would break package feeds from (0:3.26.0-r0.=
8 to 0:3.26.0-r0.7) [version-going-backwards]
> adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme=
 went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.=
26.0-r0.7) [version-going-backwards]
> autoconf-archive-2016.09.16: Package version for package autoconf-archive=
-doc went backwards which would break package feeds from (0:2016.09.16-r0.8=
 to 0:2016.09.16-r0.7) [version-going-backwards]
> autoconf-archive-2016.09.16: Package version for package autoconf-archive=
 went backwards which would break package feeds from (0:2016.09.16-r0.8 to =
0:2016.09.16-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates-dbg=
 went backwards which would break package feeds from (0:20170717-r0.8 to 0:=
20170717-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates-dev=
 went backwards which would break package feeds from (0:20170717-r0.8 to 0:=
20170717-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates-doc=
 went backwards which would break package feeds from (0:20170717-r0.8 to 0:=
20170717-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates-loc=
ale went backwards which would break package feeds from (0:20170717-r0.8 to=
 0:20170717-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates-sta=
ticdev went backwards which would break package feeds from (0:20170717-r0.8=
 to 0:20170717-r0.7) [version-going-backwards]
> ca-certificates-20170717: Package version for package ca-certificates wen=
t backwards which would break package feeds from (0:20170717-r0.8 to 0:2017=
0717-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts-dbg w=
ent backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.=
24-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts-dev w=
ent backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.=
24-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts-doc w=
ent backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.=
24-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts-local=
e went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0=
.0.24-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts-stati=
cdev went backwards which would break package feeds from (0:0.0.24-r0.8 to =
0:0.0.24-r0.7) [version-going-backwards]
> cantarell-fonts-0.0.24: Package version for package cantarell-fonts went =
backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r=
0.7) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-dbg we=
nt backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7=
) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-dev we=
nt backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7=
) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-doc we=
nt backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7=
) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-locale=
 went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r=
0.7) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-static=
dev went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.=
5-r0.7) [version-going-backwards]
> docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4 went b=
ackwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [v=
ersion-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets-dbg went backwards which would break package feeds from (0:1.79.=
1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets-dev went backwards which would break package feeds from (0:1.79.=
1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets-doc went backwards which would break package feeds from (0:1.79.=
1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets-locale went backwards which would break package feeds from (0:1.=
79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets-staticdev went backwards which would break package feeds from (0=
:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
> docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-s=
tylesheets went backwards which would break package feeds from (0:1.79.1-r0=
.8 to 0:1.79.1-r0.7) [version-going-backwards]
> encodings-1.0.4: Package version for package encodings-dbg went backwards=
 which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [v=
ersion-going-backwards]
> encodings-1.0.4: Package version for package encodings-dev went backwards=
 which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [v=
ersion-going-backwards]
> encodings-1.0.4: Package version for package encodings-doc went backwards=
 which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [v=
ersion-going-backwards]
> encodings-1.0.4: Package version for package encodings-locale went backwa=
rds which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7)=
 [version-going-backwards]
> encodings-1.0.4: Package version for package encodings-staticdev went bac=
kwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1=
.7) [version-going-backwards]
> encodings-1.0.4: Package version for package encodings went backwards whi=
ch would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [versi=
on-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme-dbg =
went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0=
.7) [version-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme-dev =
went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0=
.7) [version-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme-doc =
went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0=
.7) [version-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme-loca=
le went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3=
-r0.7) [version-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme-stat=
icdev went backwards which would break package feeds from (0:1.3-r0.8 to 0:=
1.3-r0.7) [version-going-backwards]
> faenza-icon-theme-1.3: Package version for package faenza-icon-theme went=
 backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) =
[version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger-dbg went backwards which would break package feeds from =
(0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger-dev went backwards which would break package feeds from =
(0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger-doc went backwards which would break package feeds from =
(0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger-locale went backwards which would break package feeds fr=
om (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger-staticdev went backwards which would break package feeds=
 from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-addon-webconverger-20120228: Package version for package firefox-=
addon-webconverger went backwards which would break package feeds from (0:2=
0120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn=
-bd went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn=
-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en=
-gb went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en=
-us went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en=
-za went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es=
-ar went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es=
-cl went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es=
-es went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es=
-mx went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy=
-nl went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga=
-ie went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu=
-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi=
-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy=
-am went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb=
-no went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn=
-no went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa=
-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt=
-br went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt=
-pt went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-=
dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-=
dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-=
doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-=
locale went backwards which would break package feeds from (0:45.9.0esr-r3.=
8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-=
staticdev went backwards which would break package feeds from (0:45.9.0esr-=
r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son =
went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:=
45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv=
-se went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-db=
g went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-de=
v went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-do=
c went backwards which would break package feeds from (0:45.9.0esr-r3.8 to =
0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-lo=
cale went backwards which would break package feeds from (0:45.9.0esr-r3.8 =
to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-st=
aticdev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh we=
nt backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45=
.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh=
-cn went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw-dbg went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw-dev went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw-doc went backwards which would break package feeds from (0:45.9.0esr-r3=
.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw-locale went backwards which would break package feeds from (0:45.9.0esr=
-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw-staticdev went backwards which would break package feeds from (0:45.9.0=
esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
> firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh=
-tw went backwards which would break package feeds from (0:45.9.0esr-r3.8 t=
o 0:45.9.0esr-r3.7) [version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias-dbg went backwar=
ds which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) =
[version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias-dev went backwar=
ds which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) =
[version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias-doc went backwar=
ds which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) =
[version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias-locale went back=
wards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.=
7) [version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias-staticdev went b=
ackwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2=
.3.7) [version-going-backwards]
> font-alias-1.0.3: Package version for package font-alias went backwards w=
hich would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [ver=
sion-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common-dbg went ba=
ckwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0=
.9) [version-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common-dev went ba=
ckwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0=
.9) [version-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common-doc went ba=
ckwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0=
.9) [version-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common-locale went=
 backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0=
-r0.9) [version-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common-staticdev w=
ent backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.1=
8.0-r0.9) [version-going-backwards]
> gnome-common-3.18.0: Package version for package gnome-common went backwa=
rds which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) =
[version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-d=
bg went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.=
17-r0.7) [version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-d=
ev went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.=
17-r0.7) [version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-d=
oc went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.=
17-r0.7) [version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-l=
ocale went backwards which would break package feeds from (0:0.17-r0.8 to 0=
:0.17-r0.7) [version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-s=
taticdev went backwards which would break package feeds from (0:0.17-r0.8 t=
o 0:0.17-r0.7) [version-going-backwards]
> hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme w=
ent backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r=
0.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils-d=
bg went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:=
0.8.90-r5.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils-d=
ev went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:=
0.8.90-r5.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils-d=
oc went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:=
0.8.90-r5.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils-l=
ocale went backwards which would break package feeds from (0:0.8.90-r5.8 to=
 0:0.8.90-r5.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils-s=
taticdev went backwards which would break package feeds from (0:0.8.90-r5.8=
 to 0:0.8.90-r5.7) [version-going-backwards]
> icon-naming-utils-0.8.90: Package version for package icon-naming-utils w=
ent backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.=
90-r5.7) [version-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot-dbg went b=
ackwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [v=
ersion-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot-dev went b=
ackwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [v=
ersion-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot-doc went b=
ackwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [v=
ersion-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot-locale wen=
t backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7)=
 [version-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot-staticdev =
went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2=
.7) [version-going-backwards]
> initramfs-boot-1.0: Package version for package initramfs-boot went backw=
ards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [versi=
on-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug-dbg went=
 backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) =
[version-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug-dev went=
 backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) =
[version-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug-doc went=
 backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) =
[version-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug-locale w=
ent backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.=
7) [version-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug-staticde=
v went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-=
r0.7) [version-going-backwards]
> initramfs-debug-1.0: Package version for package initramfs-debug went bac=
kwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [ver=
sion-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-framework-=
base went backwards which would break package feeds from (0:1.0-r4.8 to 0:1=
.0-r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-deb=
ug went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0=
-r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-e2f=
s went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-=
r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-exe=
c went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-=
r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-mde=
v went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-=
r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-roo=
tfs went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.=
0-r4.7) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-ude=
v went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-=
r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live-dbg went backwards which would break package feeds from (0:=
1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live-dev went backwards which would break package feeds from (0:=
1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live-doc went backwards which would break package feeds from (0:=
1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live-locale went backwards which would break package feeds from =
(0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live-staticdev went backwards which would break package feeds fr=
om (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
> initramfs-module-setup-live-1.0: Package version for package initramfs-mo=
dule-setup-live went backwards which would break package feeds from (0:1.0-=
r4.8 to 0:1.0-r4.7) [version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-dbg went backwards =
which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-=
going-backwards]
> iso-codes-3.76: Package version for package iso-codes-dev went backwards =
which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-=
going-backwards]
> iso-codes-3.76: Package version for package iso-codes-doc went backwards =
which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-=
going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-af went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-am went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ar went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ast went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-as went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-az went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-be went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-bg went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-bn-in went b=
ackwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) =
[version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-bn went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-br went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-bs went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-byn went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ca went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-crh went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-cs went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-cy went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-da went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-de went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-dz went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-el went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-en went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-eo went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-es went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-et went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-eu went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-fa went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-fi went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-fo went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-fr went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ga went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-gez went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-gl went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-gu went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-haw went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-he went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-hi went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-hr went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-hu went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-hy went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ia went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-id went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-is went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-it went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ja went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ka went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-kk went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-km went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-kn went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-kok went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ko went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ku went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-lt went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-lv went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-mi went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-mk went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ml went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-mn went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-mr went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ms went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-mt went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-nb went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ne went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-nl went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-nn went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-nso went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-oc went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-or went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-pa went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-pl went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ps went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-pt-br went b=
ackwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) =
[version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-pt went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ro went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ru went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-rw went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-si went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sk went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sl went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-so went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sq went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sr+latin wen=
t backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.=
7) [version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sr went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sv went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-sw went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ta went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-te went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-th went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tig went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ti went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tk went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tl went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tr went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tt+iqtelif w=
ent backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r=
0.7) [version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-tt went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ug went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-uk went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-ve went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-vi went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-wal went bac=
kwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [v=
ersion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-wa went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-wo went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-xh went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-zh-cn went b=
ackwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) =
[version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-zh-hk went b=
ackwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) =
[version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-zh-tw went b=
ackwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) =
[version-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-locale-zu went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes-staticdev went back=
wards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [ve=
rsion-going-backwards]
> iso-codes-3.76: Package version for package iso-codes went backwards whic=
h would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-goin=
g-backwards]
> liberation-fonts-2.00.1: Package version for package liberation-fonts wen=
t backwards which would break package feeds from (1:2.00.1-r0.8 to 1:2.00.1=
-r0.7) [version-going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-adsp-sst-license went backwards which would break package feeds=
 from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-g=
oing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-adsp-sst went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ar3k-license went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ar3k went backwards which would break package feeds from (1:0.0=
+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwar=
ds]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ar9170 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ath10k-license went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ath10k went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ath6k went backwards which would break package feeds from (1:0.=
0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwa=
rds]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ath9k went backwards which would break package feeds from (1:0.=
0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwa=
rds]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-atheros-license went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm4329 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm4330 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm43340 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm4334 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm43362 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm4339 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm43430 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bcm4354 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-bnx2-mips went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-broadcom-license went backwards which would break package feeds=
 from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-g=
oing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-carl9170 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-dbg went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-dev went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-doc went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-gplv2-license went backwards which would break package feeds fr=
om (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goin=
g-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-i915-license went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-i915 went backwards which would break package feeds from (1:0.0=
+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwar=
ds]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-11-5 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-12-16 went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-hw-37-7 went backwards which would break package feeds from=
 (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-=
backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-hw-37-8 went backwards which would break package feeds from=
 (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-=
backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-license went backwards which would break package feeds from=
 (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-=
backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt-misc went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ibt went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-imx-sdma-imx6q went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-imx-sdma-imx7d went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-imx-sdma-license went backwards which would break package feeds=
 from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-g=
oing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-135-6 went backwards which would break package feeds fr=
om (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goin=
g-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-10 went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-12 went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-13 went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-16 went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-17 went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-7 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-8 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-3160-9 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6000-4 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6000g2a-5 went backwards which would break package feed=
s from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-=
going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6000g2a-6 went backwards which would break package feed=
s from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-=
going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6000g2b-5 went backwards which would break package feed=
s from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-=
going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6000g2b-6 went backwards which would break package feed=
s from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-=
going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6050-4 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-6050-5 went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-7260 went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-7265d went backwards which would break package feeds fr=
om (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goin=
g-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-7265 went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-8000c went backwards which would break package feeds fr=
om (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goin=
g-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-8265 went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-license went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi-misc went backwards which would break package feeds fro=
m (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going=
-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-iwlwifi went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-license went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-locale went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-marvell-license went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-mt7601u-license went backwards which would break package feeds =
from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-go=
ing-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-mt7601u went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-netronome-license went backwards which would break package feed=
s from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-=
going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-netronome went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-pcie8897 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-pcie8997 went backwards which would break package feeds from (1=
:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-bac=
kwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-qat-license went backwards which would break package feeds from=
 (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-=
backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-qat went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-qca went backwards which would break package feeds from (1:0.0+=
git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backward=
s]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-radeon-license went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-radeon went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ralink-license went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ralink went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8188 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8192ce went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8192cu went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8192su went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8723 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl8821 went backwards which would break package feeds from (1:=
0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-back=
wards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-rtl-license went backwards which would break package feeds from=
 (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-=
backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8686 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8688 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8787 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8797 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8801 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8887 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-sd8897 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-staticdev went backwards which would break package feeds from (=
1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-ba=
ckwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-ti-connectivity-license went backwards which would break packag=
e feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [ve=
rsion-going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-vt6656-license went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-vt6656 went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware went backwards which would break package feeds from (1:0.0+git0=
+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-whence-license went backwards which would break package feeds f=
rom (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-goi=
ng-backwards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-wl12xx went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package lin=
ux-firmware-wl18xx went backwards which would break package feeds from (1:0=
.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backw=
ards]
> mplayer-common-0.0.1: Package version for package mplayer-common-dbg went=
 backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1=
.7) [version-going-backwards]
> mplayer-common-0.0.1: Package version for package mplayer-common-dev went=
 backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1=
.7) [version-going-backwards]
> mplayer-common-0.0.1: Package version for package mplayer-common-doc went=
 backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1=
.7) [version-going-backwards]
> mplayer-common-0.0.1: Package version for package mplayer-common-locale w=
ent backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1=
-r1.7) [version-going-backwards]
> mplayer-common-0.0.1: Package version for package mplayer-common-staticde=
v went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.=
0.1-r1.7) [version-going-backwards]
> mplayer-common-0.0.1: Package version for package mplayer-common went bac=
kwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) =
[version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy-dbg went backwards which would break package feeds =
from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy-dev went backwards which would break package feeds =
from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy-doc went backwards which would break package feeds =
from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy-locale went backwards which would break package fee=
ds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy-staticdev went backwards which would break package =
feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesd=
k-buildtools-perl-dummy went backwards which would break package feeds from=
 (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> openzone-1.2.3: Package version for package openzone-black-slim went back=
wards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [=
version-going-backwards]
> openzone-1.2.3: Package version for package openzone-black went backwards=
 which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [versi=
on-going-backwards]
> openzone-1.2.3: Package version for package openzone-dbg went backwards w=
hich would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version=
-going-backwards]
> openzone-1.2.3: Package version for package openzone-dev went backwards w=
hich would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version=
-going-backwards]
> openzone-1.2.3: Package version for package openzone-doc went backwards w=
hich would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version=
-going-backwards]
> openzone-1.2.3: Package version for package openzone-fire-slim went backw=
ards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [v=
ersion-going-backwards]
> openzone-1.2.3: Package version for package openzone-fire went backwards =
which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [versio=
n-going-backwards]
> openzone-1.2.3: Package version for package openzone-ice-slim went backwa=
rds which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [ve=
rsion-going-backwards]
> openzone-1.2.3: Package version for package openzone-ice went backwards w=
hich would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version=
-going-backwards]
> openzone-1.2.3: Package version for package openzone-locale went backward=
s which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [vers=
ion-going-backwards]
> openzone-1.2.3: Package version for package openzone-staticdev went backw=
ards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [v=
ersion-going-backwards]
> openzone-1.2.3: Package version for package openzone went backwards which=
 would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-goi=
ng-backwards]
> openzone-1.2.3: Package version for package openzone-white-slim went back=
wards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [=
version-going-backwards]
> openzone-1.2.3: Package version for package openzone-white went backwards=
 which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [versi=
on-going-backwards]
> os-release-1.0: Package version for package os-release-dbg went backwards=
 which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-g=
oing-backwards]
> os-release-1.0: Package version for package os-release-dev went backwards=
 which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-g=
oing-backwards]
> os-release-1.0: Package version for package os-release-doc went backwards=
 which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-g=
oing-backwards]
> os-release-1.0: Package version for package os-release-locale went backwa=
rds which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [versio=
n-going-backwards]
> os-release-1.0: Package version for package os-release-staticdev went bac=
kwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [ver=
sion-going-backwards]
> os-release-1.0: Package version for package os-release went backwards whi=
ch would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going=
-backwards]
> packagegroup-core-buildessential-1.0: Package version for package package=
group-core-buildessential-dbg went backwards which would break package feed=
s from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-buildessential-1.0: Package version for package package=
group-core-buildessential-dev went backwards which would break package feed=
s from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-buildessential-1.0: Package version for package package=
group-core-buildessential-ptest went backwards which would break package fe=
eds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-buildessential-1.0: Package version for package package=
group-core-buildessential went backwards which would break package feeds fr=
om (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-clutter-1.0: Package version for package packagegroup-c=
ore-clutter-core-dbg went backwards which would break package feeds from (0=
:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-clutter-1.0: Package version for package packagegroup-c=
ore-clutter-core-dev went backwards which would break package feeds from (0=
:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-clutter-1.0: Package version for package packagegroup-c=
ore-clutter-core-ptest went backwards which would break package feeds from =
(0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-clutter-1.0: Package version for package packagegroup-c=
ore-clutter-core went backwards which would break package feeds from (0:1.0=
-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-device-devel-1.0: Package version for package packagegr=
oup-core-device-devel-dbg went backwards which would break package feeds fr=
om (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-device-devel-1.0: Package version for package packagegr=
oup-core-device-devel-dev went backwards which would break package feeds fr=
om (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-device-devel-1.0: Package version for package packagegr=
oup-core-device-devel-ptest went backwards which would break package feeds =
from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-device-devel-1.0: Package version for package packagegr=
oup-core-device-devel went backwards which would break package feeds from (=
0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-eclipse-debug-1.0: Package version for package packageg=
roup-core-eclipse-debug-dbg went backwards which would break package feeds =
from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-eclipse-debug-1.0: Package version for package packageg=
roup-core-eclipse-debug-dev went backwards which would break package feeds =
from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-eclipse-debug-1.0: Package version for package packageg=
roup-core-eclipse-debug-ptest went backwards which would break package feed=
s from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-eclipse-debug-1.0: Package version for package packageg=
roup-core-eclipse-debug went backwards which would break package feeds from=
 (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dbg went backwards which would break package feeds fr=
om (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dev-utils-dbg went backwards which would break packag=
e feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dev-utils-dev went backwards which would break packag=
e feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dev-utils-ptest went backwards which would break pack=
age feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dev-utils went backwards which would break package fe=
eds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-dev went backwards which would break package feeds fr=
om (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-extended-dbg went backwards which would break package=
 feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-extended-dev went backwards which would break package=
 feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-extended-ptest went backwards which would break packa=
ge feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-extended went backwards which would break package fee=
ds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-initscripts-dbg went backwards which would break pack=
age feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-initscripts-dev went backwards which would break pack=
age feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-initscripts-ptest went backwards which would break pa=
ckage feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-initscripts went backwards which would break package =
feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-libs-dbg went backwards which would break package fee=
ds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-libs-dev went backwards which would break package fee=
ds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-libs-ptest went backwards which would break package f=
eeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-libs went backwards which would break package feeds f=
rom (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-multiuser-dbg went backwards which would break packag=
e feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-multiuser-dev went backwards which would break packag=
e feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-multiuser-ptest went backwards which would break pack=
age feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-multiuser went backwards which would break package fe=
eds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-ptest went backwards which would break package feeds =
from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-sys-services-dbg went backwards which would break pac=
kage feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-sys-services-dev went backwards which would break pac=
kage feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-sys-services-ptest went backwards which would break p=
ackage feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-sys-services went backwards which would break package=
 feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-utils-dbg went backwards which would break package fe=
eds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-utils-dev went backwards which would break package fe=
eds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-utils-ptest went backwards which would break package =
feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline-utils went backwards which would break package feeds =
from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-full-cmdline-1.0: Package version for package packagegr=
oup-core-full-cmdline went backwards which would break package feeds from (=
0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-client-dbg went backwards which would break package feeds from (0:1.0-r=
2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-client-dev went backwards which would break package feeds from (0:1.0-r=
2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-client-ptest went backwards which would break package feeds from (0:1.0=
-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-client went backwards which would break package feeds from (0:1.0-r2.8 =
to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-server-dbg went backwards which would break package feeds from (0:1.0-r=
2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-server-dev went backwards which would break package feeds from (0:1.0-r=
2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-server-ptest went backwards which would break package feeds from (0:1.0=
-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-nfs-1.0: Package version for package packagegroup-core-=
nfs-server went backwards which would break package feeds from (0:1.0-r2.8 =
to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-core-ssh-dropbear-1.0: Package version for package packagegr=
oup-core-ssh-dropbear-dbg went backwards which would break package feeds fr=
om (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-dropbear-1.0: Package version for package packagegr=
oup-core-ssh-dropbear-dev went backwards which would break package feeds fr=
om (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-dropbear-1.0: Package version for package packagegr=
oup-core-ssh-dropbear-ptest went backwards which would break package feeds =
from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-dropbear-1.0: Package version for package packagegr=
oup-core-ssh-dropbear went backwards which would break package feeds from (=
0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-openssh-1.0: Package version for package packagegro=
up-core-ssh-openssh-dbg went backwards which would break package feeds from=
 (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-openssh-1.0: Package version for package packagegro=
up-core-ssh-openssh-dev went backwards which would break package feeds from=
 (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-openssh-1.0: Package version for package packagegro=
up-core-ssh-openssh-ptest went backwards which would break package feeds fr=
om (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-ssh-openssh-1.0: Package version for package packagegro=
up-core-ssh-openssh went backwards which would break package feeds from (0:=
1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for package =
packagegroup-core-standalone-sdk-target-dbg went backwards which would brea=
k package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for package =
packagegroup-core-standalone-sdk-target-dev went backwards which would brea=
k package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for package =
packagegroup-core-standalone-sdk-target-ptest went backwards which would br=
eak package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backward=
s]
> packagegroup-core-standalone-sdk-target-1.0: Package version for package =
packagegroup-core-standalone-sdk-target went backwards which would break pa=
ckage feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dbg went backwards which would break package feeds from=
 (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dev went backwards which would break package feeds from=
 (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-ptest went backwards which would break package feeds fr=
om (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug went backwards which would break package feeds from (0:=
1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-dbg went backwards which would break package feeds from (0:1.0-r40.8 to=
 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-dev went backwards which would break package feeds from (0:1.0-r40.8 to=
 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-ptest went backwards which would break package feeds from (0:1.0-r40.8 =
to 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-utils-dbg went backwards which would break package feeds from (0:1.0-r4=
0.8 to 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-utils-dev went backwards which would break package feeds from (0:1.0-r4=
0.8 to 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-utils-ptest went backwards which would break package feeds from (0:1.0-=
r40.8 to 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11-utils went backwards which would break package feeds from (0:1.0-r40.8 =
to 0:1.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-1.0: Package version for package packagegroup-core-=
x11 went backwards which would break package feeds from (0:1.0-r40.8 to 0:1=
.0-r40.7) [version-going-backwards]
> packagegroup-core-x11-base-1.0: Package version for package packagegroup-=
core-x11-base-dbg went backwards which would break package feeds from (0:1.=
0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-x11-base-1.0: Package version for package packagegroup-=
core-x11-base-dev went backwards which would break package feeds from (0:1.=
0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-x11-base-1.0: Package version for package packagegroup-=
core-x11-base-ptest went backwards which would break package feeds from (0:=
1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-core-x11-base-1.0: Package version for package packagegroup-=
core-x11-base went backwards which would break package feeds from (0:1.0-r1=
.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-chinese-dbg went backwards which would break package feeds =
from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-chinese-dev went backwards which would break package feeds =
from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-chinese-ptest went backwards which would break package feed=
s from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-chinese went backwards which would break package feeds from=
 (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-core-dbg went backwards which would break package feeds fro=
m (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-core-dev went backwards which would break package feeds fro=
m (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-core-ptest went backwards which would break package feeds f=
rom (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-core went backwards which would break package feeds from (0=
:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-dbg went backwards which would break package feeds from (0:=
1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-dev went backwards which would break package feeds from (0:=
1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-japanese-dbg went backwards which would break package feeds=
 from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-japanese-dev went backwards which would break package feeds=
 from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-japanese-ptest went backwards which would break package fee=
ds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-japanese went backwards which would break package feeds fro=
m (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype-ptest went backwards which would break package feeds from (=
0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-fonts-truetype-1.0: Package version for package packagegroup=
-fonts-truetype went backwards which would break package feeds from (0:1.0-=
r2.8 to 0:1.0-r2.7) [version-going-backwards]
> packagegroup-go-sdk-target-1.0: Package version for package packagegroup-=
go-sdk-target-dbg went backwards which would break package feeds from (0:1.=
0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-go-sdk-target-1.0: Package version for package packagegroup-=
go-sdk-target-dev went backwards which would break package feeds from (0:1.=
0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-go-sdk-target-1.0: Package version for package packagegroup-=
go-sdk-target-ptest went backwards which would break package feeds from (0:=
1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-go-sdk-target-1.0: Package version for package packagegroup-=
go-sdk-target went backwards which would break package feeds from (0:1.0-r0=
.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-qt5-qtcreator-debug-1.0: Package version for package package=
group-qt5-qtcreator-debug-dbg went backwards which would break package feed=
s from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
> packagegroup-qt5-qtcreator-debug-1.0: Package version for package package=
group-qt5-qtcreator-debug-dev went backwards which would break package feed=
s from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
> packagegroup-qt5-qtcreator-debug-1.0: Package version for package package=
group-qt5-qtcreator-debug-ptest went backwards which would break package fe=
eds from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
> packagegroup-qt5-qtcreator-debug-1.0: Package version for package package=
group-qt5-qtcreator-debug went backwards which would break package feeds fr=
om (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
> packagegroup-qt5-toolchain-target-1.0: Package version for package packag=
egroup-qt5-toolchain-target went backwards which would break package feeds =
from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk=
-target-dbg went backwards which would break package feeds from (0:1.0-r1.8=
 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk=
-target-dev went backwards which would break package feeds from (0:1.0-r1.8=
 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk=
-target-ptest went backwards which would break package feeds from (0:1.0-r1=
.8 to 0:1.0-r1.7) [version-going-backwards]
> packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk=
-target went backwards which would break package feeds from (0:1.0-r1.8 to =
0:1.0-r1.7) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dbg went backwards which would break package feeds from (0:1.0-r1=
3.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dbg went backwards which would break package feeds from (0:=
1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dev went backwards which would break package feeds from (0:=
1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-ptest went backwards which would break package feeds from (=
0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug went backwards which would break package feeds from (0:1.0-=
r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dev went backwards which would break package feeds from (0:1.0-r1=
3.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dbg went backwards which would break package feeds from =
(0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dev went backwards which would break package feeds from =
(0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended went backwards which would break package feeds from (0:1=
.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dbg went backwards which would break package feeds from =
(0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dev went backwards which would break package feeds from =
(0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics went backwards which would break package feeds from (0:1=
.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dbg went backwards which would break package feeds fro=
m (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dev went backwards which would break package feeds fro=
m (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-ptest went backwards which would break package feeds f=
rom (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools went backwards which would break package feeds from (0=
:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-ptest went backwards which would break package feeds from (0:1.0-=
r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dbg went backwards which would break package feeds from (0:1.=
0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dev went backwards which would break package feeds from (0:1.=
0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-ptest went backwards which would break package feeds from (0:=
1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk went backwards which would break package feeds from (0:1.0-r1=
3.11 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted went backwards which would break package feeds from (0:1.0-r13.11=
 to 0:1.0-r13.10) [version-going-backwards]
> packagegroup-tools-bluetooth-1.0: Package version for package packagegrou=
p-tools-bluetooth-dbg went backwards which would break package feeds from (=
0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
> packagegroup-tools-bluetooth-1.0: Package version for package packagegrou=
p-tools-bluetooth-dev went backwards which would break package feeds from (=
0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
> packagegroup-tools-bluetooth-1.0: Package version for package packagegrou=
p-tools-bluetooth-ptest went backwards which would break package feeds from=
 (0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
> packagegroup-tools-bluetooth-1.0: Package version for package packagegrou=
p-tools-bluetooth went backwards which would break package feeds from (0:1.=
0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
> packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce=
-base-dbg went backwards which would break package feeds from (0:1.0-r5.8 t=
o 0:1.0-r5.7) [version-going-backwards]
> packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce=
-base-dev went backwards which would break package feeds from (0:1.0-r5.8 t=
o 0:1.0-r5.7) [version-going-backwards]
> packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce=
-base-ptest went backwards which would break package feeds from (0:1.0-r5.8=
 to 0:1.0-r5.7) [version-going-backwards]
> packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce=
-base went backwards which would break package feeds from (0:1.0-r5.8 to 0:=
1.0-r5.7) [version-going-backwards]
> packagegroup-xfce-extended-1.0: Package version for package packagegroup-=
xfce-extended-dbg went backwards which would break package feeds from (0:1.=
0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
> packagegroup-xfce-extended-1.0: Package version for package packagegroup-=
xfce-extended-dev went backwards which would break package feeds from (0:1.=
0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
> packagegroup-xfce-extended-1.0: Package version for package packagegroup-=
xfce-extended-ptest went backwards which would break package feeds from (0:=
1.0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
> packagegroup-xfce-extended-1.0: Package version for package packagegroup-=
xfce-extended went backwards which would break package feeds from (0:1.0-r1=
0.8 to 0:1.0-r10.7) [version-going-backwards]
> packagegroup-xfce-multimedia-1.0: Package version for package packagegrou=
p-xfce-multimedia-dbg went backwards which would break package feeds from (=
0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-xfce-multimedia-1.0: Package version for package packagegrou=
p-xfce-multimedia-dev went backwards which would break package feeds from (=
0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-xfce-multimedia-1.0: Package version for package packagegrou=
p-xfce-multimedia-ptest went backwards which would break package feeds from=
 (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> packagegroup-xfce-multimedia-1.0: Package version for package packagegrou=
p-xfce-multimedia went backwards which would break package feeds from (0:1.=
0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e-dbg went backwards which would break package feeds from (0:7.4.0-r0.8 to =
0:7.4.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e-dev went backwards which would break package feeds from (0:7.4.0-r0.8 to =
0:7.4.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e-doc went backwards which would break package feeds from (0:7.4.0-r0.8 to =
0:7.4.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e-locale went backwards which would break package feeds from (0:7.4.0-r0.8 =
to 0:7.4.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e-staticdev went backwards which would break package feeds from (0:7.4.0-r0=
.8 to 0:7.4.0-r0.7) [version-going-backwards]
> phoronix-test-suite-7.4.0: Package version for package phoronix-test-suit=
e went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.=
4.0-r0.7) [version-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin-dbg went backwar=
ds which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [ver=
sion-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin-dev went backwar=
ds which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [ver=
sion-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin-doc went backwar=
ds which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [ver=
sion-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin-locale went back=
wards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [=
version-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin-staticdev went b=
ackwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1=
) [version-going-backwards]
> phpmyadmin-4.7.6: Package version for package phpmyadmin went backwards w=
hich would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version=
-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data-dbg went bac=
kwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) =
[version-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data-dev went bac=
kwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) =
[version-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data-doc went bac=
kwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) =
[version-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data-locale went =
backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.=
6) [version-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data-staticdev we=
nt backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-=
r0.6) [version-going-backwards]
> poppler-data-0.4.8: Package version for package poppler-data went backwar=
ds which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [ver=
sion-going-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin-dbg went backwards=
 which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-g=
oing-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin-dev went backwards=
 which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-g=
oing-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin-doc went backwards=
 which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-g=
oing-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin-locale went backwa=
rds which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [versio=
n-going-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin-staticdev went bac=
kwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [ver=
sion-going-backwards]
> ppp-dialin-0.1: Package version for package ppp-dialin went backwards whi=
ch would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going=
-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato-dbg went backwards which would break package feeds from (0:1-=
r0.8 to 0:1-r0.7) [version-going-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato-dev went backwards which would break package feeds from (0:1-=
r0.8 to 0:1-r0.7) [version-going-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato-doc went backwards which would break package feeds from (0:1-=
r0.8 to 0:1-r0.7) [version-going-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato-locale went backwards which would break package feeds from (0=
:1-r0.8 to 0:1-r0.7) [version-going-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato-staticdev went backwards which would break package feeds from=
 (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
> pulseaudio-client-conf-sato-1: Package version for package pulseaudio-cli=
ent-conf-sato went backwards which would break package feeds from (0:1-r0.8=
 to 0:1-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-=
dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.=
0-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-=
dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.=
0-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-=
doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.=
0-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-=
locale went backwards which would break package feeds from (0:1.0-r0.8 to 0=
:1.0-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-=
staticdev went backwards which would break package feeds from (0:1.0-r0.8 t=
o 0:1.0-r0.7) [version-going-backwards]
> qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles =
went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0=
.7) [version-going-backwards]
> resolvconf-1.79: Package version for package resolvconf-dbg went backward=
s which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [versio=
n-going-backwards]
> resolvconf-1.79: Package version for package resolvconf-dev went backward=
s which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [versio=
n-going-backwards]
> resolvconf-1.79: Package version for package resolvconf-doc went backward=
s which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [versio=
n-going-backwards]
> resolvconf-1.79: Package version for package resolvconf-locale went backw=
ards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [ver=
sion-going-backwards]
> resolvconf-1.79: Package version for package resolvconf-staticdev went ba=
ckwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [=
version-going-backwards]
> resolvconf-1.79: Package version for package resolvconf went backwards wh=
ich would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-go=
ing-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme-dbg =
went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0=
.7) [version-going-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme-dev =
went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0=
.7) [version-going-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme-doc =
went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0=
.7) [version-going-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme-loca=
le went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0=
-r0.7) [version-going-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme-stat=
icdev went backwards which would break package feeds from (0:5.0-r0.8 to 0:=
5.0-r0.7) [version-going-backwards]
> rodent-icon-theme-5.0: Package version for package rodent-icon-theme went=
 backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) =
[version-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts-dbg went bac=
kwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [ver=
sion-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts-dev went bac=
kwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [ver=
sion-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts-doc went bac=
kwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [ver=
sion-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts-locale went =
backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [=
version-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts-staticdev we=
nt backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7=
) [version-going-backwards]
> run-postinsts-1.0: Package version for package run-postinsts went backwar=
ds which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version=
-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop-dbg we=
nt backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7=
) [version-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop-dev we=
nt backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7=
) [version-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop-doc we=
nt backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7=
) [version-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop-locale=
 went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r=
1.7) [version-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop-static=
dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.=
0-r1.7) [version-going-backwards]
> shutdown-desktop-1.0: Package version for package shutdown-desktop went b=
ackwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [v=
ersion-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts-dbg went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts-dev went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts-doc went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts-locale went backwards which would break package feeds from (0:1=
.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts-staticdev went backwards which would break package feeds from (=
0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-cn-fonts-1.004: Package version for package source-han-sa=
ns-cn-fonts went backwards which would break package feeds from (0:1.004-r0=
.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts-dbg went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts-dev went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts-doc went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts-locale went backwards which would break package feeds from (0:1=
.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts-staticdev went backwards which would break package feeds from (=
0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-jp-fonts-1.004: Package version for package source-han-sa=
ns-jp-fonts went backwards which would break package feeds from (0:1.004-r0=
.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts-dbg went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts-dev went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts-doc went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts-locale went backwards which would break package feeds from (0:1=
.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts-staticdev went backwards which would break package feeds from (=
0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-kr-fonts-1.004: Package version for package source-han-sa=
ns-kr-fonts went backwards which would break package feeds from (0:1.004-r0=
.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts-dbg went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts-dev went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts-doc went backwards which would break package feeds from (0:1.00=
4-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts-locale went backwards which would break package feeds from (0:1=
.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts-staticdev went backwards which would break package feeds from (=
0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
> source-han-sans-tw-fonts-1.004: Package version for package source-han-sa=
ns-tw-fonts went backwards which would break package feeds from (0:1.004-r0=
.8 to 0:1.004-r0.7) [version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-consolefont=
s went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.3=
8-r0.7) [version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-consoletran=
s went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.3=
8-r0.7) [version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-dbg went ba=
ckwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [=
version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-dev went ba=
ckwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [=
version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-doc went ba=
ckwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [=
version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-locale went=
 backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7=
) [version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-pcf went ba=
ckwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [=
version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font-staticdev w=
ent backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r=
0.7) [version-going-backwards]
> terminus-font-4.38: Package version for package terminus-font went backwa=
rds which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [vers=
ion-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-afr went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-amh went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ara went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-asm went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-aze-cyrl went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-aze went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-bel went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ben went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-bod went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-bos went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-bul went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-cat went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ceb went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ces went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-chi-sim went backwards which would break package feeds from=
 (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versio=
n-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-chi-tra went backwards which would break package feeds from=
 (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versio=
n-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-chr went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-cym went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-dan-frak went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-dan went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-dbg went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-deu-frak went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-deu went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-dev went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-doc went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-dzo went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ell went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-eng went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-enm went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-epo went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-equ went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-est went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-eus went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-fas went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-fin went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-fra went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-frk went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-frm went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-gle went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-glg went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-grc went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-guj went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-hat went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-heb went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-hin went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-hrv went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-hun went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-iku went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ind went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-isl went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ita-old went backwards which would break package feeds from=
 (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versio=
n-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ita went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-jav went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-jpn went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kan went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kat-old went backwards which would break package feeds from=
 (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versio=
n-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kat went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kaz went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-khm went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kir went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kor went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-kur went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-lao went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-lat went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-lav went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-lit went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-locale went backwards which would break package feeds from =
(0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version=
-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-mal went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-mar went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-mkd went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-mlt went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-msa went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-mya went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-nep went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-nld went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-nor went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ori went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-osd went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-pan went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-pol went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-por went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-pus went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ron went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-rus went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-san went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-sin went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-slk-frak went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-slk went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-slv went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-spa-old went backwards which would break package feeds from=
 (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versio=
n-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-spa went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-sqi went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-srp-latn went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-srp went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-staticdev went backwards which would break package feeds fr=
om (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [vers=
ion-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-swa went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-swe went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-syr went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tam went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tel went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tgk went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tgl went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tha went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tir went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-tur went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-uig went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-ukr went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-urd went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-uzb-cyrl went backwards which would break package feeds fro=
m (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [versi=
on-going-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-uzb went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-vie went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang went backwards which would break package feeds from (0:3.04=
.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-=
backwards]
> tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package=
 tesseract-lang-yid went backwards which would break package feeds from (0:=
3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-go=
ing-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica-dbg went=
 backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0=
.7) [version-going-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica-dev went=
 backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0=
.7) [version-going-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica-doc went=
 backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0=
.7) [version-going-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica-locale w=
ent backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500=
-r0.7) [version-going-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica-staticde=
v went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.=
500-r0.7) [version-going-backwards]
> ttf-abyssinica-1.500: Package version for package ttf-abyssinica went bac=
kwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) =
[version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-d=
bg went backwards which would break package feeds from (0:20080216-r6.8 to =
0:20080216-r6.7) [version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-d=
ev went backwards which would break package feeds from (0:20080216-r6.8 to =
0:20080216-r6.7) [version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-d=
oc went backwards which would break package feeds from (0:20080216-r6.8 to =
0:20080216-r6.7) [version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-l=
ocale went backwards which would break package feeds from (0:20080216-r6.8 =
to 0:20080216-r6.7) [version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-s=
taticdev went backwards which would break package feeds from (0:20080216-r6=
.8 to 0:20080216-r6.7) [version-going-backwards]
> ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming w=
ent backwards which would break package feeds from (0:20080216-r6.8 to 0:20=
080216-r6.7) [version-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-common went backw=
ards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [ver=
sion-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-mathtexgyre went =
backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7)=
 [version-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-sans-condensed we=
nt backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7=
.7) [version-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-sans-mono went ba=
ckwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [=
version-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-sans went backwar=
ds which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [versi=
on-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-serif-condensed w=
ent backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r=
7.7) [version-going-backwards]
> ttf-dejavu-2.37: Package version for package ttf-dejavu-serif went backwa=
rds which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [vers=
ion-going-backwards]
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-dro=
id-sans-fallback went backwards which would break package feeds from (0:0.1=
+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backw=
ards]
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-dro=
id-sans-japanese went backwards which would break package feeds from (0:0.1=
+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backw=
ards]
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-dro=
id-sans-mono went backwards which would break package feeds from (0:0.1+git=
r0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards=
]
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-dro=
id-sans went backwards which would break package feeds from (0:0.1+gitr0+21=
e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-dro=
id-serif went backwards which would break package feeds from (0:0.1+gitr0+2=
1e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
> ttf-gentium-1.02: Package version for package ttf-gentium-alt went backwa=
rds which would break package feeds from (0:1.02-r8.8 to 0:1.02-r8.7) [vers=
ion-going-backwards]
> ttf-gentium-1.02: Package version for package ttf-gentium went backwards =
which would break package feeds from (0:1.02-r8.8 to 0:1.02-r8.7) [version-=
going-backwards]
> ttf-hunkyfonts-0.3.0: Package version for package ttf-hunky-sans went bac=
kwards which would break package feeds from (0:0.3.0-r7.8 to 0:0.3.0-r7.7) =
[version-going-backwards]
> ttf-hunkyfonts-0.3.0: Package version for package ttf-hunky-serif went ba=
ckwards which would break package feeds from (0:0.3.0-r7.8 to 0:0.3.0-r7.7)=
 [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata-dbg=
 went backwards which would break package feeds from (0:20100526-r0.8 to 0:=
20100526-r0.7) [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata-dev=
 went backwards which would break package feeds from (0:20100526-r0.8 to 0:=
20100526-r0.7) [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata-doc=
 went backwards which would break package feeds from (0:20100526-r0.8 to 0:=
20100526-r0.7) [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata-loc=
ale went backwards which would break package feeds from (0:20100526-r0.8 to=
 0:20100526-r0.7) [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata-sta=
ticdev went backwards which would break package feeds from (0:20100526-r0.8=
 to 0:20100526-r0.7) [version-going-backwards]
> ttf-inconsolata-20100526: Package version for package ttf-inconsolata wen=
t backwards which would break package feeds from (0:20100526-r0.8 to 0:2010=
0526-r0.7) [version-going-backwards]
> ttf-liberation-0.2: Package version for package ttf-liberation-mono went =
backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) [=
version-going-backwards]
> ttf-liberation-0.2: Package version for package ttf-liberation-sans went =
backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) [=
version-going-backwards]
> ttf-liberation-0.2: Package version for package ttf-liberation-serif went=
 backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) =
[version-going-backwards]
> ttf-liberation-sans-narrow-1.07.4: Package version for package ttf-libera=
tion-sans-narrow went backwards which would break package feeds from (0:1.0=
7.4-r0.8 to 0:1.07.4-r0.7) [version-going-backwards]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-=
dbg went backwards which would break package feeds from (0:0.6-14.20090803c=
vs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-=
dev went backwards which would break package feeds from (0:0.6-14.20090803c=
vs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-=
doc went backwards which would break package feeds from (0:0.6-14.20090803c=
vs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-=
locale went backwards which would break package feeds from (0:0.6-14.200908=
03cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards=
]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-=
staticdev went backwards which would break package feeds from (0:0.6-14.200=
90803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwa=
rds]
> ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug =
went backwards which would break package feeds from (0:0.6-14.20090803cvs.f=
c24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
> ttf-lohit-2: Package version for package ttf-lohit-dbg went backwards whi=
ch would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-bac=
kwards]
> ttf-lohit-2: Package version for package ttf-lohit-dev went backwards whi=
ch would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-bac=
kwards]
> ttf-lohit-2: Package version for package ttf-lohit-doc went backwards whi=
ch would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-bac=
kwards]
> ttf-lohit-2: Package version for package ttf-lohit-locale went backwards =
which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-=
backwards]
> ttf-lohit-2: Package version for package ttf-lohit-staticdev went backwar=
ds which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-goi=
ng-backwards]
> ttf-lohit-2: Package version for package ttf-lohit went backwards which w=
ould break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwar=
ds]
> ttf-mplus-027: Package version for package ttf-mplus-1c-black went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-heavy went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1c-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1m-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1m-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1m-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1mn-bold went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1mn-light went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1mn-medium went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1mn-regular went bac=
kwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [ver=
sion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1mn-thin went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1m-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1m-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-black went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-heavy went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-1p-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-black went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-heavy went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2c-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2m-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2m-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2m-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2m-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2m-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-black went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-bold went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-heavy went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-light went backwa=
rds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versio=
n-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-medium went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-regular went back=
wards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [vers=
ion-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-2p-thin went backwar=
ds which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version=
-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-dbg went backwards w=
hich would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-goi=
ng-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-dev went backwards w=
hich would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-goi=
ng-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-doc went backwards w=
hich would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-goi=
ng-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-locale went backward=
s which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-=
going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus-staticdev went backw=
ards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [versi=
on-going-backwards]
> ttf-mplus-027: Package version for package ttf-mplus went backwards which=
 would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-b=
ackwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans-dbg went backwar=
ds which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version=
-going-backwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans-dev went backwar=
ds which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version=
-going-backwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans-doc went backwar=
ds which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version=
-going-backwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans-locale went back=
wards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [vers=
ion-going-backwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans-staticdev went b=
ackwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [v=
ersion-going-backwards]
> ttf-pt-sans-1.1: Package version for package ttf-pt-sans went backwards w=
hich would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-goi=
ng-backwards]
> ttf-sazanami-20040629: Package version for package ttf-sazanami-gothic we=
nt backwards which would break package feeds from (0:20040629-r9.8 to 0:200=
40629-r9.7) [version-going-backwards]
> ttf-sazanami-20040629: Package version for package ttf-sazanami-mincho we=
nt backwards which would break package feeds from (0:20040629-r9.8 to 0:200=
40629-r9.7) [version-going-backwards]
> ttf-tlwg-0.6.1: Package version for package ttf-tlwg went backwards which=
 would break package feeds from (0:0.6.1-r0.8 to 0:0.6.1-r0.7) [version-goi=
ng-backwards]
> ttf-ubuntu-font-family-0.80: Package version for package ttf-ubuntu-mono =
went backwards which would break package feeds from (0:0.80-r1.8 to 0:0.80-=
r1.7) [version-going-backwards]
> ttf-ubuntu-font-family-0.80: Package version for package ttf-ubuntu-sans =
went backwards which would break package feeds from (0:0.80-r1.8 to 0:0.80-=
r1.7) [version-going-backwards]
> ttf-vlgothic-20141206: Package version for package ttf-vlgothic went back=
wards which would break package feeds from (0:20141206-r0.8 to 0:20141206-r=
0.7) [version-going-backwards]
> ttf-wqy-zenhei-0.9.45: Package version for package ttf-wqy-zenhei went ba=
ckwards which would break package feeds from (0:0.9.45-r0.8 to 0:0.9.45-r0.=
7) [version-going-backwards]
> tzdata-2017c: Package version for package tzdata-africa went backwards wh=
ich would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-=
going-backwards]
> tzdata-2017c: Package version for package tzdata-americas went backwards =
which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [versio=
n-going-backwards]
> tzdata-2017c: Package version for package tzdata-antarctica went backward=
s which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [vers=
ion-going-backwards]
> tzdata-2017c: Package version for package tzdata-arctic went backwards wh=
ich would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-=
going-backwards]
> tzdata-2017c: Package version for package tzdata-asia went backwards whic=
h would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-go=
ing-backwards]
> tzdata-2017c: Package version for package tzdata-atlantic went backwards =
which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [versio=
n-going-backwards]
> tzdata-2017c: Package version for package tzdata-australia went backwards=
 which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [versi=
on-going-backwards]
> tzdata-2017c: Package version for package tzdata-europe went backwards wh=
ich would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-=
going-backwards]
> tzdata-2017c: Package version for package tzdata-misc went backwards whic=
h would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-go=
ing-backwards]
> tzdata-2017c: Package version for package tzdata-pacific went backwards w=
hich would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version=
-going-backwards]
> tzdata-2017c: Package version for package tzdata-posix went backwards whi=
ch would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-g=
oing-backwards]
> tzdata-2017c: Package version for package tzdata-right went backwards whi=
ch would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-g=
oing-backwards]
> tzdata-2017c: Package version for package tzdata went backwards which wou=
ld break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-b=
ackwards]
> update-rc.d-0.7: Package version for package update-rc.d-dbg went backwar=
ds which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version=
-going-backwards]
> update-rc.d-0.7: Package version for package update-rc.d-dev went backwar=
ds which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version=
-going-backwards]
> update-rc.d-0.7: Package version for package update-rc.d-doc went backwar=
ds which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version=
-going-backwards]
> update-rc.d-0.7: Package version for package update-rc.d-locale went back=
wards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [vers=
ion-going-backwards]
> update-rc.d-0.7: Package version for package update-rc.d-staticdev went b=
ackwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [v=
ersion-going-backwards]
> update-rc.d-0.7: Package version for package update-rc.d went backwards w=
hich would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-goi=
ng-backwards]
> usbinit-1.0: Package version for package usbinit-dbg went backwards which=
 would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-b=
ackwards]
> usbinit-1.0: Package version for package usbinit-dev went backwards which=
 would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-b=
ackwards]
> usbinit-1.0: Package version for package usbinit-doc went backwards which=
 would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-b=
ackwards]
> usbinit-1.0: Package version for package usbinit-locale went backwards wh=
ich would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-goin=
g-backwards]
> usbinit-1.0: Package version for package usbinit-staticdev went backwards=
 which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-g=
oing-backwards]
> usbinit-1.0: Package version for package usbinit went backwards which wou=
ld break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backw=
ards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data-dbg went backwards which would break package feeds from (0:20170205-r0=
.8 to 0:20170205-r0.7) [version-going-backwards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data-dev went backwards which would break package feeds from (0:20170205-r0=
.8 to 0:20170205-r0.7) [version-going-backwards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data-doc went backwards which would break package feeds from (0:20170205-r0=
.8 to 0:20170205-r0.7) [version-going-backwards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data-locale went backwards which would break package feeds from (0:20170205=
-r0.8 to 0:20170205-r0.7) [version-going-backwards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data-staticdev went backwards which would break package feeds from (0:20170=
205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
> usb-modeswitch-data-20170205: Package version for package usb-modeswitch-=
data went backwards which would break package feeds from (0:20170205-r0.8 t=
o 0:20170205-r0.7) [version-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds-dbg went b=
ackwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [v=
ersion-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds-dev went b=
ackwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [v=
ersion-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds-doc went b=
ackwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [v=
ersion-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds-locale wen=
t backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7)=
 [version-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds-staticdev =
went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0=
.7) [version-going-backwards]
> volatile-binds-1.0: Package version for package volatile-binds went backw=
ards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [versi=
on-going-backwards]
> wayland-protocols-1.12: Package version for package wayland-protocols wen=
t backwards which would break package feeds from (0:1.12-r0.5 to 0:1.12-r0.=
4) [version-going-backwards]
> weston-init-1.0: Package version for package weston-init-dbg went backwar=
ds which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version=
-going-backwards]
> weston-init-1.0: Package version for package weston-init-dev went backwar=
ds which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version=
-going-backwards]
> weston-init-1.0: Package version for package weston-init-doc went backwar=
ds which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version=
-going-backwards]
> weston-init-1.0: Package version for package weston-init-locale went back=
wards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [vers=
ion-going-backwards]
> weston-init-1.0: Package version for package weston-init-staticdev went b=
ackwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [v=
ersion-going-backwards]
> weston-init-1.0: Package version for package weston-init went backwards w=
hich would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-goi=
ng-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme-dbg went backwards which would break pa=
ckage feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r=
0.7) [version-going-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme-dev went backwards which would break pa=
ckage feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r=
0.7) [version-going-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme-doc went backwards which would break pa=
ckage feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r=
0.7) [version-going-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme-locale went backwards which would break=
 package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba=
4-r0.7) [version-going-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme-staticdev went backwards which would br=
eak package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af=
5ba4-r0.7) [version-going-backwards]
> xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version fo=
r package xcursor-transparent-theme went backwards which would break packag=
e feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7)=
 [version-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-dbg went b=
ackwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [v=
ersion-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-dev went b=
ackwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [v=
ersion-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-doc went b=
ackwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [v=
ersion-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-locale wen=
t backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7)=
 [version-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-staticdev =
went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0=
.7) [version-going-backwards]
> xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3 went backw=
ards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [versi=
on-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dbg =
went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0=
.7) [version-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dev =
went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0=
.7) [version-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-ptes=
t went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-=
r0.7) [version-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi went=
 backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) =
[version-going-backwards]
> xorg-minimal-fonts-1.0: Package version for package xorg-minimal-fonts we=
nt backwards which would break package feeds from (1:1.0-r2.8 to 1:1.0-r2.7=
) [version-going-backwards]
> xuser-account-0.1: Package version for package xuser-account-dbg went bac=
kwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [ver=
sion-going-backwards]
> xuser-account-0.1: Package version for package xuser-account-dev went bac=
kwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [ver=
sion-going-backwards]
> xuser-account-0.1: Package version for package xuser-account-doc went bac=
kwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [ver=
sion-going-backwards]
> xuser-account-0.1: Package version for package xuser-account-locale went =
backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [=
version-going-backwards]
> xuser-account-0.1: Package version for package xuser-account-staticdev we=
nt backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7=
) [version-going-backwards]
> xuser-account-0.1: Package version for package xuser-account went backwar=
ds which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version=
-going-backwards]
>
>
> count: 1        issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-sy.iso-8859-=
6/usr/lib/locale/ar_SY.ISO-8859-6/LC_PAPER is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
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
> count: 9        issue: qa_pseudo
> ell-git: This /work/armv5te-oe-linux-gnueabi/ell/git-r0/pseudo/pseudo.log=
 indicates 8 errors [qa_pseudo]
> packagegroup-core-full-cmdline-1.0: This /work/all-oe-linux/packagegroup-=
core-full-cmdline/1.0-r6/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
> python3-netaddr-0.7.19: This /work/aarch64-oe-linux/python3-netaddr/0.7.1=
9-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> python3-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python3-pyseria=
l/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-ndg-httpsclient-0.4.3: This /work/i586-oe-linux-musl/python-ndg-ht=
tpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> python-pyserial-3.4: This /work/core2-64-oe-linux/python-pyserial/3.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> run-postinsts-1.0: This /work/all-oe-linux/run-postinsts/1.0-r9/pseudo/ps=
eudo.log indicates 9 errors [qa_pseudo]
> ttf-tlwg-0.6.1: This /work/all-oe-linux/ttf-tlwg/0.6.1-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
> xinit-1.3.4: This /work/armv5te-oe-linux-gnueabi/xinit/1_1.3.4-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> 2d14d60 toaster: add 'nobuild' option to Toaster
> not included in master yet:
> 1f7d23b world-image: add extra target
> 2d550e0 fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:
> 3cf8bda linux-yocto/4.12: CQM and kmemleak fixes
> not included in master yet:
> 08820d0 kernel-devicetree.bbclass: Use lowercase names for shell variable=
s
> b2927b3 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
> 5e51422 kernel.bbclass: use the consistent naming schema for initramfs
> 2ba5049 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
> ec8f030 report-error: Allow to upload reports automatically
> c38d29a buildhistory.bbclass: metadata-revs show repo parent
> 82daf30 metadata-revs: provide more information
> 8b10f52 qemux86: Add identical qemux86copy variant for tests
> 348c2cd reproducible_build.bbclass: initial support for binary reproducib=
ility
> 3d0964e cpio: provide cpio-replacement-native
> 4bed115 image_types.bbclass: improve cpio image reproducibility
> f591379 rootfs-postcommands.bbclass: support binary reproducibility
> 588fd12 sstate.bbclass: Do not cause build failures due to setscene error=
s
> 36fd765 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> 477965f insane.bbclass: use package_qa_handle_error for do_qa_pseudo
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:
> 9c63095 dnfdragora: new add
> not included in master yet:
> 15ae852 plymouth: fix path to systemd-tty-ask-password-agent
> 84f6b43 gvfs: update 1.32.1 -> 1.34.1
> 5a5a504 plymouth: do not install systemd units manually
> 8e0e88b plymouth: packageconfig gtk needs gtk+3 as depends
> 4e91671 open-isns: Fix build with musl
> f31a31a bridge-utils: modify the AR to cross toolchain
> 38e6520 ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
> 208d371 dovecot: Fix parallel build
> 5a93918 dnsmasq: update SRC_URI for versions 2.69 and earlier
> 0cbe304 postfix: fix send mail failure and eliminate warning
> 8e14b20 openvpn: Upgrade 2.4.3 -> 2.4.4
> 3891460 arptables: Fix do_install task
> 7cedc81 lksctp-tools: update and remove from blacklist
> eae779c freediameter: add new recipe
> 6cf2cfb net-snmp: support openssl without 3des
> 0e0ec76c stunnel: fix compile error when openssl disable des support
> d622865 bridge-utils: update to v1.6
> 9c43787 corosync: 2.4.2 -> 2.4.3
> 789e0dd cyrus-sasl: virtual/db isn't used by core, change to db
> 08c03c4 postfix: virtual/db isn't used by core, change to db
> 7ea6967 networkmanager: add consolekit only when x11 is enabled
> edea80d iscsi-initiator-utils: check file existence before moving
> 74c9f42 iscsi-initiator-utils: remove the distro_features_check
> e2f3541 open-isns: add sysvinit support
> 29ad88c libtalloc: update to version 2.1.10
> 7f7ede2 libtevent: update to version 0.99.33
> 506cbff libtdb: update to version 1.3.15
> 8c566ab libldb: update to version 1.2.2
> 20ab33f Revert "samba: add missing RDEPENDS"
> 03e923d samba: move to version 4.7.0
> fa07eb1 pcmciautils: add (from oe-core)
> 8d4377a chrony: Update to version 3.2
> 49268af site: move from meta-oe to meta-networking
> 593aca4 inetutils: make -syslog rconflict with other system loggers
> f555fbb net-snmp: fix invalid paths in target net-snmp-config
> aafdd48d cifs-utils: mount.cifs should build without samba dependency
> 85a769b wireshark: Update to 2.2.11
> 6e8441b python-pymisc: update to version 2.4.85
> 1b2de6f python-flask-wtf: update to version 0.14.2
> f9e33c6 python-parted: update to version 3.11.1
> 91b4e1d python-networkx: update to version 2.0
> e68340c python3-langtable: update to version 0.0.38
> 20050b6 python-pyperclip: add an initial recipe for version 1.6.0
> a4e96d0 python-cmd2: update RDEPENDS to include pyperclip
> d030a84 python-pyflakes: update to version 1.6.0
> cbc89c6 smstools3: update to 3.1.21; drop uneeded patches
> 9251ee1 xrdp: CVE-2017-16927
> 1b1a46a hwloc: fix multilib problem
> cf53f63 tinyproxy: 'nobody' should belong to 'nogroup'
> 5592659 postfix: drop NATIVE_INSTALL_WORKS
> 5aa27b8 libyui-ncurses: new add
> b3452fa leveldb: fix checking for SSE flag
> 5c05f86 python-whoosh: add RDEPENDS to work on minimal python installs
> aebc64b python-zopeinterface: update RDEPENDS to include datetime
> e94c419 python-pycparser: add pprint to the RDEPENDS
> 5b36c80 python-netaddr: update to RDEPENDS to work on minimal python inst=
alls
> 0b2d9df python-pyroute2: re-add the RDEPENDS that were removed and verify=
 on the latest release
> 8ecc12e python-pyserial: reorganize packaging and update RDEPENDS
> 5c211e5 python-pandas: add json to the RDEPENDS list
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> 3cf0bbb qtbase_git: install qt.conf for the target
> not included in master yet:
> 0fd9104 packagegroup-qt5-qtcreator-debug: remove qtdeclarative-plugins
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> 8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
> not included in master yet:
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

