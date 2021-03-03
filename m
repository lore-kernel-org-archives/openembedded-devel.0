Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.2.1614791489976232222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHV20-0006wF-Al; Wed, 03 Mar 2021 18:11:28 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHV20-0001Se-2R; Wed, 03 Mar 2021 18:11:28 +0100
References: <20210303041650.2457462-1-raj.khem@gmail.com>
 <20210303041650.2457462-3-raj.khem@gmail.com>
User-agent: mu4e 1.4.13; emacs 28.0.50
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 3/4] v4l-utils: Package systemd fragment for systemd-udevd.service.d
In-reply-to: <20210303041650.2457462-3-raj.khem@gmail.com>
Date: Wed, 03 Mar 2021 18:11:28 +0100
Message-ID: <6rk0qo9n7j.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

please have a look at my reply to my original patch, as well.

On Wed, Mar 03 2021 at 05:16 +0100, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> index 7d96646220..3c90a68de4 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> @@ -10,7 +10,7 @@ DEPENDS_append_libc-musl =3D " argp-standalone"
>  DEPENDS_append_class-target =3D " udev"
>  LDFLAGS_append =3D " -pthread"
>=20=20
> -inherit autotools gettext pkgconfig
> +inherit autotools gettext pkgconfig systemd

As there are no unit-files in v4l-utils I don't see that inheriting
systemd.bbclass is giving us anything.

>  PACKAGECONFIG ??=3D "media-ctl"
>  PACKAGECONFIG[media-ctl] =3D "--enable-v4l-utils,--disable-v4l-utils,,"
> @@ -40,7 +40,7 @@ FILES_media-ctl =3D "${bindir}/media-ctl ${libdir}/libm=
ediactl.so.*"
>  FILES_ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules.d=
/*-infrared.rules"

I would add "50-rc_keymap.conf" to the ir-keytable package as this
fragment is necessary to make the likewise contained "70-infrared.rules"
work...

>  RDEPENDS_ir-keytable +=3D "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
>=20=20
> -FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> +FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc* ${system=
d_system_unitdir}/systemd-udevd.service.d/50-rc_keymap.conf"

... instead of adding it to the package rc-keymaps.

>  FILES_${PN} =3D "${bindir} ${sbindir}"
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
