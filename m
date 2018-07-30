Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id A56C478D5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:04:31 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id h4-v6so10747940qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B3eaUjWihKN555Y+IREz4wiN+QfGSWxTAndmbRc5m0Q=;
	b=OttfFaEhRCeeHHFmw4RODBl8EUVxHgivyNmB5ggscZuPS3snF2TtToClahG2FY60I1
	traIXrpC6Kv+vU8cwPiKU+8ab1Ep5fzc8N25WuIdg70gL1nQCSvlamlF3B3H8W/iGz+u
	7v/xSvOGaDuyTAoL645DFcml1RhQn5LfETpYOiqEVbSduX0RsY+Ip5m4jKRygR+o2BZ5
	Urhjb9r/LLEKrcI7YJHYtQtgatHcYRqRf5A8ZOeqCFNZsSX49Rg5Sy8r2GZclQa1d/17
	O/JxFn2b4tIpTvz+Mo17G27knMMEen3CkEkNQLrd23Kha0xRrsv694EkDPIMsn/8228f
	M2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B3eaUjWihKN555Y+IREz4wiN+QfGSWxTAndmbRc5m0Q=;
	b=ukYS5ynROALGmv0CnsRaXNDOBtdGzngV2mBywimgBlsmD0a8D9O4tJfwa02gy+dE1y
	F9ihcvlNQLpTc6LqVTf3wguOd1SyoBzKUr3V6AFKH6dpwUpkx9pw7tg7B9cXcd3CJeDZ
	JyYL/RUcUInxumzCR4H59SlDVcrcxVmf2yX4DtJalcoUpa7Dz8GSCPRbmpmRh4C5EvwY
	R7XI/cBbEOXh+siaAoXAGu/M7l/qwGHjMfm5AFbMdU4HNYS4IiBphC8dCYZJucztuQ7p
	Hj9uuZoQaWjUnkFZ8G8qhOoOJTIRSjZppdFg60ZPM0BK2MpHTo2z1xGH9WlWz2wr+9xR
	klZQ==
X-Gm-Message-State: AOUpUlHcKPgVSmtU82Mj5Bvwgt8hBvBl0tJkNRI/BYA+JLVywn7QrdRY
	TbinEqGbo+OkgGNoapoWOJrvbCHH44wKSB8/jZEFRw==
X-Google-Smtp-Source: AAOMgpcKTLvondVx4pk6Orlh8zRuIRNTW14mMqQGJ0zJcUbmEdzaSbwYVKliPjqyEE/dOQBg7c7EEs1MSBnxeV6cJAw=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr14968730qth.188.1532923472397; 
	Sun, 29 Jul 2018 21:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
	<20180730021613.26889-4-robert.joslyn@redrectangle.org>
In-Reply-To: <20180730021613.26889-4-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2018 21:04:20 -0700
Message-ID: <CAMKF1sofxPet_J6jLsAHuJhFv+wDs5aDGjM02+UK9YdoDGwxkg@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 4/5] python-parse-type: Add Python 3 recipe
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
X-List-Received-Date: Mon, 30 Jul 2018 04:04:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 29, 2018 at 8:37 PM Robert Joslyn <
robert.joslyn@redrectangle.org> wrote:

> ---
>  meta-python/recipes-devtools/python/python-parse-type.inc   | 11
> +++++++++++
>  .../recipes-devtools/python/python-parse-type_0.4.2.bb      | 13
> ++-----------
>  .../recipes-devtools/python/python3-parse-type_0.4.2.bb     |  2 ++
>  3 files changed, 15 insertions(+), 11 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python-parse-type.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-parse-type_0.4.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc
> b/meta-python/recipes-devtools/python/python-parse-type.inc
> new file mode 100644
> index 000000000..a4d9c0719
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-parse-type.inc
> @@ -0,0 +1,11 @@
> +SUMMARY = "Simplifies building parse types based on the parse module"
> +LICENSE = "BSD"


Can you make is specific here as to which bsd license is in effect here ?
Now that you are at it

>
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> +PYPI_PACKAGE = "parse_type"
> +
> +SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> +SRC_URI[sha256sum] =
> "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-parse"
> diff --git a/meta-python/recipes-devtools/python/
> python-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/
> python-parse-type_0.4.2.bb
> index b516c5912..8e10e801c 100644
> --- a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
> @@ -1,11 +1,2 @@
> -SUMMARY = "Simplifies building parse types based on the parse module"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> -PYPI_PACKAGE = "parse_type"
> -
> -SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> -SRC_URI[sha256sum] =
> "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> -
> -RDEPENDS_${PN} += "python-parse"
> -
> -inherit pypi setuptools
> +inherit setuptools
> +require python-parse-type.inc
> diff --git a/meta-python/recipes-devtools/python/
> python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/
> python3-parse-type_0.4.2.bb
> new file mode 100644
> index 000000000..91d9ce2d4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-parse-type.inc
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

