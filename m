Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E10C671B23
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:58:52 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j12so4250372vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b7zIUJNoUDYojBFlW0h3xuya/0EfjbNZywDhrhWQsBE=;
	b=UsF9qTUL8ZuDvhG9VQWs4L4Q2ENaZNXR3vmUm3FcM0LxwbPZkWKTLV0Wd5GkPFkZ/O
	P3h3Aq8su0kmHXTiBloEq0fFCZf+zjHKQs2wTBPduZJpeel7FSoeHN/n5v/M1uC0KqeF
	SWK0ylUlM3Y1EkJEYtJ0zmLDUfEXVWKwMzLBfpBYozmgjpnp+WWJ+Zb4vzat50W5btqC
	ronmH429sMuvVZ+JvWK3w7aL/oA2ivM6p61m04gJtjIqCpT2rMGFuNg3J7CAohP6fABn
	wDVOYwt+PYZuGdqhHuzkH8csPNTgU9sNHs6MW5QHGn4bonLabUJSPFtJRstDVIgNVPxZ
	6TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b7zIUJNoUDYojBFlW0h3xuya/0EfjbNZywDhrhWQsBE=;
	b=uKhWv/6bCQ9yhgyXziMbZN0E1XLGP2m1dcPltSnpVFNzgxaH7Nm2mgaQdtvNwFEwd+
	ZSdLR8JwbOozNuJtmdE54LMm7tMQAm8FhxMOgMcvgxRLQUZNWJH7Odp3Y3GS3eeRIG0n
	0+QAyVXAwnjeZ3tIwDC0eP8Mdm9Ns5ea+uVK6vDwgwDa0qx9ihqUi2rc2Gji8wBpkwtO
	o1Vmz0nBi9kMCsOLcE67nhc5bYmwn2urL0MuyRicqTv3ftWgZc4onE2zIQVf/Tz/M3eM
	XnRzicNesZg8gRjyj0WaAwYDZOTCkAkajgXa3kUVuf7cvRG3ZPAiiimDyEd5kBtJvcH2
	eN2g==
X-Gm-Message-State: AIkVDXJYTrB8q1DnNlcqQsJmdRgnfzvaO4TxPf5h31lwUWsx1oC3ZyyyfoUTno24Dj4D5v5qCITmDTlJ+7f7YA==
X-Received: by 10.31.197.195 with SMTP id v186mr32033169vkf.84.1483988332911; 
	Mon, 09 Jan 2017 10:58:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 10:58:22 -0800 (PST)
In-Reply-To: <20170105094426.138799-1-chunguang.yang@windriver.com>
References: <20170105094426.138799-1-chunguang.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 10:58:22 -0800
Message-ID: <CAMKF1spNmcULe_BLZZ-PQD8vM71yc-hb_XKi-XF7jY_Ecx9oCg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] lcov: fix env command argument pass issue
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
X-List-Received-Date: Mon, 09 Jan 2017 18:58:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 5, 2017 at 1:44 AM,  <chunguang.yang@windriver.com> wrote:
> From: chunguang yang <chunguang.yang@windriver.com>
>
> when exec lcov in bash, the following error will appear:
>
> /usr/bin/env: 'perl -w': No such file or directory
>
> perl uses the -w option to enable many warnings. But the
> env command can't pass the argument to perl, instead it
> treate perl -w as a file. To fix this issue, just keep
> the origin perl path and not use env command.
>

I would suggest that we get rid of -w as well, since the fix to use perl
via /usr/bin/env is to get rid of absolute paths.

> Signed-off-by: chunguang yang <chunguang.yang@windriver.com>
> ---
>  meta-oe/recipes-support/lcov/lcov_1.11.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-support/lcov/lcov_1.11.bb
> index 114bd84cd..2f9ac336e 100644
> --- a/meta-oe/recipes-support/lcov/lcov_1.11.bb
> +++ b/meta-oe/recipes-support/lcov/lcov_1.11.bb
> @@ -23,6 +23,5 @@ SRC_URI[sha256sum] = "c282de8d678ecbfda32ce4b5c85fc02f77c2a39a062f068bd8e774d29d
>
>  do_install() {
>      oe_runmake install PREFIX=${D}
> -    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/*
>  }
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

