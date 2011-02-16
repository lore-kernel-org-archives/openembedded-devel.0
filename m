Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ppikx-0003Lo-8w
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:53:29 +0100
Received: by iwn8 with SMTP id 8so1367090iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=SDJWpFT9tSri99cQqvL/Y8ztQWemTNtehJf8xP2qVq4=;
	b=hEgYjVIbML9YantQ7TFkfl/M/G9OLVGlokFV6AEAbJME8MA/eR975qyl/6WdNgicwt
	JZP9+K968F0D2/bGkC6JXbxZH3YqcW3N1iknoEwFrWnf7IcZEsrar3IT7jKwuJdoBMND
	+D7YcRrrHcuUpsiWK5E64amSR7WHqEkqi2wIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=P4VRYPa8ZlaPY0QefBBKYEnE8zGpVxnxNYEQZ5qkhF9M+vgI2ZVRNL3mAbc5P+E0mi
	Yg/LKP+1nVesJrG7eQ7+lyO19kSe/dJ0/rT05s32ZpTsGocH4N8aM+laNkUEkVMSzE4c
	6+vzHrFvM3DG+EppRLyv/+Kn749DCavq6X8gI=
MIME-Version: 1.0
Received: by 10.231.10.200 with SMTP id q8mr534838ibq.122.1297867932001; Wed,
	16 Feb 2011 06:52:12 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:52:11 -0800 (PST)
