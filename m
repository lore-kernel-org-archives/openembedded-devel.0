Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65BFD7F261
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:53:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id q64so755437qtd.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zb8c01aPtau7gKQa5CVBsD0PLF+eauyZ6wXDqRqw8eA=;
	b=rhB+9mLOHcRRvTQ0NN8jq0swF4WgvPNSsLQFwSGKE3mP8yd2eDD0UVWa3Oyfffc+LO
	X0rJiojVbH+48V5BBtA5ttOvOBG9iHA0P15D+YsUwVUyVIGXIs2JIj4esnVvonmgRHTf
	ohyy+3N4LrTGtHtm4JGjDnEpeaIG+qSaWTFk2FuMUY+48BLK4tI0TVeNArSPacmIPyTO
	4dMGXrNx0r56gV5dDPTTraKrrGdFGMRoSz6pXhHBPH9bs4keWj+pqUiQQQxaeUKXf0tD
	1nsBo17hvlqsgK2FhHwvVXgJnEf5aJ1P9j/59L77tANGQGoemPar1xbDVOWT5l8r7qOa
	KSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zb8c01aPtau7gKQa5CVBsD0PLF+eauyZ6wXDqRqw8eA=;
	b=alj8VTLo9W3icORRLGVksjLeh396hRCZaOnDxWT5ER/dXBlljFpJFFoi3Z8Wxh4h7S
	TzLxfzW/jSTw0GiruBNQ6NrsKVNP5xCxVv3otQ3/VeJacrIGOXT1AuCIVQ1ge/9roDOC
	LetLfmrB66XVNEAQ3Jz4SkJfFfBnSNOEl0vGj8VboXZAFvnEDWZzjw3N2BLL2oqzEBdF
	E+ttjBupwwgIezIUaS9gsB841VjpZRevTREvna7KZp41YUHKpzfqpoYN4GStEEhhAKp8
	oD9Fw4y+xXJk/YkPWqLjhoi0y46kkvdsLf38rXu2kH70dhEPQCPv9yfkSjGsWHAnPLKd
	A7yg==
X-Gm-Message-State: APjAAAUb8I0rR1nlJjtC0Oq4Do9st6goP6xGEso4u5SylU0lUwV7QL1R
	fzn45/2T+iivNaL09/GMaADZm8Q6P/rGiOF2Gmw=
X-Google-Smtp-Source: APXvYqymDHo7G/PQIXqxJn0FDavAWK+ntJuBtLP1TGqynNo7rKJ5ZIfMCeHXk1LSzcMLAsXtmLmuruQmy3pxvSCTWes=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr5827758qti.88.1567018433831;
	Wed, 28 Aug 2019 11:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
In-Reply-To: <20190828180616.GA3044@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2019 11:53:27 -0700
Message-ID: <CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Aug 2019 18:53:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> What about marking networkmanager as incompatible with musl instead of
> maintaining an ever-growing mess?
>

if the fix is specifically done for musl alone then I would agree, but
in many cases, the fixes
have been cleaning up assumptions in kernel UAPI headers on glibc
provided headers
which is a good thing, and it does take some time for kernel header
changes to flow upstream
but eventually, they do. e.g. see [1]

> Networkmanager uses parts of systemd as a library and also has own
> glibc-only usages.
>
> Both systemd and networkmanager are fundamentally Linux-only,
> and for systemd it is known that upstream has made the design
> decision to not compromise their software for rare usecases
> with C libraries other than glibc.
>
> AFAIK OE is the only distribution trying to build either of these
> with musl, other musl-using distributions are using less heavyweight
> solutions.
>

We should enable as much as possible we can and not go overboard in
supporting everything
except for core packages where it might be ok to put a bit of effort
and upstream the changes
network manager is quite useful in base images eg. xfce images etc

> cu
> Adrian
>

[1] https://github.com/torvalds/linux/commit/35341ca0614ab13e1ef34ad4f29a39e15ef31fa8

