Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E951E608CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:06:20 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so4009045eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M0o3DarfkPBEjfY46vh6QtvfSFV7tMzhy5TPgFzCn+Y=;
	b=D74ezCmmvf64toayZb+6X0EJzVeAk36oCdx01+Sz7n39MsMoD6zG+P0a4xkPU49DTe
	OHHyw/86hx09R5XqHONgfjG8qPTU8wcg0NIB9gruyeTUCxq22gt1Oy79v6K6T2cCBjY/
	TN0KdenBAlQD5FMP7jhp1SEKubMzgobLv5mlvBXAJ0uj8QgLa5PW4j9kpIKpdbh5Z8tt
	/AwjqZgB2CgZ73T4Fziit4V5EM9fiFsb54rSuo1FVYF68Zd/1Updje45LB8YodXHLUL3
	TRlW69aGE2m0h5E7gPruFQdnXCZscOd2lBeheqt35CISp5F5010wbLJOuAV1/B0E6W0g
	A75g==
X-Received: by 10.14.2.137 with SMTP id 9mr7703923eef.64.1371740781019;
	Thu, 20 Jun 2013 08:06:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm995251eeh.11.2013.06.20.08.06.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 08:06:20 -0700 (PDT)
Date: Thu, 20 Jun 2013 17:06:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130620150652.GH14021@jama>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Issues with Qt5/mesa and eglfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 15:06:21 -0000
X-Groupsio-MsgNum: 45183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline

--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2013 at 09:15:24AM -0400, Nicolas Dechesne wrote:
> hi there,
>=20
> i am trying to build Qt5/meta-qt5 with dylan branch in a non X11 distro,
> and i got failures during the Qt5 configure step (when auto-detecting EGL
> feature). Looking into the issue, the good news is that it seems to be
> fixed in oe-core/master with:
>=20
> d7033f4 mesa: upgrade to 9.1.3
>=20
> thanks to this :
>=20
>     Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
> correctly in
>     a non-X11 environment.
>=20
>     Drop dont-fail-if-libX11-isnt-installed.patch and
>     fix-egl-compilation-without-x11-headers.patch as they were backports.
>=20
>=20
> Would you guys consider 'backporting' this patch onto dylan a viable thin=
g?
> I will make the backport, but it would be nice if you can confirm that it
> can be merged in dylan.

You should be able to build qtbase with mesa from dylan if you add
CFLAGS_append =3D " -DMESA_EGL_NO_X11_HEADERS"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHDGowACgkQN1Ujt2V2gByGUgCfbm4YcAZhxG/6Vi0SOWHirALA
k4wAn0Bzt8/TZ+t151HqcLRrIxDSDZ8n
=KfNF
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
