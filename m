Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdX3C-0003Wk-Ir
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 00:57:54 +0100
Received: by yxd5 with SMTP id 5so931554yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 15:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=wpZea8Zm9OvP1DjR3HrkYC7XH43qG4rwGybEBRCIOtE=;
	b=R++TzxQv0crLhCmBOaUImPlCwKkKPOz/HO5TUvI3gUKtS6+BhuB+xyrOf93JIITaus
	P5eaSJJAlzu8CrJcbqSkXfU/oq+ICLO2frIxRm/ClYH0CiOHpc8996qrDEPmBeKnVXVN
	YbjUVqWmYD5oZaTe1hOBL0Nv8nbDxTYjrPe+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=h6hJyQBPWn2IXkQn8cH/De16E6nJ9dWDWloLL7723nR02Zxat7Pb6Qixewljof0cQM
	v9sz0RaHgG4KXtkqegG/XHCA5tgFQ0VJotTt0nYo2+ECmQHURB9O+S81a5QcfIAMfy1y
	vS4z+t8Oldf5c7k658bV8zlAtrsdcWu92O7ps=
Received: by 10.91.163.27 with SMTP id q27mr368376ago.139.1294963040267; Thu,
	13 Jan 2011 15:57:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Thu, 13 Jan 2011 15:57:00 -0800 (PST)
In-Reply-To: <1294957498-10913-1-git-send-email-obi@opendreambox.org>
References: <4D2F6EAC.40209@mentor.com>
	<1294957498-10913-1-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2011 15:57:00 -0800
Message-ID: <AANLkTimjXn3ZN7cfz0P-Yjd5JLJrdfRZuTU2ky20CLqY@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] libcap2: fix build with and without libpam
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
X-List-Received-Date: Thu, 13 Jan 2011 23:57:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 2:24 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Add libpam to depends if DISTRO_FEATURES contains pam.
>
> * Fixes the following compile error, when libpam-dev is installed
> =C2=A0on the host, but not built for the target:
>
> pam_cap.c:19:34: error: security/pam_modules.h: No such file or
> directory
> pam_cap.c:20:34: error: security/_pam_macros.h: No such file or
> directory
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
> CC: Tom Rini <tom_rini@mentor.com>
> ---
> v2: Updated patch to fix both the dependency problem and
> =C2=A0 =C2=A0the compile error without libpam.
>
> =C2=A0recipes/libcap/libcap2-2.16/make.patch | =C2=A0 15 ++++++++++++---
> =C2=A0recipes/libcap/libcap2_2.16.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A06 ++++--
> =C2=A02 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/libcap/libcap2-2.16/make.patch b/recipes/libcap/libc=
ap2-2.16/make.patch
> index 3672f77..2d88ad9 100644
> --- a/recipes/libcap/libcap2-2.16/make.patch
> +++ b/recipes/libcap/libcap2-2.16/make.patch
> @@ -1,6 +1,8 @@
> ---- libcap-2.16/Make.Rules.orig =C2=A0 =C2=A0 =C2=A0 =C2=A02009-03-07 18=
:50:23.000000000 +0100
> -+++ libcap-2.16/Make.Rules =C2=A0 =C2=A0 2009-03-07 18:50:44.000000000 +=
0100
> -@@ -45,19 +45,12 @@
> +Index: libcap-2.16/Make.Rules
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libcap-2.16.orig/Make.Rules =C2=A0 =C2=A0 =C2=A0 =C2=A02008-12-04 08=
:03:30.000000000 +0100
> ++++ libcap-2.16/Make.Rules =C2=A0 =C2=A0 2011-01-13 22:51:04.568844000 +=
0100
> +@@ -45,25 +45,18 @@
> =C2=A0KERNEL_HEADERS :=3D $(topdir)/libcap/include
> =C2=A0IPATH +=3D -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
>
> @@ -21,3 +23,10 @@
>
> =C2=A0SYSTEM_HEADERS =3D /usr/include
> =C2=A0INCS=3D$(topdir)/libcap/include/sys/capability.h
> + LDFLAGS +=3D -L$(topdir)/libcap
> + CFLAGS +=3D -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
> +-PAM_CAP :=3D $(shell if [ -f /usr/include/security/pam_modules.h ]; the=
n echo yes ; else echo no ; fi)
> ++PAM_CAP :=3D $(shell if [ -f $(STAGING_INCDIR)/security/pam_modules.h ]=
; then echo yes ; else echo no ; fi)

can you use ${includedir} or something else ? STAGING_INCDIR is an OE
variable we should avoid perpetuating it into sourcecode and limit it
to metadata if possible

> + INDENT :=3D $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo =
"| indent -kr" ; fi)
> + DYNAMIC :=3D $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
> + LIBATTR :=3D yes
> diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16=
.bb
> index 97b03d5..33594de 100644
> --- a/recipes/libcap/libcap2_2.16.bb
> +++ b/recipes/libcap/libcap2_2.16.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "Libcap is a library for getting and sett=
ing POSIX.1e (formerly PO
> =C2=A0PRIORITY =3D "optional"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "GPL"
> -DEPENDS =3D "bison-native flex-native attr"
> -PR =3D "r2"
> +DEPENDS =3D "bison-native flex-native attr ${@base_contains('DISTRO_FEAT=
URES', 'pam', 'libpam', '', d)}"
> +PR =3D "r3"
>
> =C2=A0BUILD_CFLAGS +=3D "-I${S}/libcap/include"
> =C2=A0CFLAGS +=3D "-I${S}/libcap/include"
> @@ -15,6 +15,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/securit=
y/linux-privs/libcap2/libca
>
> =C2=A0S =3D "${WORKDIR}/libcap-${PV}"
>
> +EXTRA_OEMAKE =3D "STAGING_INCDIR=3D${STAGING_INCDIR}"
> +
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/sys
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 libcap/include/sys/capability.=
h ${D}${includedir}/sys/
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


