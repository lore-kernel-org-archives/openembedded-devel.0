Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P26Xj-0005kj-6Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 20:10:44 +0200
Received: by iwn2 with SMTP id 2so5161048iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kmUAFfyw5OiWXGgDR1quoT1YFpfw6yWkwP/u8A4V+sg=;
	b=wd/dY4Lw/rqOzSsqEmGfNd8Ye8phl7tlm/J1l4aj9iSYLc+zR+byr7JKd8M9XM1zlt
	WsEFTGWbO2ceUYW5FsDIxjTWMDVhNvPbCoaUdVWkbiufw9nIRTERYDNK31sMduey8G89
	zC/l51rNmiseFy9GkD2hXS5okTrEG4Cqr9ogk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TYshysVhMrJig0tiXKdyRreUO7poUzEjHWcpwHBtzrVa6pWMg+1UKM3r/TMx8072wy
	kn0t9dw3qihI4tRTRfckkkIuMWn8OaBUZEKBFn/22m6vpn9VyBZOy1E9oA9ECYiUGaEO
	/kz4aOtC+Oc00B0k10f1Yx8CX/EfAZwwMFziA=
Received: by 10.231.177.40 with SMTP id bg40mr6190676ibb.150.1286043027359;
	Sat, 02 Oct 2010 11:10:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 2 Oct 2010 11:10:07 -0700 (PDT)
In-Reply-To: <1286038095.3743.9.camel@mattotaupa>
References: <1286038095.3743.9.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2010 11:10:07 -0700
Message-ID: <AANLkTimMLe-2T0YyeASOqLUcE4=AhB-Ce0_BFwPUjRA7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sat, 02 Oct 2010 18:10:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 2, 2010 at 9:48 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Sat, 2 Oct 2010 12:51:03 +0200
>
> Randomly the build failed for me with the following error message.
>
> =C2=A0 =C2=A0libpython2.6.so: undefined reference to `_PyParser_Grammar'
>
> The applied patch in [5] tried to fix this problem, but it turns out that=
 this was due to a possible race and already known in OpenOffice too [3].
>
> R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fed=
ora [1] and I applied his patch.
>
> I reported this issue upstream [4] and this will only be fixed in Python =
2.7, so we have to keep this patch for Python 2.6.
>
> [1] http://pkgs.fedoraproject.org/gitweb/?p=3Dpython.git;a=3Dcommitdiff;h=
=3Db95f6cc2ca6a009f97436c6aa16cfd70547353d9
> [2] http://www.openoffice.org/issues/show_bug.cgi?id=3D114866
> [3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
> [4] http://bugs.python.org/issue10013
> [5] http://patchwork.openembedded.org/patch/1899/
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

looks ok see small comments below

> ---
> =C2=A0.../python/python-2.6.5/20-fix-parallel-make.patch | =C2=A0 40 ++++=
++++++++++++++++
> =C2=A0recipes/python/python-native_2.6.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/python/python_2.6.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A05 +-
> =C2=A03 files changed, 44 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 recipes/python/python-2.6.5/20-fix-parallel-make=
.patch
>
> diff --git a/recipes/python/python-2.6.5/20-fix-parallel-make.patch b/rec=
ipes/python/python-2.6.5/20-fix-parallel-make.patch
> new file mode 100644
> index 0000000..1f7b24e
> --- /dev/null
> +++ b/recipes/python/python-2.6.5/20-fix-parallel-make.patch
> @@ -0,0 +1,40 @@
> +upstream: <http://bugs.python.org/issue10013>
> +comment: As in the comment in the issue tracker this is fixed for py3k a=
 little differently <http://svn.python.org/view?view=3Drev&revision=3D84068=
>. This patch is taken from Fedora.
> +
> +diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefil=
e.pre.in
> +--- Python-2.7/Makefile.pre.in.fix-parallel-make =C2=A0 =C2=A0 =C2=A0 20=
10-07-22 15:01:39.567996932 -0400
> ++++ Python-2.7/Makefile.pre.in 2010-07-22 15:47:02.437998509 -0400
> +@@ -198,6 +198,7 @@ SIGNAL_OBJS=3D =C2=A0 =C2=A0 =C2=A0 @SIGNAL_OBJS@
> +
> + #######################################################################=
###
> + # Grammar
> ++GRAMMAR_STAMP=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0$(srcdir)/grammar-stamp
> + GRAMMAR_H=3D =C2=A0 =C2=A0$(srcdir)/Include/graminit.h
> + GRAMMAR_C=3D =C2=A0 =C2=A0$(srcdir)/Python/graminit.c
> + GRAMMAR_INPUT=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0$(srcdir)/Grammar/Grammar
> +@@ -515,10 +516,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
> + Modules/python.o: $(srcdir)/Modules/python.c
> + =C2=A0 =C2=A0 =C2=A0 $(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/=
python.c
> +
> ++# GNU "make" interprets rules with two dependents as two copies of the =
rule.
> ++#
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
> +
> +-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
> ++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -@$(INSTALL) -d Includ=
e
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -$(HOSTPGEN) $(GRAMMAR=
_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch $(GRAMMAR_STAMP)
> +
> + $(PGEN): =C2=A0 =C2=A0 =C2=A0$(PGENOBJS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(OPT) $(LDFLAGS=
) $(PGENOBJS) $(LIBS) -o $(PGEN)
> diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/pytho=
n-native_2.6.5.bb
> index 76fbbb6..12c2252 100644
> --- a/recipes/python/python-native_2.6.5.bb
> +++ b/recipes/python/python-native_2.6.5.bb
> @@ -11,11 +11,11 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://10-distutils-fix-swig-par=
ameter.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://11-distutils-never-modify=
-shebang-line.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://12-distutils-prefix-is-in=
side-staging-area.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://20-fix-parallel-make.patch


Did you forget a '\' here ?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debug.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nohostlibs.patch"
> =C2=A0SRC_URI[md5sum] =3D "6bef0417e71a1a1737ccf5750420fdb3"
> =C2=A0SRC_URI[sha256sum] =3D "62da62eb685621ede2be1275f11b89fa0e0be578db8=
daa5320d0a7855c0a9ebc"
> -
> =C2=A0S =3D "${WORKDIR}/Python-${PV}"
>
> =C2=A0inherit native
> diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5=
.bb
> index ecd9f78..2c26512 100644
> --- a/recipes/python/python_2.6.5.bb
> +++ b/recipes/python/python_2.6.5.bb
> @@ -3,7 +3,7 @@ DEPENDS =3D "python-native db gdbm openssl readline sqlit=
e3 tcl zlib\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURE=
S', 'tk', 'tk', '', d)}"
> =C2=A0DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
> =C2=A0# set to .0 on every increase of INC_PR
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI =3D "\
> =C2=A0 http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> @@ -14,8 +14,9 @@ SRC_URI =3D "\
> =C2=A0 file://04-default-is-optimized.patch \
> =C2=A0 file://05-enable-ctypes-cross-build.patch \
> =C2=A0 file://06-ctypes-libffi-fix-configure.patch \
> + =C2=A0file://20-fix-parallel-make.patch \
> =C2=A0 file://99-ignore-optimization-flag.patch \
> - =C2=A0file://sitecustomize.py \
> + =C2=A0file://sitecustomize.py


you forget '\' here too

> =C2=A0"
> =C2=A0SRC_URI[md5sum] =3D "6bef0417e71a1a1737ccf5750420fdb3"
> =C2=A0SRC_URI[sha256sum] =3D "62da62eb685621ede2be1275f11b89fa0e0be578db8=
daa5320d0a7855c0a9ebc"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


