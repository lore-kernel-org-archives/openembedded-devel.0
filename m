Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OS3RF-00089k-VH
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 09:35:06 +0200
Received: by bwz14 with SMTP id 14so2862375bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PY6An7gzb0Bxz7rs2ddbYLHv9oakLTr5QnDBhtscOq0=;
	b=ucJFAbzLjU1725xWpA8q8oDge96BqBF4C3Men8temqwcwctpxSEO3L4OLXLzQo63KQ
	CjWIKczNLY2DhWudHyHRs/5+MjjF04bz6G+oNhoPUtusDRL2Ij1TO08b6TS03jKi67eO
	uyTKjZoSUhBhTQND9ypqL/R1GBgL4Di5oU/FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sg9rrfSFjAJtSMMgJAHmci/HQjDS1PBhQL4bokwBPgoFqnRIzvGZt2Q0+OcmQ7nLhk
	ZfLSqClNJfkhlVQD7CGumx/a6pXVdwkk3stFoY0Z5/MpZJKryRXqQ4wH0bRWzL3Ykxuk
	e64N3Mj5YpIHBfcwlRPpgBFZ3IG4OHyzIeAtQ=
MIME-Version: 1.0
Received: by 10.204.30.200 with SMTP id v8mr194729bkc.83.1277451024702; Fri, 
	25 Jun 2010 00:30:24 -0700 (PDT)
Received: by 10.204.123.210 with HTTP; Fri, 25 Jun 2010 00:30:24 -0700 (PDT)
In-Reply-To: <1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
	<1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 25 Jun 2010 09:30:24 +0200
Message-ID: <AANLkTimmDzSklYOb2pAeuVrdGl5jTn0ZolFX17rspCzf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-libc-headers: use kernel-arch.bbclass
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
X-List-Received-Date: Fri, 25 Jun 2010 07:35:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/21 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> linux-libc-headers recipes all have their own code to set ARCH.
> However this same functionality is in kernel-arch.bbclass
> This patch adds an inherit kernel-arch in linux-libc-headers.inc
> and removes all arch calculation code from the recipes
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/linux-libc-headers/linux-libc-headers.inc =A0| =A0 =A02 +
> =A0.../linux-libc-headers_2.6.11.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 18 +-------------
> =A0.../linux-libc-headers_2.6.15.99.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 18 +-------------
> =A0.../linux-libc-headers_2.6.18+2.6.19-rc1.bb =A0 =A0 =A0 =A0| =A0 22 +-=
---------------
> =A0.../linux-libc-headers_2.6.18.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 23 +-----------------
> =A0.../linux-libc-headers_2.6.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.22.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.24.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.25.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.29.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.30.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.31.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 25 +-------------------
> =A0.../linux-libc-headers_2.6.7.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 18 +-------------
> =A0.../linux-libc-headers_2.6.8.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 18 +-------------
> =A016 files changed, 17 insertions(+), 327 deletions(-)
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc b/recipes/=
linux-libc-headers/linux-libc-headers.inc
> index 0b0d05a..3410f35 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers.inc
> +++ b/recipes/linux-libc-headers/linux-libc-headers.inc
> @@ -6,3 +6,5 @@ BBCLASSEXTEND =3D "native"
>
> =A0RDEPENDS_${PN}-dev =3D ""
> =A0RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPV})"
> +
> +inherit kernel-arch
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb b/=
recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> index 0f925dd..95143c9 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://ep09.pld-linux.org/~mmazur/linux-lib=
c-headers/"
> =A0# =A0 standard linux kernel license applies.
> =A0# since we assume GPL for linux i think we can also assume it here
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linu=
x-libc-headers-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0file://keyboard.patch"
> @@ -15,22 +15,6 @@ SRC_URI =3D "http://ep09.pld-linux.org/~mmazur/linux-l=
ibc-headers/linux-libc-heade
> =A0S =3D "${WORKDIR}/linux-libc-headers-${PV}"
>
> =A0do_configure () {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dppc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> =A0 =A0 =A0 =A0if test ! =A0-e include/asm-$ARCH; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oefatal unable to create asm symlink in ke=
rnel headers
> =A0 =A0 =A0 =A0fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb b=
/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> index 3dafb32..c5a6c4f 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> @@ -13,7 +13,7 @@ require linux-libc-headers.inc
> =A0# since we assume GPL for linux i think we can also assume it here
> =A0DEFAULT_PREFERENCE =3D "-1"
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-$=
{PV}.tar.bz2 \
> =A0 =A0 =A0 =A0file://keyboard.patch \
> @@ -27,22 +27,6 @@ SRC_URI =3D "http://ewi546.ewi.utwente.nl/OE/eabi/linu=
x-libc-headers-${PV}.tar.bz2
> =A0S =3D "${WORKDIR}/linux-libc-headers-${PV}"
>
> =A0do_configure () {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dppc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> =A0 =A0 =A0 =A0if test ! =A0-e include/asm-$ARCH; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oefatal unable to create asm symlink in ke=
rnel headers
> =A0 =A0 =A0 =A0fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-=
rc1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> index d5494d4..17d2091 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0DEFAULT_PREFERENCE =3D "-1"
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D " \
> =A0 =A0 =A0 =A0${KERNELORG_MIRROR}/pub/linux/kernel/people/dwmw2/kernel-h=
eaders/snapshot/linux-kernel-headers-2.6.19-rc1.tar.bz2 \
> @@ -13,27 +13,7 @@ SRC_URI =3D " \
>
> =A0S =3D "${WORKDIR}/linux-2.6.19-rc1"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0install -d ${D}${includedir}
> =A0 =A0 =A0 =A0cp -pfLR ${S}${includedir}/linux ${D}${includedir}/
> =A0 =A0 =A0 =A0cp -pfLR ${S}${includedir}/asm-${ARCH} ${D}${includedir}/a=
sm
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> index 8d88bf1..80806ff 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> @@ -2,34 +2,14 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.ta=
r.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://arm-syscall-define.patch"
>
> =A0S =3D "${WORKDIR}/linux-2.6.18"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D${ARCH}
> =A0}
>
> @@ -37,7 +17,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D${ARCH}
> =A0 =A0 =A0 =A0# Add UTS_RELEASE to version.h. UTS_RELEASE was moved from=
 version.h to
> =A0 =A0 =A0 =A0# utsrelease.h in order to avoid recompiling a kernel ever=
y time a localversion
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> index f048ea3..32ce044 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r11"
> +PR =3D "r12"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://procinfo.h \
> @@ -11,29 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -41,7 +19,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> index 6b9a9f7..12845e0 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> @@ -2,36 +2,14 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://procinfo.h"
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -39,7 +17,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 742433f..474b96c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://procinfo.h \
> @@ -11,29 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -41,7 +19,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index 74876bf..b90c478 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://procinfo.h \
> @@ -10,29 +10,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -40,7 +18,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> index c4200e0..084fea6 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 file://reinstate-a.out.h.patch \
> @@ -13,29 +13,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -43,7 +21,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> index d939349..d59fb4d 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> @@ -2,36 +2,14 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0"
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -39,7 +17,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> index 0048f24..c64e59c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 file://uio-header.patch \
> @@ -12,29 +12,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -42,7 +20,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0}
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> index e3a27c5..c31d482 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> @@ -11,29 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0"
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -41,7 +19,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0 =A0 =A0 =A0rm -f ${D}${exec_prefix}/include/scsi/scsi.h
> =A0}
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> index 16304df..b12100c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> @@ -11,29 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/linux-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0"
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> -set_arch() {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dpowerpc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 avr32*) =A0 ARCH=3Davr32 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bfin*) =A0 =A0ARCH=3Dblackfin ;;
> - =A0 =A0 =A0 esac
> -}
> -
> =A0do_configure() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake allnoconfig ARCH=3D$ARCH
> =A0}
>
> @@ -41,7 +19,6 @@ do_compile () {
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0 =A0 =A0 =A0rm -f ${D}${exec_prefix}/include/scsi/scsi.h
> =A0}
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb b/r=
ecipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> index 0a1159a..8141fac 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0NATIVE_INSTALL_WORKS =3D "0"
> -PR =3D "r4"
> +PR =3D "r5"
> =A0# NOTE: no need to package these headers, since the c library includes=
 them.
