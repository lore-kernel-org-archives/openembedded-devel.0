Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74654C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:49:31 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.33111.1635173370315620019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AxB8m8Tk;
 spf=pass (domain: gmail.com, ip: 209.85.166.179,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id i6so13189659ila.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3S5VOJYKmnIH57R+xIhLWO+7sK50b7EpqsckNto8gA=;
        b=AxB8m8TksBoyrTwTbyN55l9L47qssITY+LO6YXfdvJ7gkSSK3A8AiwL9Xom4OzqqQD
         gBIvQlu9gslzxk9Bzj1iSOV6n8pJC3iaSFxNYCwVtIv0Y59Wjy576pPF/LpK3Pp827/H
         kXpVxBui8TOZuA54AyQsGoU2qhTgqMUI+IWc+FoD3gRL9ZQ8h3emy3buDPKMfhpkkndy
         BrfeZf7Ol0O+TTLxthryQhH0/MxHWjhUtjg+3SFCWRMYHDkncTncxIT84+r9Jx100osr
         Cvh7XUksML3NaeqenmUj59BqOTpe5AozFR5fuDHb0KVJTfXu/+rQ4AK+BwG76YOcZ1nu
         kqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3S5VOJYKmnIH57R+xIhLWO+7sK50b7EpqsckNto8gA=;
        b=nfsYzf4dMsyIAow8+bfpKbLCSJUdzo3LCFyMuyHe0U5BeVQmMfVHiqU+nysloAk8np
         1F5fdcD1ES9bMx8ChtRirz0KEGg/DvjJr4HU5P/FLDbwqf9yyF84CYHJMCHMkw5smglh
         wyqFlmNJKrSCZfgib8MR7SCW5WurvVMIkM4RpAbvhbZ/4fxaQBIvvhUG7VcPE3Zgkkb9
         9DmtPSC9pKf5uxXIja7EHKOr4rcDYG6gbjN76eWlXsJlGFxHVtxXsWQG8sC34E5gFnUl
         bwjzVVmUe5DFcKsHS0+9/4KLEI10VjIFSOG4TfhIVU7hIpaxD5Y7zFmuYYph8OY+SQyQ
         KdMw==
X-Gm-Message-State: AOAM533GOCkYWSXg3E6GvteUyLDMO7qT5IMqUaX/PmMaEmkra71kAurp
	5DVLiWoEDt/GTolUL2vN0uvYDUNee6FIvaC4RjY=
X-Google-Smtp-Source: 
 ABdhPJz9qjLSpwjxY2BC+NlIx0H4eYRkf1NA8r8NUkbvTUaA8KAjrGfkhrt7sIWyEYpBjxDWkrpZLUprBThR5oAc6Yk=
X-Received: by 2002:a05:6e02:174d:: with SMTP id
 y13mr2264820ill.251.1635173369737;
 Mon, 25 Oct 2021 07:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
 <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
In-Reply-To: <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 25 Oct 2021 15:49:18 +0100
Message-ID: 
 <CAO5Uq5Tv+yfED2u7ygvCX1tBcKpnAgpVaiAPGg10uYnXBfEdsw@mail.gmail.com>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 14:49:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93564

On Mon, Oct 25, 2021 at 11:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Sun, 24 Oct 2021, Khem Raj wrote:
>
> > On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> > >   colleague recently asked me how to get access to one or more header
> > > files associated with "ntp", so he could:
> > >
> > >   #include <ntp.h>
> > >
> > > from some other code. casually, i suggested the standard way was to
> > > add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> > > in my own aarch64 project, then took a look under packages-split to
> > > see what got packaged in ntp-dev, and was puzzled to see it was
> > > absolutely empty.
> > >
> > >   is this deliberate? are other recipes not entitled to ntp's header
> > > files? am i overlooking something?
> >
> > While the header seems to be meant for public consumption, the build
> > explicitly does not export it, so perhaps thats not expected to be
> > used this way anymore.
>
>   just to tie this back to a question i once asked on (i believe) the
> YP mailing list, this wind river build is using ntpsec instead of
> regular ntp, but it would appear this would still have the same
> problem -- while the ntpsec source contains an "include" directory
> with lots of ntp-related header files, if one comes up with an ntpsec
> recipe, nothing would be solved if it also does not install those
> headers into ntpsec-dev.
>
>   so, simple question: does anyone have a bitbake recipe for current
> ntpsec?

I do, it's unfinished as I realised part way through that the python
dependency meant it wasn't going to fit for my use case, but the
basics of the build are there.

-- 
Alex Kiernan

