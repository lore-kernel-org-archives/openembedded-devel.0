Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 239EC73414
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:22:33 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so10026579wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FjIfVO+vzbygps0v5U41V0w24MSje8SpX79/NFZFKNM=;
	b=Yqzo1F4WDDlNIDAJGOGHO39QBN8+70cMzIqBxbxa4c1twdbT87cz0XgRrrrzbw13hY
	AQo4gFVbxkRG/6mQPrPJvZwfCVd3X8Wz3wvASvYKuKT6CVo5YWZPmgoOy78SrY3ihrnT
	tZtDn2NOiNcieHB1iqsp4qvYEe4auwNS4IDx+zv4cEcvDmukbr4ay8Lf5RpKvI/LYAkn
	ArUmX8nEdIgDR/t8DRLCN5Y9uGfYkdgIYkzaUT0tnkMpbXri5+3CYj/yX8Myt8RqgFq+
	1IC62A+SiBTb6A2ZFMjo9CZ5iFKLstmdgzr0VEvFeK+lI/ITYs5M/Yxuy14O1Fogtw7t
	tUYw==
X-Received: by 10.194.110.69 with SMTP id hy5mr12266448wjb.121.1423779754258; 
	Thu, 12 Feb 2015 14:22:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hg7sm7401470wjb.44.2015.02.12.14.22.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:22:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:22:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212222238.GL2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-4-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1423776119-14981-4-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 03/19] modemmanager: update to 1.4.2
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
X-List-Received-Date: Thu, 12 Feb 2015 22:22:33 -0000
X-Groupsio-MsgNum: 54241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4e5ZDkbgLEOfWmLx"
Content-Disposition: inline

--4e5ZDkbgLEOfWmLx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 10:21:43PM +0100, Andreas M=FCller wrote:
> modemmanager has moved to freedesktop.org
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../modemmanager/modemmanager_1.4.2.bb             | 39 ++++++++++++++++=
++++++
>  .../networkmanager/modemmanager_0.6.0.0.bb         | 29 ----------------
>  2 files changed, 39 insertions(+), 29 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanage=
r_1.4.2.bb
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmana=
ger_0.6.0.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2=
=2Ebb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
> new file mode 100644
> index 0000000..48af426
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "ModemManager is a DBus-activated daemon which controls mobi=
le broadband (2G/3G/4G) devices and connections"

SUMMARY should be short, please change to short SUMMARY + longer=20
DESCRIPTION.

> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/ModemManager/"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +"
> +
> +inherit autotools gettext gtk-doc systemd
> +
> +DEPENDS =3D "glib-2.0 libmbim libqmi polkit udev dbus-glib"
> +
> +SRC_URI =3D "http://www.freedesktop.org/software/ModemManager/ModemManag=
er-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "fe74eaa9a77e51e552b4356b4c7195cb"
> +SRC_URI[sha256sum] =3D "07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef=
0b3a06e37703585d"
> +
> +S =3D "${WORKDIR}/ModemManager-${PV}"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/icons \
> +    ${datadir}/polkit-1 \
> +    ${libdir}/ModemManager \
> +    ${systemd_unitdir}/system \
> +"
> +
> +FILES_${PN}-dev +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${libdir}/ModemManager/*.la \
> +"
> +
> +FILES_${PN}-staticdev +=3D " \
> +    ${libdir}/ModemManager/*.a \
> +"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/ModemManager/.debug"
> +
> +SYSTEMD_SERVICE_${PN} =3D "ModemManager.service"
> +# no need to start on boot - dbus will start on demand
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6=
=2E0.0.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.=
0.bb
> deleted file mode 100644
> index 5ff18da..0000000
> --- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DEPENDS =3D "ppp udev glib-2.0 dbus-glib"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -
> -inherit gnomebase gettext
> -
> -SRC_URI =3D "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/Mode=
mManager-${PV}.tar.xz"
> -
> -SRC_URI[md5sum] =3D "f32640f6672d997ec0887307186e9639"
> -SRC_URI[sha256sum] =3D "d4468300cf4aa7baf21c8564fa515e578056f34de5a64f45=
2b053331f89e8ae2"
> -
> -S =3D "${WORKDIR}/ModemManager-${PV}"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/ModemManager/.debug \
> -                    ${libdir}/pppd/*/.debug"
> -FILES_${PN}-dev +=3D "${datadir}/dbus-1/interfaces \
> -                    ${libdir}/pppd/*/*.la \
> -                    ${libdir}/ModemManager/*.la"
> -FILES_${PN}-staticdev +=3D "\
> -                          ${libdir}/ModemManager/*.a \
> -                          ${libdir}/pppd/*/*.a"
> -FILES_${PN} +=3D "${datadir}/dbus-1/*services/ \
> -                ${libdir}/ModemManager/*.so \
> -                ${libdir}/pppd/*/*.so \
> -                ${base_libdir}/udev"
> -
> -RRECOMMENDS_${PN} +=3D "ppp"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4e5ZDkbgLEOfWmLx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdJ64ACgkQN1Ujt2V2gBwKVQCgonxK+Ewq/3qkhd3cz/j1os+F
RVYAnAxSFffuEvz7Lgt8liaOyLVt791r
=WBaP
-----END PGP SIGNATURE-----

--4e5ZDkbgLEOfWmLx--
