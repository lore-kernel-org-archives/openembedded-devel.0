Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1069F7DF0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 15:36:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id o7so15251002qtp.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jv6Kj1DdQDbaowC/rJYDWZNd2qCVW6/tzD+kcUkB4BM=;
	b=AKTXoYwv/9b3VfWNd/eS9PpCm+L8nq6zoRZx4DKeVYQ1ZC2Qxbq3mPaGipHg5N7OSb
	RNskk4innMljqu0QKylNC4O7igb0Vi/ktTGr5/661F+EDGHulj3T6341KRurrM/DJQHA
	A7zxY4ZR4Qs+GRt4aLFZM/HPHpEV0EBAImSnqjE0qLbCCGBts3fdJecuNXzFDl59Zy2r
	Uih3J0WbICQgEK7ixpYlxHHhsyNTeDh88CnHC9nvFVzSapTz1+9PTM6biIVp3ni103KI
	RnxUtkEMEzI6LsbGBpcd2O2LqGin1IIXc5Q/UKeClFpn82sGK50ToKKT9WmDGEnbOToi
	hZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jv6Kj1DdQDbaowC/rJYDWZNd2qCVW6/tzD+kcUkB4BM=;
	b=lwn8+CuAysCzAF1dtlNn6k5XEAo+03r3/jIwid0yg/+GvpuRaJsXdNY+XPVyXQ+O/V
	XDVwxN5gncFpDoTUYTM3K9cLcR8gDH0oGkjoX6D9FGeuAWL4lpykLDfeuINNipdrGscE
	SAJfiIqVbL4wXcgNiIH00p99h+2ckKIK3YyDnswfnANI2vnPzTRh/VKtNEG4OnFRAVG5
	9sHn9SIQrr0M79jP7B3mA82aQohAiosdrT4uDjE50XEGNad8QnPgQdZ7k9LPICjVj6TO
	mDhRuTwPt39nF7MYkbcV32xa5SUL1wjrHjDlAfTZTOGqgk1ENak1WlUVu4XLYEBMyrWI
	Yp9A==
X-Gm-Message-State: APjAAAXSCgIkW48VXyOdnt/bqD4hP8mftX0hMhm3l7MXB+D0GcjsS22I
	T4ECibY3t0TM7M+kztclEjuJpcnH0RuxufjAeq4=
X-Google-Smtp-Source: APXvYqx7oB5noX8FdJICffxBACDqVEywCENYuOmipr6YCK86USwT1UReWNz1QkuU+c4aTSeQPyx2Jh9AblyToRki384=
X-Received: by 2002:ac8:3f81:: with SMTP id d1mr24287564qtk.254.1557761811688; 
	Mon, 13 May 2019 08:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190513052903.2318-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190513052903.2318-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 08:36:41 -0700
Message-ID: <CAMKF1sr21rPHTwVUriZyB2ciBovMY2SJbVkBzzbfHH1CttxC7Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-pyparsing: upgrade 2.2.0 -> 2.4.0
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
X-List-Received-Date: Mon, 13 May 2019 15:36:51 -0000
Content-Type: text/plain; charset="UTF-8"

Please add a line to commit msg describing why license checksum changed

On Sun, May 12, 2019 at 10:28 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-pyparsing_2.2.0.bb to python-pyparsing_2.4.0.bb.
>
> -Upgrade from python3-pyparsing_2.2.0.bb to python3-pyparsing_2.4.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-pyparsing.inc    | 6 +++---
>  ...{python-pyparsing_2.2.0.bb => python-pyparsing_2.4.0.bb} | 0
>  ...ython3-pyparsing_2.2.0.bb => python3-pyparsing_2.4.0.bb} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyparsing_2.2.0.bb =>
> python-pyparsing_2.4.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyparsing_2.2.0.bb
> => python3-pyparsing_2.4.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc
> b/meta-python/recipes-devtools/python/python-pyparsing.inc
> index e30839f87..e0df4e9b8 100644
> --- a/meta-python/recipes-devtools/python/python-pyparsing.inc
> +++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
> @@ -1,10 +1,10 @@
>  SUMMARY = "Python parsing module"
>  HOMEPAGE = "http://pyparsing.wikispaces.com/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
>
> -SRC_URI[md5sum] = "0214e42d63af850256962b6744c948d9"
> -SRC_URI[sha256sum] =
> "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
> +SRC_URI[md5sum] = "e534c0ca755155823bf45fdd8d084922"
> +SRC_URI[sha256sum] =
> "1873c03321fc118f4e9746baf201ff990ceb915f433f23b395f5580d1840cb2a"
>
>  inherit pypi
>
> diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
> b/meta-python/recipes-devtools/python/python-pyparsing_2.4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python-pyparsing_2.4.0.bb
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyparsing_2.2.0.bb b/meta-python/recipes-devtools/python/
> python3-pyparsing_2.4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyparsing_2.4.0.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

