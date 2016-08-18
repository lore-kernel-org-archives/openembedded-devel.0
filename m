Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4869A731C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:41:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i6so84115pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=2lmkI/1oub7HkQ8+DtvZ4R5iJcvPC/hrGrUZ5xE4OTg=;
	b=ic7uluVG00brXuc3uTwwb6SeoqklQrQAZSYolRiJqFVnogzb3uMDFMNT9A0oyv02s7
	E2+CuAnwenuAccLjO3/gIbewFPBpeRYIDHL7sqkx6Zg+/L6AAXMojTRvuPTRGkOXB727
	TEWZJcM8OD8u97vmiwvom6iM8TdhRim7JPPfw3vPx8PE5dctQtwRGwiNb9PwQ8O1Gu5N
	EPZPUZzS93b+4hCh/CDh8+W7wAqzlkCzYqygzNpsrEHHlwikGcLqaEH0ogRQ+0OoxRre
	Y4nPD7+swPf0aOBoB32DAAtaLAcEl8d/c6Xh8mQjqLAB5v6QUFGug3VvxUTXMIxCTL0K
	Vf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=2lmkI/1oub7HkQ8+DtvZ4R5iJcvPC/hrGrUZ5xE4OTg=;
	b=Qcyu6hBmY7SVUVJvcUQvf2YJvchSMqRmN+QG0RTNaZtKY15G3FuoSCVYCZOtGVc3MP
	QZAdUmnwY53f+pcAyC7l6YmdbMpRO+gwu1R+PAeP2FKNGgI78ZC018GzUXzD97e997np
	G2SOTLlv0b66Od2+aZtMD0s4gYrFZ8gNxTJpF+hji3SpmvS5wWykns235IK1bMoycCFZ
	PDvn5fS+4SQfPx3nvXuEN0GF8+9683/w3fcvw5JMhSS35CUo8DDPDOOwEPB7l69w5WN4
	RyWZ6EqUwRSGyN4/wv0D42Nvs9E2nrWJuDgfZXq7sXKU4PQkKvT0An+B94BsknL2EqJ3
	iQvQ==
X-Gm-Message-State: AEkooustZnuGiTtsdn6akEPR4+GXMh6L3h0f5f7YVFQxgl4cI0py07pXeydJvc0CKxj8NQ==
X-Received: by 10.98.64.93 with SMTP id n90mr6094623pfa.29.1471542082452;
	Thu, 18 Aug 2016 10:41:22 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id q4sm332176pfb.18.2016.08.18.10.41.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:41:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1608180539350.16976@ca624034.mitel.com>
Date: Thu, 18 Aug 2016 10:41:21 -0700
Message-Id: <22214C04-113E-487D-AC65-FC8867BAA819@gmail.com>
References: <alpine.LFD.2.20.1608180539350.16976@ca624034.mitel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH] meta-oe: mozjs, given "_append", convert superfluous "+=" to "="
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
X-List-Received-Date: Thu, 18 Aug 2016 17:41:22 -0000
X-Groupsio-MsgNum: 62727
Content-Type: multipart/signed;
	boundary="Apple-Mail=_288EF9B3-0339-4563-BC5A-DE6B02A3D439";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_288EF9B3-0339-4563-BC5A-DE6B02A3D439
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 2:41 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb =
b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> index f147714..524f2a5 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> @@ -37,7 +37,7 @@ EXTRA_OECONF =3D " \
>     --enable-threadsafe \
>     --disable-static \
> "
> -EXTRA_OECONF_append_armv4 +=3D " \
> +EXTRA_OECONF_append_armv4 =3D =E2=80=9C \

same here no need for space after "

>     --disable-methodjit \
> "
>=20
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


--Apple-Mail=_288EF9B3-0339-4563-BC5A-DE6B02A3D439
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle180EACgkQuwUzVZGdMxQAqQCfSClVAlQp8nu/46mCjeBuh14a
pxkAoIO/pp0WQReqghe0EfRHOH9QVfCS
=7Vn7
-----END PGP SIGNATURE-----

--Apple-Mail=_288EF9B3-0339-4563-BC5A-DE6B02A3D439--