> =A0PACKAGES =3D ""
>
> @@ -12,22 +12,6 @@ SRC_URI =3D "http://ep09.pld-linux.org/~mmazur/linux-l=
ibc-headers/linux-libc-heade
> =A0S =3D "${WORKDIR}/linux-libc-headers-${PV}"
>
> =A0do_configure () {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dppc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> =A0 =A0 =A0 =A0if test ! =A0-e include/asm-$ARCH; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oefatal unable to create asm symlink in ke=
rnel headers
> =A0 =A0 =A0 =A0fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb b/r=
ecipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> index 6cbd8ba..15c4e6d 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://ep09.pld-linux.org/~mmazur/linux-lib=
c-headers/"
> =A0# =A0 standard linux kernel license applies.
> =A0# since we assume GPL for linux i think we can also assume it here
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> -PR =3D "r8"
> +PR =3D "r9"
>
> =A0# NOTE: no need to package these headers, since the c library includes=
 them.
> =A0PACKAGES =3D ""
> @@ -20,22 +20,6 @@ SRC_URI =3D "http://ep09.pld-linux.org/~mmazur/linux-l=
ibc-headers/linux-libc-heade
> =A0S =3D "${WORKDIR}/linux-libc-headers-${PV}"
>
> =A0do_configure () {
> - =A0 =A0 =A0 case ${TARGET_ARCH} in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 alpha*) =A0 ARCH=3Dalpha ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 arm*) =A0 =A0 ARCH=3Darm ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cris*) =A0 =A0ARCH=3Dcris ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hppa*) =A0 =A0ARCH=3Dparisc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i*86*) =A0 =A0ARCH=3Di386 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ia64*) =A0 =A0ARCH=3Dia64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0 =A0ARCH=3Dmips ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 m68k*) =A0 =A0ARCH=3Dm68k ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 powerpc*) ARCH=3Dppc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s390*) =A0 =A0ARCH=3Ds390 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sh*) =A0 =A0 =A0ARCH=3Dsh ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc64*) ARCH=3Dsparc64 ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparc*) =A0 ARCH=3Dsparc ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64*) =A0ARCH=3Dx86_64 ;;
> - =A0 =A0 =A0 esac
> =A0 =A0 =A0 =A0if test ! =A0-e include/asm-$ARCH; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oefatal unable to create asm symlink in ke=
rnel headers
> =A0 =A0 =A0 =A0fi
> --
> 1.6.4.2
>
>

Didn't get any feedback on this.
Not sure if the commit policy requires acks for a change like this
(but posted here as linux-libc-header is fairly core).
Should I interpret the silence as ok go ahead, as a rejection or as a
don't care?

Frans


