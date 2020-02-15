Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3762961219
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:40:26 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a2so11556025qko.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0PCIV7ji85u0FyDucyjOU63rjK5I4NN+Cva4k6uydKI=;
	b=KRfW+3bafLsdvca3b2soCbCZMc+U2xQH+76GbR0iWEsRUJMkWlGnPNyJ1RWbHMshhy
	iUylOaAnELgaOwUJJxRSKuZL5XUkhhKVn8hw4/V65a9tu41tHPehr/pETGZDTC4rLTwX
	Q4T8wwBmIHvOzwnsxjAh8THNUxcnpbw7DBGLANq5mSrUcnecEe1+V1/k0KSpv3Nzw4YP
	oDh/AZz/p0ouBiJSs4GP4SalVsdkyYrQSMU2fQ8+1mfXY0+OE4FdZu3hr8mco18Uzfnu
	7VkDwLgMsmh3Ig5ZCCvpj8nUk0B6MS5+iPfG/UepQdE+3kZvwtaQL+5yvw1Rh83oV4CS
	EJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0PCIV7ji85u0FyDucyjOU63rjK5I4NN+Cva4k6uydKI=;
	b=hSCp+5klXk/Mh90JLtKaq6MknF4rP1h/d9gnKcfp/9fZtSSHJTm1AH+cGS5m9KOaa/
	DkAnSc/+7/D3kBnbnAxGVbQBxCxr5/AA2pQReE7c8jzX1GFfKhpeTGaHHKLZ9yOj5uTP
	47ILFXumrxb0uS7/bFkZSIG/8dLdsNK3qo/DV2PGj4uJ2S7+vA4WXqKMlFw4b3IzXpU7
	kgSmutmLighrf0GflcNEYuW2xdV2+w4eGV0nJrTk5oQLoJhV/e5lcDT4TRg2uRlycHOC
	CqfJ6uPGrE6SXN6b2I978TG7Q6+G6aM6ZtvBVzdzZK0WLONWhOu2rPSwOkBn/0Lly23Z
	pU1Q==
X-Gm-Message-State: APjAAAWnWziXXUR3CLsQ0IXQJ6QRyL2zq6YMQn0HcGl8Jl5XpXt72/ss
	sUmIN4pBN+hPE0uN4H5zRPPn351rNQxjwF4WrWDQJqUlyr8=
X-Google-Smtp-Source: APXvYqxZEvBPFnngmLqvEWgPKKki+DlTrqLDwBCcdHPEegfpzDVEXqPopxIy+CCVtJUHD61tAjBHPIIXwcnVUP/V9e0=
X-Received: by 2002:a37:9c42:: with SMTP id f63mr6344595qke.9.1581756026920;
	Sat, 15 Feb 2020 00:40:26 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Feb 2020 00:40:00 -0800
Message-ID: <CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: upgrade 3.17 -> 3.18
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
X-List-Received-Date: Sat, 15 Feb 2020 08:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/391129/

On Fri, Feb 14, 2020 at 8:11 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-oe/recipes-benchmark/fio/{fio_3.17.bb => fio_3.18.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-benchmark/fio/{fio_3.17.bb => fio_3.18.bb} (96%)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.17.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> similarity index 96%
> rename from meta-oe/recipes-benchmark/fio/fio_3.17.bb
> rename to meta-oe/recipes-benchmark/fio/fio_3.18.bb
> index 482928c31..b6484290f 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.17.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> @@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
>  PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
>  PACKAGECONFIG[numa] = ",--disable-numa,numactl"
>
> -SRCREV = "08ce9dc20b8a4e55db7af6d869ddfa49b4a02d03"
> +SRCREV = "ac694f66968fe7b18c820468abd8333f3df333fb"
>  SRC_URI = "git://git.kernel.dk/fio.git \
>            file://0001-update-the-interpreter-paths.patch \
>  "
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

