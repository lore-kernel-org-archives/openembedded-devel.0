Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B891C3ABD8
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:11:53 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.47833.1747649506153087057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 03:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-CSE-ConnectionGUID: mCHwwxOWSDO7A9Ll9IvUPw==
X-CSE-MsgGUID: CJPPj9MhRFOKbgYGNvwuWg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2025 19:11:44 +0900
Received: from [10.226.93.44] (unknown [10.226.93.44])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9FA68400E8F4;
	Mon, 19 May 2025 19:11:43 +0900 (JST)
Message-ID: <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
Date: Mon, 19 May 2025 11:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [issue][meta-oe][walnascar] yocto-layer-check not passing for BSP
 layer when meta-oe is a dependency
To: Chris Paterson <Chris.Paterson2@renesas.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XOUvVbXM5fGL41SLT6GNCISY"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 10:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117476

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XOUvVbXM5fGL41SLT6GNCISY
Content-Type: multipart/mixed; boundary="------------0GaQDkApjNbkLg279xQizMLw";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Message-ID: <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
Subject: Re: [issue][meta-oe][walnascar] yocto-layer-check not passing for BSP
 layer when meta-oe is a dependency
References: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>

--------------0GaQDkApjNbkLg279xQizMLw
Content-Type: multipart/mixed; boundary="------------n4wspx4INLCbyAeGK8C3puts"

--------------n4wspx4INLCbyAeGK8C3puts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17/05/2025 23:31, Chris Paterson wrote:
> Hello,
>=20
> This is my first time submitting an issue to meta-openembedded, apologi=
es if it's not the preferred format.
>=20
> # Issue summary
> I'm trying to get yocto-layer-check to pass for a BSP meta-layer that d=
epends on meta-openembedded/meta-oe.
> However. it fails for the test_machine_signatures check for the Walnasc=
ar branch.
>=20
> Note that the test passes with Scarthgap.
>=20
> Three different packages seem to trigger the issue (worked out because =
if each is deleted the test passes):
> * meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-ch=
ecker_0.6.10.bb
> * meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_0.46.bb
> * meta-oe/recipes-support/smarty/smarty_5.4.3.bb
>=20
>=20
> # Steps to reproduce
> I've reproduced the issue using machines from the meta-layer I'm workin=
g with [0] as well as qemuarm & qemuarm64.
>=20
> Check out dependency layers (poky, meta-openembedded, meta-arm)
> source poky/oe-init-build-env
> yocto-check-layer-wrapper ../meta-rz-bsp --dependency ../meta-openembed=
ded/meta-oe ../poky/meta ../poky/meta-poky ../meta-arm/meta-arm ../meta-a=
rm/meta-arm-toolchain/ --no-auto-dependency  --machines qemuarm qemuarm64=

>=20
> [0] https://github.com/renesas-rz/rz-community-bsp (Walnascar branch no=
t pushed yet)
>=20
>=20
> # Example log
> INFO: FAIL: test_machine_signatures (bsp.BSPCheckLayer.test_machine_sig=
natures)                                                                 =
                                          =20
> INFO: -----------------------------------------------------------------=
-----       =20
> INFO: Traceback (most recent call last):                               =
                                                                         =
                                          =20
>   File "/home/patersonc/work/rz-community-bsp/poky/scripts/lib/checklay=
er/cases/bsp.py", line 206, in test_machine_signatures
>     self.fail('\n'.join(msg))                                          =
                                                                         =
                                          =20
> AssertionError: The machines have conflicting signatures for some share=
d tasks:      =20
>    allarch smarty:do_package_qa: 416787047ca76d43b094860cf617234f957d11=
895e7b7be20cbe9203289f27e1 (hihope-rzg2h) !=3D 1e482ffc1ead26bcd1f89d4dcf=
92e497dd6223933941b3ec6e483cb0072c9f5d (hihope-rzg2n)
>    allarch spectre-meltdown-checker:do_package_qa: c6a667fa0b94c98ab0a2=
2882ccb135063cf91e56d95200dc09d8d3e736d39478 (hihope-rzg2h) !=3D 80aac380=
e472e717bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc (hihope-rzg2n)
>                                                                        =
                     =20
> 4 tasks where not listed because some other task of the recipe already =
differed.                                                                =
                                          =20
> It is likely that differences from different recipes also have the same=
 root cause.                                                             =
                                          =20
>                                                                        =
                     =20
> To investigate, run bitbake-diffsigs -t recipename taskname -s fromsig =
tosig.                                                                   =
                                          =20
