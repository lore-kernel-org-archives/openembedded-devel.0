Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id BFDE06028B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 15:38:16 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so2779806eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gYwoniqUCbZ+PU75234wUufpFVwKzVDdvlcPZzrDyrk=;
	b=nVnOqItHkvP61MtK+ttXeK2uN9gVb+3sL8hL2QpF82wvCccEnVSxbbd7RCwf7RQxSD
	1DI+lvkVxTp4a1sdQ6MzGr46y+UKjgTVTWqBFTlpTEw9QdS5ZR+HQYcAAhwWff4LRrWJ
	pHPd5Nc7mG8pACPHoqakH2ANhexKwUaPHaFgrQr1WRTlTb5BoW15IwbxQ3rZu4gztlsz
	27y/FK8iHb8B/hQLkkdmPsuzmSNRCVechzMsuIe/E6apcJsq71M/EBVhuuqJ8vCXLY6V
	1kWBhAWol7SmgD/yMABeDTMg+7f1Qtwp7Jur+2yISFQiceMMEk+w8fvmrgsqpCRvb8sV
	VTRg==
X-Received: by 10.15.82.135 with SMTP id a7mr1793339eez.107.1379432298292;
	Tue, 17 Sep 2013 08:38:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm51871380eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 08:38:17 -0700 (PDT)
Date: Tue, 17 Sep 2013 17:39:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Erik =?iso-8859-1?Q?Bot=F6?= <erik.boto@pelagicore.com>
Message-ID: <20130917153953.GF7313@jama>
References: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
	<CA+AhUGwGsVOEUTUPyAOMZtCJN1rLLDsdUi2akyyhx3yCnDobMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+AhUGwGsVOEUTUPyAOMZtCJN1rLLDsdUi2akyyhx3yCnDobMg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Laszlo Papp <lpapp@kde.org>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] Added module qtquickcontrols
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
X-List-Received-Date: Tue, 17 Sep 2013 15:38:18 -0000
X-Groupsio-MsgNum: 46224
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 02:55:52PM +0200, Erik Bot=F6 wrote:
> Hi,
>=20
> I just realized this patch does not package all files. The qt5.inc
> only pick up on files three directories "deep", so I have to extend
> this in qtquickcontrols.inc using:
>=20
> FILES_${PN}-qmlplugins +=3D " \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qml \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.js \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/qmldir \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.qmltypes \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.qml \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.js \
>     "
>=20
> I would assume that this is better done in qt5.inc, can't really think
> of any big drawback with having it central instead of per module and I
> guess the decision to go "three deep" was just that it covered the
> modules that recipes was written for at that time. Right?

Right, please notice that=20
https://github.com/meta-qt5/meta-qt5/commit/f11b1722e28800c790609d0de9541f6=
555e1ee5a
was merged today and resolves this.

You probably didn't know about alternative patch, because it was sitting
on github as pull-request and it wasn't sent to oe-devel, contributor is
now aware and will send next patches to oe-devel first.

Regards,

>=20
> Cheers,
> Erik
>=20
> On Wed, Sep 11, 2013 at 1:19 PM, Erik Bot=F6 <erik.boto@pelagicore.com> w=
rote:
> > Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
> > ---
> >  recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
> >  recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
> >  2 files changed, 8 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
> >  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> >
> > diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquic=
kcontrols.inc
> > new file mode 100644
> > index 0000000..63e884e
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtquickcontrols.inc
> > @@ -0,0 +1,3 @@
> > +require qt5.inc
> > +
> > +DEPENDS +=3D "qtdeclarative"
> > diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/q=
tquickcontrols_5.1.0.bb
> > new file mode 100644
> > index 0000000..fc880d7
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> > @@ -0,0 +1,5 @@
> > +require qt5-${PV}.inc
> > +require ${PN}.inc
> > +
> > +SRC_URI[md5sum] =3D "b3825124a173a36f63c2f8380dc61e81"
> > +SRC_URI[sha256sum] =3D "88d39421d78464c3900c37616e8369fc8d998c1b0f6119=
80e6e082f46569646b"
> > --
> > 1.8.1.2
> >
>=20
>=20
>=20
> --=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Erik Bot=F6
> Senior Software Engineer
> Pelagicore AB
> Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
> Mobile: +46 (0)76 881 72 03
> E-Mail: erik.boto@pelagicore.com
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4d8kACgkQN1Ujt2V2gByMRQCdHZKM2BllLn5CTSskyfiEYiYD
BCYAnAnjXLIDT53lwrXLivNP9uC5lzml
=A33K
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
