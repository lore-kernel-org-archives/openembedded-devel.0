Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B76A71C9F;
	Wed,  1 Nov 2017 09:59:03 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g90so1460215wrd.6;
	Wed, 01 Nov 2017 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bzniGJ4WsiEwedUMmBeMQagfVm7mYI14oxtsDG9uX1U=;
	b=j42UpIy05TRSYoYKhXdQ2arloWCdsr11TQSqwrEx8v7WwPnJmKUC0f2isU7KaSf2Qu
	RoTkm+s4exb7FwtFRkxkXRKI4gOFIIp9ySmpSQ7ZIbeCO3rPH8eSgxTVjA/ipDhNmE9u
	2WHhWxfKMMztvZivaRPKP4UkL181rOu8uJzq/ZomLrEjPM+0/qhXSAlFY5maYPhQ3pRS
	Gu2z5ALfejvIiujCy60m5n93/y+8ovd7FTu5X5VVnflSOJvXcp/CBX+dt65PZv71AAPZ
	rfMO60NjHFlvOTLy2VN/POmav2WI8Z77i7SawT+1I7sojuUgAnPCNC9Z6P9UrjmBz8dY
	Tpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bzniGJ4WsiEwedUMmBeMQagfVm7mYI14oxtsDG9uX1U=;
	b=qi31VDcO+N3feHesDYgL+zRWTpOicQly08QStlJuArl84m3ydL+l8ILaIoBJwdT81f
	MsjWzwyyYjfvfLkMYVKGEz9K24+BjCsmtVIRfRYV6RZkttN066BNQSA/T/gSme2+1Rm3
	Q9i6RJ2LU/H/cjQ0VUx66Y6OFZPtyixt0EjtAWKAvnWM1IR+OJeh14/WndkTAy2WOja7
	LgSyI8FcDf8TpWq22hqr6bLEFpbxiXva6B6KaiZbMqAJHVydVaIrYRSjv/JN06HQpsc1
	DkMeQ9q+WTLLebSAZN9h7xxp9dTxEM1Rw8PxZTyCCRPkhUPudyzA10oCW6UV0uIJAc1f
	AIdQ==
X-Gm-Message-State: AMCzsaXs8TVnFxw/8jGVCfEJFivvIFRgVS/5h3LkfAhKoVH72IDl6HEA
	HaZ7+XAEvDG+xSnPp9WzVlXWeEknuYqaRmnOL6Q=
X-Google-Smtp-Source: ABhQp+QhwK6ULKbbR8SLNkBcORvmcXJfmw61w1b7T3v/IyoF/dgPsaU0x0B35bO2E7xsjT6OzPfgrEYrVZAPzuXbAxM=
X-Received: by 10.223.143.51 with SMTP id p48mr4122629wrb.104.1509530343900;
	Wed, 01 Nov 2017 02:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 1 Nov 2017 02:59:03 -0700 (PDT)
In-Reply-To: <7e59a3d8-bc02-b265-a7db-fef8a8d6dfe5@gmail.com>
References: <CA+chaQfyBb2rioOqS1C5+e_sq3XdaxP0ge-Jt6Km5BsjHfHyTA@mail.gmail.com>
	<7e59a3d8-bc02-b265-a7db-fef8a8d6dfe5@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Nov 2017 10:59:03 +0100
Message-ID: <CA+chaQez_M=emSm836CswCvKP2KyzXh6JKXp_CeqSc68j8iAqA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-10-31
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
X-List-Received-Date: Wed, 01 Nov 2017 09:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I'll leave this question to Khem, this was my just 2nd build with musl,
Khem is doing musl builds for very long time and fixing all the issue he
finds, maybe some of the issues detected in world builds already have fixes
in Khem's queue.

Regards,

On Wed, Nov 1, 2017 at 5:53 AM, akuster808 <akuster808@gmail.com> wrote:

