Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDDDD6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 12:24:40 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id d10so9637131wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JAOJ07Oj1XujspcCD6eUMuoztbc8WvCimc3MtvfTJnI=;
	b=iVVgzlu1V/7sCaUvDkqoVq0IsZ61IHs4Z5MtrWTEcrZQ79zjzRyKeJS04/SDs2XNsC
	8iPia7sVEaxnc/0+xGz8Uxy+2ZWglTcSYD0BlbcZyz6OZNHBLQAk5d+nsqzyiqlThvd7
	c8dK2UIEdPt8yvFrLNNul7T+c6rHVfOJf/isyku3Rmr0vIOUSH2Nq/hMFTvURMnPMYmd
	nxgR6YGxzEa6+7QaMK2r2sltgU1dwxZ605YAxUJeZz8IAG04O1sGyIIl85dTQWT2WShw
	zM7dythyskSMHdvkKFyrxo003STyxH4VoB2Y/rqTTaJOW+ZQFBQ3OE9YAFZy8s7vJVeF
	9VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JAOJ07Oj1XujspcCD6eUMuoztbc8WvCimc3MtvfTJnI=;
	b=sz0+OnJtWSdVhYr1t3HFfHLZLF/94vqXJThcaKPwPQI7Ivi4QlkH87K+6c0Vs2kwMJ
	J+SrjJggfWb7IOgI7qPzo/tjwb+CYHUsJ3js7CBO0FzcN8SPo+z9VzqF9Frs3v9qayfb
	RGyXd0J53XZCxcmnZopb+OmxGubWMH8C62IkwO+Co2k5C5G7b1BMedfxbOUhKobRw+ti
	FE72LZEf0FOYn1FrfLsOfxOVJLOo0E3WX92ZcZ+zOw8f1u4mdzbOO6DHITZNg0sXESzJ
	bnpoSrmucXn/J811PYnmDDU/VAWqREiD3Vtfgr2J53auRWug7FiAo8u7ci4d6QrCKeS1
	mKYQ==
X-Gm-Message-State: AElRT7GN3dCab1A20d2x+Rop6RyxNH2+pFbZrYF6gVBMIqdDxv5sBTJy
	9W0z91vmdw529ljCnROV5Np9kw==
X-Google-Smtp-Source: AG47ELuUxqdJ61ySD2vfJfs1x0aAttbmfSOu065F6n6yALbwRkW+3mvz/pq9tMlAaefCtmrPEgcq3A==
X-Received: by 10.223.131.38 with SMTP id 35mr413591wrd.197.1520943879669;
	Tue, 13 Mar 2018 05:24:39 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n127sm125664wmb.5.2018.03.13.05.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Mar 2018 05:24:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Mar 2018 13:24:41 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180313122441.GA1427@jama>
References: <063a84ff-92b0-6d0f-475a-6e334ed02696@gmail.com>
MIME-Version: 1.0
In-Reply-To: <063a84ff-92b0-6d0f-475a-6e334ed02696@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-03-09
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
X-List-Received-Date: Tue, 13 Mar 2018 12:24:42 -0000
X-Groupsio-MsgNum: 71244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 11, 2018 at 11:10:57PM -0700, akuster808 wrote:
> OE-Core is heading to its M3, which means meta-openembedded master needs =
to become cleaner.=20
>=20
> Please look at the packages below and if you care about them, please send=
 patches or I will think about blacklisting them.
>=20
> BTW, x86 build is using musl.
>=20
> - Armin
>=20
> =3D=3D Failed tasks 2018-03-09 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180311_083331.log
>=20
> =3D=3D=3D common (8) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/libgnome-k=
eyring_2.32.0.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscs=
itarget_1.4.20.3+svn502.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1=
=2Ebb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/ipcalc/ipcalc_0.2=
=2E2.bb:do_populate_lic
>     * meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb:do=
_configure

Why was krb5 upgrade merged when it causes issues for all platforms?

Here is a fix for that:
https://patchwork.openembedded.org/patch/149233/

>     * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb=
:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_git.=
bb:do_compile
>     * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_gi=
t.bb:do_compile
>=20
> =3D=3D=3D common-x86 (2) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
=2E8beta5.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-sbenchmark/libhugetlbfs/libhugetl=
bfs_git.bb:do_compile
>=20
> =3D=3D=3D qemuarm (11) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyr=
ing_2.32.1.bb:do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/=
gstd_1.0.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepal=
ived_1.3.5.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-filter/ebtables/ebtables_=
2.0.10-4.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.10=
5.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:=
do_configure
>     * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_gi=
t.bb:do_packagedata
>     * meta-openembedded/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.=
bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_c=
ompile
>=20
> =3D=3D=3D qemuarm64 (7) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-uti=
l_git.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_2=
0110206.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_pa=
ckage_qa
>     * openembedded-core/meta/recipes-devtools/go/go_1.10.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_packa=
ge_qa
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:d=
o_compile
>=20
> =3D=3D=3D qemux86 (23) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium-x11_64.0.3282.167.bb=
:do_patch
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
>     * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
=2E18.02.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
=2E3.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-support/wireshark/wiresha=
rk_2.4.5.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-=
glib_0.24.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.113.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-gnome/libunique/libunique_1.1.6.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
>     * openembedded-core/meta/recipes-connectivity/avahi/avahi_0.7.bb:do_c=
ompile
>     * openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.6.bb:do_compile
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.4.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa
>     * openembedded-core/meta/recipes-support/atk/at-spi2-core_2.26.2.bb:d=
o_compile
>=20
> =3D=3D=3D qemux86_64 (3) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_co=
mpile
>     * openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.34.bb:d=
o_fetch
>     * virtual:native:openembedded-core/meta/recipes-multimedia/libpng/lib=
png_1.6.34.bb:do_fetch
>=20
> =3D=3D=3D Number of failed tasks (95) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 19	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemuarm.20180308_051341.log/ || http://errors.yoctoproject.org/E=
rrors/Build/55321/
> |-
> || qemuarm64 	|| 24	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemuarm64.20180309_095046.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/55763/
> |-
> || qemux86 	|| 37	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20180308_051349.log/ || http://errors.yoctoproject.org/E=
rrors/Build/55320/
> |-
> || qemux86_64 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world/s=
umo/log.world.qemux86-64.20180309_044104.log/ || http://errors.yoctoproject=
=2Eorg/Errors/Build/55647/
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (1002) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||compile-host-path
> |-
> ||0	||file-rdeps
> |-
> ||0	||host-user-contaminated
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||ldflags
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||qa_pseudo
> |-
> ||0	||symlink-to-sysroot
> |-
> ||1	||installed-vs-shipped
> |-
> ||2	||unknown-configure-option
> |-
> ||7	||textrel
> |-
> ||994	||version-going-backwards
> |}
>=20
>=20
>=20
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>=20
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20180310_192110.log/
>=20
>=20
>     * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEP=
ENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEP=
ENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEP=
ENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps

