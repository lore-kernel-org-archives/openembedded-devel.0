Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 94E306C17F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:34:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y36so10902866qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EFZiNhJS03rcPLz6tWtm9feLq9Thl491DWXvCGj5UQg=;
	b=jQmTBi2ir+No8j4ZGj63VFqDoBVWdPPNeOtdshqbP/rlaSJA8v6AX1PA7v39+Yusfp
	cNcOlC3GZ2MXPqz5grAANWiDwlkUM4jXYQpXNNL9BzRW5VjugdbFS9AgU5EnqsukOBn2
	Hb56G68lTjMHnetgsr6QOs2vLqbptiURXkLYKQedu0jtP7TuO+IJHnEERrss/t1k+aS/
	dXewQCpAoqvlOfWs8HiO18aXCl9HxXkFm+s5HIfO/pV6q7VKx2xWjtAmVKMsOZII6VOH
	OG/vGdbcntnHgi0dZeNxV2IR37FgnJWBlRmrWqgLVjdctjlCn922tN7q1dHAoN5UEolk
	W0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EFZiNhJS03rcPLz6tWtm9feLq9Thl491DWXvCGj5UQg=;
	b=nnrbh6PXEO1LExNqXWtr5dmOb6nzSvZUhA8DPsOvGOyGv7GshVUWYnAPP/dGQ1r9Nw
	lp1IO5s8jEPA72swJ5hKasrq7sbNNW8Iry5YZsGO941a9BOdtwDNqzSs+7tzWadoje55
	9nKKcfyEusDuv5AwTRtKjjnw2NnDHlRgoIq82N6eu5LzCjiIxteItlyfgI68yMAymx7e
	cXp3PzStaXqDWWhJbLUPYVI5ipwXLAUgUkANQPVr9BMWm/8D51kglIn92Dtf3REDPGKs
	qfM0OdHFbcVic1k4K6M5vUnjQfDKPfeX3BQGes8883Jf0ov4DxmtjasrVbTpDKOfqnUD
	7JAg==
X-Gm-Message-State: APjAAAWja7ff59NZ3LVVvdACQ+s05OCqMbsSpDfGAFr7i/JAvBMNOCqw
	eo0a4/DNVh5E5OC9MKZmk+Q8qH22F+2tzM8N42c=
X-Google-Smtp-Source: APXvYqys4DgujxHlDKM3RE7sVuqEwNXy3xEz3EvYURW60/E/UZ0dpRmdArt0ktyRggZzvF8F6B3iW6Yeuvu0WoCcnus=
X-Received: by 2002:ac8:2f10:: with SMTP id j16mr338125qta.29.1552970069266;
	Mon, 18 Mar 2019 21:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190318144440.11580-1-andrej.valek@siemens.com>
	<20190318154707.20242-1-andrej.valek@siemens.com>
In-Reply-To: <20190318154707.20242-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Mar 2019 00:34:02 -0400
Message-ID: <CAMKF1sr8jmJVMF5xxH2QbPSVsJLLVWhke3tYtpW2n5ivb8=pBQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: vkc@connectedcars.dk,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] nodejs: fix target ldflags using
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
X-List-Received-Date: Tue, 19 Mar 2019 04:34:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 11:47 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
>  - do not drop target LDFLAGS
>   - even if the target LDFLAGS have been specified, tools like torque was
>     linked with system libraries
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../nodejs/nodejs/0006-Use-target-ldflags.patch    | 24 ++++++++++++++++++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb  |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
> new file mode 100644
> index 000000000..c6d0cec4b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch

cant apply this patch on a ubuntu 14.04 host, can you fix it ? may be
use git format-patch to generate the patch itself.

https://errors.yoctoproject.org/Errors/Details/233590/



> @@ -0,0 +1,24 @@
> +The target LDFLAGS have been ignored. Tools like torque
> +have been loaded from system libraries, even if a native
> +one was the target.
> +|$ ldd torque
> +|    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1
> +|    libcrypto.so.1.1 => /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
> +|    libssl.so.1.1 => /usr/lib/x86_64-linux-gnu/libssl.so.1.1
> +|    libicui18n.so.63 => not found
> +|    libicuuc.so.63 => not found
> +...
> +
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +
> +diff -Naur node-v10.15.1/deps/v8/gypfiles/common.gypi node-v10.15.1/deps/v8/gypfiles/common.gypi
> +--- node-v10.15.1/deps/v8/gypfiles/common.gypi 2019-03-18 15:01:39.000000000 +0100
> ++++ node-v10.15.1/deps/v8/gypfiles/common.gypi 2019-03-18 15:04:08.628361308 +0100
> +@@ -1106,6 +1106,7 @@
> +             'cflags': [ '-fno-strict-aliasing' ],
> +           }],
> +         ],  # conditions
> ++        'ldflags+': [ '$(LDFLAGS)' ],
> +       }],
> +       ['OS=="solaris"', {
> +         'defines': [ '__C99FEATURES__=1' ],  # isinf() etc.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> index 17c9bb0c4..672cd8440 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> @@ -17,6 +17,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
>             file://0004-Make-compatibility-with-gcc-4.8.patch \
>             file://0005-Link-atomic-library.patch \
> +           file://0006-Use-target-ldflags.patch \
>             "
>  SRC_URI_append_class-target = " \
>             file://0002-Using-native-torque.patch \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

