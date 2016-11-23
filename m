Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C072F60620
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 20:14:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so3029894wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Nwjht59Mw6BbejBppd5ROcumWpBVMdlW1eoCcEPrSbc=;
	b=YrO+ldhsmC9LJXlP7mUEtwcvsObOxlLkhBQ4J79jKeHQWmQZtlsCWtvKkrC9dAL7G7
	+RTYNhOqrZChx637N2s0eRFTHJ5eaBXgIAI0d1S6osQRIW7u6oM8xnxw9EdkP1Wdfxu+
	dPMCxcRxMg2V1E/J3+Jc2UlwWRif2R7PRzwjAXCTk/Csk3xbQ+6aQfMC36gFwNUHz5Ph
	Xb49N0Sp8wrA+ueUZEOobl8uMLLXh2l8MAZsjDWPh1PeoORswziNLSVf7GXivvHKokaY
	G7GjubTcoB/Sy15TSwJtWeiZgVRFuyBMrynRBMCQNZAuNWXWfZnjBjSsb9qZwE+Bjxp6
	YVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Nwjht59Mw6BbejBppd5ROcumWpBVMdlW1eoCcEPrSbc=;
	b=Kzd9vTIQBeFeT+Pnuy6l1oQDE5smaKCTaUfTPp+Rilu3me5S/N08BF7Hq6tfCO74B2
	2fWVlhEYXVQ8njnEYO0LozQirq4/zCM7Pq4d8PYW6JuC+D40FTM1+x57JtU94TtS8i+Y
	6M5efsF6mJyYGzddhrhhsER8b6Jd4t+e+dB/m7/bRO9DKqVRWEAl3A9eI/rlXqxNqEGV
	qw/EYUYnRGijTsQVDUtrULhcsCRtty5Tkd3qrhwpV3DaElhYDRIJ0mHVEdaBRf+KyNgC
	EYT4Th1ysLGNMI7oAujOSCaop0/XemY+TQm7oh9K6ItAH8chbEl1fLuT9xmu/cwTpiIS
	8tgA==
X-Gm-Message-State: AKaTC02zmjknRCNYY3W/QARY0V5+nxRyudjrXfgOAw9POz3beoAtDWDbz5fOHgIfRGrPFA==
X-Received: by 10.28.57.193 with SMTP id g184mr4843053wma.122.1479932070727;
	Wed, 23 Nov 2016 12:14:30 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m145sm4491563wma.3.2016.11.23.12.14.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 12:14:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 21:14:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161123201431.GI3265@jama>
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama> <20161123154346.GD3265@jama>
	<20161123185251.GG3265@jama>
MIME-Version: 1.0
In-Reply-To: <20161123185251.GG3265@jama>
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
X-List-Received-Date: Wed, 23 Nov 2016 20:14:31 -0000
X-Groupsio-MsgNum: 64018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Content-Disposition: inline

--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 07:52:51PM +0100, Martin Jansa wrote:
> On Wed, Nov 23, 2016 at 04:43:46PM +0100, Martin Jansa wrote:
> > On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
> > > On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
> > > > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> > > > the contents of an environment value when qmake is run instead of w=
hen
> > > > Makefile is processed. All OE_QMAKE_xxx variables need to be export=
ed
> > > > for qmake to find them. configure's setBootstrapVariable function n=
eeds
> > > > to change $$(..) to normal $(...) operator to work with qmake's Mak=
efile.
> > > >=20
> > > > qt.conf generation for qtbase recipes is not needed, as configure w=
ill
> > > > generate its own version based on configure arguments. Skip running
> > > > qmake, since configure is now automatically invoked when it's run in
> > > > qtbase's root folder.
> > > >=20
> > > > Update PACKAGECONFIGs for qtbase to match current configure options.
> > > >=20
> > > > Merge the two qtwayland recipes to one that supports all three targ=
ets
> > > > (target, native, nativesdk) without need for additional patch.
> > > >=20
> > > > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> > > > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > > > ---
> > ...
> > > > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > > > index e1e25ba..a1dd16a 100644
> > > > --- a/recipes-qt/qt5/qt5-git.inc
> > > > +++ b/recipes-qt/qt5/qt5-git.inc
> > > > @@ -2,7 +2,7 @@
> > > >  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> > > > =20
> > > >  QT_MODULE ?=3D "${BPN}"
> > > > -QT_MODULE_BRANCH ?=3D "5.7"
> > > > +QT_MODULE_BRANCH ?=3D "5.8"
> > > >  QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH}"
> > > > =20
> > > >  # each module needs to define valid SRCREV
> > > > @@ -12,4 +12,4 @@ SRC_URI =3D " \
> > > > =20
> > > >  S =3D "${WORKDIR}/git"
> > > > =20
> > > > -PV =3D "5.7.0+git${SRCPV}"
> > > > +PV =3D "5.8.0+git${SRCPV}"
> > >=20
> > > This version is wrong as 5.8.0 wasn't released yet (was it?), so this=
 PV
> > > shouldn't sort higher then 5.8.0 release.
> > >=20
> > > I'll change it to:
> > > 5.7.99+5.8.0-beta+git${SRCPV}
> > > like I did in previous releases.
> > >=20
> > > Regards,
> > ...
> >=20
> > There is also some issue with qtwayland and qtenginio reported in:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-Novembe=
r/110021.html
> >=20
> > I'm trying to reproduce it with only oe-core+meta-qt5, because the qtwa=
yland
> > one might be caused by bbappend in meta-luneui, but qtenginio might be
> > easier to reproduce.
>=20
> Local build confirmed that qtwayland issue was caused by that bbappend,
> but qtenginio error is still there and I've also noticed that with:
>=20
> PACKAGECONFIG_append_pn-qtbase =3D " icu gl accessibility directfb exampl=
es kms"
> PACKAGECONFIG_remove_pn-qtbase =3D "gl"
>=20
> qtbase.do_compile fails with:
> http://errors.yoctoproject.org/Errors/Details/107134/
> and this configuration was working with 5.7 version, is directfb
> unsupported now in 5.8 or does it just need some tweaks in qtbase
> PACKAGECONFIGs?

directfb_egl was introduced to qtConfig in:

commit 60985aa42b37217fb4c01ed85bbf6f14410c3491
Author: Lars Knoll <lars.knoll@qt.io>
Date:   Fri Aug 5 13:35:39 2016 +0200

    Use qtConfig throughout in qtbase

=2E..

index d4977bf..de0344f 100644
--- a/src/plugins/platforms/directfb/directfb.pro
+++ b/src/plugins/platforms/directfb/directfb.pro
@@ -24,7 +24,7 @@ HEADERS =3D qdirectfbintegration.h \
     qdirectfbeglhooks.h
=20
 # ### port the GL context
-contains(QT_CONFIG, directfb_egl) {
+qtConfig(directfb_egl) {
     HEADERS +=3D qdirectfb_egl.h
     SOURCES +=3D qdirectfb_egl.cpp
     DEFINES +=3D DIRECTFB_GL_EGL


But there is no directfb_egl in src/gui/configure.json

> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDX4nAAKCRA3VSO3ZXaA
HOENAJ97AihbJZ/LnXePtwwis2PGC8IgRACgn/UMbLxN0B2sytfLEBEj4AgAn2A=
=Igd1
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--
