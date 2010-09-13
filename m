Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvDeB-00079C-46
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 20:20:57 +0200
Received: by pzk37 with SMTP id 37so1854308pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=dXl0kJoTeIx+JdCVu9HpnuDPQ6AIOAXih0qhua1y76s=;
	b=up9wCzTGpQJV/AAnXa7twGN1uReMOE+IWCKjMA+mRaAOwQYUsgu/XzCQmRMOSYDi6E
	K6vNUt43nV8PQKTZ2O9JUk8NYehCjrpf7mD0vjKd2yqQ+V4B42b5TDTKILStKkQftQF9
	QHTgZkXGwZINk0pMFoDSh3/ZYZDx1z4Kx8VM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=GUz1qIvIJ8DbbUNp9yF9W3M2sTrtCoWDmMvrN784lNxQ6Qkhe9L52905mQnB0H7PO6
	jHe8tBWKscA/7DeQl5s9d6TaHz4W3HuoxhtlXMh6xPoK3DYKJJ3n/v47fJ03Rmf7weRZ
	RZ0KMycxQg+8z/ss29CBVZrTBZTgisSAEmFco=
Received: by 10.114.26.6 with SMTP id 6mr139981waz.82.1284401605679; Mon, 13
	Sep 2010 11:13:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 13 Sep 2010 11:13:05 -0700 (PDT)
In-Reply-To: <1284366229-69234-1-git-send-email-koen@openembedded.org>
References: <1284366229-69234-1-git-send-email-koen@openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Sep 2010 11:13:05 -0700
Message-ID: <AANLkTimEa1MYU45ezXoDL4sPfD6yexOyYFDm1pcez1SK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>
Subject: Re: [PATCH] gcc-package-cross.inc: install shlibs lists into target dir instead of host dir
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
X-List-Received-Date: Mon, 13 Sep 2010 18:20:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

you have my ack to revert
d2a283ad002660e46b2f8d40a8ddfabad457d8a4 as well in that case this
patch may not be needed

Thanks
-Khem

On Mon, Sep 13, 2010 at 1:23 AM, Koen Kooi <koen.kooi@gmail.com> wrote:
> From: Koen Kooi <k-kooi@ti.com>
>
> This fixes the "libstdc++ isn't installed into my rootfs anymore" type of=
 problems after a full rebuild of all packages
