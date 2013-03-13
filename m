Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFovm-0007sD-6Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:54:17 +0100
Received: by mail-yh0-f47.google.com with SMTP id w68so205735yhw.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UPBqk1N9vTIFHDZi+hvpSuVs493eU53uqEhdBuWfINI=;
	b=ozLLNvhjzudh1hcDnYivYjXKS42grKzv0/EB6Ej13P7sxVT+5FHuCkx5/+feHb7qTm
	rT50L+jtDkDwaLfIknD7NuJ8ANmhoLSnIMNzxspzecGRQjj9LYp4s9XdJTYPwhzAJ3Q1
	KYU+P1C9xrIO+OlPlCoOMRfElesQCT8nsn797Cxc7BzDmtsgXwiAoKLgeQLMgt3sp3eX
	jDhBwIgSZy/ITzEn74DS9kp3OBlwH+uujBZh5ZqFQTtx5JwBFgsIg9zMB9vt2YGGQse8
	Yh8k3GBBi5hwfzvDHAAZZqK4LlIOKBSPE2BEKFOoD/VlQauhzD6UO/QMH2yPNSgoU1yD
	Caqg==
X-Received: by 10.236.164.201 with SMTP id c49mr16366966yhl.141.1363192612773; 
	Wed, 13 Mar 2013 09:36:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x8sm36300772yhn.12.2013.03.13.09.36.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:36:51 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:36:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163644.GT3260@jama>
References: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] tcsh: Upgrade tcsh_6.17.02.bb -> tcsh_6.18.01.bb
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
X-List-Received-Date: Wed, 13 Mar 2013 16:54:34 -0000
X-Groupsio-MsgNum: 43533
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3dBJfKlFjfsS/piO"
Content-Disposition: inline

--3dBJfKlFjfsS/piO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 09:26:37PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/tcsh/files/07_nls.patch   |   14 ------
>  .../tcsh/files/cross-compile.patch                 |   12 -----
>  .../tcsh/files/fix-make-catalogs.patch             |   27 ----------
>  .../tcsh/files/tcsh-6.17.02-multibyte.patch        |   18 ++++---
>  meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb      |   53 --------------=
------
>  meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb      |   49 ++++++++++++++=
++++
>  6 files changed, 59 insertions(+), 114 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/tcsh/files/07_nls.patch
>  delete mode 100644 meta-oe/recipes-extended/tcsh/files/cross-compile.pat=
ch
>  delete mode 100644 meta-oe/recipes-extended/tcsh/files/fix-make-catalogs=
=2Epatch
>  delete mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
>  create mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb

Applied, thanks!