> Martin,
>
> On 10/31/2017 01:58 PM, Martin Jansa wrote:
>
> With 2 pending patches from Khem to build systemd with musl:
>
> 62c7c98 systemd: Fix build on musl
> de68252 systemd: Fix build with musl/mips64
>
> the qemux86+musl build was able to progress much further and fewer ERROR =
messages were shown. Basically only uim recipe now depends on glibc and fai=
ls to be included in build queue:
>
>
> Are we going to blacklist the recipes failing via musl? is there
> blacklisting by TCLIB?
>
> - armin
>
> Summary: There were 55 ERROR messages shown, returning a non-zero exit co=
de.
>
> Parsing of 2356 .bb files complete (2355 cached, 1 parsed). 3228 targets,=
 48 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEN=
DS on or otherwise requires it)
> NOTE: Runtime target 'glibc-gconv-euc-jp' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-gconv-euc-jp']
> NOTE: Runtime target 'uim-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['uim-dev', 'glibc-gconv-euc=
-jp']
> NOTE: Runtime target 'uim' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['uim', 'glibc-gconv-euc-jp'=
]
> NOTE: Runtime target 'libuim0' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libuim0', 'glibc-gconv-euc=
-jp']
> ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on o=
r otherwise requires it)
> NOTE: Runtime target 'glibc-utils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-utils']
>
> Some logs weren't uploaded to the http://logs.nslu2-linux.org/buildlogs <=
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_09=
5148.log> because it run out of disk space again.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'4'|Failed tasks			    !!|Signatures		  !!colspa=
n=3D'15'|QA !!Comment
> |-
> ||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-strippe=
d	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||=
host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||=
symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-p=
ath	||qa_pseudo	||=09
> |-
>
> ||2017-10-30	||2	||6	||26	||1	||0	||0		||0		||1		||0		||0		||28		||2		||0=
		||0		||0		||0		||0		||0		||0		||158		||=09
