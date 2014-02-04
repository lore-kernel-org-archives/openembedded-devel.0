Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3946E898
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 22:15:48 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e51so2362159eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 14:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BF/dDIJJH/Bzlk+4T6ddHvk68iRJgNPxYx2dEPPTHx4=;
	b=Gmwux1wdnr8+RiFLl4NJtbuXcyvFQp3TFl5fGoPCm0nAOyq0fvnRV5dqDZGT8O5d2N
	HNpJ4YTJ1kRhR9ux1TNxCVFaeQsH55NtLiApvODI4pay7MH0FOJKSIQJ/b3559QxL8v0
	DtWDbdNqNDKPsNXUZIS4zEPclzkK4wSdKMMqzIwIXIW4daHJ0A9c4o4Pxv4xPehSo7CI
	s8fl5tAFK4y+hhqx1Enf3vRUXTbRhyDQBdnA9icykExz1orGy4Mx/15mdj1Io3Ex4KUF
	9RHyTo/S3CVy+H7of7+7aLb8hXd3wWAS7QycvgDbwn78tCgrwVI9rLNkJCZ+5168xRoV
	R+Kg==
X-Received: by 10.14.2.193 with SMTP id 41mr17312508eef.55.1391552148541;
	Tue, 04 Feb 2014 14:15:48 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j41sm12463224eeg.10.2014.02.04.14.15.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 14:15:47 -0800 (PST)
Date: Tue, 4 Feb 2014 23:15:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140204221559.GK3698@jama>
References: <1391458395-9941-1-git-send-email-gjohnson@agleader.com>
	<EF93C63B81FE3D4F81C98317512457471295D9D477@agmail-mb1>
MIME-Version: 1.0
In-Reply-To: <EF93C63B81FE3D4F81C98317512457471295D9D477@agmail-mb1>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] Fix file search paths for nativesdk packages.
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
X-List-Received-Date: Tue, 04 Feb 2014 22:15:49 -0000
X-Groupsio-MsgNum: 48046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B92bTrfKjyax39gr"
Content-Disposition: inline

--B92bTrfKjyax39gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 02:14:14PM -0600, Gabe Johnson wrote:
> Signed-off-by: Gabe Johnson

Is this really needed now when all local patches are in BPN directories?
It was needed before when there were patches in BPN-PV and we needed to
put them in FILESPATH before the BPN/override version IIRC, but that's
not the case anymore.

OE qemux86@ ~/build/oe-core $ grep ^FILESPATH=3D env.nativesdk-qtbase | sed=
 "s/=3D\"/\n/g; s/:/\n/g"
FILESPATH
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/nodistro
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/nodistro
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/nodistro
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/qemux86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemux86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemux86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/qemuall
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemuall
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemuall
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/x86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/x86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/x86
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/x86-64
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/x86-64
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/x86-64
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.2.0/
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/"

> ---
>  recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb  |    2 ++
>  recipes-qt/qt5/nativesdk-qttools_5.2.0.bb |    2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb b/recipes-qt/qt5/na=
tivesdk-qtbase_5.2.0.bb
> index aca8dea..223baa3 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
> @@ -1,5 +1,7 @@
>  require qt5-${PV}.inc
>  require ${PN}.inc
>=20
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
> +
>  SRC_URI[md5sum] =3D "c94bbaf1bb7f0f4a32d2caa7501416e1"
>  SRC_URI[sha256sum] =3D "51556cd2562a6d4bbb70ffcc93e8ef83ec79b170753aac6e=
4b195957c61cb628"
> diff --git a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb b/recipes-qt/qt5/n=
ativesdk-qttools_5.2.0.bb
> index 0effa1b..3d2c05a 100644
> --- a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
> +++ b/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
> @@ -1,5 +1,7 @@
>  require qt5-${PV}.inc
>  require ${PN}.inc
>=20
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qttools:"
> +
>  SRC_URI[md5sum] =3D "76a0992967b6d02220ecb69a5ba04ef1"
>  SRC_URI[sha256sum] =3D "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4cf=
11acc8150811b7f0"
> --
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B92bTrfKjyax39gr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLxZp8ACgkQN1Ujt2V2gBytsACeNLf3/bvxsPf+DAKUG8NGIyR5
KcUAnjUKAsU/v877bkH2B+EjSMuUQK84
=vD3v
-----END PGP SIGNATURE-----

--B92bTrfKjyax39gr--
