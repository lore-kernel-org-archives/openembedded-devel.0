Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtyB0-0006wU-If
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:42:10 +0200
Received: by bkbzu17 with SMTP id zu17so1472238bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ENrngYi7Kp1xANndpyWPaOm7fTkPvXz8+iS9joVWME4=;
	b=nTsbkXsoERWckxCMxnFSadwOyP9Lt+td/1JdXsKO4HjT65MFchMEP2A4JEhvk1gQ/7
	ln2BtmwST4bnfTVo6oIEYf0v5oh0mgsosGcTEmOsT6nAx1L7vLTuWmAi+2CdrnmjUP5Z
	enFHs9EMXBQu+JGIvpy2CnaEK0r20+Eic+/OM=
Received: by 10.204.232.196 with SMTP id jv4mr219543bkb.250.1313656651402;
	Thu, 18 Aug 2011 01:37:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4265091faa.3.2011.08.18.01.37.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:37:30 -0700 (PDT)
Date: Thu, 18 Aug 2011 10:37:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818083723.GA6465@jama.jama.net>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
	<1313656223.4016.12.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313656223.4016.12.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
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
X-List-Received-Date: Thu, 18 Aug 2011 08:42:10 -0000
X-Groupsio-MsgNum: 33684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2011 at 10:30:23AM +0200, Paul Menzel wrote:
> Dear Martin,
>=20
>=20
> Am Donnerstag, den 18.08.2011, 10:18 +0200 schrieb Martin Jansa:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../e17/e-wm/wizard-module-skipping.patch          |   63 ------------=
--------
> >  meta-efl/recipes-efl/e17/e-wm_svn.bb               |    4 -
> >  2 files changed, 0 insertions(+), 67 deletions(-)
> >  delete mode 100644 meta-efl/recipes-efl/e17/e-wm/wizard-module-skippin=
g.patch
> >=20
> > diff --git a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch=
 b/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
> > deleted file mode 100644
> > index d124325..0000000
> > --- a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
> > +++ /dev/null
>=20
> [=E2=80=A6]
>=20
> > diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-ef=
l/e17/e-wm_svn.bb
> > index 9272aab..38257b5 100644
> > --- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
> > +++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
> > @@ -16,10 +16,6 @@ SRC_URI =3D "\
> >    file://applications.menu \
> >  "
> > =20
> > -SRC_URI_append_shr =3D " \
> > -  file://wizard-module-skipping.patch \
> > -"
> > -
> >  EXTRA_OECONF =3D "\
> >    --with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc \
> >    --with-eet-eet=3D${STAGING_BINDIR_NATIVE}/eet \
>=20
> sorry for bothering. I do not have an overview yet. Could somebody
> elaborate if such distribution overrides are now deprecated? Will that
> patch be applied in the SHR layer?

yes, distributions now have own layers to apply own patches and other
changes with .bbappend

the same should apply to machine overrides

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5Mz0MACgkQN1Ujt2V2gBz6xwCfRRmcuJb7UGnln40TlGsHGT73
kCQAnjuWjRR9srd6UQV8tCdgFne+lvM+
=ULns
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