This should be fixed by:
https://patchwork.openembedded.org/patch/148542/
which isn't in master-next even when it's in "Master Under Test"

You'll probably need:
https://patchwork.openembedded.org/patch/148544/
as well for clean PACKAGE_ARCH state, which also isn't in master-next.

It looks like you're updating master-next differently than what I was
doing, I was updating master-next every time I've picked some changes
=66rom ML/patchwork to include them in the world builds (the builds were
using contrib/jansa/master which was rebased on top of
origin/master-next sometimes with few changes on top of master-next
e.g. before I've sent them to the ML.)

Now master-next seems to be updated only when some changes are pushed to
master and the diff between origin/master and
contrib/stagging/master-next is what used to be in master-next. So
people who helped by testing origin/master-next now aren't testing all
the changes you do test in world builds and might not be tested by them
before it's merged to master.

I remember you've sent some e-mail about using stagging/ prefix instead
of -next branches, but I cannot find it and maybe more people aren't
aware of this change.

Regards,

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
>=20
>=20
> QA issues by type:
> count: 0	issue: already-stripped
>=20
>=20
> count: 0	issue: libdir
>=20
>=20
> count: 7	issue: textrel
> ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-p=
test/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test' h=
as relocations in .text [textrel]
> ELF binary '/work/aarch64-oe-linux/go/1.10-r0/packages-split/go/usr/lib/g=
o/bin/go' has relocations in .text [textrel]
> glide-0.13.1: ELF binary '/work/i586-oe-linux-musl/glide/0.13.1-r0/packag=
es-split/glide/usr/bin/glide' has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages=
-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.=
test' has relocations in .text [textrel]
> go-dep-0.4.1: ELF binary '/work/i586-oe-linux-musl/go-dep/0.4.1-r0/packag=
es-split/go-dep/usr/bin/dep' has relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264' has=
 relocations in .text [textrel]
> x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.15=
2' has relocations in .text [textrel]
>=20
>=20
> count: 0	issue: build-deps
>=20
>=20
> count: 0	issue: file-rdeps
>=20
>=20
> count: 994	issue: version-going-backwards
> devilspie2-0.42: Package version for package devilspie2-dbg went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-dbg went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-dev went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-dev went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-doc went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-doc went backward=
s which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) [versi=
on-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-fi went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-fi went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-fr went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-fr went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-it went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-it went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-ja went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-ja went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-nl went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-nl went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-pt-br went=
 backwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.1=
6) [version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-pt-br went=
 backwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.3=
4) [version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-ru went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-ru went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-sv went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-locale-sv went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-staticdev went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2-staticdev went ba=
ckwards which would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) =
[version-going-backwards]
> devilspie2-0.42: Package version for package devilspie2 went backwards wh=
ich would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.16) [version-g=
oing-backwards]
> devilspie2-0.42: Package version for package devilspie2 went backwards wh=
ich would break package feeds from (0:0.43-r0.0 to 0:0.42-r0.34) [version-g=
oing-backwards]
> exo-0.11.5: Package version for package exo-csource went backwards which =
would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version-g=
oing-backwards]
> exo-0.11.5: Package version for package exo-dbg went backwards which woul=
d break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version-going=
-backwards]
> exo-0.11.5: Package version for package exo-dev went backwards which woul=
d break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version-going=
-backwards]
> exo-0.11.5: Package version for package exo-doc went backwards which woul=
d break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version-going=
-backwards]
> exo-0.11.5: Package version for package exo-locale-am went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ar went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ast went backwards whi=
ch would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [versio=
n-going-backwards]
> exo-0.11.5: Package version for package exo-locale-be went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-bg went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-bn went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ca went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-cs went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-da went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-de went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-el went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-en-au went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-en-gb went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-es went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-et went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-eu went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-fi went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-fr went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-gl went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-he went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-hr went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-hu went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-id went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-is went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-it went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ja went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-kk went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ko went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-lt went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-lv went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ms went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-nb went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-nl went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-nn went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-oc went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-pa went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-pl went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-pt-br went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-pt went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ro went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ru went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-si went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-sk went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-sl went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-sq went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-sr went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-sv went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-te went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-th went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-tr went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ug went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-uk went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ur-pk went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-ur went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-vi went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo-locale-zh-cn went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-zh-hk went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-locale-zh-tw went backwards w=
hich would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [vers=
ion-going-backwards]
> exo-0.11.5: Package version for package exo-staticdev went backwards whic=
h would break package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version=
-going-backwards]
> exo-0.11.5: Package version for package exo went backwards which would br=
eak package feeds from (0:0.12.0-r0.0 to 0:0.11.5-r0.18) [version-going-bac=
kwards]
> keepalived-1.3.5: Package version for package keepalived-dbg went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-dbg went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-dev went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-dev went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-doc went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-doc went backwar=
ds which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9) [ver=
sion-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-locale went back=
wards which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4) [=
version-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-locale went back=
wards which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9) [=
version-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-staticdev went b=
ackwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4=
) [version-going-backwards]
> keepalived-1.3.5: Package version for package keepalived-staticdev went b=
ackwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9=
) [version-going-backwards]
> keepalived-1.3.5: Package version for package keepalived went backwards w=
hich would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.4) [version=
-going-backwards]
> keepalived-1.3.5: Package version for package keepalived went backwards w=
hich would break package feeds from (0:1.4.2-r0.0 to 0:1.3.5-r0.9) [version=
-going-backwards]
> libldb-1.2.2: Package version for package libldb-dbg went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-dbg went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-dev went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-dev went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-doc went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-doc went backwards which=
 would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-go=
