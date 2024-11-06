Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE18D59F6F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 20:14:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.56108.1730924075073469370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 12:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FL4QwClk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B392F20003;
	Wed,  6 Nov 2024 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730924073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IxHZrM2Q7LGXTPyRAsT0+O25JaElQiDbk82k9qPx1rQ=;
	b=FL4QwClkiIV2E7BneeXkSAzLR5g6EqeZlnDg2QpOidOXxdI9jUnTZNHr6rNy+NKGZbeQPQ
	uAlOn7cYt3y5CQwTzMwXwixp0spcI6LFbsxuxh2cjCTtmRZ+jnJLsAdEQlJmyP6IoSLpVQ
	6k73eDO/4+SRZmZ/MERVShDgS4EPXnOkdXZMwMhOrmQNbeH4D9EGz9COW4088FFpTIHfnC
	YB/9pF02BQrpREFf+NpfKttsMa+pl0mf5SuDwf9vpGS7w9GPnrCK273pjPgHuXJtzc06CQ
	+Dv2EwZ3Cm7J+o9OVzNm5/cuU1pr1bUo2D7re6wVtset3Qp6WTpc39UB+Ps7nA==
Message-ID: <8ce0b3c280a9ffc3723cf34f60a9bc002e760e9b.camel@bootlin.com>
Subject: Re: [oe][meta-oe][PATCH] taisei: add a recipe for version 1.4.2
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: thomas.perrot@bootlin.com, openembedded-devel@lists.openembedded.org
Date: Wed, 06 Nov 2024 21:14:32 +0100
In-Reply-To: <CAMKF1sosB+RLm_RoBRUa+j+q=T1Sqn61RRcVCb0NP_03EOsb3Q@mail.gmail.com>
References: <20241105071627.2768743-1-thomas.perrot@bootlin.com>
	 <CAMKF1srLh=vyw89hvpJhQg_XxBHXb0byiTtJuZFtch-R_Qg0eQ@mail.gmail.com>
	 <CAMKF1sosB+RLm_RoBRUa+j+q=T1Sqn61RRcVCb0NP_03EOsb3Q@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-glXOW6cWpVhPEvK+HSK4"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 20:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113744


--=-glXOW6cWpVhPEvK+HSK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Tue, 2024-11-05 at 13:06 -0800, Khem Raj wrote:
> it seems to fail YP layer compatibility check as well
>=20
> https://valkyrie.yoctoproject.org/#/builders/81/builds/134/steps/11/logs/=
errors
>=20
> opusfile in from meta-multimedia and meta-oe does not depend upon
> meta-multimedia
> so you can make it a packageconfig and disable it by default, or
> perhaps disable it completely if
> not needed. Other option would be to move it under dynamic layers.
>=20

Thank you for your review, I will push a version 2 with the requested
modifications.

Kind regards,
Thomas Perrot

