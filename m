Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2T12-0008DH-PU for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 20:10:30 +0200
Received: from f053041250.adsl.alicedsl.de ([78.53.41.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2T0n-0005V0-No for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 18:10:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286121284.4310.15.camel@mattotaupa>
References: <1286121284.4310.15.camel@mattotaupa>
Date: Sun, 03 Oct 2010 20:10:12 +0200
Message-ID: <1286129412.4310.30.camel@mattotaupa>
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
Subject: Re: [PATCH] python-{native}-2.6.5: Fix parallel build.
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
X-List-Received-Date: Sun, 03 Oct 2010 18:10:30 -0000
X-Groupsio-MsgNum: 24326
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pprhi0Ou4M0xQaM6RKZy"

--=-pprhi0Ou4M0xQaM6RKZy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I forgot to add the patch iteration to the subject line. It is v3
and it has the ID 3153 in Patchwork [1].

Am Sonntag, den 03.10.2010, 17:54 +0200 schrieb Paul Menzel:
> Date: Sat, 2 Oct 2010 12:51:03 +0200
>=20
> Randomly the build failed for me with the following error message.
>=20
>     libpython2.6.so: undefined reference to `_PyParser_Grammar'
>=20
> The applied patch in [5] tried to fix this problem, but it turns out that=
 this also was due to a possible race. This is already known in OpenOffice =
too [3].
>=20
> R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fed=
ora [1] and I applied his patch.
>=20
> I reported this issue upstream [4] and this will only be fixed in Python =
2.7, so we have to keep this patch for Python 2.6.
>=20
> I put 00 in front of the name of the patch file because I did not want to=
 rename the other patches.
>=20
> I build tested this with `MACHINE =3D " beagleboard"` for `angstrom-2008.=
1` and `minimal-{eglibc,uclibc,libc}`.
>=20
> [1] http://pkgs.fedoraproject.org/gitweb/?p=3Dpython.git;a=3Dcommitdiff;h=
=3Db95f6cc2ca6a009f97436c6aa16cfd70547353d9
> [2] http://www.openoffice.org/issues/show_bug.cgi?id=3D114866
> [3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
> [4] http://bugs.python.org/issue10013
> [5] http://patchwork.openembedded.org/patch/1899/
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> v1 =E2=86=92 v2: comments by Khem and Tom, add accidentely removed =C2=BB=
\=C2=AB at the line ending.
> v2 =E2=86=92 v3: Reorder patches, so that they can be applied to python a=
nd python-native.
> ---
>  .../python/python-2.6.5/00-fix-parallel-make.patch |   40 ++++++++++++++=
++++++
>  .../01-use-proper-tools-for-cross-build.patch      |   14 +++---
>  recipes/python/python-native_2.6.5.bb              |    3 +-
>  recipes/python/python_2.6.5.bb                     |    3 +-
>  4 files changed, 51 insertions(+), 9 deletions(-)
>  create mode 100644 recipes/python/python-2.6.5/00-fix-parallel-make.patc=
h
>=20
> diff --git a/recipes/python/python-2.6.5/00-fix-parallel-make.patch b/rec=
ipes/python/python-2.6.5/00-fix-parallel-make.patch
> new file mode 100644
> index 0000000..c80ca19
> --- /dev/null
> +++ b/recipes/python/python-2.6.5/00-fix-parallel-make.patch
> @@ -0,0 +1,40 @@
> +upstream: <http://bugs.python.org/issue10013>
> +comment: As in the comment in the issue tracker this is fixed for py3k a=
 little differently <http://svn.python.org/view?view=3Drev&revision=3D84068=
>. This patch is taken from Fedora.
> +
> +diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefil=
e.pre.in
> +--- Python-2.7/Makefile.pre.in.fix-parallel-make	2010-07-22 15:01:39.567=
996932 -0400
> ++++ Python-2.7/Makefile.pre.in	2010-07-22 15:47:02.437998509 -0400
> +@@ -197,6 +197,7 @@ SIGNAL_OBJS=3D	@SIGNAL_OBJS@
> +=20
> + #######################################################################=
###
> + # Grammar
> ++GRAMMAR_STAMP=3D	$(srcdir)/grammar-stamp
> + GRAMMAR_H=3D	$(srcdir)/Include/graminit.h
> + GRAMMAR_C=3D	$(srcdir)/Python/graminit.c
> + GRAMMAR_INPUT=3D	$(srcdir)/Grammar/Grammar
> +@@ -514,10 +515,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
> + Modules/python.o: $(srcdir)/Modules/python.c
> + 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
> +=20
> ++# GNU "make" interprets rules with two dependents as two copies of the =
rule.
> ++#=20
> ++# In a parallel build this can lead to pgen being run twice, once for e=
ach of
> ++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the comp=
iler
> ++# reads a partially-overwritten copy of one of these files, leading to =
syntax
> ++# errors (or linker errors if the fragment happens to be syntactically =
valid C)
> ++#
> ++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Output=
s.html
> ++# for more information.
> ++#
> ++# Introduce ".grammar-stamp" as a contrived single output from PGEN to =
avoid
> ++# this:
> ++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
> +=20
> +-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
> ++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
> + 		-@$(INSTALL) -d Include
> + 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> ++		touch $(GRAMMAR_STAMP)
> +=20
> + $(PGEN):	$(PGENOBJS)
> + 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
> diff --git a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-bu=
ild.patch b/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build=
.patch
> index e89faa4..4b485ec 100644
> --- a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.pat=
ch
> +++ b/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.pat=
ch
> @@ -14,7 +14,7 @@ Index: Python-2.6.1/Makefile.pre.in
>  =20
>   # The task to run while instrument when building the profile-opt target
>   PROFILE_TASK=3D	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --wit=
h-syscheck
> -@@ -205,7 +206,7 @@ GRAMMAR_INPUT=3D	$(srcdir)/Grammar/Grammar
> +@@ -206,7 +207,7 @@ GRAMMAR_INPUT=3D	$(srcdir)/Grammar/Grammar
>   #######################################################################=
###
>   # Parser
>   PGEN=3D		Parser/pgen$(EXE)
> @@ -23,7 +23,7 @@ Index: Python-2.6.1/Makefile.pre.in
>   POBJS=3D		\
>   		Parser/acceler.o \
>   		Parser/grammar1.o \
> -@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
> +@@ -395,8 +396,8 @@ platform: $(BUILDPYTHON)
>   # Build the shared modules
>   sharedmods: $(BUILDPYTHON)
>   	@case $$MAKEFLAGS in \
> @@ -34,16 +34,16 @@ Index: Python-2.6.1/Makefile.pre.in
>   	esac
>  =20
>   # Build static library
> -@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
> +@@ -531,7 +532,7 @@ $(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
>  =20
> - $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
> + $(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
>   		-@$(INSTALL) -d Include
>  -		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
>  +		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> + 		touch $(GRAMMAR_STAMP)
>  =20
>   $(PGEN):	$(PGENOBJS)
> - 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
> -@@ -879,23 +880,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
> +@@ -902,23 +903,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
>   	done
>   	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
>   	PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> @@ -72,7 +72,7 @@ Index: Python-2.6.1/Makefile.pre.in
>  =20
>   # Create the PLATDIR source directory, if one wasn't distributed..
>   $(srcdir)/Lib/$(PLATDIR):
> -@@ -993,7 +994,7 @@ libainstall:	all
> +@@ -1016,7 +1017,7 @@ libainstall:	all
>   # Install the dynamically loadable modules
>   # This goes into $(exec_prefix)
>   sharedinstall:
> diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/pytho=
n-native_2.6.5.bb
> index 76fbbb6..51a1fb1 100644
> --- a/recipes/python/python-native_2.6.5.bb
> +++ b/recipes/python/python-native_2.6.5.bb
> @@ -1,9 +1,10 @@
>  require python.inc
>  DEPENDS =3D "openssl-native bzip2-full-native zlib-native readline-nativ=
e sqlite3-native"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  FILESPATHPKG .=3D ":python-${PV}:python"
>  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2=
 \
> +           file://00-fix-parallel-make.patch \
>             file://00-fix-bindir-libdir-for-cross.patch \
>             file://04-default-is-optimized.patch \
>             file://05-enable-ctypes-cross-build.patch \
> diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5=
.bb
> index ecd9f78..c8393c1 100644
> --- a/recipes/python/python_2.6.5.bb
> +++ b/recipes/python/python_2.6.5.bb
> @@ -3,10 +3,11 @@ DEPENDS =3D "python-native db gdbm openssl readline sql=
ite3 tcl zlib\
>             ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
>  DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
>  # set to .0 on every increase of INC_PR
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  SRC_URI =3D "\
>    http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> +  file://00-fix-parallel-make.patch \
>    file://00-fix-bindir-libdir-for-cross.patch \
>    file://01-use-proper-tools-for-cross-build.patch \
>    file://02-remove-test-for-cross.patch \


Thanks,

Paul


[1] http://patchwork.openembedded.org/patch/3153/

--=-pprhi0Ou4M0xQaM6RKZy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyoxwQACgkQPX1aK2wOHVjbRACeIKxD+nzSL4BWulKiygE7pKRr
PqAAoICUcuIzpaQTcKFtE7yt4273fzMh
=5W1u
-----END PGP SIGNATURE-----

--=-pprhi0Ou4M0xQaM6RKZy--
