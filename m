Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4702065D03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 18:20:33 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4438487eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/4Aw/JR2l7SA4BUJEr2om0Okiaz0E0jVSmKTSoFnmrI=;
	b=Q0wNxMBQtD9QChahv5BOJNC6MLOVbYVJgIzJfbrCFYVUzFwmvN2TukYQ8E2c8dsHuX
	d0xKIxSbQEvP25Yb15Dber5g8vjlk/xTSSltk5EI/vqo7q5S30MDia+4y6Bu6VXEKObN
	bU+DW9Ow/bEvSq64WTVUoDuD+LvNPb3eDgyRTx3EGLwoY4Jej32707caMoxZouZxJX9N
	3rFbBGsCw59y/T0579OILucyXCbYuukQOPu6SfdRrHFUrH5C0o37b/5xeXTF4q+gisz6
	lzxFdmj4hRyYawbYRMuxJI9DcL4sFARy+xYcNau7ZR9Cq8rNXkLtr+KL9J1+tqKOhF8V
	7pKA==
X-Received: by 10.15.90.201 with SMTP id q49mr5268277eez.65.1397240434717;
	Fri, 11 Apr 2014 11:20:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm19424600eel.1.2014.04.11.11.20.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Apr 2014 11:20:33 -0700 (PDT)
Date: Fri, 11 Apr 2014 20:20:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140411182042.GU2132@jama>
References: <1397233423-26218-1-git-send-email-b.krombholz@pironex.de>
MIME-Version: 1.0
In-Reply-To: <1397233423-26218-1-git-send-email-b.krombholz@pironex.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: =?iso-8859-1?Q?Bj=F6rn?= Krombholz <b.krombholz@pironex.de>
Subject: Re: [meta-oe][PATCH 1/1] qwt-e: qwt 6.1.0 FTBFS fix for qt-embedded targets
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
X-List-Received-Date: Fri, 11 Apr 2014 18:20:40 -0000
X-Groupsio-MsgNum: 49194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="buDNgeHiu+HCsDEc"
Content-Disposition: inline

--buDNgeHiu+HCsDEc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 06:23:43PM +0200, Bj=F6rn Krombholz wrote:
> - qwt 6.1.0 changed the handling of the QT_INFIX variable. Builds with any
>   QT_INFIX defined will fail as the generated qmake TARGET is always
>   libqwt.* ignoring the INFIX, but sub-projects like designer respect the
>   INFIX variable.
> - add PR/INC_PR to force recompile.

We're not using PR/INC_PR anymore, it will recompile because of
signature change (OEBasicHash) and package version should be incremented
by PR service.

So please send v2 without adding PR/INC_PR.

> Signed-off-by: Bj=F6rn Krombholz <b.krombholz@pironex.de>
> ---
> for yocto-1.4 branch, 1.5 is still on qwt 6.0.1
>  meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch | 13 +++++++++++++
>  meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb             |  2 ++
>  meta-oe/recipes-qt/qwt/qwt.inc                    |  5 ++++-
>  meta-oe/recipes-qt/qwt/qwt_6.1.0.bb               |  2 ++
>  4 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
>=20
> diff --git a/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch b/meta-oe/=
recipes-qt/qwt/files/qwt-e_qt_infix.patch
> new file mode 100644
> index 0000000..3a6fb64
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/files/qwt-e_qt_infix.patch
> @@ -0,0 +1,13 @@
> +Index: qwt-6.1.0/qwtfunctions.pri
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qwt-6.1.0.orig/qwtfunctions.pri	2014-04-11 16:25:59.291152505 +0200
> ++++ qwt-6.1.0/qwtfunctions.pri	2014-04-11 16:26:25.749892402 +0200
> +@@ -12,7 +12,7 @@
> + defineReplace(qwtLibraryTarget) {
> +=20
> +     unset(LIBRARY_NAME)
> +-    LIBRARY_NAME =3D $$1
> ++    LIBRARY_NAME =3D $$1$${QT_LIBINFIX}
> +=20
> +     mac:contains(QWT_CONFIG, QwtFramework) {
> +=20
> diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb b/meta-oe/recipes-qt/q=
wt/qwt-e_6.1.0.bb
> index 7694514..3d46a7a 100644
> --- a/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
> +++ b/meta-oe/recipes-qt/qwt/qwt-e_6.1.0.bb
> @@ -2,6 +2,8 @@ inherit qt4e
> =20
>  require qwt.inc
> =20
> +PR =3D "${INC_PR}.0"
> +
>  SRC_URI[qwt.md5sum] =3D "aef0437b37f191067a6a9dc01c30ba64"
>  SRC_URI[qwt.sha256sum] =3D "a7e3d9f1db917d186a973c5f04a316bc9607c7c35794=
d7a16de323aba5e17402"
> =20
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
> index 0ac71bf..bc65db6 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -5,8 +5,11 @@ SECTION =3D "libs"
>  LICENSE =3D "QWTv1.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af42051=
c88"
> =20
> +INC_PR =3D "r1"
> +
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt/6.1.0/qwt-${PV}.tar.bz2;name=
=3Dqwt \
> -           file://qwt6-fix-linking-with-ld-gold.patch"
> +           file://qwt6-fix-linking-with-ld-gold.patch \
> +           file://qwt-e_qt_infix.patch "
> =20
>  S =3D "${WORKDIR}/qwt-${PV}"
> =20
> diff --git a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb b/meta-oe/recipes-qt/qwt=
/qwt_6.1.0.bb
> index 97a53a8..eb12c1a 100644
> --- a/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
> +++ b/meta-oe/recipes-qt/qwt/qwt_6.1.0.bb
> @@ -2,6 +2,8 @@ inherit qt4x11
> =20
>  require qwt.inc
> =20
> +PR =3D "${INC_PR}.0"
> +
>  SRC_URI[qwt.md5sum] =3D "aef0437b37f191067a6a9dc01c30ba64"
>  SRC_URI[qwt.sha256sum] =3D "a7e3d9f1db917d186a973c5f04a316bc9607c7c35794=
d7a16de323aba5e17402"
> =20
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--buDNgeHiu+HCsDEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNIMnoACgkQN1Ujt2V2gBwjdgCeMSOw8PRrzlBj4cc86O5ye/5e
bqYAn0qw84Kfsf/vnd/UJbHzIhwKW2u9
=Ny59
-----END PGP SIGNATURE-----

--buDNgeHiu+HCsDEc--
