Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJIwN-0006bf-Sb
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:51:16 +0100
Received: by yxd5 with SMTP id 5so2555596yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 20:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=GNzyaVReC+O6+ZSdaFA8mN/bBjPD20BXT5pCCWT883w=;
	b=mHGdwIAcvh4TCgltna7HA7UEZf2ESGU6wWTRLwWlFS0DcS8zRQIIuZFuk9inOuvgL7
	osPwlBy9qkJDqF7Q+yzYPD91IJieEQ3BGMi9RoPgx2HnMHqaidEjYAKbM8oPEAlvJnOd
	EDPODE/AbnV7zlkhPLGsJx5zHoznFohWJPJyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=N5FcAeLYvWZP8QoWFpkBhQTttVqxXrDS2DVvyUXDpF09HTXZbP6czI0aqRjRSClbnm
	eMjm9FBkyV+59iqVU4qFOZiyhcVbtTPJMW3JhT4Dl1GLc5ZlYAlKTzmLVyWEOGUV8oOg
	rjsDqSAryzgPPsvjrLvJHv+lBUSh6xKjft9rU=
Received: by 10.91.47.38 with SMTP id z38mr1942988agj.129.1290141761798; Thu,
	18 Nov 2010 20:42:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 20:42:21 -0800 (PST)
In-Reply-To: <F8F69BD6-3BBB-4F09-B9E1-B172C31B4B96@chumby.com>
References: <F8F69BD6-3BBB-4F09-B9E1-B172C31B4B96@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 20:42:21 -0800
Message-ID: <AANLkTikqYyVJbXE+1Ed5R8hqfybDUG264GaGPab=qy8b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs: Add emacs 23.2
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
X-List-Received-Date: Fri, 19 Nov 2010 04:51:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2010 at 8:34 PM, Sean Cross <sean@chumby.com> wrote:
> Emacs 23.2 is the first version that cleanly builds with gcc-4.5. =C2=A0T=
his patch adds support for Emacs 23.2.

.

Thanks for doing this

>
> ---
> =C2=A0recipes/emacs/emacs_23.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 15 ++++
> =C2=A0recipes/emacs/files/emacs23.2-use-qemu.patch | =C2=A0102 ++++++++++=
++++++++++++++++
> =C2=A02 files changed, 117 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/emacs/emacs_23.2.bb
> =C2=A0create mode 100644 recipes/emacs/files/emacs23.2-use-qemu.patch
>
> diff --git a/recipes/emacs/emacs_23.2.bb b/recipes/emacs/emacs_23.2.bb
> new file mode 100644
> index 0000000..d57351a
> --- /dev/null
> +++ b/recipes/emacs/emacs_23.2.bb
> @@ -0,0 +1,15 @@
> +require emacs.inc
> +
> +EXTRA_OECONF =3D "--without-sound --without-x"
> +
> +#/!\warning untested recipe
> +DEFAULT_PREFERENCE =3D "-2"

Why not make it default. ?



