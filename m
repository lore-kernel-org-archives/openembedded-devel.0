Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK8Ls-0002pD-HF
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:49:32 +0200
Received: by faas16 with SMTP id s16so4862149faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o5RgNuw96tT8INi4z54ZcEjCdQAp0XmzSMnjYNvpiQU=;
	b=YRGzFVZBSotgo2wUxjWMV24E6IygZAFd1YTU0lo7GH3CRtFqMOsbDxGHRpjPNQ8e5f
	i7UzJKTQTxVbIi3reQQxWhKf2RiJLa8JUI4zQ5pJnlalmu7Lv27jJWpHtdfz6qh/L4WQ
	uMAcsTDn56GX9JX7SPvRyQOW7x8UuBTF55bqc=
Received: by 10.223.7.14 with SMTP id b14mr14119363fab.10.1319892183878;
	Sat, 29 Oct 2011 05:43:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p14sm24041781faf.20.2011.10.29.05.43.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 05:43:03 -0700 (PDT)
Date: Sat, 29 Oct 2011 14:42:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111029124258.GG12609@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<10e61d56dfc41e0b0a334ec248b20877a8ead600.1319884094.git.Martin.Jansa@gmail.com>
	<1319889370.3756.8.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1319889370.3756.8.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][meta-oe 08/12] elsa: add new login manager for Enlightenment
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
X-List-Received-Date: Sat, 29 Oct 2011 12:49:32 -0000
X-Groupsio-MsgNum: 35069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1R6ZDISWaA1muLP0"
Content-Disposition: inline

--1R6ZDISWaA1muLP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 01:56:10PM +0200, Paul Menzel wrote:
> Dear Martin,
>=20
>=20
> could you add the version in the commit summary?

added

>=20
>=20
> Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-efl/recipes-efl/efl/elsa_svn.bb |   16 ++++++++++++++++
> >  1 files changed, 16 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb
> >=20
> > diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-ef=
l/efl/elsa_svn.bb
> > new file mode 100644
> > index 0000000..59127d3
> > --- /dev/null
> > +++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION =3D "Login manager for Enlightenment"
> > +DEPENDS =3D "efreet eina eet ecore elementary"
> > +LICENSE =3D "GPLv3+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> > +SECTION =3D "e/apps"
> > +
> > +inherit e gettext
> > +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scm=
data=3Dkeep"
> > +S =3D "${WORKDIR}/${SRCNAME}"
> > +
> > +EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> > +
> > +PV =3D "0.0.4+svnr${SRCPV}"
> > +SRCREV =3D "${EFL_SRCREV}"
> > +
> > +#RDEPENDS_${PN} =3D "${PN}-themes"
>=20
> Is there a reason the last line is commented out(?)?

no, thanks for catching it, uncommented now
>=20
>=20
> Thanks,
>=20
> Paul
>=20



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1R6ZDISWaA1muLP0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6r9NIACgkQN1Ujt2V2gBxCyACfe63IX7X4HirmiuuY+biL79Kf
15sAn2f75uWvPKe1Udc6mn6C4SYNOhEj
=2vg/
-----END PGP SIGNATURE-----

--1R6ZDISWaA1muLP0--
