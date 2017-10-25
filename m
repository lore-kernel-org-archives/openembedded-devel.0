Return-Path: <fffonion@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id DB87671A3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:06:50 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id y75so16873549ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 20:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=3Zu3C3S8PmPnRXQd+8xXEmoy986x3prEqFCU7SkAtWQ=;
	b=B6m7YcdLphoMh8em6F2ySb+7DBU0royIotdzme+8wAc5RtiUvJd3HV6Sn0ygjajS3+
	0Y3hBL9ZHsXCNeNnvbhO5usDgMlOuYm8EUfWwoSjEWw2r5F67vZdt96QAZqQFrDpL+XU
	qFFhpoIJzHUfXlaOQ3/SmZTxD7nDyyqBbvSOJ/469lVR3BKXdYHeyoDj67AcokzuJtek
	gGUA3AcbJebvmSA77xbsfDbUbn1njrP8y4wPUjGzz7Cb1yBYefXYIYrtSbxeRe/ib+6N
	9dySW9s8nyh0BqEN2iIwh1LZfMtTysVD+Vjtsu7Rof6/U4ZX2C56n5bpibzEcAXp5nki
	4ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=3Zu3C3S8PmPnRXQd+8xXEmoy986x3prEqFCU7SkAtWQ=;
	b=iy3UZcnsi/I/lfpacb8Ogs8zIN3Nrzwm67Kfs7CPWMlVmuLsgBOewm5rzV0CJ7zEmF
	Fh0ye/Cp+7SFIvbmZ/uBrvEBsPWKs7ZvK0j8NH1m2OgMG2WcjkyGalwcZR/lELy7hp2X
	MtMVbFZwsQfjE6D54+EdnXT9a1wuL8eQur/C/lPTAkkBJcoGg4pwaLqjUtbyUlJwx7wi
	0WYkKyg050TqvguIWIgDBKrxDbLe49Q2/8ZUqhcFN/QA/JRZfZz46Tw2gt+/LaOAI80o
	fS2fKPh8u/Mh1Kkxk32fr6U5R3xLMMd8E1OpDKcau9jQAmcTI33STXhQ5SKqJJ47a1UQ
	v6/g==
X-Gm-Message-State: AMCzsaVqIkP9jOBghl9QjnRBwlyiv63D04hlICRsEpVjdBb3dzmQqgAl
	5wz1Vsp6naqJyQkXSnbTuVwF4WotHAUqVq+e4QE=
X-Google-Smtp-Source: ABhQp+R0TbBXVAi/CnE+wqPxnuqpXvSothcnzCtwGHsvFhE5BCjnZ3XMLT2ya6iAuoXcDH6XirdLmw2x12rNxQwBrYI=
X-Received: by 10.37.179.40 with SMTP id l40mr416481ybj.456.1508900811693;
	Tue, 24 Oct 2017 20:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.80.133 with HTTP; Tue, 24 Oct 2017 20:06:11 -0700 (PDT)
In-Reply-To: <CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
	<CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
From: Wangchong Zhou <fffonion@gmail.com>
Date: Tue, 24 Oct 2017 23:06:11 -0400
Message-ID: <CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Wed, 25 Oct 2017 03:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 11:01 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>
> Note that disabling the largefile distro feature isn't supported in
> oe-core any more (the conditional tests have been removed, so all
> recipes in oe-core build with LFS enabled even if you disable the
> largefile distro feature).
>
>   http://git.openembedded.org/openembedded-core/commit/?id=
> a75ccaea77c8aad8d46e87e8ed4af2e2e0ad5327
>
> It's perhaps not the right approach to be adding new conditional tests
> now in meta-oe.


So guess we are safe to hardcode off_t to be 8?

On Tue, Oct 24, 2017 at 10:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I was looking for something like
>>
>>  --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','
>> largefile','8','${PTRSIZE}',d)};
>
>
I tried this but bb reports a bad substitution error (from bash I think).
Not sure if I missed anything.

