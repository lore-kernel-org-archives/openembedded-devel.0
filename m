Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 524D77C410
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 00:16:56 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o2so9668462qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 17:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LpVforVRP6SiYP7i+UU81loh6sH71vqW7/Tu6tbBjWE=;
	b=ATJp/EKS3nlPA+tLbZLPbLdn8zfdco2A16IneR7eZ03qHAaQSQ4pbjsu6TbsjbZ8yg
	VAbYwUSB8I2XG0hULfjnm8Bq5H+nnlhNExxf8BUX3zBmXMn6vlMQvQHnSkazilyqkXes
	qFouA/kqX1g+IbxqGlqwCM++L8ufXHCrbrEUjS9JfgiwjHdK+06MUiH6yRd75FLFkt7y
	LmEdwh83jkctfu1l2XyVA5ylfxxFMNbeuKF1dAt5LbvV5cxBbBxKCUhRZ2206/8QA/24
	brE/Vrt9KJAzQOFo9LlEZevro8d8YEE/bHK6zU7gWHwA/GUQ6IeIu4mDOcC9/AAMVoUk
	4owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LpVforVRP6SiYP7i+UU81loh6sH71vqW7/Tu6tbBjWE=;
	b=M/SjN2U7+RwWgG2nZiGfjqx7GOnNLyKy6hWTSXO9m7e0QBP7kpFvsFpiX3TKofRhMw
	Z0ViTr7hlDjPyGGfeYKjJ2wT1TM8GnZ7RkuMvqzNJoFne/xIsG7zT+crg4/k5hOOmed3
	fhHYjzZf5KLLj6HUoJ5DZ7zhLd9AM6T3WxelPtSCA0GpdAlM7/qdN0iZy3Vl/XKr3kb9
	M49T1moEQjhND+5uk7o8YpsBf1CGt4kxZ/kBQCQxebSk1MM59SzIkUGgZQKfE/2ivYa2
	GSoEVPONgZTbto6FxMTXLsxqFGn5/cENisLvj2EyXpjCmogIrRxPbrvjfFt+b7Nrc3Sh
	mYig==
X-Gm-Message-State: APjAAAW64oTLBXgwSQcAlHZWjJKA88ia4IHRevhNoj+K+UhEcXlw2BmL
	QXuWXfvhNPFmSfgxCoJs2TTxzG4BFHvnD5ePjR0=
X-Google-Smtp-Source: APXvYqyY93i66FzMjXWGrigEbtxOopNGz/xTzOAt9bvYIs5YC7IPvpLoiS2GxsJRkwMqlIqevkhjtDJDKTEtFIxBS3Y=
X-Received: by 2002:a05:620a:14a1:: with SMTP id
	x1mr64932072qkj.312.1558743417043; 
	Fri, 24 May 2019 17:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190524233948.20049-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190524233948.20049-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 17:16:45 -0700
Message-ID: <CAMKF1sr0TFOdj0=mTSQ9ixBup8K_QjsSPBTqd4kL7rS23b+NXw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmikmod: fix SRC_URI
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
X-List-Received-Date: Sat, 25 May 2019 00:16:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 4:40 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * it was moved to outdated_versions directory
>

Why not update to a version which is not outdated

>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> index d53dff6a07..bbf58f9540 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>  DEPENDS = "alsa-lib texinfo"
>
>  SRC_URI = "\
> -    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz
> \
> +
> ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz
> \
>  "
>  SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
>  SRC_URI[sha256sum] =
> "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

