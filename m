Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW2bt-0005yg-Fd
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 10:07:17 +0100
Received: by eekc1 with SMTP id c1so1051901eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 01:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M2bICkXivlJAQVPt0uOqipE0MnnIYXglS9tp8w51uF4=;
	b=roT+b3SdwNYJzEwc6W0wVFfXpgwEFWzr4oZqGXt3oCLN+Y6OpfoALsWiGgznQIxfT8
	ktbMOYuDMe4/D+UYi2p6HLjfm8d+gOZrXLUWqE+6GrwVRkSK1TsQZd+tIrBkl7o/7OsF
	Kqi8GyxrGK3dDb1R2Pya8QAYEOCAd/REmqms4=
Received: by 10.14.6.65 with SMTP id 41mr801085eem.12.1322730036312;
	Thu, 01 Dec 2011 01:00:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm15418222ees.2.2011.12.01.01.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 01:00:33 -0800 (PST)
Date: Thu, 1 Dec 2011 10:00:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201090031.GH29875@jama.jama.net>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
	<ec55dac74706f161c53c7dda81f7df99305cf7ff.1322640506.git.Martin.Jansa@gmail.com>
	<jb4stq$rmo$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jb4stq$rmo$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 07/11] eeze: pass /bin/true instead of eject which is not available
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
X-List-Received-Date: Thu, 01 Dec 2011 09:07:17 -0000
X-Groupsio-MsgNum: 35781
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline

--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 10:27:22AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 30-11-11 09:16, Martin Jansa schreef:
> > * hopefully better fix will be available upstream later 09:03:03 <
> > discomfitor> only if an app makes an eject call 09:03:36 < discomfitor>
> > in which case, the resulting exe call would be "/bin/true $mountpoint"=
=20
> > 09:03:39 < discomfitor> which would do nothing 09:03:55 < discomfitor> =
so
> > you would break those apps, but it doesn't seem to be an issue for
> > embedded... 09:08:06 < JaMa> ok, I meant if it would be better for those
> > apps to know that eject functionality is not available, but if this is
> > fine for you I can live with it too :) 09:09:26 < discomfitor> JaMa: hm=
m=20
> > 09:09:37 < discomfitor> JaMa: I will consider that
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > meta-efl/recipes-efl/efl/eeze.inc |    3 +++ 1 files changed, 3
> > insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta-efl/recipes-efl/efl/eeze.inc
> > b/meta-efl/recipes-efl/efl/eeze.inc index 4b13984..7a06f9d 100644 ---
> > a/meta-efl/recipes-efl/efl/eeze.inc +++
> > b/meta-efl/recipes-efl/efl/eeze.inc @@ -8,6 +8,9 @@ inherit efl=20
> > BBCLASSEXTEND =3D "native" INC_PR =3D "r2"
> >=20
> > +# to make configure happy, but we don't have (and usually don't need)
> > eject on target +EXTRA_OECONF +=3D "--with-eject=3D${base_bindir}/true"
>=20
> How about:
>=20
> RRECOMMENDS_${PN} +=3D "eject" ?

The problem in SRCREV I was usin was that it was cheking the existance duri=
ng
build (so you had to have /usr/bin/eject on buildhost).

Later in r65358 and r65359 there were changes for runtime detections of
utils, so with current EFL_SRCREV r65428 we should be fine and
RRECOMMENDS_${PN} should be enough, I'll retest and send updated patch
with next EFL_SRCREV bump.

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7V9voACgkQMkyGM64RGpFm3ACcCBiZBj731XsqB7kdj9TAr/iy
> m+sAoIz331YvgrWbO1A9xToOxLXj6maU
> =3DqaIj
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XQi8ACgkQN1Ujt2V2gBzJ5gCeKc+dnpzOxl7D90kZE1w0b0VD
5pEAoLDBZ6JZlfJ+0L98eU0bvGbyY7Ru
=cX0w
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
