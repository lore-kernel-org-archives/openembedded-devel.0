Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFFF753E2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 06:00:37 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m27-v6so10700173wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Aug 2018 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pnnC2fRazYTOHAvV5xcm+IsYBMe5Xa/Wit9Cp0CTgGA=;
	b=ekCjGnbbPtmc17dXGArKAhvzL6uUyXOwCUe039B4ZJTYkQoFewdz1DTGhU7u3GctdM
	h5imbY+EflGmn9S4s9Xa3x8tsej7ozDPB0YxghJ69SGLCiiAqnAbCEvjWIMNvEDSCl5D
	nusKrXdLq3wik378YO1cYtCQeoyBUXSGbdxSDtYCN2uqePgP1lUP+wKxTQfiuRPqpsxB
	foRB9oyQsQvMlXM+EXNvBW3ODWYy69BEWnVxnSqVdqG2PV1UBTc4vb7MUBuIPnvu6wPq
	mmMCy4fUjqiGQRHJ+dtVWiKM88vRvdPE9taJTbPuwNlLcgWSlkuC1ZBUaZz0Z2vH/k5u
	/XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pnnC2fRazYTOHAvV5xcm+IsYBMe5Xa/Wit9Cp0CTgGA=;
	b=GCHPDWJx3lAWF5KJy4lio9YgozNPpOsay6QMeVcc3kfQ+X5A0pUJnjeJZKj2dnLaiT
	HRuG/7AQK8IIdwUG3XDB8edXRRyHqTOEL7jc4L8J2bmIAyornJIcEtswRqQaH+KjkkIx
	28eUEMNqnT1fKrkLPlFm8u2BNRYCdbkePy1pK3uiGnkYDNPdya9RqG61h8ykYy6rk75d
	2hM13lt0VV/CHMpmGyTkVOT+iHIy0Z6K/mOf6w+8FlZRYhfaTQACOYSs3yIwQfQjr2sk
	w/aCWnBS4fgYSJXJFlzUEio53MuSpwCS1PjLpbkGa+2jql9j+Y1gj/7CPhu/1Y3Mjxlj
	foQA==
X-Gm-Message-State: APzg51BtfUm/XCqRpx+/4+SUVJxNvgCJYwyNWgYLONs4yf+1+SAAwOAG
	A6axIa9ygKbLJI3tGhMjOxGnlOlVgE5DEVEcmy0=
X-Google-Smtp-Source: ANB0VdYQVvhq9I7PK0qvsR9HfTTNqdLeNrnjbmvKDb3FajqUiCbSdAbAzZX5FoUluTEPYqhaGCP83g8g0i8vcxSL2CY=
X-Received: by 2002:adf:8567:: with SMTP id
	94-v6mr5472061wrh.223.1535263238773; 
	Sat, 25 Aug 2018 23:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180826045735.7732-1-yisooan@gmail.com>
In-Reply-To: <20180826045735.7732-1-yisooan@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 26 Aug 2018 08:00:27 +0200
Message-ID: <CA+chaQeMuN4+wxyyA_jvJonCtSiLO614uWt7LqjvK3CwBeo2Lg@mail.gmail.com>
To: yisooan@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH v2] libconfig: fix SRC_URI
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
X-List-Received-Date: Sun, 26 Aug 2018 06:00:38 -0000
Content-Type: text/plain; charset="UTF-8"

Don't use github archives which are regenerated from time to time with
different checksum.

To fix it in morty all newer release needs to be fixed as well and then the
fix backported to morty (or explained in commit message why the fix is
needed only for morty).

On Sun, Aug 26, 2018 at 7:01 AM Yi-Soo An <yisooan@gmail.com> wrote:

> It causes a fetch error since hyperrealm has moved to github
> and the current SRC_URI is not available any longer.
>
> To fix the error, use github repository.
>
> Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> ---
>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> index fb6e50e51..a0b3a9471 100644
> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "C/C++ Configuration File Library"
>  DESCRIPTION = "Library for manipulating structured configuration files"
> -HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
> +HOMEPAGE = "https://hyperrealm.github.io/libconfig"
>  SECTION = "libs"
>
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
>
> -SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
> +SRC_URI = "https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
>
>  inherit autotools-brokensep pkgconfig
>
> -SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
> -SRC_URI[sha256sum] =
> "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
> +SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
> +SRC_URI[sha256sum] =
> "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

