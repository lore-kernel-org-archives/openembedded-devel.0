Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (unknown [209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB1B6FB98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 20:36:32 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so2965822igd.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=C55n/AE+ZpacTeabSnp0MTjKrrEmWxTOG8sFKabxEa8=;
	b=P32mKHlYivuCbnBHpJy2x4t3d43oolTl2GaHZQ6NMahh85Le/T+wH0+U+hqcwzH+wv
	S55pltUk0tC+wTzPIdbtS1zlBoYjzLUOY6KE1hXM1yvNDyJpL95iMKG+px46V6jl8GgG
	eaD8TN+FbvnWbayDkSndOOaagr+avBUB8fakbnenmGyMPITUtfueoKQ1Td9+rJYM1z0M
	uyevj2gPEtmMOn1lmLQFcjIMlvOP6LVHrJXkfrih7M9KI1fYeRRZpzDCsQSbSUpAIs1W
	joAosXCSAB6xSmbZbse8okCkyrGUChXmX3g0JDWQIg92tIwiokdQVAVNKMjd7xPcbqor
	zz0w==
X-Received: by 10.50.43.136 with SMTP id w8mr4742401igl.20.1401309393672; Wed,
	28 May 2014 13:36:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 13:36:03 -0700 (PDT)
In-Reply-To: <1401199540-29123-1-git-send-email-ticotimo@gmail.com>
References: <1401199540-29123-1-git-send-email-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 13:36:03 -0700
Message-ID: <CAMKF1sqE4AdE9c-v1Fr+drXcfEdRYxSv_Bm8q7sq=Egx13iaeQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpostproc: fix S!=B failure
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
X-List-Received-Date: Wed, 28 May 2014 20:36:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 7:05 AM, Tim Orling <ticotimo@gmail.com> wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>
> Fixes:
> [...]/libpostproc/0.0.0+gitAUTOINC+3b7053f46d-r1/temp/run.do_configure.3652:
> line 109: ./configure: No such file or directory

change
    ./configure ${EXTRA_OECONF}

to

    ${S}/configure ${EXTRA_OECONF}

does that help ?

>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> index 148d169..6abb268 100644
> --- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> +++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://git.videolan.org/libpostproc.git"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools lib_package pkgconfig
> +inherit autotools-brokensep lib_package pkgconfig
>
>  FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
>  BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