ing-backwards]
> libldb-1.2.2: Package version for package libldb-locale went backwards wh=
ich would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version=
-going-backwards]
> libldb-1.2.2: Package version for package libldb-locale went backwards wh=
ich would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version=
-going-backwards]
> libldb-1.2.2: Package version for package libldb-staticdev went backwards=
 which would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [vers=
ion-going-backwards]
> libldb-1.2.2: Package version for package libldb-staticdev went backwards=
 which would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [vers=
ion-going-backwards]
> libldb-1.2.2: Package version for package libldb went backwards which wou=
ld break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-going-=
backwards]
> libldb-1.2.2: Package version for package libldb went backwards which wou=
ld break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-going-=
backwards]
> libldb-1.2.2: Package version for package pyldb-dbg went backwards which =
would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-goi=
ng-backwards]
> libldb-1.2.2: Package version for package pyldb-dbg went backwards which =
would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-goi=
ng-backwards]
> libldb-1.2.2: Package version for package pyldb-dev went backwards which =
would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-goi=
ng-backwards]
> libldb-1.2.2: Package version for package pyldb-dev went backwards which =
would break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-goi=
ng-backwards]
> libldb-1.2.2: Package version for package pyldb went backwards which woul=
d break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.14) [version-going-b=
ackwards]
> libldb-1.2.2: Package version for package pyldb went backwards which woul=
d break package feeds from (0:1.3.1-r0.0 to 0:1.2.2-r0.16) [version-going-b=
ackwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer-dbg went b=
ackwards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.1-r0.1=
6) [version-going-backwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer-dev went b=
ackwards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.1-r0.1=
6) [version-going-backwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer-doc went b=
ackwards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.1-r0.1=
6) [version-going-backwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer-locale wen=
t backwards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.1-r=
0.16) [version-going-backwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer-staticdev =
went backwards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.=
1-r0.16) [version-going-backwards]
> libsdl2-mixer-2.0.1: Package version for package libsdl2-mixer went backw=
ards which would break package feeds from (0:2.0.2-r0.0 to 0:2.0.1-r0.16) [=
version-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-dbg went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-dbg went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-dev went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-dev went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-doc went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-doc went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-locale went backw=
ards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14)=
 [version-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-locale went backw=
ards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16)=
 [version-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-staticdev went ba=
ckwards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.=
14) [version-going-backwards]
> libtevent-0.9.33: Package version for package libtevent-staticdev went ba=
ckwards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.=
16) [version-going-backwards]
> libtevent-0.9.33: Package version for package libtevent went backwards wh=
ich would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14) [versi=
on-going-backwards]
> libtevent-0.9.33: Package version for package libtevent went backwards wh=
ich would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16) [versi=
on-going-backwards]
> libtevent-0.9.33: Package version for package python-tevent-dbg went back=
wards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14=
) [version-going-backwards]
> libtevent-0.9.33: Package version for package python-tevent-dbg went back=
wards which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16=
) [version-going-backwards]
> libtevent-0.9.33: Package version for package python-tevent went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.14) [v=
ersion-going-backwards]
> libtevent-0.9.33: Package version for package python-tevent went backward=
s which would break package feeds from (0:0.9.36-r0.0 to 0:0.9.33-r0.16) [v=
ersion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dbg went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dbg went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dbg went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dev went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dev went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-dev went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-doc went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-doc went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-doc went backwards=
 which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32) [vers=
ion-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ca went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ca went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ca went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-cs went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-cs went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-cs went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-de went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-de went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-de went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-el went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-el went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-el went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-au went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-au went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-au went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-gb went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-gb went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-en-gb went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eo went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eo went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eo went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-es went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-es went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-es went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eu went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eu went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-eu went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fi went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fi went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fi went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fy went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fy went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-fy went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-he went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-he went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-he went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-hr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-hr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-hr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-is went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-is went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-is went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-it went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-it went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-it went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ja went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ja went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ja went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ko went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ko went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ko went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-lt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-lt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-lt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ml went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ml went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ml went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ms went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ms went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ms went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-nl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-nl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-nl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-br went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-br went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-br went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-pt went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-pt went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt-pt went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-pt went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ru went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ru went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-ru went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-si went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-si went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-si went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sl went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sr went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sv went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sv went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-sv went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-uk went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-uk went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-uk went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-cn went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-cn went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-cn went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-hk went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-hk went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-hk went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-tw went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
15) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-tw went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
16) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-locale-zh-tw went =
backwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.=
32) [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-staticdev went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-staticdev went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre-staticdev went bac=
kwards which would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32)=
 [version-going-backwards]
> menulibre-2.1.3: Package version for package menulibre went backwards whi=
ch would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.15) [version-=
going-backwards]
> menulibre-2.1.3: Package version for package menulibre went backwards whi=
ch would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.16) [version-=
going-backwards]
> menulibre-2.1.3: Package version for package menulibre went backwards whi=
ch would break package feeds from (0:2.1.5-r0.0 to 0:2.1.3-r0.32) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-dbg went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-dbg went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-dbg went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-dev went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-dev went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-dev went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-doc went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-doc went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-doc went backwards which wou=
ld break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-going-=
backwards]
> nano-2.7.4: Package version for package nano-locale-bg went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-bg went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-bg went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ca went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ca went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ca went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-cs went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-cs went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-cs went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-da went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-da went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-da went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-de went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-de went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-de went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eo went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eo went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eo went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-es went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-es went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-es went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-eu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-fr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ga went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ga went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ga went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-gl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-gl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-gl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-hu went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-id went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-id went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-id went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-it went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-it went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-it went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ja went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ja went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ja went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ms went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ms went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ms went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nb went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nb went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nb went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nn went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nn went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-nn went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-pl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-pl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-pl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-pt-br went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-pt-br went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-pt-br went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-ro went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ro went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ro went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ru went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ru went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-ru went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sl went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sv went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sv went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-sv went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-tr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-tr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-tr went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-uk went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-uk went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-uk went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-vi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-vi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-vi went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-cn went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-cn went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-cn went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-tw went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-tw went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-locale-zh-tw went backwards =
which would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [versi=
on-going-backwards]
> nano-2.7.4: Package version for package nano-staticdev went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-staticdev went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano-staticdev went backwards whi=
ch would break package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-=
going-backwards]
> nano-2.7.4: Package version for package nano went backwards which would b=
reak package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.11) [version-going-back=
wards]
> nano-2.7.4: Package version for package nano went backwards which would b=
reak package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.15) [version-going-back=
wards]
> nano-2.7.4: Package version for package nano went backwards which would b=
reak package feeds from (0:2.9.3-r0.0 to 0:2.7.4-r0.28) [version-going-back=
wards]
> parole-0.8.1: Package version for package parole-dbg went backwards which=
 would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [version-go=
ing-backwards]
> parole-0.8.1: Package version for package parole-dev went backwards which=
 would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [version-go=
ing-backwards]
> parole-0.8.1: Package version for package parole-doc went backwards which=
 would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [version-go=
ing-backwards]
> parole-0.8.1: Package version for package parole-locale-ar went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ast went backward=
s which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [ver=
sion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-bg went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ca went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-cs went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-da went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-de went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-el went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-en-au went backwa=
rds which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [v=
ersion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-en-gb went backwa=
rds which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [v=
ersion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-es went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-eu went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-fi went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-fr went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-gl went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-he went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-hr went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-hu went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-id went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-is went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-it went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ja went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-kk went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ko went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-lt went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-lv went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ms went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-nb went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-nl went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-nn went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-oc went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-pl went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-pt-br went backwa=
rds which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [v=
ersion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-pt went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ru went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-sk went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-sr went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-sv went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-te went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-th went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-tr went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-ug went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-uk went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-zh-cn went backwa=
rds which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [v=
ersion-going-backwards]
> parole-0.8.1: Package version for package parole-locale-zh-tw went backwa=
rds which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [v=
ersion-going-backwards]
> parole-0.8.1: Package version for package parole-staticdev went backwards=
 which would break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [vers=
ion-going-backwards]
> parole-0.8.1: Package version for package parole went backwards which wou=
ld break package feeds from (0:1.0.0-r0.0 to 0:0.8.1-r0.17) [version-going-=
backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-dbg went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
6) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-dbg went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
8) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-dev went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
6) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-dev went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
8) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-doc went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
6) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-doc went ba=
ckwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.=
8) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-locale went=
 backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-=
