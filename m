Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tfrew-0005nz-8h; Tue, 04 Dec 2012 13:31:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2158201eek.6
	for <multiple recipients>; Tue, 04 Dec 2012 04:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KGgyWs6MoyxeK1lSiHUUdUmLPym7ErQgJlvOn6EszMQ=;
	b=BLANUHmiD+Q/EN3XUF88/0Ukm6TEJiL5R8zZearh9C3R/ZLFmOteLp2kk2J7awmNOw
	TuxZN8WhKv8vTs45QSfvy1ChIlRvExEcjDfHtuaxvUkEG3k0bE9UmAHiuWPVvQ1jz00U
	g9BSt8kbzHqXz+EGOU8zYAAaRRZ4NfvLAUS6f43/O+TS+MEcU4xowyJ+1grRYZgTK6+y
	8NMYD/vIg/DUf4vbYe6obOQ76GLN8meaXDi2SVSZuOCev1e9w8BBDHp2wZMEZnacin3V
	RKLZfQgNxEFpWF1vLsKkTquqhFM3ZukMntGH2msGA/k0n1+u/JUO/VhapOM7tqVpxhiq
	YZIw==
Received: by 10.14.219.72 with SMTP id l48mr9471110eep.37.1354623431959;
	Tue, 04 Dec 2012 04:17:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i49sm2295967eem.6.2012.12.04.04.17.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:17:11 -0800 (PST)
Date: Tue, 4 Dec 2012 13:17:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20121204121707.GG14870@jama.jama.net>
References: <20121204094952.4CDE010383@opal>
MIME-Version: 1.0
In-Reply-To: <20121204094952.4CDE010383@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marcin Juszkiewicz : php: add apache configuration for php-fpm
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
X-List-Received-Date: Tue, 04 Dec 2012 12:31:35 -0000
X-Groupsio-MsgNum: 41971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline

--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 09:49:52AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 8424c379fba43c5073b1ca12ba6cb0546c822f3a
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D8424c379fba43c5073b1ca12ba6cb0546c822f3a
>=20
> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date:   Wed Nov 28 22:17:09 2012 +0000
>=20
> php: add apache configuration for php-fpm
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Not sure if it's caused by this patch or some other php change (except
that upgrade), but now it has more unpackaged files:

WARNING: QA Issue: php: Files/directories were installed but not shipped
  /var
  /var/run
  /var/log
  /etc/php-fpm.conf.default
  /OE
  /OE/jansa-test
  /OE/jansa-test/shr-core
  /OE/jansa-test/shr-core/tmp-eglibc
  /OE/jansa-test/shr-core/tmp-eglibc/sysroots

There was just that sysroots dir with older php version and php_5.3.19.bb=
=20
(only upgrade without other php patches)

Cheers,

>=20
> ---
>=20
>  meta-oe/recipes-devtools/php/php.inc               |    8 ++++++--
>  .../recipes-devtools/php/php/php-fpm-apache.conf   |    6 ++++++
>  meta-oe/recipes-devtools/php/php_5.3.19.bb         |    1 +
>  3 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 7850c1e..5e5a087 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -7,7 +7,7 @@ DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lem=
on-native mysql5 \
>             libc-client openssl sqlite3"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
> =20
>  SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
> =20
> @@ -65,6 +65,8 @@ do_install_append_pn-php() {
>      rm -rf ${D}/.[a-z]*
>      sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
>      install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.c=
onf
> +    install -d ${D}/${sysconfdir}/apache2/conf.d
> +    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/ap=
ache2/conf.d/php-fpm.conf
>      install -d ${D}${sysconfdir}/init.d
>      sed -i 's:=3D/usr/sbin:=3D${sbindir}:g' ${S}/sapi/fpm/init.d.php-fpm
>      sed -i 's:=3D/etc:=3D${sysconfdir}:g' ${S}/sapi/fpm/init.d.php-fpm
> @@ -72,7 +74,7 @@ do_install_append_pn-php() {
>      install -m 0755 ${S}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.=
d/php-fpm
>  }
> =20
> -PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-pear ${PN}-d=
ev ${PN}-staticdev ${PN}-doc ${PN}"
> +PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 =
${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
> =20
>  RDEPENDS_${PN}-pear =3D "${PN}"
>  RDEPENDS_${PN}-cli =3D "${PN}"
> @@ -86,7 +88,9 @@ FILES_${PN}-doc +=3D "${libdir}/php/doc"
>  FILES_${PN}-cli =3D "${bindir}/php"
>  FILES_${PN}-cgi =3D "${bindir}/php-cgi"
>  FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm"
> +FILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>  CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
> +CONFFILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.co=
nf"
>  INITSCRIPT_NAME_${PN}-fpm =3D "php-fpm"
>  INITSCRIPT_PARAMS_${PN}-fpm =3D "defaults 60"
>  FILES_${PN}-pear =3D "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
> diff --git a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf b/meta-=
oe/recipes-devtools/php/php/php-fpm-apache.conf
> new file mode 100644
> index 0000000..77cdd82
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
> @@ -0,0 +1,6 @@
> +# Taken from http://wiki.apache.org/httpd/PHP-FPM
> +
> +LoadModule proxy_module      lib/apache2/modules/mod_proxy.so
> +LoadModule proxy_fcgi_module lib/apache2/modules/mod_proxy_fcgi.so
> +
> +ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/share/apache=
2/htdocs/
> diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes=
-devtools/php/php_5.3.19.bb
> index 27baa1d..8204104 100644
> --- a/meta-oe/recipes-devtools/php/php_5.3.19.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
> @@ -15,6 +15,7 @@ SRC_URI_append_pn-php +=3D "file://iconv.patch \
>              file://php_exec_native.patch \
>              file://fix-fpm-cross-compile.patch \
>              file://php-fpm.conf \
> +            file://php-fpm-apache.conf \
>              "
> =20
>  SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC96cMACgkQN1Ujt2V2gBwC1QCgssM0XuedQmMFJiiWNpkbyC+o
mBYAn3evYAREQ6XefSnSuWjbjy/h4n+A
=WN8S
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
