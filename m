Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEE3727B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 12:49:38 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so4461167wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y9JuHXZRqvG7plbh7xkg49szPcik8m5TqyYtIMo3PYw=;
	b=X/Q7sLi9NhcyX7Ys+jSECweNdYW8QP3P3FRjMlLcUJA8RNpP63KHOi6G2/yvNLKJn1
	kgscPNwmwVBjMCxqLDBkORmUNym217tVluWbN8jlE+oQapZ8bsOLPfOpGaId/DookpCO
	6FwNoZUIlS76tAVb+CoR1Y0ULiZEtLFu5BX1/Qb9F9C4xXkN0As5vL2N6JfcIe5GdmN5
	KxRwHZ/X9BZY4HJ+ndhhn2gFizEnnI7fJYahYPjY55ZqHc+WUjxordKkvBK9rV7MF/I/
	MXvbldGVlAMjeT1Fg+ep08AdPdOTtaQam7JCC7RkEDMaEQpDxVrpC+CCJRAA/FL0bbK+
	wIeg==
X-Received: by 10.180.78.202 with SMTP id d10mr135089428wix.82.1420202978883; 
	Fri, 02 Jan 2015 04:49:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	js5sm54031931wid.11.2015.01.02.04.49.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 04:49:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Jan 2015 13:49:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150102124942.GH2469@jama>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
	<5a7e4d1f909cba9ca5ff38262fcf638fc880028a.1420190530.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5a7e4d1f909cba9ca5ff38262fcf638fc880028a.1420190530.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 03/11] php: integrate modphp
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
X-List-Received-Date: Fri, 02 Jan 2015 12:49:42 -0000
X-Groupsio-MsgNum: 53565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TKYYegg/GYAC5JIZ"
Content-Disposition: inline

--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 02, 2015 at 09:31:58AM +0000, Paul Eggleton wrote:
> Build the mod-php Apache module within the main php recipe; this avoids
> files in the sysroot from stepping on eachother and therefore avoids the
> resulting build failure.
>=20
> Changes made:
> * Add an "apache2" PACKAGECONFIG, default enabled. This does mean that
>   apache2 is a build dependency by default; if you don't want this,
>   set your own PACKAGECONFIG value for the php recipe.

I think it should be disabled by default, because meta-oe layer doesn't
depend on meta-webserver layer where apache2 lives.

meta-webserver can have .bbappend which will add it to PACKAGECONFIG for
xdebug to work with default php recipe.

