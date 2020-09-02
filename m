Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.10156.1599059993516319676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JCzX1X0w;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id f11so1036031qvw.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=si7TT3/G0WHzGfjPBbwMCl8FOtJcsuM882DFzKf29HE=;
        b=JCzX1X0w24w3cy5L8PXjyZ1QHgIZE3GejlsVJPttdmOoRYrsgnmNH8ClcIRnqWwx9B
         WMDe0fXEGaKNBSG/owMp3MCawkSUY/AZ2nZ8YmVXer+gJgvSAMAcHZ9cUhgozn8E7VzS
         ByYCc1EjBcRDtFWsnc4rYc+/0TdBewtWohZGXxLhP3/pwrXqJgO/wISEj0KKebYivzTB
         toiH0Qs97uSlVi8r50fOYfkPhZ4b6HJLtE8Dd7EAit6QzkJcxG/cxqgkVDnEQLjbgdPm
         29ATxqU+cp46onjqgWyPJ6jxHt3FaezGHo3l8ez7HwLnMUKxJRVin493uzFCyxhMKiNZ
         7yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=si7TT3/G0WHzGfjPBbwMCl8FOtJcsuM882DFzKf29HE=;
        b=JTwKJSdB9IRZk/kKcnanme6ST3p4GzA73Lv7uaZ/zpyrc1wCBWbJ+xx+ebTZkFBzyX
         wJ/X5RM7iKReGJC9oeKzJRZy27T8lHXphg1ZE1P9pUJMSNk9mYpvCGmgp51QfO1v4xGF
         He17jrCsSugecumdxTh9DfxO2b7CXKTeqJI6S4WDRV+64V7Ubxcn8I28NmlBWVgiWcpQ
         TAtx2gQfXwWoHBPcqyoaEavR/RXnn+/zv//cezPwEt1nA8NB847wHyDDzdyNEN4biM4z
         4Vt0DVtrFNrYeadbtWopVZjKUcvOfrERX2tGSdofRiXkAIqsn47l0NS6oneoBf3bXrsF
         dUfw==
X-Gm-Message-State: AOAM532UgVZxe5qkxetJiVtAUNKv0PKoZhMgBBqMbkvjQgBCXTGZL/KN
	qh4HUSaUsL+XF+d90f+SdkxKzLSCavtNovISBR0=
X-Google-Smtp-Source: ABdhPJzb+DSECFdeU8eNA5VCfP9kTv8t4sOa8lp7BGwdmvbu6FaoFKJHg9GU+u2QJ1c1ndI9JVZWPWaDECf4XZggjY8=
X-Received: by 2002:a0c:b60d:: with SMTP id f13mr7523328qve.38.1599059992654;
 Wed, 02 Sep 2020 08:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
 <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
 <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com>
 <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
 <CAMfw5Yo0iRaV8-cas1MPwRmCD6SWR66k-8yph5mVgnQM9GieDw@mail.gmail.com> <20200902122944.ajmfg6b4jqlbavb4@jama>
In-Reply-To: <20200902122944.ajmfg6b4jqlbavb4@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Sep 2020 08:19:26 -0700
Message-ID: <CAMKF1sqcK-vTNHCiHbK+2pmdDEP3wXM_mNSTt5NjDZX6xQkKaw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Diego Rondini <diego.rondini@kynetics.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 5:29 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Sep 02, 2020 at 02:25:10PM +0200, Diego Rondini wrote:
> > Hi,
> >
> > On Wed, Aug 26, 2020 at 9:16 AM Diego Rondini
> > <diego.rondini@kynetics.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Tue, Aug 25, 2020 at 8:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Tue, Aug 25, 2020 at 10:59 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > > >
> > > > > OK, I've overlooked that it's from gitlab, but are you sure that gitlab archives aren't re-generated from time to time like the github archives are?
> > > > >
> > > > > Or are you sure that https://gitlab.com/libeigen/eigen/-/releases are developer uploaded archives? It looks like gitlab creates them automatically:
> > > > > https://docs.gitlab.com/ee/user/project/releases/
> > > > > like github does with tag archives.
> > > > >
> > > >
> > > > while it fixes the issue it is trying to fix, it would be better to
> > > > fix the non-deterministic archive issue as well while here, I dont
> > > > know if gitlab's archiving is reproducible perhaps a question for
> > > > gitlab, but it would be ok to switch to using git fetcher to avoid
> > > > that suspicion. What do you think?
> > >
> > > I've posted the question, so we get an answer for all the other gitlab
> > > projects that are out there:
> > > https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888
> > >
> > > Let's see what the answer is.
> >
> > So we have an initial answer:
> > https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3?u=diegorondini
> >
> > The summary is: tarballs can be regenerated, but they are regenerated
> > identical by git archive according to the manual.
> > The use of git archive in the source code is not guaranteed in the
> > future as at the moment there is no immutability test in the gitaly
> > service.
> >
> > Martin, Khem, what do you suggest to do?
>
> I would you git fetcher to be safe, like we already do for github
> archives.
>
> Extending the QA check to cover gitlab would be for bonus points :).
>

I would agree.

> Thanks
> >
> > Regards,
> > Diego Rondini
> > Sr. Embedded Engineer
> >
> > Kynetics
> > www.kynetics.com
