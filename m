Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id D31497F27D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 15:02:00 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q22so894699iog.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cWGtdIgV8jPG3mllpt/zgmytTuXemHA1kLF8i+o+b5U=;
	b=tRoPvTdvmYHqpZ1Ffs/ihOr+6hh8rUpgEN11jKncgBaJRYPFizR2wDj7yOkqnZpb6i
	lOMakaaCe4DPayt/+b6RwvJAjiu+YnQtP/kku7RIGNYxb7v+UZ4GnjbiB5ij1lTrBNwJ
	AhCJYkH1bKrmEHmUeGA2oMSW/+OoAZmY5Wk4+0kngVXTP2RToPJXgPxTWQBw6XS+X5xJ
	dVbPlaQYnNnaGSliKeUlVyVzECDki28MUAImKLm6mQZxY2XiGzUsSO2h7MtDEkjrizbW
	q1REqxyq2buUmZJVEzArYYgv08Su6yyKpejCvgTYyzu7TLThDwEJioHkzYDxfahZHIdZ
	Rgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cWGtdIgV8jPG3mllpt/zgmytTuXemHA1kLF8i+o+b5U=;
	b=gDJY3HB1X6r6oB6tjVuY5S0BM8VOWKRWezMxe1D8E4cj/z0Ri7k3goCCTGQkrQ9bLP
	ZHqm0bI6lVAvMBTRQW/eOjUoTIvcaljMYSxa76j8oVXZ5S0y1nCfY4rwUP62ieroN+f/
	x3IA7z8qTb+Jjwh+F56AEzdcZ+iwVLiS4DAxxoiuHJw/wOC3kV8zigNCPTYuY307GxV4
	xF25N8K/bLOZ6yo6lBrWliE5kZ00UELkHdKC4Jb759+/jnVMiJddm8fNccnqQaUYSKr/
	SjewPju6OhikjU63Ie1rBeCMxU3e0qwaR+MxzGbacuytdi47ny7B030GRCMPK2KrVHjw
	ouvQ==
X-Gm-Message-State: APjAAAU3t7XB1Bz+SH+iRr715eStP+Hig4OQTJx/rN5G5r4x+iykklGZ
	q4gWO1Awpr71rz1Q7UEu/CCTiTuacWqrxnl+kF4=
X-Google-Smtp-Source: APXvYqxH4BOP8pK3sy6ufDLAKRvTgxf1IELkW2DuVxoal2YnVCkEZ8F/5t1j+/eDo7JVk55UJOIC/JBAGvL6P2R2y7M=
X-Received: by 2002:a5e:a712:: with SMTP id
	b18mr100071896iod.220.1564412521309; 
	Mon, 29 Jul 2019 08:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190727203020.30368-1-brgl@bgdev.pl>
In-Reply-To: <20190727203020.30368-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2019 08:01:45 -0700
Message-ID: <CAMKF1spcBm6CRL10TxFjSL4GOxgLBzk5EaA7PKFnLF12N0y5RA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libgpiod: put gpio utils into an actual separate package
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
X-List-Received-Date: Mon, 29 Jul 2019 15:02:01 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build

https://errors.yoctoproject.org/Errors/Details/255488/

On Sat, Jul 27, 2019 at 1:30 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Currently tools are built conditionally depending on whether the
> corresponding PACKAGECONFIG option has been set and, although they
> live in a separate libgpiod-tools package, the user cannot simply
> select it - he has to additionally extend PACKAGECONFIG. While this
> makes sense for python and C++ bindings, the tools don't have any
> dependencies other the libgpiod. Make libgpiod-tools an actual
> stand-alone package: always build them but install them only if
> user selected libgpiod-tools.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> index 89679cb91..07ce35a7f 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> @@ -8,11 +8,9 @@ SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> -PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
> +
> +EXTRA_OECONF = "--enable-tools"
>
>  PACKAGES =+ " ${PN}-tools"
>
>  FILES_${PN}-tools = "${bindir}/*"
> -
> -RRECOMMENDS_TOOLS = "${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '',d)}"
> -RRECOMMENDS_${PN} += "${RRECOMMENDS_TOOLS}"
> --
> 2.21.0
>

