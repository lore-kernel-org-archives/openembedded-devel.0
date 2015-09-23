Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C6500756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 13:44:41 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so208326482wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hk6Yu+VaODJtDVP8jhTWzCHhFC8TgXxRKYWPFtAsHoQ=;
	b=ktojmqioSQy4DC4+jTsJGm6STet3RR6hp1jLFccXNdjEdAwYzppxeqVSDo2lEQGusZ
	EtM+g88OEZFGmuOAvoNwQfCcep9v1NZLhb0bm5keJ7vrxzJ92F97F28sDBL1AtrDWcgM
	pweJep+K+dSxQt59ws38w6CfLnLOJIjDTboDdUrao69VczuVSltTyVqQzwg9SZ/ruYfD
	J2gfYXnhltV34Az4EZViyFfmUvGOTL9icfAw1oZBRVEJ/aokgxuaEFrWCu8kYObxLw8o
	VRUxXgyCNpz0UbOERFYXrEA0OKdfxykqBwdW+V8mVuImuAFisBjvc8B0HkWC3IbgyZq0
	HtXw==
X-Received: by 10.180.8.164 with SMTP id s4mr4385921wia.5.1443015880771;
	Wed, 23 Sep 2015 06:44:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jq10sm7323901wjc.40.2015.09.23.06.44.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 06:44:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 15:44:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150923134450.GB2384@jama>
References: <1442691768-30079-1-git-send-email-andrei.kholodnyi@gmail.com>
	<1442691768-30079-2-git-send-email-andrei.kholodnyi@gmail.com>
	<CABYVMoQ9dcd9z-VGBmnfG+uyrTdNB7=e8gUikJeCq5=n2SYJOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABYVMoQ9dcd9z-VGBmnfG+uyrTdNB7=e8gUikJeCq5=n2SYJOQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] lvm2: add --with-systemdsystemunitdir in configuration Otherwise sed command for blk-availability.service may fail. It will look for the service file in a wrong location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Sep 2015 13:44:44 -0000
X-Groupsio-MsgNum: 57509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2015 at 11:12:10PM +0200, Andrei Kholodnyi wrote:
> I apologize for the inconvenience, need to look why my gmail sends patches
> twice

You have another chance.

Resend with SOB-line and add blank line between commit summary and body
(so that it doesn't all end in summary, summary should be short).

>=20
> 2015-09-19 21:42 GMT+02:00 Andrei Kholodnyi <andrei.kholodnyi@gmail.com>:
>=20
> > ---
> >  meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> > b/meta-oe/recipes-support/lvm2/lvm2.inc
> > index 2b2d8ed..8114d5f 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -27,6 +27,7 @@ EXTRA_OECONF =3D "--with-user=3D \
> >                  --enable-lvmetad \
> >                  --with-udev-prefix=3D \
> >                  --with-usrlibdir=3D${libdir} \
> > +                --with-systemdsystemunitdir=3D${systemd_unitdir}/syste=
m \
> >  "
> >
> >  PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux',
> > 'selinux', '', d)}"
> > --
> > 2.1.4
> >
> >
>=20
>=20
> --=20
> Believe is not enough, you must know
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCrNEACgkQN1Ujt2V2gBzc7QCguIXLkWbmAgmuHufavUU+1KL1
JUIAoLlmNDL5Sk4/dExRG8VzGVBepz/6
=FQfA
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
