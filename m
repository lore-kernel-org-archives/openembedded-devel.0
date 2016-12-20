Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 923D97723B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:28:19 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id he10so27953250wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0UdCwgZsexL00sVYk3kE4eHmu1IUTKdAYZ9pMWuggXI=;
	b=SusYO/p/i0spb34YEHE0bCy1ijPpx6UVQK8ecR3U/xTAk8qOZ7aadwOrucE4BsQwTN
	Zbt+s+EaVOKYpJ9MpizgBlDmozvboXVWvXv1sbavqHsXbtE/2TE14HIyKKbxMOS2qyou
	9kbeLLP5Q9M+kAk3z07IkP43mAQ8T0BAmzwzN9C3ORLQovoeg86/JyQDU9YnDEFWTW/1
	xSVvyIaV3PhU3rfFthL+lZdk2qAsfnCfuSzqi8St8UCpUxQK1YwteyCsiiZz0fz636HT
	cmcm1xK+qhOaTogvsRjSDCX+WSKsWB/LUz/owQ2vJj2S5esAc+y00gQMJUM+i0OSgJZo
	drYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0UdCwgZsexL00sVYk3kE4eHmu1IUTKdAYZ9pMWuggXI=;
	b=LfHjKRWmcBXXO+AMktIi7EMXUqVkKtNwZ/6OE6Krd8sqIjRp7L/9hFnuk5FaSliqWi
	5phxh/Dz4FbCYDtuSTsqF8TLTXDH8zvI12sK/oKlHcEUD1t3WUqVBrhjuqar0YZgd3RW
	LwDCCstnx4xUdabr1fWfIvRXRHAq+MgPWOlOJJqF1f+BIcOiY7fwTWbNP2tkLqV4f8dN
	0qr1NbKU2yzEsMroMm8sCBVD0XUbnDZ+wZ2c7PNVmyP/wLmvwmZyGDt/LkLqGd+L49U+
	dZVc+UYber2vWqda34cJnV2vnhjH7oVuRhrfF19qTo6/c4Bg3AiO23cJLiIQIJjQqgae
	OQKg==
X-Gm-Message-State: AKaTC007mz9jN8d/OQmINaGdFXudZeS5MXpTpJ5Zf7MvNMM11tt5VCG3BxgGuNEB83a8FQ==
X-Received: by 10.194.146.131 with SMTP id tc3mr19212643wjb.129.1482244100048; 
	Tue, 20 Dec 2016 06:28:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	jm6sm25739539wjb.27.2016.12.20.06.28.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 06:28:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 15:28:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220142818.GE3275@jama>
References: <1481635683-62635-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C6D6BCA5@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C6D6BCA5@G08CNEXMBPEKD03.g08.fujitsu.local>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe] [PATCH] add php 7.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 14:28:19 -0000
X-Groupsio-MsgNum: 64434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2016 at 01:50:38AM +0000, Huang, Qiyu wrote:
> ping

pong & resend tested version

http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuar=
m.20161218_140914.log//2_max/failed/php.log