>
> This bumps PR of gcc to force a rebuild, but that is *NOT* enough to fix =
the packages built before this fix, those still need rebuilding
>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>
> Acked-by: Khem Raj <raj.khem@gmail.com>
> Acked-by: Dallas Foley <dfoley@telus.net>
>
> ---
> =C2=A0recipes/gcc/gcc-3.3.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-3.4.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-3.4.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-3.4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 ++
> =C2=A0recipes/gcc/gcc-4.0.0.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 ++
> =C2=A0recipes/gcc/gcc-4.0.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 ++
> =C2=A0recipes/gcc/gcc-4.1.0.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.1.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.1.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.2.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.2.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.2.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.2.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.3.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.3.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.3.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.3.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.4.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.4.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.4.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A0recipes/gcc/gcc-4.5.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A02 +-
> =C2=A0recipes/gcc/gcc-package-cross.inc | =C2=A0 =C2=A02 ++
> =C2=A022 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/recipes/gcc/gcc-3.3.4.inc b/recipes/gcc/gcc-3.3.4.inc
> index 1185c65..29c1473 100644
> --- a/recipes/gcc/gcc-3.3.4.inc
> +++ b/recipes/gcc/gcc-3.3.4.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/releases/gcc-${PV}/gcc-${PV}.tar.bz2=
;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-gotoff.dpatch;apply=3Dyes;s=
triplevel=3D0 \
> diff --git a/recipes/gcc/gcc-3.4.3.inc b/recipes/gcc/gcc-3.4.3.inc
> index cfee4d1..cf615a1 100644
> --- a/recipes/gcc/gcc-3.4.3.inc
> +++ b/recipes/gcc/gcc-3.4.3.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -INC_PR =3D "r20"
> +INC_PR =3D "r21"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc34-reverse-compare.patch \
> diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
> index 6d4d266..99e680f 100644
> --- a/recipes/gcc/gcc-3.4.4.inc
> +++ b/recipes/gcc/gcc-3.4.4.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -INC_PR =3D "r16"
> +INC_PR =3D "r17"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc34-reverse-compare.patch \
> diff --git a/recipes/gcc/gcc-3.4.6.inc b/recipes/gcc/gcc-3.4.6.inc
> index b6b01e3..5296f26 100644
> --- a/recipes/gcc/gcc-3.4.6.inc
> +++ b/recipes/gcc/gcc-3.4.6.inc
> @@ -1,5 +1,7 @@
> =C2=A0require gcc-common.inc
>
> +INC_PR =3D "r1"
> +
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc34-reverse-compare.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc34-arm-ldm.patch \
> diff --git a/recipes/gcc/gcc-4.0.0.inc b/recipes/gcc/gcc-4.0.0.inc
> index dd48595..d6a7f33 100644
> --- a/recipes/gcc/gcc-4.0.0.inc
> +++ b/recipes/gcc/gcc-4.0.0.inc
> @@ -1,5 +1,7 @@
> =C2=A0require gcc-common.inc
>
> +INC_PR =3D "r1"
> +
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> diff --git a/recipes/gcc/gcc-4.0.2.inc b/recipes/gcc/gcc-4.0.2.inc
> index 16584ec..63f9772 100644
> --- a/recipes/gcc/gcc-4.0.2.inc
> +++ b/recipes/gcc/gcc-4.0.2.inc
> @@ -1,5 +1,7 @@
> =C2=A0require gcc-common.inc
>
> +INC_PR =3D "r1"
> +
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
> index d3c5079..8da06aa 100644
> --- a/recipes/gcc/gcc-4.1.0.inc
> +++ b/recipes/gcc/gcc-4.1.0.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>
> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
> index 88c9d7e..c261138 100644
> --- a/recipes/gcc/gcc-4.1.1.inc
> +++ b/recipes/gcc/gcc-4.1.1.inc
> @@ -3,7 +3,7 @@ require gcc-common.inc
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
> index c102b05..114f053 100644
> --- a/recipes/gcc/gcc-4.1.2.inc
> +++ b/recipes/gcc/gcc-4.1.2.inc
> @@ -5,7 +5,7 @@ NATIVEDEPS =3D "mpfr-native gmp-native"
>
> =C2=A0COMPATIBLE_TARGET_SYS =3D "."
>
> -INC_PR =3D "r24"
> +INC_PR =3D "r25"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
> index fbee758..e5506c7 100644
> --- a/recipes/gcc/gcc-4.2.1.inc
> +++ b/recipes/gcc/gcc-4.2.1.inc
> @@ -3,7 +3,7 @@ require gcc-common.inc
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r22"
> +INC_PR =3D "r23"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
> index 1c7f9d0..a1f9cd3 100644
> --- a/recipes/gcc/gcc-4.2.2.inc
> +++ b/recipes/gcc/gcc-4.2.2.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r18"
> +INC_PR =3D "r19"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
> index 6d29b0e..988740e 100644
> --- a/recipes/gcc/gcc-4.2.3.inc
> +++ b/recipes/gcc/gcc-4.2.3.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r19"
> +INC_PR =3D "r20"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
> index db09c6e..974471e 100644
> --- a/recipes/gcc/gcc-4.2.4.inc
> +++ b/recipes/gcc/gcc-4.2.4.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r13"
> +INC_PR =3D "r14"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
> index 645c14a..7829f23 100644
> --- a/recipes/gcc/gcc-4.3.1.inc
> +++ b/recipes/gcc/gcc-4.3.1.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r23"
> +INC_PR =3D "r24"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
> index 2d3118c..aa9cd48 100644
> --- a/recipes/gcc/gcc-4.3.2.inc
> +++ b/recipes/gcc/gcc-4.3.2.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r13"
> +INC_PR =3D "r14"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 11d09fa..a3392c0 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r16"
> +INC_PR =3D "r17"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
> index b8df9f0..5aef5e5 100644
> --- a/recipes/gcc/gcc-4.3.4.inc
> +++ b/recipes/gcc/gcc-4.3.4.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r11"
> +INC_PR =3D "r12"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
> index 8cfb47f..acb5371 100644
> --- a/recipes/gcc/gcc-4.4.1.inc
> +++ b/recipes/gcc/gcc-4.4.1.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r10"
> +INC_PR =3D "r11"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =
\
> diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
> index 3bb9f53..42e8d54 100644
> --- a/recipes/gcc/gcc-4.4.2.inc
> +++ b/recipes/gcc/gcc-4.4.2.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r4"
> +INC_PR =3D "r5"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =
\
> diff --git a/recipes/gcc/gcc-4.4.4.inc b/recipes/gcc/gcc-4.4.4.inc
> index 51337e1..1bc7c12 100644
> --- a/recipes/gcc/gcc-4.4.4.inc
> +++ b/recipes/gcc/gcc-4.4.4.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r5"
> +INC_PR =3D "r6"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Dg=
cc444tarbz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =
\
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index 08d7058..b7bd87b 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS =3D "mpfr gmp libmpc libelf"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
>
>
> -INC_PR =3D "r8"
> +INC_PR =3D "r9"
>
> =C2=A0SRCREV =3D "163322"
> =C2=A0PV =3D "4.5"
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-=
cross.inc
> index 0c4ea2d..59e7dde 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?=3D ""
> =C2=A0OLD_PACKAGE_STRIP :=3D "${PACKAGE_STRIP}"
> =C2=A0PACKAGE_STRIP =3D "no"
>
> +SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
> +
> =C2=A0PACKAGES =3D "libgcc libssp libstdc++ libg2c libgfortran"
>
> =C2=A0# Called from within gcc-cross, so libdir is set wrong
> --
> 1.6.6.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


