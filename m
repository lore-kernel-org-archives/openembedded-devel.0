Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF4A614EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:37:13 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z16so24436337iod.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fI6TZWo8jRDqorl/N8i/YP2sZoAYFLrLIJDCAbGBNGk=;
	b=Nynxl0M4X5lr7Bqvw8wfQJ8TvIhltCsoSIKdRjQy1LjBSa3neut7r7vHRUVESgw4HA
	A8sQVU1qByFc9E3leJ9KiLNNhXIi54VPn4+XHaWXvtBnW5qf6K6ISqaJY9bLxVB51o4Z
	RfPesYNXs9a291dULH6uvaNc3bVw3aeKK4MY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fI6TZWo8jRDqorl/N8i/YP2sZoAYFLrLIJDCAbGBNGk=;
	b=c6f7rR611x4EWat8oJTIvdcuKdc4Q8IVMwo1Tvj2Tc+oJmsUGHUlKywd0QvJ0WztFa
	uOQqnN8rsi0vJcWHNrFVDCqI/EOOuMXzogO3oE+aoYbHytxmKoHOUaxhkVM596sp8h95
	ypEtGcv6i2Caa5J7Xc8eBOwnv17lJAfIBlP7W7KeL0ZdZgB/hW9rFlnMyuJJa38V2UQK
	wy93qPPdHKLkZdyq0ro6Fg4iSEo5y8Ogx87fUp9RXXvFt7G7H89u1ZphdrtaCk2vRd9h
	35+X7GffXIIm3tcZ6XGVcNdzk4LQsJYo1/q73enigEJF35vLy3JyZOV9L2S02SZFZcs1
	oJMQ==
X-Gm-Message-State: APjAAAV3wkiEH+RYtBbT1wSzb4KY42eqnYh4xlNNLOQgnSpJja2E5oF1
	sgn0hoo+Vc2isVkoMVh9mvHPDbREVYfBlmHCuzBjug==
X-Google-Smtp-Source: APXvYqyu47+I1EPxD3037/4+w/jB27cwinn99Bp0MPPbhX+JaIPSjYsD42oWX+VC2TSG6qXny+dixcK6GdUkhNRq+3g=
X-Received: by 2002:a05:6638:44a:: with SMTP id
	r10mr18312318jap.36.1582072634570; 
	Tue, 18 Feb 2020 16:37:14 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
	<CAHrpVsXMkZydpmbXPdQJo5qW1=DpJTqSUghNjTnZahqCg7hj9Q@mail.gmail.com>
	<20200218220922.GA24326@localhost>
In-Reply-To: <20200218220922.GA24326@localhost>
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Date: Tue, 18 Feb 2020 16:37:03 -0800
Message-ID: <CAHrpVsXGTU_VDF8o9XSYyCVuwGxvgQ2vd8Ap_kWyY2=vj3MukA@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 00:37:15 -0000
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

Yes you're right. The error is another issue. The message I was referring
to is actually only a warning. It should fix the warning only:

  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)

