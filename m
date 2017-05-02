Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id ED42F71D79
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 12:40:44 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1d5X6j-00015K-DY from Joe_MacDonald@mentor.com ;
	Tue, 02 May 2017 05:40:45 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2; Tue, 2 May 2017
	05:40:44 -0700
Received: by burninator (Postfix, from userid 1000)	id 9B0F15800B2; Tue,  2
	May 2017 08:40:44 -0400 (EDT)
Date: Tue, 2 May 2017 08:40:44 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20170502124044.GC10652@mentor.com>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
	<CA+chaQcfurLMso=4B57=PwkP4=hSDd0FmDHWeZR2fADe8tC3cg@mail.gmail.com>
	<1ecbee2142b8a1dffc16834e0c4a0d24@agner.ch>
	<20170501151800.GA22386@mentor.com>
	<8fe593023ab0ba46b283531a809a0f60@agner.ch>
MIME-Version: 1.0
In-Reply-To: <8fe593023ab0ba46b283531a809a0f60@agner.ch>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v3] wireguard: add WireGuard kernel module and tools
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
X-List-Received-Date: Tue, 02 May 2017 12:40:45 -0000
X-Groupsio-MsgNum: 66619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v3] wireguard: add WireGuard kernel modul=
e and tools] On 17.05.01 (Mon 14:37) Stefan Agner wrote:

> On 2017-05-01 08:18, Joe MacDonald wrote:
> > [Re: [oe] [meta-networking][PATCH v3] wireguard: add WireGuard kernel
> > module and tools] On 17.04.28 (Fri 18:18) Stefan Agner wrote:
> >=20
> >>
> >>
> >> Hm, I can not reproduce here. It looks like module has not been
> >> included, the module make arguments are missing...
> >>
> >> Here it looks like this:
> >>
> >> NOTE: make -j 8
> >> KERNEL_SRC=3Dskins/larry/build/ags/oe-core/build/tmp-glibc/work-shared=
/qemux86-64/kernel-source
> >> KERNELDIR=3D/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/=
kernel-source
> >> KERNEL_PATH=3D/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-6=
4/kernel-source
> >> KERNEL_VERSION=3D4.10.5-yocto-standard CC=3Dx86_64-oe-linux-gcc
> >> -fuse-ld=3Dbfd LD=3Dx86_64-oe-linux-ld.bfd  AR=3Dx86_64-oe-linux-ar
> >> O=3D/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/kernel-b=
uild-artifacts
> >> KBUILD_EXTRA_SYMBOLS=3D module
> >>
> >> Do you have an idea what is going on?
> >=20
> > I don't off hand, but since I merged it, I'll try to investigate it.
> > It's been somewhat complicated by the fact that this configuration
> > builds for me but fails for the world builds as Martin notes.  But the
> > configuration that last passed for the world builds failed to build for
> > my ARM target builds during a do_install step because it was clearly
> > trying to look at my host system.  For now I've just blacklisted the
> > recipe in master.
>=20
> Yeah it really seems that inherit module failed for some reason, which
> avoids a whole bunch of make arguments to be missing. Quite likely that
> in this case the build system starts to look at default paths.
>=20
> But this recipe inherits module the same way as others do. It seems to
> me if this recipe fails, then others such as netmap-modules should fail
> too...

meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D "BROKEN: not compatible with default kernel version 4.8 -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed"

Heh.

But for different reasons.  And I'm going to have a look at that soon
too.  Anyway, I think I have a workable solution for wireguard I'm going
to send out now.

-J.

