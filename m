Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D81A678EFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:38:22 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id k38-v6so4436844qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A8PtB0uSuyNHiHCi98FD0kv62PGdsBCUUmwFF1zgZyk=;
	b=b2KksTePTu1pJhCOAIZTA8F4D1+XUbe0xSP/hJ4zbY5kl3ojchTrE06PhtGMpVhztG
	EbBBR1ThlneBowx5Gt4jt2ye3cDx8MlupSvjDL8dQaH13q1bZ4WoYqS+KiZYnujwVFfr
	LZbSoh0aTcj9uVRjsPUzoiynvts5GLAlpvcqESShN+XqFkMiwlLJlAh1FcjxUdubx64G
	Zw2HOyNe60Dqkq+MVZ9rU6Pui3QEAasC5wwlKA3AKWQSbApU/74EcTnuvam1+PkxHQYy
	YaJeuTcPwuefTiG213cjXoFvgniNOBFDx2SrQs16pGX4bmCZef7MJBj2AQ7AfDXgzOZW
	sa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A8PtB0uSuyNHiHCi98FD0kv62PGdsBCUUmwFF1zgZyk=;
	b=CnM2qIuHPwDoXVyxfwf7I/QohD4vR+ikYaxBBQ/iEK1QDUGKu+qQvc1TQrNGhaDSvF
	xnpfkOppYB5cXMOUfxmojhc143x3TKHNwdLoffeccxurFQ/DF6pjcMOYUHVSRmzhcZRE
	F4/owlK7OlHHKJoFzHzN1NByqXEE+PQSZ5gvmzmqC5vK+qGJW5ZKwH4pSmxn8tno9zjx
	lhTwRiA5Fi0P2ddhtCgdKbeGyHKJ1RBXC2VAjGT68QjHpJjVrpcbZqXVC3sdefGxujhp
	s9p/jj2jYR2cea/tyGABlMPokjwCZ3qIG0nF+FZ/3l2ffNaqTY913rEhW1Y1VKJZWp+L
	w9OA==
X-Gm-Message-State: APzg51DNcRiFO9S4eY6bYybqbwo9c87UpcE4T6uqDqv7TDex5vEbZOvC
	cWetiJBMF20m3imn41O/H4kAYRCERTzMmJp2Tl0=
X-Google-Smtp-Source: ANB0VdY6BuupHHimOVdG0qjCv6fC7GJCbSiZ0VgXiz+Bg9FyBPfq7vqCBINFAdr8EV7VbZkbahvpP1NWbzEgq6tYYuM=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr14409666qvk.228.1535387903480; 
	Mon, 27 Aug 2018 09:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180827123338.7571-1-adrian.ratiu@ni.com>
	<20180827123338.7571-2-adrian.ratiu@ni.com>
In-Reply-To: <20180827123338.7571-2-adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 09:37:57 -0700
Message-ID: <CAMKF1sqNPEsJPsr7eQK40NW7-KHTO5iEq-Ph+S2dkktj72FfoQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/3] python3-pytest-helpers-namespace: add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 16:38:23 -0000
Content-Type: text/plain; charset="UTF-8"

this patch seems to need python-pytest-helpers-namespace recipe
and it does not exist. have you tested these patches on master
On Mon, Aug 27, 2018 at 5:32 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>
> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../python/python-pytest-helpers-namespace.inc        | 10 ++++++++++
>  .../python-pytest-helpers-namespace_2016.7.10.bb      | 11 ++---------
>  .../python3-pytest-helpers-namespace_2016.7.10.bb     |  7 +++++++
>  3 files changed, 19 insertions(+), 9 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> new file mode 100644
> index 000000000..a69867d91
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
> +HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
> +
> +SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
> +SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
> index afca48702..2b6ee8550 100644
> --- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
> +++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
> @@ -1,13 +1,6 @@
> -DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
> -HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
> +require python-pytest-helpers-namespace.inc
>
> -SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
> -SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
> -
> -inherit pypi setuptools
> +inherit setuptools
>
>  RDEPENDS_${PN} += " \
>      python-pytest \
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
> new file mode 100644
> index 000000000..f03f5d415
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
> @@ -0,0 +1,7 @@
> +require python-pytest-helpers-namespace.inc
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    python3-pytest \
> +    "
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

