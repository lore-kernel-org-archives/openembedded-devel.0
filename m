Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f46.google.com (unknown [209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 98E786116C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 10:07:59 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id ec20so1392097lab.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5baQ+9H+yahZl0rMaZHLHpow8Xw1vh/vE+Z8oxoxv2A=;
	b=FB5rzLzh931pd75Wn/sYAY+Q5Nl3/m1gqtgh71kMHdZc5emO6zysYlucwvGgyiedCb
	mnpKme9aWwlzFKfwHxeD0qp4J2nLZKDonFlFttsY81J+CfIMz+g5eJerecMOkT+6KWnL
	aLk2FCQMV3VpV/YFJH1BF0PnLyfnjM/fiNBUksX7kka3fuFzcG1LrsNchkCqm2QjjxVX
	PYoUmdF30MZnKaaov11WuUUfJI38xZD1Hxl0xo/s0YRcsJ9pHFrVc7frxwCQbKmtQzMs
	8gxlKK6AwP0AOw6pgRaSFVFueqBBjz63QU2B4cshdQ/kYC0si8fLweuanuK0d93NBOD0
	muiQ==
X-Received: by 10.152.8.137 with SMTP id r9mr17166372laa.14.1400666880329;
	Wed, 21 May 2014 03:08:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mk2sm1373023lbc.8.2014.05.21.03.07.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 03:07:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 May 2014 12:08:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140521100802.GD2424@jama>
References: <1400664578-5278-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1400664578-5278-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [OE-core][PATCH] libav: add version 10.1
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
X-List-Received-Date: Wed, 21 May 2014 10:08:02 -0000
X-Groupsio-MsgNum: 49999
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 11:29:38AM +0200, Matthieu Crapet wrote:
> Using common libav.inc
> Notice that DEFAULT_PREFERENCE =3D "-1" is not included.

Wrong ML.

> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/recipes-multimedia/libav/libav_10.1.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libav/libav_10.1.bb
>=20
> diff --git a/meta/recipes-multimedia/libav/libav_10.1.bb b/meta/recipes-m=
ultimedia/libav/libav_10.1.bb
> new file mode 100644
> index 0000000..54e4056
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav_10.1.bb
> @@ -0,0 +1,14 @@
> +require libav.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263 \
> +                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> +                    file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18=
d1b79df004 \
> +                    file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
> +
> +SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "0f751b439b6a5525d4c8a214f0db6aac"
> +SRC_URI[sha256sum] =3D "d5e04dc9adf43a467aa628f622425697d587a29cb0b997b4=
5459f59cb00f9e15"
> +
> +# Options for Libav version 10+
> +PACKAGECONFIG[webp] =3D "--enable-libwebp,--disable-libwebp,libwebp"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN8ewIACgkQN1Ujt2V2gBzJPQCfQCdHFN8tHKyUo8cNtpgG1rBu
Y1YAn3EoptnXMNQkiagqCK347MkA02pt
=p/NN
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