r0.6) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-locale went=
 backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-=
r0.8) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-staticdev w=
ent backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11=
=2E4-r0.6) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi-staticdev w=
ent backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11=
=2E4-r0.8) [version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi went backwa=
rds which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.6) [=
version-going-backwards]
> python3-cffi-1.11.4: Package version for package python3-cffi went backwa=
rds which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.8) [=
version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-bson went back=
wards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.11) =
[version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-bson went back=
wards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.9) [=
version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-dbg we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.11) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-dbg we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.9) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-dev we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.11) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-dev we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.9) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-doc we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.11) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-doc we=
nt backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-=
r0.9) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-locale=
 went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6=
=2E0-r0.11) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-locale=
 went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6=
=2E0-r0.9) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-static=
dev went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:=
3.6.0-r0.11) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo-static=
dev went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:=
3.6.0-r0.9) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo went b=
ackwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.1=
1) [version-going-backwards]
> python3-pymongo-3.6.0: Package version for package python3-pymongo went b=
ackwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.9=
) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dbg wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
12) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dbg wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
15) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dbg wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
29) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dev wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
12) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dev wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
15) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-dev wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
29) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-doc wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
12) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-doc wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
15) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-doc wen=
t backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.=
29) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-locale =
went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-=
r0.12) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-locale =
went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-=
r0.15) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-locale =
went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-=
r0.29) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-staticd=
ev went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.=
23-r0.12) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-staticd=
ev went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.=
23-r0.15) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent-staticd=
ev went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.=
23-r0.29) [version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent went ba=
ckwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.12) =
[version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent went ba=
ckwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.15) =
[version-going-backwards]
> python3-serpent-1.23: Package version for package python3-serpent went ba=
ckwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.29) =
[version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-dbg went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.6)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-dbg went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.8)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-dev went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.6)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-dev went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.8)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-doc went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.6)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-doc went back=
wards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.8)=
 [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-locale went b=
ackwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0=
=2E6) [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-locale went b=
ackwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0=
=2E8) [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-staticdev wen=
t backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4=
-r0.6) [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi-staticdev wen=
t backwards which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4=
-r0.8) [version-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi went backward=
s which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.6) [ve=
rsion-going-backwards]
> python-cffi-1.11.4: Package version for package python-cffi went backward=
s which would break package feeds from (0:1.11.5-r0.0 to 0:1.11.4-r0.8) [ve=
rsion-going-backwards]
> python-pymongo-3.6.0: Package version for package python-bson went backwa=
rds which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.11) [v=
ersion-going-backwards]
> python-pymongo-3.6.0: Package version for package python-bson went backwa=
rds which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.9) [ve=
rsion-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-dbg went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E11) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-dbg went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E9) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-dev went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E11) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-dev went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E9) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-doc went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E11) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-doc went=
 backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0=
=2E9) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-locale w=
ent backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0=
-r0.11) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-locale w=
ent backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0=
-r0.9) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-staticde=
v went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.=
6.0-r0.11) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo-staticde=
v went backwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.=
6.0-r0.9) [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo went bac=
kwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.11)=
 [version-going-backwards]
> python-pymongo-3.6.0: Package version for package python-pymongo went bac=
kwards which would break package feeds from (0:3.6.1-r0.0 to 0:3.6.0-r0.9) =
[version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dbg went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.13=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dbg went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.15=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dbg went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.16=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dbg went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.30=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dev went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.13=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dev went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.15=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dev went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.16=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-dev went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.30=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-doc went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.13=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-doc went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.15=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-doc went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.16=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-doc went =
backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.30=
) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-locale we=
nt backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0=
=2E13) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-locale we=
nt backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0=
=2E15) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-locale we=
nt backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0=
=2E16) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-locale we=
nt backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0=
=2E30) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-staticdev=
 went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23=
-r0.13) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-staticdev=
 went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23=
-r0.15) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-staticdev=
 went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23=
-r0.16) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent-staticdev=
 went backwards which would break package feeds from (0:1.24-r0.0 to 0:1.23=
-r0.30) [version-going-backwards]
> python-serpent-1.23: Package version for package python-serpent went back=
wards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.13) [v=
ersion-going-backwards]
> python-serpent-1.23: Package version for package python-serpent went back=
wards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.15) [v=
ersion-going-backwards]
> python-serpent-1.23: Package version for package python-serpent went back=
wards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.16) [v=
ersion-going-backwards]
> python-serpent-1.23: Package version for package python-serpent went back=
wards which would break package feeds from (0:1.24-r0.0 to 0:1.23-r0.30) [v=
ersion-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-dev went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-doc went backwards which would break pack=
age feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3=
e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-dev went backwards which would b=
reak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples-staticdev went backwards which w=
ould break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.=
11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-examples went backwards which would break=
 package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-locale went backwards which would break p=
ackage feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git=
0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-mkspecs went backwards which would break =
package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-plugins-dbg went backwards which would br=
eak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alph=
a+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-plugins went backwards which would break =
package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmldesigner went backwards which would br=
eak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alph=
a+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmlplugins-dbg went backwards which would=
 break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-qmlplugins went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha=
+git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-staticdev went backwards which would brea=
k package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+=
git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-tools-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+=
git0+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects-tools went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0=
+3e28d47cea-r0.0) [version-going-backwards]
> qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package versi=
on for package qtgraphicaleffects went backwards which would break package =
feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d=
47cea-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-dbg went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-dev went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-doc went backwards which would break package f=
eeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+=
git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.=
11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-dev went backwards which would break =
package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.=
11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples-staticdev went backwards which would =
break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.1=
0.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-examples went backwards which would break pack=
age feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-locale went backwards which would break packag=
e feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-mkspecs went backwards which would break packa=
ge feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-al=
pha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-plugins-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-plugins went backwards which would break packa=
ge feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-al=
pha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmldesigner went backwards which would break p=
ackage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.1=
1-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmlplugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+=
5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-qmlplugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11=
-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-staticdev went backwards which would break pac=
kage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-=
alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-tools-dbg went backwards which would break pac=
kage feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-=
alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation-tools went backwards which would break package=
 feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alph=
