Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N5kbZ-0005Kx-VN
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 19:29:17 +0100
Received: by iwn28 with SMTP id 28so5338112iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IjGv7iGVIbNLcbyoUkJvrsfm/O31l68BAoulZUih/Dw=;
	b=xO5UBThWni4J3L53MyDBw6rbSQgaZJb7P2aAE8di5o0Dkz9G3Bzsn/FJm7ZLq0o77N
	Q+LyCL6etUt9hMg2FezWtekDrYdIPZIJ/58CzNjUJERoXXHeA34BN0KBEO3nFCLZRHJU
	G1m7jbjYJqRdfteZjxsNMvvSumiVWvmFogTbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IRnrx8aSOkuJwxiDEzln7tbNaw5v0Gnd4eHA0vhFA4cp6dD+RAP3Mq9eDLuPs9OU63
	B1Hg822dzfj9EduMYS7IfsN58mdbHUKick2ra6Ssas1FStqFm/G5q8xQEk/iS+hOIyj5
	l362tt66zDsTlRBvLcO0R4ucniLv+kKciVOrI=
MIME-Version: 1.0
Received: by 10.231.161.138 with SMTP id r10mr2482356ibx.34.1257359280949; 
	Wed, 04 Nov 2009 10:28:00 -0800 (PST)
In-Reply-To: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
References: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 4 Nov 2009 10:28:00 -0800
Message-ID: <19c1b8a90911041028y24fa7ca0rc5f6e31b1ca568d7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc: updated armv4t-interworking.patch
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
X-List-Received-Date: Wed, 04 Nov 2009 18:29:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2009 at 1:03 AM, Martin.Jansa <martin.jansa@gmail.com> wrote=
:
> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * Updated patch to make SYSCALL_ERROR_HANDLER interworking safe.
> * Phil Blundell found and fixed another issue in eglibc armv4t builds.
>
> Signed-off-by: Martin.Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0recipes/eglibc/eglibc_2.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/eglibc/eglibc_2.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/eglibc/eglibc_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/eglibc/files/armv4t-interworking.patch | =C2=A0 27 ++++++++=
+++++++++++++++-
> =C2=A04 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.b=
b
> index d143b0a..2a62fe3 100644
> --- a/recipes/eglibc/eglibc_2.10.bb
> +++ b/recipes/eglibc/eglibc_2.10.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
> =C2=A0DEPENDS +=3D "gperf-native"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> =C2=A0PV =3D "2.10"
> -PR =3D "${INC_PR}.4"
> +PR =3D "${INC_PR}.5"
> =C2=A0SVN_REV=3D"9124"
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_10"
> =C2=A0SRC_URI =3D "svn://svn.eglibc.org/branches;module=3Deglibc-2_10;rev=
=3D${SVN_REV};proto=3Dsvn \
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index 3efcb36..7a82627 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
> =C2=A0DEPENDS +=3D "gperf-native"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> =C2=A0PV =3D "2.9"
> -PR =3D "${INC_PR}.5"
> +PR =3D "${INC_PR}.6"
> =C2=A0SVN_REV=3D"8690"
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_9"
> =C2=A0SRC_URI =3D "svn://svn.eglibc.org/branches;module=3Deglibc-2_9;rev=
=3D${SVN_REV};proto=3Dsvn \
> diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
> index 1a91af8..3376839 100644
> --- a/recipes/eglibc/eglibc_svn.bb
> +++ b/recipes/eglibc/eglibc_svn.bb
> @@ -5,7 +5,7 @@ SRCREV =3D "9170"
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> =C2=A0PV =3D "2.10+svnr${SRCREV}"
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
> =C2=A0EGLIBC_BRANCH=3D"trunk"
> =C2=A0SRC_URI =3D "svn://svn.eglibc.org;module=3Dtrunk \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-svn-arm-lowlevello=
ck-include-tls.patch;patch=3D1 \
> diff --git a/recipes/eglibc/files/armv4t-interworking.patch b/recipes/egl=
ibc/files/armv4t-interworking.patch
> index 55ee856..6ab3061 100644
> --- a/recipes/eglibc/files/armv4t-interworking.patch
> +++ b/recipes/eglibc/files/armv4t-interworking.patch
> @@ -40,7 +40,7 @@ Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
> =C2=A0#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0@ pick the function arg and call address off t=
he stack and execute
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r0, [sp, #4]
> -+#if defined(__ARM_ARCH_V4T__) && defined(__THUMB_INTERWORK__)
> ++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 ip, [sp], #8
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 lr, pc
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bx =C2=A0 =C2=A0 =C2=A0ip
> @@ -51,3 +51,28 @@ Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0@ and we are done, passing the return value th=
rough r0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 PLTJMP(HIDDEN_JUMPTARGE=
T(_exit))
> +Index: libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/sysdep.h =C2=A0 =C2=A0 =
=C2=A0 2009-09-16 13:58:18.000000000 +0100
> ++++ libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h =C2=A0 =C2=A02009-11=
-03 19:17:16.000000000 +0000
> +@@ -129,6 +129,11 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0DO_RET(lr); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + 1: =C2=A0 =C2=A0 .word C_SYMBOL_NAME(rtld_errno) - 0b - 8;
> + # else
> ++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
> ++#define POP_PC =C2=A0ldr =C2=A0 =C2=A0 lr, [sp], #4; bx lr
> ++#else
> ++#define POP_PC =C2=A0ldr =C2=A0 =C2=A0 pc, [sp], #4
> ++#endif
> + # =C2=A0define SYSCALL_ERROR_HANDLER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \
> + __local_syscall_error: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 lr, [sp, #-4]!; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \
> +@@ -138,7 +143,7 @@
> + =C2=A0 =C2=A0 =C2=A0 rsb =C2=A0 =C2=A0 r1, r1, #0; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r1, [r0]; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 mvn =C2=A0 =C2=A0 r0, #0; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> +- =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 pc, [sp], #4;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0POP_PC;
> + # endif
> + #else
> + # define SYSCALL_ERROR_HANDLER =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Nothing he=
re; code in sysdep.S is used. =C2=A0*/
> --
> 1.6.5.2
>

there is already a define __USE_BX__ and another macro BX(reg)
I think they should be used here instead


>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


