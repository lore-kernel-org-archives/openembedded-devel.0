Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.8191.1604905767666331944
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 23:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kc1Ir-00005H-26; Mon, 09 Nov 2020 08:09:25 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kc1Iq-0007Ui-6m; Mon, 09 Nov 2020 08:09:24 +0100
References: <16417565E85E3454.9771@lists.openembedded.org>
User-agent: mu4e 1.4.9; emacs 26.1
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
In-reply-to: <16417565E85E3454.9771@lists.openembedded.org>
Date: Mon, 09 Nov 2020 08:09:24 +0100
Message-ID: <6rsg9j6m6z.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Gentle ping!

On Mon, Oct 26 2020 at 07:00 +0100, Ulrich ?lmann <u.oelmann@pengutronix.de=
> wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 50a487fc0b0123b154db73f79bbb18b23eb234f0)
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++--
>  .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201=
91128.bb
> index 938c0f9c26bd..ca970e59bb3a 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128=
.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128=
.bb
> @@ -11,9 +11,9 @@ SRC_URI[md5sum] =3D "e8fce7eb949cbe16c61fb71bade4cc17"
>  SRC_URI[sha256sum] =3D "3f039b60791c21c7cb15c7986cac89650f076dc274798fa2=
42231b910785eaf9"
>=20=20
>  do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> +    oe_runmake install DESTDIR=3D${D} RULESDIR=3D${D}/${nonarch_base_lib=
dir}/udev/rules.d
>  }
>=20=20
>  RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.4.0)"
> -FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
> +FILES_${PN} +=3D "${nonarch_base_libdir}/udev/rules.d/ \
>                  ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.=
bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> index baad340908ac..6a5287af4959 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> @@ -19,7 +19,7 @@ RDEPENDS_${PN} =3D "tcl"
>  RRECOMMENDS_${PN} =3D "usb-modeswitch-data"
>=20=20
>  do_install() {
> -    oe_runmake DESTDIR=3D${D} install
> +    oe_runmake DESTDIR=3D${D} UDEVDIR=3D${D}/${nonarch_base_libdir}/udev=
 install
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
>          install -d ${D}/${systemd_unitdir}/system
>          install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitd=
ir}/system
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
