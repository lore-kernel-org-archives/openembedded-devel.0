Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 594D66B9D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:29:15 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so2306570eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=50Bo1NbH5+qA4TsiT181uCciDQGZhPj6hgAbG4SfsVo=;
	b=Y2boJcA4BYfC8OHnrkxGdgStO5KkQmD5f2TpKvOUhM2K1eng0ypWELEpmMEve1fwV2
	28a282GaCKjXxTm3ExZSPsBHReaEgRh4fLSalx2tpFDSIolq+mo2O40vBBnEhfhwpCsl
	hK2A8E94pNm0ct1xg+e750ssEROueCrjg8sDjL65Jw0Bu4S09iMb/32lKGwTKvwIULUF
	MIpRlSuI6gAV5kP27ggGMscN11JnmJAzRTcu1CZQ37dgn5zlMbnO6Fv5mY8/BHInFNIo
	TmP4uTpkr0UEhsW1+s8IwnH8VoyG6BYrCrrZ2QUM7Q9VQMEeT8wn5/hNGF4gymbvKavF
	F5fQ==
X-Received: by 10.14.37.4 with SMTP id x4mr36978342eea.16.1378121355618;
	Mon, 02 Sep 2013 04:29:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm21286512eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 04:29:15 -0700 (PDT)
Date: Mon, 2 Sep 2013 13:30:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130902113032.GB3544@jama>
References: <1378120962-64144-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1378120962-64144-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] sqlite3: update to version 3.8.0.1
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
X-List-Received-Date: Mon, 02 Sep 2013 11:29:15 -0000
X-Groupsio-MsgNum: 46008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c9D8mOo1KWOdrF7C"
Content-Disposition: inline

--c9D8mOo1KWOdrF7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 01:22:42PM +0200, maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>=20
> Upgrade to latest version 3.8.0.1

Please resend to openembedded-core ML
>=20
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3071700.bb |   10 ----------
>  meta/recipes-support/sqlite/sqlite3_3080001.bb |   10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3071700.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3080001.bb
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3_3071700.bb b/meta/recipe=
s-support/sqlite/sqlite3_3071700.bb
> deleted file mode 100644
> index 113e8ce..0000000
> --- a/meta/recipes-support/sqlite/sqlite3_3071700.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require sqlite3.inc
> -
> -LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D65f0a57ca69287=
10b418c094b3570bb0"
> -
> -SRC_URI =3D "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "18c285053e9562b848209cb0ee16d4ab"
> -SRC_URI[sha256sum] =3D "8ff46d0baa9e64c0815544e829e985f1161c096aa6344c8f=
430791dbeadc2baf"
> -
> -S =3D "${WORKDIR}/sqlite-autoconf-${PV}"
> diff --git a/meta/recipes-support/sqlite/sqlite3_3080001.bb b/meta/recipe=
s-support/sqlite/sqlite3_3080001.bb
> new file mode 100644
> index 0000000..692e56a
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3_3080001.bb
> @@ -0,0 +1,10 @@
> +require sqlite3.inc
> +
> +LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D65f0a57ca69287=
10b418c094b3570bb0"
> +
> +SRC_URI =3D "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "ee32c96e5db6c6d651c7c9b71082cf7c"
> +SRC_URI[sha256sum] =3D "1d92ccfca5629701b207e57e86fdf0a01d8dca61c60e1246=
f92ec8d87408cf36"
> +
> +S =3D "${WORKDIR}/sqlite-autoconf-${PV}"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c9D8mOo1KWOdrF7C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIkdtgACgkQN1Ujt2V2gBwGPQCeLREhbVs1xCi8eSxmXKrKBLBg
wCkAn2z22AhDB13T+gnl2+MYL32OdZey
=g2e7
-----END PGP SIGNATURE-----

--c9D8mOo1KWOdrF7C--
