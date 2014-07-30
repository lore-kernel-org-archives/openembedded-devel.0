Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7F883708B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:26:25 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so734747wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U/qG/KsJSMQTRU4rom9cxK1slOQhjhBScPMLUf01iT0=;
	b=Z+0AMeSORh6I4Y/YYSfxV1MDmlU5uFPaKK7HhHNPY5yJ+QcIrz86lGbA08u9gVn5+B
	emm/723U8B7LcvR8iJw2vI+3HxZZBix5pHUxrk6T5fqsvNTtntaVy1v7+CAqR2N80PUe
	eeirDpbsRJ5uwykIH9N4/7fF0x/j/+xUJ9tXc/YTjZ1nMKOQ9W6uhWepzJ6QyBFIZwd/
	qfAoRrJlEydtmyX4gxlyEjEsGvgFEVqOqyiLNrGOVNNPvinU9KcqM6CgdOUwRHxRq58l
	GClkSFUudgDAGPibcI6krf1Jr+vOAy36ErhLFOvVwVoq+YSB/L9kJJ5eeFK/E319lPSr
	Ynrg==
X-Received: by 10.194.104.97 with SMTP id gd1mr3066035wjb.77.1406705185916;
	Wed, 30 Jul 2014 00:26:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r1sm6489934wia.21.2014.07.30.00.26.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 00:26:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 09:26:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730072648.GG16445@jama>
References: <1406316789-27514-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1406316789-27514-1-git-send-email-akuster@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] V4 wireshark: fix build depends
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
X-List-Received-Date: Wed, 30 Jul 2014 07:26:25 -0000
X-Groupsio-MsgNum: 51312
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmvA4kSBHQVZhkR6"
Content-Disposition: inline

--fmvA4kSBHQVZhkR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 12:33:09PM -0700, Armin Kuster wrote:
> This should address issues found in test-dependencies 2014-07-25

V4 in subject belongs to [PATCHv4], I've removed it from subject after
cherry-picking it to master-next.

> wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl li=
bnl-nf libnl-route portaudio-v19 sbc
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-r=
c2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> index 5d6df40..b965fdf 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.wireshark.org"
>  SECTION =3D "network"
>  LICENSE =3D "GPL-2.0"
> =20
> -DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> +DEPENDS =3D "perl-native libcap libpcap pcre expat glib-2.0 libsmi libnl=
 portaudio-v19 sbc"
> =20
>  inherit autotools pkgconfig
> =20
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

--fmvA4kSBHQVZhkR6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYnjgACgkQN1Ujt2V2gByQWgCdFFCK9H0Zc448cyG7x2/iwez1
sJgAniGPpWiKzgLDqNOyO01MNOzzJlb1
=it2v
-----END PGP SIGNATURE-----

--fmvA4kSBHQVZhkR6--
