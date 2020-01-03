Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 041467F9AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 03:40:08 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a203so33247205qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 19:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KHMgcFOD3jDAbNOrK+RLCU4TaD4ME0/13S/gWISrjUc=;
	b=pZcDeW3N+lIiIW7TOUwEyDrOULBYCaB/COHKfoAvKLf+/L28G87S+FRH8XP9Frsr10
	arBSHpAGI8c/6QITWVxkFH/QTmrR2HDFfAHqTJqEJFsKWF+FUFmpv3WRxXUxSA4POkHo
	sfTW++z0qL5/72DrBSSwEoJfrh8GSqrfZmnneXDFaadp2wyXOTJtAFZTPWlkSrexzG/C
	YX8BvNOA5vjkzGmaNuulvZyomsqshg2AWnW7QU/CoX+oO+eJgFBKkpSjhqoA9DBUx6t1
	XP0KAMVXbKeozKhfVHA2W1R9F+xkKNM9dkQwEW0C0R+ApXyrHzyQWItwzXbPQyEY19i9
	PHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KHMgcFOD3jDAbNOrK+RLCU4TaD4ME0/13S/gWISrjUc=;
	b=fUiY9VegQq3TJOvU5M7yM4ectteq2/86ZV25TfQ+LLMP/8vN3Vu9r/bjVXxeU3eU8W
	q3jHch/btcVArmnACn7EJdBZZlkKDlaWBj9ES15PPtVqtmP/IPhcsT9o6A1Y2tL3C5Wu
	QqgPG6YRi0ePnheb/sBbfZMGBbbQmFaqQjobo+CZSXMv0vHESZ+9ydgeAnhaZehCqsKy
	xlJ3915C2shp0cwYYrYf2xFnFsv0+vTjk8YWGaJHVJkXryZe+8DGIlp7pR8ynZhw/Nh0
	RIwvGHDHBBmkjSn25tXv+/KOFZAFvH3sdmMviekY5Va+leU3MsPJOlSbTeFocTtKfp1o
	+nUQ==
X-Gm-Message-State: APjAAAUfcCnIFFZhNpMht3b11xEAXqm98v/6iO90iwYdiMi4mVCXsAgJ
	x1ZsyAOoo1IdnLchOSdtm3MUwTHo0tLTMZhgqhw=
X-Google-Smtp-Source: APXvYqyk1gt9IGdnX4WCuK6DCtJOwWyW84MzMmHEzD3B1y0fcafkj8XfvvzC5bYgn7OPYsdjTxm4vVc6N9OUAJrq770=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr71420601qkh.9.1578022809707; 
	Thu, 02 Jan 2020 19:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20200103025025.16344-1-kai.kang@windriver.com>
In-Reply-To: <20200103025025.16344-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 19:39:43 -0800
Message-ID: <CAMKF1soUur=ZknHqmVWYALGwnp4_kecgBVtVdp0_11pj6n-PEQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libbytesize: disable doc build
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
X-List-Received-Date: Fri, 03 Jan 2020 03:40:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 2, 2020 at 6:52 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to build doc for libbytesize and the documents are simpole and

                       ^^^^^^^
typo


> not important, so disable doc build.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
> index 07bf1faae..1a5c1848b 100644
> --- a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
> +++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
> @@ -25,8 +25,6 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
>
>  PACKAGECONFIG ??= "python3"
>  PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3-core"
> -PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
>
> +EXTRA_OECONF = "--without-gtk-doc"
>  EXTRA_OEMAKE = "py3libdir=${PYTHON_SITEPACKAGES_DIR}"
> -
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

