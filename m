Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2717D91B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:56:24 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w5so8098460qtb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SKwlzYrAVDrdQXV24JkbK7vK8Y+FdP7TZXwklm3zkKg=;
	b=hH6TynfAXOPxwI0CLllx2SjOTfC3/Q1ujLCkPMcsxlyQLo6qeQfvSVk+ZV5rNnGqvp
	iPk4hY4lzjtFa++D++5yH057wWHdQJynTrAVDI0+pRWSL1G/uMneebLeGnpsNsIb5RSx
	EqS8QC3SXxdPh8pYZCTrQ1ANMQI/gsgPs5zfJf0sVU23u9kdoU17+3waa6CYnA+sPUt8
	xYj0/4gK9YLlhDGGYVcRKQTRZZIaP2WU2K1Oi1eNqzdxyyjMxWKQpqJQcHY9i0P2LAn2
	tXrG3TPlTR6aDrry7aSNlrLwTJowkgT7aCXPAt/YP/LoWvzcu6pMGJcBjAAKM8n8Sa8I
	lzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SKwlzYrAVDrdQXV24JkbK7vK8Y+FdP7TZXwklm3zkKg=;
	b=rPI/3jTvJ+cCtdF4BtwEHJbQTXtLHaEgT0unFGvZL6nxbRMJtDNQ/7+Xu4JFWiEUob
	dvB9YuLQJqLgJW/VFIgD6w/qqc6IgT4bHbmI+1gKeN0NVr8elW3b5IYL9i8jXHnTdoWK
	hHAN4Gi2fkI6nDCcagRpos7SnFH9WDIhmo5s6Z1H95QcDiAVfOr9Vcswyg1wRVf+FgGs
	seNNW9mKKStyzBmwbsGDJsvQ3Pph11xztqqnexi1r/XMkKzT8Wr6L0KcKR/CIrEOMHl8
	9LeAEHMy6wfMwDgShvLVXnswyqg47UFcsqm3EhNFi3d0oS/+VVcZVXR9y3OEf3irzP5I
	ADIQ==
X-Gm-Message-State: APjAAAUqj+sD7uasDZ7qf5gIkSjN7VYjD7ivrRvEQPF0gFTBkhhLpazb
	Krc5g9LFzkQXMERmv8mfGDA35qyT+8/TLBVUsQdaFThQ4PI=
X-Google-Smtp-Source: APXvYqxZ+XA9osdUGqSLp9xeiQbdFiV3yJRUB9v2G+DZGmwpB3q5QzKhaR44rXsKfwuG7+QBHOid3FVupeyyT5oCGDU=
X-Received: by 2002:a0c:b0ef:: with SMTP id p44mr28950462qvc.127.1555005384828;
	Thu, 11 Apr 2019 10:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190410085815.8916-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190410085815.8916-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 10:55:58 -0700
Message-ID: <CAMKF1spAA5evfdzxcOpaXr0dRztPvwMZnvXa6E=wQct-_iLipA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-cffi: upgrade 1.11.5 -> 1.12.2
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
X-List-Received-Date: Thu, 11 Apr 2019 17:56:24 -0000
Content-Type: text/plain; charset="UTF-8"

Please upgrade python3-cffi as the same time as well

On Wed, Apr 10, 2019 at 1:57 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-cffi_1.11.5.bb to python-cffi_1.12.2.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cffi.inc           | 4 ++--
>  .../python/{python-cffi_1.11.5.bb => python-cffi_1.12.2.bb}   | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cffi_1.11.5.bb => python-cffi_1.12.2.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
> index e6071eeca..069aba008 100644
> --- a/meta-python/recipes-devtools/python/python-cffi.inc
> +++ b/meta-python/recipes-devtools/python/python-cffi.inc
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>  DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>
> -SRC_URI[md5sum] = "ac8492f4ad952360737413e82d661908"
> -SRC_URI[sha256sum] = "e90f17980e6ab0f3c2f3730e56d1fe9bcba1891eeea58966e89d352492cc74f4"
> +SRC_URI[md5sum] = "4d7dcb6c7c738c15d2ece9bd4c5f86da"
> +SRC_URI[sha256sum] = "e113878a446c6228669144ae8a56e268c91b7f1fafae927adc4879d9849e0ea7"
>
>  RDEPENDS_${PN}_class-target = " \
>      ${PYTHON_PN}-ctypes \
> diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.5.bb b/meta-python/recipes-devtools/python/python-cffi_1.12.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
> rename to meta-python/recipes-devtools/python/python-cffi_1.12.2.bb
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

