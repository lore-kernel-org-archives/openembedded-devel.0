Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 254EF72B8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:24:01 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so2565582wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5cG3ZqLwJtw2D1lgCXwOxnToHfXdUsIfOPBqzg5nZ9o=;
	b=U01lWiNMNGEM1UEWfAK+laHFlNjVrXZjS9pyw7cuBrA3b7Hey01fdZmQmpCDJaaDny
	o3He4uuk26AjufD/npsTBhUKnHJxcw6pV0SLE05LZM7J4auHLJZMtNdkMAq5N3/FP7TY
	8tKfTDEOEoWWVQjoIhqNJ4ypDk55QZfhzHneLlODKt58n7uMYlMlc03WRVxkfanI8OEn
	61VllHbVrU/DZ/CHnWXAq9e56jAxERjeKfTUtrebF6WUniipR+W6y0YjECFecqLHFA+E
	oI6pHFZuTVd4aBGYo7jCH4cgDE/rnX00W+ppFxYhB2rJShk5uN97l85bMRMFSpCn8E9q
	HaYA==
X-Received: by 10.180.107.70 with SMTP id ha6mr58559707wib.71.1420716241690;
	Thu, 08 Jan 2015 03:24:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j1sm5741372wjw.25.2015.01.08.03.24.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:24:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 12:24:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150108112405.GE3972@jama>
References: <1420690215-2544-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1420690215-2544-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH V2] libssh: depends fix
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
X-List-Received-Date: Thu, 08 Jan 2015 11:24:04 -0000
X-Groupsio-MsgNum: 53764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline

--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 08:10:15PM -0800, Armin Kuster wrote:
> the default was to build with GSSAPI enabled.
>=20
> add PACKAGEGROUP to define enable/disable GSSAPI with
> proper depends/rdepends of krb5
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/libssh/libssh_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recip=
es-support/libssh/libssh_git.bb
> index d21bdc3..4f5b703 100644
> --- a/meta-oe/recipes-support/libssh/libssh_git.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_git.bb
> @@ -20,6 +20,9 @@ EXTRA_OECMAKE =3D " \
>      -DWITH_ZLIB=3D1 \
>      "
> =20
> +PACKAGECONFIG ??=3D""
> +PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, krb5, k=
rb5"

Again I think it doesn't need explicit krb5 runtime dependency, it's
added automatically by shlibs when enabled.

Thanks for rebasing for libssh_git.bb I didn't notice that the 0.6
version was removed by pending patch from master-next sorry.

> +
>  inherit cmake
> =20
>  do_configure_prepend () {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSuaNUACgkQN1Ujt2V2gBwkJACZAezyDFK3rHI+V0Lf6Ox1FJhm
CgUAniS7FEm2c0zantbeLOv3Pywwzyxj
=qYte
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
