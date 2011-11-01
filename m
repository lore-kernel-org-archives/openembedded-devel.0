Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9Qh-0007hw-BY
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:10:43 +0100
Received: by faas16 with SMTP id s16so6971158faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FMDu+32pM4Swb7/pXu8bpVT5UmZwNQV04+T83xy1sJ4=;
	b=m5TiTBG7KGDMCixY2MTmMBgvsIR3r+rqXC78DqZ6Ol7CjtH0YB/13u/+cUYpY48l9D
	kjVS7uQKzkSJAs/H7vjOyIx9Gv+ctpbZTk4/ok8eUFTkJSEJRdbbDeor8cfglzss4DWr
	SqAoeRsREpCCRGdv8Mnw6d26nYd0JA6qfUDFQ=
Received: by 10.223.17.23 with SMTP id q23mr35363481faa.11.1320134674419;
	Tue, 01 Nov 2011 01:04:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k16sm43239673fab.8.2011.11.01.01.04.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:04:32 -0700 (PDT)
Date: Tue, 1 Nov 2011 09:04:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111101080426.GA4714@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<c5be2d9dea4e1914eb73f39af1517d457ef92f3a.1319884094.git.Martin.Jansa@gmail.com>
	<j8o8gg$4gv$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j8o8gg$4gv$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][meta-oe 10/12] task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be able to select different -common and init providers
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
X-List-Received-Date: Tue, 01 Nov 2011 08:10:43 -0000
X-Groupsio-MsgNum: 35134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 08:52:48AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 29-10-11 12:29, Martin Jansa schreef:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> [..]
>=20
> > -# Some machines don't set a *runtime* provider for X, so default to
> > Xfbdev here -# virtual/xserver won't work, since the kdrive recipes will
> > build multiple xserver packages -XSERVER ?=3D "xserver-xorg"=20
> > -XSERVER_COMMON ?=3D "xserver-common" - -PACKAGE_ARCH =3D "${MACHINE_AR=
CH}"=20
> > +# xserver-common, x11-common +VIRTUAL-RUNTIME_xserver-common ?=3D
> > "xserver-common"
> >=20
> > -RDEPENDS_${PN}-server =3D "\ -  ${XSERVER} \ -" +# elsa,
> > xserver-nodm-init +VIRTUAL-RUNTIME_graphical_init_manager ?=3D
> > "xserver-nodm-init"
> >=20
> > RDEPENDS_${PN}-utils =3D "\ -  ${XSERVER_COMMON} \ -  xserver-nodm-init=
 \ +
> > ${VIRTUAL-RUNTIME_xserver-common} \ +
> > ${VIRTUAL-RUNTIME_graphical_init_manager} \ xauth \ xhost \ xset \
>=20
> Can someone explain what the VIRTUAL-RUNTIME_* buys us? I'd be much happi=
er
> if you split this into two or more tasks. Experience has shown that people
> just don't get that they need to change all the PRs in the tasks when
> updating magic vars like VIRTUAL-RUNTIME_* :(

Right now I'm using them to use x11-common instead of xserver-common and
elsa instead of xserver-nodm-init, while my image is still depending
only on task-x11 (to get reasonable x11 support).

And those VIRTUAL-RUNTIME with default value should keep task-x11 as it
was before and if some distribution decide to change them, they have to
PRINC in their bbappend.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6vqAoACgkQN1Ujt2V2gBzHlQCggtVSLeMcO7ZGUTXHHsMAYCaO
sZcAn3nJaLAzh58uyLdDluJ+kKa555j3
=Pes0
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
