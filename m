Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB5257D428
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 18:33:59 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z16so16717871qtn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=clxCLxCUoGISLv7FtQDCjvT4TvbI7Exhmtq5lSVzAAg=;
	b=pfM/Fo0MIjuDIVSOJ25xz51olvidPmOGGUUjey3LOR85FRbfBWUUGwwfgD2rGVCNIn
	FdMCA0WQFyN+//48uuZ5yP+t/MQz9fqMkurzONqs4L2UAYvxnedbf60+qGZBs4gyoih0
	JR05+v2QpMQuRabM9JAHYYI2Eu4GbH0jHLrrSr7IKvWBSF1A3ccU71tyXFg8DVDGLBI6
	rWKHtSHYZWoUvTA94BYCnjJb+3STvjXPjsrLRqN5Xn7SkJFNELUFUcHek8ndaUV6pU1c
	DLarItH6NlJf+A3JYrw519IQw+IfDfgbybSc8gNg5yyPUNE/szDguGLBdql63wg3bcOX
	LQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=clxCLxCUoGISLv7FtQDCjvT4TvbI7Exhmtq5lSVzAAg=;
	b=sXRygYQdAaEkaYIDkzsxUVdwJprGobu0N8CVCTYf/p8wQfgb3BsH6yAYIJwm4cTlv0
	w+MJ84/YGBTDnt4/6b6cHW6nYGubjtVpNjfd5/RxydvsJqfcolf36h29EbIk9i68dMah
	ykPUIiwXt3Ou3UpQ1wEwotPlwYkKBv8JvL/xhIDs1Y1w/5KJFAeRiD/xQiqz+4aowjV7
	vhqm0Ait+1DDoFnOgyvCA7OM0Jba4YuJwYUGIjE9yGAGMVvnZ6Nl+2th9ycV/lIOFyPW
	M21F1Azo+F3VEMtaPamphcqaIeLZs3aDTfFRrzbyLhU2okcjzp8UsFLif7CLr+/Y4iMA
	coMg==
X-Gm-Message-State: APjAAAV3d8DLiERtteJ+KcVvlBHMfwi/ddfurGAfBfSmZQBGohfsqgGL
	du+7I0vhV9oBXr+c21EdXxNAUSRqorZdxQrVtbU=
X-Google-Smtp-Source: APXvYqzNC6XfMi5AuiHFMl+OjDf9DSVvmwUI4eHseuwlozAgzqyX/xKz6y6vVmNbt8Vm9+xFe+e9ji5dKdctVKU3WMU=
X-Received: by 2002:a0c:c988:: with SMTP id b8mr25063980qvk.33.1554748440252; 
	Mon, 08 Apr 2019 11:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <1554730145-5313-1-git-send-email-cdgarren@indesign-llc.com>
In-Reply-To: <1554730145-5313-1-git-send-email-cdgarren@indesign-llc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 11:33:34 -0700
Message-ID: <CAMKF1spGLsV03xo+O-q8mJDWvY=Do_4ynnECVy95Q3K_KUfRkw@mail.gmail.com>
To: chris.d.garren@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-cryptography: Move linker flag to .inc
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
X-List-Received-Date: Mon, 08 Apr 2019 18:33:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 8, 2019 at 6:29 AM <chris.d.garren@gmail.com> wrote:
>
> From: Chris Garren <cdgarren@indesign-llc.com>
>
> Move the -pthread linker flag to the .inc file because it is
> needed for python 2 & 3.
>
> Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
> ---
>  meta-python/recipes-devtools/python/python-cryptography.inc       | 2 ++
>  meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
> index 2c1ac1c..d7e5ae9 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography.inc
> +++ b/meta-python/recipes-devtools/python/python-cryptography.inc
> @@ -3,6 +3,8 @@ HOMEPAGE = "https://cryptography.io/"
>  LICENSE = "Apache-2.0 | BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
>
> +LDSHARED += "-pthread"
> +
>  DEPENDS += " \
>      ${PYTHON_PN}-cffi \
>      ${PYTHON_PN}-cffi-native \
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
> index 1959233..f64e51d 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
> @@ -1,8 +1,6 @@
>  inherit pypi setuptools3
>  require python-cryptography.inc
>
> -LDSHARED += "-pthread"
> -
>  SRC_URI += " \
>      file://run-ptest \
>  "

I had to munge it a bit.
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=2be016ee8f5260f67edcfe434ed70569fced56e0

