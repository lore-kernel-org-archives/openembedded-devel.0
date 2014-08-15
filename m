Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id E3A51601A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:02:59 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gl10so2048202lab.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ipai8OK5NufdbcSUhraWD1xdOwQ5iig1hC/bGcFa/O8=;
	b=aiVfQgPC/5tjmJ6c3e2KA/i52USyI3T6W92jfpKAhod+gBFcn6oWLWqPX6snng96Hw
	iRzAWH87eaH10nmxHUBr60GcGIYGKR6uuZpPaZp+l99k9cGpyV9HMGRDwWOyjWtqp4qY
	05OoflHVHcs4okognzvYTv7/xzxhXUmF6nbwmCxVLZ6ECKHqyfxMgyYPF++fTgznjwPq
	o4JCs0+FXYWZV0yOn8pusnwEAPrgOJTI+VD86Wo6DYqHfS+QD3zcnPwGR1gpaON/T2jZ
	sfAqGugiUTb2lZVK7gy9JfPdQtHOaV44qpy0abS2nCml3NqCRXcboGgJ1QAQnhN2lfyI
	ZcPA==
X-Received: by 10.152.205.35 with SMTP id ld3mr10614797lac.48.1408093379911;
	Fri, 15 Aug 2014 02:02:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j2sm4638604laf.15.2014.08.15.02.02.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 02:02:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 11:03:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140815090337.GA22747@jama>
References: <1408071973-20141-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408071973-20141-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] traceroute: uprev it to 2.0.20
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
X-List-Received-Date: Fri, 15 Aug 2014 09:03:06 -0000
X-Groupsio-MsgNum: 51712
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2014 at 11:06:13AM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../{traceroute_2.0.18.bb =3D> traceroute_2.0.20.bb}           |   10 ++=
+++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-networking/recipes-support/traceroute/{traceroute_2.0.18.bb =
=3D> traceroute_2.0.20.bb} (75%)
>=20
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> similarity index 75%
> rename from meta-networking/recipes-support/traceroute/traceroute_2.0.18.=
bb
> rename to meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> index 236bd12..58e32a4 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> @@ -8,19 +8,19 @@ show you where the trouble is coming from along the rou=
te."
>  SECTION =3D "console/network"
>  HOMEPAGE =3D "http://traceroute.sourceforge.net/"
>  LICENSE =3D "GPL-2.0 LGPL-2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> -                    file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> +                    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b36=
4516c"

Say in commit message, what changed in them.

> =20
>  PR =3D "r1"

drop PR

> =20
>  inherit update-alternatives
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.=
18/traceroute-2.0.18.tar.gz \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BPN}-${PV}/${=
BPN}-${PV}.tar.gz \

${BPN}-${PV} -> ${BP}

>             file://filter-out-the-patches-from-subdirs.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "b7254149b7f081cce07f4b9e065ba5ef"
> -SRC_URI[sha256sum] =3D "5994a88520927fefe3c9754aaf1e02b4d0f3f8fb1f521a68=
fa86215c3fcab9ef"
> +SRC_URI[md5sum] =3D "559f104e155e0e14ee0c717776a745fa"
> +SRC_URI[sha256sum] =3D "2facba9525c95428d7bff3a313fc6ecfd8c529c678ae666c=
73015558a0edc271"
> =20
>  do_compile() {
>      export LDFLAGS=3D"${TARGET_LDFLAGS} -L${S}/libsupp"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtzOkACgkQN1Ujt2V2gBzbRQCggw1HKpj5KBvGKsRaBB/oM3vD
DlgAn3vP+eQj0uxs0WnxTffbB8ydEcUH
=qlSA
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
