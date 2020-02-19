Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6758761579
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:37:25 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c20so21710526qkm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xTGuuV3oKpItfftOyBbfGkrxtK8e/s9MIK4Cl8WvGCc=;
	b=l/G8M55fhUKUvWvqulNXyxiNRj82yyU3PERomBK6MzRWYGUQllKbeqFNGulGCnsYZC
	7H6DlJst/3tGVGpkXVwyu1kHll67zx+2ljTrkLo6sofIO9lbPbNCmz181oamNQs4wHTn
	3E4Bmkt3DyiOcPOM13cZsTtY3dt9z4eLSmEygHlDdTocuJt/aHMfmQMnMdxlKpGGS+ZJ
	LZ3OdPqMfPhWR8sejZXoL2/wt/wPZC9eznyxMM8Tm/zC3GRrYFHEdOsejp0HSfA+M+fm
	6wc2KBugjk8EIv3VF8BaEGwHOO+wheOi9b3IfwtmOOFz3dx+jKyWb6rKYgyX4Pl9DpCG
	ZhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xTGuuV3oKpItfftOyBbfGkrxtK8e/s9MIK4Cl8WvGCc=;
	b=MBFzo58v85GvZIw86g+52ofL1jvXxOe7Js+gunt46THaXfLY7pdLkFOnR61KxL2Cx1
	NB+mrGoUJNFX6Hug2hN6IQGmlL12n7Gj5HVFW9T3WPo18Zy5LKdCXnFw0HDFnLTrhjv1
	cZu6kGrtas7meknHiSPclJomKZPyPx67nnao/+Cv3/o11tShTdQ5lqOTqJCDg2OlkdUq
	//+hRObWyK9K2FK6NLR/ZSQ4jrP86PWqdyHtkX2pm0poK6j9VhIF+oRktCwoW2LkXbY9
	yxX0klGSrxQLS9k7UCKG5FuV1w4gkJlYQmT4A45/jwEJI2wf+p4rb6BLVDDw2BMGpK7r
	/1sg==
X-Gm-Message-State: APjAAAUeVktkE0F6P5dL26ynKaB1tU42IydWVX95gvQpKVIM5PYdYJpO
	DC/JVUZHRBgfa81CZS/ccghZpIpEZvUvy1KfCYc=
X-Google-Smtp-Source: APXvYqxFvIHHaUEIzCVszA21d7gZhRJNuw+tXfZBOGC1Yv6irAMWrS5lgkRJpiVxkrll+ZBXEl2yQuaQIeH5MY/ymkI=
X-Received: by 2002:a37:e317:: with SMTP id y23mr21510652qki.431.1582079846129;
	Tue, 18 Feb 2020 18:37:26 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
	<CAHrpVsXMkZydpmbXPdQJo5qW1=DpJTqSUghNjTnZahqCg7hj9Q@mail.gmail.com>
	<20200218220922.GA24326@localhost>
In-Reply-To: <20200218220922.GA24326@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2020 18:36:59 -0800
Message-ID: <CAMKF1sqFB0WcEfATO-iFy6N0PObDWLT8uKFEaao-FSky4ecAfQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: upgrade 3.17 -> 3.18
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
X-List-Received-Date: Wed, 19 Feb 2020 02:37:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 2:09 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Feb 18, 2020 at 11:37:33AM -0800, Jonathan Richardson via Openembedded-devel wrote:
> > I was just about to submit a patch to remove the disabling of compiler
> > optimizations to fio. On our cortex A72 this kills the performance of fio
> > by 25%. That would solve this build issue also.
> >...
> > > https://errors.yoctoproject.org/Errors/Details/391129/
> >...
>
> t/io_uring.c:103:17: error: '__NR_sys_io_uring_register' undeclared (first use in this function); did you mean 'SYS_io_uring_register'?
>
> This error does not look related to optimization.
>
> This looks like https://github.com/axboe/fio/issues/923
>

Thanks, I think this will fix the issue we have at hand, Wang would
you include this in a v2 ?

> cu
> Adrian

