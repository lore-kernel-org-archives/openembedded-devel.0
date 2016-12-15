Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17E5E606A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:15:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so6737000wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=UmtYlNRTz0DpK8lkfddt1P2VVoxgQ7z/YA7S7Mp5dPQ=;
	b=NAa5db8hdt1CYjqQwlq06kY+uyD4yY0swX/VR6keXFwVZ5ulwKM35F6naP0UXhN1hd
	+bZqVbkY0eJi0LOXvLM4YDnD6cI6/lWfwCgncW2qGN6C84hOjSsN34H5NRzZ1Bmqhht7
	LtXGRY3K8tGBO9MxK5vc+rbUX0fz25C+zjG6hk5YOoeErZAQa9DmMZzmfCxhPCEFaZsD
	wPXKPGdmfMCsJhw7sSYvav0qwAZBT+iYk1IyPHxwbgOPDfzktVJJJViI+URwW3NpCynb
	1T4TgatN3umRrGr/QdEwoznqFUirlQvEa3jvNHRbMLLVUhybQoiSiluzxzZcF59qiJzg
	8qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=UmtYlNRTz0DpK8lkfddt1P2VVoxgQ7z/YA7S7Mp5dPQ=;
	b=tMu7p58J8/EICzh8BVtQHWr5eG6VAzVKeoURpiKzColub2Z7BcZ8AEwaTr6N3LLwG4
	9wI1ysCyKm+hJ9iaNSelmsmE28/O+v5tGMUp0dDUJ688jga/VwUMD75xJ9O8GjyqnET1
	1xUux6bJdtMYbBhSJfuSu1gSVdVrrYXwjeLCKT8J/E+te6EkPov3knbEJjkKYCCpNUW8
	KOrwKwx6kBINnMzM1FYoGig5JMH7OdGWIqjwoXHGdhv924cg+58kFy5cdmXzEjBGXBKX
	hwV8IUc7S9ttu2CDGL2uh/O5BOR0JfdJLQV1kMfwABmnaw3SQdmSsBENVnn6TS627hEK
	c7PQ==
X-Gm-Message-State: AIkVDXLGXBZx0hNY2OsH8APl5wGYaDjn7iLmKnZ0y57mPIPKYM6ShjSlkEdy0LPbravJvxYFjvTuZCz+WQyAlw==
X-Received: by 10.28.211.72 with SMTP id k69mr1586761wmg.138.1481811330731;
	Thu, 15 Dec 2016 06:15:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Thu, 15 Dec 2016 06:15:30 -0800 (PST)
In-Reply-To: <20161215020940.10105-2-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
	<20161215020940.10105-2-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Dec 2016 06:15:30 -0800
Message-ID: <CAJ86T=XB4b0c4LffHXeoS9UBk8Ao4m6MaDX-N1L20b8agwai0Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/6] libmng: Add recipe
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
X-List-Received-Date: Thu, 15 Dec 2016 14:15:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 14, 2016 at 6:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
>
> diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
> new file mode 100644
> index 0000000..b176d09
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
> @@ -0,0 +1,22 @@
> +# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Development files for the Multiple-image Network Graphics library"
> +HOMEPAGE = "http://www.libmng.com/"
> +LICENSE = "Zlib"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
> +SECTION = "devel"
> +DEPENDS = "zlib lcms"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
> +
> +SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
> +SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
> +
> +inherit autotools-brokensep pkgconfig

How difficult to fix B != S?

> +
> +PACKAGECONFIG ??= "jpeg"
> +
> +PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,libjpeg-turbo"

Dependency should be on "jpeg" (unless libmng only supports libjpeg-turbo?).

> +PACKAGECONFIG[lcms] = "---with-lcms2,--without-lcms2,lcms"
> +
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

