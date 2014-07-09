Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5B61F7037F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 16:19:11 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so794672wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jul 2014 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T1IhK9LXTKHY6cQyvuWhVxmaDTMQsWFl0hmatkLW+So=;
	b=tGW6ZMPGRqtocIQgpA4Lh+UNS9KQt9i2RUP8zxfd0v9hte4udiW5SCvje62eev73o/
	AcihSpFDdJVSvTVpHCV8+FJ5b+rG4AuzsYutKmM7VwZik4TiAOc22cNb/+Xxa+E1lhJI
	9MfWU4T6paIPUuPL7k8bPE+O90RBQCNILFmTkBDwXRGcU8uPZyJ/LZCNEbhXICpGMBi+
	CpBkl2AZ/eiqoC910XbClPB+X/zJn4KaYYvnnbelogfAPRN/IiFcGB68hVijfCCI2u3n
	NjkOPSL/f5NooTlURP4WQHDG5kaFVbug7w3OWmCsw+tMWvk0bLjxvdKNSYFu/oyy3FYt
	QlHg==
X-Received: by 10.181.11.232 with SMTP id el8mr12881999wid.57.1404922752642;
	Wed, 09 Jul 2014 09:19:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pq9sm104297718wjc.35.2014.07.09.09.19.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jul 2014 09:19:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Jul 2014 18:19:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140709161915.GA2116@jama>
References: <1404914122-27275-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1404914122-27275-1-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Wed, 09 Jul 2014 16:19:20 -0000
X-Groupsio-MsgNum: 50803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2014 at 04:55:22PM +0300, Jukka Rissanen wrote:
> Use the latest version of usb-modeswitch (2.2.0) and
> usb-modeswitch-data (20140529). The data package depends
> on new usb-modeswitch version so upgrade both of them at
> the same time.
>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  .../usb-modeswitch/usb-modeswitch-data_20130807.bb    | 17 -------------=
----
>  .../usb-modeswitch/usb-modeswitch-data_20140529.bb    | 17 +++++++++++++=
++++
>  .../usb-modeswitch/usb-modeswitch_2.0.1.bb            | 19 -------------=
------
>  .../usb-modeswitch/usb-modeswitch_2.2.0.bb            | 19 +++++++++++++=
++++++
>  4 files changed, 36 insertions(+), 36 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch=
-data_20130807.bb
>  create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch=
-data_20140529.bb
>  delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch=
_2.0.1.bb
>  create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch=
_2.2.0.bb
>=20
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201=
30807.bb
> deleted file mode 100644
> index e33f296..0000000
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807=
=2Ebb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "Data files for usbmodeswitch"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -inherit allarch
> -
> -SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-da=
ta-${PV}.tar.bz2"

It would be even better if you resend it with -M as README says.

If you're going to do that, then please chagne usb-modeswitch-data-${PV}
to ${BP} and "usb-modeswitch-${PV}" as well.

Thanks!

> -SRC_URI[md5sum] =3D "91feff51deba6e48e78506b8f4db2274"
> -SRC_URI[sha256sum] =3D "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5=
d94a4d35651699eb"
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> -
> -RDEPENDS_${PN} =3D "usb-modeswitch"
> -FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
> -                ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201=
40529.bb
> new file mode 100644
> index 0000000..258f740
> --- /dev/null
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529=
=2Ebb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Data files for usbmodeswitch"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +inherit allarch
> +
> +SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-da=
ta-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "dff94177781298aaf0b3c2a3c3dea6b2"
> +SRC_URI[sha256sum] =3D "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6e=
c8417aa9a587e536"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.2.0)"
> +FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
> +                ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.=
bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
> deleted file mode 100644
> index 761617c..0000000
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY =3D "A mode switching tool for controlling 'flip flop' (multiple=
 device) USB gear"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -DEPENDS =3D "libusb1"
> -
> -SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${=
PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "e48d4419d0574d342bb183f7465556d0"
> -SRC_URI[sha256sum] =3D "4706c9cfe825263e189f55730ea3d1d8634aeb15645a1098=
532e946e770f7f95"
> -
> -EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh"
> -
> -FILES_${PN} =3D "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswi=
tch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
> -RDEPENDS_${PN} =3D "tcl"
> -RRECOMMENDS_${PN} =3D "usb-modeswitch-data"
> -
> -do_install_append() {
> -	oe_runmake DESTDIR=3D${D} install
> -}
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.=
bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> new file mode 100644
> index 0000000..cdab38c
> --- /dev/null
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "A mode switching tool for controlling 'flip flop' (multiple=
 device) USB gear"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "libusb1"
> +
> +SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${=
PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "f323fe700edd6ea404c40934ddf32b22"
> +SRC_URI[sha256sum] =3D "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5=
991f7680eb908a3a"
> +
> +EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh"
> +
> +FILES_${PN} =3D "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswi=
tch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
> +RDEPENDS_${PN} =3D "tcl"
> +RRECOMMENDS_${PN} =3D "usb-modeswitch-data"
> +
> +do_install_append() {
> +	oe_runmake DESTDIR=3D${D} install
> +}
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO9a4MACgkQN1Ujt2V2gBzG4wCgoGCGKiSCh/iGGLFPzoq5/fAw
KD4An2RCu+3Klv5JmEp0JAqZqmMHOvVN
=EG2s
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
