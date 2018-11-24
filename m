Return-Path: <ticotimo@gmail.com>
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
	[209.85.222.53])
	by mail.openembedded.org (Postfix) with ESMTP id B13C37BD65
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 01:24:19 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id z24so4603510ual.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 17:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i5TKfQ7l4bdehXQUu8oO8fZdBXuRtydXwCYEfTALEPI=;
	b=K8KA2z17iFg6lEJn4hC4+XpOdzz4p5kTrqfKB/+PmWMNmViRuSqcAgDcY3h62vuAWt
	OXy0jqEh8R/6j/+S/wNt5ysIchCUSEOx+TYLMjkY/ufhvm1XawncXyc06fIJ7z/fv+ff
	TSwiR44DlbfW9pPRs7zeeAfkxTNjbtf+yyraACGzOYItIrJHd1V40fhfk1C3NGEX1sc/
	bBaz022CWPsoDMLoELcCu9DG6R+L2ur/K5utrpxyhSNJLjWRinbJZUWyrdmL8UyLX0Mo
	FYoiS1ZJVX1f+kX7HcnVTv5bt9PD3W97RWzQRnZt6QYFtzJRs2/YOhr9nDSFKKtrrTVU
	Pmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i5TKfQ7l4bdehXQUu8oO8fZdBXuRtydXwCYEfTALEPI=;
	b=c2kOic+r/j9HuVK5Gce3Kb6xA+JiJHQFiMZDmKOohjJcJQq7sYBgzUQvS+XSC5SqHc
	GFt/YncNzJJXRe/ohFs6K0UkNa0zLw4VmLrA8fEoLa30NP9ErYF32IKUBsOjc284cQ3j
	GPJp2uLKX7sPYVpYukyTQTDf6Lq6EVnewAwAkm2QA8KSrBxoTYu6FqEOU/V5OFEr6yM/
	yJeauLtsC0akJy0Q9ebtF6f0E5xnsDKjTjKMLZs8wKLvzwHBtHFEnxaNvMDI49uwmcen
	ZmTwe2/LTqx1CUm5Qcd2pp0dOFmA6jwWCvTzBMcTpTBbnc7WUj0txBJPJ4aMrAaClKYG
	rLXw==
X-Gm-Message-State: AA+aEWanIfU5MtMFy1SM7tt0X3sONR+1xPrfC/YC4EPvRo095Tyovrf+
	doDFy5lZY9PqeOzZEhs9n3GymLfz0zcqyavnTojAgQ==
X-Google-Smtp-Source: AFSGD/X20BxXyst7lJK7KVdMBTedb+YHImbdX7lBlaBv7Lpgl/5wSgOJzEH08Kgd+Ce/9fDvKyxDLccrU3OjyF9m9To=
X-Received: by 2002:ab0:1058:: with SMTP id g24mr7481084uab.58.1543022660270; 
	Fri, 23 Nov 2018 17:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20181123050302.4692-1-craig.mcqueen@innerrange.com>
In-Reply-To: <20181123050302.4692-1-craig.mcqueen@innerrange.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 23 Nov 2018 17:24:09 -0800
Message-ID: <CANx9H-Dp4ftGiwfrF1C8MoKCzd9n8O5hfd3ezqKDA14-3o+ABQ@mail.gmail.com>
To: Craig McQueen <craig.mcqueen@innerrange.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-multidict: Workaround for broken make clean
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
X-List-Received-Date: Sat, 24 Nov 2018 01:24:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 22, 2018 at 9:09 PM Craig McQueen <craig.mcqueen@innerrange.com>
wrote:

> Note, the issue is fixed in v4.0.0.
> https://github.com/aio-libs/multidict/issues/194
>

Why not just upgrade recipe to 4.0.0?


> Signed-off-by: Craig McQueen <craig.mcqueen@innerrange.com>
> ---
>  .../recipes-devtools/python/python3-multidict_3.3.2.bb        | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-multidict_3.3.2.bb b/meta-python/recipes-devtools/python/
> python3-multidict_3.3.2.bb
> index 7f9cd5564..e65d7d4f2 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
> @@ -7,3 +7,7 @@ inherit pypi setuptools3
>
>  SRC_URI[md5sum] = "06ca91d993de2d04c7ee6df0cbb44ea2"
>  SRC_URI[sha256sum] =
> "f82e61c7408ed0dce1862100db55595481911f159d6ddec0b375d35b6449509b"
> +
> +# Work-around for broken make clean. Note this is fixed in v4.0.0.
> +# https://github.com/aio-libs/multidict/issues/194
> +CLEANBROKEN = "1"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

