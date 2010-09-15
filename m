Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvwCj-0000kx-Mx
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:55:35 +0200
Received: by iwn2 with SMTP id 2so303940iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MGhu7J5r513CMxNrHTTr06tni7BCmG/M9cVugoh3tpU=;
	b=UEHR6kVPuu95wdXTu/2ET293+JH/08Cp7sknlQI+9zF555H5iCTHeYsxq852RMiuIn
	2WR2T2DQtK9PcHKZlQqaINlS3iI/7eFZJOnvJ8cEa60yhSm6B5hglGIcNhlV+3NqG8GQ
	faOuw8oHmv0dbInelnkBwdP5SC2sjkK7vb3Zc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UgVD2bgunx2tBDLDL5F4EZ2NL8XhEpF+NUExaj+1Sb+dbr34pjAENYA/19coihg6WE
	jq18yN29RUooHbRGr4HGbb18fpw2p8Up9b2lA/W3ai7dRqOcbPkSOWHJGoZI6OVu9GI9
	grD+FT+w1AdAZrxIaQU6ww1bK4Cy/how251ys=
Received: by 10.231.33.203 with SMTP id i11mr1899785ibd.8.1284573283414; Wed,
	15 Sep 2010 10:54:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 10:54:23 -0700 (PDT)
In-Reply-To: <AANLkTikv=KA8R9FLpwyig+W9K-dAaSSN0Fw36dRQz7Rs@mail.gmail.com>
References: <AANLkTikv=KA8R9FLpwyig+W9K-dAaSSN0Fw36dRQz7Rs@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 10:54:23 -0700
Message-ID: <AANLkTikaNwhtOdmJr1UdD-XwiWPK6BiONnbF2kr_hfRJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sh: provide patch of __set_fpscr in libc
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
X-List-Received-Date: Wed, 15 Sep 2010 17:55:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nobuhiro-san

Same as you previous patch.
 revise the patch and add increment PR for the recipes you modified
and also rebase it
on latest master.

Thanks

-Khem

On Tue, Sep 14, 2010 at 12:46 AM, Nobuhiro Iwamatsu
<nobuhiro.iwamatsu.yj@renesas.com> wrote:
> This provides a patch maintaining __fpscr_values in libc.
> This patch is taken in in Debian and codesourcery.
>
> This patch is necessary to have compatibility in these and openemdedded.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---
> =C2=A0recipes/eglibc/eglibc_2.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.11.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.12.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/eglibc_2.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0recipes/eglibc/files/sh4_local-fpscr_values.patch | =C2=A0 32 +++++=
++++++++++++++++
> =C2=A05 files changed, 36 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/eglibc/files/sh4_local-fpscr_values.patc=
h
>
> diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.b=
b
> index 1f7ec02..0b457e1 100644
> --- a/recipes/eglibc/eglibc_2.10.bb
> +++ b/recipes/eglibc/eglibc_2.10.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_set_fpscr.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_local-fpscr_values.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.b=
b
> index c65bf22..1950d88 100644
> --- a/recipes/eglibc/eglibc_2.11.bb
> +++ b/recipes/eglibc/eglibc_2.11.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_set_fpscr.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_local-fpscr_values.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.b=
b
> index 8dbcde0..a76d630 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_set_fpscr_2.12.patch =
\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_local-fpscr_values.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index 5df7eb8..3c0d1e1 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_set_fpscr.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4_local-fpscr_values.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/files/sh4_local-fpscr_values.patch
> b/recipes/eglibc/files/sh4_local-fpscr_values.patch
> new file mode 100644
> index 0000000..1685f6f
> --- /dev/null
> +++ b/recipes/eglibc/files/sh4_local-fpscr_values.patch
> @@ -0,0 +1,32 @@
> +---
> + sysdeps/unix/sysv/linux/sh/Versions | =C2=A0 =C2=A01 +
> + sysdeps/unix/sysv/linux/sh/sysdep.S | =C2=A0 11 +++++++++++
> + 2 files changed, 12 insertions(+)
> +
> +--- a/sysdeps/unix/sysv/linux/sh/Versions
> ++++ b/sysdeps/unix/sysv/linux/sh/Versions
> +@@ -2,6 +2,7 @@
> + =C2=A0 GLIBC_2.2 {
> + =C2=A0 =C2=A0 # functions used in other libraries
> + =C2=A0 =C2=A0 __xstat64; __fxstat64; __lxstat64;
> ++ =C2=A0 =C2=A0__fpscr_values;
> +
> + =C2=A0 =C2=A0 # a*
> + =C2=A0 =C2=A0 alphasort64;
> +--- a/sysdeps/unix/sysv/linux/sh/sysdep.S
> ++++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
> +@@ -32,3 +32,14 @@
> +
> + #define __syscall_error __syscall_error_1
> + #include <sysdeps/unix/sh/sysdep.S>
> ++
> ++ =C2=A0 =C2=A0 =C2=A0 .data
> ++ =C2=A0 =C2=A0 =C2=A0 .align 3
> ++ =C2=A0 =C2=A0 =C2=A0 .globl ___fpscr_values
> ++ =C2=A0 =C2=A0 =C2=A0 .type ___fpscr_values, @object
> ++ =C2=A0 =C2=A0 =C2=A0 .size ___fpscr_values, 8
> ++___fpscr_values:
> ++ =C2=A0 =C2=A0 =C2=A0 .long 0
> ++ =C2=A0 =C2=A0 =C2=A0 .long 0x80000
> ++weak_alias (___fpscr_values, __fpscr_values)
> ++
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


