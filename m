Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8C69E7807D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 18:19:25 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dBQ1F-0003Ih-8F from Joe_MacDonald@mentor.com ;
	Thu, 18 May 2017 11:19:25 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 18 May 2017 11:19:24 -0700
Received: by burninator (Postfix, from userid 1000)	id 3B5275813A2; Thu, 18
	May 2017 14:19:24 -0400 (EDT)
Date: Thu, 18 May 2017 14:19:24 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20170518181923.GC32192@mentor.com>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
	<e9f275c5-533f-2066-e773-eecc1a89cb46@windriver.com>
	<d04b319717d0ce642f47a4c2a75b1dc5@agner.ch>
MIME-Version: 1.0
In-Reply-To: <d04b319717d0ce642f47a4c2a75b1dc5@agner.ch>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 May 2017 18:19:25 -0000
X-Groupsio-MsgNum: 66798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v3] wireguard: add WireGuard kernel modul=
e and tools] On 17.05.18 (Thu 10:55) Stefan Agner wrote:

> On 2017-05-18 00:29, Robert Yang wrote:
> > Hi Stefan,
> >=20
> > On 04/27/2017 01:30 PM, Stefan Agner wrote:
> >> WireGuard is an extremely simple yet fast and modern VPN that utilizes
> >> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
> >> and more useful than IPSec, while avoiding the massive headache.
> >>
> >> The recipes add the current experimental snapshot v0.0.20170421
> >> out-of-tree kernel module and tools. The kernel module has some kernel
> >> configuration dependencies such as some configuration part of
> >> features/netfilter/netfilter.scc, hence netfilter.scc should be part
> >> of KERNEL_EXTRA_FEATURES (which is the case by default).
> >>
> >> Since wireguard-tools is TUNE_PKGARCH and depends on wireguard-module
> >> which is MACHINE_ARCH (like all kernel modules) we need to add this
> >> dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> >>
> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >> ---
> >> Changes since v2:
> >> - Upgrade to v0.0.20170421
> >> - Add comment about Linux kernel requirement
> >>
> >> Changes since v1:
> >> - Upgrade to v0.0.20170409
> >> - Add wireguard-tools -> wireguard-module dependency to
> >>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> >>
> >>  meta-networking/conf/layer.conf                    |  4 ++++
> >>  .../wireguard/wireguard-module_0.0.20170421.bb     | 13 +++++++++++
> >>  .../wireguard/wireguard-tools_0.0.20170421.bb      | 27 +++++++++++++=
+++++++++
> >>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++=
++
> >>  4 files changed, 62 insertions(+)
> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard=
-module_0.0.20170421.bb
> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard=
-tools_0.0.20170421.bb
> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard=
=2Einc
> >>
> >> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/la=
yer.conf
> >> index 85ad93b..b5aa159 100644
> >> --- a/meta-networking/conf/layer.conf
> >> +++ b/meta-networking/conf/layer.conf
> >> @@ -21,3 +21,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >>
> >>  # Override security flags
> >>  require conf/distro/include/meta_networking_security_flags.inc
> >> +
> >> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> >> +  wireguard-tools->wireguard-module \
> >> +"
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module=
_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-modul=
e_0.0.20170421.bb
> >> new file mode 100644
> >> index 0000000..cb21bda
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20=
170421.bb
> >> @@ -0,0 +1,13 @@
> >> +require wireguard.inc
> >> +
> >> +inherit module
> >> +
> >> +# This module requires Linux 3.10 higher and several networking relat=
ed
> >> +# configuration options. For exact kernel requirements visit:
> >> +# https://www.wireguard.io/install/#kernel-requirements
> >> +
> >> +EXTRA_OEMAKE +=3D "KERNELDIR=3D${STAGING_KERNEL_DIR}"
> >> +MAKE_TARGETS =3D "module"
> >> +MODULES_INSTALL_TARGET =3D "module-install"
> >> +
> >> +RRECOMMENDS_${PN} =3D "kernel-module-xt-hashlimit"
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_=
0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_=
0.0.20170421.bb
> >> new file mode 100644
> >> index 0000000..79d420f
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.201=
70421.bb
> >> @@ -0,0 +1,27 @@
> >> +require wireguard.inc
> >> +
> >> +inherit bash-completion systemd pkgconfig
> >> +
> >> +DEPENDS =3D "wireguard-module libmnl"
> >> +
> >> +do_compile_prepend () {
> >> +    cd ${S}/tools
> >> +}
> >> +
> >> +do_install () {
> >> +    cd ${S}/tools
> >> +    oe_runmake DESTDIR=3D"${D}" PREFIX=3D"${prefix}" SYSCONFDIR=3D"${=
sysconfdir}" \
> >> +        SYSTEMDUNITDIR=3D"${systemd_unitdir}" \
> >> +        WITH_SYSTEMDUNITS=3D${@bb.utils.contains('DISTRO_FEATURES', '=
systemd', 'yes', '', d)} \
> >> +        WITH_BASHCOMPLETION=3Dyes \
> >> +        WITH_WGQUICK=3Dyes \
> >> +        install
> >> +}
> >> +
> >> +FILES_${PN} =3D " \
> >> +    ${sysconfdir} \
> >> +    ${systemd_unitdir} \
> >> +    ${bindir} \
> >> +"
> >> +
> >> +RDEPENDS_${PN} =3D "wireguard-module"
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/=
meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> new file mode 100644
> >> index 0000000..46a9971
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> @@ -0,0 +1,18 @@
> >> +SUMMARY =3D "WireGuard is an extremely simple yet fast and modern VPN"
> >> +DESCRIPTION=3D"WireGuard is a secure network tunnel, operating at lay=
er 3, \
> >> +implemented as a kernel virtual network interface for Linux, which ai=
ms to \
> >> +replace both IPsec for most use cases, as well as popular user space =
and/or \
> >> +TLS-based solutions like OpenVPN, while being more secure, more perfo=
rmant, \
> >> +and easier to use."
> >> +SECTION =3D "networking"
> >> +HOMEPAGE =3D "https://www.wireguard.io/"
> >> +LICENSE =3D "GPLv2"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263"
> >> +
> >> +SRC_URI =3D "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}=
=2Etar.xz"
> >=20
> > This SRC_URI is gone, maybe it's just a temp location ?
>=20
> Hm, yeah Jason released a new snapshot, 0.0.20170517. He seems not to
> keep the old snapshots around, I guess he wants to avoid having stale
> versions floating around.
>=20
> Either we keep bumping the version everytime a new snapshot is available
> or we should just switch to git for OE, what do you think?

