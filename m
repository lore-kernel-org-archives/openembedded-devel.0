Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SWD4a-000529-8H
	for openembedded-devel@openembedded.org; Sun, 20 May 2012 22:49:52 +0200
Received: by wgbdr1 with SMTP id dr1so3477562wgb.12
	for <openembedded-devel@openembedded.org>;
	Sun, 20 May 2012 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ldjTV8BZwiKqzusnM9570OWZ8po/0Hu/7MfIENK5Uoc=;
	b=BgwzVTH3iNy8TLorMu4GDONRgSO1u3mw8FnhJHRlmYpOAabIQVhupnQBxJVgDerMyT
	X5gNMHxoifoYAfuosv3FGUVl8Al8d45E1Zl1WLwOgfyYanUo8Q/nKoo/9Se8TsDTK/6h
	/9EA1XPqqUVSXvLxQPiq2A/XEzIjeMGuxrcKjQFzjAIXUzZ8dV0ps8NqWqjZtCwPYFgE
	0Wi5D43wGWtHhezuazff2587JRy6yPFwW4kybETpZFKTZ99ADz7uAHW7eCIaud1CJP1m
	Axyh8w1MrAhFQIfUYN+zWs7h2+vvQYu/gTiij+1EaA0BletHSutKWwlxVMvE1TJgQjOF
	V6+Q==
Received: by 10.180.102.9 with SMTP id fk9mr30775423wib.1.1337546385475;
	Sun, 20 May 2012 13:39:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn9sm20732638wib.5.2012.05.20.13.39.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 13:39:44 -0700 (PDT)
Date: Sun, 20 May 2012 22:39:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20120520203942.GA3166@jama.jama.net>
References: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
	<1337120874-17531-2-git-send-email-apelete@seketeli.net>
	<20120520201339.GR19142@hermes>
MIME-Version: 1.0
In-Reply-To: <20120520201339.GR19142@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] libecj-bootstrap: Update SRC_URI to archive.eclipse.org
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
X-List-Received-Date: Sun, 20 May 2012 20:49:52 -0000
X-Groupsio-MsgNum: 38905
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2012 at 10:13:39PM +0200, Apelete Seketeli wrote:
> Hello,
>=20
> Le 16-May-12, Apelete Seketeli a =E9crit:
> > This updates SRC_URI to archive.eclipse.org since mirrors.ibiblio.org
> > seems to be down.
> >=20
> > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > ---
> >  recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj=
-bootstrap_3.6.1.bb
> > index d5da24e..996ab33 100644
> > --- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
> > +++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
> > @@ -3,7 +3,7 @@ require libecj-bootstrap.inc
> >  PR =3D "${INC_PR}.0"
> > =20
> >  SRC_URI =3D " \
> > -	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/d=
rops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
> > +	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-2010090=
90800/ecjsrc-${PV}.zip \
> > =20
> >            "
> > =20
> > --=20
> > 1.7.9.5
> >=20
>=20
> Once again, I need libecj-bootstrap to build muffinman-image in
> oe-classic, can someone here please review this patch ?
>=20
> http://patchwork.openembedded.org/patch/27791/

Patch looks good, I haven't used oe-classic for some time, so I haven't
tested it.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+5Vo4ACgkQN1Ujt2V2gBxgrACeLLoj5OuTvqBNftkDOLMsJ0pq
8pAAoIoyr9Rd6JyX6uN1XK8rLkP8lu/k
=3d48
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
