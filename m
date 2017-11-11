Return-Path: <ian@boundarydevices.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E9A1478436
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 00:10:15 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id v137so13917683qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mPsd7OFksWRXYdDa4hCYk3GDmrejym4Tz4elPchUB+0=;
	b=HwNJn16DZe1PVSIM90MwUqZIyTe2SgaIPXsFY7BOXV4GeRhi2Ih9g5orsLiR2koA7+
	uI0W0IzKmmWM2v1jMNh2Rrw1qXNe+4WQetkCx+g3G+IDyBmlZxyhEHl1WN6tuaLU43Ca
	YAIi9pjvDVcPikJNScNyHruQlXY3hOLde1sa9E+FneQn0bHzVRU7qFpZA2XZa42qEN1R
	q+K/eHmqaigjsYn/pbW6oj9OkgDXxHOKPUSBWxU6Jgq5rHhJBwLjIRi2O125U5iUNTFx
	Wk/8YyzhyTdZE0Ljs/6rVQWktTTmKiGnrdG+JDbFJnsJ2rr7wN/N21jNIRAS1cq8w6u8
	Qong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mPsd7OFksWRXYdDa4hCYk3GDmrejym4Tz4elPchUB+0=;
	b=CtUVsgMa4WzRzB/V8fmbI0PjtY7dSvqpgVjDenwMJUAR+cOpKHdb5NRwvXwGQaZsOP
	I+AvMQPNC+L+lqHUU6FwZ36GSjmiYBcJiwo0eI+wZWn5uk/gcjj+iq/Tp0DG6cc02KwU
	t5j1z2KP0P6bRGw/cLz6gHtMomtEG+W7NChYR1LXpolYgUrI57be0dmnewlpSkueMUcF
	f36PkOMNqKeCjWOvSozAEnx8C5crSL7MERADv2JRdK8weWVQnaQEm3N3OMVl2B2gleFp
	mVs7L6rQv/jGE5VLLK4GLAtRz4+ylwWlEFdfcquYkLzM1iPtmYPz9e9JxuGCtnAZMSXO
	358Q==
X-Gm-Message-State: AJaThX6mLxJky9jrx6tS1C4cVlsEv+kk/i+H2r1wx7Ovau99aVQ1/wOS
	FhywQc6C5BR3jfR7QJgZgNnYEe46RCZdHy8iakD4Rw==
X-Google-Smtp-Source: AGs4zMZPchFHpdefWY3EBlpVhiGnCTJOowtkF/JfckZ2rkdy1+xIXgJn+ZqdAmQODAq6pOVhL5j1jBion2QlPq1VzvY=
X-Received: by 10.55.180.132 with SMTP id d126mr3514575qkf.268.1510359016867; 
	Fri, 10 Nov 2017 16:10:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.37.203 with HTTP; Fri, 10 Nov 2017 16:10:16 -0800 (PST)
In-Reply-To: <CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Fri, 10 Nov 2017 16:10:16 -0800
Message-ID: <CADseiP=dhrkCrqBnO+g-HZQZaGgf1ywZwFcd-0bpE9K-qhALPQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 11 Nov 2017 00:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All,

For what it's worth, I built this chromium62 for the nitrogen6x and I'm
getting Alignment traps when loading webpages.

Are there any obvious flags or compile options I'm missing here? I haven't
tied debugging into this yet, which is my next step here. Just wanted to
know if I was missing something obvious.

Thanks!
-Ian Coolidge

On Fri, Nov 10, 2017 at 11:49 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> Raphael,
>
> On Thu, Nov 9, 2017 at 11:28 AM, Raphael Kubo da Costa
> <raphael.kubo.da.costa@intel.com> wrote:
> > There are 60 new commits in my "chromium62" branch
>
> This work is utterly *brilliant*! BRAVO! Thanks so much for sticking with
> it.
>
> > Possibly controversial issues:
> > - The ozone-wayland recipe has been removed (this is actually commit
> >   #1). The ozone-wayland project Intel used to maintain has not been
> >   maintained in a very long time, and it is impossible to just get it to
> >   work with Chromium 62. I'd also rather not keep Chromium 53 around
> >   just because of it due to A) increased maintenance costs 2) we'd be
> >   shipping an ancient Chromium release with tons of security issues.
>
> No issues from me. Originally there was only one recipe that included
> both wayland and x11 support together. I had proposed, then done the
> work, to separate them out into two recipes because keeping them in
> sync wasn't working. If nobody is keeping ozone-wayland working, it
> doesn't work, and/or it's not being worked on upstream, then I have no
> issues with it being removed. Just to be clear: if somebody finds it
> useful and wants to support it, I'd be happy to see it come back. But
> at this point it appears to be dead and I don't think it's worth
> blacklisting.
>
> > - musl support is currently broken. I've sent a few patches upstream
> >   lately and added a few musl-related changes to the Chromium 62 recipe,
> >   but getting the code to build requires a lot of time and
> >   determination, and if we don't have someone actively working with
> >   upstream it's just going to be an uphill battle that I am not willing
> >   to take upon myself.
>
> I'll have to defer to Khem on this one. As I've said before, I
> strongly don't believe meta-browser (or any other layer other than
> meta-musl) is the right place for musl support. Musl support should be
> in meta-musl and not spread throughout the ecosystem for everyone else
> to worry about. But I don't get the feeling that I "won" this
> discussion in the past... ;-)
>
> > - The 'ignore-lost-context' PACKAGECONFIG knob was removed. The patch
> >   it required no longer applies cleanly, its context refers a 5-year-old
> >   discussion and it is not clear if it is still necessary at all.
>
> This seems fine to me. If anyone still wants to use the
> --gpu-no-context-lost cmdline argument (or any other cmdline argument,
> for that matter) without the patch, they can simply add it to the
> chromium-wrapper.
>
> > - In the future, I'd like to revisit the other PACKAGECONFIG knobs as
> >   well. In particular, it is not clear to me if 'impl-side-painting' and
> >   'use-egl' are still needed at all,
>
> Sounds good.
>
> > and I'd like to drop
> >   'component-build' to simplify the recipe and prevent anyone from using
> >   this option in production.
>
> Yes! And if you wanted to remove DEBUG_BUILD too, I'd be okay with
> that as well. I'm confused as to the status of DEBUG_BUILD, it seems
> to be removed, but you're setting debug flags?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