> On Tue, Nov 5, 2024 at 8:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >=20
> > On Mon, Nov 4, 2024 at 11:16=E2=80=AFPM Thomas Perrot via
> > lists.openembedded.org
> > <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > >=20
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >=20
> > > Taisei Project is an open source danmaku.
> > >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > > =C2=A0.../packagegroups/packagegroup-meta-oe.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> > > =C2=A0.../recipes-graphics/taisei/taisei_1.4.2.bb=C2=A0=C2=A0 | 52
> > > +++++++++++++++++++
> > > =C2=A02 files changed, 53 insertions(+)
> > > =C2=A0create mode 100644 meta-oe/recipes-
> > > graphics/taisei/taisei_1.4.2.bb
> > >=20
> > > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-
> > > meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-
> > > meta-oe.bb
> > > index 178256c83f63..4635fe3d44d0 100644
> > > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > > @@ -521,6 +521,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
> > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "x11=
", "st", "", d)}
> > > \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 stalonetray \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 surf \
> > > +=C2=A0=C2=A0=C2=A0 taisei \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 terminus-font-consolefonts \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 terminus-font-pcf \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 tesseract \
> > > diff --git a/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> > > b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> > > new file mode 100644
> > > index 000000000000..2d2ab32bace7
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> > > @@ -0,0 +1,52 @@
> > > +SUMMARY =3D "Taisei Project is an open source danmaku"
> > > +DESCRIPTION =3D "Taisei Project is an open source fan-game set in
> > > the world of \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 T=C5=8Dh=C5=8D Project. It is a top-down vertical-scroll=
ing
> > > curtain fire \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 shooting game (STG), also known as a 'bullet
> > > hell' or 'danmaku'. \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 STGs are fast-paced games focused around pattern
> > > recognition and \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mastery through practice."
> > > +HOMEPAGE =3D "https://taisei-project.org"
> > > +BUGTRACKER =3D "https://github.com/taisei-project/taisei/issues"
> > > +LICENSE =3D "CC-BY-4.0 & CC0-1.0 & MIT"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D1a11ffd7e1bdd1d3156cecec60a2846f"
> > > +
> > > +DEPENDS =3D "\
> > > +=C2=A0=C2=A0=C2=A0 cglm \
> > > +=C2=A0=C2=A0=C2=A0 freetype \
> > > +=C2=A0=C2=A0=C2=A0 libsdl2 \
> > > +=C2=A0=C2=A0=C2=A0 libwebp \
> > > +=C2=A0=C2=A0=C2=A0 opusfile \
> > > +=C2=A0=C2=A0=C2=A0 zstd \
> > > +"
> > > +
> > > +RDEPENDS_${PN} =3D "\
> > > +=C2=A0=C2=A0=C2=A0 cglm (>=3D 0.7.8) \
> > > +=C2=A0=C2=A0=C2=A0 freetype \
> > > +=C2=A0=C2=A0=C2=A0 libsdl2 (>=3D 2.0.16) \
> > > +=C2=A0=C2=A0=C2=A0 libpng (>=3D 1.5.0) \
> > > +=C2=A0=C2=A0=C2=A0 libwebp (>=3D 0.5) \
> > > +=C2=A0=C2=A0=C2=A0 libzstd (>=3D 1.4.0) \
> > > +=C2=A0=C2=A0=C2=A0 opengl (>=3D 3.3) \
> > > +=C2=A0=C2=A0=C2=A0 opusfile \
> > > +=C2=A0=C2=A0=C2=A0 zlib \
> > > +"
> > > +
> > > +SRC_URI =3D "gitsm://github.com/taisei-
> > > project/taisei.git;branch=3Dv1.4.x;protocol=3Dhttps"
> > > +SRCREV =3D "c098579d4fa0f004ccc204c5bc46eac3717cba28"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit features_check meson mime mime-xdg pkgconfig
> > > python3native
> > > +
> > > +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > +
> > > +PACKAGECONFIG ??=3D ""
> > > +
> > > +PACKAGECONFIG[a_null] =3D "-Da_null=3Dtrue,-Da_null=3Dfalse"
> > > +PACKAGECONFIG[developer] =3D "-Ddeveloper=3Dtrue,-Ddeveloper=3Dfalse=
"
> > > +PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,python3-
> > > docutils-native"
> > > +
> > > +
> > > +
> > > +FILES:${PN} +=3D "${prefix}/share"
> >=20
> > there is a dedicated variable ${datadir} you can use here
> >=20
> > > +
> > > +INSANE_SKIP:${PN} =3D "already-stripped"
> >=20
> > can we patch the makefiles to not strip the binaries and leave it
> > to OE tasks ?
> > This can improve debugging experience.
> >=20
> > > --
> > > 2.47.0
> > >=20
> > >=20
> > >=20
> > >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113615):
> https://lists.openembedded.org/g/openembedded-devel/message/113615
> Mute This Topic: https://lists.openembedded.org/mt/109402043/5443093
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


--=-glXOW6cWpVhPEvK+HSK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmcrzigACgkQn8ALBXH+
Cu1m5gv/UpXS0hSZUTqsOkA7QC6lKrglO2qTp/z4HBJnd33b4xIksD8lhAvgZOQa
wVvtsbaBHmXvtLC6JbPWyVY2qURey00uwCPEVvA1NuSqSRy/l8hoylhLgMZaoeio
rFpwRgjI61Hxy4/J8Rj4Ern7r35ll+L99BVMeL4ipRAJspiLUdJiZdU5fO/IDaFa
4LtIGFRIb37EnI3jKYaZPG9PQKDzvfBdTHWtOggLTjat0qlrxIH0dy7JPrJ/l5O+
XFKNWUG34mACuvLm3Brh2BulrZpQcdHiIAYNlWgx+HeqzBrI9UE9GmjcTAq6GO+Q
Q5q0g/sWLlwTPTg8q+SKRuaunZiZOlsbnfinZJb3bJGLjHgaYO2RcGmLBKvkHgQX
mC3I0hOb052Ygd3qcgWXSmyeqguDWlGt0TboaEabhF9Xj7kI29J9iJwLNOZDKdTN
gNBK1qafqVMnlRuzt9DAkVJSbdr2Jn70rF8Snn4ITJJ6NYnJLUVYawL0Lo0tp1UA
SMBPgu0Q
=Vahz
-----END PGP SIGNATURE-----

--=-glXOW6cWpVhPEvK+HSK4--

