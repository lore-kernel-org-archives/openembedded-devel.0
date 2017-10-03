Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE0E71993
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:28:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m28so9957151pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/bn+q87WK7oqMIyDkWq3ji89uSSC9euEvdCGunI515w=;
	b=CpzANkYaFm8WMTgaf//KlyUymDWdctGg79F2zcvtCX9aItlHplrOlP69QmjNRUD2Gu
	4Y1aQuq1GD2iXpSkOqJoYclyjwoxN1judA0YloWcfsrgInG2LI66doty6qg79Fu+jbWp
	/+CGk8cpHkTltIQ5vkiwZ3cpkCh+SVR5JE+DuPqrsm+8gXeUPKa4cZ9KmFP5yd4tWXpm
	shuXOTK4/3/FjuYjHCGsxfHEN/Me34HJFwdgF6bH7EEBEg2jy1FbVMk4NdWEL+iYqHab
	QxhEfD0gbBFUEMud5uSf8g3ezob7Mi18ykHqNJlXg62ClHH7y9IMjo0sOMPau8L5wGx+
	wbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/bn+q87WK7oqMIyDkWq3ji89uSSC9euEvdCGunI515w=;
	b=ja/k069apr+X45FL/rF+WuCxJ4prFlkJ0D+LxqphlDYbkMZ7SUASTXXitJXLzx86U2
	q+IV+TnEJ79Y/wdGHBVjwbO3PFgY14QowUMh+4XrtmFuyGlTFJk6tZPIVnPaYfa1sG9C
	D+AuS5mRXdST+NXklxHlaQY/+MefsEGmtwOZDHjiAWC5IJulr52r+yU5vD3ij/cPbZBR
	NfzeRZIyXg/LWjTrFjUhMQHFPJFWFLMGQqFk97j6h1NKKX/qP7+D+GkrRZPo0fUaJuKH
	zK8sep7M/yEsahmVgCUqmLNy5Feg0DIiLnryoW1mIKPBy2Z/55XnKB7xil29NFwfic1O
	O/1A==
X-Gm-Message-State: AHPjjUjZbDFLEnUNA2ZKJyOcCHZVA7IAjEbSJwf9Nc5SmoMvFQ0G7nFz
	vxXT6Z46Tvc7BEvdf0JYNVkNS2h53LU2acsSxGo=
X-Google-Smtp-Source: AOwi7QAwMqP44zPnuuXmNSHB0v4e809lbPTLWQzK55DL0BvXj39j//DYGsOEVndMAhf2RZayF7CRbq2yxIvoaEpmANo=
X-Received: by 10.84.138.1 with SMTP id 1mr17981729plo.404.1507058927374; Tue,
	03 Oct 2017 12:28:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Tue, 3 Oct 2017 12:28:16 -0700 (PDT)
In-Reply-To: <20171002160657.39576-1-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Oct 2017 12:28:16 -0700
Message-ID: <CAMKF1srzEnWyL54RvOQT5rQ8B=rYa_43E4Exvg8Ct3wxLx6Z7Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [meta-initramfs][PATCH 1/5] klibc: Pass Optimization with KLIBCOPTFLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 19:28:47 -0000
Content-Type: text/plain; charset="UTF-8"

Martin

This is missing in master-next

On Mon, Oct 2, 2017 at 9:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Overriding KLIBCOPTFLAGS also meant that -Ox flags
> were taken off. Which results in errors like
>
> | usr/dash/shell.h: In function 'max_int_length':
> | usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible with floating-point code
> |   return (bytes * 8 - 1) * 0.30102999566398119521 + 14;
> |          ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> | usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible with floating-point argument
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...arm-Do-not-set-a-fallback-march-and-mtune.patch | 33 ++++++++++++++++++++++
>  meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 ++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> new file mode 100644
> index 000000000..9c0ea6397
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> @@ -0,0 +1,33 @@
> +From a46a144ac883898d9cedf7a0b13aec6d10116125 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 29 Sep 2017 23:11:53 -0700
> +Subject: [PATCH] arm: Do not set a fallback march and mtune
> +
> +In OE we pass the options explicitly, there is
> +no need to set it inside the makefiles, we will
> +need to compute values for CPU_ARCH and CPU_TUNE
> +which is a bit harder in OE
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + usr/klibc/arch/arm/MCONFIG | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
> +index 53bc1dc3..857e2f2d 100644
> +--- a/usr/klibc/arch/arm/MCONFIG
> ++++ b/usr/klibc/arch/arm/MCONFIG
> +@@ -10,7 +10,7 @@
> + CPU_ARCH ?= armv4
> + CPU_TUNE ?= strongarm
> +
> +-KLIBCOPTFLAGS += -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
> ++KLIBCOPTFLAGS += -Os
> + KLIBCBITSIZE  = 32
> + KLIBCREQFLAGS += -fno-exceptions
> + KLIBCSTRIPFLAGS += -R .ARM.exidx
> +--
> +2.14.2
> +
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index dec3d3704..30294b19a 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
>             file://0001-always-use-bfd-linker.patch \
>             file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
>             file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
> +           file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
>  "
>
>  ARMPATCHES ?= ""
> @@ -40,7 +41,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                  'INSTALLDIR=${libdir}/klibc' \
>                  'SHLIBDIR=${libdir}' \
>                  '${KLIBCTHUMB}' \
> -                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
> +                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
> +                 V=1 \
>                  "
>
>  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> --
> 2.14.2
>

