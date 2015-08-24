Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0C45276C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:26:53 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so70695288wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jCneM+pl8WJwmKlrq0PfRjftrrlz5xASNCaxhE+0vfA=;
	b=FJD9BafktBTWWDKz0aZ6AxFykRtgSMR0dIdE/MVGd2aIJWFGYZHngBXTnwx8LtSIIh
	cFa8SkbkUIogNGjVA1380ZfKOYkiFmK0vpVWIAp9lTE0tTPK7x8xCpP7hhYYW2t9wBoR
	aVO3T5Bn4NIdL4Yplan41i6w/DckyEjKIlOSP5OlB+gwlKLlb+SYWDgqLhLqQjSlZwU7
	yM573IBVuKt84SLn24RgcL5dGhfalfSMLf8YbAyO48ubs7EVKZ0owKSqMsfIYM3zOzqO
	pCcWdF7KYIeX34lSRlB5d++UyIx4t2MOhLSQA+8WtAzXlc8lEvOrnsZVfVIUrMuyG3U+
	r5xA==
X-Received: by 10.194.62.211 with SMTP id a19mr38466093wjs.126.1440419213331; 
	Mon, 24 Aug 2015 05:26:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i7sm1689602wib.15.2015.08.24.05.26.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:26:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:26:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824122656.GA2446@jama>
References: <1440148950-47294-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1440148950-47294-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] uim: 1.3.1->1.8.6
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
X-List-Received-Date: Mon, 24 Aug 2015 12:26:55 -0000
X-Groupsio-MsgNum: 56939
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 05:22:30PM +0800, Lei Maohui wrote:
> - delte 0001-fix-bug-about-stdlib.patch that not be needed.

typo delete

can you please rebase this patch, the change to use remove operator is
now included in master

