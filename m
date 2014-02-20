Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0023F6EC4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:42:26 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so886804eaj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 04:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IcjVlawG1Qdoi36S1Zjw6EgEd4QSKc5lM+nTuepV03c=;
	b=A/J43a8In329+bGdyFsLiK4Acxwh0d+1nMvV8wj7Bzr4mRE9McbTpFzVFrEkj8H1gv
	J5mD28BSDlvCXI/6ymPAyVTfj3VNUaTRuh/XPLV5OwMScq+Hke7PHM3F1X+ob8q82VaW
	MVQxYPudlAR/zs66hL4CEyir8DeeFtYjd6xRtwL6iiKnBLlYJYF8TfJz+mlMQxQ10g36
	lh8NOgJZGAr0aHuTwSdSC6pIoNi1mpZAXrCo9Z9uUXR7qrhdO1cHQS2S62waIuiEJHUk
	Cnw+R5IsNKTIdwkFolcWDmXEK2gL13CDDHeXg9gCPLiO0kYpCcAJZyWe22/cPFqMB+1n
	skhg==
X-Received: by 10.14.88.131 with SMTP id a3mr1760171eef.64.1392900146508;
	Thu, 20 Feb 2014 04:42:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm13390072een.7.2014.02.20.04.42.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 04:42:25 -0800 (PST)
Date: Thu, 20 Feb 2014 13:42:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140220124257.GE3854@jama>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<20140220121807.GD3854@jama>
	<CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 12:42:28 -0000
X-Groupsio-MsgNum: 48239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 09:22:03AM -0300, Otavio Salvador wrote:
> Martin,
>=20
> On Thu, Feb 20, 2014 at 9:18 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, Feb 19, 2014 at 12:22:36AM -0300, Otavio Salvador wrote:
> >> When looking for Qt5 components and files we ought to use the Qt5
> >> specific path. In case the distribution wants to have a flat tree it
> >> can set QT_DIR_NAME and it will still works as expected.
> >
> > NAK
> >
> > I don't think this is good idea, end-user applications shouldn't install
> > their data, archdata, examples etc in qt5 subdirectories.
> >
> > https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-inc=
lude-paths-and-build-failing-to-find-qt5-headers
> >
> > If you don't care about qt4/qt5 separation just set empty QT_DIR_NAME
> > and all qtmodules will fold into default directories and you won't need
> >
> > OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"
> >
> > listed in above wiki.
>=20
> and what about we change just the headers? I want to avoid every
> recipe using Qt5 and qmake to require setting the headers var.

That is still quite bad work around, because ideally end-user apps
shouldn't install headers in qt5 dirs as well.

So having this line explicitly in the recipe at least shows that app
headers will be installed in weird qt5 location (so your other recipes
should search for it there).
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMF+FEACgkQN1Ujt2V2gBwf7ACeNnGkhKnfc44VtFnGJyEDDQDQ
DXcAoKPhpc6jvVAm696i2XKOu1d4TPEZ
=I2IV
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
