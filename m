Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A490A7884B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:30:32 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b15-v6so8999976qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GS9/tpxSZA4Exa23Cevu4jTjrCZHTVM4s7l1k3zZpwE=;
	b=XAZASQ7befCqtKIIhtkPHabRLR90WLW3Tdut4s/9pdKBGKU4tmXO7rUKvULQ1ZQkWN
	7SgVC3qef8rNxXG0FT1KaRoWMp79VvZrqDN9OuQw/0auPskthAEbVnphmKPSoE6zbZnr
	mpuzEeXhW8ak9/xSBUf02UKvLnRaa7XWWYWdNswtopS7G+yrc3CIPKbYZMtbgUVM5Rhm
	Z2MJGxjQyeha1cfIMZXpfCIiz/JvJwSno0lonXt2Jl9Tq4FU+g6d6FJDZDXzqThbPkBB
	p1SSnMbHRALYtO7fLwv7aH1g6IoYQwGaAUC3PWyuPh8+v39z1U8vxktfKT4v0W9mfbKq
	1VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GS9/tpxSZA4Exa23Cevu4jTjrCZHTVM4s7l1k3zZpwE=;
	b=EIfJW3ZEDPM8v97pmuzluEkR361fUovNXmn+xcrFlBVB8Px9S3Ph86IywnWSQZ17YN
	IwqagG6yuodO4f5R6sFj++RADcX07b68bXO6qlFFnJH6HTdkllmLnJR4gmgkFaJOaR0v
	pg5M69fl2yiyBLFsyoXYQfmxntQmD7uP5Bx8GuP3NmIpua6e2+hJviO/7mr5/uLLy6Po
	Ja6bIkMJNQLwblkksJ8M91bucdD72eTMPd4YrnrFfPLs8EhksclvmJohJqe34z5jwv1r
	HrXttrKiGbBi8A4/ZJ8G/fzWbrQ/FiSNktD17rxfoGholwco8/X2BxkqwLFdETmQ3Z+Q
	4hgg==
X-Gm-Message-State: AOUpUlEVfoB0e5yPXUy8y1ZuHbxZYRsO/bmu5ND2FGjaeOc1JdMgMhzF
	VSfin7xEsv2KoTstfIf3QJJXxkAnaFuLqwZKIhI=
X-Google-Smtp-Source: AAOMgpdgU/6yioIKAylJzNxsUk8QApnYsRsOxJzWkJc72Pv21kxoFdp39iIbxjvlkmILQ0sSuI76k7gSTxAfLN4xKys=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr22814999qta.128.1532550633267; 
	Wed, 25 Jul 2018 13:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180725103604.10463-1-hongzhi.song@windriver.com>
In-Reply-To: <20180725103604.10463-1-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jul 2018 13:30:07 -0700
Message-ID: <CAMKF1squ5Kgu5FHwY+E_95wbMNQTfkhX0pepe=gfFq_5FKmBig@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] snappy: add a new recipe
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
X-List-Received-Date: Wed, 25 Jul 2018 20:30:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 3:36 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Snappy is a compression/decompression library. It does not aim for
> maximum compression, or compatibility with any other compression
> library; instead, it aims for very high speeds and reasonable compression.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> new file mode 100644
> index 000000000..0fca4ccaf
> --- /dev/null
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> @@ -0,0 +1,20 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#

Can you also add license terms here.

> +SUMMARY = "A compression/decompression library"
> +DESCRIPTION = "Snappy is a fast data compression and decompression library \
> +It was designed to be very fast and stable, but not to achieve a high \
> +compression ratio."
> +
> +LICENSE = "NewBSD"
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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

