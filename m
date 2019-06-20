Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB137E871
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:15:48 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so4008765qtr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UJ4etv/N4SZP7KoklY7PlOyIIGEMokQB0Szob36pw+c=;
	b=ADOjje5j3IHtklzeQL6Pv67xPh9IiHAY7e7aQMZJwtO8drmED7SlAVFBJS1jPFK9pr
	HheYLsXiyDLnq2L+CAX2BXN+Y14kGfgfEna65nW/dDPZeU7a5DcPw+sc1C6B7nKxSWTY
	AO2zHyx0FUJYtwzEmAS4TI9phd3ifNlYD2Bcc8pZOO9ud3DEIA8xVZn9jfH6E/W9t+xC
	p8/l93ijOUEyjO+Su68v+qr2ZJIE1WNz1mlF0woKyiYpOFfxwPiT4DWkqrAaGroEco+O
	XMkb3pEsNU5Ggg0MLlJUFktVAnfNhAS9GTNaT0OeAi0FcBatXg9FGk60bFYz17G24u/n
	ij7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UJ4etv/N4SZP7KoklY7PlOyIIGEMokQB0Szob36pw+c=;
	b=DAj9G7AOth2S3qNJg6cW40o0GdHOoBL2keY+aNbCKBtuINk5NBw55Xyzl9cIFM7GdS
	Cz3HJq2ZHBHIZgtkUjZcIUYhkxlqqzmNl1YvOpjV2G6FpyJNk4KmOiuNe0movq2ABo8I
	VT7ifXvD9PEf7gtuot4byIjTCMQySqYpoIf+f8BrhIIYxKaf1kToUuQ7suTotkBafH7i
	Xahw9XeB1dO+2wPzEenRNnUVLyGPI3rS36QiWtYWA1QMCZ//shn7RA4yhiaW9swBzrR1
	9S4j7LuEk69Jh4g3amgwIAsuY4tSRubQ3CqarolZpfRMuesgKDzOXlRKM5qnp5Du2su2
	NcwQ==
X-Gm-Message-State: APjAAAV9cOeBnE3UJAGDO2cUKsMxhZhCNIzG/0H0iWV8xcMqZdFzvIQZ
	lmf8EX0tFnsHV0zzILzyLSdE+trI4CnN+1K7u4Y=
X-Google-Smtp-Source: APXvYqzq3fn9A+qH29pKmYtX/RyPEVx4UG3M11PQ8Ta7byf8lzZkfrCap1qu0b454dAUKHk1/UIy80tnGNT8AcbOcOw=
X-Received: by 2002:aed:3f1d:: with SMTP id
	p29mr113137990qtf.378.1561050948995; 
	Thu, 20 Jun 2019 10:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190620055011.71854-1-mingli.yu@windriver.com>
In-Reply-To: <20190620055011.71854-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 11:15:22 -0600
Message-ID: <CAMKF1sog3jtW+da=UiBEAB9zq-gXNgAi0ch-5jzKT1Gba+y-TA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-lxml: replace -Og with -O for mips64-32
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
X-List-Received-Date: Thu, 20 Jun 2019 17:15:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 19, 2019 at 11:50 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> With below logic in local.conf:
> MACHINE ??= "qemumips64"
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> require conf/multilib.conf
> DEBUG_BUILD = "1"
> $ bitbake lib32-python-lxml
> [snip]
> | {standard input}: Assembler messages:
> | {standard input}:1488805: Error: branch out of range
> | Compile failed: command 'mips-pokymllib32-linux-gcc' failed with exit status 1
> | creating tmp
> | cc -I/yocto/builds//tmp/work/mips-pokymllib32-linux/lib32-python-lxml/4.3.4-r0/lib32-recipe-sysroot/usr/include/libxml2 -I/usr/include/libxml2 -c /tmp/xmlXPathInitPZiWuM.c -o tmp/xmlXPathInitPZiWuM.o
> | unable to execute 'cc': No such file or directory
> [snip]
>
> When DEBUG_BUILD enabled, -Og pass to compiler,
> replace -Og with -O to fix the above compile error.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-lxml.inc | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
> index d67c17883..dd73a412b 100644
> --- a/meta-python/recipes-devtools/python/python-lxml.inc
> +++ b/meta-python/recipes-devtools/python/python-lxml.inc
> @@ -33,6 +33,18 @@ DISTUTILS_INSTALL_ARGS += " \
>
>  inherit pypi
>
> +# {standard input}: Assembler messages:
> +# {standard input}:1488805: Error: branch out of range
> +DEBUG_OPTIMIZATION_remove_mips = " -Og"
> +DEBUG_OPTIMIZATION_append_mips = " -O"
> +BUILD_OPTIMIZATION_remove_mips = " -Og"
> +BUILD_OPTIMIZATION_append_mips = " -O"
> +
> +DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
> +DEBUG_OPTIMIZATION_append_mipsel = " -O"
> +BUILD_OPTIMIZATION_remove_mipsel = " -Og"
> +BUILD_OPTIMIZATION_append_mipsel = " -O"
> +

this is a workaround and probably ok in meanwhile. However can you
generaste a preprocessed file
where it breaks the assembly. So we can report it upstream

>  do_configure_prepend() {
>      sed -i -e 's/--version/--modversion/' ${B}/setupinfo.py
>  }
> --
> 2.21.0
>

