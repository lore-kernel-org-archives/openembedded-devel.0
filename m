Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C88A97F8A6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 19:46:11 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e6so5945962pgi.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 11:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7WvAtC6kI5wuexXVWfMSrFpS9IdTBdpTWH5A3wwpK2E=;
	b=OaZ7FxMP2DYgX/PIPd7sQfOeOBYztPQKiqgNeH79wEaEs/qWNIkPf5o0ztGcyUnASo
	wwsU4sJtuB+NibR9fQdTGq62vLqwzTpn5CtmQ7zYSnkFnlgDPKausMweRQM44Ll0DI6e
	QwOq7utToH26u4VBGzg7FD+B98Nqmd3aWnPhkLjOeHxwZsCdRnbWXanROBwABXewOAd8
	Vwap4cEWTaiyX1ZUZcvy1hnQOkvijOm+Ko9ABDypYmJTbQL0ODF8+VzszEU8ZTGnvTPO
	gZFWVdHW+R5J1wRyjROc09WHJSfxoGNEm+6EBW5dafkhDAA9L+8i26Th1aOCg6jwz8rj
	s53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=7WvAtC6kI5wuexXVWfMSrFpS9IdTBdpTWH5A3wwpK2E=;
	b=XL2fq2pQNlnGtx3ROrE7tV9ukmf284jdXPM7z8tnBD0TbvxDCZNtTGJlneMuTWudmg
	tP1PV9/FAkCdCaPYAH3XG/+nU+G/yK4Fgauw44fXfDdTsST84PySJxtLGDoHQ5BIGkVr
	XCDD5q2sRzO2bDCHiqKbOmWr+mSin0lIVpP9AM5MuzDvf92RHfmDTTniHMKlA7yxE6XY
	QeaeaaEM4VL86vZcDFMSH3L9kQ3dzSl2DJ+6A0eXmrEuuWRt6fbEOrlvjWSEXl5Rj8Zq
	pOhDgozAULhq7q+8PUjwXh3+3FENeoKR/Azxg0m/7slFJN4/szwDSUI6ePBPkeexom3+
	FJGw==
X-Gm-Message-State: APjAAAV2NcuIBbBB4QXmPTg5nCFCxqGB3EFdksGVT+0QO4HgXSScn/58
	SH+dJG/BVwr4tAS+GEUATKwu+NX4
X-Google-Smtp-Source: APXvYqwIApTqiWbJKjjGQLKe1IlBpjCekLp2iuMHzr0MY0D+naBdFwOMGokdALc9OVB98oRO+YpjAw==
X-Received: by 2002:a63:4b07:: with SMTP id y7mr28081985pga.373.1574624772363; 
	Sun, 24 Nov 2019 11:46:12 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:69ac:e4d2:e89f:98da?
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q34sm5493838pjb.15.2019.11.24.11.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2019 11:46:11 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20191122163045.11693-1-bunk@stusta.de>
	<20191122163045.11693-2-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <601a0b5a-876d-a457-f203-d6894c14fe8b@gmail.com>
Date: Sun, 24 Nov 2019 11:46:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122163045.11693-2-bunk@stusta.de>
Subject: Re: [meta-oe][zeus][PATCH 2/3] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Sun, 24 Nov 2019 19:46:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/22/19 8:30 AM, Adrian Bunk wrote:
> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> Python 2.7 is no longer supported. The 5.0.0 release will be the last
> version targeting Python 2.7. [1]
why is this a zeus issue? Zeus core is still supporting 2.7. Please clarify.

- armin
> [1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-devtools/python/python-more-itertools.inc        | 3 ---
>  .../recipes-devtools/python/python-more-itertools_5.0.0.bb   | 5 +++++
>  .../recipes-devtools/python/python-more-itertools_7.2.0.bb   | 2 --
>  .../recipes-devtools/python/python3-more-itertools_7.2.0.bb  | 3 +++
>  4 files changed, 8 insertions(+), 5 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
> index 8d814a6f0..33095b3d3 100644
> --- a/meta-python/recipes-devtools/python/python-more-itertools.inc
> +++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
> @@ -2,6 +2,3 @@ DESCRIPTION = "More routines for operating on iterables, beyond itertools"
>  HOMEPAGE = "https://github.com/erikrose/more-itertools"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
> -
> -SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
> -SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
> diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
> new file mode 100644
> index 000000000..c66e55cac
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
> @@ -0,0 +1,5 @@
> +inherit pypi setuptools
> +require python-more-itertools.inc
> +
> +SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
> +SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
> diff --git a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
> deleted file mode 100644
> index 0702aad4e..000000000
> --- a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools
> -require python-more-itertools.inc
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
> index 28ddf88fb..06d45ce54 100644
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
> @@ -1,2 +1,5 @@
>  inherit pypi setuptools3
>  require python-more-itertools.inc
> +
> +SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
> +SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"


