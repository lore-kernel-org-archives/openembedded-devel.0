Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KjC-00079x-N4 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 17:07:33 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Kj0-0001zn-L4 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 15:07:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285783198-23407-1-git-send-email-t.fromm@dresearch.de>
References: <1285783198-23407-1-git-send-email-t.fromm@dresearch.de>
Date: Thu, 30 Sep 2010 17:07:08 +0200
Message-ID: <1285859228.3805.115.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] vim-7.2: remove quotes from CC in configure.in
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
X-List-Received-Date: Thu, 30 Sep 2010 15:07:34 -0000
X-Groupsio-MsgNum: 24226
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YnWvm33S5h3ISixJyLPN"

--=-YnWvm33S5h3ISixJyLPN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 29.09.2010, 19:59 +0200 schrieb Thilo Fromm:
> upstream: OE-only

Please remove this again.

> configure.in features quotes around some calls to $CC (i.e. it calls
> "$CC"). CC is, however, not always just the compiler name. In OpenEmbedde=
d
> CC looks more like "arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb".
>=20
> configure executes tests in a form like res=3D`"$CC" --some-arg`
> The quotes make the shell try to execute the whole contents of the CC var=
iable -
> compiler and options - as _one single_ binary, which will fail.
>=20
> However, these errors remain unnoticed during the configure run:
>=20
> ...
> configure: line 3707: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mt=
une=3Darm926ej-s -mthumb-interwork -mno-thumb: command not found
> ...
> checking for setjmp.h... yes
> checking for GCC 3 or later... /SCRATCH/maniac/oe-merge-test/OE/tmp.6/wor=
k/armv5te-angstrom-linux-gnueabi/vim-7.2-r7.1/vim72/src/configure: line 113=
29: test: : integer expression expected
> no
> checking whether we need -D_FORTIFY_SOURCE=3D1... /SCRATCH/maniac/oe-merg=
e-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/vim-7.2-r7.1/vim72/src/=
configure: line 11339: test: : integer expression expected
> no
> ...
>=20
> But finally:
>=20
> ...
> configure: creating ./config.status
> config.status: creating auto/config.mk
> config.status: creating auto/config.h
>=20
> So the configure step had errors, but didn't report any in the return cod=
e.
>=20
> This patch removes the quotes around the CC variable in configure.in, whi=
ch unbreaks the configure step.

I have the same questions as before. Do you know if something similar is
needed upstream? I think it is not OE only since other frameworks have
similar values for `CC`.

> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
>  .../vim/files/configure.in_remove_CC_quotes.patch  |   15 ++++++++++++++=
+
>  recipes/vim/vim.inc                                |    2 +-
>  recipes/vim/vim_7.2.bb                             |    2 ++
>  3 files changed, 18 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/vim/files/configure.in_remove_CC_quotes.patch
>=20
> diff --git a/recipes/vim/files/configure.in_remove_CC_quotes.patch b/reci=
pes/vim/files/configure.in_remove_CC_quotes.patch
> new file mode 100644
> index 0000000..db9fb07
> --- /dev/null
> +++ b/recipes/vim/files/configure.in_remove_CC_quotes.patch

Please add the appropriate patch header.

> @@ -0,0 +1,15 @@
> +--- vim72-orig/src/configure.in	2010-09-29 19:13:33.000000000 +0200
> ++++ vim72/src/configure.in	2010-09-29 19:17:07.000000000 +0200
> +@@ -35,10 +35,10 @@
> + fi
> + if test "$GCC" =3D yes; then
> +   dnl method that should work for nearly all versions
> +-  gccversion=3D`"$CC" -dumpversion`
> ++  gccversion=3D`$CC -dumpversion`
> +   if test "x$gccversion" =3D "x"; then
> +     dnl old method; fall-back for when -dumpversion doesn't work
> +-    gccversion=3D`"$CC" --version | sed -e '2,$d' -e 's/darwin.//' -e '=
s/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
> ++    gccversion=3D`$CC --version | sed -e '2,$d' -e 's/darwin.//' -e 's/=
^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
> +   fi
> +   dnl version 4.0.1 was reported to cause trouble on Macintosh by Marci=
n Dalecki
> +   if test "$gccversion" =3D "3.0.1" -o "$gccversion" =3D "3.0.2" -o "$g=
ccversion" =3D "4.0.1"; then
> diff --git a/recipes/vim/vim.inc b/recipes/vim/vim.inc
> index aa93527..1e71d52 100644
> --- a/recipes/vim/vim.inc
> +++ b/recipes/vim/vim.inc
> @@ -5,7 +5,7 @@ DEPENDS =3D "ncurses"
>  RSUGGESTS_${PN} =3D "diffutils"
>  LICENSE =3D "vim"
> =20
> -INC_PR =3D "r7"
> +INC_PR =3D "r8"
> =20
>  SRC_URI =3D "ftp://ftp.vim.org/pub/vim/unix/vim-${PV}.tar.bz2;name=3Dvim=
${PV}tarbz2 \
>             ftp://ftp.vim.org/pub/vim/extra/vim-${PV}-extra.tar.gz;name=
=3Dvim${PV}extratargz \
> diff --git a/recipes/vim/vim_7.2.bb b/recipes/vim/vim_7.2.bb
> index d79f787..eafbeef 100644
> --- a/recipes/vim/vim_7.2.bb
> +++ b/recipes/vim/vim_7.2.bb
> @@ -15,11 +15,13 @@ PR =3D "${INC_PR}.1"
> =20
>  # 001-411.diff contains 411 patches fetched from upstream
>  SRC_URI +=3D "file://001-411.diff;apply=3Dno"
> +SRC_URI +=3D "file://configure.in_remove_CC_quotes.patch;apply=3Dno"
> =20
>  # we need to apply patches in other dir then ${S}
>  do_applypatch() {
>  	cd ${WORKDIR}/vim${VIMVER}
>  	patch -p1 <${WORKDIR}/001-411.diff
> +	patch -p1 <${WORKDIR}/configure.in_remove_CC_quotes.patch
>  }
> =20
>  addtask applypatch after do_unpack before do_patch

Besides that I build tested your patch and it worked for
`angstrom-2008.1`, `minimal-{eglibc,libc,uclibc}` and `MACHINE =3D
"beagleboard"`.


Thanks,

Paul

--=-YnWvm33S5h3ISixJyLPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykp5wACgkQPX1aK2wOHViirgCaA3JfQ2FhYscAOWENQL139vjc
t00An1adJU8Dh+sHmoyXFuWEXxVnA40N
=0AlP
-----END PGP SIGNATURE-----

--=-YnWvm33S5h3ISixJyLPN--
