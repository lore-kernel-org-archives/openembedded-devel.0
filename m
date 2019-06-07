Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 717886069C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 06:51:51 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id r185so601309iod.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2019 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vx44OlqD2Q5oIvcmTqEnIqSopAq8Zb1A+0V1gB57kh8=;
	b=il3OKtGC4PT/VCiDn+E7lKkBfnFoI95UaZM2r+Jfypwxe0oBeSc3lZSGj/14YfJxrj
	KAu516wLmyOQqHnVxQCYjj3T48q+0oRQ0Sv8GDKAY4WgZ/ZGve0RodddBSGV/vvYtQ9f
	m0qBHfa8cJEIAvIzSl0ZyUPWVnE94M5nPmw+MmStkjBWG6irUSstKSckRxzXkrANjU5s
	QpHb+bCuCIsg/mtXIDO01eqHNruOYANGaO4h5HJPxI96DxzWSGJUAN/FJKjeLpSYpB+f
	89+/pl8KuOsab4Jx5Y3JRP56lzfFepoK7D8TS0jIbFy6dYQNHQPWyftU20YjMP5/1e2f
	CV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vx44OlqD2Q5oIvcmTqEnIqSopAq8Zb1A+0V1gB57kh8=;
	b=tDIgbjNYToKJG5V60a3TX1pXV7iI+BPH0g4fHrjdhfei7rTTL4prF/3lElbzMgV9RN
	LAC4n+wyycj1iAl0oA2Zg3AvBVztSQVqtJWGLO/csqVEeLQpruzyIyfh4DkSlZv87sja
	j8uXdSnBcaDUA4r7IF2iXGNpnlQ36P3YwMlzMJ5MDolsay1JqsY+Fp38Kitks0dkzcZb
	c8xV/CTw3tbOZG+O60hfFv2FGOZUO+z9YNlCgJmkQKLzyrWQyZ7nGkA6uxnFlXFnIYAG
	LSNBzIXA3AI/maXohwbWKKbuwx2n9bmrfRuuPEF/fe6HZGz4gTQ4nI40yhULSFO6Ed0e
	ynnw==
X-Gm-Message-State: APjAAAWZ2Vf9QeNYMzf7Hu3CdlgYSAp5BPG0i9ZnALJnebpU/4CrmoHO
	ko4nrVVV6Yq5QesfRZnA5uS0xnwpPKQzSxB/mR0=
X-Google-Smtp-Source: APXvYqwa00CEEh6WBtICz233DE3vrfqvE4fC9vAYCHDqQJXcizyNzkY4bNIIdBdqwlOuYq/O6S2yBPF5uPe9iPF8pIU=
X-Received: by 2002:a05:6602:2181:: with SMTP id
	b1mr34411441iob.198.1559890312355; 
	Thu, 06 Jun 2019 23:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190606034737.12893-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606034737.12893-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 6 Jun 2019 23:51:41 -0700
Message-ID: <CANx9H-CoZm=_-4BDC_SEZ+SmGeADQUTp2DBhBFpXhxFsXVPwvQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-mako: upgrade 1.0.10 -> 1.0.12
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
X-List-Received-Date: Fri, 07 Jun 2019 06:51:51 -0000
Content-Type: text/plain; charset="UTF-8"

While you are at it, can you please add a python3 recipe? Python2 is EOL
soon and this recipe will be at risk for being dropped completely in a
future meta-python.

On Wed, Jun 5, 2019 at 8:46 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-mako_1.0.10.bb to python-mako_1.0.12.bb.
>
> -License-Update: Copyright year updated to 2019.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-mako.inc         | 6 +++---
>  .../python/{python-mako_1.0.10.bb => python-mako_1.0.12.bb} | 0
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-mako_1.0.10.bb =>
> python-mako_1.0.12.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-mako.inc
> b/meta-python/recipes-devtools/python/python-mako.inc
> index d86ad33cd..dc27ada74 100644
> --- a/meta-python/recipes-devtools/python/python-mako.inc
> +++ b/meta-python/recipes-devtools/python/python-mako.inc
> @@ -2,14 +2,14 @@ SUMMARY = "A super-fast templating language that borrows
> the best ideas from the
>  HOMEPAGE = "http://www.makotemplates.org/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
>
>  PYPI_PACKAGE = "Mako"
>
>  inherit pypi
>
> -SRC_URI[md5sum] = "a94d376078dda65f834ea5049a81ebb5"
> -SRC_URI[sha256sum] =
> "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
> +SRC_URI[md5sum] = "4a7aef27217a8e6c1a29447c9b1b00ab"
> +SRC_URI[sha256sum] =
> "0cfa65de3a835e87eeca6ac856b3013aade55f49e32515f65d999f91a2324162"
>
>  RDEPENDS_${PN} = " \
>      ${PYTHON_PN}-html \
> diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.10.bb
> b/meta-python/recipes-devtools/python/python-mako_1.0.12.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-mako_1.0.10.bb
> rename to meta-python/recipes-devtools/python/python-mako_1.0.12.bb
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

