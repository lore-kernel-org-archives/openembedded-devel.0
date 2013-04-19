Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UT77Z-0006xB-5t
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 10:56:50 +0200
Received: by mail-da0-f41.google.com with SMTP id p8so1719911dan.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CIumPBio5qg+azPuscdi8rduKIKHfA4ytVotN84WFPE=;
	b=1Gfs+YFK8hhAb75ppDa/SymJG5XX4lz9B4LCIRz1VsmnH1RIpoTHVa0qyd7TmaHkBh
	duBP8JbH5BNE6RMJHXt+EPO+HwhYBtVFCbDuN8qGO/+VrnF6AYpndzWRTl3SxoXwTIoO
	rhlK2mnEvAsD5ANm0Bd5EYjZHl4jHcrGe6vcXpOdoSTdR6ifIO8EBpREBS+TVGpiQ+XJ
	9EgfPSoMcdZp7O4s+dRCstbwaa60muu8JCl9bFJfl4+ZvRt7DkbldHn5op8vBn5noNfz
	FY5xc3xCDsPd7phzHlhcr3aoHKpxjEExkvh5NaS0sb2svElxvB7BLMwdUOZ637UVPXOR
	wUfA==
X-Received: by 10.68.130.7 with SMTP id oa7mr18168062pbb.132.1366360746139;
	Fri, 19 Apr 2013 01:39:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ux10sm13993437pab.1.2013.04.19.01.39.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 01:39:04 -0700 (PDT)
Date: Fri, 19 Apr 2013 10:39:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130419083905.GE2489@jama>
References: <1366209695-4195-1-git-send-email-ml@communistcode.co.uk>
	<1366209695-4195-2-git-send-email-ml@communistcode.co.uk>
	<20130418191023.GB2489@jama> <517100D7.8070501@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <517100D7.8070501@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Fri, 19 Apr 2013 08:57:05 -0000
X-Groupsio-MsgNum: 44327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline

--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 09:31:19AM +0100, Jack Mitchell wrote:
> On 18/04/13 20:10, Martin Jansa wrote:
> > On Wed, Apr 17, 2013 at 03:41:35PM +0100, Jack Mitchell wrote:
> >> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> >>
> >> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> >> ---
> >>   meta-oe/recipes-devtools/php/php.inc | 28 +++++++++++++++++++-------=
--
> >>   1 file changed, 19 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-de=
vtools/php/php.inc
> >> index 225c3d7..639aa01 100644
> >> --- a/meta-oe/recipes-devtools/php/php.inc
> >> +++ b/meta-oe/recipes-devtools/php/php.inc
> >> @@ -3,11 +3,11 @@ HOMEPAGE =3D "http://www.php.net"
> >>   SECTION =3D "console/network"
> >>   LICENSE =3D "PHP-3.0"
> >>   BBCLASSEXTEND =3D "native"
> >> -DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native my=
sql5 \
> >> -           libc-client openssl sqlite3"
> >> +DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native \
> >> +           libc-client openssl"
> >>   DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> >>  =20
> >> -INC_PR =3D "r4"
> >> +INC_PR =3D "r5"
> >>  =20
> >>   SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
> >>  =20
> >> @@ -27,12 +27,7 @@ EXTRA_OECONF =3D "--enable-mbstring --enable-discar=
d-path --enable-wddx \
> >>                   --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR}/.. \
> >>                   --with-iconv=3D${STAGING_LIBDIR}/.. \
> >>                   --with-libxml-dir=3D${STAGING_BINDIR_CROSS} \
> >> -                --disable-embedded-mysqli \
> >> -                --with-mysql=3D"${STAGING_DIR_TARGET}${prefix}" \
> >> -                --with-mysqli=3D"${STAGING_BINDIR_CROSS}/mysql_config=
" \
> >> -        --with-sqlite3=3D${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
> >> -                --with-pdo-mysql=3D"${STAGING_BINDIR_CROSS}/mysql_con=
fig" \
> >> -                --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. ${COMMON_EXT=
RA_OECONF} \
> >> +                ${COMMON_EXTRA_OECONF} \
> >>   "
> >>   EXTRA_OECONF_virtclass-native =3D "--with-cgi --without-libpng --wit=
hout-libjpeg \
> >>                   --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR_NATIV=
E}/.. \
> >> @@ -40,6 +35,21 @@ EXTRA_OECONF_virtclass-native =3D "--with-cgi --wit=
hout-libpng --without-libjpeg \
> >>                   ${COMMON_EXTRA_OECONF} \
> >>   "
> >>  =20
> >> +PACKAGECONFIG ??=3D "mysql sqlite3"
> >> +
> >> +PACKAGECONFIG[mysql] =3D "--with-mysql=3D\"${STAGING_DIR_TARGET}${pre=
fix}\" \
> >> +                        --with-mysqli=3D\"${STAGING_BINDIR_CROSS}/mys=
ql_config\" \
> >> +                        --with-pdo-mysql=3D\"${STAGING_BINDIR_CROSS}/=
mysql_config\" \
> >> +                        --disable-embedded-mysqli \
> >> +                        , \
> >> +                        ,mysql5"
> >> +
> >> +PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_LIBDIR}/.. \
> >> +                        --enable-sqlite-utf8 \
> >> +                        --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
> >> +                        , \
> >> +                        ,sqlite3"
> >> +
> >>   LIBS_virtclass-native =3D " -lxml2 "
> >>   LIBS_pn-php =3D" -lpthread "
> >>   export LIBS
> > php-native fails on jenkins with:
> > | configure:59644: result: no
> > | configure:60451: checking for MSSQL support via FreeTDS
> > | configure:60487: result: no
> > | configure:61111: checking for MySQL support
> > | configure:61147: result: yes
> > | configure:61156: checking for specified location of the MySQL UNIX so=
cket
> > | configure:61171: result: no
> > | configure:61221: error: Cannot find MySQL header files under "/home/j=
enkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr".
> > | Note that the MySQL client library is not bundled anymore!
> >
> > I guess you should force both disabled for native.
>=20
> I'm no make/configure guru here, so I may need a little bit of input but=
=20
> as PHP has no explicit --disable-mysql support, is there a way to force=
=20
> a configure variable? This is the snippet that deals with mysql:
>=20
> php_with_mysql=3Dno
>=20
> { $as_echo "$as_me:$LINENO: checking for MySQL support" >&5
> $as_echo_n "checking for MySQL support... " >&6; }
>=20
> # Check whether --with-mysql was given.
> if test "${with_mysql+set}" =3D set; then
>    withval=3D$with_mysql; PHP_MYSQL=3D$withval
> else
>=20
>    PHP_MYSQL=3Dno
>    test "$PHP_ENABLE_ALL" && PHP_MYSQL=3D$PHP_ENABLE_ALL
>=20
> fi
>=20
> Is there a way to force with_mysql to not set?
>=20
> Alternatively is there a way to stop PACKAGECONFIG appending to -native?

You can try PACKAGECONFIG_class-native ??=3D "".

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFxAqkACgkQN1Ujt2V2gBzrJQCeJG+gXRo6g0PuSK13X572Eoq6
EScAnjJll3A8AUYe1mcaSzwYBJxTthbd
=6VJk
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
