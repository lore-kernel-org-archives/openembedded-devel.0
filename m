Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5996071F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 18:47:52 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id hb5so36238883wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 10:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QabVxaWFMYKjusBnDpW1LOyuG0bu1vysa//7L/WjYKs=;
	b=kjcwsDCtWpJl1oTW0Fo8j44KcZbwrgHomCWdCZ+OObBLAlhlo0IV3g0cQKbrOTNmZ7
	rA6ea+oL0x/pcbxC0V++3mN6z8Ni7wK1KoefnLvME7/2CgSdNftKti8HbFmOHBKkvpxk
	VlcITf+iYFkhF9durmitXehKarwMUB0Q+O4/nTbQhsM+EAx8e1mzAkFI96EZ5QZmuvoB
	CIUkv9IOBk9Q6ABdNV6SzTw7RKGrTIEviUt/Xj1WA906ZJWzc/fgKKBCA5MFWae1R8Uk
	YoSFwZd2Sjv0dwIQdIRdIafrgIJa+p9qOOZpEoXPipG6z8+hKimv4JPTOmGPUHyGH7H3
	Ir/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QabVxaWFMYKjusBnDpW1LOyuG0bu1vysa//7L/WjYKs=;
	b=Jkbd6Pufext0adk64dtAFmaiJSZxv5MwPb2nkM+XzmiDO4bQZap6dyjkMcGrwWvoxB
	XwnYHEhfIH7E2sywSyl0ZtXvHq9OijX65caBwwGXg2JkuUoBr46sg7hAE23A2jqwuTg4
	dkM5yW85FcA9ca4TyH+gaxIxuAHheX5Uc4MdIcQUe+9hydOAehItvOwMQzafHAsPsANs
	75rPINswa4l93QEmun99Zi3TJ1qzjmCaenca4J1n8aT/HLUZL97RNIwTVszpabLyUoj0
	IY7Pc06ieVx0yAIj27I1OniiGsNShdiK60tpm4Y89it/HFrPOuLZvrlYUgNwWlkgw0eS
	rMgg==
X-Gm-Message-State: AIkVDXIhKx1UU1KXeKLhuSJIS5QMSDXG0jex0I+drkbqvn1UqkE6hu6RH+jlkdrVRlgg3Q==
X-Received: by 10.194.98.208 with SMTP id ek16mr60574968wjb.94.1483382872478; 
	Mon, 02 Jan 2017 10:47:52 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i10sm89335379wjd.15.2017.01.02.10.47.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jan 2017 10:47:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Jan 2017 19:47:51 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170102184751.GC3954@jama>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
	<bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
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
X-List-Received-Date: Mon, 02 Jan 2017 18:47:53 -0000
X-Groupsio-MsgNum: 64602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 05:30:11PM +0200, Samuli Piippo wrote:
> On 20.12.2016 17:05, Martin Jansa wrote:
> > On Tue, Dec 20, 2016 at 04:58:49PM +0200, Samuli Piippo wrote:
> >> On 20.12.2016 16:30, Martin Jansa wrote:
> >>> On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
> >>>> Changes from v3 patch:
> >>>> - sha1s updated to expected RC content
> >>>> - fixed the qt3d assimp build-deps issue
> >>>> - the new Qt configuration system taken into use where applicable
> >>>>
> >>>> webengine build problem with x86_64 host and x86 target is still the=
re.
> >>>
> >>> This version seems to fail in qtwayland:
> >>>
> >>> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.=
qemuarm.20161218_140914.log//2_max/failed/qtwayland.log
> >>>
> >>> | ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
> >>> 'features.wayland-client && features.opengl && !features.opengles2 &&
> >>> libs.xcomposite && libs.glx' failed.
> >>
> >> What kind of configuration is used for qtbase?
> >> To me it seems that one of these checks fail: features.opengl &&
> >> !features.opengles2
> >
> > The same as when building previous version of this patch.
> >
> > on top of meta-qt5 default there is:
> >
> > PACKAGECONFIG_GL =3D "gles2 eglfs"
>=20
> The gles2 here causes the failure, since xcomposite-glx checks for=20
> "!features.opengles2"
> This makes sense since you want to have desktop opengl enabled together=
=20
> with wayland GLX.

Then is it correct to enable both xcomposite-egl and xcomposite-glx for
x11 in DISTRO_FEATUREs?

Without this change in qtwayland_git.bb:

-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx', =
'', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcomposite-egl xcompos=
ite-glx', '', d)} \

I can build again with that configuration.

> > PACKAGECONFIG_DISTRO =3D "sql-sqlite icu glib accessibility mtdev examp=
les
> > fontconfig"
> >
> > QT_CONFIG_FLAGS +=3D "-qpa wayland-egl"
> >
> > from meta-luneui/recipes-qt/qt5/qtbase_git.bbappend
> >
> > and
> > PACKAGECONFIG_append_pn-qtbase =3D " freetype fontconfig"
> > from world_fixes.inc
> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.2=
0161217_135213.log/world_fixes.inc
> >>
> >>>
> >>> Is the configure more strict in new version or do we need to change t=
he
> >>> default config for qtwayland builds?
> >>>
> >>>>
> >>>> -samuli
> >>>>
> >>>> On 15.12.2016 15:48, Samuli Piippo wrote:
> >>>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> >>>>> the contents of an environment value when qmake is run instead of w=
hen
> >>>>> Makefile is processed. All OE_QMAKE_xxx variables need to be export=
ed
> >>>>> for qmake to find them. configure's setBootstrapVariable function n=
eeds
> >>>>> to change $$(..) to normal $(...) operator to work with qmake's Mak=
efile.
> >>>>>
> >>>>> qt.conf generation for qtbase recipes is not needed, as configure w=
ill
> >>>>> generate its own version based on configure arguments. Skip running
> >>>>> qmake, since configure is now automatically invoked when it's run in
> >>>>> qtbase's root folder.
> >>>>>
> >>>>> Update PACKAGECONFIGs for qtbase to match current configure options.
> >>>>>
> >>>>> The new Qt configuration system [1] can be used with a new variable
> >>>>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> >>>>> arguments.
> >>>>>
> >>>>> Merge the two qtwayland recipes to one that supports all three targ=
ets
> >>>>> (target, native, nativesdk) without need for additional patch.
> >>>>>
> >>>>> [1] https://www.mail-archive.com/development@qt-project.org/msg2525=
7.html
> >>>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>>
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

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWGqgVwAKCRA3VSO3ZXaA
HIfgAJQPP0LDsDqKOM/BA9oKeXbTJeXTAKCmaDq5vASIgSTxwL3pzrE4EkJVHQ==
=mxq3
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
