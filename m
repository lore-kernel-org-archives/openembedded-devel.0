Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5646FF91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:01:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r201so55500wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1SGzkePbT6rI5UEyP3tQkedodEoxhB1UQWtRSTiQDX0=;
	b=VzWJLqEiNRRE7DrngTjAB7Suxa8/5hR9ytC5T6tZvtrEdqJmKfCZdMMGnCP8u8xoSt
	mluFRqTMqLmoY2WLXRcAUrI5rGCX40zJcGKcjS09+YkngsL55/8IQAuDq/trFeXq6yka
	agXGxK0KXhy5s4GyEvfUoRk9X08NUOcYxjWd4EldCMleaM16xdUzcp5j55iCAwP2V3Hv
	jr9MsT8Kd2/I9OE31UXixdDDrE99s0aIoiVJwmkA9Qst9lthSWpN02Fq0O9qsKgq+QUW
	2iDS5ydZv76VXDOwRV9chi5mIHKZAH0fFO3zTAFAjz/nGlOxaLZ89VdMK9vU03CghvqB
	L3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1SGzkePbT6rI5UEyP3tQkedodEoxhB1UQWtRSTiQDX0=;
	b=btwjk9Kh5HBCr04FhlmqjxOz5C+7Bt00ps8mvynkXF7YDy477Zz9dJYA0ioyxf1gHE
	nLhrubHditKgDw6iEVIpCz4wkUD6o+3wqwhxH6ygOoQllOipR9pADQK3C5bPu02h5qdB
	vPCk3hscxdHDJjernMqdWWN4bPToNKAuxlM1KlqQIE6AZWTJUNViwNKfRL2IL+FTdf3Y
	VCwH1uw/NVdUM/hVsdaqHHTvn2+2sPl0yQGccgKHMNkHfckTrCdFgwFMxMqiSIkXJpcJ
	VAD/CTCria/cDvBxGlW09gJxWo2lvKu0b67HB+qLjtEJ+rQKSM4Sn+/N3w5haiPyNejf
	A//g==
X-Gm-Message-State: ALyK8tKrPo6iLoqD6Q6ZgGMDAILsbPwLeWZ5cdDIR2muZg821jan/9woFymYSxS7SMZdmA==
X-Received: by 10.28.12.8 with SMTP id 8mr21380102wmm.6.1466172106435;
	Fri, 17 Jun 2016 07:01:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y6sm3778948wmy.8.2016.06.17.07.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Jun 2016 07:01:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 Jun 2016 16:02:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160617140222.GB2574@jama>
References: <1465435705-3794-1-git-send-email-derek@asterius.io>
	<E49AE6D7-2850-4C61-B163-F39F26CF732A@gmail.com>
	<CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH] geis: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Fri, 17 Jun 2016 14:01:46 -0000
X-Groupsio-MsgNum: 61866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline

--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 09:38:51AM -0400, Derek Straka wrote:
> It didn't seem worthwhile to create a patchset to fix whitespace issues. =
 I
> can create the patches if people prefer that to suppressing the error.

I would prefer fixing the issue, but I'm very grateful for your changes
fixing the build failures (in any way), there are only very few people actu=
ally
sending any fixes. And simple work around is still better than even
more PNBLACKLISTs.

Thanks!

> -Derek
>=20
> On Fri, Jun 17, 2016 at 12:17 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> >
> > > On Jun 8, 2016, at 6:28 PM, Derek Straka <derek@asterius.io> wrote:
> > >
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > ---
> > > meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 2 ++
> > > 1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17=
=2Ebb
> > b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > > index bc88143..9b087a8 100644
> > > --- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > > +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > > @@ -24,6 +24,8 @@ SRC_URI[md5sum] =3D "2ff9d76a3ea5794516bb02c9d1924f=
af"
> > > SRC_URI[sha256sum] =3D
> > "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
> > >
> > > EXTRA_OECONF =3D "--disable-integration-tests"
> > > +TARGET_CFLAGS +=3D "-Wno-error=3Dmisleading-indentation=E2=80=9D
> >
> > why not fix the code
> >
> > > +
> >
> > >
> > > FILES_${PN}-bin =3D "${bindir}"
> > > RDEPENDS_${PN}-bin =3D " \
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldkAu0ACgkQN1Ujt2V2gBwHPgCfSDtqp4irxBYv+ahJLr86RO8+
VJsAoJ4D1COS5MeDLNQzyLZTwDa5m1Gg
=aIO0
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
