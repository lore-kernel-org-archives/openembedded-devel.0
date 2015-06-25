Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F17B605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 14:28:56 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so165849570wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w2/P4SQfSEoTPkOYMH7zCxW7i97JQlLBZ8f+gnF0Q08=;
	b=mHFb0Ky5KKXorxLEpWpfmrMU/0uanzPzQRDCCkH/G+1ZMHhf3FTBSgxXvVk/GRm6Vx
	IzwUJoC5Tqk4yoi09o+XzIi733+lrDoJl0fPwMqkSxuHkEyABA205IC7ZkKMZOWUDlbM
	PY8LT8wr7pF2IUkzi19ULUA7qdIsPBWlzxAjJ/nx6siNIUmPPI0bYEsWBwXR6RU184NE
	5w+mbO1xzJT25sij6DsBeeBd03EG5hwrEiDzjx28p0qlID4u8pPVQ30yPR6QQtIVJ/Bm
	0E8tDXYWYfSlDfIcuZ98nIwnSl1tumnSVu5InY+v03z7//zDX44LcCLU7q5jcn/1/x1Y
	3Pjw==
X-Received: by 10.180.77.136 with SMTP id s8mr6216928wiw.7.1435242537825;
	Thu, 25 Jun 2015 07:28:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id di9sm7912846wib.16.2015.06.25.07.28.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 07:28:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Jun 2015 16:29:17 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150625142917.GB2394@jama>
References: <1435239604-7245-1-git-send-email-kirgene@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435239604-7245-1-git-send-email-kirgene@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: Re: [meta-oe][PATCH] rabbitmq-c: update to v0.7.0.
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
X-List-Received-Date: Thu, 25 Jun 2015 14:28:57 -0000
X-Groupsio-MsgNum: 56030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 04:40:04PM +0300, Yevhen Kyriukha wrote:
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>  .../rabbitmq-c/{rabbitmq-c_0.6.0.bb =3D> rabbitmq-c_0.7.0.bb}         | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.6.0.bb =3D>=
 rabbitmq-c_0.7.0.bb} (65%)
>=20
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb =
b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
> similarity index 65%
> rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
> rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
> index cd68ba4..d2de94c 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
> @@ -3,9 +3,9 @@ HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
>  LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980=
b583f53"
>  LICENSE =3D "MIT"
> =20
> -SRC_URI =3D "https://github.com/alanxz/${BPN}/releases/download/v${PV}/$=
{BP}.tar.gz"
> -SRC_URI[md5sum] =3D "80b350ce0de3f44cbd7b501bbbd8daf3"
> -SRC_URI[sha256sum] =3D "3a89349880582c24d81d52ee42a93a0633dc366a4cc96174=
512af88c32509dc2"
> +SRC_URI =3D "https://github.com/alanxz/rabbitmq-c/archive/v${PV}.tar.gz"

github archives are regenerated with different checksums from time to
time, this isn't acceptable. NAK unless you can prove that this isn't
happening anymore.

> +SRC_URI[md5sum] =3D "ace9a4293a6c052863b7cc858027388d"
> +SRC_URI[sha256sum] =3D "b8b9a5cca871968de95538a87189f7321a3f86aca07ae8a8=
1874e93d73cf9a4d"
> =20
>  DEPENDS =3D "popt openssl"
> =20
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

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWMEDwACgkQN1Ujt2V2gBwbogCfW1N0LlFXevO597x4MoLSOT+u
2OcAnR7pOenc8hmO69dw5lKh17IAgHs0
=Kk46
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
