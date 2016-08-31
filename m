Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id D46D16B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:40:29 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id e198so11047798lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i6GMCY0M/ZdRfJGgAsTOz6XPCkkhquahKAcjKpNHZYc=;
	b=EManb29rZyTnp0uWuq0723IPmKp0WkXff9BStZmXRPWE90urUV+ACgrujPA+lF36Df
	IVYWilVvFojVE5W7YB5dm6b6WrkVuwTGBYjKnudrUaznz+FdK2ERInVboMzy+aws6MlU
	FiDtUr6qJd8OSwqLN9x+q4RoBkpCbyjNSBHwvwDwbPXXU/smOY7lkCJXdAD55BUNgUi9
	xMWbktiETY8G7Qo/i2mQVWOg0CatGxtEjC9XfOwoJVAHjC9unLYAtoKTxc+/bBv04AES
	jMDYyDbVyDluB46xbckIK29FAGLDK0XB0esStqL5qyDaz7THOJiCiy1Cne7uSEUgftc8
	Imdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i6GMCY0M/ZdRfJGgAsTOz6XPCkkhquahKAcjKpNHZYc=;
	b=esGw6LGGv1IiIlxXw/cvE65YiiMVYWOvhOW6CJrlmSvJF+B2uENLsAMGbRjLr/0c89
	jwqT2X2gWiO231GcbXpxCqKDYIo6V7BueqPUOHrEpEIP3Fi7RuC6Tw5Qe6c0Gf42uH78
	hKh7qGRu5HO8W84cWf9aGEstdeWqhsLKRJweUyZlToA0OwnbAoUsGr32ntYn59n9AX3D
	qW1Eh7T1WkDdqtGJUrTg5zeqak24KBqY0ZdS/BPKeIRMRXzB5NtIJuFNFc3/eUSlEsDU
	t8G/zmOYloimreie8s+3wl8Gy2o1UzgHwPebiZxfttdufJercIZpTbpKV4IWSCCcgBen
	1Dew==
X-Gm-Message-State: AE9vXwPQeE2eMpC/nccd8UkNxf+ZZWVHdxetVzRKKDQhnkO4+pnOO4qh5hTawnjbMQE9zuBtFLNppVL1ONHrww==
X-Received: by 10.25.147.197 with SMTP id v188mr4144001lfd.9.1472672429719;
	Wed, 31 Aug 2016 12:40:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Wed, 31 Aug 2016 12:39:59 -0700 (PDT)
X-Originating-IP: [177.100.224.8]
In-Reply-To: <1472672172-21517-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1472672172-21517-1-git-send-email-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 31 Aug 2016 16:39:59 -0300
Message-ID: <CAAPZna14W31dzA99S1-LSWqO9Jw0Uth_Di7qsKgnV2p0SqQauA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2] python-pyopenssl: Extend recipe to support Python 3
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
X-List-Received-Date: Wed, 31 Aug 2016 19:40:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I forgot to set PYTHON_PN in RDEPENDS, please apply this v2 to master-next.

Fabio

On Wed, Aug 31, 2016 at 4:36 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> - Add Python 3 recipe
> - Add native and nativesdk to BBCLASSEXTEND
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-devtools/python/python-pyopenssl.inc   | 23
> ++++++++++++++++++++++
>  .../python/python-pyopenssl_16.0.0.bb              | 17 +---------------
>  .../python/python3-pyopenssl_16.0.0.bb             |  2 ++
>  3 files changed, 26 insertions(+), 16 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/
> python/python-pyopenssl.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyopenssl_16.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc
> b/meta-python/recipes-devtools/python/python-pyopenssl.inc
> new file mode 100644
> index 0000000..ce948e1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
> @@ -0,0 +1,23 @@
> +SUMMARY = "Simple Python wrapper around the OpenSSL library"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +DEPENDS = "openssl ${PYTHON_PN}-cryptography"
> +
> +SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
> +SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5
> 163f9f702f9134f0a5896f134cbb92d17d"
> +
> +PYPI_PACKAGE = "pyOpenSSL"
> +
> +PACKAGES =+ "${PN}-tests"
> +FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
> +
> +RDEPENDS_${PN} = " \
> +    ${PYTHON_PN}-cryptography \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-threading \
> +"
> +
> +RDEPENDS_${PN}-tests = "${PN}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-
> pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python-
> pyopenssl_16.0.0.bb
> index 8173858..d7177e2 100644
> --- a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
> @@ -1,17 +1,2 @@
> -SUMMARY = "Simple Python wrapper around the OpenSSL library"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -DEPENDS = "openssl python-cryptography"
> -
> -SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
> -SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5
> 163f9f702f9134f0a5896f134cbb92d17d"
> -
> -PYPI_PACKAGE = "pyOpenSSL"
>  inherit pypi setuptools
> -
> -PACKAGES =+ "${PN}-tests"
> -FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
> -
> -RDEPENDS_${PN} = "python-threading python-six python-cryptography"
> -RDEPENDS_${PN}-tests = "${PN}"
> +require python-pyopenssl.inc
> diff --git a/meta-python/recipes-devtools/python/python3-
> pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python3-
> pyopenssl_16.0.0.bb
> new file mode 100644
> index 0000000..0f0f83e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-pyopenssl.inc
> --
> 2.1.4
>
>

