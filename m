Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C3F1960621
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:55:01 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l65so30134392wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z7x3bcKjB8+9ZH7TGslYJh+slwJvBlQrg8zDcCvx7bk=;
	b=jyVLRu4h+1wyLBjfj9d3FJWwh+VUot+Cy1b4NQx16MuPFg0XGqSiw0Lk+YkA4QgDiX
	jPv3gJsEV6YkR8LL/9MNrxuPWQ7qDw/CdozTuP3t7D5tdsf7iT7qwdJydSoFScEbhGXX
	e84p6GPr6rqX6uvLbsLspKIu1TlG1opY22ftnmQOcB776yWBfP578vkLLTe5FOeqozdp
	8hYjQVzNUbR8/KSN9lKCF/LzDdIGLFK2lK/HJHzIRd/oKPlqgapKxKhU6PSby7YAwKtm
	CUmisxCsPPkHdlRMflHxq2bqGsd8PEI5iZrJfr1zc53JSRcw0JMuHld+no9G2+EnXX75
	VpDw==
X-Received: by 10.28.141.10 with SMTP id p10mr4926132wmd.83.1452012901502;
	Tue, 05 Jan 2016 08:55:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	av8sm17041412wjc.13.2016.01.05.08.55.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 08:55:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Jan 2016 17:55:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160105165511.GC2574@jama>
References: <BLU436-SMTP1639BAACC4B25952154FE54D6F30@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP1639BAACC4B25952154FE54D6F30@phx.gbl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] wolfssl: updated version from 3.6.6 to 3.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 16:55:06 -0000
X-Groupsio-MsgNum: 59349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 09:28:29AM -0700, LC Mac wrote:
> Version 3.8.0 of wolfSSL includes VxWorks example client/server,
> AESNI use with AES-GCM, Stunnel compatibility, C# wrapper, and more.

No change in SRC_URI checksums? Please test the changes you're sending -
this happens with every wolfssl upgrade.

> Signed-off-by: lchristina26 <leah@wolfssl.com>
> ---
>  .../recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb =3D> wolfssl_3.8.0.bb=
}   | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb =
=3D> wolfssl_3.8.0.bb} (100%)
>=20
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
> similarity index 100%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
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

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaL9W4ACgkQN1Ujt2V2gByC5gCgrGbeN9QyTMn4iOvby09cCkXB
pTAAnj3Bm5/4WUaxyeQfsp/jLDi32RP5
=veLs
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
