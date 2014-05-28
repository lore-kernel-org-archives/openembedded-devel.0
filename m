Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (unknown [209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id A10596FA85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 20:21:20 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so8894999iec.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 13:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DO8+3itrm6pyRM7ZGYjHIi2g8CaeE2HScaZ0j7d6VP4=;
	b=yiY7J0BqzG5cuyAE6VA+sORB4aqWfjzqbo+8KJu/Ycr8OdvhK5oWflvLST6MuR02t0
	B5nUsxE0G8ySDeVFT+BqwFvLGrmeMjjaTfG5Zz4iBc9C9XId9Z2MjZBdHI8zZdJ70m3y
	RZUpDoGiAo/euWesDCNRb0/dKk0cdc8h3hTklrTMj8yKxdXOsk33Tj78eMIKDnKjdk6y
	LPwkVZsuGFLxSrK2njIaVXXVbqo890LOE8H8P1qzt4XFAFH+XKp5iouT4e3qtlLMjPOH
	y1i/t1nKbWHmtfDg1SqyIMNMlNC+3pmanr9WRkYarvMe26vQN0OxuZMKwNd1mlCqL7m2
	Rc5A==
X-Received: by 10.50.43.229 with SMTP id z5mr4721783igl.2.1401308481161; Wed,
	28 May 2014 13:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 13:20:51 -0700 (PDT)
In-Reply-To: <1401245547-28054-1-git-send-email-ticotimo@gmail.com>
References: <1401245547-28054-1-git-send-email-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 13:20:51 -0700
Message-ID: <CAMKF1sp_ii_wm6sjCd=ENxPKSkQoOqNhLnnA0bU6PfOyp=gz4g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] enca: fix S!=B failure
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
X-List-Received-Date: Wed, 28 May 2014 20:21:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 7:52 PM, Tim Orling <ticotimo@gmail.com> wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>
> This package does not like being built out-of-tree.
>
> Fixes:
> | sed: can't read configure.ac: No such file or directory
>

can't you sed it in ${S} ?

sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' ${S}/configure.ac


> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-oe/recipes-support/enca/enca_1.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
> index e65a143..452c01e 100644
> --- a/meta-oe/recipes-support/enca/enca_1.9.bb
> +++ b/meta-oe/recipes-support/enca/enca_1.9.bb
> @@ -14,7 +14,7 @@ SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}
>  SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
>  SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
>
> -inherit autotools
> +inherit autotools-brokensep
>
>  EXTRA_OECONF = "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
>
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