this patch added 7.0.1 recipe, not 7.1.0 as subject says (and
because of that change-AC_TRY_RUN-to-AC_TRY_LINK.patch also
isn't found and do_fetch fails.

>=20
> > -----Original Message-----
> > From: Huang, Qiyu=20
> > Sent: Tuesday, December 13, 2016 9:28 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> > Subject: [oe] [meta-oe] [PATCH] add php 7.1.0
> >=20
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> >=20
> > 1)add php_7.1.0.bb
> > 2)Delete php_5.5.38.bb,since it is Replaced by php_5.6.26.bb.
> > 3)Delete pthread-check-threads-m4.patch, since it is integrated upstrea=
m.
> > ---
> >  .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         | 56
> > ++++++++++++++++++++++
> >  meta-oe/recipes-devtools/php/php.inc               |  3 +-
> >  .../php/php/pthread-check-threads-m4.patch         | 30 ------------
> >  meta-oe/recipes-devtools/php/php_5.5.38.bb         |  6 ---
> >  meta-oe/recipes-devtools/php/php_7.0.1.bb          |  8 ++++
> >  5 files changed, 65 insertions(+), 38 deletions(-)  create mode 100644
> > meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LI
> > NK.patch
> >  delete mode 100644
> > meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> >  delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.38.bb
> >  create mode 100644 meta-oe/recipes-devtools/php/php_7.0.1.bb
> >=20
> > diff --git
> > a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_L
> > INK.patch
> > b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_L
> > INK.patch
> > new file mode 100644
> > index 0000000..39c334f
> > --- /dev/null
> > +++
> > b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY
> > +++ _LINK.patch
> > @@ -0,0 +1,56 @@
> > +[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
> > +
> > +Upstream-Status: Pending
> > +
> > +AC_TRY_RUN is not suitable for cross-compile
> > +
> > +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > +---
> > + ext/fileinfo/config.m4 | 31 ++++++-------------------------
> > + 1 file changed, 6 insertions(+), 25 deletions(-)
> > +
> > +diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4 index
> > +7e98d62..8a8ea0e 100644
> > +--- a/ext/fileinfo/config.m4
> > ++++ b/ext/fileinfo/config.m4
> > +@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" !=3D "no"; then
> > +     libmagic/readcdf.c libmagic/softmagic.c"
> > +
> > +   AC_MSG_CHECKING([for strcasestr])
> > +-  AC_TRY_RUN([
> > +-#include <string.h>
> > +-#include <strings.h>
> > +-#include <stdlib.h>
> > +-
> > +-int main(void)
> > +-{
> > +-        char *s0, *s1, *ret;
> > +-
> > +-        s0 =3D (char *) malloc(42);
> > +-        s1 =3D (char *) malloc(8);
> > +-
> > +-        memset(s0, 'X', 42);
> > +-        s0[24] =3D 'Y';
> > +-        s0[26] =3D 'Z';
> > +-        s0[41] =3D '\0';
> > +-        memset(s1, 'x', 8);
> > +-        s1[0] =3D 'y';
> > +-        s1[2] =3D 'Z';
> > +-        s1[7] =3D '\0';
> > +-
> > +-        ret =3D strcasestr(s0, s1);
> > +-
> > +-        return !(NULL !=3D ret);
> > +-}
> > ++  AC_TRY_COMPILE([
> > ++     #include <string.h>
> > ++     #include <strings.h>
> > ++     #include <stdlib.h>
> > ++  ],[
> > ++     strcasestr(NULL, NULL);
> > +   ],[
> > +     dnl using the platform implementation
> > +     AC_MSG_RESULT(yes)
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php.inc
> > b/meta-oe/recipes-devtools/php/php.inc
> > index cd91940..191005f 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -24,7 +24,6 @@ SRC_URI_append_class-target =3D " \
> >              file://php-fpm.conf \
> >              file://php-fpm-apache.conf \
> >              file://configure.patch \
> > -            file://pthread-check-threads-m4.patch \
> >              file://70_mod_php5.conf \
> >              file://php-fpm.service \
> >            "
> > @@ -218,7 +217,7 @@ FILES_${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
> >  FILES_${PN}-cli =3D "${bindir}/php"
> >  FILES_${PN}-phar =3D "${bindir}/phar*"
> >  FILES_${PN}-cgi =3D "${bindir}/php-cgi"
> > -FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> > ${datadir}/fpm ${sysconfdir}/init.d/php-fpm
> > ${systemd_unitdir}/system/php-fpm.service"
> > +FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> > ${datadir}/fpm ${sysconfdir}/init.d/php-fpm
> > ${systemd_unitdir}/system/php-fpm.service /etc/*"
> >  FILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
> >  CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
> >  CONFFILES_${PN}-fpm-apache2 =3D
> > "${sysconfdir}/apache2/conf.d/php-fpm.conf"
> > diff --git a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.=
patch
> > b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> > deleted file mode 100644
> > index 0c564cd..0000000
> > --- a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00
> > 2001
> > -From: Jackie Huang <jackie.huang@windriver.com>
> > -Date: Mon, 8 Apr 2013 14:29:51 +0800
> > -Subject: [PATCH] pthread-check
> > -
> > -Enable pthreads support when cross-compiling
> > -
> > -Upstream-Status: Inapproprate [config]
> > -
> > -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ----
> > - TSRM/threads.m4 |    2 +-
> > - 1 files changed, 1 insertions(+), 1 deletions(-)
> > -
> > -diff --git a/TSRM/threads.m4 b/TSRM/threads.m4 -index 38494ce..15d9454
> > 100644
> > ---- a/TSRM/threads.m4
> > -+++ b/TSRM/threads.m4
> > -@@ -86,7 +86,7 @@ int main() {
> > -   pthreads_working=3Dno
> > -   ], [
> > -   dnl For cross compiling running this test is of no use. NetWare sup=
ports
> > pthreads
> > --  pthreads_working=3Dno
> > -+  pthreads_working=3Dyes
> > -   case $host_alias in
> > -   *netware*)
> > -     pthreads_working=3Dyes
> > ---
> > -1.7.4.1
> > -
> > diff --git a/meta-oe/recipes-devtools/php/php_5.5.38.bb
> > b/meta-oe/recipes-devtools/php/php_5.5.38.bb
> > deleted file mode 100644
> > index 26f35b1..0000000
> > --- a/meta-oe/recipes-devtools/php/php_5.5.38.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require php.inc
> > -
> > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D464ca70af214d2407f6b7d4458158afd"
> > -
> > -SRC_URI[md5sum] =3D "312244a0eecad602a1555ed2434e223f"
> > -SRC_URI[sha256sum] =3D
> > "473c81ebb2e48ca468caee031762266651843d7227c18a824add9b07b9393e3
> > 8"
> > diff --git a/meta-oe/recipes-devtools/php/php_7.0.1.bb
> > b/meta-oe/recipes-devtools/php/php_7.0.1.bb
> > new file mode 100644
> > index 0000000..899acf9
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/php/php_7.0.1.bb
> > @@ -0,0 +1,8 @@
> > +require php.inc
> > +
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Db602636d46a61c0ac0432bbf5c078fe4"
> > +
> > +SRC_URI +=3D "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> > +SRC_URI[md5sum] =3D "54e364b60a88db77adb96aacb10f10a4"
> > +SRC_URI[sha256sum] =3D
> > "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
> > +
> > --
> > 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFlAAQAKCRA3VSO3ZXaA
HErUAKCUmhhWPX8yVFB71r82m5sZ7vur2QCfSAfHgxzmUeAJYfnrzd1Rr+zg8vg=
=DcW4
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
