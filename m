Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 416A96010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:52:02 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so6696865wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eZgiXdqP9gcYoXWMpP9TfXtvmldyfnx63V02BlHUJ5A=;
	b=aSWPEUKLc53NFffe4Z0D1Tn6ITAWFcJ725zPiqY0fIlYcjI12zZGybcUx4umuf0Vbl
	+JrjaOXvAWpu4V8ZKrru70/U22kdEv1IAUmXKLGPKgl/6lXyFqYNKUNgagjroD1iAd8v
	8GT8FZ6ieyMYfZ8dttEhE/3xRgMCRngMOOeSsb8l/TsyrTL9LGygsQjmfy9e2+hvMoi+
	2LlDwvlGy2KNGIdl1/4DGO1QLKi8rjo9kVf8HZSi5vYoR0V9g8+zvc2d8Wzux/mbRkAN
	5g0I1YBsiSfASwLqjwTEd3IsjR6LH9xivrU7DcRu42VdZSV65/s8KK0VxcenfkthtufR
	Mtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eZgiXdqP9gcYoXWMpP9TfXtvmldyfnx63V02BlHUJ5A=;
	b=V02DPg9Hfg8U/vhoAPWnvd8DYcLHF0SCAk1ymGN502b710yytVcHSuINiC1S6ohOsP
	ahPJ1369+UMEAbFeZU75mkJVsDC0YCbDyIhJ27jrLFAhnplxJ5HRJy+LKwWgmc0ilQzI
	dw29WoDyA27iHCtm6w5/JszUH4U3iK0uhweUrwSZ0W3Zr5Tj0AivXsBLUnRzBUaTyNcr
	5nCzGxsO0nMijovqzyuUg21vzKrilhftyU7efMhcg8O4RjH40MV1XAA2jPiTPXVANjF4
	5uwlHUo+rMYZnvJz3KWmKPRCfFqP+pQbzUQr2bJxUllGwupUTsc9oHDrfVDX90IUUY+f
	icQA==
X-Gm-Message-State: AKaTC00Jq1OZQSu6H2YDoIsZ2fCW0ecCYo9m0tkaaeSgJTQ+O5ENnJAy9iDpewlR47zZTw==
X-Received: by 10.194.51.137 with SMTP id k9mr15144170wjo.1.1479833523429;
	Tue, 22 Nov 2016 08:52:03 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z6sm31720113wjt.24.2016.11.22.08.52.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Nov 2016 08:52:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Nov 2016 17:52:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161122165203.GC3348@jama>
References: <1475714017-9205-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1475714017-9205-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2.1
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
X-List-Received-Date: Tue, 22 Nov 2016 16:52:03 -0000
X-Groupsio-MsgNum: 63948
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline

--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2016 at 05:33:37PM -0700, Armin Kuster wrote:
> Restore PE
>=20
> includes 2 security fixes:
> wnpa-sec-2016-57. NCP dissector crash. Fixed in 2.2.1.
> wnpa-sec-2016-56. Bluetooth L2CAP dissector crash. Fixed in 2.2.1.
>=20
> see https://www.wireshark.org/docs/relnotes/wireshark-2.2.1.html

It didn't last building for very long, now it seems to be broken by
libpcap upgrade in oe-core:

http://errors.yoctoproject.org/Errors/Details/104702/

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../wireshark/{wireshark_2.2.0.bb =3D> wireshark_2.2.1.bb}             |=
 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.2.0.bb =3D=
> wireshark_2.2.1.bb} (93%)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> similarity index 93%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> index dca3be6..a5fb7f6 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> @@ -8,8 +8,9 @@ DEPENDS =3D "pcre expat glib-2.0 sbc"
> =20
>  SRC_URI =3D "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz=
2"
> =20
> -SRC_URI[md5sum] =3D "c7de0997f74934f25b456846cf75cb81"
> -SRC_URI[sha256sum] =3D "a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f8=
0d4388ad2f3f1104"
> +PE =3D "1"
> +SRC_URI[md5sum] =3D "49a1023a69ac108ca089d750eee50e37"
> +SRC_URI[sha256sum] =3D "900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9a=
fd75a7103e569149"
> =20
>  inherit autotools pkgconfig perlnative
> =20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDR3sgAKCRA3VSO3ZXaA
HLw0AJ0TW1r39zRVeMziNMqv1fDvM0j1vwCfbDAKzCHpnkuUbCmoAmHy8IjrWTc=
=AjLx
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
