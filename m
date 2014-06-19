Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A4A736059A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 08:39:07 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id n15so8911147wiw.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jgY1gLzRF5CfztcEPiAmnhBlgT6oinSGMrOxE5XYOK8=;
	b=IUb+ihwSJ8HX1VKjFMbC+IP4JS/ZgIDglRQKlKRCDtQGtBOQ0ltp7d5V85x0Ipqaua
	pkoT30x7F6drEezT/K1X9ja/1CYkvNXoczqoGr0FaPSpej4sNKKFwpRvkRUAOFlNEetJ
	MbAKhYejy6YTb52TRs5sCXS1o0hYoHbN1GbBdca+jB2ePZD9AClfqfsqaLJvv9eLA5+G
	iFAs48HC98gIyPy8BqeM2B4mHwOPDD0SHNgBGMg/+cH1l5c+HBuznynAsN6v1AOnpzCg
	8niSidI0irwzqr6wrhMe61eUdnK9q8Pb5e2vodOQ3uWhWO/9VcBFmut83a9bCyIJTbBw
	8Y7g==
X-Received: by 10.194.2.72 with SMTP id 8mr334601wjs.85.1403167148601;
	Thu, 19 Jun 2014 01:39:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r9sm31277818wia.17.2014.06.19.01.39.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 01:39:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 10:39:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619083908.GL2117@jama>
References: <1403134870-29746-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1403134870-29746-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Thu, 19 Jun 2014 08:39:11 -0000
X-Groupsio-MsgNum: 50409
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YIleam+9adpUeYf+"
Content-Disposition: inline

--YIleam+9adpUeYf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 05:41:10PM -0600, Eduardo Silva wrote:
> This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fix=
es
> some problems when switching user when started as root.
>=20
> monkey/yocto: 3163d01492ea3d85268dc3773419e94db57ee8df

[meta-webserver] is still missing in subject (helps me a lot when
separating patches on patchwork), you don't need to resend it now, but
please remember it for next time.

> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_1.5.1.bb}       | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_=
1.5.1.bb} (83%)
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.1.bb
> similarity index 83%
> rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> index 6fa1b77..2ea18f5 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> @@ -8,15 +8,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44f=
e7014dce33e26468ba93"
>  SECTION =3D "net"
> =20
>  SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "9123fc371334621fde1c060ab17adcd3"
> -SRC_URI[sha256sum] =3D "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b363=
7bd8bab5b1d098a7"
> +SRC_URI[md5sum] =3D "2fe04135728f5c3a86c3a412059e0da3"
> +SRC_URI[sha256sum] =3D "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757=
bfeb72edddf457e7"
> =20
>  EXTRA_OECONF =3D " \
>               --plugdir=3D${libdir}/monkey/ \
>               --logdir=3D${localstatedir}/log/monkey/ \
>               --pidfile=3D${localstatedir}/run/monkey.pid \
>               --default-user=3Dwww-data \
> -             --datadir=3D ${localstatedir}/www/monkey/ \
> +             --datadir=3D${localstatedir}/www/monkey/ \
>               --sysconfdir=3D${sysconfdir}/monkey/ \
>               --enable-plugins=3D* \
>               --disable-plugins=3Dpolarssl \
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

--YIleam+9adpUeYf+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOioawACgkQN1Ujt2V2gBydYQCcDS4fsUAVYyi5vV9UHgJ/AzBp
uykAnjwTIkCWTLas+Y5MLhwC1Ipsm+Zk
=3872
-----END PGP SIGNATURE-----

--YIleam+9adpUeYf+--
