Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D8F116C1F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 22:58:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47ZR0b0nrKz4q;
	Fri, 13 Dec 2019 23:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576277904;
	bh=mBlO4msUnw20LBhY1EURyeZcY1eSBkm42K50tdMhUjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DG4dZfi2Rgoiy0T9yo3P0N5LKuTdb/Amj9nK7yy5S8on42KYjxhcr5eNNMBuKazMQ
	2i/XoobOIi1f85heyG2DvsHurZRwbrxlc/JbGixpUgcaC6+pvNywolpC25mzB+XZfM
	AIv4g8pLEfYwQ9SFAe1yvHD4gTA1PDLbS6bKq6aN1lauZTdzCtHsxj1guqkMuDwZw/
	58q0PJtCcEZdVom0S4yAJT8VaX7EPzxOy09iconz5kiVskEncotS8e5t7ObJxfq69G
	3264LZg71MxzHPaAQtPn/c4UU9ghzf+ZRKKwoGvMYUQsyKHKE43BGo732mIu2xM8+O
	svf4H+9QwSL4hx3DCwvTbpZheQFXdRQrcSPIrfczXNLB+jn+yeoOeMUQjCxK3ipJii
	IGVCbHWZTjT7eWPCT4GKIq/zFxWuzprv/sC67x8QKMS4f64TYD7p5/0Ia8W8yWSM1k
	h+c/WHI7yvqA+3s2nl2Tejc3B2R63bzGAPe3KuHX/+dBshpqFqiOddJ4sQbDe35lGA
	zBTxP7RhFdoF960AVuDwZxfw/oBtZ29XNz+/rmfYY3oTVItU+DBnck8kC2SX9sLSp5
	y+7gAJooGY0XPtg6YeThPGZiyj1/36mDfRtGVyTiy2p0WijBYXzghjfK8Zt1gl3QtX
	y9Ce3vfW9XJSDM2L0gfkSHHA=
Date: Sat, 14 Dec 2019 00:58:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191213225815.GA8776@localhost>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
	<20191213043716.GA30893@localhost>
	<CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: Fix latent issue found with musl
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
X-List-Received-Date: Fri, 13 Dec 2019 22:58:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 13, 2019 at 01:55:33PM -0800, Khem Raj wrote:
> On Thu, Dec 12, 2019 at 8:37 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
>...
> > > +_POSIX_SOURCE is app-defined not system
> >
> > This is true for musl, not for glibc.
> >
> > The handling of _POSIX_SOURCE and _POSIX_VERSION differs between musl
> > and glibc due to glibc supporting older POSIX versions, and glibc also
> > supporting developers of portable code to select some specific older
> > POSIX version.
> >
> No thats not right.
> _POSIX_SOURCE (like all FTMs) is
> defined by the application to request a feature/standards profile
> it's not libc telling you "this is posix" or anything like that.

It is also defined when _POSIX_C_SOURCE is defined, or _GNU_SOURCE,
or when the default non-strict gcc mode is used.

The latter means that it is in practice nearly always defined when the 
libc supports applications written against older versions of POSIX.

> _POSIX_VERSION tells you that
>...

_POSIX_VERSION being defined tells you that you have unistd.h included.

With glibc the value of _POSIX_VERSION depends on what feature/standards 
profile the application has requested.

cu
Adrian

