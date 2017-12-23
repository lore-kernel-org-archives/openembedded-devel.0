Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EEAC26FF84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Dec 2017 17:36:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 64so26533071wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Dec 2017 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fJpkfT4n5h8FW4bOtFOfssoq/VO+0iTtzqaMKZgjHB4=;
	b=LsNmHdw/ygwnoiIMLQXYIrd+dfzhtTdXU32puCinD9pg2O5WgJmpFZI8riJudErTQP
	LD6R/ZGCUn6KAEoE/whQ5k1NJNkBO3SReoCNK+0KtH3M5ilO3B7Vb6LwS3RcrB2nQGpe
	+D6RDYtAEfTn9whnNXdYMFj1kp9a5MAYLqNlC4nFV46ZSUX5c3Mc4FpzgbohwgfOECr+
	F7L+KmkMVnPoRJkoAVKa1dO5DOlc23JPwdUPYRmTYhzzdG22yXPVOIyXz5DmBHE70jr9
	M21MLVDOuhoH8YF6dG507UyC7NgvADyt5vp3YepEg2Fd3rl5++ILIierQU1WVhpD1ZgN
	JkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fJpkfT4n5h8FW4bOtFOfssoq/VO+0iTtzqaMKZgjHB4=;
	b=U04yCVxq1t4KYQ0ahmfA8uiVq3FCKmc3ISk2ocFutBN6/je8PATnwPJm7oWhZymoaL
	YGiwaSw8RbTIswm/FAmhqJ7OhSGcLAG+MkekQEIsUEMkNNQuKNNzYB/BZouRhc71gjT1
	+EGVY16/XqGmVGr8p+I/fvI5KMlW/GNz3qESDx4klihJyCY7sIeytj9adj5phS7AyzdT
	lE4iDQ+2NOyX3gGLc1dMI9sKe/TqD2/p8gLxLbG0jlwE6GVfO3qo2OudfSV7A/lDMKnk
	66lO7MbGMv5P97aAJDpcnzA37C5ijDc6P0ULPRVlNY/i86PuPo2BqjUabLI3tJIR1ZFK
	fdyw==
X-Gm-Message-State: AKGB3mKwdJl4yEdJHHY8VXeu61kKvoqXwNHvwYwDiopiopUXt6BPlmcB
	HOMxFfmPvqw1+gNsxdHFmz6Mcw==
X-Google-Smtp-Source: ACJfBou4E1oPmU9H1+b7xF/SDqDF17dGhe91ttNTQPqTKy9HxdGpTDH0aZnOzN8TUhtDz9eD8srvQQ==
X-Received: by 10.28.146.134 with SMTP id u128mr16089924wmd.146.1514050614519; 
	Sat, 23 Dec 2017 09:36:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j132sm48467563wmd.2.2017.12.23.09.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Dec 2017 09:36:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 23 Dec 2017 18:36:53 +0100
To: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <20171223173653.GA4390@jama>
References: <1511264578-10324-1-git-send-email-jhofstee@victronenergy.com>
	<CA+chaQe+J6XxOyDV1jcRL6g6R=Z6ZHBrEkECqUgbLc1OA+Xkvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe+J6XxOyDV1jcRL6g6R=Z6ZHBrEkECqUgbLc1OA+Xkvw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtdeclarative: fix build without opengl support
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
X-List-Received-Date: Sat, 23 Dec 2017 17:36:54 -0000
X-Groupsio-MsgNum: 70096
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 02:56:09PM +0100, Martin Jansa wrote:
> Can you please test with master-next (where is pending upgrade to 5.10), =
if
> this patch is still needed there?
>=20
> If you want to use it with 5.9, then try rocko-next (with pending upgrade
> to 5.9.3).
>=20
> All my qt5 builds have opengl enabled, so I haven't seen this issue, but
> the patch as is doesn't apply on top of 5.10 upgrade (so I've just dropped
> it from master-next).

It doesn't apply with 5.9.3 as well, so I'll drop it from rocko-next as
well and wait for you to resend it with indication which branch actually
needs it.