> * Specify ${libdir}/php5 as libdir. This avoids the PHP extensions
>   directory being /usr/lib/extensions by default which is ugly.
> * Bring in most patches and configure options from the modphp recipe.
> * Tidy up some superfluous/malformed entries in FILES_${PN}-pear
> * Drop obsolete PHP_MAJVER
> * Replace virtclass- override with class-
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-devtools/php/php/70_mod_php5.conf  |  12 ++
>  meta-oe/recipes-devtools/php/php/configure.patch   |  11 ++
>  .../php/php/pthread-check-threads-m4.patch         |  30 +++++
>  meta-oe/recipes-devtools/php/php_5.5.15.bb         | 144 +++++++++++++++=
+-----
>  4 files changed, 164 insertions(+), 33 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/php/php/70_mod_php5.conf
>  create mode 100644 meta-oe/recipes-devtools/php/php/configure.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/pthread-check-thread=
s-m4.patch
>=20
> diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php5.conf b/meta-oe/=
recipes-devtools/php/php/70_mod_php5.conf
> new file mode 100644
> index 0000000..1de6fb1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/70_mod_php5.conf
> @@ -0,0 +1,12 @@
> +# vim: ft=3Dapache sw=3D4 ts=3D4
> +<IfDefine PHP5>
> +	# Load the module first
> +	<IfModule !sapi_apache2.c>
> +		LoadModule php5_module    lib/apache2/modules/libphp5.so
> +	</IfModule>
> +
> +	# Set it to handle the files
> +	AddHandler php5-script .php .phtml .php3 .php4 .php5
> +	AddType application/x-httpd-php-source .phps
> +	DirectoryIndex index.html index.html.var index.php index.phtml
> +</IfDefine>
> diff --git a/meta-oe/recipes-devtools/php/php/configure.patch b/meta-oe/r=
ecipes-devtools/php/php/configure.patch
> new file mode 100644
> index 0000000..c5334c7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/configure.patch
> @@ -0,0 +1,11 @@
> +--- php-5.1.6/configure.old	2006-09-12 07:54:14.000000000 -0700
> ++++ php-5.1.6/configure	2006-09-12 07:54:37.000000000 -0700
> +@@ -14715,8 +14715,6 @@
> +=20
> +=20
> +=20
> +-  unset ac_cv_func_dlopen
> +-  unset ac_cv_func___dlopen
> +   unset found
> +  =20
> +   echo $ac_n "checking for dlopen""... $ac_c" 1>&6
> diff --git a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.pa=
tch b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> new file mode 100644
> index 0000000..0c564cd
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> @@ -0,0 +1,30 @@
> +From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 8 Apr 2013 14:29:51 +0800
> +Subject: [PATCH] pthread-check
> +
> +Enable pthreads support when cross-compiling
> +
> +Upstream-Status: Inapproprate [config]
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + TSRM/threads.m4 |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
> +index 38494ce..15d9454 100644
> +--- a/TSRM/threads.m4
> ++++ b/TSRM/threads.m4
> +@@ -86,7 +86,7 @@ int main() {
> +   pthreads_working=3Dno
> +   ], [
> +   dnl For cross compiling running this test is of no use. NetWare suppo=
rts pthreads
> +-  pthreads_working=3Dno
> ++  pthreads_working=3Dyes
> +   case $host_alias in
> +   *netware*)
> +     pthreads_working=3Dyes
> +--=20
> +1.7.4.1
> +
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.15.bb b/meta-oe/recipes=
-devtools/php/php_5.5.15.bb
> index ff81aee..0a99bb4 100644
> --- a/meta-oe/recipes-devtools/php/php_5.5.15.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.5.15.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION =3D "A server-side, HTML-embedded scripting language. This p=
ackage provides the CGI."
> +SUMMARY =3D "A server-side, HTML-embedded scripting language"
>  HOMEPAGE =3D "http://www.php.net"
>  SECTION =3D "console/network"
> =20
> @@ -6,13 +6,9 @@ LICENSE =3D "PHP-3.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52dd90569008fee5bcdbb22d945b1=
108"
> =20
>  BBCLASSEXTEND =3D "native"
> -DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native \
> -           libc-client openssl libmcrypt"
> -DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> -
> -# The new PHP downloads server groups PHP releases by major version so f=
ind
> -# the major version of the PHP recipe.
> -PHP_MAJVER =3D "${@d.getVar('PV',1).split('.')[0]}"
> +DEPENDS =3D "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native=
 \
> +           uw-imap openssl libmcrypt"
> +DEPENDS_class-native =3D "zlib-native libxml2-native"
> =20
>  SRC_URI =3D "http://php.net/distributions/php-${PV}.tar.bz2 \
>             file://acinclude-xml2-config.patch \
> @@ -28,6 +24,9 @@ SRC_URI_append_class-target +=3D " \
>              file://php_exec_native.patch \
>              file://php-fpm.conf \
>              file://php-fpm-apache.conf \
> +            file://configure.patch \
> +            file://pthread-check-threads-m4.patch \
> +            file://70_mod_php5.conf \
>            "
> =20
>  SRC_URI[md5sum] =3D "5cb5f2ed9099299f8a4c952d59d93812"
> @@ -37,53 +36,97 @@ S =3D "${WORKDIR}/php-${PV}"
> =20
>  inherit autotools pkgconfig pythonnative gettext
> =20
> +# phpize is not scanned for absolute paths by default (but php-config is=
).
> +#
> +SSTATE_SCAN_FILES +=3D "phpize"
>  SSTATE_SCAN_FILES +=3D "build-defs.h"
> =20
> +PHP_LIBDIR =3D "${libdir}/php5"
> +
>  # Common EXTRA_OECONF
> -COMMON_EXTRA_OECONF =3D "--enable-sockets --enable-pcntl --enable-shared=
 --disable-opcache"
