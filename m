Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsMHh-0001Vj-IG
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 22:30:10 +0100
Received: by fxm8 with SMTP id 8so4046834fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=p5SR7laONmtY/qty9RONdlDcgDmhc200d3AAJ1g4r+k=;
	b=ZQM3yw8e9FvAh/uQqxM6EG58esmrIUFW5pHznj9P4rvhFfNQq1fHjf61DJ8xTNgkhP
	SYJOO2LnNpuXj2jUDgwPGPvZP7u769vpDbKQJKphPWG86YolUotsmRwYcwwk1d/wkL+q
	r9XLjNpQI708HIq4fPER5ceZi6AvumefjUFko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=eOECOc2wOSbjbAmUqloufzlZ5ed9kUINH3wjttJR5yr76sn551t4Ke6ESkBWawknZy
	mHIl43J4zQtvXpbUcCeukG+nzG2TcWmMTTE9J6wIOtXMo3lujjRDjRCWY7s8VDRh1/Lc
	3Ernxpvx2y3bmEW7abNmYrX411f37uQx+olqg=
Received: by 10.223.71.199 with SMTP id i7mr6440faj.57.1298496240382; Wed, 23
	Feb 2011 13:24:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 13:20:36 -0800 (PST)
In-Reply-To: <1298492246-18066-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1298492246-18066-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 13:20:36 -0800
Message-ID: <AANLkTinynUv=Lm45maSHB9kyTDnrqCJV+MS_yNtjiCge@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc 4.1.2: fix dependency_libs for libstdc++ and libsupc++
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
X-List-Received-Date: Wed, 23 Feb 2011 21:30:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 12:17 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> This fixes a QA issue in gcc 4.1.2.
> The patch is identical to what is done in gcc 4.2.2 and 4.2.4
> The issues caused neek compilations to fail
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Looks ok can you look at

commit 457d5b9818e21492a1425d8b6811cf57702394eb
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Jun 6 10:40:01 2010 -0700

    gcc-4.2.4: Fix libstdc++ build failures with new sysrooted staging.

    * New sysrooted staging exposed few problems in GCC configury
      which were latent previously.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>

and do those changes for 4.1.x

> ---
>
> NOTE: gcc 4.1.0 4.1.1 4.2.1 4.2.3 are also missing this patch.
> Can't easily test those now so not submitting a patch for these.
> and maybe the patch is also needed for gcc 4.0.*
> No idea about gcc3.
>
> =C2=A0recipes/gcc/gcc-4.1.2.inc | =C2=A0 15 ++++++++++++++-
> =C2=A01 files changed, 14 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
> index 36b45db..9df67e2 100644
> --- a/recipes/gcc/gcc-4.1.2.inc
> +++ b/recipes/gcc/gcc-4.1.2.inc
> @@ -5,7 +5,7 @@ NATIVEDEPS =3D "mpfr-native gmp-native"
>
> =C2=A0COMPATIBLE_TARGET_SYS =3D "."
>
> -INC_PR =3D "r27"
> +INC_PR =3D "r28"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> @@ -60,6 +60,19 @@ do_compile_prepend_avr32() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${S}/libstdc++-v3/config/os/uclibc/ ${S=
}/libstdc++-v3/config/os/uclibc-linux
> =C2=A0}
>
> +# with sysroot this change is not needed for gcc 4.3+ but its needed
> +# for older compilers because of bug in libtool as well as this PR
> +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D5291
> +# we append the .la munging specially for libstdc++ and libsupc++ here
> +# This change if needed for other compilers in use should be put
> +# in there specific inc file.
> +
> +do_install_append () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for d in ${target_libdir} ${target_libdir}/n=
of; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "s|depend=
ency_libs\s*=3D\s*.*|dependency_libs=3D'-lm '|" ${D}$d/libsupc++.la || true
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "s|depend=
ency_libs\s*=3D\s*.*|dependency_libs=3D'-lm '|" ${D}$d/libstdc++.la || true
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> +}
>
> =C2=A0# Language Overrides
> =C2=A0FORTRAN =3D ""
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


