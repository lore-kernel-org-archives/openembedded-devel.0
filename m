Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F28DD799A7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:39:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n23-v6so4146007wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=hoscTNsU/YPhddBUQX8+PbKqbGGQagbrjIKjY3QPsWU=;
	b=OHDowY9R4FI8XUZmkhwMFiDQEOt74aqM8FeI2ojKpO137dsQtVI4dF45duPow9J0Pl
	f5QbAVuJ2AWQzoh7VYIaHdLcNr/TbPStvvA0x3abUzJLfktHkGunUVfVDxJY6/2z3fNT
	/KBsVzAkXZ6cf330shRG2ZKgNSyZmFmMzMYGb/F7krsJE75EEcSVnT6ztw8rNF0BTmQr
	YykmtBJBxAQJfFIXye8UjFD62T+xEdtOwr1fXwDGprbZyAMnZbGdPUIC2cvmluiqkaCH
	lYubX02Jngggs+jjxij6pjtdvkdRCOMEI6vDskPv9axFteImmxR6n4BMRw7rCWMm69NL
	EORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=hoscTNsU/YPhddBUQX8+PbKqbGGQagbrjIKjY3QPsWU=;
	b=kIjnHEeBAt/zgSKNasgFXuEEKTUux1v1fiZpAWnu5fsAwqrnuz/SF6NjIoDdJ6PrhK
	lCrzS8jeBKxsT2VOFeIjZbdTeLQmuBTBjhI5ClscO/SbLusfu4VYXlX9cLApluKbU//1
	Gacuc6djWZuNIXE/RwI9SfaRDPBzk0n8OgsauXuS1QuTrXVHt1m3BeORYGU7HNsLdKkd
	LIQFKJ3p7C145A+JbINOOjjs5j4TZFg5yF6yAx3avPJQOaWs3wokh3H0GUFRbwhNMrsN
	uKb7DH0M8GH5R3HTveQI0SUaFS5H/bhC6bQUmFQ+PACOQepQ0Ey8EITODsUwxE5Zi5Tt
	fRKw==
X-Gm-Message-State: ABuFfojnb6sKCuYfwsCvwKb0nUUWEBoW9eaMx266VLcIML+ZnndQEihB
	COUeMZEsK5vPLt+x9p++tdwBLm74i+FRpy9riNDQnywE
X-Google-Smtp-Source: ACcGV62OrhjhTkO6/EGtKnaACmXF310XJe6TCRGdd43MkIEVT7sKmd9cBoLrIOCEQCb9sM4weyRPkk8N2sEQNEbaYFE=
X-Received: by 2002:a1c:b4d:: with SMTP id 74-v6mr3626003wml.15.1538206779423; 
	Sat, 29 Sep 2018 00:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQc_+P8FZYGiZ-DNMWCBmk3XpKSUU6WhGpOs0USzPspD7g@mail.gmail.com>
	<20180927174423.12350-1-Martin.Jansa@gmail.com>
In-Reply-To: <20180927174423.12350-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 29 Sep 2018 09:39:28 +0200
Message-ID: <CA+chaQepG59PTPZOUgsAZ92jTy=Gr8yfx5S5pg_OmW4jBUUoSw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] tsocks: use -lssp_nonshared also for glibc
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
X-List-Received-Date: Sat, 29 Sep 2018 07:39:39 -0000
Content-Type: text/plain; charset="UTF-8"

This isn't the right fix, causes:

ld: error: cannot find -lssp_nonshared
collect2: error: ld returned 1 exit status
Makefile:47: recipe for target 'inspectsocks' failed
make: *** [inspectsocks] Error 1

Sorry for sending too soon.

On Thu, Sep 27, 2018 at 7:44 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * the issue is reproducible also in glibc builds
> * fixes:
>   | tsocks.c:954: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:842: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:339: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:522: error: undefined reference to '__stack_chk_fail_local'
>   | collect2: error: ld returned 1 exit status
>   | Makefile:53: recipe for target 'libtsocks.so.1.8' failed
>   | make: *** [libtsocks.so.1.8] Error 1
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> index 72913579af..790a6cc795 100644
> --- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> +++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =
> "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
>
>  inherit autotools-brokensep
>
> -LIBS_append_libc-musl = " -lssp_nonshared"
> +LIBS = "-lssp_nonshared"
>
>  S = "${WORKDIR}/tsocks-1.8"
>
> --
> 2.17.1
>
>

