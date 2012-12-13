Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjCdi-0007ir-40
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 18:32:08 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1535489pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aNQZwXqtyHe5LBomqTrMBbehJtsZFifRQRSSsTXNX4o=;
	b=mF6F2CtFl2Rkt28q5COjlpbI32+UIL2qlVpaSmFcnHrZ51prd7yb2y9DF4RNto/Tm8
	wTsrvNmNbnIWKrdOuq/+5+k4jAxIWQz5GhYcG3ah/iVa+HMUNZSG2x8UnTlekM8Fk1Sr
	0h97zlLa7V7D2EzL+E0E3NYr0eTRYbaJvxOvUTwRicLfL1tzT9kyc1ozZHiu+KEs+E5F
	Zfe5t7OsX86s72gySn7T0feTqR+/jGW71Ajpc3U7f4sgeHYqGnWnJnNgChhxO/6eH8G8
	1HQRy7t4FEF+2sasDoiXzyQ1BzHKQ8r2iKwo64jHoM2XdJNtF0bagcjW7KgUWbOrwjf1
	wK6g==
Received: by 10.68.223.230 with SMTP id qx6mr7303564pbc.159.1355419050063;
	Thu, 13 Dec 2012 09:17:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d1sm1573938pav.6.2012.12.13.09.17.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 09:17:28 -0800 (PST)
Date: Thu, 13 Dec 2012 18:17:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121213171741.GD3356@jama.jama.net>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1355394929-25182-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1355394929-25182-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/7] modemmanager: update to 0.6.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 17:32:08 -0000
X-Groupsio-MsgNum: 42130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 11:35:23AM +0100, Marcin Juszkiewicz wrote:
> All *.a files moved to -staticdev
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../dont-include-private-glib-headers.patch        | 94 ----------------=
------
>  ...modemmanager_0.5.bb =3D> modemmanager_0.6.0.0.bb} | 16 ++--
>  2 files changed, 8 insertions(+), 102 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmana=
ger/dont-include-private-glib-headers.patch
>  rename meta-oe/recipes-connectivity/networkmanager/{modemmanager_0.5.bb =
=3D> modemmanager_0.6.0.0.bb} (59%)
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager/don=
t-include-private-glib-headers.patch b/meta-oe/recipes-connectivity/network=
manager/modemmanager/dont-include-private-glib-headers.patch
> deleted file mode 100644
> index 71dffc0..0000000
> --- a/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-inclu=
de-private-glib-headers.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From 28f64090dfa15097587bbea69209df10b8ab8593 Mon Sep 17 00:00:00 2001
> -From: Aleksander Morgado <aleksander@lanedo.com>
> -Date: Mon, 24 Oct 2011 19:09:11 +0000
> -Subject: core: don't include private headers from glib
> -
> -The "glib/gtypes.h" is now considered private, and only "glib.h" should =
be
> -included directly.
> ----
> -diff --git a/src/mm-at-serial-port.h b/src/mm-at-serial-port.h
> -index 5d5f13f..cec5dc3 100644
> ---- a/src/mm-at-serial-port.h
> -+++ b/src/mm-at-serial-port.h
> -@@ -18,7 +18,6 @@
> - #define MM_AT_SERIAL_PORT_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - #include "mm-serial-port.h"
> -diff --git a/src/mm-manager.h b/src/mm-manager.h
> -index 1c98458..c6a64bd 100644
> ---- a/src/mm-manager.h
> -+++ b/src/mm-manager.h
> -@@ -17,7 +17,6 @@
> - #ifndef MM_MANAGER_H
> - #define MM_MANAGER_H
> -=20
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> - #include <dbus/dbus-glib.h>
> - #include "mm-modem.h"
> -diff --git a/src/mm-modem-base.h b/src/mm-modem-base.h
> -index 933aae1..be11af6 100644
> ---- a/src/mm-modem-base.h
> -+++ b/src/mm-modem-base.h
> -@@ -18,7 +18,6 @@
> - #define MM_MODEM_BASE_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - #include "mm-port.h"
> -diff --git a/src/mm-plugin-base.h b/src/mm-plugin-base.h
> -index 4b0932c..5b049a4 100644
> ---- a/src/mm-plugin-base.h
> -+++ b/src/mm-plugin-base.h
> -@@ -17,7 +17,6 @@
> - #define MM_PLUGIN_BASE_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - #define G_UDEV_API_IS_SUBJECT_TO_CHANGE
> -diff --git a/src/mm-port.h b/src/mm-port.h
> -index 4bcffd4..df935db 100644
> ---- a/src/mm-port.h
> -+++ b/src/mm-port.h
> -@@ -17,7 +17,6 @@
> - #define MM_PORT_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - typedef enum {
> -diff --git a/src/mm-qcdm-serial-port.h b/src/mm-qcdm-serial-port.h
> -index 2786ee8..605016d 100644
> ---- a/src/mm-qcdm-serial-port.h
> -+++ b/src/mm-qcdm-serial-port.h
> -@@ -18,7 +18,6 @@
> - #define MM_QCDM_SERIAL_PORT_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - #include "mm-serial-port.h"
> -diff --git a/src/mm-serial-port.h b/src/mm-serial-port.h
> -index eb12cbb..9450926 100644
> ---- a/src/mm-serial-port.h
> -+++ b/src/mm-serial-port.h
> -@@ -18,7 +18,6 @@
> - #define MM_SERIAL_PORT_H
> -=20
> - #include <glib.h>
> --#include <glib/gtypes.h>
> - #include <glib-object.h>
> -=20
> - #include "mm-port.h"
> ---
> -cgit v0.9.0.2-2-gbebe
> diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5=
=2Ebb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
> similarity index 59%
> rename from meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.=
bb
> rename to meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.=
0.bb
> index 55e083a..a58685b 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
> @@ -3,23 +3,23 @@ DEPENDS =3D "ppp udev glib-2.0"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  inherit gnome gettext
> =20
> -SRC_URI =3D "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/Mode=
mManager-${PV}.tar.bz2 \
> -file://dont-include-private-glib-headers.patch"=20
> +SRC_URI =3D "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/Mode=
mManager-${PV}.tar.xz"
> =20
> -SRC_URI[md5sum] =3D "cd04109506e88bf4c4cd3e7ce0034c08"
> -SRC_URI[sha256sum] =3D "108de70537b1193634883fa6b3642b130a23f4c04d901cb1=
5caeceb486af6152"
> +SRC_URI[md5sum] =3D "f32640f6672d997ec0887307186e9639"
> +SRC_URI[sha256sum] =3D "d4468300cf4aa7baf21c8564fa515e578056f34de5a64f45=
2b053331f89e8ae2"
> =20
>  S =3D "${WORKDIR}/ModemManager-${PV}"
> =20
>  FILES_${PN}-dbg +=3D "${libdir}/ModemManager/.debug \
>                      ${libdir}/pppd/*/.debug"
> -FILES_${PN}-dev +=3D "${datadir}/dbus-1/interfaces \
> -                    ${libdir}/ModemManager/*a \
> -                    ${libdir}/pppd/*/*a"
> +FILES_${PN}-dev +=3D "${datadir}/dbus-1/interfaces"
> +FILES_${PN}-staticdev +=3D "\
> +                          ${libdir}/ModemManager/*.a \
> +                          ${libdir}/pppd/*/*.a"
>  FILES_${PN} +=3D "${datadir}/dbus-1/*services/ \
>                  ${libdir}/ModemManager/*.so \
>                  ${libdir}/pppd/*/*.so \

