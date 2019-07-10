Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id A7CED7EDDB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 04:59:06 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h24so1126267qto.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 21:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kEhcwEHLxg9XOVvQKtlylbgrs6YVH98g3mA9MAwolaI=;
	b=OmT+hc7+VDwNfA4RPdEYYeyXMg3gZAQNQotYa+yAtZh0dVZlGqbvIvNszCykdDD8SQ
	BcLmXrK0qeCCcsIyjEFGQciZ5+qs1cbDDfLG49rskBxPfMGy6qJnV9NeMGBvkyfteFvQ
	jY+0q09ulvHw2ohI/mbXdfEtO+Q395sLmDeZJGkeA6kqr1XHRxAHLJhFRuSmrZV19eoK
	jVqwvScYUEdQsYRFrZlXStL+guBOAGn6FRFsUb/IkjrIHNV/hm2YCfIvOkxQGOHvCx9M
	m7UB6jgEi1akh8/xY+EkE3g6TXG6xq+s1rGWfOrM6yJbZBpg9Pqi5jrWYCRbC6/8e8J4
	LIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kEhcwEHLxg9XOVvQKtlylbgrs6YVH98g3mA9MAwolaI=;
	b=uYAsal1xKy5G9+N/gxnEBB+kqDyH+hTG7hMfSNRueOEXlAd6W24Bgd/u9piNVnDUgw
	8RZ3MsGrbLg1O6s5LczCwUhTUH0Sz+NN3y+7yo0L9pTuhiCVxQj/EHoRwzHduMqjkhSy
	82lRR1R56xAa6NQKVxGTJfkDKQ+gZFfcWrlMakfIAR3c8VY4pbW8XHFB2FMWGY30IvPU
	4UN4x43oHvcHHOY3/2ZlxWa34wS0jPf6U1QTO5GSHEUAeTFGNWhrBXzGyZI4W+iVMQLn
	/ZR0uy8JTcr4q97aYFTnjEzLwvkRC2t/8JIaXk26qEbUcx80TA7ae5Weqrb9kMeJC3Sb
	4jOg==
X-Gm-Message-State: APjAAAWNnkS9vhvHXeQ75b0EMOTTCNSf6yDSBpm6TvBvsngHsE0t4+zk
	xWMN4ybyiXhplbg5JxaemFjAwJaTS4QwjkqgQW4=
X-Google-Smtp-Source: APXvYqzkKGK1uu3AzZxHf+/VHNFmpJc35oImkK5tjlY/x1VugYWgUIgfAfj3xNlxHd8JVBN4c3ioRO0iTeXS09PnD08=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr16402108qtr.194.1562734747254;
	Tue, 09 Jul 2019 21:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAPybu_0wQV+iwkbUTYm1hF3SQDa9pqke8z4u1oSwDX75eJyKug@mail.gmail.com>
In-Reply-To: <CAPybu_0wQV+iwkbUTYm1hF3SQDa9pqke8z4u1oSwDX75eJyKug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 21:58:51 -0700
Message-ID: <CAMKF1sp_CAk9AhPa766bJ3fX6LGb2KL+w-JYPrOMYx+GacYwjw@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: WARNING: on wrong $PACKAGE_ARCH
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
X-List-Received-Date: Wed, 10 Jul 2019 04:59:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 8, 2019 at 12:11 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hello
>
> On our organisation ( qtec.com ) we support a distribution on multiple
> architectures and machines. Since the introduction of multiconfig we
> have a single builder and a single package repository, what we really
> appreciate.
>
> Unfortunately, there is one single frustration, and is "wrong"
> PACKAGE_ARCH. For example:
>
> - -native packages that DEPEND on non-native recipes
> - tune-arch that have some  variable dependency on MACHINE
>
> Some of this errors result the same workdir used twice and invalid
> packages.  Debugging such errors is not trivial, involves horrible
> error messages, bitbake-diffsigs and non deterministic errors (the
> build order can hide such errors),
>
> So I was thinking that perhaps I could implement some tests such as:
> - all and native can only depend on -native
> - tunearch cannot depend on machine
>
> I HAVE NO IDEA how difficult could it be, but before implementing I
> would like to know if that is something that upstream would be
> interested in, because if it is not upstream I will have hard time
> convincing my management for getting the hours required.
>
> What is your opinion?
>

this would be a good check for QA or parser sub-systems for sure. I think
you should propose it to architecture mailing list once you have formulated
how to go about it.

>
> Regards!
>
>
>
>
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