> +
> +SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://emacs23.2-use-qemu.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nostdlib-unwind.patch"
> +SRC_URI[tarball.md5sum] =3D "b6691852dae0bc142b3c12749f6b7ade"
> +SRC_URI[tarball.sha256sum] =3D "1617b8289e403bc6345f8fcc4b3ec01755962cf8=
842b505d971efe08c9bf7919"
> +
> +
> +S =3D "${WORKDIR}/emacs-${PV}"
> diff --git a/recipes/emacs/files/emacs23.2-use-qemu.patch b/recipes/emacs=
/files/emacs23.2-use-qemu.patch
> new file mode 100644
> index 0000000..2c3c195
> --- /dev/null
> +++ b/recipes/emacs/files/emacs23.2-use-qemu.patch
> @@ -0,0 +1,102 @@
> +diff -ur emacs-23.2-stock/Makefile.in emacs-23.2/Makefile.in
> +--- emacs-23.2-stock/Makefile.in =C2=A0 =C2=A0 =C2=A0 2010-11-19 02:52:0=
8.102072074 +0000
> ++++ emacs-23.2/Makefile.in =C2=A0 =C2=A0 2010-11-19 02:52:15.282048950 +=
0000
> +@@ -336,7 +336,7 @@
> + # all preloaded elisp files, and only then dump the actual src/emacs, w=
hich
> + # is not wrong, but is overkill in 99.99% of the cases.
> + src: Makefile FRC
> +- =C2=A0 =C2=A0 =C2=A0boot=3Dbootstrap-emacs$(EXEEXT); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> ++ =C2=A0 =C2=A0 =C2=A0boot=3D${QEMU} bootstrap-emacs$(EXEEXT); =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
> + =C2=A0 =C2=A0 =C2=A0 if [ ! -x "src/$$boot" ]; then =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $@; $(MAKE) all $(MFLAGS) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D'${CC}' CFLAGS=3D'${CFLA=
GS}' CPPFLAGS=3D'${CPPFLAGS}' =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> +diff -ur emacs-23.2-stock/leim/Makefile.in emacs-23.2/leim/Makefile.in
> +--- emacs-23.2-stock/leim/Makefile.in =C2=A02010-11-19 02:52:08.20208214=
6 +0000
> ++++ emacs-23.2/leim/Makefile.in =C2=A0 =C2=A0 =C2=A0 =C2=A02010-11-19 02=
:52:15.282048950 +0000
> +@@ -51,7 +51,7 @@
> +
> + # How to run Emacs.
> + RUN-EMACS =3D EMACSLOADPATH=3D$(buildlisppath) LC_ALL=3DC \
> +- =C2=A0 =C2=A0 =C2=A0${BUILT-EMACS} -batch --no-init-file --no-site-fil=
e --multibyte
> ++ =C2=A0 =C2=A0 =C2=A0${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-=
site-file --multibyte
> +
> + # Subdirectories to be made if ${srcdir} is different from the current
> + # directory.
> +diff -ur emacs-23.2-stock/lib-src/Makefile.in emacs-23.2/lib-src/Makefil=
e.in
> +--- emacs-23.2-stock/lib-src/Makefile.in =C2=A0 =C2=A0 =C2=A0 2010-11-19=
 02:52:08.082052237 +0000
> ++++ emacs-23.2/lib-src/Makefile.in =C2=A0 =C2=A0 2010-11-19 02:52:15.282=
048950 +0000
> +@@ -23,7 +23,7 @@
> + SHELL =3D /bin/sh
> +
> + # Following ../lisp/Makefile.in.
> +-EMACS =3D ../src/emacs
> ++EMACS =3D ${QEMU} ../src/emacs
> + EMACSOPT =3D -batch --no-site-file --multibyte
> +
> + # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Things `=
configure' will edit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +@@ -372,7 +372,7 @@
> + =C2=A0 =C2=A0clobbered too. =C2=A0*/
> + test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
> + =C2=A0 =C2=A0 =C2=A0 $(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test=
-distrib.c
> +- =C2=A0 =C2=A0 =C2=A0./test-distrib ${srcdir}/testfile
> ++ =C2=A0 =C2=A0 =C2=A0${QEMU} ./test-distrib ${srcdir}/testfile
> +
> + /* We need the following in order to create a <getopt.h> when the syste=
m
> + =C2=A0 =C2=A0does not have one that works with the given compiler. =C2=
=A0*/
> +diff -ur emacs-23.2-stock/lisp/Makefile.in emacs-23.2/lisp/Makefile.in
> +--- emacs-23.2-stock/lisp/Makefile.in =C2=A02010-11-19 02:52:07.92205707=
0 +0000
> ++++ emacs-23.2/lisp/Makefile.in =C2=A0 =C2=A0 =C2=A0 =C2=A02010-11-19 02=
:52:15.282048950 +0000
> +@@ -26,8 +26,7 @@
> + # You can specify a different executable on the make command line,
> + # e.g. "make EMACS=3D../src/emacs ...".
> +
> +-EMACS =3D ../src/emacs
> +-
> ++EMACS =3D "${QEMU} ../src/emacs"
> + # Command line flags for Emacs. =C2=A0This must include --multibyte,
> + # otherwise some files will not compile.
> +
> +diff -ur emacs-23.2-stock/src/Makefile.in emacs-23.2/src/Makefile.in
> +--- emacs-23.2-stock/src/Makefile.in =C2=A0 2010-11-19 02:52:08.18207936=
1 +0000
> ++++ emacs-23.2/src/Makefile.in 2010-11-19 02:55:09.762049503 +0000
> +@@ -479,7 +479,7 @@
> + =C2=A0 =C2=A0this with the shell''s ``for'' construct.
> + =C2=A0 =C2=A0Note that some people do not have '.' =C2=A0in their paths=
, so we must
> + =C2=A0 =C2=A0use ./prefix-args. =C2=A0*/
> +-#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
> ++#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
> + #else
> + #define YMF_PASS_LDFLAGS(flags) flags
> + #endif
> +@@ -916,9 +916,9 @@
> + =C2=A0 =C2=A0$(GNULIB_VAR) LIB_MATH LIB_STANDARD $(GNULIB_VAR)
> +
> + #ifdef HAVE_SHM
> +-RUN_TEMACS =3D `/bin/pwd`/temacs -nl
> ++RUN_TEMACS =3D ${QEMU} temacs -nl
> + #else
> +-RUN_TEMACS =3D `/bin/pwd`/temacs
> ++RUN_TEMACS =3D ${QEMU} temacs
> + #endif
> +
> + all: emacs${EXEEXT} $(OTHER_FILES)
> +@@ -933,7 +933,7 @@
> + =C2=A0 =C2=A0 =C2=A0 @: This new Emacs is as functional and more effici=
ent then
> + =C2=A0 =C2=A0 =C2=A0 @: bootstrap-emacs, so let us replace it.
> + =C2=A0 =C2=A0 =C2=A0 -ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
> +- =C2=A0 =C2=A0 =C2=A0-./emacs -q -batch -f list-load-path-shadows
> ++ =C2=A0 =C2=A0 =C2=A0-${QEMU} ./emacs -q -batch -f list-load-path-shado=
ws
> + #endif /* ! defined (CANNOT_DUMP) */
> +
> + /* We run make-docfile twice because the command line may get too long
> +@@ -951,8 +951,8 @@
> + =C2=A0 =C2=A0only in order to reduce the command line length. =C2=A0--S=
tef =C2=A0*/
> + ${etc}DOC: ${libsrc}make-docfile${EXEEXT} ${obj} ${lisp} ${SOME_MACHINE=
_LISP}
> + =C2=A0 =C2=A0 =C2=A0 -rm -f ${etc}DOC
> +- =C2=A0 =C2=A0 =C2=A0${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_=
OBJECTS} ${obj} > ${etc}DOC
> +- =C2=A0 =C2=A0 =C2=A0${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${=
SOME_MACHINE_LISP} ${shortlisp}
> ++ =C2=A0 =C2=A0 =C2=A0${QEMU}${libsrc}make-docfile -d ${srcdir} ${SOME_M=
ACHINE_OBJECTS} ${obj} > ${etc}DOC
> ++ =C2=A0 =C2=A0 =C2=A0${QEMU} ${libsrc}make-docfile -a ${etc}DOC -d ${sr=
cdir} ${SOME_MACHINE_LISP} ${shortlisp}
> +
> + ${libsrc}make-docfile${EXEEXT}:
> + =C2=A0 =C2=A0 =C2=A0 cd ${libsrc}; ${MAKE} ${MFLAGS} make-docfile${EXEE=
XT}
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


