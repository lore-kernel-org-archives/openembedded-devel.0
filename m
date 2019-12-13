Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9237F404
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:55:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r14so13372qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 13:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qf1yyGGM406TxMa9cpsA1Pr49tE3u+A62dC1uTgTBjU=;
	b=mz8bgoAwvM/MDUBMA7fubBTNi0ooUc8x9e1MAdXzOdbZcGp5deXQ2cYemLPqtHRLAa
	BpVGi5tMYU+0paaJXXCKmPb4FkXZq2iweEzdjr+ZeE6mWiYhuC1Y+gtDbZvu79m2KcGe
	WCW3sJSCCJL/R+O2CaRpT236iEANoh9i2aoqUCeAZ4vXrKvU+heSOtFZCEsGFCQLIG09
	fOcBy42dzjllCbEMugYmJqI+2FRoRzJqhkn46vjmoHgks0OGscK7gFc/G06DaYNxMwob
	dT4W1fk+yBNcguBpBdEV6/K9QXN1uFPRT5ZicxtpDOWd1PGa21K8LsinLzbgPTxjJBwg
	YSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qf1yyGGM406TxMa9cpsA1Pr49tE3u+A62dC1uTgTBjU=;
	b=bkokuE0ibJLRD6TzLIRsLvJdJ63ybUS3ccowljNRFmb37OnY9kvBhz0HN05CjkajoR
	dZPVtVM00Gg7RI6Su8k2m/eI8G3Cuytzlv0VoSXrOrAHKi2dzvZglHsfHVMcCUrYroFV
	THi2oo7l63NVU+pK+ddCkzNfqVb3W7mTQlKl8wNe9mFYBg9QMlXwsoZc7acY/vBRi5BJ
	rdE6g7LCEsSfnqCk89dHarnyVWFXbglV76y3JpIc2GigcAd4QDzgydad5f5tY8CCk0St
	cjQvkxNLV1u1JXWQcMjAAULSa/eT53NN4jsCSGLe2yZxw9ZsXOS11FpC1wpm08AwdZcS
	Tmqw==
X-Gm-Message-State: APjAAAVbRAMLYR8FlyZi0wDeKSEQY7ZJbV5KXVnp7NCUGNVBE6eVoEX0
	60Ben97NICCL2oMW2/pFgs/0AhMTZGYZxJLAY73logNhstk=
X-Google-Smtp-Source: APXvYqymjbkbFmjarrjjH6YHzn0ckPuRw4dsXUyahuPE5NvIcq2zl8CAjXeGWy2JzNw0MdE/Nn6nUtbIpxrZOpnYYFg=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr16234432qkh.9.1576274159884; 
	Fri, 13 Dec 2019 13:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
	<20191213043716.GA30893@localhost>
In-Reply-To: <20191213043716.GA30893@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Dec 2019 13:55:33 -0800
Message-ID: <CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Fri, 13 Dec 2019 21:55:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 12, 2019 at 8:37 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
> >...
> > +Upstream-Status: Pending
>
> Not upstreamed OE-only musl patches create a technical debt.
>
> >...
> > +there is no test to define HAVE_GRANTPT_PTY_ISATTY
>
> Is the definition in xterm_io.h not working?
>
> >...
> > +_POSIX_SOURCE is app-defined not system
>
> This is true for musl, not for glibc.
>
> The handling of _POSIX_SOURCE and _POSIX_VERSION differs between musl
> and glibc due to glibc supporting older POSIX versions, and glibc also
> supporting developers of portable code to select some specific older
> POSIX version.
>
No thats not right.
_POSIX_SOURCE (like all FTMs) is
defined by the application to request a feature/standards profile
it's not libc telling you "this is posix" or anything like that.
_POSIX_VERSION tells
you that

> >...
> > +-#if defined(_POSIX_SOURCE) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
> > ++#if defined(_POSIX_VERSION) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
> > +         int pgrp = setsid();        /* variable may not be used... */
> > + #else
> > +         int pgrp = getpid();
> >...
>
> So this was caused by musl not supporting older versions of POSIX,
> where _POSIX_SOURCE was part of the standard.
>

see above.

> The proper fix would be an autoconf test for setsid().
>

Thats a good idea. I have sent a v2 which adds a configure test got setsid()

> cu
> Adrian

