Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C72867489C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 22:27:43 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id f79-v6so16349152oib.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lLh+ui20x2WMH8NXEsjrqRFdWa4gkcgDj8q0qStM2Dc=;
	b=gsTZ006EsIoHXxhEkHaqRdcuLyx4bbrmSVjq4cjpPsHZnpU+rQAX8KahZbSmELK7d6
	IiB3OuSKbHCCEXtkK60KzhQVJZ3UzZzDpVsdhFomWwOINXXxap/7PmjUAyg62dywQ7t3
	6RdgDodF3MnuYpjNgjxarosEDpZAhrXuC4PdOcQgjHSfqrSB/x7u8SADKoz6hq0XYMYp
	JG9Ld4E+Zxe4VdciM6lc1qFAAFG+3nA6Qgwrs5YPXB75U64xCMs1W5tnP38LTSdcKApV
	+c9DDlk0ef2iMqNVuWVTkZGS6RJYF0SFtQqBbHqchU6JrVwPJQIBDoYP2aauGkbzPvdQ
	zDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lLh+ui20x2WMH8NXEsjrqRFdWa4gkcgDj8q0qStM2Dc=;
	b=Fz1wAWZol+K/SSp1+b0foYXRRZ96GrApnaU5oOGwKrzdFMJz49z/r03iWyTkcOH1NM
	PnbpcpgEbXCyocrZr3J2aAZCZwRYog5cyHXskjRkCG/PvxT02CEF8xwr125mGQpKr3lq
	u60qVbQ1qFAxlWST+Z3e/1tWUStG4SGK4UFpz0XQXaaRWGc/DF4Uot7q3QPJEs0x2jUD
	12OlT4k0IBO+dnvTJTrpdpI/zlC17pg5EaQJMmeXrG5V7LnaDe/fKeML7Z2CotA0ATxm
	UUmUCWuyxpzNrNrXr0qupmPiFLLDFaeD6/GlJ4Cj/w2pbpAgpRCsNG+JLCPzbH/LU039
	4y7w==
X-Gm-Message-State: APt69E2ujACtTXQq2ka/RCOamtroJAyc85ABLQ/emkMqwm+XjbkgZGUK
	kVxC5hO5CPRUXfN6JT+eKytYfn/UxGDvyE21bTc=
X-Google-Smtp-Source: ADUXVKLkU1zoFW1cCxS8aBSS5nnjgNmcYFTeRW2/qFGP1fSs3HrVgxfeyesTcid0RcGAuKTi4a2K4CxuvMk8xulKpRU=
X-Received: by 2002:aca:b01:: with SMTP id 1-v6mr8307447oil.285.1529360864760; 
	Mon, 18 Jun 2018 15:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 15:27:43
	-0700 (PDT)
In-Reply-To: <1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 19 Jun 2018 00:27:43 +0200
Message-ID: <CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 22:27:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 11:42 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
Off-Topic / FYI for me gmail considered your email spam
>
> Removing the libtool files became the project default a while ago (Jan
> 2017):
>
> meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
>
> so I suspect you're in the minority not using that now.
Maybe true. But breaking builds consumes resources on many sides -
this thread is a good example
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro/defaultsetup.conf?id=3e2a47fdfceccd5f8832235b7a2df83076e84a98
>
The more I think about this:

* Why is remove-libtool something a distro can override? If causing
trouble it can be deactivated recipe-wise.
  - or
* does anybody see a problem with inherit remove-libtool for all xfce
recipes in xfce.bbclass?

Andreas

