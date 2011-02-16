Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpilK-0003Ns-64
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:53:50 +0100
Received: by iyj8 with SMTP id 8so1279944iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=FzysJugYMZKJUXX59cWLXy6qlGopGwf2DT+2GQOa4H0=;
	b=w45s1eWDTmaSMbLLFTEcwZ2k/hKBnMLRcTrAFjATw2J1Dv20FJOxmewqdwRVfEeUT2
	jUwEzqRQd4LNZVYvrlyloP+U/6vEEceMoQEmnAxXnYxVbtJMnXqvDWLLgUr3zLeWG6nE
	u/RNGS9q+6s2yzMWSkrxk7iMfK6gJVLQyer+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JjNZXKFdH/crB2Iu8DwFgLQN4lwD0a+1QW1R4rM3sVLaIwaUhjCMfbR6NbO/fwi3ek
	M3+f7984EcIUdl6BRfi+bgt8ebc4zkrA5heRNBhnGb9/V5qgn7CQpzguRhTDytVYf1Sd
	wkUbt+TswnBbuhH1TnJfUh/b6DT+yiKVEw75g=
MIME-Version: 1.0
Received: by 10.231.157.211 with SMTP id c19mr530563ibx.172.1297867958249;
	Wed, 16 Feb 2011 06:52:38 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:52:38 -0800 (PST)
