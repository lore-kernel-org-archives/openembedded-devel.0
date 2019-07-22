Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0827E542
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 16:31:24 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r6so34897489qtt.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z4QDde2Gyfy5v6M/AeCJs0BtLRJ5jTyQlw/m8NLuYcE=;
	b=jmBzPC1KXViHbu9CHJgCP+WOOR3ZQ5dfnHPymIurBwBzl827e8PIDR4/sruOCMBm9f
	iGyaZu3t3T7y2rPsaPLqujLcqoUPhfzdIMOJDU/FxGkJAGELqFKped5pu0000p4i9ajU
	FTO+NGfVY4AHnbg7AZilTrg67RA9rMc3pWhdVZaok0tGo6hioJsmo2WCdG6eShK63Xyl
	S81nHB+Z3l8ECG0ueegg3hU6f1uh9CUa5ORyKfmdPg/3yz/1iPvyPhd2pvrqpxn2Kq5T
	3PwIAFOGGeLcd7eEqSbLanlN56l0kXyMhs5c+Oe+IKo7NLcJKweVv7UhGIYxKEHiq0cP
	kqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z4QDde2Gyfy5v6M/AeCJs0BtLRJ5jTyQlw/m8NLuYcE=;
	b=c6iugR6ZnSt2fPBH1msDaxuFhnrhgP/mmcSmi+Yw/h56LFVhpGtF20CKwIPMEJxEqm
	DvQUX3Xr+wD0wUxq8LjMwhG2zeanU9HCHeHxlQKXYor/2t7xhh0aEs5rgPJ3h71FlWfx
	5NVNGNFB5qU7OqRPi3hpvjbqxbgdzCfPYCXKm10If3SMYEZnbeGz6YQsKm69L/dBALyM
	GvgxRldrsP8b41EuTz7/KavPC/1HJ/C7pS9DYkW9Nd5pQ4h/naIuN3VpdOsn2JazRHr+
	5aLtp/WM4lF5kTJtIGU2e7QaEFqMFn8vINFsJkr5oH1BD1hfa5UeuiM6mXT2P7wDdrXa
	Oh9Q==
X-Gm-Message-State: APjAAAX/UvU8wEMbDaSBHFNUIiwIaBi2r958IE1i4uLhbDREwmVjGAGU
	P6LVGlbgNdAk7VFQMOegghRpavVJes/3JgxMmZuJD6AhZ98=
X-Google-Smtp-Source: APXvYqwA3Ze8Qibbey/YUQRybQ0ndSqwZJ9WU+KY3tLwV0GaaYCBiaykU3phmFziCLQy0TIIlUMdB5YRzKyfmuGyVyA=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr50103554qtn.378.1563813084905;
	Mon, 22 Jul 2019 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190721185137.27323-1-ayoub.zaki@embexus.com>
In-Reply-To: <20190721185137.27323-1-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 09:30:58 -0700
Message-ID: <CAMKF1spu1cVMrCcuTMLgFxRqpc1LzvZ_RH7TeZb6dMu0DTwYEw@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] pegtl: Initial recipe
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
X-List-Received-Date: Mon, 22 Jul 2019 16:31:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 21, 2019 at 11:51 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the Parsing Expression Grammar Template Library (PEGTL)
> a zero-dependency C++ header-only parser combinator library for creating parsers
> according to the Parsing Expression Grammar (PEG).
> ---
>  meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
>
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
> new file mode 100644
> index 000000000..ca175f868
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
> +HOMEPAGE="https://github.com/taocpp/PEGTL"
> +LICENSE="MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
> +
> +SRC_URI="https://github.com/taocpp/PEGTL/archive/${PV}.tar.gz"

lets not use archive from github instead use git fetcher itslelf

pegtl-2.1.4: https://github.com/taocpp/PEGTL/archive/2.1.4.tar.gz:
SRC_URI uses unstable GitHub archives [src-uri-bad]


secondly it also fails to build with clang/libc++, not going to block
on that but it will be good if there is a fix for it
https://errors.yoctoproject.org/Errors/Details/253679/

> +SRC_URI[md5sum] = "fe96a704913523763642a2c4c4618091"
> +SRC_URI[sha256sum] = "5699558ce06e8fad0530143199eeaefd29128fb4584879975c87947c8ad0395f"
> +
> +inherit cmake
> +
> +S="${WORKDIR}/PEGTL-${PV}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

