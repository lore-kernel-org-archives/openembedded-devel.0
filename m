Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuvP1-0007tf-Np
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 00:24:19 +0100
Received: by fxm8 with SMTP id 8so576671fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=7/D5tZ9MW9iZHotK+rQqlkRHa716V3SxB8DaK9RIuZ8=;
	b=nxNlnk950CvzZrhCrKDwykLd9FxeQhKNjgjELs+Ttqv1XNJDTHPmXMPpk19sujaboB
	vmpZ0qIz1+K+tEXcnf6Fyo3iCUmARJOPW9U6ch5w/27wFVoagpk0bSIJFrc282UJuuSG
	X1fmmOm+I/h6laT86r5/D+ARW3OgfbCRBWZJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AAsAYuCxFYqxsMAgVqwnGGqcSXtodVimlrIfrSTwtxzsp1tRUi1bJltsKYYfJsWZDp
	2hc80FNuJq8rxvl9xCHmbWA/+zMejb0T/XSyfAQhPU7m6CuTFAXXwMzd97lp+0skNJ7N
	AveHk2lYdRDK4yXiWdthFkj5YUDIUrhZeWZvQ=
Received: by 10.223.114.203 with SMTP id f11mr648645faq.20.1299108172220; Wed,
	02 Mar 2011 15:22:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 15:22:32 -0800 (PST)
In-Reply-To: <1299095753-324-1-git-send-email-Martin.Jansa@gmail.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<1299095753-324-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 15:22:32 -0800
Message-ID: <AANLkTinW7Q3zhKAHxF6_zBQB8oQOz-kY-qh+WSADp+my@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2] sane-toolchain-*: define DEBUG_FLAGS and add it to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Wed, 02 Mar 2011 23:24:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2011 at 11:55 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A05 +++--
> =C2=A0conf/distro/include/sane-toolchain-eglibc.inc =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 12 ++++++------
> =C2=A0conf/distro/include/sane-toolchain-glibc.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 10 +++++-----
> =C2=A0conf/distro/include/sane-toolchain-uclibc.inc =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A06 +++---
> =C2=A0.../include/sane-toolchain-uclinux-uclibc.inc =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-
> =C2=A05 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 0c11cdb..f23dd05 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -543,10 +543,11 @@ EXTRA_OEMAKE_prepend_task-compile =3D "${PARALLEL_M=
AKE} "
> =C2=A0# Optimization flags.
> =C2=A0##################################################################
>
> +DEBUG_FLAGS =3D "-g"
> =C2=A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-point=
er -frename-registers -O2"
> -DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
> +DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}"
> =C2=A0SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION', =
'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d, 1=
)}"
> -BUILD_OPTIMIZATION =3D "-O2 -g"
> +BUILD_OPTIMIZATION =3D "-O2 ${DEBUG_FLAGS}"
>
> =C2=A0##################################################################
> =C2=A0# Bootstrap stuff.
> diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/=
include/sane-toolchain-eglibc.inc
> index daab0f8..d38ca5d 100644
> --- a/conf/distro/include/sane-toolchain-eglibc.inc
> +++ b/conf/distro/include/sane-toolchain-eglibc.inc
> @@ -3,20 +3,20 @@
> =C2=A0# eglibc:
> =C2=A0# [23:00] oxo: glibc (any version) on sparc does not like (repeat m=
e) "-Os"
>
> -FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os"
> -FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O1"
> -FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2"
> +FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O1 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2 ${DEBUG_FLAGS}"
>
> =C2=A0# gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -=
Os
> -FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2"
> +FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2 ${DEBUG_FLAGS}"
>
> =C2=A0# JaMa: I promise to report bug upstream, but as it can take a whil=
e to fix it, I'll switch to -O2 here
> =C2=A0# Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it =
fails with -Os, with gcc-4.3.3 it works OK with -Os
> =C2=A0# Here is testcase, but you have to rebuild whole libqtxml to test =
it
> =C2=A0# http://lists.shr-project.org/pipermail/shr-devel/2010-February/00=
2169.html
> -FULL_OPTIMIZATION_pn-qt4-x11-free =3D "-fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-qt4-x11-free =3D "-fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
> =C2=A0# This I've seen only on armv4t, it segfaults when called from pisi=
, but whole test unit suite can pass
> -FULL_OPTIMIZATION_pn-libsyncml =3D "-fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-libsyncml =3D "-fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
> =C2=A0BUILD_OPTIMIZATION_pn-perl =3D "-O1"
> =C2=A0BUILD_OPTIMIZATION_sparc =3D "-O2"
> diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/i=
nclude/sane-toolchain-glibc.inc
> index 770aa87..29c201b 100644
> --- a/conf/distro/include/sane-toolchain-glibc.inc
> +++ b/conf/distro/include/sane-toolchain-glibc.inc
> @@ -7,14 +7,14 @@
> =C2=A0# perl has some problems, see http://bugs.openembedded.net/show_bug=
.cgi?id=3D1616
> =C2=A0# [23:00] oxo: glibc (any version) on sparc does not like (repeat m=
e) "-Os"
>
> -FULL_OPTIMIZATION =3D "-fexpensive-optimizations -frename-registers -fom=
it-frame-pointer -O2"
> +FULL_OPTIMIZATION =3D "-fexpensive-optimizations -frename-registers -fom=
it-frame-pointer -O2 ${DEBUG_FLAGS}"
>
> -FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O1"
> -FULL_OPTIMIZATION_pn-glibc =3D "-fexpensive-optimizations -fomit-frame-p=
ointer -O2"
> -FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O1 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_pn-glibc =3D "-fexpensive-optimizations -fomit-frame-p=
ointer -O2 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2 ${DEBUG_FLAGS}"
>
> =C2=A0# gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -=
Os
> -FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2"
> +FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2 ${DEBUG_FLAGS}"
>
> =C2=A0BUILD_OPTIMIZATION_pn-perl =3D "-O1"
> =C2=A0BUILD_OPTIMIZATION_pn-glibc =3D "-O2"
> diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/=
include/sane-toolchain-uclibc.inc
> index b61ee36..b51cdaf 100644
> --- a/conf/distro/include/sane-toolchain-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclibc.inc
> @@ -23,12 +23,12 @@ PREFERRED_VERSION_uclibc-cross-intermediate ?=3D "${P=
REFERRED_UCLIBC_VERSION}"
>
> =C2=A0#mess with compiler flags to use -Os instead of -O2
> =C2=A0#Please see http://free-electrons.com/doc/embedded_linux_optimizati=
ons/img47.html for some more info
> -FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -pipe"
> +FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -pipe ${DEBUG_FLAGS}"
> =C2=A0BUILD_OPTIMIZATION +=3D "-pipe"
>
> =C2=A0# -Os compiled root file system does not boot for powerpc, root cau=
se it still at large
> =C2=A0# we use -O2 meanwhile
> -FULL_OPTIMIZATION_powerpc =3D "-O2 -pipe"
> +FULL_OPTIMIZATION_powerpc =3D "-O2 -pipe ${DEBUG_FLAGS}"
>
> =C2=A0#Gcc will die with 'internal consistency error when using the above=
 optimizations
