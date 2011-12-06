Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXzbq-0007k7-Bu
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 19:19:18 +0100
Received: by lahd3 with SMTP id d3so473871lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ZjCmDgeq/Y4VxjZcrpZCooPInbBKjQp2c658jb62NF8=;
	b=xpWYhXgPYfemHNCgOdGs5AEcLL2dMr+j/Db1tvoGL4rsCOLVjweITH7cF3QJvjP3eX
	o5PHqc/qyUAwwsgzURWdtFeuxlqmzxdl/qaXCsneePXtQ9tE5UX3oqb3ZSH2PYMDnvpM
	spOLJsKv6G6UDAYDd8JaC0cchnaO6GzzsZoG8=
Received: by 10.152.122.34 with SMTP id lp2mr9763588lab.20.1323195146474; Tue,
	06 Dec 2011 10:12:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 6 Dec 2011 10:11:54 -0800 (PST)
In-Reply-To: <1323149076-10389-1-git-send-email-raj.khem@gmail.com>
References: <1323149076-10389-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Dec 2011 10:11:54 -0800
Message-ID: <CAMKF1sqVKMS-Cb=Oo3YiVNSqnqaabUZ_fMes1nSF0Hqgz-7G6A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe] 1/2] gcc-4.6: Delete the patch that is now applied in oe-core
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
X-List-Received-Date: Tue, 06 Dec 2011 18:19:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Koen

The corresponding patch to oe-core is now applied. Now you can apply
this to meta-oe
otherwise people may start seeing conflicts.

Thanks
-Khem

On Mon, Dec 5, 2011 at 9:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch =C2=A0 =C2=A0| =C2=
=A0 34 --------------------
> =C2=A0.../gcc/gcc-4_6-branch-linaro-backports.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
> =C2=A02 files changed, 0 insertions(+), 35 deletions(-)
> =C2=A0delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-=
4.6-linaro-r106793.patch
>
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106793.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106793.patch
> deleted file mode 100644
> index 04dabaf..0000000
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.=
patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -2011-08-18 =C2=A0Richard Sandiford =C2=A0<richard.sandiford@linaro.org>
> -
> - =C2=A0 =C2=A0 =C2=A0 gcc/
> - =C2=A0 =C2=A0 =C2=A0 Backport from mainline:
> -
> - =C2=A0 =C2=A0 =C2=A0 2011-08-18 =C2=A0Richard Sandiford =C2=A0<richard.=
sandiford@linaro.org>
> -
> - =C2=A0 =C2=A0 =C2=A0 * config/arm/arm.c (arm_rtx_costs_1): Don't modify=
 the costs of SET.
> - =C2=A0 =C2=A0 =C2=A0 (arm_size_rtx_costs): Likewise.
> -
> -=3D=3D=3D modified file 'gcc/config/arm/arm.c'
> ---- old/gcc/config/arm/arm.c =C2=A0 2011-08-12 08:08:31 +0000
> -+++ new/gcc/config/arm/arm.c =C2=A0 2011-08-18 13:53:37 +0000
> -@@ -7464,6 +7464,9 @@
> - =C2=A0 =C2=A0 =C2=A0 *total =3D COSTS_N_INSNS (4);
> - =C2=A0 =C2=A0 =C2=A0 return true;
> -
> -+ =C2=A0 =C2=A0case SET:
> -+ =C2=A0 =C2=A0 =C2=A0return false;
> -+
> - =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 *total =3D COSTS_N_INSNS (4);
> - =C2=A0 =C2=A0 =C2=A0 return false;
> -@@ -7811,6 +7814,9 @@
> - =C2=A0 =C2=A0 =C2=A0 *total =3D COSTS_N_INSNS (1) + 1;
> - =C2=A0 =C2=A0 =C2=A0 return true;
> -
> -+ =C2=A0 =C2=A0case SET:
> -+ =C2=A0 =C2=A0 =C2=A0return false;
> -+
> - =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 if (mode !=3D VOIDmode)
> - =C2=A0 =C2=A0 =C2=A0 *total =3D COSTS_N_INSNS (ARM_NUM_REGS (mode));
> -
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports=
.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> index fcdccf5..882876e 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> @@ -39,7 +39,6 @@ file://linaro/gcc-4.6-linaro-r106786.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106787.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106789.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106792.patch \
> -file://linaro/gcc-4.6-linaro-r106793.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106794.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106796.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106797.patch \
> --
> 1.7.5.4
>


