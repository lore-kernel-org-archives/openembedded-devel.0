Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F04F277011
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:40:37 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y134so75845pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=TZbQHeta5jgcFvVmXUTqlXX5PKzfoCHYagA8PjtGpHo=;
	b=1ACwqiV55k3IE6xJpcYWEVf+ZmcJd7+K5DKbrHE/W5PNxXdMsvdiEWtE25y3hCGtrr
	UN5/CIJUVvaJ4X6R96OKykHWURUbMxRLyQXiMfhUjs9XOJi2+h7UsVVH5syomvrrmN20
	mBSIP9CLjnwaG2uTF1yMPY1w/HobZCf9XArCfPDSE2iuA0nWJt2sOiB8K6gWjswpKPR/
	DJLcWuvrt2SF5VB6L1xU5Ce+GNRhBYPRvZEtjCvA8H21lJ6oFhvh1a7SsTAcDbto4LU6
	GIT2JDyxki6U3+aTFHHn8ZbO1cYDKQf/yQnXLLe3VAaljNuNMyWKCOxmUtL+OJdAsG9P
	/VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=TZbQHeta5jgcFvVmXUTqlXX5PKzfoCHYagA8PjtGpHo=;
	b=CFTXWWHc45KqXPBku5lg11L/npEJ6R6bGRbk+NfpddD0C1BQEGuwwgGluBjqj1bJJ4
	OdgzoAuCevQIdIm/cnNHUqXy8H6qA1JGeYcKDZAbyJGBgeaBQNlU+ZPuJ5FumuV6XCCa
	T5w+r2+3Lvu3/6b7/tpdmU7iPE5HuW/fkQ5GfnfYuj0vjMYnXMRPwRTUeujVNfinlXH6
	7bJIkWcCjn1O2gXMDJb2JPoD+POwgi3xw2WnqAwGLwfXr7uWfz/H7tpUIbWGegFhUmb3
	BJNj5hBZNV7I5r5bdaWJbTR4b+NzOE52DdkJxa9RvQnLoh8MOhRS6WAFipJ95jfcHvv5
	xYdg==
X-Gm-Message-State: AEkooutVzVkMYdCxKsBa5DypZ9f7+DAE22h597faRpFXvv93i+rgfaM330KKEicuLG5BcA==
X-Received: by 10.98.33.72 with SMTP id h69mr6135656pfh.28.1471542037147;
	Thu, 18 Aug 2016 10:40:37 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id q4sm332176pfb.18.2016.08.18.10.40.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:40:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1608180535210.16814@ca624034.mitel.com>
Date: Thu, 18 Aug 2016 10:40:34 -0700
Message-Id: <10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
References: <alpine.LFD.2.20.1608180535210.16814@ca624034.mitel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH] meta-oe: php, given "_append", remove superfluous "+="
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
X-List-Received-Date: Thu, 18 Aug 2016 17:40:39 -0000
X-Groupsio-MsgNum: 62726
Content-Type: multipart/signed;
	boundary="Apple-Mail=_07CAE07A-D2DA-480E-BFF7-B1461FFFCB57";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_07CAE07A-D2DA-480E-BFF7-B1461FFFCB57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 2:37 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>  again, not compile-tested since it seems obvious
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc =
b/meta-oe/recipes-devtools/php/php.inc
> index ee7a143..23de2b1 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -15,7 +15,7 @@ SRC_URI =3D =
"http://php.net/distributions/php-${PV}.tar.bz2 \
>            =
file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
>           "
>=20
> -SRC_URI_append_class-target +=3D " \
> +SRC_URI_append_class-target =3D =E2=80=9C \

nitpick: You do not need a space here since its already added after =
newline

>             file://iconv.patch \
>             file://imap-fix-autofoo.patch \
>             file://pear-makefile.patch \
>=20
> --
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_07CAE07A-D2DA-480E-BFF7-B1461FFFCB57
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle18xIACgkQuwUzVZGdMxTCUACfd4QgGtYYOnjMZo4vmoNf+0xx
LsIAn3PloHqgpsygobWXMB5uQiL0Ypvs
=ObAW
-----END PGP SIGNATURE-----

--Apple-Mail=_07CAE07A-D2DA-480E-BFF7-B1461FFFCB57--
