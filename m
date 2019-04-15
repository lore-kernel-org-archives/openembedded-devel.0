Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C55606C10F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 16:51:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y7so22837059wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b489YyvMJrE3w+zF94IcxfMgbAxCulIfykb8wtTemNQ=;
	b=erof2JuH4vk4rWClEh3mSvSVGvKg6yyc4dJ4JkLLuv7dYqSM5fj4t+cdQ0/aWI952z
	Po5Gm8QPjk/Mw77y+GJ6vOvhBPCoUAgg+dxKBK1IGq1Pdc+pebcWUQM7dB7c3ks2m97s
	YwVhnrnLCbnobtHvKeYdQGMJ4muA/n4ce6+tUJ8eKhZGsKBc5VsHS8UXjBYqnAWZPHQb
	K7/d4IgkWBc9NYz6JSdJPLeWMnaAVIMOiEYu3NLJMegrfLaNE25lqsMGZlHm1xYFWe1s
	Er1NXG1J1zEpA5ShIgBUhphBAgHVANkDQXBILyjj+QzTTuQzt1EhngAA7DgSwoqIxPbq
	XIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b489YyvMJrE3w+zF94IcxfMgbAxCulIfykb8wtTemNQ=;
	b=ayujtesgtzmKtRfCN4TeT8LlsnlS3x9jiQydX+KBTsv0md5Mcd1POSvOZQYZDaTlWi
	Wof2J+3pN3T3WXKuLVvliGRZIAZkkLEHri1JyB/aNIbk1F4q/Mi+QEssHA2bQol0+7i7
	kOhhBAcUCKwSQpzqxeUDqWsWAabPJ0D80gvYx0c8Zf1ToZiHePCog0nTIZOX8hhKAKaI
	uAzK98CvJGtZ7OqI9h+RVxkSRVh+DNqFzo+wJ1R6s5SNxinCWta4zsq9IAKF23oj7U5N
	nvOyD5KwC9GecJL5FSKqXdbrn7C899G3cjrv8QImWhslj8RXS6fg/cOt4tFRVFx0LcQv
	dQDQ==
X-Gm-Message-State: APjAAAUSUdcNf25W/7D6lsAfcsMxNbtlnNbXdq1fO7SmPUscHySZCsjq
	p03WzYnolA5bB8VeQ3tYZusaJDjnjUOCYRD26mWoMw==
X-Google-Smtp-Source: APXvYqyAouAgRSNFJJ59OgcLyD5KjwV7R91gMvanTDkEeLP77RaHlNxPVUo2PZ9TSotHaMPD71X8GyR5Mu9DcNM5HE8=
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr12685441wrw.22.1555347096365; 
	Mon, 15 Apr 2019 09:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190415161326.5464-1-paolo.valente@linaro.org>
In-Reply-To: <20190415161326.5464-1-paolo.valente@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Apr 2019 18:51:24 +0200
Message-ID: <CA+chaQd_hODsTF0x+OF=CyGB+gZ+dxBNBx=-Vunro+J0YwQ5BA@mail.gmail.com>
To: Paolo Valente <paolo.valente@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.2
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
X-List-Received-Date: Mon, 15 Apr 2019 16:51:36 -0000
Content-Type: text/plain; charset="UTF-8"

Update the PV.

On Mon, Apr 15, 2019 at 6:15 PM Paolo Valente <paolo.valente@linaro.org>
wrote:

> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> ---
>  meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 47d21d36c..78d299e3b 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
>
> -SRCREV = "d05006865f68829fa7603bdb92bd51649f5ba1b6"
> +SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
>  PV = "0.0+git${SRCPV}"
>  SRC_URI = "git://
> github.com/Algodev-github/S.git;protocol=https;branch=master"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