>=20
> --
> Stefan
>=20
>=20
> >=20
> > -J.
> >=20
> >>
> >> On 2017-04-28 05:24, Martin Jansa wrote:
> >>
> >> > This latest version (which was merged to master yesterday) fails to =
build:
> >> >
> >> > http://errors.yoctoproject.org/Errors/Details/141421/
> >> >
> >> > On Thu, Apr 27, 2017 at 7:30 AM, Stefan Agner <stefan@agner.ch> wrot=
e:
> >> >
> >> >> WireGuard is an extremely simple yet fast and modern VPN that utili=
zes
> >> >> state-of-the-art cryptography. It aims to be faster, simpler, leane=
r,
> >> >> and more useful than IPSec, while avoiding the massive headache.
> >> >>
> >> >> The recipes add the current experimental snapshot v0.0.20170421
> >> >> out-of-tree kernel module and tools. The kernel module has some ker=
nel
> >> >> configuration dependencies such as some configuration part of
> >> >> features/netfilter/netfilter.scc, hence netfilter.scc should be part
> >> >> of KERNEL_EXTRA_FEATURES (which is the case by default).
> >> >>
> >> >> Since wireguard-tools is TUNE_PKGARCH and depends on wireguard-modu=
le
> >> >> which is MACHINE_ARCH (like all kernel modules) we need to add this
> >> >> dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> >> >>
> >> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >> >> ---
> >> >> Changes since v2:
> >> >> - Upgrade to v0.0.20170421
> >> >> - Add comment about Linux kernel requirement
> >> >>
> >> >> Changes since v1:
> >> >> - Upgrade to v0.0.20170409
> >> >> - Add wireguard-tools -> wireguard-module dependency to
> >> >> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> >> >>
> >> >> meta-networking/conf/layer.conf                    |  4 ++++
> >> >> .../wireguard/wireguard-module_0.0.20170421.bb [1]     | 13 +++++++=
++++
> >> >> .../wireguard/wireguard-tools_0.0.20170421.bb [2]      | 27 +++++++=
+++++++++++++++
> >> >> .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++=
++++
> >> >> 4 files changed, 62 insertions(+)
> >> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wiregua=
rd-module_0.0.20170421.bb [1]
> >> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wiregua=
rd-tools_0.0.20170421.bb [2]
> >> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wiregua=
rd.inc
> >> >>
> >> >> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf=
/layer.conf
> >> >> index 85ad93b..b5aa159 100644
> >> >> --- a/meta-networking/conf/layer.conf
> >> >> +++ b/meta-networking/conf/layer.conf
> >> >> @@ -21,3 +21,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >> >>
> >> >> # Override security flags
> >> >> require conf/distro/include/meta_networking_security_flags.inc
> >> >> +
> >> >> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> >> >> +  wireguard-tools->wireguard-module \
> >> >> +"
> >> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-mod=
ule_0.0.20170421.bb [1] b/meta-networking/recipes-kernel/wireguard/wireguar=
d-module_0.0.20170421.bb [1]
> >> >> new file mode 100644
> >> >> index 0000000..cb21bda
> >> >> --- /dev/null
> >> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0=
=2E20170421.bb [1]
> >> >> @@ -0,0 +1,13 @@
> >> >> +require wireguard.inc
> >> >> +
> >> >> +inherit module
> >> >> +
> >> >> +# This module requires Linux 3.10 higher and several networking re=
lated
> >> >> +# configuration options. For exact kernel requirements visit:
> >> >> +# https://www.wireguard.io/install/#kernel-requirements [3]
> >> >> +
> >> >> +EXTRA_OEMAKE +=3D "KERNELDIR=3D${STAGING_KERNEL_DIR}"
> >> >> +MAKE_TARGETS =3D "module"
> >> >> +MODULES_INSTALL_TARGET =3D "module-install"
> >> >> +
> >> >> +RRECOMMENDS_${PN} =3D "kernel-module-xt-hashlimit"
> >> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-too=
ls_0.0.20170421.bb [2] b/meta-networking/recipes-kernel/wireguard/wireguard=
-tools_0.0.20170421.bb [2]
> >> >> new file mode 100644
> >> >> index 0000000..79d420f
> >> >> --- /dev/null
> >> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.=
20170421.bb [2]
> >> >>
> >> >> @@ -0,0 +1,27 @@
> >> >> +require wireguard.inc
> >> >> +
> >> >> +inherit bash-completion systemd pkgconfig
> >> >> +
> >> >> +DEPENDS =3D "wireguard-module libmnl"
> >> >> +
> >> >> +do_compile_prepend () {
> >> >> +    cd ${S}/tools
> >> >> +}
> >> >> +
> >> >> +do_install () {
> >> >> +    cd ${S}/tools
> >> >> +    oe_runmake DESTDIR=3D"${D}" PREFIX=3D"${prefix}" SYSCONFDIR=3D=
"${sysconfdir}" \
> >> >> +        SYSTEMDUNITDIR=3D"${systemd_unitdir}" \
> >> >> +        WITH_SYSTEMDUNITS=3D${@bb.utils.contains('DISTRO_FEATURES'=
, 'systemd', 'yes', '', d)} \
> >> >> +        WITH_BASHCOMPLETION=3Dyes \
> >> >> +        WITH_WGQUICK=3Dyes \
> >> >> +        install
> >> >> +}
> >> >> +
> >> >> +FILES_${PN} =3D " \
> >> >> +    ${sysconfdir} \
> >> >> +    ${systemd_unitdir} \
> >> >> +    ${bindir} \
> >> >> +"
> >> >> +
> >> >> +RDEPENDS_${PN} =3D "wireguard-module"
> >> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc=
 b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> >> new file mode 100644 index 0000000..46a9971
