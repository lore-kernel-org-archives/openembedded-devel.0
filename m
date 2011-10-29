Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK8CA-0002AO-2Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:39:30 +0200
Received: by faas16 with SMTP id s16so4857758faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8Mx3Wo3vfx/L1VW25s5h3CSwJw9KOxR90uMLxnYHbTg=;
	b=D31pm0EFJXkrCYUT6x7IMMEmXOLpaAKq5NJtrkeBsj2SRmzMUoENO1FnZCbmqyWAYA
	57KsQ+Jj7ypctFbPcJd2NZAajBWUHZGZlgL0tpiEBslM6rqbONoFJmFGQa9bULXtMJ3F
	ULWhmibKPsYnEy69AcuOMJLix79oWy1Gmajjg=
Received: by 10.223.75.15 with SMTP id w15mr13759113faj.9.1319891604792;
	Sat, 29 Oct 2011 05:33:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d22sm8155935fad.19.2011.10.29.05.33.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 05:33:23 -0700 (PDT)
Date: Sat, 29 Oct 2011 14:33:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111029123318.GE12609@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<80e083564f1c33169626c79f52b15fe54f64c01d.1319884094.git.Martin.Jansa@gmail.com>
	<1319889763.3756.12.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1319889763.3756.12.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][meta-oe 12/12] elfe: add another patch to fix API changes
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
X-List-Received-Date: Sat, 29 Oct 2011 12:39:30 -0000
X-Groupsio-MsgNum: 35066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OGLMwEELQbPC02lM"
Content-Disposition: inline

--OGLMwEELQbPC02lM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 02:02:43PM +0200, Paul Menzel wrote:
> Dear Martin,
>=20
>=20
> Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...update-again-to-even-newer-elementary-API.patch |  105 ++++++++++++=
++++++++
> >  meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +
> >  2 files changed, 107 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-efl/recipes-efl/e17/elfe/0001-elfe-update-agai=
n-to-even-newer-elementary-API.patch
> >=20
> > diff --git a/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-ev=
en-newer-elementary-API.patch b/meta-efl/recipes-efl/e17/elfe/0001-elfe-upd=
ate-again-to-even-newer-elementary-API.patch
> > new file mode 100644
> > index 0000000..ad1c259
> > --- /dev/null
> > +++ b/meta-efl/recipes-efl/e17/elfe/0001-elfe-update-again-to-even-newe=
r-elementary-API.patch
>=20
> [=E2=80=A6]
>=20
> > diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-ef=
l/e17/elfe_svn.bb
> > index 151ef7e..5b703dc 100644
> > --- a/meta-efl/recipes-efl/e17/elfe_svn.bb
> > +++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
> > @@ -5,4 +5,6 @@ PR =3D "${INC_PR}.1"
> > =20
> >  require e-module.inc
> > =20
> > +SRC_URI +=3D "file://0001-elfe-update-again-to-even-newer-elementary-A=
PI.patch"
> > +
> >  DEPENDS +=3D "elementary"
>=20
> is `PR =3D "${INC_PR}.2"` needed? Or does the package content not change?

EFL_SRCREV is changed in same request.. so no it's not needed
>=20
>=20
> Thanks,
>=20
> Paul



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OGLMwEELQbPC02lM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6r8o4ACgkQN1Ujt2V2gBwCkQCgu4Mwt2jBBtnhLMdqn2OBaYin
Tf0An1IHeMqlbaR5Q97okL1dFWDOsCih
=tJl4
-----END PGP SIGNATURE-----

--OGLMwEELQbPC02lM--