> Example: (hihope-rzg2h) !=3D (hihope-rzg2n) in the last line        =20
> Command: bitbake-diffsigs -t spectre-meltdown-checker do_package_qa -s =
c6a667fa0b94c98ab0a22882ccb135063cf91e56d95200dc09d8d3e736d39478 80aac380=
e472e717bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc
>    NOTE: Reconnecting to bitbake server...
>    Hash for task dependency binutils:do_packagedata changed from a8e8aa=
500d5d99c24ee6889e11d2f2d86d1eb0faa42b777bfbc40c278acc14d3 to a3f446066cf=
ca1799ebc96d8f9c29b9c3c574bbd8d0a864c35ab626fe9bcdf30
>        Hash for task dependency binutils:do_package changed from 62a0df=
60c316310c111ae0290df55cbd1b003f73a8e9b4bfd6b2c14fbbb0be2a to 17c92c3ab2f=
3a1e17a5393af48c24896d8c16c61f254e51e82c2a5097135d292
>            Hash for task dependency binutils:do_install changed from 2c=
16d297331a279bd665cb713c7c5267493917c19d6166e74c397b1b7502e40d to 83caf59=
fabb26c3acf6e9a1ca5fa6f487e6258765bd8886b74f9026a989a11cd
>                Hash for task dependency binutils:do_compile changed fro=
m 3c72377ec56a75e514f6312b729f3c865f0a3751f10363edeb32a95f17a2697d to b3b=
6db1b73f5b52a28a3ac141e6b819bd07bdc5e658b18c76276db73f911e799
>                    Hash for task dependency binutils:do_configure chang=
ed from cd53c81e1d46362c59ece6e482bfa50a91215f9240dfe1bfc9fad503b5b8dece =
to dbabddb01bcc620e96365a3fe631d5adb4e10b9e47e6460d29f971559cb53b63
>                        Hash for task dependency binutils:do_deploy_sour=
ce_date_epoch changed from a2bd1a2043978532caf40c589a8d703fb4d69dfe4fae52=
51ab0c13ac38f3f3a6 to 21148ea2ab02788c94aa3a19f95fffb26fbd5a8d1a40f015a31=
11122d77ef3eb
>                            basehash changed from 683c7492fd7b4578defacc=
0ecd06661cdf345e467c9fa1879ed78cd13ad49a3c to da67890339ef0715eeeed4ebeca=
2a5fd0c7a597b6356e9f8a0ca2532561940ee     =20
>                            Variable TUNE_CCARGS value changed:       =20
>                            " [--mcpu=3Dcortex-a57.cortex-a53+crc-] {+-m=
cpu=3Dcortex-a57+crc+} -mbranch-protection=3Dstandard"
>=20
>=20
> # Theories
> Why do I think the issue is meta-oe and not meta-rz-bsp?
> * Not a lot has changed in the bsp layer for the Walnascar upgrade and =
it was all fine for Kirkstone/Scarthgap.
> * Creating a dummy bsp meta-layer (only containing a layers.conf and a =
machine definition) still produces the same error.
>=20
> I'm guessing that the BSP test cases from yocto-check-layer are not nor=
mally run over meta-oe as it's not a BSP layer. And presumably few other =
BSP layers have tried running the tests yet?
> Both kernel-hardening-checker and spectre-meltdown-checker are new to W=
alnascar so maybe that why the issue hasn't been seen before.

I think the question to ask is, why does the task hash for
spectre-meltdown-checker:do_package_qa depend on the task hash of
binutils:do_packagedata? spectre-meltdown-checker just installs a shell
script so it inherits allarch. It RRECOMMENDS binutils which is
obviously arch-specific.

We also saw that the task hash for
kernel-hardening-checker:do_package_write_rpm depends on the task hash
for linux-cip:do_packagedata. In this case, kernel-hardening-checker
doesn't inherit allarch so it is assumed to be arch-specific. It
RRECOMMENDS kernel-dev which is machine-specific.

Is an allarch package allowed to have arch-specific or machine-specific
packages in RDEPENDS/RRECOMMENDS? And is an arch-specific package
allowed to have machine-specific packages in RDEPENDS/RRECOMMENDS?

Thanks,

--=20
Paul Barker
--------------n4wspx4INLCbyAeGK8C3puts
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------n4wspx4INLCbyAeGK8C3puts--

--------------0GaQDkApjNbkLg279xQizMLw--

--------------XOUvVbXM5fGL41SLT6GNCISY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCaCsD3gUDAAAAAAAKCRDbaV4Vf/JGvW3H
AP9nWBDiYL4PkV0Hck6DI47eeRT6/h062ykqORk66IajLwEA3/kPw7jv1BVMUvsUcp1fs0FX4N9J
ux2eMp5/dsS2vg8=
=XT9y
-----END PGP SIGNATURE-----

--------------XOUvVbXM5fGL41SLT6GNCISY--