> >> >> --- /dev/null
> >> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> >> @@ -0,0 +1,18 @@
> >> >> +SUMMARY =3D "WireGuard is an extremely simple yet fast and modern =
VPN"
> >> >> +DESCRIPTION=3D"WireGuard is a secure network tunnel, operating at =
layer 3, \
> >> >> +implemented as a kernel virtual network interface for Linux, which=
 aims to \
> >> >> +replace both IPsec for most use cases, as well as popular user spa=
ce and/or \
> >> >> +TLS-based solutions like OpenVPN, while being more secure, more pe=
rformant, \
> >> >> +and easier to use."
> >> >> +SECTION =3D "networking"
> >> >> +HOMEPAGE =3D "https://www.wireguard.io/"
> >> >> +LICENSE =3D "GPLv2"
> >> >> +
> >> >> +LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263"
> >> >> +
> >> >> +SRC_URI =3D "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${=
PV}.tar.xz [4]"
> >> >> +
> >> >> +SRC_URI[md5sum] =3D "8e559f4fd672b15c38a15eb4d88cc84d"
> >> >> +SRC_URI[sha256sum] =3D "03c82af774224cd171d000ee4a519b5e474cc6842a=
c04967773cf77b26750000"
> >> >>
> >> >> +
> >> >> +S =3D "${WORKDIR}/WireGuard-${PV}/src/"
> >> >> --
> >> >> 2.7.4
> >>
> >>
> >>
> >> Links:
> >> ------
> >> [1] http://wireguard-module_0.0.20170421.bb
> >> [2] http://wireguard-tools_0.0.20170421.bb
> >> [3] https://www.wireguard.io/install/#kernel-requirements
> >> [4] https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz

--=20
-Joe MacDonald.
:wq

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJZCH5MAAoJEEn8ffcsOfaWPnMH/2FjBV6KkaAiOd2ncIpaJGbK
gi8nWtO101vdct1cjXHUT4GLjtetxZx4cfskV9gOMxE0G6QwEZSHrVWdtJMAzs2e
O1snZoYJZGUKuhUdt6RCLI+k/LCVjMbrgl0TM7yfIN7LpJ+A/+QtRk4BtEEvmZc6
tyLCmOJFgnyFHoAoysXbO+RUtEoE2rBkF4Pn0/Z3EhPutsPQ3/egFL4xe+pDxKEF
I5Ol4l922IbKioXSjq8qjtP++Oc/fouSiL9AcyachU7vZB/W0X0WWL1gMPbr61QE
bIIMVOiTTaJm7hc2iaSqdplDo8gEwzUWGtNhLMH9Vs4TfVoMLqFF7eg85CREps4=
=ySqC
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
