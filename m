Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7127E976
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 18:57:11 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id r6so2387938qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 11:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vtdbLbU0h6YbOdY3R6sByIZjRAFN6kgSvNBguGk51G0=;
	b=Akp0dv3Wq5YJa9D4EsY+9tcbIwaGQIBUoIt1ol2qvMPDITvlXRlwK5FeKzBIu2FfHz
	by8d4tC33xfuKM3FNNjSKnByrqcEvuMgVKKquKaySO7KOuMg4sf/1bsTRFta1X16uqk3
	Nf7uvXWgEpGE1bxLYd7TcnkDRs5cSMozSQAF7Hs1QGcFVjE5nu/bOrIydALkz5pNmOrt
	D1rRN8Cen2ZlDglmUQ1nymnCEiZG++YEx/+OpjkPyd0l6zVvr5Raz7TbhUIsyh5ZDTUB
	bAvtMmd7ls/sABV1AsiD08GENgxKUtn9FqTGvIp74ghPiKLJsI64hL1u9hiab0NZgvKF
	iT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vtdbLbU0h6YbOdY3R6sByIZjRAFN6kgSvNBguGk51G0=;
	b=aITolaa/D0HZYNZwAz6KR6sGzLycUVEmYFHjLwFyD5IMn6eMh5tFQUq6Z9I4vfvkbb
	+cDfrWhpBvUyv65aYO/NXAULZ9bpcRLYI3wpoXZfDnYV96FXyYebM1yi3KwPrD5P3Akk
	YNiJUiQP9uyKEWRbJvzej4WFMVltqXMhAmbbsoIlwNpi0jsvPet2P4cLjC5MPbBa52m+
	ebZnCbIrWf/L4WdLMf7fhfD1aJlq4PhfQv/EDZ8OoR/Essjtd0WKlJLK6L9pQ+8S8wJt
	AZvfWhwnGeuiWnhFmZIebNGMi4/If+Om2GORa9BkmECu7+s4HuG6uQzcHsX5atBkAtoX
	z99w==
X-Gm-Message-State: APjAAAVi8Sh29vRMdwtckKmcMQupX6gG86YZAdJQ2ofhz0vJEO5lYQu5
	n8szfyYmQtfD1ALHIn4eU+D7TMRWV43+ytJ/SV8=
X-Google-Smtp-Source: APXvYqzMhqUEpEX60J9+irOzKHT+8EktDXvNCjjMoxBR2+Q33QWnw4cnm2NRDmC19ygLmv5s7JePNM3EiGN+b48h7NE=
X-Received: by 2002:a37:b0c6:: with SMTP id
	z189mr28778092qke.208.1560538632139; 
	Fri, 14 Jun 2019 11:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190606065308.23766-1-pascal.bach@siemens.com>
In-Reply-To: <20190606065308.23766-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 11:56:46 -0700
Message-ID: <CAMKF1so=LUh2W27sVt5dhB6ASpOW0F9WqL-F48nJYimZN8Av2A@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Fri, 14 Jun 2019 18:57:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 5, 2019 at 11:53 PM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Simple update to latest release
>

I guess you also need to bring python-protobuf upto speed as well. I
see this failure
https://errors.yoctoproject.org/Errors/Details/248690/

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb}               | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> index cf72d9ca7..0892178c0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> @@ -10,11 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>  DEPENDS = "zlib"
>  DEPENDS_append_class-target = " protobuf-native"
>
> -PV .= "+git${SRCPV}"
> +SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
>
> -SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
> -
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
> +SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
>             file://run-ptest \
>             file://0001-protobuf-fix-configure-error.patch \
>  "
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

