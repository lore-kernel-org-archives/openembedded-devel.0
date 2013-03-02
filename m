Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBmYW-00015T-P6
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 14:32:55 +0100
Received: by mail-da0-f51.google.com with SMTP id z17so1814911dal.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 05:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Uws4gUoZM0CnguSAlh1ws5ohNZNJcWKztcddb39sZJI=;
	b=WZQKVYZzah9r0q7NTTVLNWW40clbb1saRRJBr8q0RS4GGPocL8G2vRmqtg78MeCY04
	lzg4mcb651IZGcxILy1pFedjWpGoN660Sqxz352VfBJImydfm5okMctmja3vPRLiSQJo
	aBDk8iKVjrxtasaHm5beDJDJ5pCbQsw7w2DRf3NLIprKIMMHBJoGwwJg4CzOfPOv9raF
	O9IqIudANCSr1W2/UOtv1ahCcqA8a2i7tGJjVroClDc8Esf5pIC9ki88i0uPenuVvDOm
	RVk/kNi/9DLJV/BowsGV8l/X2+aSdMi5xkvjKfCHRV+cLIETCk1uRu5n788vVx6q6VeC
	20Mg==
X-Received: by 10.66.222.35 with SMTP id qj3mr24061498pac.69.1362230187178;
	Sat, 02 Mar 2013 05:16:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mz8sm12905437pbc.9.2013.03.02.05.16.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 05:16:25 -0800 (PST)
Date: Sat, 2 Mar 2013 14:16:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130302131618.GY3279@jama>
References: <cover.1362223895.git.apelete@seketeli.net>
	<72d98f98a772a3a7aabc11531e8c70bf52f11a88.1362223895.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <72d98f98a772a3a7aabc11531e8c70bf52f11a88.1362223895.git.apelete@seketeli.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 5/7] libcap: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2013 13:32:55 -0000
X-List-Received-Date: Sat, 02 Mar 2013 13:32:55 -0000
X-Groupsio-MsgNum: 43364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ofekNuVaYCKmvJ0U"
Content-Disposition: inline

--ofekNuVaYCKmvJ0U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2013 at 12:57:06PM +0100, Apelete Seketeli wrote:
> Update SRC_URI to downloads.yoctoproject.org since libcap source
> packages are no longer available from kernel.org.
> ---
>  recipes/libcap/libcap2_2.20.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes/libcap/libcap2_2.20.bb b/recipes/libcap/libcap2_2.20=
=2Ebb
> index e3a18ec..3e7d4bd 100644
> --- a/recipes/libcap/libcap2_2.20.bb
> +++ b/recipes/libcap/libcap2_2.20.bb
> @@ -9,7 +9,7 @@ BUILD_CFLAGS +=3D "-I${S}/libcap/include"
>  CFLAGS +=3D "-I${S}/libcap/include"
>  LDFLAGS =3D+ "-L../libcap"
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/lib=
cap2/libcap-${PV}.tar.bz2 \
> +SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/libcap-${P=
V}.tar.bz2 \

Why not add downloads.yoctoproject.org to default MIRRORS it will
resolve IIRC 3 patches from this set.

>  	   file://make.patch \
>  	"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ofekNuVaYCKmvJ0U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEx+6IACgkQN1Ujt2V2gBzpXgCfXMeXruzykeqp+pkrnEYlb+FV
qX0AnRMsChZVsiDzqJeGzIY2bWw2INwj
=FfZ9
-----END PGP SIGNATURE-----

--ofekNuVaYCKmvJ0U--
