Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGHEs-0005rG-Jw
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:30:23 +0200
Received: by bkat8 with SMTP id t8so1426884bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QM9EUi7PF0R0rRRlY6mOzv83yl/xOiFV92LmRw6DT+Q=;
	b=YjLy17ljDJU/OIN1YAq8wMQXX6EvXuqzih0WnXM5aQxFj7QyEW4aY/Z1qQJctQouff
	dwmkiZDrkyLsrnp/d0zlaCm/oX9vGa7hJu0zPpplYqy6Jbnf4324KOTf5twosqygkDnF
	bBVSHOTxT1Fq+MbL8ui7iT3SwBgDUc1AFacPY=
Received: by 10.204.130.9 with SMTP id q9mr3057746bks.43.1318973072521;
	Tue, 18 Oct 2011 14:24:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x3sm3625844bkn.1.2011.10.18.14.24.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:24:31 -0700 (PDT)
Date: Tue, 18 Oct 2011 23:24:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018212425.GF556@jama.jama.net>
References: <1318971633-1534-1-git-send-email-pespin.shar@gmail.com>
	<20111018211611.GC27508@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20111018211611.GC27508@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-efl]] dummy patch to try if patchwork bug is fixed
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
X-List-Received-Date: Tue, 18 Oct 2011 21:30:23 -0000
X-Groupsio-MsgNum: 34883
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline

--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 02:16:11PM -0700, Khem Raj wrote:
> On (18/10/11 23:00), Pau Espin Pedrol wrote:
> > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
>=20
> And it did not work since mailman served it as it is. I guess problem
> might be in the mailman

Sorry I don't see the problem in mailman.

pespin's patch (X-Patchwork-Id: 13437)
=46rom: Pau Espin Pedrol <pespin.shar at gmail.com> ends like=20
=46rom: pespin <pespin.shar at gmail.com>

and ie my patch (X-Patchwork-Id: 13417)
=46rom: Martin Jansa <martin.jansa at gmail.com> ends like
=46rom: Martin Jansa <martin.jansa at gmail.com>

I did only s/@/ at /g here.

Regards,
>=20
> > ---
> >  meta-efl/recipes-efl/e17/efm-path_svn.bb |   15 ---------------
> >  1 files changed, 0 insertions(+), 15 deletions(-)
> >  delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb
> >=20
> > diff --git a/meta-efl/recipes-efl/e17/efm-path_svn.bb b/meta-efl/recipe=
s-efl/e17/efm-path_svn.bb
> > deleted file mode 100644
> > index 685513f..0000000
> > --- a/meta-efl/recipes-efl/e17/efm-path_svn.bb
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -LICENSE =3D "MIT"
> > -PV =3D "0.0.1+svnr${SRCPV}"
> > -PR =3D "${INC_PR}.0"
> > -
> > -require e-module.inc
> > -
> > -SRCNAME =3D "E-MODULES-EXTRA/efm_path"
> > -
> > -do_configure_prepend() {
> > -    sed -i -e /po/d configure.ac
> > -    sed -i -e s:\ po::g Makefile.am
> > -}
> > -
> > -FILES_${PN}-dbg +=3D "${libdir}/enlightenment/modules/*/*/.debug/"
> > -FILES_${PN} +=3D "${libdir}/enlightenment/modules/"
> > --=20
> > 1.7.7
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> -Khem
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6d7okACgkQN1Ujt2V2gBzCvACgkTMo/rxzBugMlcdTo7aIDzX8
jhgAoIKzUIHw9pAmm6IIVD5QAntSal7z
=hWGb
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
