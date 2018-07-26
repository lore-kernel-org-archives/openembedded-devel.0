Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E02E371957
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:29:10 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6-v6so443496qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TG5kPSBvkzbqUXbAcmFZJE+MOmmC+gtwcrwr2g+9kzQ=;
	b=sUIEjeBIwLF5kX9uriOxvIwRBEfYj5ElNjYgJWLfu8RVcGbPUCvlTCpc4abofiIS4t
	ANgiR4ckb0CF18DsXzj2oc8HHwtS2thx3NydPILQCoAfUAJxxU8oG2GphyVAl5tNe3fF
	OK2wIPDW9n1TMQfq5XuFI2c0JfOzYFvJu8Hm0dvnLErDyY7oybiByOEdPbGz+Ge3EAv8
	qhYOaY+IAVPPwTd5aZWUz5ZIJ6v4bEJ6p+/YE9N31eqwHyliKHRIlNrd1+5Ci5MOw+JL
	nCwOVFAaSG4tbFhWbF4cB745MjEFrE/pS1TK18DoYSbtD64UY6EliKlYMCHEtvNW25pU
	3QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TG5kPSBvkzbqUXbAcmFZJE+MOmmC+gtwcrwr2g+9kzQ=;
	b=BTZp+jMon/PgPrbhslqy6zT9zl6E405CHPZivwavp8gpmO80g6O4FFIsxjiMa79kJc
	cMJkhxLcsWf56JMN2qzI3jUz7gWF0A5VByB6TFYWcUzPYpcUjS/gwGfFnXekLHOCik5d
	YsB0O4slyW5WaF/GyE9835ftMjwwULozUAOYnaxByprigoZ/aehkEL/0NdUZ38zUsn1p
	8WICIJahAu4UHCGTyzsgC1Lp7ZPlDHxA8T+17eLROLCJXSQSa2vGNPKYCr13L98B5agq
	pyyv6BFgqDVh6NDj4NS9OsnKzJV05On4mmU1tUJ3gqfpcvtWvCzYnhlH65bpzV+Gf/Mv
	TNCQ==
X-Gm-Message-State: AOUpUlH+Avf2lo7+Uv7IgTlU92ZQ3Ztubk2hc5+wSPIObdx9SD742dI1
	RpV43Qqc9D9ptFMDU0OW9PrFl0kUQZcNos0twHY=
X-Google-Smtp-Source: AAOMgpc0JCbOjyxbYWHIJ8xI6HatxXinJJ3ubOs6Rk4FphocTd0ZtlzHvsqQC74OsD3IjkCpB9Erg443uulZ8Bdz+j0=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr430366qta.117.1532582951529; 
	Wed, 25 Jul 2018 22:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180726031636.8848-1-hongzhi.song@windriver.com>
In-Reply-To: <20180726031636.8848-1-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jul 2018 22:28:45 -0700
Message-ID: <CAMKF1sq+efNg=EVZMAntetN+nig_=-9TAH-cQB3q3wDekCg4VA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] snappy: add a new recipe
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
X-List-Received-Date: Thu, 26 Jul 2018 05:29:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 8:16 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Snappy is a compression/decompression library. It does not aim for
> maximum compression, or compatibility with any other compression
> library; instead, it aims for very high speeds and reasonable compression.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> new file mode 100644
> index 000000000..2a805fa19
> --- /dev/null
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> @@ -0,0 +1,24 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#
> +# The software is free; you can redistribute it and/or modify it
> +# under the terms of the BSD License;
> +#
> +
> +SUMMARY = "A compression/decompression library"
> +DESCRIPTION = "Snappy is a fast data compression and decompression library \
> +It was designed to be very fast and stable, but not to achieve a high \
> +compression ratio."
> +
> +LICENSE = "NewBSD"

As per SPDF it should be BSD-3-Clause see
https://spdx.org/licenses/BSD-3-Clause.html

> +LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> +
> +SRC_URI = "https://src.fedoraproject.org/repo/pkgs/snappy/snappy-1.1.7.tar.gz/sha512/32046f532606ba545a4e4825c0c66a19be449f2ca2ff760a6fa170a3603731479a7deadb683546e5f8b5033414c50f4a9a29f6d23b7a41f047e566e69eca7caf/snappy-1.1.7.tar.gz"
> +
> +SRC_URI[md5sum] = "ee9086291c9ae8deb4dac5e0b85bf54a"
> +SRC_URI[sha256sum] = "3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
> --
> 2.11.0
>

