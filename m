Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P93LD-0005FE-12
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 00:10:32 +0200
Received: by yxe42 with SMTP id 42so93737yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=J2egHpcK67E7ztmCq5bvyFt2IN1/4xmxNp2/plOuaCo=;
	b=N2FczilAOVS4SATL0N4w4C+scRrhxYULJL7ot/325/E1i2YvD1YSXhg38M+kErTjAd
	LjuZjnYtGh0hsi2e0Xkdo2A2NFMl5fGpCjBUMgKD72uMlum7UBD5xIC3hle7LHHXeGZX
	XkKeY3Mdw5ikir98SsNYE5gFjHXfOTr/MXYKM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AIVDRcQze7upezHnnylfI+dG63XppizHT06TMtPohHkzAxHtkevcRuwXuShoha4Qy/
	npyBDD/I9uKXOBJQ25EgNla3Fqcm7qhKyhZ8rOiVUyJxyYHcWkfxdtx1eAfS4Jhvl8GR
	AUwWVuo1e30RJ7KdhhAlyiE80RcJPcwY5Yqqc=
Received: by 10.90.116.9 with SMTP id o9mr1741246agc.6.1287698992522; Thu, 21
	Oct 2010 15:09:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Thu, 21 Oct 2010 15:09:31 -0700 (PDT)
In-Reply-To: <1287696121-28307-2-git-send-email-msmith@cbnco.com>
References: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
	<1287696121-28307-2-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Oct 2010 15:09:31 -0700
Message-ID: <AANLkTinOB1TNQ4p384Yaov7bixr3-zNa_r6Q4hOS=ryY@mail.gmail.com>
To: Michael Smith <msmith@cbnco.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc 4.3.4: backport -print-sysroot for libtool
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
X-List-Received-Date: Thu, 21 Oct 2010 22:10:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 2:22 PM, Michael Smith <msmith@cbnco.com> wrote:
> libtoolized configure scripts need this in order to autodetect sysroot
> path when --with-sysroot is passed.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Khem Raj <raj.khem@gmail.com>

looks ok thanks for doing it.

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0recipes/gcc/gcc-4.3.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A0.../gcc-4.3-backport-print-sysroot.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A02 files changed, 2 insertions(+), 1 deletions(-)
> =C2=A0copy recipes/gcc/{gcc-4.3.3 =3D> gcc-4.3.4}/gcc-4.3-backport-print-=
sysroot.patch (100%)
>
> diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
> index 5aef5e5..3f3809c 100644
> --- a/recipes/gcc/gcc-4.3.4.inc
> +++ b/recipes/gcc/gcc-4.3.4.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> @@ -62,6 +62,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-4.3.x-fix-EXTRA_BUILD.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-flags-for-build.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.in.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3-backport-print-sysroot.patch \
> =C2=A0"
>
> =C2=A0SRC_URI_append_sh3 =C2=A0=3D " file://sh3-installfix-fixheaders.pat=
ch "
> diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch b=
/recipes/gcc/gcc-4.3.4/gcc-4.3-backport-print-sysroot.patch
> similarity index 100%
> copy from recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
> copy to recipes/gcc/gcc-4.3.4/gcc-4.3-backport-print-sysroot.patch
> --
> 1.7.0.4
>
>


