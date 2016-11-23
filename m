Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9017671A87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:52:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so2857029wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3qUcWd4Gm46sRkr2ZRdtHlwavqFg4OwPqdixhLD+GEM=;
	b=qhlN3atiLlh6GILDu18+lAIvl4MXd+FR10tXWPkh0HLYvSzbl0cJ8JWP+s1D+bqPgS
	B6vqDbK0oeuN/UltlzgXzHl0UbV3jYEP4iFEbdd+Bylr76Jb30VdouRgAxiQ9r45jJt4
	pyW9URIPy2PTehz0d5nrSeidOF00qbF8xYzoEPd6oC4zw2OBVD3IgBkSmmnwT8DyqBo8
	NLK13gMi2Bh47blbAIrxPhO2TcBGA7PX1wco9MWVX9liTlaKo9z9jH0ER+x7YDBxjchz
	8uR3a369qxDAR6ZMKLGwMvpwesaQyie57xg4YDau9aJojP61g+2w1Q44ETjgZ85P+Cfp
	Jy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3qUcWd4Gm46sRkr2ZRdtHlwavqFg4OwPqdixhLD+GEM=;
	b=kuGgPA9x+BtOgJQv4yLSBF1sXolcF0DqfBbmsHTOkwOVWcGxhg6mK/hru2nKUvP9JR
	vTg2JuTxqIdaJOvdFx12Rx/l3zCgiRjtmUwTys9JnHq1qzUvRDwZpkaBR345xKORHr4C
	MU4dswAOqgq7TO8KiRizzyvRxiGopUZq5MwTV2iRbyDht311hwM7KZQc48YU8f2pOy10
	yg07A0a+S1lpTtqyF+L4TQwpuXAB/16aEcQ4HeJKnmh/GS/77puAr1YYrcWdouMGkVR1
	EtC/vRy+f6XzNSSuCDDp4QKp5fJ5KuQ+PUXIzdBOngApAwK1yareTKzWtDmCg8GEampQ
	bQPg==
X-Gm-Message-State: AKaTC03P0tY+Cv9c0aTiC02EtN0DxFjZcMJO0HNPpf+hI1ChPt2Qo4cB1XNsAw+vjX1HMQ==
X-Received: by 10.28.182.70 with SMTP id g67mr9232882wmf.90.1479927170025;
	Wed, 23 Nov 2016 10:52:50 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w79sm4194618wmw.0.2016.11.23.10.52.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 10:52:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 19:52:51 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161123185251.GG3265@jama>
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama> <20161123154346.GD3265@jama>
MIME-Version: 1.0
In-Reply-To: <20161123154346.GD3265@jama>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-qt5][PATCHv2] Upgrade to Qt 5.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 18:52:50 -0000
X-Groupsio-MsgNum: 64017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline

--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 04:43:46PM +0100, Martin Jansa wrote:
> On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
> > On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
> > > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> > > the contents of an environment value when qmake is run instead of when
> > > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> > > for qmake to find them. configure's setBootstrapVariable function nee=
ds
> > > to change $$(..) to normal $(...) operator to work with qmake's Makef=
ile.
> > >=20
> > > qt.conf generation for qtbase recipes is not needed, as configure will
> > > generate its own version based on configure arguments. Skip running
> > > qmake, since configure is now automatically invoked when it's run in
> > > qtbase's root folder.
> > >=20
> > > Update PACKAGECONFIGs for qtbase to match current configure options.
> > >=20
> > > Merge the two qtwayland recipes to one that supports all three targets
> > > (target, native, nativesdk) without need for additional patch.
> > >=20
> > > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> > > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > > ---
> ...
> > > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > > index e1e25ba..a1dd16a 100644
> > > --- a/recipes-qt/qt5/qt5-git.inc
> > > +++ b/recipes-qt/qt5/qt5-git.inc
> > > @@ -2,7 +2,7 @@
> > >  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> > > =20
> > >  QT_MODULE ?=3D "${BPN}"
> > > -QT_MODULE_BRANCH ?=3D "5.7"
> > > +QT_MODULE_BRANCH ?=3D "5.8"
> > >  QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH}"
> > > =20
> > >  # each module needs to define valid SRCREV
> > > @@ -12,4 +12,4 @@ SRC_URI =3D " \
> > > =20
> > >  S =3D "${WORKDIR}/git"
> > > =20
> > > -PV =3D "5.7.0+git${SRCPV}"
> > > +PV =3D "5.8.0+git${SRCPV}"
> >=20
> > This version is wrong as 5.8.0 wasn't released yet (was it?), so this PV
> > shouldn't sort higher then 5.8.0 release.
> >=20
> > I'll change it to:
> > 5.7.99+5.8.0-beta+git${SRCPV}
> > like I did in previous releases.
> >=20
> > Regards,
> ...
>=20
> There is also some issue with qtwayland and qtenginio reported in:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110021.html
>=20
> I'm trying to reproduce it with only oe-core+meta-qt5, because the qtwayl=
and
> one might be caused by bbappend in meta-luneui, but qtenginio might be
> easier to reproduce.

Local build confirmed that qtwayland issue was caused by that bbappend,
but qtenginio error is still there and I've also noticed that with:

PACKAGECONFIG_append_pn-qtbase =3D " icu gl accessibility directfb examples=
 kms"
PACKAGECONFIG_remove_pn-qtbase =3D "gl"

qtbase.do_compile fails with:
http://errors.yoctoproject.org/Errors/Details/107134/
and this configuration was working with 5.7 version, is directfb
unsupported now in 5.8 or does it just need some tweaks in qtbase
PACKAGECONFIGs?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDXlggAKCRA3VSO3ZXaA
HNs8AJ9hwmk0PBBXOnGjdpWgyzxUSqIBrACgrBCRDj5W2dw6y4AeEeankTbRThs=
=w9r4
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
