Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ScILc-00080c-Vt
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:40:37 +0200
Received: by bkcjm2 with SMTP id jm2so5898240bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vyymwc9vk9hjQlSRHJAFIaVRK8jZa2Hb+6LcekVHZqc=;
	b=M/BJnuQ/zjP93IYfTU8LWPn2TSYBoHMGOqgh2btmD387ZoclUuVtfQPbGJg6lX8rSh
	44CC1B+DNY72xMB/bA2Ku75YDM6uHuGaW4UA5bSynkzeNhzvaGJ0UWC+8NOK4PxTA6GN
	Fjzv1P9cGdbOETxCSpsX49fMCMsmTBRcTaoYsVevHXAn4UNghCPIfEB2AYkeDFru6gXF
	E6HojnDvVfgNe7BtODcVXdGcHVUbXJ3bPS74l5sIMVI9/OyVaKKv/QynUMob8Mu1h0hG
	kj9QlRFoZaH6MXyWgfko+0aAz53QIcFjfOxKrA5v/ZKSQSCOKmWvnWGcV5EUsHFqytDX
	eotA==
Received: by 10.204.154.80 with SMTP id n16mr13211029bkw.112.1338996609750;
	Wed, 06 Jun 2012 08:30:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu14sm253532bkc.13.2012.06.06.08.30.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:30:08 -0700 (PDT)
Date: Wed, 6 Jun 2012 17:30:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120606153021.GD3140@jama.jama.net>
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
X-List-Received-Date: Wed, 06 Jun 2012 15:40:37 -0000
X-Groupsio-MsgNum: 39165
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
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

Once again:

http://git.openembedded.org/meta-openembedded/commit/?id=3D036eb620206041bf=
1cf4be5a8c2a4947afb34382

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Pd40ACgkQN1Ujt2V2gBy5AgCdEcxgzfA5Li4tSRwdz8Zx5q3u
YiMAn3atsL6JLpW9kFQuIUx+CpaTeoB/
=g73U
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