It's better, it builds now :).

But FILES_* changes are not correct, keep *.la in PN-dev.

WARNING: QA Issue: modemmanager: Files/directories were installed but
not shipped
  /usr/lib/ModemManager/libmm-plugin-zte.la
  /usr/lib/ModemManager/libmm-plugin-mbm.la
  /usr/lib/ModemManager/libmm-plugin-moto-c.la
  /usr/lib/ModemManager/libmm-plugin-huawei.la
  /usr/lib/ModemManager/libmm-plugin-iridium.la
  /usr/lib/ModemManager/libmm-plugin-longcheer.la
  /usr/lib/ModemManager/libmm-plugin-option.la
  /usr/lib/ModemManager/libmm-plugin-x22x.la
  /usr/lib/ModemManager/libmm-plugin-wavecom.la
  /usr/lib/ModemManager/libmm-plugin-cinterion.la
  /usr/lib/ModemManager/libmm-plugin-novatel.la
  /usr/lib/ModemManager/libmm-plugin-generic.la
  /usr/lib/ModemManager/libmm-plugin-samsung.la
  /usr/lib/ModemManager/libmm-plugin-nokia.la
  /usr/lib/ModemManager/libmm-plugin-linktop.la
  /usr/lib/ModemManager/libmm-plugin-simtech.la
  /usr/lib/ModemManager/libmm-plugin-sierra.la
  /usr/lib/ModemManager/libmm-plugin-hso.la
  /usr/lib/ModemManager/libmm-plugin-anydata.la
  /usr/lib/ModemManager/libmm-plugin-gobi.la
  /usr/lib/pppd/2.4.5/mm-test-pppd-plugin.la

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDKDbUACgkQN1Ujt2V2gByE+wCeLVw4bU4erzFd1F4VKYqBBltb
7VIAnRJc1BnNCBEsSP9cs83GWZbzap4t
=0UL2
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