a+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package ve=
rsion for package qtlocation went backwards which would break package feeds=
 from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0=
+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-dev went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-doc went backwards which would break package feeds from (0:5.=
10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [ver=
sion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-dbg went backwards which would break package feeds f=
rom (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r=
0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-dev went backwards which would break package feeds f=
rom (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r=
0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples-staticdev went backwards which would break package f=
eeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa0227=
1a18-r0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-examples went backwards which would break package feeds from =
(0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0)=
 [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-locale went backwards which would break package feeds from (0=
:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [=
version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) =
[version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0=
=2E0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) =
[version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-ptest went backwards which would break package feeds from (0:=
5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [v=
ersion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0=
=2E0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18=
-r0.0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.=
0) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0=
) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0=
) [version-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1-tools went backwards which would break package feeds from (0:=
5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [v=
ersion-going-backwards]
> qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for pac=
kage qtquick1 went backwards which would break package feeds from (0:5.10.1=
+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version=
-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-dbg went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-dev went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-doc went backwards which would break package =
feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d2=
73e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-dev went backwards which would break=
 package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples-staticdev went backwards which would=
 break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-a=
lpha+git0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-examples went backwards which would break pac=
kage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+=
e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-locale went backwards which would break packa=
ge feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e8=
0d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-mkspecs went backwards which would break pack=
age feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e=
80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-plugins-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-plugins went backwards which would break pack=
age feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e=
80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmldesigner went backwards which would break =
package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmlplugins-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha=
+git0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-qmlplugins went backwards which would break p=
ackage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git=
0+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-staticdev went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0=
+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-tools-dbg went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0=
+e80d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2-tools went backwards which would break packag=
e feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80=
d273e6f-r0.0) [version-going-backwards]
> qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version=
 for package qtquickcontrols2 went backwards which would break package feed=
s from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6=
f-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-dbg went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-dev went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-doc went backwards which would break package fe=
eds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bf=
cc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-dbg went backwards which would break p=
ackage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git=
0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-dev went backwards which would break p=
ackage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git=
0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples-staticdev went backwards which would b=
reak package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-examples went backwards which would break packa=
ge feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c=
9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-locale went backwards which would break package=
 feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f=
0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-mkspecs went backwards which would break packag=
e feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9=
f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-plugins-dbg went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0=
+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-plugins went backwards which would break packag=
e feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9=
f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmldesigner went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0=
+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmlplugins-dbg went backwards which would break=
 package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-qmlplugins went backwards which would break pac=
kage feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+=
6c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-staticdev went backwards which would break pack=
age feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6=
c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-tools-dbg went backwards which would break pack=
age feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6=
c9f0bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols-tools went backwards which would break package =
feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0=
bfcc4-r0.0) [version-going-backwards]
> qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version =
for package qtquickcontrols went backwards which would break package feeds =
=66rom (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc=
4-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dev went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-dictionaries went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-doc went backwards which would break packag=
e feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+905=
5bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-dev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha=
+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples-staticdev went backwards which wou=
ld break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11=
-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-examples went backwards which would break p=
ackage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git=
0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-locale went backwards which would break pac=
kage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+=
9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-mkspecs went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0=
+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-plugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+=
git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-plugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0=
+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmldesigner went backwards which would brea=
k package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+=
git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmlplugins-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-qmlplugins went backwards which would break=
 package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-staticdev went backwards which would break =
package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-tools-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+9055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard-tools went backwards which would break pack=
age feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9=
055bd5665-r0.0) [version-going-backwards]
> qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package versio=
n for package qtvirtualkeyboard went backwards which would break package fe=
eds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5=
665-r0.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-dbg went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-dev went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-doc went backwards which would break package feeds from (0:5.=
10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [ver=
sion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-locale went backwards which would break package feeds from (0=
:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [=
version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-mkspecs went backwards which would break package feeds from (=
0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) =
[version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-plugins-dbg went backwards which would break package feeds fr=
om (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0=
=2E0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-plugins went backwards which would break package feeds from (=
0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) =
[version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmldesigner went backwards which would break package feeds fr=
om (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0=
=2E0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988=
-r0.0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-qmlplugins went backwards which would break package feeds fro=
m (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.=
0) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-staticdev went backwards which would break package feeds from=
 (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0=
) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-tools-dbg went backwards which would break package feeds from=
 (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0=
) [version-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit-tools went backwards which would break package feeds from (0:=
5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [v=
ersion-going-backwards]
> qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for pac=
kage qtwebkit went backwards which would break package feeds from (0:5.10.1=
+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version=
-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-dbg went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-dev went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-doc went backwards which would break packag=
e feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d6=
8492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-dbg went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha=
+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-dev went backwards which would bre=
ak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha=
+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples-staticdev went backwards which wou=
ld break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11=
-alpha+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-examples went backwards which would break p=
ackage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git=
0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-locale went backwards which would break pac=
kage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+=
2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-mkspecs went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0=
+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-plugins-dbg went backwards which would brea=
k package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+=
git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-plugins went backwards which would break pa=
ckage feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0=
+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmldesigner went backwards which would brea=
k package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+=
git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmlplugins-dbg went backwards which would b=
reak package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alp=
ha+git0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-qmlplugins went backwards which would break=
 package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+g=
it0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-staticdev went backwards which would break =
package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-tools-dbg went backwards which would break =
package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+gi=
t0+2d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples-tools went backwards which would break pack=
age feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2=
d68492004-r0.0) [version-going-backwards]
> qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package versio=
n for package qtwebkit-examples went backwards which would break package fe=
eds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492=
004-r0.0) [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-dbg went backwards whic=
h would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [version=
-going-backwards]
> thunar-1.6.13: Package version for package thunar-dev went backwards whic=
h would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [version=
-going-backwards]
> thunar-1.6.13: Package version for package thunar-doc went backwards whic=
h would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [version=
-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-am went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ar went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ast went backwar=
ds which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [=
version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-be went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-bg went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-bn went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ca went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-cs went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-da went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-de went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-el went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-en-au went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-en-gb went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-eo went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-es went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-et went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-eu went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-fa-ir went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-fi went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-fr went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-gl went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-he went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-hr went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-hu went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-id went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-is went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-it went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ja went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-kk went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ko went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-lt went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-lv went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ms went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-nb went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-nl went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-nn went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-oc went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-pa went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-pl went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-pt-br went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-pt went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ro went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ru went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-si went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-sk went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-sl went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-sq went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-sr went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-sv went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-te went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-th went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-tr went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ug went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-uk went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ur-pk went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-ur went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-vi went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-zh-cn went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-zh-hk went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-locale-zh-tw went backw=
ards which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12)=
 [version-going-backwards]
> thunar-1.6.13: Package version for package thunar-staticdev went backward=
s which would break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [v=
ersion-going-backwards]
> thunar-1.6.13: Package version for package thunar went backwards which wo=
uld break package feeds from (0:1.6.14-r0.0 to 0:1.6.13-r0.12) [version-goi=
ng-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxgue=
st-4.15.3-yocto-standard went backwards which would break package feeds fro=
m (0:5.2.8-r0.0 to 0:5.2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxgue=
st went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5=
=2E2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxsf-=
4.15.3-yocto-standard went backwards which would break package feeds from (=
0:5.2.8-r0.0 to 0:5.2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxsf =
went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5.2.=
6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxvid=
eo-4.15.3-yocto-standard went backwards which would break package feeds fro=
m (0:5.2.8-r0.0 to 0:5.2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package kernel-module-vboxvid=
eo went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5=
=2E2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers-dbg =
went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5.2.=
6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers-dev =
went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5.2.=
6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers-doc =
went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5.2.=
6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers-loca=
le went backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5=
=2E2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers-stat=
icdev went backwards which would break package feeds from (0:5.2.8-r0.0 to =
0:5.2.6-r0.1) [version-going-backwards]
> vboxguestdrivers-5.2.6: Package version for package vboxguestdrivers went=
 backwards which would break package feeds from (0:5.2.8-r0.0 to 0:5.2.6-r0=
=2E1) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-dbg went b=
ackwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.0-r0.1=
5) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-dev went b=
ackwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.0-r0.1=
5) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-doc went b=
ackwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.0-r0.1=
5) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ar =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ast=
 went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4=
=2E0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-bg =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ca =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-cs =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-da =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-de =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-el =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-en-=
au went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0=
=2E4.0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-en-=
gb went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0=
=2E4.0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-es =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-eu =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-fi =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-fr =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-gl =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-he =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-hr =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-hu =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-id =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-is =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-it =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ja =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-kk =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ko =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-lt =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-lv =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ms =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-nb =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-nl =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-oc =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-pa =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-pl =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-pt-=
br went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0=
=2E4.0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-pt =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ro =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ru =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-si =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-sk =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-sl =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-sq =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-sr =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-sv =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-th =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-tr =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-ug =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-uk =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-vi =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-zh-=
cn went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0=
=2E4.0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-locale-zh-=
tw went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0=
=2E4.0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd-staticdev =
went backwards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.=
0-r0.15) [version-going-backwards]
> xfce4-notifyd-0.4.0: Package version for package xfce4-notifyd went backw=
ards which would break package feeds from (0:0.4.2-r0.0 to 0:0.4.0-r0.15) [=
version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-dbg went backwards which would break package feeds from (0:0.3.5-=
r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-dev went backwards which would break package feeds from (0:0.3.5-=
r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-doc went backwards which would break package feeds from (0:0.3.5-=
r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-bg went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-ca went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-cs went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-da went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-de went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-el went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-en-au went backwards which would break package feeds from =
(0:0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-es went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-fr went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-gl went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-he went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-hr went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-hu went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-id went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-is went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-it went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-ja went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-kk went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-ko went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-lt went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-ms went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-nb went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-nl went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-oc went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-pl went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-pt-br went backwards which would break package feeds from =
(0:0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-pt went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-ru went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-sk went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-sl went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-sr went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-sv went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-th went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-tr went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-uk went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-zh-cn went backwards which would break package feeds from =
(0:0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-locale-zh-tw went backwards which would break package feeds from =
(0:0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin-staticdev went backwards which would break package feeds from (0:=
0.3.5-r0.0 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-pulseaudio-plugin-0.3.4: Package version for package xfce4-pulseaud=
io-plugin went backwards which would break package feeds from (0:0.3.5-r0.0=
 to 0:0.3.4-r0.6) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-dbg went=
 backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:0.8.6-=
r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-dev went=
 backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:0.8.6-=
r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-doc went=
 backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:0.8.6-=
r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-a=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-a=
st went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0=
:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-b=
e went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-b=
g went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-c=
a went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-c=
s went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-d=
a went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-d=
e went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
l went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
n-au went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
n-gb went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
o went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
s went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
t went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-e=
u went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-f=
i went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-f=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-g=
l went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-h=
e went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-h=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-h=
u went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-i=
d went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-i=
s went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-i=
t went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-j=
a went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-k=
k went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-k=
o went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-l=
t went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-l=
v went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-m=
s went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-n=
b went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-n=
l went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-o=
c went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-p=
a went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-p=
l went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-p=
t-br went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-p=
t went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-r=
o went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-r=
u went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
i went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
k went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
l went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
q went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-s=
v went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-t=
e went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-t=
h went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-t=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-u=
g went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-u=
k went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-u=
r-pk went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-u=
r went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-v=
i went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-z=
h-cn went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-locale-z=
h-tw went backwards which would break package feeds from (0:0.8.7.1-r0.0 to=
 0:0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal-staticde=
v went backwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:=
0.8.6-r0.18) [version-going-backwards]
> xfce4-terminal-0.8.6: Package version for package xfce4-terminal went bac=
kwards which would break package feeds from (0:0.8.7.1-r0.0 to 0:0.8.6-r0.1=
8) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
dbg went backwards which would break package feeds from (0:1.7.0-r0.0 to 0:=
1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
dev went backwards which would break package feeds from (0:1.7.0-r0.0 to 0:=
1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
doc went backwards which would break package feeds from (0:1.7.0-r0.0 to 0:=
1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ar went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ast went backwards which would break package feeds from (0:1.7.0-r0.=
0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-bg went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ca went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-cs went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-da went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-de went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-el went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-en-au went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-en-gb went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-es went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-eu went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-fr went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-gl went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-hr went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-hu went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-id went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-it went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ja went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ko went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-lv went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ms went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-nb went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-nl went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-oc went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-pl went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-pt-br went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-pt went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ru went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-sk went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-sq went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-sr went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-sv went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-th went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-tr went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ug went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-uk went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ur-pk went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-ur went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-zh-cn went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
locale-zh-tw went backwards which would break package feeds from (0:1.7.0-r=
0.0 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin-=
staticdev went backwards which would break package feeds from (0:1.7.0-r0.0=
 to 0:1.6.0-r0.18) [version-going-backwards]
> xfce4-timer-plugin-1.6.0: Package version for package xfce4-timer-plugin =
went backwards which would break package feeds from (0:1.7.0-r0.0 to 0:1.6.=
0-r0.18) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-dbg went backwards which would break package feeds from (0:2.1.=
5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-dev went backwards which would break package feeds from (0:2.1.=
5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-doc went backwards which would break package feeds from (0:2.1.=
5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-am went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ar went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ast went backwards which would break package feeds from =
(0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-bg went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ca+valencia went backwards which would break package fee=
ds from (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ca went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-cs went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-da went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-de went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-el went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-en-gb went backwards which would break package feeds fro=
m (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-es went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-et went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-eu went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-fa went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-fi went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-fr went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-he went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-hr went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-hu went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-id went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-is went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-it went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ja went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-kk went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ko went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-lt went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-lv went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ms went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-nb went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ne went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-nl went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-pl went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-pt-br went backwards which would break package feeds fro=
m (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-pt went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ro went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-ru went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-sk went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-sl went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-sr+latin went backwards which would break package feeds =
=66rom (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-sr went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-sv went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-tr went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-uk went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-uz went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-vi went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-zh-cn went backwards which would break package feeds fro=
m (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-locale-zh-tw went backwards which would break package feeds fro=
m (0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin-staticdev went backwards which would break package feeds from (=
0:2.1.5-r0.0 to 0:2.1.4-r0.12) [version-going-backwards]
> xfce4-whiskermenu-plugin-2.1.4: Package version for package xfce4-whisker=
menu-plugin went backwards which would break package feeds from (0:2.1.5-r0=
=2E0 to 0:2.1.4-r0.12) [version-going-backwards]
>=20
>=20
> count: 0	issue: host-user-contaminated
>=20
>=20
> count: 1	issue: installed-vs-shipped
> rdist: 1 installed and not shipped files. [installed-vs-shipped]
>=20
>=20
> count: 2	issue: unknown-configure-option
> gstd-1.0: gstd: configure was passed unrecognised options: --disable-gtk-=
doc [unknown-configure-option]
> krb5-1.16: krb5: configure was passed unrecognised options: --with-pkinit=
-crypto-impl [unknown-configure-option]
>=20
>=20
> count: 0	issue: symlink-to-sysroot
>=20
>=20
> count: 0	issue: invalid-pkgconfig
>=20
>=20
> count: 0	issue: pkgname
>=20
>=20
> count: 0	issue: ldflags
>=20
>=20
> count: 0	issue: compile-host-path
>=20
>=20
> count: 0	issue: qa_pseudo
>=20
>=20
>=20
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>=20
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:=20
> 6138897 cooker: Fix environment double key expansion issue
> not included in master yet:=20
> 7eec204 world-image: add extra target
> 5e7e759 fetch2: Allow Fetch.download() to warn instead of error
>=20
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:=20
> 45afadf python3: Fix install purelib to make pip3-python work properly
> not included in master yet:=20
> bcc7702 waf.bbclass: check that waf exists before trying to execute it
> 9da6103 iputils: add libidn dependency
> 90fe4b8 insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> ebf03e5 kernel-devicetree.bbclass: Use lowercase names for shell variables
> 6694a48 kernel-devicetree.bbclass: Fix and simplify instalation of DTB fi=
les
> 521f997 kernel.bbclass: use the consistent naming schema for initramfs
> 9309c84 kernel.bbclass: move variables for kernel artifacts names to sepa=
rate bbclass
> f72ddc6 report-error: Allow to upload reports automatically
> 3ab28f3 sstate.bbclass: Do not cause build failures due to setscene errors
> f79da47 buildhistory.bbclass: metadata-revs show repo parent
> c7852f2 metadata-revs: provide more information
> 8ed7668 qemux86: Add identical qemux86copy variant for tests
> 3a9d914 reproducible_build.bbclass: initial support for binary reproducib=
ility
> 38bbef5 cpio: provide cpio-replacement-native
> e3ebd56 image_types.bbclass: improve cpio image reproducibility
> 4c395c1 rootfs-postcommands.bbclass: support binary reproducibility
> ebd55e8 pseudo: bump SRCREV
> fe9f220 pseudo-text: add dummy recipe to reproduce YOCTO #12434
>=20
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:=20
> 29e280e waf-samba.bbclass: No longer inherit waf.bbclass
> not included in master yet:=20
> 4ca25bd wireguard: udpate to 20171221 version
> 4c99eca cim-schema-exper: 2.39.0 -> 2.50.0
> 059f5dc waf-cross-answers: Add cross-answers-aarch64_be.txt
> c2521ff classes/recipes: Convert SkipPackage -> SkipRecipe
> d7f258a libgpiod: fix packaging of tools
> 411aff7 samba: Add packagegroup
> cfa51d5 net-snmp: Fix compiler options with paths in net-snmp-config
> 558a28a obexftp: use makefile instead of ninja cmake generator
> 72837c3 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, pytho=
n-pam, smbnetfs: require pam in DISTRO_FEATURES
> 470db26 geoipupdate: 2.4.0 -> 2.5.0
> afb6ba9 mdns: Do not include nss.h with musl
> 33b54b3 iscsi-initiator-utils: Upgrade to 2.0.876
> df79c44 samba: Refresh musl pam patch
> bef734b miniupnpd: update to 2.0.20180203 and add systemd service
> 0b57b14 wireshark: Update Package to 2.2.12
> 4f0e1b0 opensaf: Upgrade to 5.18.02
> 9cb2fe8 libtalloc: Upgrade to 2.1.11
> a03a802 postfix: adapt pkg_postinst to postinst_intercept
> 589bbba geoip: 1.6.9 -> 1.6.11
> 26faeff dhcpcd: update to 6.11.5
> 948fb66 wireshark: update to new 2.4.5 series
> 7a321a3 openl2tp: fix compile issue with 4.15 kernel
> 17576be xorgxrdp: add distro_features_check for x11
> bf3b591 xrdp, xorgxrdp: require pam in DISTRO_FEATURES
> 0e9edb8 grpc: move it from oe to networking layer
> e2f34f9 mosquito: move from oe to networking layer
> 4e0e1ed glade3: move from oe to gnome layer
> 1c74836 meta-gnome: layer.conf remove gtk depends
> 6e0be01 usermode: require pam in DISTRO_FEATURES
> 4a96ad7 vim: only include when x11 in DISTRO_FEATURES
> c02d74a uim: add distro_features_check for x11
> c36256b atkmm: only include when x11 in DISTRO_FEATURES
> 4a84b0c fltk: only include when x11 in DISTRO_FEATURES
> 37f07c2 geany: only include when x11 in DISTRO_FEATURES
> 08e2b74 orrery: only include when x11 in DISTRO_FEATURES
> 44b5d06 gimp: only include when x11 in DISTRO_FEATURES
> c59af13 libwmf: only include when x11 in DISTRO_FEATURES
> 55b0302 pangomm: only include when x11 in DISTRO_FEATURES
> a967e32 toscoterm: only include when x11 in DISTRO_FEATURES
> d4e4d9a gtkmathview: only include when x11 in DISTRO_FEATURES
> 73ef3bf libvncserver: only include when x11 in DISTRO_FEATURES
> 4742ebe obex-data-server: only include when x11 in DISTRO_FEATURES
> 6d30179 polkit-gnome: only include when x11 in DISTRO_FEATURES
> cc76ed5 libgxim: only include when x11 in DISTRO_FEATURES
> a07e6e5 gtkperf: only include when x11 in DISTRO_FEATURES
> f58d9a4 gegl: only include when x11 in DISTRO_FEATURES
> 338e388 xcursorgen: only include when x11 in DISTRO_FEATURES
> 5a1cc8e libvdpau: only include when x11 in DISTRO_FEATURES
> dd46a23 libxml++: only include when x11 in DISTRO_FEATURES
> bf3f5bb xorg-data-common: only include when x11 in DISTRO_FEATURES
> 1f5dc31 xserver-common: only include when x11 in DISTRO_FEATURES
> 8c53c6f geany-plugins: only include when x11 in DISTRO_FEATURES
> 14ccfb6 glade: only include when x11 in DISTRO_FEATURES
> 2d193b79 xrdp: remove fuse from depend and move to PACKAGECONFIG
> 257d654 santiy-meta-gnome: add class for bbappend files checking
> 1371d81 gupnp-tools: only include when x11 in DISTRO_FEATURES
> 0addf78 florence: only include when x11 in DISTRO_FEATURES
> 23f42eb evince: only include when x11 in DISTRO_FEATURES
> c2744a5 evolution-data-server: only include when x11 in DISTRO_FEATURES
> bd5c5a6 onboard: only include when x11 in DISTRO_FEATURES
> 486e5be gnome-menus3: only include when x11 in DISTRO_FEATURES
> 2fd859a libgnomekbd: only include when x11 in DISTRO_FEATURES
> 04ecdf0 keybinder: only include when x11 in DISTRO_FEATURES
> 4321ce5 libtimezonemap: only include when x11 in DISTRO_FEATURES
> 7a7b0a0 network-manager-applet: only include when x11 in DISTRO_FEATURES
> 5c40246 abiword: only include when x11 in DISTRO_FEATURES
> fca3814 devilspie: only include when x11 in DISTRO_FEATURES
> f5b8d64 gparted: only include when x11 in DISTRO_FEATURES
> a413457 gedit: only include when x11 in DISTRO_FEATURES
> ec1de09 gnome-keyring: only include when x11 in DISTRO_FEATURES
> 0ca4b1e libgtkstylus: only include when x11 in DISTRO_FEATURES
> 2af1f0e glade3: only include when x11 in DISTRO_FEATURES
> 8a75172 libgnomecanvas: only include when x11 in DISTRO_FEATURES
> 5f381f1 libgnomeui: only include when x11 in DISTRO_FEATURES
> 50509c0 libbonoboui: only include when x11 in DISTRO_FEATURES
> b485f5b libgdata: only include when x11 in DISTRO_FEATURES
> 123a5dc gnome-themes: only include when x11 in DISTRO_FEATURES
> df0319e krb5: 1.15.1 -> 1.16
> 7f7dab4 libol: 0.3.18
> 19bc4af ntp: add libgcc as runtime dependency
> cb9ac5b hexedit: 1.2.13 -> 1.4.2
> 9ac4ea3 mongodb: update to version 3.4.13
> afbd7ad python3-blivet: fix invoking dd timeout caused partition failed
> ccceed3 gnulib: use deltask instead of noexec
> 17b2dbe nodejs: add extra RDEPENDS for building
> 4bd8484 umip: Fix build incompatibilities
> 70c6387 mpv: Adjust for the recent waf bbclass updates
> a23a8e9 eventlog: change SRC_URI because of invalid old address
> d2b6d44 python-jsonschema: remove unneeded depends on python3-misc
> abf0fdd python-behave: update to version 1.2.6
> 243c025 zsh: update to version 5.4.2
> 1baf776 soci: update to version 3.2.3
> fb24a19 ipcalc: add initial recipe for version 0.2.2
> 64c47a3 luajit: exclude for aarch64. not support in this version
> 073087f python-sqlalchemy: update to version 1.1.17
>=20
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:=20
> e60e849 qtpurchasing: upgrade to 5.10.1
> not included in master yet:=20
> c984f40 qtbase: Add packageconfigs for renameat2 and getentropy use
> fe8e38c qtbase: don't enable renameat2 by default
> 6e663f4 qt5-git.inc: drop nobranch=3D1
> caa615b qt5: upgrade to 5.11 Alpha
> caad8dd qt5-creator: upgrade to 4.5.1
> 9e3b496 packagegroup-qt5-toolchain-target: drop both qtwebkit packages
>=20
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:=20
> a413b4f Merge pull request #96 from rakuco/m64-167
> not included in master yet:=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWqfDCAAKCRA3VSO3ZXaA
HK1TAJ0aMIbYlRc6q7Rsd/noe73NeQbsEgCcDbBs32aPU3rqrOeMYa3bwn9g5lA=
=XNeV
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
