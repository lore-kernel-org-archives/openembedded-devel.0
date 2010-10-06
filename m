Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3UJJ-0003mR-Km
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 15:45:38 +0200
Received: by iwn38 with SMTP id 38so295334iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9AiIn2IL3xZwa/6o1v/KnO6yMM2Tm4Agvqj8Y3vJfNg=;
	b=JB+WMVGF3kZuKFlcthCiraeFThkb6emHqw3BErtS0PJoIXAQmBx8jBeMGTqbAheaGe
	7QA6LpTyGNBzhZvsvMGBBoYexP8bMSxM2ajpf6+CY5VjdpTSfa0SmdJ8L2AmHSHD/ypa
	OzW8pqBP4mPFbqdzn3i+S20b4UajzwEu2OV34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ng80RTy0KIN1mqTgzBf24r7JjC9tk7SwV+MNrez2q9yRTCZuxfEO0aGFdKZrTiU9i4
	wmk29X2Zj3s0uylmQni2Je+JzOWtnuzFZv591EwR+R9GrKl8JZYlZkfgRBOkyJGGQIv6
	fKnosNT9kxSctmaQ4FaVYGFsm/yBzmr6pzn2k=
MIME-Version: 1.0
Received: by 10.231.182.204 with SMTP id cd12mr13956219ibb.101.1286372713686; 
	Wed, 06 Oct 2010 06:45:13 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 6 Oct 2010 06:45:13 -0700 (PDT)
In-Reply-To: <1286360419-23692-1-git-send-email-jayen@cse.unsw.edu.au>
References: <1286360419-23692-1-git-send-email-jayen@cse.unsw.edu.au>
Date: Wed, 6 Oct 2010 15:45:13 +0200
Message-ID: <AANLkTikS4goX8mvN7di19uN6dZccGN2csxKgYMwcutPj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] SWI-Prolog: New program
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
X-List-Received-Date: Wed, 06 Oct 2010 13:45:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jayen, thanks for your contribution.
Below some feedback.

2010/10/6 Jayen Ashar <jayen@cse.unsw.edu.au>:
> * Starting with SWI-Prolog 5.10.1
> * SWI-Prolog is a fast and powerful ISO/Edinburgh-style Prolog compiler w=
ith a
> * =A0rich set of built-in predicates. It offers a fast, robust and small
> * =A0environment which enables substantial applications to be developed w=
ith it.
>
> Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
> ---
> =A0recipes/swi-prolog/swi-prolog.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 76 +++=
++++++++++++++++++++++
> =A0recipes/swi-prolog/swi-prolog/configure.patch | =A0 11 ++++
> =A0recipes/swi-prolog/swi-prolog_5.10.1.bb =A0 =A0 =A0 | =A0 =A03 +
> =A03 files changed, 90 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/swi-prolog/swi-prolog.inc
> =A0create mode 100644 recipes/swi-prolog/swi-prolog/configure.patch
> =A0create mode 100644 recipes/swi-prolog/swi-prolog_5.10.1.bb
>
> diff --git a/recipes/swi-prolog/swi-prolog.inc b/recipes/swi-prolog/swi-p=
rolog.inc
> new file mode 100644
> index 0000000..772873e
> --- /dev/null
> +++ b/recipes/swi-prolog/swi-prolog.inc
> @@ -0,0 +1,76 @@
> +DESCRIPTION =3D "SWI-Prolog is a fast and powerful ISO/Edinburgh-style P=
rolog compiler with a rich set of built-in predicates. It offers a fast, ro=
bust and small environment which enables substantial applications to be dev=
eloped with it."
> +HOMEPAGE =3D "http://www.swi-prolog.org/"
> +SECTION =3D "interpreters"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPL"
> +DEPENDS =3D "ncurses readline gmp chrpath"

Do you need chrpath on the target
> +
> +INC_PR =3D "r1"

New recipes start with r0

> +
> +SRC_URI =3D "http://mirror.cse.unsw.edu.au/pub/debian/pool/main/s/${PN}/=
${PN}_${PV}.orig.tar.gz \
> + =A0 =A0 =A0 =A0 =A0 file://configure.patch;patch=3D1"
> +
> +S =3D "${WORKDIR}/pl-${PV}"
> +
> +inherit autotools
> +
> +#overriden because we don't want to run autoconf on releases
> +do_configure() {
> + =A0if [ -e ${S}/configure ]; then
> + =A0 =A0oe_runconf $@
> + =A0else
> + =A0 =A0oenote "nothing to configure ${S}"
> + =A0fi
> +}
> +
> +#appended so we can run configure and make on the packages directory aft=
er
> +#compiling the main enging

