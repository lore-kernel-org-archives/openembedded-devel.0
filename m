Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABC46BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 23:52:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 3so16383658qta.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SWOIESBwww6OJZiF0cBLufFOE0yGSo7eVDLdsqt32a8=;
	b=XWpVU+kXEntubH7TTe0ym6OQ7kKXG6eotHqZ3eNg/awtxVDWax3G5i/00eETWSG7LF
	uT6VqOhPM5zOX1cEaWzWsFJV4NvRnaJ5AGwNdD46REVwApbfZZmIEc9LUAeaOg2CgFxG
	dBclUSrTcFHO9NypVgDcUh11HRrBQ9ZlWCNaOIgLDU5VzkHb91n6lX4Kd7PgglmPZ0nC
	FQrJVWLHwM7TZKW0YofpPnQ/D86uxTbT3NeAt6qs8vu+cl/8x26tkgWgVYuYnj9jSJhc
	Fn2WV4WNH0UeS/WAbEM8jbF7eufD2Oq3L36dB2i9rQfpyAAu7uAmCmqCzNYE+jwydsps
	bIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SWOIESBwww6OJZiF0cBLufFOE0yGSo7eVDLdsqt32a8=;
	b=SEuU4p3L4vfJtIiA96izlt4YA+6tjknBlCe9kJgif943tmTM2e3y7RrYOpkDFCLIId
	F30oIurXKgwcfoFqbBw3lLPCzhTENwsDokKWfIUanVap9iaROhm+abALnDdw6ZWt6kf+
	z22lxTEGOwz7qdHrFgzUl3KNVZNztvH2PBopC021p/xCYGuoyfb3ONcrRXx2orOBqzwA
	9qdXtSNoZo6G43WZV2kp6dozesdzPv9OfUdupCwfYlp3PBypIXBCBNaQkuWXOd3ij7xW
	/FPmQhGwtgnZT5IvCfgn12XDC44rXLqmracUlwynwz1a2K/SHr1Xr+hZDuSLfyMWbRIt
	KY2g==
X-Gm-Message-State: APjAAAXxNWDNvz1TQAMUP1G6dyJFG9kqtVu5G/WPBngBvRz6f6+Awskx
	PnREm9hLHSjL5trnZZzRh3UajXg+1QvdvTcMww0wOweSzlc=
X-Google-Smtp-Source: APXvYqzggyM5/FC+OpIr5A9jLNxDjmFNTCJnDCYPIfFO0Vk/v6pI9ExJ0mYsmaF9gMHt+xoZmLAwhnMcP2O1XptkJ2o=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr5360300qtr.378.1570837967573; 
	Fri, 11 Oct 2019 16:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191011172818.718226-1-raj.khem@gmail.com>
	<20191011190521.GA20513@localhost>
In-Reply-To: <20191011190521.GA20513@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2019 16:52:21 -0700
Message-ID: <CAMKF1sp_ks30+_35CSv6W6ZRYOsCu9tb18H9dHo-XP88RQ--Kg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] wvstreams: Disable calls to makecontext on musl
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
X-List-Received-Date: Fri, 11 Oct 2019 23:52:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 11, 2019 at 12:05 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Oct 11, 2019 at 10:28:18AM -0700, Khem Raj wrote:
> > makecontext API is deprecated and not implemented in musl
> >...
>
> Does the resulting binary work correctly with musl?
>
> The whole patch looks like turning a turning a build failure into
> broken runtime code, and that disabling the recipe with musl would
> be the only sane action.

I realized that I was trying to fix an already broken patch resulting
in more brokenness. Perhaps using something like

https://github.com/apenwarr/wvstreams/commits/master

Which should have this fixed but for now. I guess I should just remove
the musl support.

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