> - modified license
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../uim/uim/0001-fix-bug-about-stdlib.patch        | 40 ----------------=
------
>  .../uim/uim/0001-fix-bug-for-cross-compile.patch   | 38 ++++++++++------=
----
>  .../uim/{uim_1.3.1.bb =3D> uim_1.8.6.bb}             | 21 ++++++++----
>  3 files changed, 33 insertions(+), 66 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-about-st=
dlib.patch
>  rename meta-oe/recipes-support/uim/{uim_1.3.1.bb =3D> uim_1.8.6.bb} (88%)
>=20
> diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.pa=
tch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
> deleted file mode 100644
> index 9e63683..0000000
> --- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From e0e3f82bd2918fdcc722918c108bc33647a4805f Mon Sep 17 00:00:00 2001
> -From: Leimaohui <leimaohui@cn.fujitsu.com>
> -Date: Fri, 25 Oct 2013 18:31:22 +0900
> -Subject: [PATCH] fix bug about stdlib
> -
> -Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
> ----
> - xim/locale.cpp    |    3 ++-
> - xim/ximserver.cpp |    1 +
> - 2 files changed, 3 insertions(+), 1 deletions(-)
> -
> -diff --git a/xim/locale.cpp b/xim/locale.cpp
> -index 380e945..edfaf03 100644
> ---- a/xim/locale.cpp
> -+++ b/xim/locale.cpp
> -@@ -35,7 +35,8 @@
> - #ifdef HAVE_CONFIG_H
> - # include <config.h>
> - #endif
> --
> -+#include <string.h>
> -+#include <stdlib.h>
> - #include <stdio.h>
> - #include <locale.h>
> - #include <iconv.h>
> -diff --git a/xim/ximserver.cpp b/xim/ximserver.cpp
> -index 245c5f8..cde9918 100644
> ---- a/xim/ximserver.cpp
> -+++ b/xim/ximserver.cpp
> -@@ -34,6 +34,7 @@
> - # include <config.h>
> - #endif
> -=20
> -+#include <stdlib.h>
> - #include <stdio.h>
> - #include <ctype.h>
> - #include <locale.h>
> ---=20
> -1.7.1
> -
> diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compi=
le.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.p=
atch
> index 61392c9..df82b07 100644
> --- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
> +++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
> @@ -1,28 +1,28 @@
> -From 2e87c39ae3a00b8231ee21a54c47361c1bf502f7 Mon Sep 17 00:00:00 2001
> -From: Leimaohui <leimaohui@cn.fujitsu.com>
> -Date: Fri, 25 Oct 2013 18:23:12 +0900
> +From 2918196ba782dfa4401bdca917ad4de1910505e0 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Fri, 21 Aug 2015 15:58:42 +0900
>  Subject: [PATCH] fix bug for cross compile
> =20
> -Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>  ---
> - configure.ac |    4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/configure.ac b/configure.ac
> -index 3b64593..57395d4 100644
> +index 9be879c..9249bfd 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -601,8 +601,8 @@ AC_HELP_STRING([--with-libedit[=3DDIR], Enable libed=
it support
> -  if test "x$use_libedit" !=3D "xno"; then
> -      saved_CPPFLAGS=3D$CPPFLAGS
> -      saved_LDFLAGS=3D$LDFLAGS
> --     CPPFLAGS=3D"${CPPFLAGS} -I$libedit_path/include"
> --     LDFLAGS=3D"${LDFLAGS} -L$libedit_path/lib"
> -+     CPPFLAGS=3D"${CPPFLAGS} "
> -+     LDFLAGS=3D"${LDFLAGS} "
> -      AC_CHECK_LIB(edit, el_init,=09
> -      		[
> - 		   LIBEDIT_LIBS=3D"-ledit -lcurses -l$libedit_path/lib"
> +@@ -1208,8 +1208,8 @@ AC_HELP_STRING([--with-libedit[=3DDIR], Enable lib=
edit support
> + if test "x$use_libedit" !=3D "xno"; then
> +     saved_CPPFLAGS=3D$CPPFLAGS
> +     saved_LDFLAGS=3D$LDFLAGS
> +-    CPPFLAGS=3D"${CPPFLAGS} -I$libedit_path/include"
> +-    LDFLAGS=3D"${LDFLAGS} -L$libedit_path/lib"
> ++    CPPFLAGS=3D"${CPPFLAGS} "
> ++    LDFLAGS=3D"${LDFLAGS} "
> +     AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS=3D"-lcurses",
> +         [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS=3D"-lncurses",
> +             AC_MSG_WARN("libedit needs libcurses or libncurses. disable=
d...")
>  --=20
> -1.7.1
> +1.8.4.2
> =20
> diff --git a/meta-oe/recipes-support/uim/uim_1.3.1.bb b/meta-oe/recipes-s=
upport/uim/uim_1.8.6.bb
> similarity index 88%
> rename from meta-oe/recipes-support/uim/uim_1.3.1.bb
> rename to meta-oe/recipes-support/uim/uim_1.8.6.bb
> index 01657df..8e5f7dd 100644
> --- a/meta-oe/recipes-support/uim/uim_1.3.1.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -1,17 +1,18 @@
>  DESCRIPTION =3D "A multilingual user input method library"
>  HOMEPAGE =3D "http://uim.freedesktop.org/"
> -LICENSE =3D "BSD"
> +LICENSE =3D "BSD-3-Clause & LGPLv2+"
>  SECTION =3D "inputmethods"
> =20
>  SRC_URI =3D "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
> -           file://0001-fix-bug-about-stdlib.patch "
> +           "
> =20
>  SRC_URI_append_class-target =3D "file://uim-module-manager.patch \
> -                               file://0001-fix-bug-for-cross-compile.pat=
ch"
> +                               file://0001-fix-bug-for-cross-compile.pat=
ch \
> +                               "
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9c372efbeca58ce22017a29c1ebf8=
bf0"
> -SRC_URI[md5sum] =3D "2832e23d4778bbacbfa4b49bf642d667"
> -SRC_URI[sha256sum] =3D "ed2cfa15018a4fd2557e875f66fcb3f0b9dabe12fa0700aa=
2f11cca69c2cb256"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32463fd29aa303fb2360faeeae172=
56b"
> +SRC_URI[md5sum] =3D "ecea4c597bab1fd4ba98ea84edcece59"
> +SRC_URI[sha256sum] =3D "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99=
b948c17eb1cb235f"
> =20
>  DEPENDS =3D "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
>  DEPENDS_class-target +=3D "gtk+ uim-native takao-fonts"
> @@ -31,7 +32,13 @@ EXTRA_OECONF +=3D "--disable-emacs \
>                   --without-mana \
>                   --without-eb"
> =20
> -CONFIGUREOPTS_class-target :=3D "${@d.getVar('CONFIGUREOPTS', True).repl=
ace('--disable-silent-rules', ' ')}"
> +CONFIGUREOPTS_remove_class-target =3D "--disable-silent-rules"
> +
> +
> +#Because m4 file's find maxdepth=3D2, so copy the m4 files of the deep d=
epth.
> +do_configure_prepend () {
> +    cp ${S}/sigscheme/m4/* ${S}/m4/
> +}
> =20
>  PACKAGES +=3D "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common u=
im-anthy libuim0 libuim-dev"
> =20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbDY8ACgkQN1Ujt2V2gBxBKgCgiX35QCmFTfn4grSCQBuCtXvc
3K4An1JrCPAfK+b2H3X42XHJGJApg2wb
=uhE1
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
