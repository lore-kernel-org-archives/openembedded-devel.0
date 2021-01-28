Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.20863.1611814566803132092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 22:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1l50b7-0003RB-6q; Thu, 28 Jan 2021 07:16:05 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1l50b6-0005sK-Rz; Thu, 28 Jan 2021 07:16:04 +0100
References: <165C3A563363138B.8233@lists.openembedded.org>
User-agent: mu4e 1.4.13; emacs 28.0.50
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>, Khem Raj
 <raj.khem@gmail.com>, Ulrich
 =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] zram: fix sourcing of zram parameters
In-reply-to: <165C3A563363138B.8233@lists.openembedded.org>
Date: Thu, 28 Jan 2021 07:16:04 +0100
Message-ID: <6rpn1plh7f.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Gentle ping!

On Thu, Jan 21 2021 at 12:01 +0100, Ulrich ?lmann <u.oelmann@pengutronix.de=
> wrote:
> From: S=C3=B8ren Andersen <san@skov.dk>
>
> Signed-off-by: S=C3=B8ren Andersen <san@skov.dk>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/=
recipes-extended/zram/zram/zram-swap-init
> index 0643dbca2341..ccc3aafe3a6f 100755
> --- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
> +++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
> @@ -14,7 +14,7 @@ fi
>  ZRAM_SIZE_PERCENT=3D100
>  ZRAM_ALGORITHM=3Dlz4
>=20=20
> -[ -f /etc/default/zram ] && ./etc/default/zram || true
> +[ -f /etc/default/zram ] && . /etc/default/zram || true
>=20=20
>  memtotal=3D$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
>  memzram=3D$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