In-Reply-To: <1297855134-19216-5-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-5-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:52:11 +0100
Message-ID: <AANLkTik=UbNv7cgRR3dgtyQpXOtJvWOZnMzKk-8HpxqU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/13] cups: merge cups14.inc into cups 1.4.4 recipe
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
X-List-Received-Date: Wed, 16 Feb 2011 14:53:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This is missing a signed off.
otherwise:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> ---
> =A0recipes/cups/cups14.inc =A0 =A0| =A0 83 ------------------------------=
--------
> =A0recipes/cups/cups_1.4.4.bb | =A0 96 ++++++++++++++++++++++++++++++++++=
+++++-----
> =A02 files changed, 85 insertions(+), 94 deletions(-)
> =A0delete mode 100644 recipes/cups/cups14.inc
>
> diff --git a/recipes/cups/cups14.inc b/recipes/cups/cups14.inc
> deleted file mode 100644
> index 0828187..0000000
> --- a/recipes/cups/cups14.inc
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -DESCRIPTION =3D "An Internet printing system for Unix."
> -SECTION =3D "console/utils"
> -LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
> -PROVIDES =3D "cups14"
> -
> -SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.b=
z2"
> -
> -LEAD_SONAME =3D "libcupsdriver.so"
> -
> -inherit autotools binconfig
> -
> -EXTRA_OECONF =3D " \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-gnutls \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-dbus \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-browsing \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-tiff \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-php \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-perl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-python \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-java \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> -
> -do_configure() {
> - =A0 =A0 =A0 gnu-configize
> - =A0 =A0 =A0 libtoolize --force
> - =A0 =A0 =A0 DSOFLAGS=3D"${LDFLAGS}" oe_runconf
> -}
> -
> -do_compile () {
> - =A0 =A0 =A0 sed -i s:STRIP:NOSTRIP: Makedefs
> - =A0 =A0 =A0 sed -i s:serial:: backend/Makefile
> -
> - =A0 =A0 =A0 echo "all:" =A0 =A0> =A0man/Makefile
> - =A0 =A0 =A0 echo "libs:" >> man/Makefile
> - =A0 =A0 =A0 echo "install:" >> man/Makefile
> - =A0 =A0 =A0 echo "install-data:" >> man/Makefile
> - =A0 =A0 =A0 echo "install-exec:" >> man/Makefile
> - =A0 =A0 =A0 echo "install-headers:" >> man/Makefile
> - =A0 =A0 =A0 echo "install-libs:" >> man/Makefile
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
> - =A0 =A0 =A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> - =A0 =A0 =A0 os.system('chmod 0511 %s/install/cups/var/run/cups/certs' %=
 workdir)
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
> diff --git a/recipes/cups/cups_1.4.4.bb b/recipes/cups/cups_1.4.4.bb
> index bf23cc5..709edf1 100644
> --- a/recipes/cups/cups_1.4.4.bb
> +++ b/recipes/cups/cups_1.4.4.bb
> @@ -1,17 +1,91 @@
> -require cups14.inc
> -
> -SRC_URI +=3D " \
> - =A0 =A0 =A0 file://use_echo_only_in_init.patch \
> - =A0 =A0 =A0 file://skip_tools.patch \
> - =A0 =A0 =A0 file://configure.patch \
> - =A0 =A0 =A0 "
> +#package the html for the webgui inside the main packages (~1MB uncompre=
ssed)
> +DESCRIPTION =3D "An Internet printing system for Unix."
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPL LGPL"
> +DEPENDS =3D "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
> +DEPENDS +=3D "virtual/libusb0"
> +PROVIDES =3D "cups14"
> +PR =3D "r3"
>
> +SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.b=
z2 \
> + =A0 =A0 =A0 =A0 =A0 file://use_echo_only_in_init.patch \
> + =A0 =A0 =A0 =A0 =A0 file://skip_tools.patch \
> + =A0 =A0 =A0 =A0 =A0 file://configure.patch \
> + =A0 =A0 =A0 =A0 =A0 "
> =A0SRC_URI[md5sum] =3D "8776403ad60fea9e85eab9c04d88560d"
> =A0SRC_URI[sha256sum] =3D "d25ffa35add3abeeec0eba60be2cffc89425b649c64ef3=
a73dfc724683a59aa3"
>
> -PR =3D "r2"
> -
> =A0DEFAULT_PREFERENCE =3D "-1"
> -DEPENDS +=3D "virtual/libusb0"
> -EXTRA_OECONF +=3D " --disable-gssapi --disable-largefile --enable-debug =
--disable-relro --enable-libusb"
> +
> +inherit autotools binconfig
> +
> +EXTRA_OECONF =3D "--enable-gnutls \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-dbus \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-browsing \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-tiff \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-php \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-perl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-python \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-java \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-gssapi \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-largefile \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-relro \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-libusb \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +
> +do_configure() {
> + =A0 =A0gnu-configize
> + =A0 =A0libtoolize --force
> + =A0 =A0DSOFLAGS=3D"${LDFLAGS}" oe_runconf
> +}
> +do_compile () {
> + =A0 =A0sed -i s:STRIP:NOSTRIP: Makedefs
> + =A0 =A0sed -i s:serial:: backend/Makefile
> + =A0 =A0echo "all:" =A0 =A0> =A0man/Makefile
> + =A0 =A0echo "libs:" >> man/Makefile
> + =A0 =A0echo "install:" >> man/Makefile
> + =A0 =A0echo "install-data:" >> man/Makefile
> + =A0 =A0echo "install-exec:" >> man/Makefile
> + =A0 =A0echo "install-headers:" >> man/Makefile
> + =A0 =A0echo "install-libs:" >> man/Makefile
> + =A0 =A0oe_runmake "SSLLIBS=3D-lgnutls -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "LIBPNG=3D-lpng -lm -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "LIBJPEG=3D-ljpeg -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "LIBZ=3D-lz -L${STAGING_LIBDIR}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "-I."
> +}
> +
> +PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
> +
> +FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
> +FILES_${PN}-libimage =3D "${libdir}/libcupsimage.so.*"
> +FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/cgi-bin/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/filter/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/monitor/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/notifier/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/daemon/.debug \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +FILES_${PN} +=3D "${datadir}/doc/cups/images \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/doc/cups/*html \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/doc/cups/*.css \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/icons/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +
> =A0CONFFILES_${PN} +=3D "${sysconfdir}/cups/cupsd.conf"
> +
> +LEAD_SONAME =3D "libcupsdriver.so"
> +
> +fakeroot do_install () {
> + =A0 =A0oe_runmake "DSTROOT=3D${D}" install
> + =A0 =A0# This directory gets installed with perms 511, which makes pack=
aging fail
> + =A0 =A0chmod 0711 "${D}/${localstatedir}/run/cups/certs"
> +}
> +
> +python do_package_append() {
> + =A0 =A0 =A0 # Change permissions back the way they were, they probably =
had a reason...
> + =A0 =A0 =A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> + =A0 =A0 =A0 os.system('chmod 0511 %s/install/cups/var/run/cups/certs' %=
 workdir)
> +}
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


