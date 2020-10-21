Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.8532.1603268441158385052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kV9MK-0007Vg-Lz; Wed, 21 Oct 2020 10:20:36 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kV9MJ-0004Km-CH; Wed, 21 Oct 2020 10:20:35 +0200
References: <20201020091053.27879-1-u.oelmann@pengutronix.de> <c08fc5cb-900f-3ec1-58d0-c6f2a61e2b47@gmail.com>
User-agent: mu4e 1.4.9; emacs 26.1
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
In-reply-to: <c08fc5cb-900f-3ec1-58d0-c6f2a61e2b47@gmail.com>
Date: Wed, 21 Oct 2020 10:20:35 +0200
Message-ID: <6r362856ss.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Khem!

On Tue, Oct 20 2020 at 18:54 +0200, Khem Raj <raj.khem@gmail.com> wrote:
> On 10/20/20 2:10 AM, Ulrich ?lmann wrote:
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++-=
-
>>   .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data=
_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0191128.bb
>> index 938c0f9c26bd..ca970e59bb3a 100644
>> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201911=
28.bb
>> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201911=
28.bb
>> @@ -11,9 +11,9 @@ SRC_URI[md5sum] =3D "e8fce7eb949cbe16c61fb71bade4cc17=
"
>>   SRC_URI[sha256sum] =3D "3f039b60791c21c7cb15c7986cac89650f076dc274798=
fa242231b910785eaf9"
>>  =20
>>   do_install() {
>> -    oe_runmake install DESTDIR=3D${D}
>> +    oe_runmake install DESTDIR=3D${D} RULESDIR=3D${D}/${nonarch_base_l=
ibdir}/udev/rules.d
>>   }
>>  =20
>>   RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.4.0)"
>> -FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
>> +FILES_${PN} +=3D "${nonarch_base_libdir}/udev/rules.d/ \
>>                   ${datadir}/usb_modeswitch"
>> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.=
0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>> index baad340908ac..0143a258b01a 100644
>> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>> @@ -12,7 +12,7 @@ inherit pkgconfig systemd
>>  =20
>>   SYSTEMD_SERVICE_${PN} =3D "usb_modeswitch@.service"
>>  =20
>> -EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh"
>> +EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh UDEVDIR=3D${D}/${nonarch_base_=
libdir}/udev"
>
> Can we use STAGING_DIR_TARGET instead of D here

Good point!

As UDEVDIR is only used in the install target of usb-modeswitch's
Makefile the correct approach seems to be to stick with D, not switch to
STAGING_DIR_TARGET, but instead move the assignment of UDEVDIR to the
call of "oe_runmake ... install" in do_install() - sending v2 in a
minute.

Thanks
Ulrich


>>  =20
>>   FILES_${PN} =3D "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/=
usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
>>   RDEPENDS_${PN} =3D "tcl"
>>=20
>>=20
>>=20
>>=20
>>=20
>
>=20
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann           =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
