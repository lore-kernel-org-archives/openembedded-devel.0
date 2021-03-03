Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.665.1614797993068385300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHWit-00047a-E7; Wed, 03 Mar 2021 19:59:51 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHWis-0005JO-Pp; Wed, 03 Mar 2021 19:59:50 +0100
References: <20210303174126.2760744-1-raj.khem@gmail.com>
User-agent: mu4e 1.4.13; emacs 28.0.50
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH v2] v4l-utils: Package systemd fragment for systemd-udevd.service.d
In-reply-to: <20210303174126.2760744-1-raj.khem@gmail.com>
Date: Wed, 03 Mar 2021 19:59:50 +0100
Message-ID: <6rft1c9i6x.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03 2021 at 18:41 +0100, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
> v2: Package it in ir-keytable
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> index 7d96646220..3e92d49b4f 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> @@ -37,7 +37,8 @@ RPROVIDES_${PN}-dbg +=3D "libv4l-dbg"
>=20=20
>  FILES_media-ctl =3D "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
>=20=20
> -FILES_ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules.d=
/*-infrared.rules"
> +FILES_ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules.d=
/*-infrared.rules \
> +                     ${systemd_system_unitdir}/systemd-udevd.service.d/5=
0-rc_keymap.conf"
>  RDEPENDS_ir-keytable +=3D "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
>=20=20
>  FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"

Acked-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
