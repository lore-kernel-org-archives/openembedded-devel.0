Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.7190.1592867901882638181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 16:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47F0A40BA1;
	Mon, 22 Jun 2020 23:18:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20BIvPl2Opwv; Mon, 22 Jun 2020 23:18:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC158407DA;
	Mon, 22 Jun 2020 23:18:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7CB16173217; Mon, 22 Jun 2020 19:18:17 -0400 (EDT)
Date: Mon, 22 Jun 2020 19:18:17 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Chandana kalluri <ckalluri@xilinx.com>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
Message-ID: <20200622231817.GK17660@denix.org>
References: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
 <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
 <20200622223220.GJ17660@denix.org>
 <b0a58e1f-04e4-44f5-62ff-a4810826e578@linux.microsoft.com>
 <BYAPR02MB5926B4D4B776B27284BD4C3AB0970@BYAPR02MB5926.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB5926B4D4B776B27284BD4C3AB0970@BYAPR02MB5926.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 10:53:09PM +0000, Chandana kalluri wrote:
> I am building the meta-browser layer against poky/master and currently I=
 am=20
> seeing parse errors as pythonnative and setuptools classes are no longer=
=
=20
> supported. Hence the patch.

So, have you had any successful builds of chromium after your patches?


> How are everyone else building python2 chromium against poky/master whic=
h=20
> doesn=E2=80=99t have support for python2 recipes/classes anymore?

You need meta-python2 layer to enable Python2 support.


> Thanks,
> Chandana
>=20
>=20
> From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> Sent: Monday, June 22, 2020 3:42 PM
> To: Denys Dmytriyenko <denis@denix.org>; Alexander Kanavin <alex.kanavin=
@gmail.com>
> Cc: Chandana Kalluri <ckalluri@xilinx.com>; OpenEmbedded Devel List <ope=
nembedded-devel@lists.openembedded.org>; Chandana Kalluri <ckalluri@xilinx.=
com>
> Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.=
bbclass instead of pythonnative.bbclass
>=20
>=20
> Some of it is already ported, but it doesn't look like it will be fixed =
soon, its easier to depend on python-native but that creates a dependency o=
n meta-python as well as it uses EOL code.
>=20
> If you do that you have to manually patch lots of stuff on the v8 engine=
 (and other components) which try calling /usr/bin/python specifically, but=
 it will work.
>=20
> Alejandro
> On 6/22/20 3:32 PM, Denys Dmytriyenko wrote:
>=20
> Yeah, not gonna work - many people are waiting for this to happen, but a=
las:
>=20
>=20
>=20
> https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720
>=20
>=20
>=20
>=20
>=20
> On Tue, Jun 23, 2020 at 12:16:51AM +0200, Alexander Kanavin wrote:
>=20
> Wait, did you actually test this? Chromium is not yet ready for python3,
>=20
> and builds will fail.
>=20
>=20
>=20
> Alex
>=20
>=20
>=20
> On Tue, 23 Jun 2020 at 00:09, Chandana kalluri <ckalluri@xilinx.com><mai=
lto:ckalluri@xilinx.com> wrote:
>=20
>=20
>=20
> From dunfell onwards, python2 recipes and classes are not supported.
>=20
> Inherit
>=20
> python3native.bbclass for chromium instead of pythonnative.bbclass
>=20
>=20
>=20
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com><m=
ailto:chandana.kalluri@xilinx.com>
>=20
> ---
>=20
>  recipes-browser/chromium/chromium.inc | 2 +-
>=20
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
>=20
> diff --git a/recipes-browser/chromium/chromium.inc
>=20
> b/recipes-browser/chromium/chromium.inc
>=20
> index 14d762f..a483ec4 100644
>=20
> --- a/recipes-browser/chromium/chromium.inc
>=20
> +++ b/recipes-browser/chromium/chromium.inc
>=20
> @@ -18,7 +18,7 @@ TOOLCHAIN =3D "clang"
>=20
>  # to build the native recipes (e.g. GN) with clang too.
>=20
>  TOOLCHAIN_class-native =3D "clang"
>=20
>=20
>=20
> -inherit pythonnative setuptools
>=20
> +inherit python3native setuptools
>=20
>=20
>=20
>  # Chromium itself is licensed under the 3-clause BSD license. However, =
it
>=20
>  # depends upon several other projects whose copyright files are listed =
in
>=20
> --
>=20
> 2.7.4
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

>=20

