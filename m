Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7CF6B06C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 04:44:51 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id x134so23242584qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O2zoBF0CZVbar7k95RN+GkIR/O5TG9efcgFfhdsuCQI=;
	b=fWhjA1U5EZGxIpNoFM1Iz+Ax96lFFHmcIw0kyCMb1pYnFl70fkVo1Ix3MMqLFCtxUn
	5f4sPMN9i2s6HvHsuN5VGHr/f6w4sejnde1/W4jflSDZ3JV2/TJbwIAtBuGcBfZyzhRG
	cz9YqTRq9IWhnLdcmORStIIERMxSvwSNNtHPw9iVjsRVn6eiISJjKvZwK4XNevjiszBG
	Rw63DgwklgE+NkH998gNvFHdeeJum7F40lSAoznNK4EUzxpPjtvVlF7NJLijug0PbPFg
	1b8eY1yyDPNYAbLchv6YHkRA3Dcm5gGyMlaeS+ScXwo+s3AqddcUjxfirPREduts876f
	yK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O2zoBF0CZVbar7k95RN+GkIR/O5TG9efcgFfhdsuCQI=;
	b=acT8vEgllWmcH/h/c85QxZ5T5H3ik2IyaCjoUlrWVHIVvQWEStlN1rzm86NVJbDAEO
	0qoVAummvAPJoG+t8kCd2V4sFDvPC6NcJRt0tThMZ+2K6KoF14FFAlOxoGUCkRY7on/T
	HAkBAuY8slNlFtlxnYy3UyKaTZblSpba7i63oT+z+S81Qjwo5i9Ucv6Ve9Hezk2bwU9f
	ShHP3FCRLFrOymqoCtoSBYRpkBQJGcBklp0P9g8yyVNL/LtQ+Ik1wQkV2kvlTvDOIG0M
	sk3GOLvNNRambCH7K5sUKzC6c8lidGYUcFOvExM+t2EJvCcOqpi5s2hQrBw7thoP1x47
	rwBQ==
X-Gm-Message-State: APjAAAUcXWXLZKQ0opKT7ILXpZ0pjAyDokAm4P8RCaMYRJPVU3nvoFN0
	gVczL/BhL58kx7pIsouki3YtD732xYwNTdRTeyo=
X-Google-Smtp-Source: APXvYqw4jtB/vVxe8L64pWTXO4gtQDc26RBT7frQ41Z4jtcWjMmVnZJsP+VUwUzTaa+GeZQQJE0Mu+GY2DNRzxv8IY8=
X-Received: by 2002:a37:6651:: with SMTP id a78mr26561138qkc.474.1568263492530;
	Wed, 11 Sep 2019 21:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190912013354.2924-1-anuj.mittal@intel.com>
	<20190912013354.2924-2-anuj.mittal@intel.com>
In-Reply-To: <20190912013354.2924-2-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Sep 2019 21:44:26 -0700
Message-ID: <CAMKF1srcuBMHGVuNQ1E7hwWamPkg4Svo5i5dy_SMCM-5-WFmjg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-networkx: add recipe
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
X-List-Received-Date: Thu, 12 Sep 2019 04:44:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 6:34 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> networkx only supports python3 starting v2.3. Move the common code to
> .inc and remove python-2to3 RDEPENDS which is no longer needed:
>
> https://github.com/networkx/networkx/commit/4e611d7ea90c20864daba912d6118220d5bbddf3
>

this patch does not apply cleanly. I think it would be good to move
both recipes to 2.3 if possible.

> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../recipes-devtools/python/python-networkx.inc      | 10 ++++++++++
>  .../recipes-devtools/python/python-networkx_2.2.bb   | 10 +++-------
>  .../recipes-devtools/python/python3-networkx_2.3.bb  | 12 +++---------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-networkx.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
> new file mode 100644
> index 000000000..a4c31b2b2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-networkx.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> +LICENSE = "BSD-3-Clause"
> +
> +inherit pypi
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +RDEPENDS_${PN} += "\
> +                   ${PYTHON_PN}-decorator \
> +                   "
> diff --git a/meta-python/recipes-devtools/python/python-networkx_2.2.bb b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
> index a2381661c..648f0312f 100644
> --- a/meta-python/recipes-devtools/python/python-networkx_2.2.bb
> +++ b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
> @@ -1,12 +1,8 @@
> -DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> -LICENSE = "BSD-3-Clause"
> +require python-networkx.inc
> +
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3376ff7c9c58048c62d91431f7f08cde"
>
>  SRC_URI[md5sum] = "82608a3686fb3e61f20cf13bfd3c1b4a"
>  SRC_URI[sha256sum] = "45e56f7ab6fe81652fb4bc9f44faddb0e9025f469f602df14e3b2551c2ea5c8b"
>
> -PYPI_PACKAGE_EXT = "zip"
> -
> -inherit pypi setuptools
> -
> -RDEPENDS_${PN} += "python-2to3"
> +inherit setuptools
> diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
> index da844ce1e..8feb6daa3 100644
> --- a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
> @@ -1,14 +1,8 @@
> -DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> -LICENSE = "BSD-3-Clause"
> +require python-networkx.inc
> +
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
>
>  SRC_URI[md5sum] = "320d3f6c7872732baa63cedafddadea9"
>  SRC_URI[sha256sum] = "8311ddef63cf5c5c5e7c1d0212dd141d9a1fe3f474915281b73597ed5f1d4e3d"
>
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE_EXT = "zip"
> -
> -RDEPENDS_${PN} += "\
> -                   python3-decorator \
> -                   "
> +inherit setuptools3
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

