Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id C64D571B07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:44:39 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 38so162981uaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=StXUcQORxP5bYjedsraszaMEfdqTPVnewglHz7jzPE4=;
	b=xumMszx4oQjhyrJjMp3ZFmA+hswSvmASM8NTlkVdDCi4ZbaHcHNvhXq5j1WAR/ZMsf
	6fopg0JZsvygkuvNMnkzoj+xn/ymB7cYo8lzvdX+WSahVRL6z8A1H2XwlWhNVeTgkNB9
	PuaV+NCGkCn3HC75UxQOoReIhTkWXk6Wh0KyKF3s5JITkU+BzORslc1Qt9ijmdNxofh9
	ExE0Jktlepz0hJGYObkLrLSd0d4kWC8sakxLmwiVwCb94rRZK9imIjYE7meyyxlfohtm
	QC961bB4ASPL9GokbTwSiN9TMkTtxtzKAw3gvMpzyQot6rV9KKMycE4GBbyS9g1VjxsG
	Pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=StXUcQORxP5bYjedsraszaMEfdqTPVnewglHz7jzPE4=;
	b=BUD5nkD7jKBGN56r3qAjwMnPZaDFY/moQg+bWOKpoqhhtjWo6Go+0fiGQrTjpfBc3G
	XvbZmY7m2Y+0opQxgvzTGPs9lTP2mY5WXGYMRxziKC+OYDBeesDtBor7IXIRV/6W1u00
	72U6/nkCA4zCj5yZcvhYaZ5sfM9sc6XNBhHvI7BaV26kDur0i29O9nmFzZwV55LQmgAl
	wrVroP7h/1t6r7U8tPSb2ggpi+6tsg86LscoxgwhInJzi1deUw5DDsHa9S3f8x+XOO7M
	yVjf08ylypZ7ZIRWaoV9+xaHelBQIxAxu91CVDLGYcN/xr0WQUAdtxs9SmRaJlsE6rf2
	1n8w==
X-Gm-Message-State: AA6/9Rlbxgpwt1/7TuzYurg2WZQnk4cKdQlqFaFb+0LB0mSXSZxWWCMeZjPoTVZg72svd8xokFn8T0U+W85Stw==
X-Received: by 10.176.2.232 with SMTP id 95mr959404uah.32.1476855880042; Tue,
	18 Oct 2016 22:44:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Tue, 18 Oct 2016 22:44:09 -0700 (PDT)
In-Reply-To: <1476778230-105764-2-git-send-email-herve.jourdain@neuf.fr>
References: <1476778230-105764-1-git-send-email-herve.jourdain@neuf.fr>
	<1476778230-105764-2-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2016 22:44:09 -0700
Message-ID: <CAMKF1sp5KNDqbgzvqKp0D3JHFMTdqc_ovbMRoD1ve30z5upshw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] v4l-utils: add support for "native" build
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
X-List-Received-Date: Wed, 19 Oct 2016 05:44:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 18, 2016 at 1:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> index 6148695..b9732fe 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
> @@ -43,3 +43,6 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
>  FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
>                       ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
>                       ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
> +
> +PARALLEL_MAKE_class-native = ""

you seem to have root casued it. Then why not fix the Makefile instead

> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

