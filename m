Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C839D72283
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:08:50 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so5227805wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y55jISDDAdLq+UddIgljEJns12u221/kaoX48DW6r7w=;
	b=QvNOgXZy0o5iMnytDDxvL4mSs8KO++RDcfOJDXBS1iNitVAP9DcZQqML6LBFC5QQVE
	b4oYkRnI54yBvpvB7yvfYJkIZsttB/20U28mZptMv+e8+xol7QJtVDa38wSKaxsKgmb7
	lBDOfrefIzoAVX/LvqoBJwm5HYeyez1Wn8soCTD0VeHa3r1IJhRz9zlplY5PGcSwIevT
	EB9BtAKZ73FhwH75XoxZTlVqv/aYp9FzNcsNfHZz18pYTBnFkobTWrLU0vENaD9joTmm
	GIjNmlXxAC3JctvaumLum9yrvroPv2bEJev/x968cwcgFnaUYy8qdIoC2z8xLs5Iglwa
	MVQg==
X-Received: by 10.180.83.37 with SMTP id n5mr20512451wiy.83.1416827330363;
	Mon, 24 Nov 2014 03:08:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l3sm12717179wje.12.2014.11.24.03.08.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 03:08:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Nov 2014 12:08:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141124110858.GB2456@jama>
References: <1415737832-12176-1-git-send-email-ubik3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1415737832-12176-1-git-send-email-ubik3000@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: Re: [PATCH] mpd: upgrade to 0.19.3
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
X-List-Received-Date: Mon, 24 Nov 2014 11:08:52 -0000
X-Groupsio-MsgNum: 53006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 10:30:32PM +0200, Cristian Iorga wrote:
> Bug fixes.

Please fix QA issues first:

mpd-0.19.3: mpd: Files/directories were installed but not shipped
  /lib/systemd/system/mpd.socket [installed-vs-shipped]
mpd-0.19.3: mpd rdepends on libsmbclient, but it isn't a build dependency? =
[build-deps]

>=20
> Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/{mpd_0.19.1.bb =3D> mpd_0.19.3.bb}       =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.1.bb =3D> mp=
d_0.19.3.bb} (94%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
> similarity index 94%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
> index 04eed0a..23e81a6 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.3.bb
> @@ -9,8 +9,8 @@ SRC_URI =3D " \
>      http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
>      file://mpd.conf.in \
>  "
> -SRC_URI[md5sum] =3D "d235f6e53e5442b6926c49946a303f8d"
> -SRC_URI[sha256sum] =3D "8b3afcd440181c9bd18b229b5974e529d59648344dd37137=
0d6f7d62ec2847c5"
> +SRC_URI[md5sum] =3D "f539bc9e60367d5084ed14b078140ef7"
> +SRC_URI[sha256sum] =3D "fee3f3c59b5806767f23f7962621be7a62d4fcb852fff6b9=
ed6bbb5598a556d3"
> =20
>  inherit autotools useradd systemd
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRzEcoACgkQN1Ujt2V2gBzuogCfYa2f+HUg6pzkBlia+LtknFrd
wi0An1UWCiT9QkQydiXjsF4Y3l55Tvj9
=+rcn
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
