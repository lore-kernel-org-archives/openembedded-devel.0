Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0666A9C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:50:36 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so3818120eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NZUCqqGl/ePnmbZzCrzyPBi/wNqvonyy86T4gQy+Hu4=;
	b=d82cVzB+HdQaTT733ZT44PqbtzUjMJK6rx8Puhsy+2W+8c0g4icMkaUno2FckAlrqj
	xmuD5QL4+LKpDYJrXCuMFqttVVXtwOkRSHIQHVo/AQzTn55/jeEZGVfXVQEP4zPO0a0P
	sdZmPVsxy704AsaNzZ3M7ZaDRI8tt+nywiC5K5aR2qqQMNpW/jczmqxtMTfKl5gfPWha
	ehRMJ1abXwUB3SAzjdQ76tu58JvUJMkXKMpsK00QE3kKv9kCmybp7FR4JNctS9n66lg5
	rMBBgD1K3T6yy/8QlZN6WbSfTE3q5XVhE/NN3IbxsRIUVSUQtEipRnhZOUbEHIP11Uyn
	DwnQ==
X-Received: by 10.15.34.206 with SMTP id e54mr17423203eev.24.1370965836496;
	Tue, 11 Jun 2013 08:50:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bk1sm31189054eeb.5.2013.06.11.08.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 08:50:35 -0700 (PDT)
Date: Tue, 11 Jun 2013 17:50:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611155059.GH3233@jama>
References: <1370883990-5569-1-git-send-email-cazfi74@gmail.com>
	<CAF6bG8fEUCPMp1RYrEZCvfrYsco3Wp6CZwmf52mFy=UuAxXn2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6bG8fEUCPMp1RYrEZCvfrYsco3Wp6CZwmf52mFy=UuAxXn2w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libungif: add native build
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
X-List-Received-Date: Tue, 11 Jun 2013 15:50:36 -0000
X-Groupsio-MsgNum: 45037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Content-Disposition: inline

--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 08:07:43PM +0300, Marko Lindqvist wrote:
>  Motivation for this patch: newer versions of liberation-fonts need
> fontforge to build, and fontforge depends on libungif.

This line should be in comment above BBCLASSEXTEND or in commit message.

I'll add it to commit message, no need to send v2.

>=20
>=20
>  - ML
>=20
>=20
> On 10 June 2013 20:06, Marko Lindqvist <cazfi74@gmail.com> wrote:
> > Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> > ---
> >  meta-oe/recipes-extended/libungif/libungif_4.1.3.bb |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta=
-oe/recipes-extended/libungif/libungif_4.1.3.bb
> > index 0e9bf9b..3e4b78b 100644
> > --- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> > +++ b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> > @@ -12,3 +12,5 @@ inherit autotools lib_package
> >  PACKAGES =3D+ "${PN}-utils"
> >
> >  FILES_${PN}-utils =3D "${bindir}/*"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 1.7.10.4
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3R2MACgkQN1Ujt2V2gBzQyACfXxHQnRekfOn7uje051LrIgep
BSUAn2XEmlnoEAU+Ed/B21taRqRQEPQ6
=oPgA
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--
