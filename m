Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB1771A8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:37:12 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id l40so814202uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o7NUzxI9gD2B8wvLkZlwcuR0PXrTmFYVPtwOsnNJnKA=;
	b=ct0tz8sGtG/VC0IIPMPNzU9iL0hEPxuJjtELkPAwx5101WZ4tmU4p6uUjAX7ELXx++
	RxIrOoFbC7UsIKpGE6TbLKVsILuC5dprkm6bkXLV5lEQkSJMk9hzSV1zj/2TDQuCzt1H
	Gy+Ow7KFm6bmoMwTjn3JEkVUew4GyMqAY5C3wZAQCOEtuvhshLas4PzZgZzWKqsOASlZ
	H3GzOld1S/pxGvW1E3ArImugR7Rz5+a9UelY9q2yg94/Z/qIATW0CTDcwuEhlPoKZeqA
	Rmv1T6gUCqsP6/IufzEtrM3AGzD7LHkcBMcWxGHEF7BYVvpiUp89lXMk9RJoBQ97UM/h
	nVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o7NUzxI9gD2B8wvLkZlwcuR0PXrTmFYVPtwOsnNJnKA=;
	b=NoVlgRv65gg3wJ5jozn9l++BAcZzRzHycJ8iwWf9vYU6HNuzgiTrTNn+zw7h0n//ND
	ApT2XNtzRDJx6mLjRSh2DVFdAU1bg7FybRLFAN3fomba5FNk3e0r+8dcMa1uCNsxmaqw
	5iYEUw/iydqqdti2vI1VxVJzCP2SJAVk9HPma6yVpUlirUwutmhiDNSLGLYjQnRxWRSx
	Vf8khXA3WmdD6HhO8dBFvvGEHEE8ZtWu9Sqn1+aVZia5hsss0/dRMTldZHT/oWO8VbIW
	hVowOmcJy6cD9z7/absfjSpA4BV9sRCsFPdGVYLCbykt2NHB9JPxpWVsg401C+mav4dJ
	o50g==
X-Gm-Message-State: AMCzsaU/acDxDXajj20IJYiDDkQErqPE33LzT8as1dSwukZ7HeUp1Pgj
	vAvPTPMeCEedYIMv0/tkY/QXFNzEBkX0xNaejzA=
X-Google-Smtp-Source: ABhQp+SJo1CFh2vZOA2NkLsfrrD9H0qMGsLKuMsmIaWoOukfjimKvspe/OhR1M10f1Aj8JG4Uhkm1zDQY+83KPuOMlw=
X-Received: by 10.176.64.131 with SMTP id i3mr5137650uad.195.1508236634036;
	Tue, 17 Oct 2017 03:37:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.72.69 with HTTP; Tue, 17 Oct 2017 03:37:13 -0700 (PDT)
In-Reply-To: <20171017102804.GA4387@jama>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
	<20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
	<CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
	<20171016160529.c8698d8408842a1b6df4aea5@linux.intel.com>
	<CA+chaQf0YhjxtdFqEYjuhPgdCBOqe38pvUYwqHXrgqq4dHAvHQ@mail.gmail.com>
	<20171017102804.GA4387@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 17 Oct 2017 12:37:13 +0200
Message-ID: <CALbNGRRkABNh6DOfHqoP8M-y2a0V9uCVidgEinG13STDd3-t0Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Tue, 17 Oct 2017 10:37:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 12:28 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Mon, Oct 16, 2017 at 10:58:16PM +0200, Martin Jansa wrote:
> > It's already in master-next, if it builds fine, I don't require v2 to be
> > sent.
>
> Unfortunately it fails to build for qemux86-64, so v2 will be needed
> http://errors.yoctoproject.org/Errors/Details/157327/
>
> With -M <small number> :)

Andreas