In-Reply-To: <1297855134-19216-4-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-4-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:52:38 +0100
Message-ID: <AANLkTimpOOrnrZH_b9KH5fg=T1kGu5ymLXKtuyPjsACJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 04/13] cups: merge cups.inc into cups 1.2.12 recipe
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
X-List-Received-Date: Wed, 16 Feb 2011 14:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This is missing a signed-off.
Otherwise:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> ---
> =A0recipes/cups/cups.inc =A0 =A0 =A0 | =A0 89 ---------------------------=
--------------
> =A0recipes/cups/cups_1.2.12.bb | =A0 92 +++++++++++++++++++++++++++++++++=
++++++++-
> =A02 files changed, 89 insertions(+), 92 deletions(-)
> =A0delete mode 100644 recipes/cups/cups.inc
>
> diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
> deleted file mode 100644
> index 0c7b103..0000000
> --- a/recipes/cups/cups.inc
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -DESCRIPTION =3D "An Internet printing system for Unix."
> -SECTION =3D "console/utils"
> -LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
> -
> -INC_PR =3D "r7"
> -
> -SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.b=
z2 \
> - =A0 =A0 =A0 =A0 "
> -
> -inherit autotools binconfig
> -
> -EXTRA_OECONF =3D " \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-gnutls \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-dbus \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-browsing \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-tiff \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-ssl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-php \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-perl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-python \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-java \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> -
> -do_configure() {
> - =A0 =A0 =A0 export DSOFLAGS=3D"${LDFLAGS}"
> - =A0 =A0 =A0 gnu-configize
> - =A0 =A0 =A0 libtoolize --force
> - =A0 =A0 =A0 oe_runconf
> -}
> -
> -do_compile () {
> - =A0 =A0 =A0 sed -i s:STRIP:NOSTRIP: Makedefs
> - =A0 =A0 =A0 sed -i s:serial:: backend/Makefile
> -
> - =A0 =A0 =A0 echo "all:" =A0 =A0> =A0man/Makefile
> - =A0 =A0 =A0 echo "install:" >> man/Makefile
> -
> - =A0 =A0 =A0 oe_runmake "SSLLIBS=3D-lgnutls -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBPNG=3D-lpng -lm -L${STAGING_LIBD=
IR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBJPEG=3D-ljpeg -L${STAGING_LIBDIR=
}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBZ=3D-lz -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"-I."
> -}
> -
> -fakeroot do_install () {
> - =A0 =A0 =A0 oe_runmake "DSTROOT=3D${D}" install
> -
> - =A0 # This directory gets installed with perms 511, which makes packagi=
ng fail
> - =A0 chmod 0711 "${D}/${localstatedir}/run/cups/certs"
> -}
> -
> -python do_package_append() {
> - =A0 =A0 =A0 # Change permissions back the way they were, they probably =
had a reason...
> - =A0 =A0 =A0 pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
> - =A0 =A0 =A0 os.system('chmod 0511 %s/cups/var/run/cups/certs' % pkgdest=
)
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "cups_config_mangle"
> -
> -cups_config_mangle() {
> - =A0 =A0 =A0 # Undo mangle of cups_datadir and cups_serverbin
> - =A0 =A0 =A0 sed -e 's:cups_datadir=3D.*:cups_datadir=3D${datadir}/cups:=
g' \
> - =A0 =A0 =A0 =A0 =A0 -e 's:cups_serverbin=3D.*:cups_serverbin=3D${libdir=
}/cups:g' \
> - =A0 =A0 =A0 =A0 =A0 -i =A0${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/cup=
s-config
> -}
> -
> -PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
> -
> -FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
> -
> -FILES_${PN}-libimage =3D "${libdir}/libcupsimage.so.*"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/cgi-bin/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/filter/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/monitor/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/notifier/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/daemon/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -#package the html for the webgui inside the main packages (~1MB uncompre=
ssed)
> -
> -FILES_${PN} +=3D "${datadir}/doc/cups/images \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*html \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*.css \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/icons/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> diff --git a/recipes/cups/cups_1.2.12.bb b/recipes/cups/cups_1.2.12.bb
> index 167d353..1b06a53 100644
> --- a/recipes/cups/cups_1.2.12.bb
> +++ b/recipes/cups/cups_1.2.12.bb
> @@ -1,7 +1,93 @@
> -require cups.inc
> -PR =3D "${INC_PR}.3"
> +DESCRIPTION =3D "An Internet printing system for Unix."
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPL LGPL"
> +DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
>
> -SRC_URI +=3D "file://0001-cups-desktop-fix-cups-desktop-file.patch"
> +PR =3D "r8"
> +
> +SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.b=
z2 \
> + =A0 =A0 =A0 =A0 =A0 file://0001-cups-desktop-fix-cups-desktop-file.patc=
h \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +
> +inherit autotools binconfig
> +
> +EXTRA_OECONF =3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-gnutls \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-dbus \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-browsing \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-tiff \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-ssl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-php \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-perl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-python \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-java \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +
> +do_configure() {
> + =A0 =A0 =A0 export DSOFLAGS=3D"${LDFLAGS}"
> + =A0 =A0 =A0 gnu-configize
> + =A0 =A0 =A0 libtoolize --force
> + =A0 =A0 =A0 oe_runconf
> +}
> +
> +do_compile () {
> + =A0 =A0 =A0 sed -i s:STRIP:NOSTRIP: Makedefs
> + =A0 =A0 =A0 sed -i s:serial:: backend/Makefile
> +
> + =A0 =A0 =A0 echo "all:" =A0 =A0> =A0man/Makefile
> + =A0 =A0 =A0 echo "install:" >> man/Makefile
> +
> + =A0 =A0 =A0 oe_runmake "SSLLIBS=3D-lgnutls -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBPNG=3D-lpng -lm -L${STAGING_LIBD=
IR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBJPEG=3D-ljpeg -L${STAGING_LIBDIR=
}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBZ=3D-lz -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"-I."
> +}
> +
> +fakeroot do_install () {
> + =A0 =A0 =A0 oe_runmake "DSTROOT=3D${D}" install
> +
> + =A0 # This directory gets installed with perms 511, which makes packagi=
ng fail
> + =A0 chmod 0711 "${D}/${localstatedir}/run/cups/certs"
> +}
> +
> +python do_package_append() {
> + =A0 =A0 =A0 # Change permissions back the way they were, they probably =
had a reason...
> + =A0 =A0 =A0 pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
> + =A0 =A0 =A0 os.system('chmod 0511 %s/cups/var/run/cups/certs' % pkgdest=
)
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS +=3D "cups_config_mangle"
> +
> +cups_config_mangle() {
> + =A0 =A0 =A0 # Undo mangle of cups_datadir and cups_serverbin
> + =A0 =A0 =A0 sed -e 's:cups_datadir=3D.*:cups_datadir=3D${datadir}/cups:=
g' \
> + =A0 =A0 =A0 =A0 =A0 -e 's:cups_serverbin=3D.*:cups_serverbin=3D${libdir=
}/cups:g' \
> + =A0 =A0 =A0 =A0 =A0 -i =A0${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/cup=
s-config
> +}
> +
> +PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
> +
> +FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
> +
> +FILES_${PN}-libimage =3D "${libdir}/libcupsimage.so.*"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/cgi-bin/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/filter/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/monitor/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/notifier/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/daemon/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +#package the html for the webgui inside the main packages (~1MB uncompre=
ssed)
> +
> +FILES_${PN} +=3D "${datadir}/doc/cups/images \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*html \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*.css \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/icons/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0"
>
> =A0SRC_URI[md5sum] =3D "d410658468384b5ba5d04a808f6157fe"
> =A0SRC_URI[sha256sum] =3D "b4ff8e934da7db32d5654360ea9068faa0ed5a00fde021=
61ae53c2052510d00f"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


