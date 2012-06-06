Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ScINh-00089r-Me
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:42:45 +0200
Received: by bkcjm2 with SMTP id jm2so5900763bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DYF1elyMMDPa+EPAKZlHylEWDUZy+fU/tf9flSLieKw=;
	b=XDPugmpltL1KLkXraS2JsqTcjstpPqbFJAj980pcGyiLjw6hLEzqzDrc4DEUzEc7cf
	pV5HUyK2Bvz3NEznqyrqG1y4otTPXlGvP/6ABzzcN80nZPlrckik1WzW0PhOivdIWX5a
	aOtKtqExt6Fh01wrMbvw2y9EAST3uXk5WC8mnlXdncgHtD1gumLtjgHeW+HYooXaPvNF
	GH3b1mWk+GzhA74hmeoSIX1noMyl7SJb/1wTbjASiDt7R2soB78fjJuKcw40uxhEDp8l
	1ZbHRmMYnfzXEaNXbRz63nJUk4yy4oSatJ556uErJRl5Yd491i0ZfS1BKJrdBgOj1vDY
	FC0A==
Received: by 10.204.9.216 with SMTP id m24mr12687616bkm.67.1338996738469;
	Wed, 06 Jun 2012 08:32:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ig1sm292744bkc.4.2012.06.06.08.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:32:17 -0700 (PDT)
Date: Wed, 6 Jun 2012 17:32:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120606153232.GE3140@jama.jama.net>
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<4FCF76D6.4040909@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4FCF76D6.4040909@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:42:45 -0000
X-Groupsio-MsgNum: 39166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 09:27:18AM -0600, Gary Thomas wrote:
> On 2012-06-06 09:20, Dan McDougall wrote:
> > The previous patch had python-diffutils when it should have been
> > python-difflib.
> >
> > Signed-off-by: Dan McDougall<daniel.mcdougall@liftoffsoftware.com>
> > ---
> >   .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/me=
ta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > index bae624e..702f224 100644
> > --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > @@ -26,6 +26,6 @@ SRC_URI[md5sum] =3D "5c7b5349dc3161763f7f366ceb96516b"
> >   SRC_URI[sha256sum] =3D "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6=
b719e385c2a981d8e06"
> >
> >   RDEPENDS_${PN} =3D "python-unittest \
> > -                  python-diffutils \
> > +                  python-difflib \
> >                     python-pprint \
> >                    "
>=20
> Since these patches have not yet been accepted/merged, shouldn't
> you squash them into one?

And interestingly someone found completely different set of deps a while
ago..

http://patchwork.openembedded.org/patch/3011/

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/PeBAACgkQN1Ujt2V2gBy96QCfUxP/6e1hZEHsGwgz9/HB5l1q
YUAAnA9IghdlczkR7hBvsQiac2NdDMRi
=voYH
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
