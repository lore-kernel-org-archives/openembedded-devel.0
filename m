Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D0991772E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:05:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so24842214wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cE/zgKWt2ASho+qwIy8+j2kWuYGUOao/WwMWaL+DYq8=;
	b=LmQLDv4kkH8c0TOaupgxYXUK7ZVLPFnmfaZKiNQ1O0f0NJJMHXf7II6Hxe1jUmQeQH
	W3f2ca8T8grXzwIUCGDZ4WW7REy/sCmK/jSV9dV84leGREJB78DzI8yC78uNcmQOZ9uF
	IvXr2hddAdGm8AAu4980tJL/rPXy4us3PeqyBjIaUhj0vsZNFXQ2CwfshM9eKtBEqOcT
	z6s0Cp4r7iYIpESgHCv7IfDLobkIylQ0jEva5A2gNG++9xi7RpDk6R1CLwT8OsxGvnLn
	ABooIC+lX1opV1J07sHZnaDFEXuAMvysqLpSeA+hXmJ8Yn6nqsX8oXtOrUaVapmjAoEk
	Ykkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cE/zgKWt2ASho+qwIy8+j2kWuYGUOao/WwMWaL+DYq8=;
	b=UmapcEKRvAYT8UtxAMcE2Mcp0+usUykdzt7D6YaIxdFfb7r33Q8CPcLK7qto7k3gVJ
	RCP8HUXMuoslMXWKgSMMqon4dIP6idCYLLl/bNPUaPnOVGZxKm03WSOxjinfPQjW+qtK
	oAPmJ5XsSg8pHVz/Q0R86SHBjSiRhWMiNWDml8FL8TQdWDMwK0j5Esh8x4Q27brEiPaZ
	RozrrF4Hw3LRkVOeQ7zgAKYHl8t4zfLcjc06zeInBs0sJn2/+uZ6uZk+aXDxRvBKbfpd
	9Lh5ks14ZseQcHLZywh+C0UxO/O/6X59c1B1hXVSBm1SqkSQ2aFMuvSAQe7I9cRLJGyF
	mNZQ==
X-Gm-Message-State: AIkVDXKjTyzkbJ1ODL6e9ZOu1Vn7SoiDc+xAlHQop19gla2dL7GEEDNWlg8tTw+sGfELsg==
X-Received: by 10.28.213.133 with SMTP id m127mr354270wmg.90.1482246308491;
	Tue, 20 Dec 2016 07:05:08 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	wg8sm25959648wjb.42.2016.12.20.07.05.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 07:05:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 16:05:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220150507.GH3275@jama>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Tue, 20 Dec 2016 15:05:08 -0000
X-Groupsio-MsgNum: 64439
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline

--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 04:58:49PM +0200, Samuli Piippo wrote:
> On 20.12.2016 16:30, Martin Jansa wrote:
> > On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
> >> Changes from v3 patch:
> >> - sha1s updated to expected RC content
> >> - fixed the qt3d assimp build-deps issue
> >> - the new Qt configuration system taken into use where applicable
> >>
> >> webengine build problem with x86_64 host and x86 target is still there.
> >
> > This version seems to fail in qtwayland:
> >
> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qe=
muarm.20161218_140914.log//2_max/failed/qtwayland.log
> >
> > | ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
> > 'features.wayland-client && features.opengl && !features.opengles2 &&
> > libs.xcomposite && libs.glx' failed.
>=20
> What kind of configuration is used for qtbase?
> To me it seems that one of these checks fail: features.opengl &&=20
> !features.opengles2

The same as when building previous version of this patch.

on top of meta-qt5 default there is:

PACKAGECONFIG_GL =3D "gles2 eglfs"
PACKAGECONFIG_DISTRO =3D "sql-sqlite icu glib accessibility mtdev examples
fontconfig"

QT_CONFIG_FLAGS +=3D "-qpa wayland-egl"

=66rom meta-luneui/recipes-qt/qt5/qtbase_git.bbappend

and
PACKAGECONFIG_append_pn-qtbase =3D " freetype fontconfig"
=66rom world_fixes.inc
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20161=
217_135213.log/world_fixes.inc
>=20
> >
> > Is the configure more strict in new version or do we need to change the
> > default config for qtwayland builds?
> >
> >>
> >> -samuli
> >>
> >> On 15.12.2016 15:48, Samuli Piippo wrote:
> >>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> >>> the contents of an environment value when qmake is run instead of when
> >>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> >>> for qmake to find them. configure's setBootstrapVariable function nee=
ds
> >>> to change $$(..) to normal $(...) operator to work with qmake's Makef=
ile.
> >>>
> >>> qt.conf generation for qtbase recipes is not needed, as configure will
> >>> generate its own version based on configure arguments. Skip running
> >>> qmake, since configure is now automatically invoked when it's run in
> >>> qtbase's root folder.
> >>>
> >>> Update PACKAGECONFIGs for qtbase to match current configure options.
> >>>
> >>> The new Qt configuration system [1] can be used with a new variable
> >>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> >>> arguments.
> >>>
> >>> Merge the two qtwayland recipes to one that supports all three targets
> >>> (target, native, nativesdk) without need for additional patch.
> >>>
> >>> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.=
html
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFlIfgAKCRA3VSO3ZXaA
HCIGAJ9utgCdKw5R45uHXltmR9wFp0WZzACgicWHBKnbYMxgrcQAnxjA6i9oEO4=
=AlnF
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
