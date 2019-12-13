Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E50547BE3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 04:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47YyZ73wVzz4q;
	Fri, 13 Dec 2019 05:37:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576211840;
	bh=cNAelFLAZthkoMG11csM7lvkKAcxh3BnMYio8Ht6+MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/SezO9uki6ONoTqocH/IzVTi5NUv34yhSXsUvmWcVIlQ1psKwu743YdjkXJwt31u
	S18n1xkbv5TIOIf4REJhdmLdprDiZLNayaYoTIytRlzvPj4tkT4q/Q9YF8+A5Af6qh
	O/iihzm8a+/u71Zawsj3WgdWS8vrHXbwAJx72n5QVFQEbOYYXCpIbBmhPgfau6PvD0
	t/ywvXxJiZSP3tyVIMsmbv7XS54S/apqCHrSYM6ynTf/qw3Sk1x9tkOKb65uejmyok
	JzULRUGF4oxRlp7UEIbgy0pewfcYff7emM8uQGZg7aGcF5F1d7LeKFCPsxLPyil5z4
	7q3gAhev7JeblXdB9rG5SDGHYFci22xnMTFfoh0Bj53tmxwK5XcVgCyyHfNp0RMYrL
	qVr5W2a5gncXD26rkzOHa38yh3M2OUxohHYSs3n9H9yQw9VP/IsJmTZIBGJueeEaWb
	gR5Z+0t2LhozI0MHJ5ZrnKOZMm1MIdA5HQWpWYp3eElM6WrQNdr0eSaH8o/lx5rrrU
	wI+2OOCqqV1xvEa0NEfpKphe2kwxoo1QeWMYl0753K2Y6dKWaGdU0Xr1xd3VipcPqh
	5WGE0Gs4qTvuo0DfepHw6v5AnDWIx1DIpOOqYJWz2sdzUoAn05Wt2WHXeF9Bzi/tHX
	fthoFlRag1uvByecxCFILw5s=
Date: Fri, 13 Dec 2019 06:37:16 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191213043716.GA30893@localhost>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191212202252.2786262-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Dec 2019 04:37:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
>...
> +Upstream-Status: Pending

Not upstreamed OE-only musl patches create a technical debt.

>...
> +there is no test to define HAVE_GRANTPT_PTY_ISATTY

Is the definition in xterm_io.h not working?

>...
> +_POSIX_SOURCE is app-defined not system

This is true for musl, not for glibc.

The handling of _POSIX_SOURCE and _POSIX_VERSION differs between musl 
and glibc due to glibc supporting older POSIX versions, and glibc also 
supporting developers of portable code to select some specific older 
POSIX version.

>...
> +-#if defined(_POSIX_SOURCE) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
> ++#if defined(_POSIX_VERSION) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
> + 	    int pgrp = setsid();	/* variable may not be used... */
> + #else
> +         int pgrp = getpid();
>...

So this was caused by musl not supporting older versions of POSIX,
where _POSIX_SOURCE was part of the standard.

The proper fix would be an autoconf test for setsid().

cu
Adrian