> +COMMON_EXTRA_OECONF =3D "--enable-sockets \
> +                       --enable-pcntl \
> +                       --enable-shared \
> +                       --disable-opcache \
> +                       --disable-rpath \
> +                       --with-pic \
> +                       --libdir=3D${PHP_LIBDIR} \
> +"
>  EXTRA_OECONF =3D "--enable-mbstring \
>                  --enable-wddx \
>                  --enable-fpm \
> +                --enable-zip \
>                  --with-imap=3D${STAGING_DIR_HOST} \
>                  --with-gettext=3D${STAGING_LIBDIR}/.. \
>                  --with-imap-ssl=3D${STAGING_DIR_HOST} \
>                  --with-zlib=3D${STAGING_LIBDIR}/.. \
>                  --with-iconv=3D${STAGING_LIBDIR}/.. \
>                  --with-mcrypt=3D${STAGING_DIR_TARGET}${exec_prefix} \
> +                --with-bz2=3D${STAGING_DIR_TARGET}${exec_prefix} \
> +                --with-config-file-path=3D${sysconfdir}/php/apache2-php5=
 \
> +                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_=
c_bigendian_php=3Dno', 'ac_cv_c_bigendian_php=3Dyes', d)} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> -EXTRA_OECONF_virtclass-native =3D " \
> +EXTRA_OECONF_class-native =3D " \
>                  --with-zlib=3D${STAGING_LIBDIR_NATIVE}/.. \
>                  --without-iconv \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> =20
> -PACKAGECONFIG ??=3D "mysql sqlite3"
> +PACKAGECONFIG ??=3D "mysql sqlite3 apache2"
>  PACKAGECONFIG_class-native =3D ""
> =20
>  PACKAGECONFIG[mysql] =3D "--with-mysql=3D${STAGING_DIR_TARGET}${prefix} \
>                          --with-mysqli=3D${STAGING_BINDIR_CROSS}/mysql_co=
nfig \
>                          --with-pdo-mysql=3D${STAGING_BINDIR_CROSS}/mysql=
_config \
> -                        , \
> +                        ,--without-mysql --without-mysqli --without-pdo-=
mysql \
>                          ,mysql5"
> =20
>  PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_LIBDIR}/.. \
>                            --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
>                            , \
>                            ,sqlite3"
> +PACKAGECONFIG[pgsql] =3D "--with-pgsql=3D${STAGING_DIR_TARGET}${exec_pre=
fix},--without-pgsql,postgresql"
> +PACKAGECONFIG[soap] =3D "--enable-libxml --enable-soap, --disable-soap, =
libxml2"
> +PACKAGECONFIG[apache2] =3D "--with-apxs2=3D${STAGING_BINDIR_CROSS}/apxs,=
,apache2-native apache2"
> +
> =20
>  export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
>  export PHP_PEAR_PHP_BIN =3D "${STAGING_BINDIR_NATIVE}/php"
> -CFLAGS +=3D " -D_GNU_SOURCE"
> +CFLAGS +=3D " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${=
STAGING_INCDIR}/apache2"
> =20
>  EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
> =20
>  acpaths =3D ""
> =20
> +do_configure_prepend () {
> +    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
> +    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=3D.*!APXS=
_HTTPD=3D${STAGING_BINDIR_NATIVE}/httpd!'
> +}
> +
> +do_configure_append() {
> +    # No, libtool, we really don't want rpath set...
> +    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=
=3D""|g' ${HOST_SYS}-libtool
> +    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' =
${HOST_SYS}-libtool
> +}
> +
>  do_install_append_class-native() {
> -    rm -rf ${D}/${libdir}/php/.registry
> -    rm -rf ${D}/${libdir}/php/.channels
> -    rm -rf ${D}/${libdir}/php/.[a-z]*
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
> +    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
> +}
> +
> +do_install_prepend() {
> +    cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy=
/ltoptions.m4 \
> +        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > ${S}/build/l=
ibtool.m4
> +}
> +
> +do_install_prepend_class-target() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false',=
 d)}; then
> +        # Install dummy config file so apxs doesn't fail
> +        install -d ${D}${sysconfdir}/apache2
> +        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D}=
${sysconfdir}/apache2/httpd.conf
> +    fi
>  }
> =20
>  # fixme
> @@ -112,19 +155,47 @@ do_install_append_class-target() {
>          rmdir ${TMP}
>          TMP=3D`dirname ${TMP}`;
>      done
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false',=
 d)}; then
