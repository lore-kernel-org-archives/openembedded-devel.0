Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1603F610F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 19:07:39 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id h18so8936135igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sEVSHT0ouaA0yEjqh88qPWkR7FLljVP54XU+NPybkRM=;
	b=Fk0yIcW8Zl/KzQAo2/djWMuIKIbvfXTBHSA3g4E8p63kF2RztRESiRxv8aFobfu23S
	rLcLgDGJ5IovVYyxVqd+P/D5Q9oNNUUJfU1B0fGl4KVlf0OM45NkFYeHBy5GnLyq6t6i
	b5uQ9BBGPYEoZLQKtfz1lYCTUkw2lvIIEA5xQxDeyQi1b6BEa9rBKImpKydtEsV1uhSf
	pzgY4wQxKm8T6mn/6Yoeo5cl/PQTuhQqWG9o5nC5HGLfETr1FuAA+//rrs0KvHIuDHCB
	WfaREjXuTBq/PcxfabJAN2NpYqeGWXdDoEaGUCZFS2f9nT9JAirnaf95deLQhQks6RdH
	K/5A==
X-Received: by 10.50.61.138 with SMTP id p10mr961509igr.20.1408388861087; Mon,
	18 Aug 2014 12:07:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Mon, 18 Aug 2014 12:07:11 -0700 (PDT)
In-Reply-To: <CAHQecY7-LZLcobjszRWZn=M2-qQHeUYT6QZt072=pRe68DpLtQ@mail.gmail.com>
References: <CAHQecY7-LZLcobjszRWZn=M2-qQHeUYT6QZt072=pRe68DpLtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2014 12:07:11 -0700
Message-ID: <CAMKF1sqzmXBnou_4E_KgqUtqBVcbn6nOXLPayemt1u8ievvGkg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-navigation][Patch 1/1] gypsy: fix QA issue by removing oe-extraconf
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
X-List-Received-Date: Mon, 18 Aug 2014 19:07:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 18, 2014 at 8:37 AM, Tom King <ka6sox@gmail.com> wrote:
> Signed-off-by: Tom King <ka6sox@gmail.com>
> Signed-off-by: Ron Lockwood-Childs <rchilds@vctlabs.com>
> ---
>  meta-oe/recipes-navigation/gypsy/gypsy.inc |    2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc
> b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> index 747b61d..7c93d0a 100644
> --- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
> +++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> @@ -11,8 +11,6 @@ DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native
> libxslt"
>  inherit autotools pkgconfig gtk-doc
>  PACKAGES += "libgypsy"
>
> -EXTRA_OECONF += "--with-distro=debian"

Commit message does not explain what QA issue and how this fixes it.
May be a couple of lines describing that would be handy

> -
>  FILES_${PN} = " \
>    ${sysconfdir}/gypsy.conf \
>    ${sysconfdir}/dbus-1 \
> --
> 1.7.9.5
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

