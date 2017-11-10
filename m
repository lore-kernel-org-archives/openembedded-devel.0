Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBE3719E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 19:49:25 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id q33so8727052qta.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L5cVUfmzKrOpSfuNSY76Ja6d2dYySH1QADeqtqTBKFc=;
	b=HPFn9eAmnOWWX4yM+aVOmHNdJh9lF6N3d6aBBxUI3ul+rXeG1H6aMpXBLwWpCg0wgZ
	9mkVRP4lk2HQaq6ZmrWmMGWD6gtvNnysCUL3aX2xY/e8SDShx4dmeDFKpYjnvWITqW4r
	/rk79nS0ZAr8VjogTTX7YGyH0moUvKT5MLx6CfPL00gq102jOOGeF9CJxDbWauttsTyu
	Jd1rEDOnlViy65tVcXt37e2b+ehcF0AuSTinAeh9t4v0CbqYoIv0wq0Iesai39PEGxBB
	iV7kTOVdrEzWFGb/hpJLMUpK9DafrrBc8fDl5nrnaw1MeaE0tAIjLEsFgdeRLRWGSii8
	+8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L5cVUfmzKrOpSfuNSY76Ja6d2dYySH1QADeqtqTBKFc=;
	b=jbIfQr9LVmwubyHf+dVYt2vdHYsm0Ccvvzs7WDFqgOnmYqzX7pM8Odw2jkeMixjaXB
	1uV/dUWV3auG07AwKjpWzY/me1OlNN09ItiQJAiHFOX1WkR4nN6qyKZTdASQwetJf87X
	X8Gj/d+ZtTQiqUkyarP8sT2xjy+y/XoGA+xqH8MtHt7aTW7J2PmPklCsknifku+Zc7zv
	V87AFboYeVNDMF8Tk89fryqbDdOwVgjOJfRWSsXRSZLjRDlrdDWqJ1Ljt8y+WnxxgQXl
	TZJWmcEOfHp6C94zRYDcVCDfq4irzi8vddl4ve02AiMwRfvycWkYe6T03rD8T8I7XvgD
	zYUA==
X-Gm-Message-State: AJaThX6inj/6t+zm3FoZrFuZdEv7ESPxMMUF4J/Ed2zrc4wmhnyM35uF
	zp1RSXtHhJuezg8AYEKJ+OENe6IgwPYviFebhpc=
X-Google-Smtp-Source: AGs4zMa/4auT+0T/kS+VkpI4GUS2HXnXWAxpI8eb3CKa+KtxjhdIA7fkTWcCbnpgGAtw0e2rnE2lcfTxBc00COv3Rwo=
X-Received: by 10.237.54.40 with SMTP id e37mr2590169qtb.41.1510343367021;
	Fri, 10 Nov 2017 11:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.199 with HTTP; Fri, 10 Nov 2017 11:49:26 -0800 (PST)
In-Reply-To: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 10 Nov 2017 14:49:26 -0500
Message-ID: <CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Fri, 10 Nov 2017 19:49:26 -0000
Content-Type: text/plain; charset="UTF-8"

Raphael,

On Thu, Nov 9, 2017 at 11:28 AM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> There are 60 new commits in my "chromium62" branch

This work is utterly *brilliant*! BRAVO! Thanks so much for sticking with it.

> Possibly controversial issues:
> - The ozone-wayland recipe has been removed (this is actually commit
>   #1). The ozone-wayland project Intel used to maintain has not been
>   maintained in a very long time, and it is impossible to just get it to
>   work with Chromium 62. I'd also rather not keep Chromium 53 around
>   just because of it due to A) increased maintenance costs 2) we'd be
>   shipping an ancient Chromium release with tons of security issues.

No issues from me. Originally there was only one recipe that included
both wayland and x11 support together. I had proposed, then done the
work, to separate them out into two recipes because keeping them in
sync wasn't working. If nobody is keeping ozone-wayland working, it
doesn't work, and/or it's not being worked on upstream, then I have no
issues with it being removed. Just to be clear: if somebody finds it
useful and wants to support it, I'd be happy to see it come back. But
at this point it appears to be dead and I don't think it's worth
blacklisting.

> - musl support is currently broken. I've sent a few patches upstream
>   lately and added a few musl-related changes to the Chromium 62 recipe,
>   but getting the code to build requires a lot of time and
>   determination, and if we don't have someone actively working with
>   upstream it's just going to be an uphill battle that I am not willing
>   to take upon myself.

I'll have to defer to Khem on this one. As I've said before, I
strongly don't believe meta-browser (or any other layer other than
meta-musl) is the right place for musl support. Musl support should be
in meta-musl and not spread throughout the ecosystem for everyone else
to worry about. But I don't get the feeling that I "won" this
discussion in the past... ;-)

> - The 'ignore-lost-context' PACKAGECONFIG knob was removed. The patch
>   it required no longer applies cleanly, its context refers a 5-year-old
>   discussion and it is not clear if it is still necessary at all.

This seems fine to me. If anyone still wants to use the
--gpu-no-context-lost cmdline argument (or any other cmdline argument,
for that matter) without the patch, they can simply add it to the
chromium-wrapper.

> - In the future, I'd like to revisit the other PACKAGECONFIG knobs as
>   well. In particular, it is not clear to me if 'impl-side-painting' and
>   'use-egl' are still needed at all,

Sounds good.

> and I'd like to drop
>   'component-build' to simplify the recipe and prevent anyone from using
>   this option in production.

Yes! And if you wanted to remove DEBUG_BUILD too, I'd be okay with
that as well. I'm confused as to the status of DEBUG_BUILD, it seems
to be removed, but you're setting debug flags?