> =C2=A0#with gcc-4.2.1-atmel.1.0.3 (and probably most other avr32 gcc port=
s).
> @@ -38,7 +38,7 @@ FULL_OPTIMIZATION_powerpc =3D "-O2 -pipe"
> =C2=A0#it was removed while debugging an issue that ultimately turned out=
 to be due
> =C2=A0#to the ICE fixed by gcc-pr32889.patch. =C2=A0It needs to be tested=
 again.
> =C2=A0#Note that this testing was done without the gcc-pr32889.patch.
> -FULL_OPTIMIZATION_avr32 =3D "-Os -fomit-frame-pointer"
> +FULL_OPTIMIZATION_avr32 =3D "-Os -fomit-frame-pointer ${DEBUG_FLAGS}"
>
> =C2=A0TARGET_LINK_HASH_STYLE =3D "${@['-Wl,--hash-style=3Dgnu',''][bb.dat=
a.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'av=
r32']]}"
>
> diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf=
/distro/include/sane-toolchain-uclinux-uclibc.inc
> index a1e7df0..8ebaf15 100644
> --- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> @@ -9,7 +9,7 @@ USE_NLS_gcc-cross =3D "no"
>
> =C2=A0#mess with compiler flags to use -Os instead of -O2
> =C2=A0#Please see http://free-electrons.com/doc/embedded_linux_optimizati=
ons/img47.html for some more info
> -FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -pipe"
> +FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -pipe ${DEBUG_FLAGS}"
> =C2=A0BUILD_OPTIMIZATION =3D "-Os"
>
> =C2=A0#Gcc will die with 'internal consistency error when using the above=
 optimizations
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