> +        install -d ${D}${libdir}/apache2/modules
> +        install -d ${D}${sysconfdir}/apache2/modules.d
> +        install -d ${D}${sysconfdir}/php/apache2-php5
> +        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> +        install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/ap=
ache2/modules.d
> +        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70=
_mod_php5.conf
> +        cat ${S}/php.ini-production | \
> +            sed -e 's,extension_dir =3D \"\./\",extension_dir =3D \"/usr=
/lib/extensions\",' \
> +            > ${D}${sysconfdir}/php/apache2-php5/php.ini
> +        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
> +    fi
>  }
> =20
> -PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 =
${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
> +SYSROOT_PREPROCESS_FUNCS +=3D "php_sysroot_preprocess"
> +
> +php_sysroot_preprocess () {
> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_cross=
scripts}/
> +    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_c=
rossscripts}/
> +
> +    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DES=
TDIR}${bindir_crossscripts}/phpize
> +    sed -i 's!^include_dir=3D.*!include_dir=3D${STAGING_INCDIR}/php!' ${=
SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
> +}
> +
> +MODPHP_PACKAGE =3D "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${=
PN}-modphp', '', d)}"
> +
> +PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 =
${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
> =20
>  RDEPENDS_${PN}-pear =3D "${PN}"
>  RDEPENDS_${PN}-cli =3D "${PN}"
> +RDEPENDS_${PN}-modphp =3D "${PN} apache2"
>  RDEPENDS_${PN}-dev =3D "${PN}"
> =20
>  INITSCRIPT_PACKAGES =3D "${PN}-fpm"
>  inherit update-rc.d
> =20
> -FILES_${PN}-dbg =3D+ "${bindir}/.debug"
> -FILES_${PN}-doc +=3D "${libdir}/php/doc"
> +FILES_${PN}-dbg =3D+ "${bindir}/.debug \
> +                    ${libdir}/apache2/modules/.debug"
> +FILES_${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
>  FILES_${PN}-cli =3D "${bindir}/php"
>  FILES_${PN}-cgi =3D "${bindir}/php-cgi"
>  FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm"
> @@ -133,19 +204,26 @@ CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
>  CONFFILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.co=
nf"
>  INITSCRIPT_NAME_${PN}-fpm =3D "php-fpm"
>  INITSCRIPT_PARAMS_${PN}-fpm =3D "defaults 60"
> -FILES_${PN}-pear =3D "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
> -                ${libdir}/php/PEAR.php ${libdir}/php/System.php \
> -                ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
> -                ${libdir}/php/.channels  ${libdir}/php/.channels/.alias =
 \
> -                ${libdir}/php/.channels\__uri.reg \
> -                ${libdir}/php/.channels\pear.php.net.reg \
> -                ${libdir}/php/.channels/pecl.php.net.reg \
> -                ${libdir}/php/.registry ${libdir}/php/Archive/Tar.php \
> -                ${libdir}/php/Console/Getopt.php ${libdir}/php/OS/Guess.=
php \
> +FILES_${PN}-pear =3D "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/P=
EAR \
> +                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php=
 \
> +                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.=
php \
> +                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/=
=2Ealias \
> +                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Ta=
r.php \
> +                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/O=
S/Guess.php \
> +                ${PHP_LIBDIR}/php/data/PEAR \
>                  ${sysconfdir}/pear.conf"
> -FILES_${PN}-dev =3D "${includedir}/php ${libdir}/build ${bindir}/phpize \
> -                ${bindir}/php-config ${libdir}/php/.depdb \
> -                ${libdir}/php/.depdblock ${libdir}/php/.filemap \
> -                ${libdir}/php/.lock ${libdir}/php/test"
> -FILES_${PN} =3D "${libdir}/php"
> +FILES_${PN}-dev =3D "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/php=
ize \
> +                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
> +                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
> +                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
> +FILES_${PN} =3D "${PHP_LIBDIR}/php"
>  FILES_${PN} +=3D "${bindir}"
> +
> +SUMMARY_${PN}-modphp =3D "PHP module for the Apache HTTP server"
> +FILES_${PN}-modphp =3D "${libdir}/apache2 ${sysconfdir}"
> +
> +MODPHP_OLDPACKAGE =3D "${@bb.utils.contains('PACKAGECONFIG', 'apache2', =
'modphp', '', d)}"
> +RPROVIDES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +RREPLACES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +RCONFLICTS_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +
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

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSmk+YACgkQN1Ujt2V2gBxCaACfUhICE/du5SckcLo7yGIyxr/a
tj4An2OHtIhFtawFW3p3JVKm5BEBYkk1
=jeBT
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
