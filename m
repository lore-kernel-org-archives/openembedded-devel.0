Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0FD6E682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 20:43:30 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g203so87309181iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 12:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=Da4NzBF9MkQ1XoYYj3w9nx+LfABQpWOYqWQ+Z8gW39E=;
	b=fT+cWuMy9KpFz7uIsVcKScvZJY4yc6tmUL+6GJtGxG9ZiqPMnWwBvbsweiS1tId5js
	IsgCtZ5ZqeXxJAiQNlBRMt5QlvnA2gEitUBLVA5ui6xrX9yDbjzwkV0+1CF/DgNtOWdz
	bO08JT46KEhZTXquA6pNlNCp5mLOiFxoGviXtLObjBI4w0A9eYimg8z8gqfM+CSzil/Z
	xdnk5gAocX2G2wduUHU+4dH4Pz9trfQB/P1tPkGIcoYEn3HErM2oiTpsLHqG/Ne1aHWl
	RtjKIgu+JaGGJtISjAEX+naoW9J+gILtfBT/9Us+KIcJ4U4bZ0gxiHXfXY4UAZzAiqgJ
	5LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-type;
	bh=Da4NzBF9MkQ1XoYYj3w9nx+LfABQpWOYqWQ+Z8gW39E=;
	b=bSDnsNRmWxH7rsgybcPpWvbx38L/LZjigdMKnBbDdzUR84eREEz8W7Mfl4X7juOQxb
	dx0hBG8f9/83YsbALQdsSn5nPU9bKwcdODor0dpYxaMcvyQlQjceql150HO3zJpUV5A0
	P73iija18qexULL2ajGeExhJJgZbl027y14CUKLuXPBAfJXDcfdHv8kdlmuVtRRklkZR
	OfZ4/fg7U0L5D3PHHYd3OKGX+kP7RzkjS4KvyAtrd8CuqMPd+ks8ZWWOSfhIf8saJJG8
	3yi1At/d3Ifqo+dKfgoTftQgRWqgd6fqC+CO0N6r5cluKyM+PhcBBo+OdyU8F91QnZ05
	8v/w==
X-Gm-Message-State: AG10YOTCTDwrXWCqAk4+OdTEmJfLB/SW/qIe61sH1PO+cU2DJILO2UAHi11kVIVSwEYWpsFvvNaSboWbz48uFA==
X-Received: by 10.107.14.66 with SMTP id 63mr11653246ioo.150.1455828211339;
	Thu, 18 Feb 2016 12:43:31 -0800 (PST)
MIME-Version: 1.0
References: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
In-Reply-To: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 18 Feb 2016 20:43:21 +0000
Message-ID: <CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Thu, 18 Feb 2016 20:43:33 -0000
Content-Type: text/plain; charset=UTF-8

I think the convention is to add such workarounds to no-static-libs.inc,
not the recipe, at this time.

On Thu, Feb 18, 2016 at 10:30 AM Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> As of commit OE-Core:773c9e18071d71454473dd81aff911104a2e9bc6
> EXTRA_OECONF is appended with the option --disable-static on
> DISABLE_STATIC variable and this cause the error:
>
>     DEBUG: Python function sysroot_cleansstate finished
>     DEBUG: Executing shell function do_configure
>     Bad option --disable-static
>     --cpu=                 Specify target CPU if auto-detect fails
>     --cc=                  Specify compiler to use
>     --extra-cflags=        Specify extra CFLAGS to pass to compiler
>     --build-32bit-win      Enable 32-bit build on Windows
>     --build-static         Build a static fio
>     --esx                  Configure build options for esx
>     --enable-gfio          Enable building of gtk gfio
>     --disable-numa         Disable libnuma even if found
>     --enable-libhdfs       Enable hdfs support
>     WARNING: exit code 1 from a shell command.
>
> So, we need to disable this option.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> index dca0e64..5bf387c 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -25,6 +25,9 @@ SRC_URI = "git://git.kernel.dk/fio.git"
>
>  S = "${WORKDIR}/git"
>
> +# avoids build breaks when using no-static-libs.inc
> +DISABLE_STATIC = ""
> +
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
>
>  do_configure() {
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

