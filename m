Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S087v-0005r1-MM
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 10:04:43 +0100
Received: by eaal10 with SMTP id l10so2530152eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 00:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.10.4 as permitted sender) client-ip=10.213.10.4; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.10.4 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.10.4])
	by 10.213.10.4 with SMTP id n4mr4694503ebn.34.1329900983986 (num_hops =
	1); Wed, 22 Feb 2012 00:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yhNq+QgEmIzBzQ/hg55NC3AXxMO/YdpndGgIsD+yfR8=;
	b=xQyeSFl5frO9e/iwTgsPSJsm7sSwuh/bA6u2+xvwnO/rItXkEb6ynsbHYea6PV7AnS
	NuU1jHha6Iex0QnRwn5xgb49TN7ZWULnzxwGk9HpIfVPhrMMZYHyeYrRfapilthvE7VM
	PERQqceKrfNA1xmJAggf63N1D50RlJMyCIH40=
Received: by 10.213.10.4 with SMTP id n4mr3752683ebn.34.1329900983790;
	Wed, 22 Feb 2012 00:56:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm100314043eeb.8.2012.02.22.00.56.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 00:56:22 -0800 (PST)
Date: Wed, 22 Feb 2012 09:56:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222085620.GG3769@jama.jama.net>
References: <cover.1329775974.git.Martin.Jansa@gmail.com>
	<39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
	<ji29bo$1nd$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ji29bo$1nd$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 1/2] polkit: enable and disable systemd/consolekit support explicitly
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
X-List-Received-Date: Wed, 22 Feb 2012 09:04:43 -0000
X-Groupsio-MsgNum: 37322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 09:35:09AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 20-02-12 23:13, Martin Jansa schreef:
> > * people using sysvinit already have or can set something like=20
> > task-core-boot.bb does VIRTUAL-RUNTIME_init_manager ?=3D "sysvinit" to
> > disable systemd explicitly (so it's not picked by shlib when it's=20
> > available because other packages). * and for the rest it will disable
> > consolekit and enable systemd explititly
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 +++++-- 1 fil=
es
> > changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
> > 3c43970..d649f61 100644 ---
> > a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend +++
> > b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend @@ -1,3 +1,6 @@=
=20
> > -DEPENDS +=3D "systemd" +PRINC :=3D "${@int(PRINC) + 3}"
> >=20
> > -PRINC =3D "1" +PACKAGECONFIG ??=3D
> > "${@base_contains('VIRTUAL-RUNTIME_init_manager', 'sysvinit',
> > 'consolekit', 'systemd', d)}" +PACKAGECONFIG[systemd] =3D
> > "--enable-systemd,--disable-systemd,systemd" +# there is no
> > --enable/--disable option for consolekit and it's not picked by shlibs,
> > so add it to RDEPENDS +PACKAGECONFIG[consolekit] =3D ",,,consolekit"
>=20
> I really don't want to use runtime vars to trigger buildtime deps :(

But as VIRTUAL-RUNTIME_* should be consistent for whole build, then you
can consider them as distro level PREFERRED_PROVIDERS for runtime.

But if you want I'll send v2 with just PACKAGECONFIG definition changed
to

PACKAGECONFIG ??=3D "systemd"

so that people with sysvinit can still easily overwrite it from .bbappend.

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk9EqLAACgkQMkyGM64RGpF9nACeJIMiWeUkdZ1f7HlDT669DohK
> xaEAoIbezxgzLUg97K500qpxDn1rPzH8
> =3DXcOs
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9ErbQACgkQN1Ujt2V2gBw9yQCdFz2GV8Vw3uQcB55mfAkPhjKf
vSYAoLuIH9ghkLqrcxvM6uzQxyVmSamS
=ESIW
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
