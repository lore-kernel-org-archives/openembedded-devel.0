Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43A9E731F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:56:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2016 08:56:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,321,1455004800"; 
	d="asc'?scan'208";a="762441837"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 11 Mar 2016 08:56:12 -0800
To: Stefan Agner <stefan@agner.ch>
References: <1d5cc52037d090b4f12b24f85bc361f6@agner.ch>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56E2F8B7.3010606@linux.intel.com>
Date: Fri, 11 Mar 2016 10:56:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1d5cc52037d090b4f12b24f85bc361f6@agner.ch>
Cc: openembedded-devel@lists.openembedded.org,
	Marcel Ziswiler <marcel@ziswiler.com>, angstrom-distro-devel@linuxtogo.org
Subject: Re: license_create_manifest fails on jethro
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
X-List-Received-Date: Fri, 11 Mar 2016 16:56:14 -0000
X-Groupsio-MsgNum: 60494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gqjNaLpB9OLBS6hKVeRm3uI167TtqOC1n"

--gqjNaLpB9OLBS6hKVeRm3uI167TtqOC1n
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Seems that LICENSE_DIRECTORY set is causing this trouble i don't
understand why? because i expanded LICENSE_DIRECTORY for copy licenses
but if you revert the commit and works the new code needs to be
compatible. Could you give me the instructions for reproduce your case?

For the license warnings is related to the same LICENSE_DIRECTORY thing
because it wasn't able to collect (copy) the licenses.

	alimon

- Resending... due to a list unsubscription.

On 03/10/2016 09:12 PM, Stefan Agner wrote:
> Hi Anibal,
>=20
> I think the patch a7976cbae3 ("license_class: Reimplemented manifest
> creation in python") broke =C3=85ngstroms way of deploying license file=
s.
> With jethro I get the following error when building the _second_
> machine:
>=20
> ERROR: Error executing a python function in
> /build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/cons=
ole-trdx-image.bb:
>=20
> The stack trace of python calls that resulted in this exception/failure=

> was:
> File: 'license_create_manifest', lineno: 110, function: <module>
>      0106:
>      0107:                        os.link(pkg_license,
> pkg_rootfs_license)
>      0108:
>      0109:
>  *** 0110:license_create_manifest(d)
>      0111:
> File: 'license_create_manifest', lineno: 86, function:
> license_create_manifest
>      0082:                pkg_rootfs_license_dir =3D
> os.path.join(rootfs_license_dir, pkg)
>      0083:                os.makedirs(pkg_rootfs_license_dir)
>      0084:                pkg_license_dir =3D
> os.path.join(d.getVar('LICENSE_DIRECTORY', True),
>      0085:                                          =20
> pkg_dic[pkg]["PN"])
>  *** 0086:                licenses =3D os.listdir(pkg_license_dir)
>      0087:                for lic in licenses:
>      0088:                    rootfs_license =3D
> os.path.join(rootfs_license_dir, lic)
>      0089:                    pkg_license =3D
> os.path.join(pkg_license_dir, lic)
>      0090:                    pkg_rootfs_license =3D
> os.path.join(pkg_rootfs_license_dir, lic)
> Exception: OSError: [Errno 2] No such file or directory:
> '/build/ags/oe-core_V2.6/build/out-glibc/deploy/licenses/colibri_imx7/a=
lsa-utils'
>=20
> ERROR: Function failed: license_create_manifest
> ERROR: Logfile of failure stored in:
> /build/ags/oe-core_V2.6/build/out-glibc/work/colibri_imx7-angstrom-linu=
x-gnueabi/console-trdx-image/V2.6-r0/temp/log.do_rootfs.29351
> ERROR: Task 7
> (/build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/con=
sole-trdx-image.bb,
> do_rootfs) failed with exit code '1'
>=20
> It might relate to how =C3=85ngstr=C3=B6m configures the LICENSE_DIRECT=
ORY
> variable (by including MACHINE_ARCH, see
> https://github.com/Angstrom-distribution/meta-angstrom/blob/angstrom-v2=
015.12-yocto2.0/conf/distro/include/angstrom-core-tweaks.inc):
> LICENSE_DIRECTORY =3D "${DEPLOY_DIR}/licenses/${MACHINE_ARCH}"
>=20
> I am not sure what exactly causes the issue, but after reverting your
> patch two consecutive builds of different machines succeeded...
>=20
> However, I still get a lot of warnings such as:
> WARNING: The license listed LGPLv2.1 was not in the licenses collected
> for systemd
>=20
> Any ideas?
>=20
> --
> Stefan
>=20


--gqjNaLpB9OLBS6hKVeRm3uI167TtqOC1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJW4vi6AAoJEGJqcE9h3glge3IQAIclmnsbdu0Y4Bexbt+pNhJn
FjwewrlRA1bqQBZmO1ZBITEUvo4fkyQgyOO6oGmz5OFxaYS88bQp89hGPFQ9njZR
MzZyPynJUcpIZD0qQmMll9dhG964pGSzylygpxQqTJxkyZZG5fyj3oGuloEgXRGT
buNeQDldBAqMrdbbKvmYZgaoU28M4yEEuEKPoEb6pBGD/45ufK3pHc0f62UZSOrI
YsNATH1o91zu+1f5fMzs0p1d6Z0NNVgvrVr2qm1j1n4tWlSHB+S2GjWNAJvq7rGN
mREve2QBqJ9X/19QHkBVeT06scTqYVryTTZMRs5YElKf4bkcWb62lgHLMCHrfGXD
9bQJuGTRXtkR4l1CKjawDLIGl8nKaRoHGf1YOKJYR7e3araQkg9SVnhDNePCF6Qt
AXQRCP9VD2sVTK89M3UD8iNfcVPTcKnuUGL7SK63dFCEGiaLimWvmeVhRFOH9pfI
StM4YmErEfzsOV/61OVOm3x/CLIC8VfT5hu9f4l7GYQCHhZvREFEFJszqmYY7G70
KKnmXd4QTB21B+n06nmpkipf4Iz7N3ltkudv6v5qT33oCXbBBNJCprqR3oSWyCKq
Jwb+ps3iG23Yk+ZPuhVraUtisP86CmjGkFyQMh6Cx8E/Ho4Opuf8Xyme/4jHlLb3
6IhuzcPdWG90N2ztYd5U
=HQJ0
-----END PGP SIGNATURE-----

--gqjNaLpB9OLBS6hKVeRm3uI167TtqOC1n--
