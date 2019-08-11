Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7F816BC19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:13:36 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d17so21545764qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wZjQxmO6OXosgBlOQ3nFojC883akrX69uzb61KQolfM=;
	b=SfUJoTz+mdvyU0BpDThbzDalbESV4xkPog3QtTkty3hCT36wokokrh4v8rs0dUDQib
	1/NcrBQE3crZcCEWD+eahGSm0cBK3QggO23DWcRk0TJPqdAWVnYSdE4YCdsYXquRigU0
	chnaiLu60PXWWNCeREzc5GaicAo5pp28Hm6ZKOIYv5VLHBJfZ7TZvrDXI6jz5/TDISp8
	CeHbBLdPOJUGZPjGf9XpjJ6q1TV+6AyidfT4QJFsp5eShjQRmle6HaFQtzjFa5JzoU8c
	zg5AkYAlFfjFCFoOCBah2/QOr+X3ZGrnUF17EgM9OBoTC/0qVoGNJnQSNHLuvTnJChRT
	gRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wZjQxmO6OXosgBlOQ3nFojC883akrX69uzb61KQolfM=;
	b=Cy5NR0tecpY8g87/POtTiLtjR5xiN29p14YUsi0fqIqCoQ+JLZBSwBxQ+p/Sn3CJLy
	fdV9HvvQi0BmHFDsari1KH78ZoXlRTHUDgOlcBwC59wd2cPEWKCXW8dnKKK1sr6IzdLl
	aJZ0XzOv+40GsK/U9XH5YlxbqxwhyLH0K+he22LlEiHABvaBJ4e9czxneq2INjIeKdNO
	uh+WkY+87sjscDDha9IB3TD2b1DvIe/vALaYOjZkn6RErq+OT3YqFl6cZSHO28f0x312
	dK3Ti33EbsZvdxn0Sx7w/Au69Equ2jMjaE6UYjuIaV5ebPofCzZLSMtg+gTqz/kTxT+C
	nDcA==
X-Gm-Message-State: APjAAAWC3FSdnJYmiMMHqFwpOBo7ehUGiGSQ1WzXu7sRHMPWqMihFetr
	eU2AN7zedhyybV96HtL6qZtjWNop2MLmRO4kFk/AIMjc
X-Google-Smtp-Source: APXvYqxhfJI5MTaIMpRTJZw1sRJ7/BhvyWIgRoUbeqCH8brMm6NcQ0noth3uUEda4OzrUX8msHmCByuFEib3JNdVdR8=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr9332540qvp.175.1565536417267; 
	Sun, 11 Aug 2019 08:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190811085130.15815-1-maciej.pijanowski@3mdeb.com>
In-Reply-To: <20190811085130.15815-1-maciej.pijanowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 08:13:20 -0700
Message-ID: <CAMKF1sq1_Xa-JrQGVd3A3mreTqvd7fEB2ky0qMHYjYYJYxqOoQ@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-python][PATCH v2] python-socketio: upgrade to 4.3.1
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
X-List-Received-Date: Sun, 11 Aug 2019 15:13:37 -0000
Content-Type: text/plain; charset="UTF-8"

Can you resend the whole series

On Sun, Aug 11, 2019 at 1:51 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  meta-python/recipes-devtools/python/python-socketio.inc       | 4 ++--
>  .../{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb}    | 0
>  .../{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb}  | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
> index a23e780795c6..fa62afce1546 100644
> --- a/meta-python/recipes-devtools/python/python-socketio.inc
> +++ b/meta-python/recipes-devtools/python/python-socketio.inc
> @@ -9,8 +9,8 @@ inherit pypi
>
>  PYPI_PACKAGE = "python-socketio"
>
> -SRC_URI[md5sum] = "0b57da61a9464d2e0dc9a8d0164d86d2"
> -SRC_URI[sha256sum] = "64feb0817f1bf7e3e7fc05f6f65e28d76146d8061cb7de25b63502717f80e908"
> +SRC_URI[md5sum] = "86cd47dddea1785ce7a6c72f55c93fe7"
> +SRC_URI[sha256sum] = "506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57"
>
>  RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-engineio \
> diff --git a/meta-python/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
> rename to meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

