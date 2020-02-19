Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D92F61594
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:36:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c188so21682889qkg.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dTdVfDtXQIM6N7mn0QRu9opOhzrns4gnnk9WfeLcrZU=;
	b=T1sSvtc8j70Uf80xabkL476NdFzWH5JZzZwXpOyXCeAgh3VA6rHsfLyU07CZZ/pAso
	/ro/tmdKi9lGk93CPthf3GSYHRDz3vC0BmiuK9CJjAd8GzyupoPxmSeJeNtBNT660sUX
	TDY6IIrund2PHJbgJi+ICF5V5XWv9uI9ibsPo961prDGvGTPy+y1JawVTE3OSHLQYbwM
	2JePCVJn/S6O5MdlTou9cVNp/7Gnce9PijpFHJwKw9XIhgc6ZuJifn2xXZHWcVndy+lm
	mKvF1ZDaINNC0JoYYkktBNDurEimRV2wwrFrvjRlciK9HyR/PfqNOv0xVEQoo3PkMGNL
	IkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dTdVfDtXQIM6N7mn0QRu9opOhzrns4gnnk9WfeLcrZU=;
	b=iTZMWHLrHHq+bDjCJjtrYDeFXtFvvrpP9qFVCVN5e/zLbbz2rHgjcDmOaYwQxvO1FG
	Kov5EcUZyDHwMTT0yLlDHjdWdvt8Y0fmFKcvLiTOLsEQz6xlVv7FCCuBncqDvDNoB6S9
	5pvITf9v7H7UO7mGvd+2VNkTiQBu5K8HZkhvJ+Eq/lE1oI5pkshMHfzfR7Y/TlfIxFEk
	ZKgoh+8amhHMWqWP+mFqv7c9cCbo41bNOR2UiY5heZlb57cAESifjmUpPjiV0G41u4np
	UbFbm2goD5oU5hbfsk+5Pzis12O0gVUsyvgxlbKP+eefCB4/24kfkNr9YvdnVdY9weJV
	cWyA==
X-Gm-Message-State: APjAAAUvNh0ZO6zuzRfsJOFZP0wVfC/OdAzZ0cFhW1APr43CnzwuBAkK
	y7HHDdEs8IIRBten/NMGtaPQAxNHoxEFJAyz+A0=
X-Google-Smtp-Source: APXvYqwpmr4awjxFs/IxhLFlOJ3m62WO1bDYr/n1mpHiXumWTVKxKPG+RZcOYBub4A9VpXuXH8P/DJ4Uv8MzGtD3ryY=
X-Received: by 2002:a37:9e41:: with SMTP id h62mr22373556qke.215.1582079787923;
	Tue, 18 Feb 2020 18:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20200218210751.8538-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200218210751.8538-1-jonathan.richardson@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2020 18:36:01 -0800
Message-ID: <CAMKF1sp=G=ZASKdjqiXVCebvLYSx-Tw9Uok9e4H=t73zaCBPVQ@mail.gmail.com>
To: Jonathan Richardson <jonathan.richardson@broadcom.com>,
	Mingli Yu <Mingli.Yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH v2 1/1] fio: remove disabling of compiler optimizations
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
X-List-Received-Date: Wed, 19 Feb 2020 02:36:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 1:08 PM Jonathan Richardson via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> Disabling compiler optimizations affects fio performance by 25-30% so
> remove this from EXTRA_OECONF. Disabling of optimizations should be
> machine specific if there are bugs in the code instead of the default.
>
> Optimizations were removed in this commit:
> https://git.openembedded.org/meta-openembedded/commit/?id=739349da0826221f98648b64b693f9ae33e7d4ea
>
> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>  meta-oe/recipes-benchmark/fio/fio_3.18.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.18.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> index b6484290f..2c461b8c5 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> @@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
>  DISABLE_STATIC = ""
>
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
> -EXTRA_OECONF = "--disable-optimizations"
>

I think Mingli disabled it and I would like to get his feedback before
we revert this change

>  do_configure() {
>      ./configure ${EXTRA_OECONF}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

