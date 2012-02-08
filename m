Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rv7C4-0008TO-Of
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 14:04:16 +0100
Received: by eaal10 with SMTP id l10so138033eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bwAFmLyJn8hNyyHolEiKPyopyZE9sDTH3/u06W9zBNg=;
	b=u8rE6K2UVuiiMkeCgmnv71XRoJXyqompXkDcDKf399JYHW/m/vgvoQnlZej4yeoS5L
	a9JO/t81htX9CLh8R2LOpPbJ0RdgEJLG+O6P0FFTyKqU7sm8sFrXqURm9ns1D5wmLwKJ
	Yde8IR6dTc8aoE3UjM1If4uq4NoTT8gzvEnDQ=
Received: by 10.14.135.140 with SMTP id u12mr8374150eei.73.1328705773568;
	Wed, 08 Feb 2012 04:56:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm4947426eeb.7.2012.02.08.04.56.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:56:12 -0800 (PST)
Date: Wed, 8 Feb 2012 13:56:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120208125610.GC3647@jama.jama.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
	<CALbNGRQOjKkbYCE9ky6ZfNypCO9eNEsgmjPC_LaXduWb-eptnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQOjKkbYCE9ky6ZfNypCO9eNEsgmjPC_LaXduWb-eptnw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 13:04:16 -0000
X-Groupsio-MsgNum: 37017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2012 at 01:51:54PM +0100, Andreas M=FCller wrote:
> On Wed, Feb 8, 2012 at 1:14 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> > That is why I want to make an exception for polkit and udisks to keep
> > initmanager selection an IMAGE_FEATURE combined with DISTRO_FEATURE. A
> > distro maintainer can then choose to support one or more initmanagers a=
nd in
> > the case for multiple it can be set per image.
> >
> > regards,
> >
> > Koen
> I haven't the point: why do we need such quirks to keep initmager an
> image feature? Could you please help me out here?
>=20
> FYI one of my tests was to build the image I usually work with configured=
 as
>=20
> INIT_MANAGER =3D "sysvinit"
>=20
> and systemd isn't build at all - so no need to take care at specific
> recipes: They will configure for what I (or the distro) want them.
>=20
> Please see INIT_MANAGER as distro feature. I did not add it to the
> collection of DISTRO_FEATURES to avoid setting multiple initmanages.

For me it would allow to support palmpre* devices just by slightly
different image even when it has too old kernel for systemd.

If it's distro feature then we'll have to drop support or find some devs
still interested enough in palmpre* to port all patches to newer kernel
and support it.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8ycOkACgkQN1Ujt2V2gByfqgCgqPsGNPgU0I9pLQKUTYxERDvm
SdsAn0lCj48TlLBvIuEBBGhCz3yJ79zg
=zGtH
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