>=20
> diff --git a/meta-oe/recipes-extended/tcsh/files/07_nls.patch b/meta-oe/r=
ecipes-extended/tcsh/files/07_nls.patch
> deleted file mode 100644
> index fe7845f..0000000
> --- a/meta-oe/recipes-extended/tcsh/files/07_nls.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Author: Franz Pletz <fpletz@franz-pletz.org>
> -Description: Fixes NLS build bug
> -
> ---- a/nls/Makefile.in
> -+++ b/nls/Makefile.in
> -@@ -2,7 +2,7 @@
> -=20
> - LOCALES=3D	C et finnish french german greek italian ja pl russian \
> - 		spanish ukrainian
> --GENCAT=3D		gencat
> -+GENCAT=3D		gencat --new
> - INSTALL=3D	ginstall
> -=20
> - datarootdir=3D@datarootdir@
> diff --git a/meta-oe/recipes-extended/tcsh/files/cross-compile.patch b/me=
ta-oe/recipes-extended/tcsh/files/cross-compile.patch
> deleted file mode 100644
> index 06dcfda..0000000
> --- a/meta-oe/recipes-extended/tcsh/files/cross-compile.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -git a/Makefile.in b/Makefile.in
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -446,7 +446,7 @@
> -=20
> - gethost:  gethost.c sh.err.h tc.const.h sh.h
> - 	rm -f gethost
> --	${CC} -o gethost ${LDFLAGS} ${CFLAGS} ${CPPFLAGS} ${DFLAGS} $(srcdir)/=
gethost.c ${LIBES} ${EXTRALIBS}
> -+	${BUILD_CC} -o gethost ${BUILD_LDFLAGS} ${BUILD_CFLAGS} ${BUILD_CPPFLA=
GS} ${DFLAGS} $(srcdir)/gethost.c ${LIBES} ${EXTRALIBS}
> -=20
> - tc.defs.c:	gethost host.defs
> - 	@rm -f $@.tmp
> diff --git a/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch =
b/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
> deleted file mode 100644
> index 43001f1..0000000
> --- a/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Author: christos <christos>
> -Date:   Thu May 13 18:39:02 2010 +0000
> -
> -    add a rule to make catalogs and propagate ${MAKE} instead of hard-co=
ding make.
> -
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -687,7 +687,7 @@ shar:
> - 	rm -rf tcsh-${VERSION}
> -=20
> - catalogs:
> --	@(cd nls; make catalogs)
> -+	@(cd nls; ${MAKE})
> -=20
> - tcsh-${VERSION}.tar.Z:
> - 	rm -rf tcsh-${VERSION}=20
> ---- a/nls/Makefile.in
> -+++ b/nls/Makefile.in
> -@@ -18,7 +18,7 @@ install:	$(INSTALLED)
> - 	$(INSTALL) $< $@
> -=20
> - %.cat:
> --	$(GENCAT) $@ $(@:%.cat=3D%)/*set*
> -+	cat $(@:%.cat=3D%)/charset $(@:%.cat=3D%)/set* | $(GENCAT) $@=20
> -=20
> - clean:
> - 	$(RM) $(CATALOGS)
> diff --git a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.p=
atch b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
> index 7f3e926..3dd420a 100644
> --- a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
> +++ b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
> @@ -1,16 +1,18 @@
>  Author:  Jean-Luc Leger <reiga@dspnet.fr.eu.org>
>  Description: fix broken globbing expansion
>  Debian-Bug: #603545
> ---- a/tc.str.c
> -+++ b/tc.str.c
> -@@ -104,8 +104,9 @@ rt_mbtowc(Char *pwc, const char *s, size_t n)
> -=20
> -     memset (&mb, 0, sizeof mb);
> -     ret =3D mbrtowc(&tmp, s, n, &mb);
> +Index: tcsh-6.18.01/tc.str.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- tcsh-6.18.01.orig/tc.str.c	2012-01-10 13:34:31.000000000 -0800
> ++++ tcsh-6.18.01/tc.str.c	2013-02-26 13:12:13.429153489 -0800
> +@@ -122,8 +122,9 @@
> + #else
> +     ret =3D mbtowc(&tmp, s, n);
> + #endif
>  -    if (ret > 0) {
>  +    if (ret >=3D 0)
>   	*pwc =3D tmp;
> -+    if (ret > 0) {
> - #ifdef UTF16_STRINGS
> ++    if (ret >=3D 0) {
> + #if defined(UTF16_STRINGS) && defined(HAVE_MBRTOWC)
>   	if (tmp >=3D 0xd800 && tmp <=3D 0xdbff) {
>   	    /* UTF-16 surrogate pair.  Fetch second half and compute
> diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb b/meta-oe/reci=
pes-extended/tcsh/tcsh_6.17.02.bb
> deleted file mode 100644
> index c4c78f4..0000000
> --- a/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -DESCRIPTION =3D "TENEX C Shell, an enhanced version of Berkeley csh \
> - The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
> - It includes all features of 4.4BSD C shell, plus a command-line editor,=
 \
> - programmable word completion, spelling correction and more."
> -
> -HOMEPAGE =3D "http://www.tcsh.org/"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D1cf29be62df2be1a3763118b25b=
4c780"
> -SECTION =3D "base"
> -
> -SRC_URI =3D " \
> -	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02.orig.tar.gz;name=3Dtarball \
> -	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02-4.diff.gz;name=3Ddiffs \
> -	file://01_build.1.patch \
> -	file://01_build.2.patch \
> -	file://01_build.3.patch \
> -	file://07_nls.patch \
> -	file://15_no-strip.patch \
> -	file://disable-test-notty.patch \
> -	file://disable-test-nice.patch \
> -	file://fix-make-catalogs.patch \
> -	file://disable-lexical.at-31.patch \
> -	file://12_unknown_lscolors.patch \
> -	file://tcsh-6.17.02-multibyte.patch \
> -	file://disable-broken-test.patch \
> -	file://cross-compile.patch \
> -"
> -
> -inherit autotools
> -
> -do_install_append () {
> -	oe_runmake install.man DESTDIR=3D${D}
> -
> -	install -d ${D}${base_bindir}
> -	ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
> -
> -	install -d ${D}${sysconfdir}/csh/login.d
> -	install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian=
/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
> -	install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-=
mode.el
> -}
> -
> -FILES_${PN} +=3D "${datadir}/emacs/site-lisp/csh-mode.el"
> -
> -
> -pkg_postinst_${PN} () {
> -#!/bin/sh -e
> -echo /usr/bin/tcsh >> $D/etc/shells
> -}
> -
> -SRC_URI[tarball.md5sum] =3D "ad6e89ddb654972b4c2a8bad06778625"
> -SRC_URI[tarball.sha256sum] =3D "8c675729810eb49102b68e09be4f3f592dfa0be2=
c238f0d0a58e5c1147da7dd8"
> -SRC_URI[diffs.md5sum] =3D "735286c36a83a043015b30871c7ab6b6"
> -SRC_URI[diffs.sha256sum] =3D "61c0b0f7ebbc07544551f56b66c6e78def702c2197=
307e960898182b340ffe67"
> diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/reci=
pes-extended/tcsh/tcsh_6.18.01.bb
> new file mode 100644
> index 0000000..d85fba8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION =3D "TENEX C Shell, an enhanced version of Berkeley csh \
> + The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
> + It includes all features of 4.4BSD C shell, plus a command-line editor,=
 \
> + programmable word completion, spelling correction and more."
> +
> +HOMEPAGE =3D "http://www.tcsh.org/"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D1cf29be62df2be1a3763118b25b=
4c780"
> +SECTION =3D "base"
> +
> +SRC_URI =3D " \
> +	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=3Dtarball \
> +	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=3Ddiffs \
> +	file://01_build.1.patch \
> +	file://01_build.2.patch \
> +	file://01_build.3.patch \
> +	file://15_no-strip.patch \
> +	file://disable-test-notty.patch \
> +	file://disable-test-nice.patch \
> +	file://disable-lexical.at-31.patch \
> +	file://12_unknown_lscolors.patch \
> +	file://tcsh-6.17.02-multibyte.patch \
> +	file://disable-broken-test.patch \
> +"
> +SRC_URI[tarball.md5sum] =3D "6eed09dbd4223ab5b6955378450d228a"
> +SRC_URI[tarball.sha256sum] =3D "d81ca27851f3e8545666399b4bcf25433e602a19=
5113b3f7c73886fef84c9fa8"
> +SRC_URI[diffs.md5sum] =3D "ea39b818b624aca49ebf2cd2708d6ff9"
> +SRC_URI[diffs.sha256sum] =3D "95b0c1a339b745c47c5d2f9d02c22a71597462e2e8=
82b51614a9d1f75bd3d16c"
> +
> +inherit autotools
> +
> +do_install_append () {
> +	oe_runmake install.man DESTDIR=3D${D}
> +
> +	install -d ${D}${base_bindir}
> +	ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
> +
> +	install -d ${D}${sysconfdir}/csh/login.d
> +	install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian=
/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
> +	install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-=
mode.el
> +}
> +
> +FILES_${PN} +=3D "${datadir}/emacs/site-lisp/csh-mode.el"
> +
> +
> +pkg_postinst_${PN} () {
> +#!/bin/sh -e
> +echo /usr/bin/tcsh >> $D/etc/shells
> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3dBJfKlFjfsS/piO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqxwACgkQN1Ujt2V2gBwGQgCgiRA8Jfefc4vAxHjFlxFg/uSw
qK4An1CRr141TVv6RBZE6ASCWuIN7reY
=rJEt
-----END PGP SIGNATURE-----

--3dBJfKlFjfsS/piO--
