Return-Path: <ranshalit@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD646D09D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 22:00:07 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l11so24083568qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yMzouFpnanVuOqr3F6pWxSxVDMI//N6Ag9CjBPO5G0M=;
	b=EmIm8ot1O/aHE8dIOTvRLSr3J+T8lEz2h7Edp3AgIqCdYlnmS+hruqYhrL0s8tzUX7
	ZuphlxhS0GRZCChf1N/KMWXemRtxITsiYF/gdI6RhW1hfaHsrYGWQ7CMxarrXmah/cPI
	clLLcdk+L4qbFnb+1pagCh40Vp9jK2YJePdnvkHLp1HZ/mugoPJoD1u6svWIxyrFfi95
	9qSM9P4kJrQDNnB65biio6sEyyfU4UnJPnCpIn6Qc6QdvcI7eDPo6tzOJ8Xk2uVq3NG9
	aqSGsZj2gsDsfEG6dHtFQ/q8fxcB7t0BT0JPcJLI1aXkTA5dqNS85hg5PE/1/aTyNq80
	r0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yMzouFpnanVuOqr3F6pWxSxVDMI//N6Ag9CjBPO5G0M=;
	b=C4VF8QXYwFshGs5IQox9gJMlXqjM3VkQb613fMPD8KshX6BDITOxuGe4ick9n9rJck
	5ngnTSaM0af/rBfUQvTwUSdEtaRa6O3Ddc+4RxQOmOxd259LPpWlnGUd2YtGY1qIoADK
	CO2VcssCzrVCY8N4Hqt43KDmuGQ8qnOdhfanFSXjlWveqzC3NzTw3E+QgXVvkn8D3edB
	zQWLcYrh3OpgUb7cyVioCtkWnr48l404Ofxfm5FvxdnPOw0q2Bw3fC0JZttg3cb4lguT
	PgEDHCN6sPfkfQRwPbW0ARtHZ2sZvT1TSKDOVhXbkBLVsGT/xh6+QfQpbSELSlmDeP+0
	X7pg==
X-Gm-Message-State: AA+aEWan10geEy4FnkkbWEmhJOWGQD6pSekfbuLpS5+y4UjKDpmZnjNb
	1lBeIjSwQKGzWBQe7W78EJzPh+1OrvJGxpMvl+Q=
X-Google-Smtp-Source: AFSGD/UYo54+tQT2jFE7Tt4oYq7gmDhLr/vhet5PGIPDcWHls6+78QIkFxAr9bgQk2SkRo8y7I4VTaGvIUJm1kcpvpI=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr23660563qvj.228.1545256807920;
	Wed, 19 Dec 2018 14:00:07 -0800 (PST)
MIME-Version: 1.0
References: <CAJ2oMhKm02QeiF5dqpvYqeXBRCo+jWh=cjb2Sj2DjAt+ZqirTg@mail.gmail.com>
	<CAJTo0LbddHddV+sFk326_Rj5GCZpaiMft77Zt_O_HQ5f3w-f+w@mail.gmail.com>
	<36c4514c-fc6e-9c30-88b3-4f70a9e6a716@windriver.com>
In-Reply-To: <36c4514c-fc6e-9c30-88b3-4f70a9e6a716@windriver.com>
From: Ranran <ranshalit@gmail.com>
Date: Wed, 19 Dec 2018 23:59:55 +0200
Message-ID: <CAJ2oMh+sKWg1grq4xPxo094pM6kVKEhCr4LhXo1MtLC+cdnA-A@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Build suddenly stops and desktop logouts !
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
X-List-Received-Date: Wed, 19 Dec 2018 22:00:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 19, 2018 at 11:12 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 12/19/18 11:24 AM, Burton, Ross wrote:
> > The usual causes are not enough RAM (so the OOM killer steps in and
> > kills something inappropriate), bad RAM (you're actually using all of
> > it for a change), or CPU overheating.  The latter two often cause
> > actual reboots instead of logouts, a logout suggests the OOM killer
> > was involved.  Setting up a little bit of swap might be useful, or
> > turn down the parallelism in local.conf.
>
> Ran,
>
> Grace/Mingli is working on this bug:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=11802
>    system spontaneously logs out while building core-image
> If you could help her to reproduce it in a controlled environment
> that would be great! The stumbling block has always been that
> it rarely happens and is difficult to reproduce, iirc.
>
No problem, I'll post there.
Thanks,

> ../Randy
>
> >
> > Ross
> > On Wed, 19 Dec 2018 at 15:27, Ranran <ranshalit@gmail.com> wrote:
> >>
> >> Hello,
> >>
> >> I have strange behavior with ubuntu16.04 LTS, in which after building
> >> for couple of hours, suddenly the ubuntu OS logouts.
> >> I see that others also have the same issue but seems that there is no solution:
> >> http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130617.html
> >> and
> >> https://stackoverflow.com/questions/48148169/whenever-running-bitbake-stops-all-application-and-locks-the-system
> >>
> >> I have increased my virtualbox memory to 11G, (no swap in my ubuntu)
> >> but it still happens (might be less than before not sure), also
> >> strangely even after increase with "free" command I see that it get
> >> sometimes below ~150M free.
> >>
> >> Is there any idea what's wrong?
> >>
> >> Thank you,
> >> ran
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> # Randy MacLeod
> # Wind River Linux

