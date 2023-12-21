Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8A5C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 06:59:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.46745.1703141989440482478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 22:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C83Rn9k1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C06920004;
	Thu, 21 Dec 2023 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703141987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v9dU+vhQT+h1LUK6BA0qoBBJH4PQyhYG36HqiLafbTA=;
	b=C83Rn9k1x49Gmmz8FbzjPiPjfehiSG4rHX9Nu60C7mMsml4KCMhOeW0pcQVhAvMEVi6KMF
	cpxRgYY3iKl045VseUgO2hBvvq49j7SvpFSPHX8cXL7yPjWWaap2fBtyqbVj2VQU/AOxll
	sO2Yz0Qvdee5SNaoZrPb8w3ErFdmcMSB5qohhtKN8QvNP9nZP3jpBb4384VrGXvEQUYXy+
	XHpEmrA9i45ocyBlIlOrbdL59lukgMWKpODE9HQCpXeWQAixmLYBIzdXNX1ZiG5tncbTXw
	DLJuy4zeUMqXIF/joynM426yZE8sOLY2Lb47v8OEM/I/lY4arPD9pdOp6WVWUA==
Message-ID: <dd25c66ea839d35f45466cd362bd95010bdb5711.camel@bootlin.com>
Subject: Re: [oe] [meta-networking][PATCH v2] networkmanager: fix some
 missing pkgconfig
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Dec 2023 07:59:46 +0100
In-Reply-To: <908FC099-C100-423D-B82D-3CCD25254A6C@arm.com>
References: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
	 <908FC099-C100-423D-B82D-3CCD25254A6C@arm.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YpfmWGut7s1kVu4buFh3"
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 06:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107700


--=-YpfmWGut7s1kVu4buFh3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-12-20 at 14:47 +0000, Ross Burton wrote:
> On 20 Dec 2023, at 14:15, Thomas Perrot via lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > +RDEPENDS:${PN}-nmtui +=3D "${PN}-daemon
> > ${@bb.utils.contains('PACKAGECONFIG','nmtui','libnewt','',d)}=E2=80=9D
>=20
> My point still remains: it looks like nmtui links to libnewt directly
> and doesn=E2=80=99t dlopen, so why is this needed?

This is a mistake, this isn't necessary, thank you.

Kind regards,
Thomas Perrot

>=20
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/=
src/libnmt-newt/meson.build?ref_type=3Dheads#L29
>=20
> Ross
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107661):
> https://lists.openembedded.org/g/openembedded-devel/message/107661
> Mute This Topic: https://lists.openembedded.org/mt/103281132/5443093
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


--=-YpfmWGut7s1kVu4buFh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmWD4mIACgkQn8ALBXH+
Cu1FgAv/V+qd9ilqHSqmdJ0WAbwhrOu7KpQ1zvKMyFD2wT8hM8a0qMOPwRnJ8D1w
PThLMju6dbEgpkBDnDE2fWxOaxgupePsWsYBEN9Jcy0mrl96ywRV7YZhCOA0DIN9
5b5wJmdlKvXfmJp3tt6ZEnYslOeAR1lRTBZwz1wOUaYtmM+wvV5SH+zbXJS/4UP0
SCh0SKaMJXWB84pwjHI8nVikMHqq5tZZc/7TvnP3YI7KLdPoLVxTTOk4c1i3/4Yn
pdSl+VYlqGTUwbSXpqfZlu2kOihnQE2eeViau4dh7udO3uWiedzZRHIy30UJ8dkB
mRuQ2BGFk8fMiX0FP+80fJY2aZn0pCETcijfHP+hUHhGXfyKPgcsgTJpssDf3UXP
S5VDzzNtdEZxteFm1BNc1IRe4HNjAgelzxoeqdtGk5sXYSE4oNdr22rYL0DeVIah
vcearKVdP6+6szmDLm4G4xNWdI2bZMmj2wCLTLJ3gLbdSIAt/YStOtWW/4S/EWVR
u2w5SnWH
=x2yL
-----END PGP SIGNATURE-----

--=-YpfmWGut7s1kVu4buFh3--

