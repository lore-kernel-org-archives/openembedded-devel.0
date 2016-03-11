Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C879873232
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:00:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 09:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,321,1455004800"; 
	d="asc'?scan'208";a="667770750"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2016 09:00:42 -0800
Reply-To: openembedded-devel@lists.openembedded.org
References: <1d5cc52037d090b4f12b24f85bc361f6@agner.ch>
	<56E2F8B7.3010606@linux.intel.com>
To: Stefan Agner <stefan@agner.ch>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56E2F9C3.2090403@linux.intel.com>
Date: Fri, 11 Mar 2016 11:00:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56E2F8B7.3010606@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, Marcel Ziswiler <marcel@ziswiler.com>
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
X-List-Received-Date: Fri, 11 Mar 2016 17:01:00 -0000
X-Groupsio-MsgNum: 60495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="o85owHeOaUNlamRg1vGJwtrIgpn52ocOn"

--o85owHeOaUNlamRg1vGJwtrIgpn52ocOn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

I tried to build angstrom v2015.12-yocto2.0 using qemux86-64 and
systemd-image following [1] then the next errors appears:

ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
virtual:nativesdk:/home/alimon/repos/angstrom/sources/openembedded-core/m=
eta/recipes-graphics/libsdl/libsdl_1.2.15.bb
DEPENDS on or otherwise requires it). Close matches:
  virtual/nativesdk-libx11
  virtual/nativesdk-libc
  virtual/nativesdk-db

ERROR: Required build target 'systemd-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['systemd-image',
'nativesdk-packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-libsdl',
'virtual/nativesdk-nativesdk-libx11']


Kind regards,
	alimon

[1] https://github.com/Angstrom-distribution/angstrom-manifest

On 03/11/2016 10:56 AM, An=EDbal Lim=F3n wrote:
> Hi Stefan,
>=20
> Seems that LICENSE_DIRECTORY set is causing this trouble i don't
> understand why? because i expanded LICENSE_DIRECTORY for copy licenses
> but if you revert the commit and works the new code needs to be
> compatible. Could you give me the instructions for reproduce your case?=

>=20
> For the license warnings is related to the same LICENSE_DIRECTORY thing=

> because it wasn't able to collect (copy) the licenses.
>=20
> 	alimon
>=20
> - Resending... due to a list unsubscription.
>=20
> On 03/10/2016 09:12 PM, Stefan Agner wrote:
>> Hi Anibal,
>>
>> I think the patch a7976cbae3 ("license_class: Reimplemented manifest
>> creation in python") broke =C5ngstroms way of deploying license files.=

>> With jethro I get the following error when building the _second_
>> machine:
>>
>> ERROR: Error executing a python function in
>> /build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/con=
sole-trdx-image.bb:
>>
>> The stack trace of python calls that resulted in this exception/failur=
e
>> was:
>> File: 'license_create_manifest', lineno: 110, function: <module>
>>      0106:
>>      0107:                        os.link(pkg_license,
>> pkg_rootfs_license)
>>      0108:
>>      0109:
>>  *** 0110:license_create_manifest(d)
>>      0111:
>> File: 'license_create_manifest', lineno: 86, function:
>> license_create_manifest
>>      0082:                pkg_rootfs_license_dir =3D
>> os.path.join(rootfs_license_dir, pkg)
>>      0083:                os.makedirs(pkg_rootfs_license_dir)
>>      0084:                pkg_license_dir =3D
>> os.path.join(d.getVar('LICENSE_DIRECTORY', True),
>>      0085:                                          =20
>> pkg_dic[pkg]["PN"])
>>  *** 0086:                licenses =3D os.listdir(pkg_license_dir)
>>      0087:                for lic in licenses:
>>      0088:                    rootfs_license =3D
>> os.path.join(rootfs_license_dir, lic)
>>      0089:                    pkg_license =3D
>> os.path.join(pkg_license_dir, lic)
>>      0090:                    pkg_rootfs_license =3D
>> os.path.join(pkg_rootfs_license_dir, lic)
>> Exception: OSError: [Errno 2] No such file or directory:
>> '/build/ags/oe-core_V2.6/build/out-glibc/deploy/licenses/colibri_imx7/=
alsa-utils'
>>
>> ERROR: Function failed: license_create_manifest
>> ERROR: Logfile of failure stored in:
>> /build/ags/oe-core_V2.6/build/out-glibc/work/colibri_imx7-angstrom-lin=
ux-gnueabi/console-trdx-image/V2.6-r0/temp/log.do_rootfs.29351
>> ERROR: Task 7
>> (/build/ags/oe-core_V2.6/build/../stuff/meta-toradex/recipes/images/co=
nsole-trdx-image.bb,
>> do_rootfs) failed with exit code '1'
>>
>> It might relate to how =C5ngstr=F6m configures the LICENSE_DIRECTORY
>> variable (by including MACHINE_ARCH, see
>> https://github.com/Angstrom-distribution/meta-angstrom/blob/angstrom-v=
2015.12-yocto2.0/conf/distro/include/angstrom-core-tweaks.inc):
>> LICENSE_DIRECTORY =3D "${DEPLOY_DIR}/licenses/${MACHINE_ARCH}"
>>
>> I am not sure what exactly causes the issue, but after reverting your
>> patch two consecutive builds of different machines succeeded...
>>
>> However, I still get a lot of warnings such as:
>> WARNING: The license listed LGPLv2.1 was not in the licenses collected=

>> for systemd
>>
>> Any ideas?
>>
>> --
>> Stefan
>>
>=20
>=20
>=20


--o85owHeOaUNlamRg1vGJwtrIgpn52ocOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJW4vnHAAoJEGJqcE9h3glgPG4P/j2cucCpBUVmziTa7PNDfL07
3f3Z8CqlArTYvMWHcOGP9W5ZGNkXuD9Mgcu0AUm3vLPzXVv/Fd/D+a4MTMB7ox1P
0FGDpPsPlABtg1o0cGczz79lFjzgyo7Lep33lh/E/R6ILaArkpmkTmyzprp6NDqA
uG8+i6zM+hJ3ILGoIJEV/+97ozsR2akb4RuA/8OODuNXCIRjhjLFftTkQCF4tR3E
UZ4svuELK49KXBDPKvr+u8pE6pCOKFNvNZa53B9KVUNjawEDpmTQ/cfPigpLRI0K
4F0eG1f2m2eavt6usbvUUKwC1w2NlrAq/BVhMZo0G14prAo/LH3AUqiYbX45eflX
2Asi+h9VRaLE4akwYL9c2CJCZoUMp4+TJJN99wtWFb0rD6bjsm6zdpO9jsTuFAYk
ygqBy1CY1Rk5bHhcUZm/SguzA1LBueG3DUk+TPmkLUwRjLw6GwUe6wML/uiB9r0D
nvmlLvDyoxs1dirHglxu/G83Di7g9WMXYAicCE7/rftPrDssDrYTeOzdrZE6TgYn
KKdxJcOpsyqnqwDswDNjFdIJE25LecmsLwDVZb/ouLDIV9FLPG6yRkG2R6xNc40h
6id9Q8Bgip3zqX3JDpxjgm/FmFV5Tq67Mc+bpRFeKtDq5jyxvsHVC2K8mQzQzx7v
NDT/lIXjOliUbM81E2aa
=43+M
-----END PGP SIGNATURE-----

--o85owHeOaUNlamRg1vGJwtrIgpn52ocOn--
