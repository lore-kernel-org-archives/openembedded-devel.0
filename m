Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EC9C46CD2
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 13:30:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.21197.1703079009411925169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 05:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U25mJ/z8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFB311BF203;
	Wed, 20 Dec 2023 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703079007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wIDMJfRK+PmAOCSou+5DYoEeOXziXadxVWJqTfHTwqE=;
	b=U25mJ/z8+Qf/uabumKaLYBl+RxDtLiuzQlxgCFCYjOqiNN6mnWRdnCEoPe+4MN/7Ub6SfK
	B25XOpbOKK6Snfa9apx7l4WfVIdsmOJtZFPHDCIlh8xt1ht9TEW5GaviI/LfXUrwl5zshh
	2nFpC9L/uPndNYNRVkMgSRUYiMAz78eqSnhgWil8+bNIAUZSUtupxS7XgBRhdNuvpVsc2X
	Ken/2w7FD4xdl6JdycopQTS6Qsx0jRxbEnNsKNsC5aNLVu6Ix+iXI4bJIuTQaSRx76cFg3
	TvKv469NFe8diHtfnNhDk4wIpyjjpo0dkIkNDND8UIsYqXplQFaw5s+nGuiGkg==
Message-ID: <f7422ad2944db12d2391cf93098cc22239ba547e.camel@bootlin.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: fix some missing
 pkgconfig
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2023 14:30:06 +0100
In-Reply-To: <7CC98C36-78F5-4EE9-95C0-8D2C9105AC6A@arm.com>
References: <20231220102355.1303991-1-thomas.perrot@bootlin.com>
	 <7CC98C36-78F5-4EE9-95C0-8D2C9105AC6A@arm.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mt1scPwHjR7HxH9t4sL8"
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107656


--=-mt1scPwHjR7HxH9t4sL8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 2023-12-20 at 12:35 +0000, Ross Burton wrote:
> Can you say =E2=80=9CPACKAGECONFIG=E2=80=9D, as pkgconfig is something el=
se entirely.
>=20
> > +PACKAGECONFIG[nmtui] =3D "-Dnmtui=3Dtrue,-
> > Dnmtui=3Dfalse,libnewt,libnewt=E2=80=9D
>=20
> Doesn=E2=80=99t the shared library dependency happy automatically?=C2=A0 =
This puts
> the RDEPENDS on networkmanager, which isn=E2=80=99t the package containin=
g
> nmtui.
>=20

I agree, I'm submitting a v2 that adds the required dependency on
${PN}-nmtui instead.

Kind regards,
Thomas Perrot

> Ross
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107655):
> https://lists.openembedded.org/g/openembedded-devel/message/107655
> Mute This Topic: https://lists.openembedded.org/mt/103278844/5443093
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-mt1scPwHjR7HxH9t4sL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmWC7F4ACgkQn8ALBXH+
Cu1eXgv/S+l807DSnL880Sf1y40cqVIwpuylab+7KDsHqMv9bh91JZVKmmljjQmI
nRk7Ap0Ysbg/IfalC9pigghCIsCdOJpmxRiYBhMX+bWER1ziy/VaajJQ+X1KDW+o
GPm6NwcF+wcPF5THSUDet2LmxCRnBbSoKFeS/gcQcT7Txupt/NOeiD7M1+dl6m67
htNRuOprv3CvH/QLeBBOtw8Dqmd4FMwCoqEJIhLJhbUTPxGHH4damsfkQhfJwEFh
W+rBQPVLDJbLsx/+FGDqv4Dh8LsthmdO5CLFSY8RAM8AFTMq2ZHneRsBOch58D3B
bFgI3dz5NAD6X1+oWIBNkvqf04hgil43Li1B5r0yaEfmy+lfa1Av2zYSjAAo27/e
Hb4pH3HebgEcmYQqZkMb9zCaz+OTuSmkv4qrLxlM68jTZS9e823Zmzen6pA3L2H8
1x78eQ6laj0KpYqCNs7jUD/bkeULM2pcyZ5jzZ1sa6355KItSBOEHvX4UmsN7LlR
lvRufo3k
=/qoM
-----END PGP SIGNATURE-----

--=-mt1scPwHjR7HxH9t4sL8--

