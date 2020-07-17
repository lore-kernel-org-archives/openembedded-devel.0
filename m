Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.1019.1595015642517211030
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 12:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=qoMz3QhL;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5hv6=a4=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B7hdf0s1szlk;
	Fri, 17 Jul 2020 21:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595015638;
	bh=4q7+NrOwTp8B+eRAOYXk7iZhRIpj7ckIvtUMbloQAPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoMz3QhL/2E6FB693dJBn1V0VcrUqSQfmrrZVvdSl5vr0sexfgcT73wH8Zr9M6cIS
	 iKv+RTpA6gxQFhEqozkBKCB75wENyfNeRoj5zcZ1TgRDyB6u0F6iDW8wexMLNHFqm/
	 hU3PDl9GQYngVKyPjUTZeX60snImI3d66ARxnmC+dLiuN/ki/vbY39QWtRuuOJWYVN
	 0wV8g1Q5+ImA6kryidDtOYtdeBu7xUQXGmrnQoLpsXeb5g0UQZQ/ZoD4fNEsjamyuq
	 i2zEtu8nKn12nXLXb9Xl+A2Py4EcR5Ez2zu3dOOXNaL5KdtS8KpCSE7ZUakX6EJ/cT
	 EpXODYzyNFX0O0KRkKILbLYdC2v9BuWa9B17DBYMGjxvQFZGK5ynNmD4e5wdMITQqc
	 SETYoE6u5SuY2zD/TeiaH7mdgAprUv2lzA6wKigUjn+wGkLoZxbPZxUGnu9b3OD037
	 8in9+8qsOTpbgkbLLd3+kqd2odv3wSsAZ/qpcJXYtK1gH4y3X4ZP4rdYhhER91roly
	 ghT+OGSuYivgDTNaJvMsWYddIs3ijdj/b6Up9BYvCrl8pbqJ481TWoreWWhe6v/A1C
	 uDO9hWeQ/meU6MiL1fma1vsPbFA3DK7WGgPmlVqEcd4y0jlrxbJOoWJZe92TwzICg5
	 ZMc6x9wVJDsriZfZzszjOV94=
Date: Fri, 17 Jul 2020 22:53:56 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Message-ID: <20200717195356.GG1229@localhost>
References: <cover.1594999160.git.akuster808@gmail.com>
 <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
 <20200717172458.GF1229@localhost>
 <29d972cb-bd13-bae4-9668-57a65c48b938@gmail.com>
MIME-Version: 1.0
In-Reply-To: <29d972cb-bd13-bae4-9668-57a65c48b938@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 12:16:10PM -0700, akuster808 wrote:
>=20
>=20
> On 7/17/20 10:24 AM, Adrian Bunk wrote:
> > On Fri, Jul 17, 2020 at 08:20:54AM -0700, akuster wrote:
> >> ...
> >> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> >> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> >> ...
> > This would make the version going backwards, please add
> >   PV =3D "1.9.3+really1.9.2"
>=20
> right.=C2=A0 Wouldn't EP =3D "1"=C2=A0 do the same?

PE (not EP) would also solve this.

The problem with an epoch is that it is permanent while
a +really version will go away with 1.9.4.

cu
Adrian
