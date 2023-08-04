Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6502C001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:06:57 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.2604.1691168808196745445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=A78DZx9s;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=vdIQ9AmI;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 890913200914;
	Fri,  4 Aug 2023 13:06:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 04 Aug 2023 13:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1691168807; x=1691255207; bh=1C
	9lHqY9AIyMnz+0a+39weAX1U+qvnK8D/Wkil1vonA=; b=A78DZx9srfcFLjW5ky
	xDrTniFWgvG40HNsLFa93TNuq9tCJHJyAhq+N5Nh0l2EN7x6etMZWbP6b2Sme3ID
	sSAl4Sp15yXjsKiqzHZk1qPGAshC37Vmjg+AElrcCOofc35zFSVqFU7YK8eHlLQL
	3Qpnhpds2Lb2Or4HxrSBXaVzk1cpZWj2+QlMvfC55MvhWrIc1RYBnzvyQXYwGdR8
	+z3g+C5j/jI904s4zm01ZG6yLYXi1EKebAUInUdWaVFsecHH0+IRw3t1CC4jFsMZ
	eUpDv7VRuDNDYM0tgzAUyE+Kdllx/XajSQ9+4TaonfKEDlWqFfrcLBrvO7HMhdBS
	83Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691168807; x=1691255207; bh=1C9lHqY9AIyMn
	z+0a+39weAX1U+qvnK8D/Wkil1vonA=; b=vdIQ9AmIud7iHCDFPETI4JfvWMFir
	f9wuP0vfAJqOSgZunOWqlv9CIkyO/NeAB73MWfDlx67pi5cFbZKozsKFAhmKESkg
	vlRAl6EodgD3VVcaXpqPucihSXWWHy23/DHPZAURKGbfkL7ZPBMVujtIPe2XY74E
	2Mx4DubJ/NfWsRNSw023n8QZqeaHMj36zORRaePGvJ/HJRbtFkUaTKZrbFXUB0Vn
	pk6n9hNJba7qYNOJB9408usvgVkgn1vrrgHB+Uh4WM47T5fqijyRLYJLp1WRHv/o
	+V0Iz2NFo94o7iThLxnkV0bgo9YA2kfhiuO5Ge3ZGtvI+0IeRFa17/llA==
X-ME-Sender: <xms:JjDNZGA4c_55YJwPNw7piCG9s5YFRM2fY9JBaKB3fRipFRCgFpL8_Q>
    <xme:JjDNZAhdK1wmHGCiORJwBO_cjLnAv26EK6tu65gKC5im1EIXFSTjD9XpFOpyUQjSl
    wYv1XPuS2UFvBcy2ik>
X-ME-Received: <xmr:JjDNZJkkzN4p1PBgNQNoC4KIsYdoB1cQ5p4GoEWpkH4ndE67XtV0Uwi0l7hbSHdsIFwYZVHZCqUIzYd_K3ieuiQQnRyFm9h7H4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeeggddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:JjDNZEx3vPWbDGRp1KZAtZIOIXmY9ERxLoUkzPadoBdVIMk4RwYdqg>
    <xmx:JjDNZLTXwBIeDywFoLeIy3qYQUB-sWXz2j09jtAyftzZVf8g58kyiw>
    <xmx:JjDNZPYrvrBhdgzhlcW--KDO19GwTpF1NiFHI28m0OTwyPZKT0grPw>
    <xmx:JzDNZM7bdfzNreFu98jeMlIgk5bcxwL0KtY28TSf8nu2QuQwtAgcbw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Aug 2023 13:06:46 -0400 (EDT)
Date: Fri, 4 Aug 2023 12:06:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] kernel: don't fail if Modules.symvers doesn't exist
Message-ID: <ZM0wJW2MPERVwilM@heinlein.vulture-banana.ts.net>
References: <20230804162821.2333229-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6earmlysCayI0/YL"
Content-Disposition: inline
In-Reply-To: <20230804162821.2333229-1-patrick@stwcx.xyz>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 17:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104229


--6earmlysCayI0/YL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Apologies.  I sent this to the wrong ML.

On Fri, Aug 04, 2023 at 11:28:21AM -0500, Patrick Williams wrote:
> From: Joel Stanley <joel@jms.id.au>
>=20
> Kernels that do not use modules do not have the Modules.symvers file,
> which causes the previous one-liner to fail.  Invert the logic so that
> the absence of the Modules.symvers is a passing situation but we still
> get failure checking on the install operation.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/classes-recipe/kernel.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 247ef4a48a..bb5995b495 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -486,7 +486,7 @@ kernel_do_install() {
>  	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL=
_VERSION}
>  	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSIO=
N}
>  	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSI=
ON}
> -	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_I=
MAGEDEST}/Module.symvers-${KERNEL_VERSION}
> +	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL=
_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
>  }
> =20
>  # Must be ran no earlier than after do_kernel_checkout or else Makefile =
won't be in ${S}/Makefile
> @@ -555,7 +555,7 @@ do_shared_workdir () {
> =20
>  	# Copy files required for module builds
>  	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> -	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
> +	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
>  	cp .config $kerneldir/
>  	mkdir -p $kerneldir/include/config
>  	cp include/config/kernel.release $kerneldir/include/config/kernel.relea=
se
> --=20
> 2.41.0
>=20

--=20
Patrick Williams

--6earmlysCayI0/YL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmTNMCQACgkQqwNHzC0A
wRlo2Q//X+IcZENE3KrXZj/1xkoIXA6fjIdUZdOGNuYetnarDahXkujW5JzksIwY
yeKES3F3IsK3ySXFhVm8CCTD5cnG1uBd7ohl4XWgOfvPtQIq4oliKvb36yuGnR0E
Q6fXwAagCA1msGn/dSeRU3bwolbkiBpFJGBJ5x1imduG2+HgfTJhvI6VtY9wp34e
xnQBELvThjI27VJlgFGboHHnkozcAQUDtm3zivSawv8AQS/6hgXKSES0bNDq2nCm
tUvEOm8hdjsEzXPmlN1e7AVsWP+GEt1wmtIlM4eVs9SnYASUOZTUNqOf0Llu30gC
ajcYV/Fy2Gyuu9N8lOCYE22MF9QRfGpFrBab8WjH9n1XCoGhjtW48g+Usr3dsoUF
Cplw0IVcQTJEUTWOx0DY68BlCGi29UIizWQR0GRqelm/ApZVs8BfaSWGPZEMCbah
fSEegc5ZlLxP2lab3Rh4mw7GcFcDu4uh359fubXMAT2QjDMRbk5fmZ85a5SJQJku
zCmqpmNI+Usmc+XNnqvIfYEa3OfZa8WADzZTDd4gVppK80XtkaRV3jDW/9BWP+sI
gYqJMu+K++MyxE9nrCxC/pWz0XdqpzY1ZouaSw092DioghxRC1wvf4IXhd1SRcv/
tnpVYFk30jyD+AzQiHTdHmK3+5zdrRbmTilZFigGH0w38r1prhc=
=url7
-----END PGP SIGNATURE-----

--6earmlysCayI0/YL--

