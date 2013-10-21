Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 67C676CF28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:52:50 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id u16so107608iet.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OxFmQhCrtCHr9e4a6ZREWKTo4og9TD1/gfGN/3BUe9U=;
	b=DU3x7AL2mHzbb11+zOHSuDWIdoPAn5B4IO78t+dPjyKnl2N4pbL6L43mD6rc06yOzY
	ETV+5KsqF7nqHNZXobpb+QxRD2PSaI+sRwaH/sM2784rsSbGVpkVp++CQvwmuC+27ept
	8hTYk7amuPhI4zkoJA01g4L0MSnvd04Rl1pJLse9yYW5ADHmvnxzm/wM7KDfvlSYv5g1
	FJ/IJm7niKHV5eHPc2POsgGln/87/+j5lXQNqKmwR6ylQ86+KGdU62FwbYy9qhvlHteh
	nELQx48wfQ3+WHZFSvDmQdA+YzU35N9QnkaJFaPMZDqqqCrFuXO6TzVHJoRnMVkKzk0+
	zRpw==
X-Received: by 10.42.121.132 with SMTP id j4mr81572icr.42.1382388771495; Mon,
	21 Oct 2013 13:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 13:52:21 -0700 (PDT)
In-Reply-To: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
References: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2013 13:52:21 -0700
Message-ID: <CAMKF1srdJWQrLLDB6FYERFQeRTjKu0bs5q0nOSRUq1w8BE7u0Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/2] llvm3.2: drop this version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 20:52:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 20, 2013 at 5:53 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * 3.3 is used by default mesa config, 2.8 is used in meta-java, keep 2.9 as last in 2*

who is using 2.9 ? I would suggest to keep the one we know is used.

>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch | 14 --------------
>  meta-oe/recipes-core/llvm/llvm3.2_3.2.bb                |  9 ---------
>  2 files changed, 23 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
>  delete mode 100644 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
>
> diff --git a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
> deleted file mode 100644
> index c3ae494..0000000
> --- a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Index: llvm-2.9/include/llvm/Support/FEnv.h
> -===================================================================
> ---- llvm-2.9.orig/include/llvm/Support/FEnv.h  2010-11-29 20:44:50.000000000 +0100
> -+++ llvm-2.9/include/llvm/Support/FEnv.h       2011-11-18 18:42:22.580161297 +0100
> -@@ -17,6 +17,9 @@
> -
> - #include "llvm/Config/config.h"
> - #include <cerrno>
> -+
> -+#undef HAVE_FENV_H
> -+
> - #ifdef HAVE_FENV_H
> - #include <fenv.h>
> - #endif
> diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
> deleted file mode 100644
> index 48e27b9..0000000
> --- a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require llvm.inc
> -require llvm3.inc
> -
> -# 3.2 is different then 2.8, 2.9 and 3.3
> -LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
> -
> -SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
> -SRC_URI[md5sum] = "71610289bbc819e3e15fdd562809a2d7"
> -SRC_URI[sha256sum] = "125090c4d26740f1d5e9838477c931ed7d9ad70d599ba265f46f3a42cb066343"
> --
> 1.8.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