I think that given he's not just removing old tarballs from an FTP
server somewhere but removing tags from the git history, it'd be best to
go with a git recipe with a fixed SRCREV.

-J.

>=20
> --
> Stefan
>=20
> >=20
> > // Robert
> >=20
> >> +
> >> +SRC_URI[md5sum] =3D "8e559f4fd672b15c38a15eb4d88cc84d"
> >> +SRC_URI[sha256sum] =3D "03c82af774224cd171d000ee4a519b5e474cc6842ac04=
967773cf77b26750000"
> >> +
> >> +S =3D "${WORKDIR}/WireGuard-${PV}/src/"
> >>
--=20
-Joe MacDonald.
:wq

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJZHeWrAAoJEEn8ffcsOfaWhT4IAMqoEXhRCnqd+MWeA8fjCa3w
/MvDTOVDrdKzbEFex7AMP/UWMLbK7oRMNz5IxgPzhOb/66brvJkQA5C5dsvW9+dQ
SiVGBzAJT0M/OsILrkbWi6tjay2nYF7jTyAoro7o1aQZp2BHiLwzRQiXqIHvlxsI
QTNR8Ec5VDqns2k9Yf6HayHk5BzLNqaYfHU7vk/W7pZq0HxclYwAJK+aH4ONvhlD
NPHZTWLDs/C3ByZLDr+0HTkdk7NCmo0Z5Uikj2MuI8Xx87U6ucjQg5hw2wlfNm6n
NPqOMRNo3zPpyQ8Lbuc/B20/LrSA13b20wS3dWf0J3cG2J1OpEkuEdRAOkfbDF0=
=IMUR
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
