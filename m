Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41F3C7FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 20:50:53 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t5so9401854ilh.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hKdsHzXDGpnUxP4s4cZhCJsLYVfkqEyy8+YJnMCbFKQ=;
	b=kJ0NLSfgU2eYsMZYzdf6KBGLZ2Da997U/PkLn8R5gNUzd1uEF4VV6SdpBFmU0qQxV/
	yHferBX7GyqyC+a891BU62CHpWY0cE5xo7Kz+iGTO1xPxIF6JxdVxOU9KIIW1bDqZBrC
	QmdlRoQe1NhWvKKAI8vsu+nkCqKJolzFyahHEkYbUaaL+1Zi9wmzLSYhUbCBKYWLVtKt
	KJIfrdtmy4DOMH5W4XNhnEe6npSDbHW5ckwYmiZqQywg7NbNvA6s5nCoFZLV0mKeOgh8
	lfVWmitH9BxlVqZkfoj3ayL7P3BVwgtrWzbR4uuoqFoikr+ks8UYDMsL4yCXOzWnybJP
	Eyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hKdsHzXDGpnUxP4s4cZhCJsLYVfkqEyy8+YJnMCbFKQ=;
	b=lg+n9592PBNBUQm/ZQ6xb57ObPfzHnF27RqHqQNKKQ8uifMMsQPkIpbOMtEihlFObS
	AnKRBI2tWZNVXqimDYdgswg9Njvim0JLi539q+JQpYdGThjz0e7rUMRbFTpz521Kz6aJ
	c5eQdxe6lay4p+DKKiW/5RE6syDVSYCDlimuKr4sCu4e6XlQaAzPObV+JDZkG+7ZQXea
	jpUPC6NIbU+8HdCKA0Spy2X8bBzd2FvJfviDKUtCy24oCY3Y6+qxWP7eVhkMBMx7Euus
	kHkMNTExkPvkKWcXCdZq4cw7oU0ONBxmgckVzl1Nu1iZlokxw/qyuzR9rLG1NzUGNFvh
	IPIg==
X-Gm-Message-State: APjAAAUvaxYO116fE0ESm/LpTzfte8p5eq5oW96eTbk9ASb90VuT4Po3
	WNPpu8sqL5Pr7vM0QHa+1RrARri1YNPajdC7XnaXqKnL
X-Google-Smtp-Source: APXvYqzPdvKT8L335yCMQKh4zF6SPtCqHImPHIyiFyFk9gOYrq3oC93c+w5yXtW5klGKivxx1XT+2uK9e6TZq6ue/kU=
X-Received: by 2002:a92:b105:: with SMTP id t5mr22749180ilh.299.1572295854035; 
	Mon, 28 Oct 2019 13:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
	<20191027233545.4146-8-schnitzeltony@gmail.com>
	<CAMKF1sqVM6zVRftnq_fsPXRxp=fR+mEeofhgw6LFd3vgOUNFLQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqVM6zVRftnq_fsPXRxp=fR+mEeofhgw6LFd3vgOUNFLQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 28 Oct 2019 21:50:42 +0100
Message-ID: <CALbNGRTmZWpYHDiG_2uXaQyGWi0GPwTvXhfsUcsNJ51Fx8AWAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/19] colord: initial add 1.4.4
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
X-List-Received-Date: Mon, 28 Oct 2019 20:50:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 9:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/274841/
This is exactly the same error V1 caused and it was fixed in V2 [1].
Wanted to look what you applied but in master-next colord is already
gone.

So I have to ask: Are you sure you applied [2]/[3]?

Maybe I caused confusion by not naming it V3...

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/202531.html
[2] http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/202550.html
[3] https://patchwork.openembedded.org/patch/166279/

Andreas

