Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA2B7F281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:33:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g4so1095079qtq.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ciWnIpGllG9aVupbzVY7A5L8XmPNlVUo0JtFnU6X558=;
	b=oAiKyFv7/y4NpE1hYWvqBj6K2Y46l5OPqIwyBllbq+zFbYzzXNku8aLGoZABqGbUbD
	ApnzkUlRCHy/spjiwXxDkzxJ8V7411ss8MgI+HLt8KeYs21ks/5DQKtA6qoqLeEs1ow4
	Sd9I55LbkkDLmlYhy06Bhz3Z9yOwYX+q4flexOyQJcLQb0t06Ir1xtoHdSFJvMqF8JVP
	qb6R8Xw+6J+naulzB/R2AZfROue2ZQXtweK+gDpZg608t72pef/VhrldEVzNLvOvAd2g
	EcSB0XylauJ9PZvuHAP3m8Vp7lrSuZad2KQKEhIRPDSDw98UGAD4JDtkCm1GdzRxAp4f
	PB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ciWnIpGllG9aVupbzVY7A5L8XmPNlVUo0JtFnU6X558=;
	b=HgS3lLFVzF/T10s3H2zpuohRLpy4VTt27rSMJWZm5hk0Nbvjk9gc0CxXN6jIZopf6I
	QnwON4K90HsuI/XP/t57ZCYDE/HRfQABxjvLKKd1ehArOdJUkYgM8aLqM6rfh739aT7T
	E5f5Ql9pFZAEBRCS8URVhrl72cn/NZ5OaRUJ6tZpJhDDH+hwMSuClxtvghCv8xOVSIBq
	O5gFNAky72rbIj58FnedkEgtQMuvDf6AfxxeEeGs6yYV4kgAlgqMQEXNFbs5DhAg76Gk
	/Uq5ELi32UzGVVVHR0JkmLSJe8l++PTzO6+JQ9dWmdkckV6iZ8ByaArjreoNcIrqJpsr
	0yJg==
X-Gm-Message-State: APjAAAWN7PRDbiZK/Jpef3NMafeiOSvhgXPsdlBxf7oMuc0XxBPCz2AN
	UDFgYGvOHsfV1SgqGhY6lCkDb2251vB36Q+OB3I=
X-Google-Smtp-Source: APXvYqw6J5MrZl1JT218CTIZpyVKWinZhDYh0ul179b6Nm+raavLa879p+oaRDAtid9C0Mai6UUeuTlJDiEO36d+0Y0=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr6252144qtx.80.1567024399140;
	Wed, 28 Aug 2019 13:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
	<20190828195635.GB3044@localhost>
In-Reply-To: <20190828195635.GB3044@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2019 13:32:52 -0700
Message-ID: <CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Wed, 28 Aug 2019 20:33:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 12:56 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
> > On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > What about marking networkmanager as incompatible with musl instead of
> > > maintaining an ever-growing mess?
> > >
> >
> > if the fix is specifically done for musl alone then I would agree, but
> > in many cases, the fixes
> > have been cleaning up assumptions in kernel UAPI headers on glibc
> > provided headers
> > which is a good thing, and it does take some time for kernel header
> > changes to flow upstream
> > but eventually, they do. e.g. see [1]
>
> This is not a cleanup, this is a workaround for a misfeature of musl.
>
> The kernel userspace headers are the userspace ABI of the kernel for
> usage by all C libraries provided in one place, they are not tied to
> any specific C library.
>
> musl upstream does not even try to use the kernel userspace headers.
>
> The kernel userspace headers used to be a mess, but after more than 10
> years of cleanup there is no excuse for musl to insist on providing own
> definitions of what is already provided by the kernel headers.
>

I was citing an example, you might have good feedback maybe bring it up
upstream with musl or

> > > Networkmanager uses parts of systemd as a library and also has own
> > > glibc-only usages.
> > >
> > > Both systemd and networkmanager are fundamentally Linux-only,
> > > and for systemd it is known that upstream has made the design
> > > decision to not compromise their software for rare usecases
> > > with C libraries other than glibc.
> > >
> > > AFAIK OE is the only distribution trying to build either of these
> > > with musl, other musl-using distributions are using less heavyweight
> > > solutions.
> >
> > We should enable as much as possible we can and not go overboard in
> > supporting everything
> > except for core packages where it might be ok to put a bit of effort
> > and upstream the changes
> > network manager is quite useful in base images eg. xfce images etc
> >...
>
> When you are using networkmanager and xfce in your image,
> what is the point of using musl instead of glibc?
>
> Networkmanager alone has twice the size of glibc.
>

Size is just one of many reasons to use musl not the only one.

> There is a benefit of a small C library when your flash space is
> single-digit megabytes, but maintaining plenty of not upstreamable
> OE-only patches for using networkmanager on musl without a sane
> usecase is a waste of effort.

I have said it before as well, I will say it again if we can improve an upstream
packages portability that itself is a good thing, but we should not go overboard
if its too much of work. there are container distros using musl so we
have a wide
list of packages which work well with musl, and this list is always
increasing, so I
would refrain from pushing musl to a narrow usecase