>=20
> On Tue, Nov 21, 2017 at 12:42 PM, Jeroen Hofstee <jhofstee@victronenergy.=
com
> > wrote:
>=20
> > Don't build the qtdeclarative opengl example without opengl support,
> > since it causes a build error. The included patch comes from buildroot.
> >
> > Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> > ---
> >  ...uickviewcomparison-and-quickwidget-needs-.patch | 58
> > ++++++++++++++++++++++
> >  recipes-qt/qt5/qtdeclarative_git.bb                |  2 +
> >  2 files changed, 60 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtdeclarative/0002-examples-
> > qquickviewcomparison-and-quickwidget-needs-.patch
> >
> > diff --git a/recipes-qt/qt5/qtdeclarative/0002-examples-
> > qquickviewcomparison-and-quickwidget-needs-.patch b/recipes-qt/qt5/
> > qtdeclarative/0002-examples-qquickviewcomparison-and-
> > quickwidget-needs-.patch
> > new file mode 100644
> > index 0000000..875634f
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-a=
nd-
> > quickwidget-needs-.patch
> > @@ -0,0 +1,58 @@
> > +From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Tue, 16 May 2017 19:47:19 +0200
> > +Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs
> > OpenGL
> > + support
> > +
> > +Fixes:
> > +
> > +  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_
> > ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to
> > `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
> > +  .obj/main.o: In function `QQmlPrivate::QQmlElement<
> > FbItem>::~QQmlElement()':
> > +  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_
> > ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to
> > `vtable for QQuickFramebufferObject'
> > +  .obj/main.o: In function `QQmlPrivate::QQmlElement<
> > FbItem>::~QQmlElement()':
> > +  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_
> > ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to
> > `vtable for QQuickFramebufferObject'
> > +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> > ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to
> > `QQuickFramebufferObject::isTextureProvider() const'
> > +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> > ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to
> > `QQuickFramebufferObject::textureProvider() const'
> > +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> > ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to
> > `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> > +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> > ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to
> > `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::
> > UpdatePaintNodeData*)'
> > +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> > ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to
> > `QQuickFramebufferObject::releaseResources()'
> > +  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
> > +  moc_fbitem.cpp:(.text+0x70): undefined reference to
> > `QQuickFramebufferObject::qt_metacast(char const*)'
> > +  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Cal=
l,
> > int, void**)':
> > +  moc_fbitem.cpp:(.text+0x80): undefined reference to
> > `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
> > +  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> > +  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined
> > reference to `vtable for QQuickFramebufferObject'
> > +  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> > +  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined
> > reference to `vtable for QQuickFramebufferObject'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typein=
fo
> > for QQuickFramebufferObject'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to
> > `QQuickFramebufferObject::isTextureProvider() const'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to
> > `QQuickFramebufferObject::textureProvider() const'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to
> > `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to
> > `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::
> > UpdatePaintNodeData*)'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to
> > `QQuickFramebufferObject::releaseResources()'
> > +  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to
> > `QQuickFramebufferObject::staticMetaObject'
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + examples/quick/quick.pro | 5 ++++-
> > + 1 file changed, 4 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> > +index 445dfb0fa..26ca0138e 100644
> > +--- a/examples/quick/quick.pro
> > ++++ b/examples/quick/quick.pro
> > +@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
> > + # Widget dependent examples
> > + qtHaveModule(widgets) {
> > +     SUBDIRS +=3D embeddedinwidgets
> > +-    qtHaveModule(quickwidgets): SUBDIRS +=3D quickwidgets
> > ++    # OpenGL Support Required
> > ++    qtConfig(opengl(es1|es2)?) {
> > ++        qtHaveModule(quickwidgets): SUBDIRS +=3D quickwidgets
> > ++    }
> > + }
> > +
> > + EXAMPLE_FILES =3D \
> > +--
> > +2.11.0
> > +
> > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> > qtdeclarative_git.bb
> > index 4ae870a..c9915af 100644
> > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > @@ -32,4 +32,6 @@ EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKA=
GECONFIG',
> > 'qtxmlpatterns', '
> >
> >  SRCREV =3D "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
> >
> > +SRC_URI +=3D "file://0002-examples-qquickviewcomparison-and-
> > quickwidget-needs-.patch"
> > +
> >  BBCLASSEXTEND =3D+ "native nativesdk"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWj6UNQAKCRA3VSO3ZXaA
HAr4AKCB7x2Dub0+Ipd16DE2fy+CdIRsHwCfbgoyzt/iYHiytqTtAO/eA7br/L4=
=mqOM
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