Hm, not too keen on that. What about splitting the recipe in two; one
for the main engine, and one for the packages?

> +do_compile_append() {
> + =A0if [ -e ${S}/packages/configure ]; then
> + =A0if [ -x ${S}/packages/configure ] ; then
> + =A0 =A0cd ${S}/packages
> + =A0 =A0export DISABLE_PKGS=3D"xpce http pldoc jpl"
> + =A0 =A0cfgcmd=3D"${S}/packages/configure \
> + =A0 =A0 =A0 =A0--build=3D${BUILD_SYS} \
> + =A0 =A0 =A0 =A0--host=3D${HOST_SYS} \
> + =A0 =A0 =A0 =A0--target=3D${TARGET_SYS} \
> + =A0 =A0 =A0 =A0--prefix=3D${prefix} \
> + =A0 =A0 =A0 =A0--exec_prefix=3D${exec_prefix} \
> + =A0 =A0 =A0 =A0--bindir=3D${bindir} \
> + =A0 =A0 =A0 =A0--sbindir=3D${sbindir} \
> + =A0 =A0 =A0 =A0--libexecdir=3D${libexecdir} \
> + =A0 =A0 =A0 =A0--datadir=3D${datadir} \
> + =A0 =A0 =A0 =A0--sysconfdir=3D${sysconfdir} \
> + =A0 =A0 =A0 =A0--sharedstatedir=3D${sharedstatedir} \
> + =A0 =A0 =A0 =A0--localstatedir=3D${localstatedir} \
> + =A0 =A0 =A0 =A0--libdir=3D${libdir} \
> + =A0 =A0 =A0 =A0--includedir=3D${includedir} \
> + =A0 =A0 =A0 =A0--oldincludedir=3D${oldincludedir} \
> + =A0 =A0 =A0 =A0--infodir=3D${infodir} \
> + =A0 =A0 =A0 =A0--mandir=3D${mandir} \
> + =A0 =A0 =A0${EXTRA_OECONF} \
> + =A0 =A0 =A0 =A0$@"
> + =A0 =A0oenote "Running $cfgcmd..."
> + =A0 =A0$cfgcmd || oefatal "oe_runconf failed"
> + =A0else
> + =A0 =A0oefatal "no configure script found"
> + =A0fi
> + =A0else
> + =A0 =A0oenote "nothing to configure ${S}/packages"
> + =A0fi
> + =A0if [ -e packages/Makefile -o -e packages/makefile ]; then
> + =A0 =A0oe_runmake -C packages || die "make failed"
> + =A0else
> + =A0 =A0oenote "nothing to compile"
> + =A0fi
> +}
> +
> +#to install the packages
> +do_install_append() {
> + =A0oe_runmake -C packages 'DESTDIR=3D${D}' install
> +}
> +
> +#so debug files aren't included in the main package
> +FILES_${PN}-dbg +=3D " ${libdir}/swipl-${PV}/bin/*/.debug ${libdir}/swip=
l-${PV}/lib/*/.debug"
> +#so the main package includes dependent libraries and packages
> +FILES_${PN} +=3D " ${libdir}/swipl-${PV}"
> diff --git a/recipes/swi-prolog/swi-prolog/configure.patch b/recipes/swi-=
prolog/swi-prolog/configure.patch
> new file mode 100644
> index 0000000..58ecd58
> --- /dev/null
> +++ b/recipes/swi-prolog/swi-prolog/configure.patch
> @@ -0,0 +1,11 @@
> +--- a/src/configure~ =A0 =A02010-07-21 23:04:23.000000000 +1000
> ++++ b/src/configure =A0 =A0 2010-10-01 14:02:15.000000000 +1000
> +@@ -7470,7 +7470,7 @@
> +
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for pthread support f=
or cpu clocks" >&5
> + $as_echo_n "checking for pthread support for cpu clocks... " >&6; }
> +-if test "$cross_compiling" =3D yes; then :
> ++if test x"$cross_compiling" =3D yes; then :
> + =A0 { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >=
&5
> + $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> + as_fn_error "cannot run test program while cross compiling
> diff --git a/recipes/swi-prolog/swi-prolog_5.10.1.bb b/recipes/swi-prolog=
/swi-prolog_5.10.1.bb
> new file mode 100644
> index 0000000..bb7e95b
> --- /dev/null
> +++ b/recipes/swi-prolog/swi-prolog_5.10.1.bb
> @@ -0,0 +1,3 @@
> +require swi-prolog.inc
> +
> +PR =3D "${INC_PR}.1"

Again here start with .0

Best regards, Frans


