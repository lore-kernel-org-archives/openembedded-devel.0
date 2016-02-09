Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D736C65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 18:04:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 128so4888974wmz.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ky+L5Y2QMuY2g1iuv5rQ7FMHX202gdVNsBCJpsbvz+0=;
	b=IYXgmgvHYKiPjO/LJtrQ2mYk5B3CYppv7QLOzIBA8MnWNwwRXMi48kvDeweaPpdh3n
	br8dSrzGAR6+wmM1XdjHOs+RYZMQmZOK9i43Q8eZdBuKN1B0yjONbae8Dmp6EkTnHEm3
	VHuSNI9ATx5Stoe8KUxj1F0SHdDIVrpPhrytxXlosB8UeQUI6ZH0FMPCsQoL+gCK8NGc
	4N4G/T9y5BjJQl1SX6eagg+HPzodsFs8P8Eo54qWR6jAXpNcguaMD/wz07T8RTp3ig5d
	xH40oHOAGtYvBua7teKwj8PzRAZpqsTXlUWIOoc5ykRlJUjqVZBnvyx9odSWxWpAG7c/
	UFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ky+L5Y2QMuY2g1iuv5rQ7FMHX202gdVNsBCJpsbvz+0=;
	b=f58aAh8jmNI1Q44wceihaNHzBdKU8ea/F3QcVQ1gY9p8vMDPzCsLkfO7lxldvr2vUu
	GFcyQLOM+wDYeZ2fibTZwm0fSStSPTaONaOzFuMrjp7pHM6HFD3EGhFiTXXGVlcJV5U1
	j/C2CKzaSeiI2MWS5h4rkLjLju4NhYqrKqkfP3ICAuR9tVw3tUx0xN/8mYsTyBaMogUD
	sJSMF6Zg7LGO7di0woC45wbaVe8NufQ4dls47ig604waJlozXYMtfByM7Ly8xOwUYxcP
	S0qlycG+p2AGP+8hTwbbFycxz497WKMH+cD5drxusJHc+xMdonRPm5bOua2Rb6px0b8u
	recA==
X-Gm-Message-State: AG10YOTqNjIieNieVHCGPmzq4+OjnWT6V37qsJmSOIgfcIhSGUAqooZtxGwXs1EiT60P+Q==
X-Received: by 10.28.63.85 with SMTP id m82mr6756940wma.55.1455041089782;
	Tue, 09 Feb 2016 10:04:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm35834093wjy.0.2016.02.09.10.04.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 10:04:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Feb 2016 19:08:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160209180833.GA2608@jama>
References: <cover.1454879225.git.akuster@mvista.com>
	<8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 7/7] krb5: Fix warning.
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
X-List-Received-Date: Tue, 09 Feb 2016 18:04:50 -0000
X-Groupsio-MsgNum: 59914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 07, 2016 at 01:11:59PM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> WARNING: /tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/s=
rc/ ('S') doesn't exist, please set 'S' to a proper value
>=20
> remove extra "/"

This patch isn't in master and master still has trailing /, why is this
needed for fido only?

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/r=
ecipes-connectivity/krb5/krb5_1.12.2.bb
> index c492496..c19fffb 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
> @@ -33,7 +33,7 @@ SRC_URI =3D "http://web.mit.edu/kerberos/dist/${BPN}/${=
SHRT_VER}/${BP}-signed.tar
>  SRC_URI[md5sum] =3D "357f1312b7720a0a591e22db0f7829fe"
>  SRC_URI[sha256sum] =3D "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2d=
d600275d7a4f3744"
> =20
> -S =3D "${WORKDIR}/${BP}/src/"
> +S =3D "${WORKDIR}/${BP}/src"
> =20
>  PACKAGECONFIG ??=3D "openssl"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla6KxkACgkQN1Ujt2V2gBzn+gCZAV22vXxlqk1ly1nM22h60U+a
NzoAoLF5VJWpdOqruZg6rQnhq+Ssme39
=qgNd
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
