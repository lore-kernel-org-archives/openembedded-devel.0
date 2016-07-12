Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D2B846067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 13:58:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so2143412wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TrcXmPZuNb/+6DI4v+Orf7DdeNSJMTUEMnP3zFclkUo=;
	b=VsgG27us5RTnxG6SXnCmT0qyVSCBMmMFSGHCj2rWtwhsM6D72mS+xtJ01zcn4EBBwU
	O0yObbpKfjQRblCuBm4yAuRC9KED+rrnfVmCse3oUmrohqBW0gIc4kxKj9dAe7GIw7yd
	iLDYJ2UHMNDAKzhqP65vFMpYSoNd+LwayAHb9NAkK7z44V6AHCNqPQvHoopR7G9PTVJG
	mDvUDRJd50OZ4SuCUv6SXmfp3G2QaOg8ze2+UWn7egOXvRVWhx6pUOe30SgrSAluFQhj
	pyY2YLSAmaiBiL/w3USkEW6vX9UUS5JKIH4S4lbppLlAlsQjc4efVlVOoMWd910wtyIv
	WHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TrcXmPZuNb/+6DI4v+Orf7DdeNSJMTUEMnP3zFclkUo=;
	b=B18d98HLA7g1c/UInJOCgD5r7Dk5gICm5L6wa8yDCe2/0JZLdo2jkP7jFFZ4orbSAN
	+jcTwL3A/gsal+UfU/kNBOQF1gIC6V9aUrc4l22AQRdQLDq5ldsP7vp8RW8sa1BwHS4w
	yyENfTX8j+4koeGHb9r9klgPLbLhm4nC5t4oNF2hr5Upe2V8Hl6MPldfMv1vNsBoNjYO
	e3qFiCOgPdzviRXcecpE48Wng0wLpjlexUO8FY8vhxF9Zq317zXf4u6780n0x7PDieh3
	SEUUt0v3RtD+EJGjy21tth74cAdtJ1admR2wdfNLD9B7I78zDAyQkPd6VEvtHeGpJ0PL
	p/wg==
X-Gm-Message-State: ALyK8tI5LNKdVRYPN3H53rKIuqFQWw2yHECpemiNlZbNT/X6x63lauMQdH7kdt3vVsy9ew==
X-Received: by 10.28.174.76 with SMTP id x73mr3657670wme.60.1468331918615;
	Tue, 12 Jul 2016 06:58:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	b203sm4316995wmh.20.2016.07.12.06.58.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jul 2016 06:58:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Jul 2016 15:58:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160712135845.pva3tpjpq34yxwes@jama>
References: <1467995452-30013-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1467995452-30013-1-git-send-email-joe_macdonald@mentor.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] plymouth: remove virtual prefix for RPROVIDES
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
X-List-Received-Date: Tue, 12 Jul 2016 13:58:39 -0000
X-Groupsio-MsgNum: 62133
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ek7bnbegt7vv2gqn"
Content-Disposition: inline

--ek7bnbegt7vv2gqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 12:30:52PM -0400, Joe MacDonald wrote:
> The 'virtual' namespace is only intended to be used for build-time
> dependencies, not in the runtime package namespace.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.2.bb
> index de23dcd..597d8cd 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
> =20
>  DEPENDS =3D "libcap libpng cairo dbus udev"
>  PROVIDES =3D "virtual/psplash"
> -RPROVIDES_${PN} =3D "virtual/psplash virtual/psplash-support"
> +RPROVIDES_${PN} +=3D "psplash psplash-support"

This causes new NOTE in every build:
NOTE: multiple providers are available for runtime psplash (psplash, plymou=
th)
NOTE: consider defining a PREFERRED_RPROVIDER entry to match psplash

Do you want to update
meta/conf/distro/include/default-providers.inc
to resolve this first?

> =20
>  SRC_URI =3D "http://www.freedesktop.org/software/plymouth/releases/${BPN=
}-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
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

--ek7bnbegt7vv2gqn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleE95UACgkQN1Ujt2V2gBySZACguoIcSQh899G32FmDPNeQby6r
gmMAoIn09+zSpt4V5jPhtjSIHY7bMHvn
=VoDU
-----END PGP SIGNATURE-----

--ek7bnbegt7vv2gqn--
