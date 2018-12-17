Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id B682C7BFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 19:23:17 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id n21so15416001qtl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fp9a/cV8DzP+AZWZghjJnG5AeflgMRwCNTJZ6rOonHQ=;
	b=PaAbUEFLBjUROngwMwVplQZhpcYcEnG1VzFrpfCT73TL55hTPdaWQTasn7XzqmuVbN
	5aqOdnURFne34c+Sl8ApXbv8eqku/ZThQqWjpdl+baTi6yKn0AAF+NF0BhlqKjXj3Vyx
	p1+++ckHhaBA1VXdMrnh/wLD9kqjMYNXPAHMCaK00g6SSfQn3myfZkBSgUArmBYuCeyA
	GK224rYRLwZ11dC0Jxw2p/eLLCiEU3Z+MjEyCxIwx0qDcXpF4L4xDyLsU9dIry25FzLS
	j27+C4CXaQHQssyfl18CQ7XLv+1CI2zNaE88sp30EczResGB21UZxXDQTExJQE5mgIiD
	oW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fp9a/cV8DzP+AZWZghjJnG5AeflgMRwCNTJZ6rOonHQ=;
	b=faooR2eENRm0ploTQBD1NtABwy6FIqOZWcw2ZuP5bxHQAaL5btiWYu0KWJVbvAR5Jr
	PLjGtwgnDtQcnrEaUOkJjQMwdZe040QWiLILdp1f+dQOjrT+waNdTfAwYBvwFKWgngdW
	fNaL5DoJOTqDuCO9KY5G2N+nFHhpd16gIZ7t/7fE4VjFva4kaZR5mPG9QUeuEp/oBuQV
	6Zyl0n7UhCkmnjrhu9TAvH0Wd4Aow20a1QkEnWoOwJ8RIvLTmOEBdWSX8/StVuVxKs19
	HIKRD/++o/mHD/T06iyo6VdoeGSfyN7s/kB6ElH5hpVX3WJNtCv94/AFsbj5OR53T0ij
	UCxA==
X-Gm-Message-State: AA+aEWYcG5mo4EiwqTapNkc8G+gIFI+u/iOIFIl1yjnbfENWHcf8/Ah7
	QajNJ8fs9gAmyRIlW0l2povJ8zVvj6Bwx2qYa9I=
X-Google-Smtp-Source: AFSGD/U3Wf2JcuRRP2NmF+jz4bufDl37stLqjl3neerSJpyZnBmKPOeUK1lRmCndH+G/gbFccxkf8WcwuOP7oH01BU0=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr15079053qtk.253.1545074598507;
	Mon, 17 Dec 2018 11:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20181217181528.14898-1-andrea.adami@gmail.com>
In-Reply-To: <20181217181528.14898-1-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Dec 2018 11:22:52 -0800
Message-ID: <CAMKF1srZJvQsjikQ4Euymhh4zcjHHQMtDn+W83HMZS1eYFn5Ag@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc: fix build for mipsel
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
X-List-Received-Date: Mon, 17 Dec 2018 19:23:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 10:15 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Fix:
> printf.c:2:10: fatal error: limits.h: No such file or directory
> |  #include <limits.h>
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> index e7553244d..872d79b93 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> @@ -66,6 +66,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
>  CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
>  CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
>  CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> +CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
>  CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"

I wonder if we just use use "mipsarch" override here once for all
mips kinds.

>  CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

