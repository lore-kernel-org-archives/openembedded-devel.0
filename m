Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E6B1761624
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 16:14:42 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so2230368eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 08:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MrVc2dEX8xEIzg3tgwfb7fsSvJRQHZf3fn8IEZe1OwQ=;
	b=nh9I2m1P0aeXBgZePwRipaoM0EG2pBYrnCtNEL5FL82Leh0ukyEC7PxAvZd/mWyRHk
	w7D9ZoSUGla83g7CY+OAI9HAdO/VWC1x32OQgWRTt8v8X6PmXXYTcAzTKtSJn2Xv3Z1m
	OkmpLfEzxn6r3W1ydd/U6FZgQNNSukRuRA6pcRs9LPtOTYWHFFPzu8ZjF11PFiu5fDJB
	T80sgFushlDs9/niwZy7DglhUO9u8OQKUHRdtWCAM4IFw3wd1nxdUc00KkB5OL4XzaNM
	HMazPGX17eWrAbzb1rPWGyzGltILOn9cAZYW4FCavGKeLlgpoV09d5GAzoA9bypWaYGw
	nrqQ==
X-Received: by 10.14.95.194 with SMTP id p42mr3522370eef.88.1389975283282;
	Fri, 17 Jan 2014 08:14:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x2sm25364168eeo.8.2014.01.17.08.14.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 08:14:42 -0800 (PST)
Date: Fri, 17 Jan 2014 17:15:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140117161506.GO3742@jama>
References: <1389970758-23207-1-git-send-email-schnitzeltony@googlemail.com>
	<20140117153310.GM3742@jama>
MIME-Version: 1.0
In-Reply-To: <20140117153310.GM3742@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qttools: add target build
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
X-List-Received-Date: Fri, 17 Jan 2014 16:14:44 -0000
X-Groupsio-MsgNum: 47803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRkqPRiqIDKgfg/F"
Content-Disposition: inline

--TRkqPRiqIDKgfg/F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 04:33:10PM +0100, Martin Jansa wrote:
> On Fri, Jan 17, 2014 at 03:59:18PM +0100, Andreas M=FCller wrote:
> > this does not build much yet but I was looking for qdbus
>=20
> Do you want me to merge it now or should I wait a bit more? "build much"
> means that it builds OK, but only some tools, right?
> =20
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  recipes-qt/qt5/qttools.inc                         | 12 ++++++++
> >  ...t-help-fix-linking-of-dependent-libraries.patch | 32 ++++++++++++++=
++++++++
> >  recipes-qt/qt5/qttools_5.2.0.bb                    |  5 ++++
> >  3 files changed, 49 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qttools.inc
> >  create mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-link=
ing-of-dependent-libraries.patch
> >  create mode 100644 recipes-qt/qt5/qttools_5.2.0.bb
> >=20
> > diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
> > new file mode 100644
> > index 0000000..e96a678
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qttools.inc
> > @@ -0,0 +1,12 @@

I agree with you (from 2nd reply in thread) and plan to merge it this
weekend (after world build is finished) with following nitpicks I
already did locally (no need to send v2):

> > +DEPENDS +=3D "qtbase"

moved after require.

> > +QT_MODULE =3D "qttools"

dropped because it's set in qt5.inc (only -native/nativesdk- need it).

> > +require qt5.inc
> > +
> > +SRC_URI +=3D " \
> > +	file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \

replaced tab with 4 spaces

> > +"
> > +
> > +FILES_${PN}-examples =3D "${datadir}/${QT_DIR_NAME}/examples"
> > +

dropped blank line

> > diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-=
dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-=
linking-of-dependent-libraries.patch
> > new file mode 100644
> > index 0000000..0f95333
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-depende=
nt-libraries.patch
> > @@ -0,0 +1,32 @@
> > +From 26228d3ed02a4a244d01b3cc2bf3633f25797bb7 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > +Date: Fri, 17 Jan 2014 14:33:19 +0100
> > +Subject: [PATCH] assistant/help: fix linking of dependent libraries
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +else we get:
> > +| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not =
found (try using -rpath or -rpath-link)
> > +| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
>=20
> This looks familiar, IIRC I was getting similar issues before disabling
> other parts of qttools-native (as we were interested only in l* tools)
>=20
> 0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
>=20
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > +---
> > + src/assistant/help/help.pro | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
> > +index ed75c37..a2c55c7 100644
> > +--- a/src/assistant/help/help.pro
> > ++++ b/src/assistant/help/help.pro
> > +@@ -70,3 +70,5 @@ HEADERS +=3D qhelpenginecore.h \
> > + # access to clucene
> > + HEADERS +=3D qhelpsearchindexwriter_clucene_p.h \
> > +     qhelpsearchindexreader_clucene_p.h
> > ++
> > ++LIBS +=3D -lQt5CLucene
> > +--=20
> > +1.8.3.1
> > +
> > diff --git a/recipes-qt/qt5/qttools_5.2.0.bb b/recipes-qt/qt5/qttools_5=
=2E2.0.bb
> > new file mode 100644
> > index 0000000..0effa1b
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qttools_5.2.0.bb
> > @@ -0,0 +1,5 @@
> > +require qt5-${PV}.inc
> > +require ${PN}.inc
> > +
> > +SRC_URI[md5sum] =3D "76a0992967b6d02220ecb69a5ba04ef1"
> > +SRC_URI[sha256sum] =3D "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4=
cf11acc8150811b7f0"
> > --=20
> > 1.8.3.1
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TRkqPRiqIDKgfg/F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLZVwoACgkQN1Ujt2V2gBz8hgCgq7Zw5HFa+gRfNCJUFVqP4WWh
8xQAoJwg43DKISO+qZNdL0w3iSJz5eOg
=qeMs
-----END PGP SIGNATURE-----

--TRkqPRiqIDKgfg/F--
