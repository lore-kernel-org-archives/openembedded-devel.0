Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvwBr-0000hS-EF
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:54:41 +0200
Received: by iwn2 with SMTP id 2so303509iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NzF+b6kC4OdSJKsW2IRPsSeIbwnlsWaf6y9H9jtUzAE=;
	b=q0PaYuek+oV1XeEQI029P9cip3McSKvWJods4qCIVFc4ZhKRIKhKJW6FiZc8Y8vX2V
	t9yXEPtMUJB/K8SA+CEnRWBy535x2ZUvwxZLJJFlJAHsoSPFeQtmAQwqQ18vsvJHO3zU
	JRBISchC9RnebWJpEXmjhi9vIvAzue6zO91j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=B2F7u6Dc+nUhRbqYzIVh96BbYka6jE0c+yEyhATr2r3UvFiMvXsZ5zI73PSmicVz3x
	IRRV+YD6jOPmadt0psQGOLB1JKLxRFINvvCOYqn7l//g+n2uZo+BZWWWoLOSVQS3XN+H
	Z/N2JnYVPxtSIksObIP6iWiv5O9yIj+upAGGM=
Received: by 10.231.17.11 with SMTP id q11mr1909357iba.63.1284573228243; Wed,
	15 Sep 2010 10:53:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 10:53:21 -0700 (PDT)
In-Reply-To: <AANLkTima-2dyRZXqV-mzaeUM0wgk7ptnEjXjO0VPSZnk@mail.gmail.com>
References: <AANLkTima-2dyRZXqV-mzaeUM0wgk7ptnEjXjO0VPSZnk@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 10:53:21 -0700
Message-ID: <AANLkTikTFE-0hTBuz3WgDOTZjBJ4yCMeAVsjJAJ=_tsR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sh: provide patch of __set_fpscr prototype
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
X-List-Received-Date: Wed, 15 Sep 2010 17:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nobuhiro-san

Patches look ok. Could you revise the patches and add increment PR for
the recipes you modified and also please rebase them
on latest master.

Thanks
-Khem

On Tue, Sep 14, 2010 at 12:42 AM, Nobuhiro Iwamatsu
<nobuhiro.iwamatsu.yj@renesas.com> wrote:
> When we compile a program that used _FPU_SETCW in sh4 in C++,
> become the error.
> his provides a patch revising this problem.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---
> =C2=A0recipes/eglibc/eglibc_2.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.11.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.12.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 ++-
> =C2=A0recipes/eglibc/files/sh4_set_fpscr.patch =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 23 +++++++++++++++++++
> =C2=A0recipes/eglibc/files/sh4_set_fpscr_2.12.patch | =C2=A0 29 +++++++++=
++++++++++++++++
> =C2=A06 files changed, 58 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 recipes/eglibc/files/sh4_set_fpscr.patch
> =C2=A0create mode 100644 recipes/eglibc/files/sh4_set_fpscr_2.12.patch
>
> diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.b=
b
> index c2ed435..1f7ec02 100644
> --- a/recipes/eglibc/eglibc_2.10.bb
> +++ b/recipes/eglibc/eglibc_2.10.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://armv4t-interworking.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_set_fpscr.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.b=
b
> index 5d9b8e2..c65bf22 100644
> --- a/recipes/eglibc/eglibc_2.11.bb
> +++ b/recipes/eglibc/eglibc_2.11.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-svn-arm-lowlevello=
ck-include-tls.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_set_fpscr.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.b=
b
> index c6b0131..8dbcde0 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-svn-arm-lowlevello=
ck-include-tls.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_set_fpscr_2.12.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index a7d9aed..5df7eb8 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -9,9 +9,10 @@ SRCREV=3D"10153"
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_9"
> =C2=A0SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH=
};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-svn-arm-lowlevello=
ck-include-tls.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://armv4t-interworking.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://armv4t-interworking.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://IO-acquire-lock-fix.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_set_fpscr.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/files/sh4_set_fpscr.patch
> b/recipes/eglibc/files/sh4_set_fpscr.patch
> new file mode 100644
> index 0000000..f3fd5c1
> --- /dev/null
> +++ b/recipes/eglibc/files/sh4_set_fpscr.patch
> @@ -0,0 +1,23 @@
> +# http://sourceware.org/ml/libc-alpha/2009-12/msg00009.html
> +# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D565369
> +---
> + sysdeps/sh/sh4/fpu/fpu_control.h | =C2=A0 =C2=A08 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +--- a/sysdeps/sh/sh4/fpu/fpu_control.h
> ++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
> +@@ -45,6 +45,14 @@
> + #define _FPU_GETCW(cw) __asm__ ("sts fpscr,%0" : "=3Dr" (cw))
> +
> + #if defined __GNUC__
> ++/* Allow the use in C++ code. =C2=A0*/
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++extern void __set_fpscr (unsigned long);
> ++#ifdef __cplusplus
> ++}
> ++#endif =C2=A0/* C++ */
> + #define _FPU_SETCW(cw) __set_fpscr ((cw))
> + #else
> + #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
> diff --git a/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> new file mode 100644
> index 0000000..19cccc0
> --- /dev/null
> +++ b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> @@ -0,0 +1,29 @@
> +diff --git a/sysdeps/sh/sh4/fpu/fpu_control.h
> b/sysdeps/sh/sh4/fpu/fpu_control.h
> +index d1be46d..3ea37d3 100644
> +--- a/sysdeps/sh/sh4/fpu/fpu_control.h
> ++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
> +@@ -1,5 +1,5 @@
> + /* FPU control word definitions. =C2=A0SH version.
> +- =C2=A0 Copyright (C) 1999, 2000, 2009 Free Software Foundation, Inc.
> ++ =C2=A0 Copyright (C) 1999, 2000, 2009, 2010 Free Software Foundation, =
Inc.
> + =C2=A0 =C2=A0This file is part of the GNU C Library.
> +
> + =C2=A0 =C2=A0The GNU C Library is free software; you can redistribute i=
t and/or
> +@@ -46,7 +46,14 @@ typedef unsigned int fpu_control_t;
> +
> + #if defined __GNUC__
> + /* GCC provides this function. =C2=A0*/
> ++/* Allow the use in C++ code. =C2=A0*/
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> + extern void __set_fpscr (unsigned long);
> ++#ifdef __cplusplus
> ++}
> ++#endif =C2=A0/* C++ */
> + #define _FPU_SETCW(cw) __set_fpscr ((cw))
> + #else
> + #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
> +--
> +1.7.1
> +
> --
> 1.7.1
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