> |}
>
> =3D=3D Failed tasks 2017-10-30 =3D=3D
>
> INFO: jenkins-job.sh-1.8.39 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/rocko/log.report.20171031_095148.log
>
> =3D=3D=3D common (0) =3D=3D=3D
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
>
> =3D=3D=3D qemuarm64 (5) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_co=
mpile
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.14=
3.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
>
> =3D=3D=3D qemux86 (26) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
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
>     * meta-openembedded/meta-networking/recipes-support/open-isns/open-is=
ns_0.97.bb:do_compile
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
>     * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer=
_git.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.2.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-extended/corosync/corosyn=
c_2.4.2.bb:do_package_qa
>
> =3D=3D=3D Number of failed tasks (35) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko=
/log.world.qemuarm.20171030_061538.log/ ||
> |-
> || qemuarm64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemuarm64.20171030_165541.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/47895/
> |-
> || qemux86 	|| 26	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86.20171030_061543.log/ || http://errors.yoctoproject.org/=
Errors/Build/47880/
> |-
> || qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.world.qemux86-64.20171030_191803.log/ || http://errors.yoctoproject=
.org/Errors/Build/47897/
> |}
>
> =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
>
> =3D=3D=3D QA issues (189) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
>
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||compile-host-path
> |-
> ||0	||file-rdeps
> |-
> ||0	||installed-vs-shipped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||ldflags
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||158	||qa_pseudo
> |-
> ||1	||textrel
> |-
> ||28	||version-going-backwards
> |-
> ||2	||host-user-contaminated
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20171031_072554.log/
>
>
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmp-glibc/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', " <$%7B@bb.utils.contains('DISTRO_FEATURES','ld-is-gold',>BROKEN: fai=
ls to link against sctp_connectx symbol", '', d)}"
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
> count: 0	issue: already-stripped
>
>
> count: 0	issue: libdir
>
>
> count: 1	issue: textrel
> corosync-2.4.2: ELF binary '/work/core2-64-oe-linux/corosync/2.4.2-r0/pac=
kages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
>
>
> count: 0	issue: build-deps
>
>
> count: 0	issue: file-rdeps
>
>
> count: 28	issue: version-going-backwards
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dbg went backwards which would break package feeds from=
 (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dev went backwards which would break package feeds from=
 (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-ptest went backwards which would break package feeds fr=
om (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug went backwards which would break package feeds from (0:=
1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dbg went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dbg went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dev went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-ptest went backwards which would break package feeds from (=
0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dev went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended went backwards which would break package feeds from (0:1=
.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics went backwards which would break package feeds from (0:1=
.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dbg went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dev went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-ptest went backwards which would break package feeds f=
rom (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-ptest went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dbg went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dev went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-ptest went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted went backwards which would break package feeds from (0:1.0-r13.14=
 to 0:1.0-r13.13) [version-going-backwards]
>
>
>
> count: 2	issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ms-my/usr/lib/l=
ocale/ms_MY/LC_COLLATE is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-quz-pe/usr/lib/=
locale/quz_PE/LC_NAME is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
>
>
> count: 0	issue: installed-vs-shipped
>
>
> count: 0	issue: unknown-configure-option
>
>
> count: 0	issue: symlink-to-sysroot
>
>
> count: 0	issue: invalid-pkgconfig
>
>
> count: 0	issue: pkgname
>
>
> count: 0	issue: ldflags
>
>
> count: 0	issue: compile-host-path
>
>
> count: 158	issue: qa_pseudo
> bluez5-5.46: This /work/aarch64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> bluez5-5.46: This /work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/ps=
eudo.log indicates 17 errors [qa_pseudo]
> bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
> cairo-1.14.10: This /work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseud=
o.log indicates 24 errors [qa_pseudo]
> collectd-5.7.2: This /work/aarch64-oe-linux/collectd/5.7.2-r0/pseudo/pseu=
do.log indicates 17 errors [qa_pseudo]
> collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> dhcpcd-6.11.3: This /work/aarch64-oe-linux/dhcpcd/6.11.3-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/aarch64-oe-linux/gobject-introsp=
ection/1.52.1-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobject=
-introspection/1.52.1-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-intros=
pection/1.52.1-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/=
0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_ps=
eudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/=
lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
> libatasmart-0.19: This /work/aarch64-oe-linux/libatasmart/0.19-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
> libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo=
/pseudo.log indicates 12 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/l=
ibconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11=
 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-g=
nueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indi=
cates 11 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/=
libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 1=
1 errors [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqof=
ono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueab=
i/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqo=
fono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
> librepo-1.7.20+gitAUTOINC+e1137cbbda: This /work/aarch64-oe-linux/librepo=
/1.7.20+gitAUTOINC+e1137cbbda-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
> libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/p=
seudo/pseudo.log indicates 11 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9=
.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/=
pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pse=
udo.log indicates 13 errors [qa_pseudo]
> libxml-sax-writer-perl-0.57: This /work/core2-64-oe-linux/libxml-sax-writ=
er-perl/0.57-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
> lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-=
linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-=
linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe=
-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
> maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/aarch64-oe-li=
nux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log in=
dicates 18 errors [qa_pseudo]
> maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/core2-64-oe-l=
inux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log i=
ndicates 27 errors [qa_pseudo]
> mc-4.8.19: This /work/core2-64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> ofono-1.20: This /work/aarch64-oe-linux/ofono/1.20-r0/pseudo/pseudo.log i=
ndicates 16 errors [qa_pseudo]
> ofono-1.20: This /work/armv5te-oe-linux-gnueabi/ofono/1.20-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4: This /work/aarch64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 16 errors=
 [qa_pseudo]
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4: This /work/core2-64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22=
ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
> openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseud=
o/pseudo.log indicates 14 errors [qa_pseudo]
> openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
> openipmi-2.0.24: This /work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
> opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/ps=
eudo.log indicates 16 errors [qa_pseudo]
> opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/p=
seudo/pseudo.log indicates 20 errors [qa_pseudo]
> opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/p=
seudo.log indicates 20 errors [qa_pseudo]
> pcmanfm-1.2.5: This /work/aarch64-oe-linux/pcmanfm/1.2.5-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
> puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/core2-64-oe-linux/puzzles/1=
_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 18 errors [qa_pse=
udo]
> python3-dbus-1.2.4: This /work/aarch64-oe-linux/python3-dbus/1.2.4-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
> python3-simplejson-3.11.1: This /work/armv5te-oe-linux-gnueabi/python3-si=
mplejson/3.11.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
> qemu-2.10.0: This /work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.2+=
gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3=
d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 14 errors [qa_=
pseudo]
> qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-=
r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/5.=
9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 211 errors [qa_pse=
udo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/q=
tbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 14 errors =
[qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5=
.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 16 errors [qa_pse=
udo]
> qtcanvas3d-5.9.2+gitAUTOINC+a1aee8ecbe: This /work/aarch64-oe-linux/qtcan=
vas3d/5.9.2+gitAUTOINC+a1aee8ecbe-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtchart=
s/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi=
/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtchar=
ts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors [qa=
_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux/q=
tconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 14=
 errors [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linux-g=
nueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indi=
cates 14 errors [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/=
qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qtda=
tavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/armv5te-oe-linux-gnue=
abi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates =
24 errors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtd=
atavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 21 erro=
rs [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/qt=
declarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 17 e=
rrors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gn=
ueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indica=
tes 42 errors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/q=
tdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 21 =
errors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtengi=
nio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueab=
i/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 14 e=
rrors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qteng=
inio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtgame=
pad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueab=
i/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtgam=
epad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 15 errors [=
qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-oe-=
linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-=
linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe=
-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/qtm=
ultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnu=
eabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qt=
multimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 13 er=
rors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/aarch64-oe-linux/qt=
networkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 5 er=
rors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gn=
ueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/q=
tnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 13 =
errors [qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtquick=
1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 18 errors [qa_=
pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi=
/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 26 err=
ors [qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquic=
k1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors [qa=
_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-linux=
/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-linux=
-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linu=
x/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicat=
es 14 errors [qa_pseudo]
> qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/core2-64-oe-linux=
/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates=
 16 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linux/=
qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-=
gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux=
/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates=
 13 errors [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscrip=
t/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/=
qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscri=
pt/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 19 errors [qa=
_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/=
qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml=
/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors [qa_p=
seudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtsens=
ors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13 errors [q=
a_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueab=
i/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 e=
rrors [qa_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsen=
sors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 errors [=
qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnue=
abi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qts=
erialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
>
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/aarch64-oe-linux/qts=
erialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 5 erro=
rs [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnu=
eabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicate=
s 7 errors [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qt=
serialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 7 err=
ors [qa_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.9.=
2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo=
]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qt=
svg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 17 errors [q=
a_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5.9=
.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_pseud=
o]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsyst=
ems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueab=
i/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsys=
tems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 14 errors [=
qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttools/=
5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/=
qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 15 error=
s [qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools=
/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_p=
seudo]
> qttranslations-5.9.2+gitAUTOINC+325a90e07e: This /work/core2-64-oe-linux/=
qttranslations/5.9.2+gitAUTOINC+325a90e07e-r0/pseudo/pseudo.log indicates 6=
 errors [qa_pseudo]
> qtvirtualkeyboard-5.9.2+gitAUTOINC+87218c4e68: This /work/aarch64-oe-linu=
x/qtvirtualkeyboard/5.9.2+gitAUTOINC+87218c4e68-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwayl=
and/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 18 errors [q=
a_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnueab=
i/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/qtw=
ebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnu=
eabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-oe=
-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.=
log indicates 11 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-o=
e-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo=
.log indicates 14 errors [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebki=
t/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_=
pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/=
qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebk=
it/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa=
_pseudo]
> qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/core2-64-oe-lin=
ux/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/qtw=
ebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnu=
eabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicate=
s 14 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qt=
websockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 14 er=
rors [qa_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebv=
iew/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtweb=
view/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 7 errors [q=
a_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qtx1=
1extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnue=
abi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates =
8 errors [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx=
11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 error=
s [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gn=
ueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/q=
txmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 14 =
errors [qa_pseudo]
> rpm-4.13.90+gitAUTOINC+a8e51b3bb0: This /work/armv5te-oe-linux-gnueabi/rp=
m/1_4.13.90+gitAUTOINC+a8e51b3bb0-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
> rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pse=
udo/pseudo.log indicates 17 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
> settings-daemon-0.0.2: This /work/aarch64-oe-linux/settings-daemon/0.0.2-=
r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
> strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> tunctl-1.5: This /work/aarch64-oe-linux/tunctl/1.5-r0/pseudo/pseudo.log i=
ndicates 8 errors [qa_pseudo]
> upower-0.99.5: This /work/core2-64-oe-linux/upower/0.99.5-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
> vlc-2.2.2: This /work/core2-64-oe-linux/vlc/2.2.2-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> weston-2.0.0: This /work/aarch64-oe-linux/weston/2.0.0-r0/pseudo/pseudo.l=
og indicates 16 errors [qa_pseudo]
> xfce4-appfinder-4.12.0: This /work/core2-64-oe-linux/xfce4-appfinder/4.12=
.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> xfce4-places-plugin-1.7.0: This /work/core2-64-oe-linux/xfce4-places-plug=
in/1.7.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
> xfce4-sensors-plugin-1.2.97: This /work/armv5te-oe-linux-gnueabi/xfce4-se=
nsors-plugin/1.2.97-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> xfce4-weather-plugin-0.8.9: This /work/core2-64-oe-linux/xfce4-weather-pl=
ugin/0.8.9-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> zbar-0.10: This /work/aarch64-oe-linux/zbar/0.10-r0/pseudo/pseudo.log ind=
icates 16 errors [qa_pseudo]
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
> be393f2 toaster/highlight.pack.js: Fix corrupted file
> not included in master yet:
> 3fba1ad world-image: add extra target
> c7c01bf fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
>
> latest upstream commit:
> 3b413a8 README.qemu: qemuppc64 is not supported
> not included in master yet:
> 3ff8d67 report-error: Allow to upload reports automatically
> c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
> e2c9020 metadata-revs: provide more information
> cd6556e qemux86: Add identical qemux86copy variant for tests
> 347a734 reproducible_build.bbclass: initial support for binary reproducib=
ility
> 625d2bc cpio: provide cpio-replacement-native
> ce7ca36 image_types.bbclass: improve cpio image reproducibility
> fea2911 rootfs-postcommands.bbclass: support binary reproducibility
> 981e97a sstate.bbclass: Do not cause build failures due to setscene error=
s
> b53517c insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> f829dbd libsdl2: allow to build native and nativesdk
> 5c05822 libdrm: allow to build native and nativesdk
> 95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of=
 mesa
> bd4c162 libepoxy: add support for native(sdk)
> 3092b61 libjpeg-turbo: provide nativesdk version
> 5471ea7 virglrenderer: add new recipe
> 8c4c3fc virglrenderer: fix target build
> 81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
> c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo
> 62c7c98 systemd: Fix build on musl
> de68252 systemd: Fix build with musl/mips64
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
>
> latest upstream commit:
> 5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
> not included in master yet:
> ebcef48 bridge-utils: modify the AR to cross toolchain
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order ca=
ll
> not included in master yet:
> 197811b qtwebengine: make test suite succeed
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> 26d5066 firefox: fix build failures
> not included in master yet:
> 6773bf9 meta: drop ${COREBASE}/LICENSE references
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STOP =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> sending incremental file list
>
>
>
>
>

