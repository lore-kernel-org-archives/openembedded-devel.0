Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 148FB7F8FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:09:21 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o49so28766928qta.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XAPgIWFOjD4uObDAQu8RjgJeFRT1pUfbWRMPz8sgPU8=;
	b=uoIMbwvAA7w9rkDMnf9xo8X2f6jCkog6bBAKqhfgnYlbl0jCF3cqf1jV/uKTCRK+xH
	1wyNL91EfKR8iKv343yNAKuw895ThN+keHfLJx45Njo2BXSN8xCjIJZNvufqPx99une5
	MWYQC9RyVDHtXubIhyMx4QcH1Yt3HdpYiwU+nwSVWmyBR/1RIPa4tZpO4F6MOqZfwpGf
	G9w7o/70uOTIf4bmXe+PnjppaGIY9JNK84nZfCyUXHQU83ukQXTjVi9lZ8p/7lFeNREo
	Dnhz/7ihTjed1fnrvWYdVu6G6E1FfMhzrBM9okLq7GHS4x5IO8tQoTpSXgX83Av/keth
	qkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XAPgIWFOjD4uObDAQu8RjgJeFRT1pUfbWRMPz8sgPU8=;
	b=ZB4CXD/V0JZCuQUXkZCO5FYRkJeMOKBgEKkBysVdRCEwbB/TmHEAF7bR3KVAr29TGV
	9G5NwW+XEiSdn+YYWVVZE1Mze0Fy8cIGyR5a8XaIutkseZ9Y1Q712V1x/eN/6UgPFHuz
	VQRsEvikL0fxN1YEBCqnYGLOsW7QkdzwB6JQSvB+t1kfSaiEkmfPpMnnVkM0XRlhBTLp
	mjcOmy5JdLbmIhWQsvM4bOdSOorIsN1g65nOHOC8iO7IOOYSyVEQK/k7kswTeC2upjgi
	poPqDZiaG9WaJOj3SVD/UydrQnZycoglH9Zx4Kx5ZVcpg2B7v4mvtPthxYALD+chbNPD
	PCLw==
X-Gm-Message-State: APjAAAUXyZuvEgeF5tYrxhciUxtrUmWdy6Cbc774jsdVs7RfvTg/9O1q
	OgLWb7ZVQ76/XKun1OVOPFoQ65ke9Y4VoYqFAzZvfMeKg+U=
X-Google-Smtp-Source: APXvYqzYMiH90pyL/5nPxyFy446wWVlWewNcLbPRWcsbYKADEeebY0/Brs5P5t/ikycvlaZ0p2DG8NAUTsXjveyrMt8=
X-Received: by 2002:ac8:7617:: with SMTP id t23mr2780086qtq.88.1571904562479; 
	Thu, 24 Oct 2019 01:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
	<20191023211702.15125-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191023211702.15125-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:08:56 +0100
Message-ID: <CAMKF1spggrFn1Oz1sXY7PqUW05q6D2kUk9xMfpbQQtezCRpL8g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python3-astor: Fix issue with new version of setuptools
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
X-List-Received-Date: Thu, 24 Oct 2019 08:09:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

there is a upstream proposed fix as pointed by Adrian which I picked instead

On Wed, Oct 23, 2019 at 10:17 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../python3-astor/fix-new-setuptools.patch     | 18 ++++++++++++++++++
>  .../python/python3-astor_0.8.0.bb              |  3 ++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch b/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch
> new file mode 100644
> index 000000000..90defe25c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch
> @@ -0,0 +1,18 @@
> +New versions of setuptools can't parse this expression. We know our python versions
> +match so just remove it until upstream fixes it.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending
> +
> +Index: git/setup.cfg
> +===================================================================
> +--- git.orig/setup.cfg
> ++++ git/setup.cfg
> +@@ -34,7 +34,6 @@ classifiers =
> + zip_safe = True
> + include_package_data = True
> + packages = find:
> +-python_requires = >=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*
> +
> + [options.packages.find]
> + exclude = tests
> diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
> index c2dc9245c..97dbdbbea 100644
> --- a/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
> @@ -4,7 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
>
> -SRC_URI = "git://github.com/berkerpeksag/astor.git"
> +SRC_URI = "git://github.com/berkerpeksag/astor.git \
> +           file://fix-new-setuptools.patch"
>  SRCREV ?= "4ca3a26e52f08678854c2841cd0fdf223461e47d"
>
>  inherit setuptools3
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

