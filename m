Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.25160.1622321979678190758
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 13:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oXL8S2Oa;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id i67so7667950qkc.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TijWKeK2Gj5MeqL8upYv1XSehsRpPSpXib7epjGP8w=;
        b=oXL8S2OazHMONeUxpHJ8ICRVo0YlGAMIM2Ghpb6VmjR93YDgKQ26bZDoRTBBRe5gnT
         7BmfrEDW/19A08Va36YdTGv4krAWoh8R6PMfmmhxOoGleRvOyflkEfjYRFzOUa8vw+x9
         90SfKbvw3zfG868bdy7wuLPAjdMf56joq3UOBHwrtOHx8PRzHiJiT7FRMCqMpKB4+9FS
         8J2UPTF8p+rYPrd7RVEU4QtFEMSvcxuN3XGiM+d/9jeY4KGHHt1nFSlAYj1xqbIA+3w+
         WZppBUORO/1+uNJhLhJsqHydSbXThZfqafEngAftmUYsO2i/5ctHKQIqS+5Z4zU0yppW
         4dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TijWKeK2Gj5MeqL8upYv1XSehsRpPSpXib7epjGP8w=;
        b=APqnNPQMJvLBhbMgYsImrHU8X96+Xpa3T5U70tZe5lHFI8GCCheaWrb16euhVGb53A
         j6PhICLzS8kqku/AE7Aahq7ALBaLRY1yA7fp3sKPyoFY9QSnKYyDziHmmVob/hqwEEmP
         znqu5E2vjJAQCsSF+zn3FBODsbv7pfFUBEIr0+Syg9EtKbl366UfpaUgj4v9azYyxJmG
         AQ7Wcw6NiwcJtdfmAV15deKAcjff0gjsYyt2leXzSWy4s+0/aRSfRGlEiKLA5T9KqVSo
         aCGxcmDqpFxFHMn1rnvqQZpBYV5SQ9hHyUkZPfmTvkoRu0speQub9gdBL2a/z0Ee1JEO
         Kx+A==
X-Gm-Message-State: AOAM5312OvZBkhpicEs44mdnIyJVuDdazWC4AI4ln3gofJNRI/MHmmvU
	05kptmJAZEQqQgLR5XNIfwLqX49tL2ejTETc7Tyodbb4+JXm/w==
X-Google-Smtp-Source: ABdhPJxye8xQwLLCHBHPKStAF4YC48924Zd2Mjs6pwIsgpKu6nMKpZmTxylONPlP8fQYE+r9raFuYYNo54vMDyqwdpE=
X-Received: by 2002:ae9:e40f:: with SMTP id q15mr3108952qkc.125.1622321978755;
 Sat, 29 May 2021 13:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210528102902.13676-1-guy@guy-morand.ch>
In-Reply-To: <20210528102902.13676-1-guy@guy-morand.ch>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 29 May 2021 13:59:12 -0700
Message-ID: <CAMKF1spqeRFGOzx5uKq=anc9pJ++BGx-rkcX5wM8yz407hD6Dg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fish: add fish recipe
To: Guy Morand <guy@guy-morand.ch>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Guy

Thanks for patch, it does not build in some configs e.g. with
clang/arm64 I am seeing

https://errors.yoctoproject.org/Errors/Details/585823/

On Fri, May 28, 2021 at 3:29 AM Guy Morand <guy@guy-morand.ch> wrote:
>
> Signed-off-by: Guy Morand <guy@guy-morand.ch>
> ---
>  meta-oe/recipes-shells/fish/fish_3.2.2.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-shells/fish/fish_3.2.2.bb
>
> diff --git a/meta-oe/recipes-shells/fish/fish_3.2.2.bb b/meta-oe/recipes-shells/fish/fish_3.2.2.bb
> new file mode 100644
> index 000000000..6bbe92088
> --- /dev/null
> +++ b/meta-oe/recipes-shells/fish/fish_3.2.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Finally, a command line shell for the 90s"
> +DESCRIPTION = "fish is a smart and user-friendly command line shell \
> +for Linux, macOS, and the rest of the family."
> +HOMEPAGE = "https://fishshell.com/"
> +AUTHOR = "fish-shell contributors"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=9dbc95a48a7b8859e3c6db4c9396f053"
> +
> +inherit cmake
> +
> +DEPENDS = " \
> +    ncurses \
> +    "
> +
> +SRC_URI = "https://github.com/fish-shell/fish-shell/releases/download/${PV}/fish-${PV}.tar.xz"
> +SRC_URI[md5sum] = "606253699ce41991b03a93bcc6047d51"
> +SRC_URI[sha256sum] = "5944da1a8893d11b0828a4fd9136ee174549daffb3d0adfdd8917856fe6b4009"
> --
> 2.31.1
>
>
> 
>
