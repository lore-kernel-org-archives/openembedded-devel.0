Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 32D7D719EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:43:44 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id jb2so1313396wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/6m2jT860g92r/RkRs9/647ATEWmZJ0JuOoqslHZnjg=;
	b=by9AKO1LAQOZJEQlUisJ9URN3IeyLZ6xVljesm5RGP6osWBlSRFGYrHzTigxi3eukL
	s2lkYiHU9M5NNKWM1CUAJczIGhEapxp+zxIg35e/EH1EAZgMBGuiWBxFw6VHSjOM+kD/
	i3+vy02cmSV8SAccEJdOKUJLKd7aZdocTXXmJzgcgXx0SZzePpFk/do/Vg4jB2YUe/qU
	pHzg9n6+5Mg+0wufRRPK/OD2OhBWRy5C5uVPAlm4pGJlMeQxPGNeCUY8KV9iXOO7mukS
	fk0FJb8YlVNglbhRLbN+49xjSFUck7iBzDz4OusU5AHCqzeMsZgJRA9JCOWisw6WilPE
	+Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/6m2jT860g92r/RkRs9/647ATEWmZJ0JuOoqslHZnjg=;
	b=ZRnkuGf6gEHKDkKxHgjpoD+K/kjLwyh/YxrInzxU+ut3m6DiSpbbLGqxTXv3bB4n4W
	jKTz4nww/UrkhC/4b4e2Vxqlfn/HNM9RlOVtKcWKfX6DIi9k98N5JdACaJryu3xX1/MI
	3Y/27EHb80156kWPwfzserlmwG7QQJhZ3D9WznwRx+cZ9UnswxqgSegSMRTjBm0+9Rzx
	VnhpP1Yrgdwb+fhyYiQdCGkfA13V4OMkWsMYCjcc4nQ2AYJ2JRnJzOXjBlf6ijP7XVQN
	u6l4oTzOUwATh2nPNeT29Gpn9P22WZdeLTtCCJYUC4FebnKiP4uY6iCXY9rIXlcuNC6m
	5knw==
X-Gm-Message-State: AKaTC01EGKA7Wth7JQK7DYARR5qjfhPx+9NEfGPyp7ABw1ctyH1OUpqHx5+2UocnYJrFew==
X-Received: by 10.194.107.97 with SMTP id hb1mr3745300wjb.134.1479915825747;
	Wed, 23 Nov 2016 07:43:45 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w8sm3391787wmw.4.2016.11.23.07.43.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 07:43:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 16:43:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161123154346.GD3265@jama>
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama>
MIME-Version: 1.0
In-Reply-To: <20161123152941.GC3265@jama>
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
X-List-Received-Date: Wed, 23 Nov 2016 15:43:45 -0000
X-Groupsio-MsgNum: 64015
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
> On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
> > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> > the contents of an environment value when qmake is run instead of when
> > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> > for qmake to find them. configure's setBootstrapVariable function needs
> > to change $$(..) to normal $(...) operator to work with qmake's Makefil=
e.
> >=20
> > qt.conf generation for qtbase recipes is not needed, as configure will
> > generate its own version based on configure arguments. Skip running
> > qmake, since configure is now automatically invoked when it's run in
> > qtbase's root folder.
> >=20
> > Update PACKAGECONFIGs for qtbase to match current configure options.
> >=20
> > Merge the two qtwayland recipes to one that supports all three targets
> > (target, native, nativesdk) without need for additional patch.
> >=20
> > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
=2E..
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index e1e25ba..a1dd16a 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -2,7 +2,7 @@
> >  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> > =20
> >  QT_MODULE ?=3D "${BPN}"
> > -QT_MODULE_BRANCH ?=3D "5.7"
> > +QT_MODULE_BRANCH ?=3D "5.8"
> >  QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH}"
> > =20
> >  # each module needs to define valid SRCREV
> > @@ -12,4 +12,4 @@ SRC_URI =3D " \
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > -PV =3D "5.7.0+git${SRCPV}"
> > +PV =3D "5.8.0+git${SRCPV}"
>=20
> This version is wrong as 5.8.0 wasn't released yet (was it?), so this PV
> shouldn't sort higher then 5.8.0 release.
>=20
> I'll change it to:
> 5.7.99+5.8.0-beta+git${SRCPV}
> like I did in previous releases.
>=20
> Regards,
=2E..

There is also some issue with qtwayland and qtenginio reported in:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0021.html

I'm trying to reproduce it with only oe-core+meta-qt5, because the qtwayland
one might be caused by bbappend in meta-luneui, but qtenginio might be
easier to reproduce.

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDW5MgAKCRA3VSO3ZXaA
HPOVAJ9Dpsb2dUJtsvBespbu8UmvDrO6BgCgp9bvDTzou5E4P71bDZFTvFdgznQ=
=DW3h
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
