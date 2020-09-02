Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.6110.1599049522980839736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 05:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=RE1yeo9M;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.66, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ej1-f66.google.com with SMTP id z22so6335851ejl.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u3RvsvSs47T3GUbelIPNnlTENmvBenSHZ/33EP24+QA=;
        b=RE1yeo9MHYN7ofOifv9eSD32Gb0kvbc40xI0NOAzcW1ggAIAdWz8FSUfsMyne+wHKD
         fuVxcNME+rB3vSio+eAJ9r3u01LwnSv27gw09uQpFwQnJwvln7ElrOmghPZG468EDlp2
         AP6MM7fsCcJBKfx4mVpti9Yl8jOJ0m+TzvCBd02d1PKsegcs7q2DiezlIL6qUkbquLdL
         1WwI878Emiw9gQpUU2VUsY+Y591TGTlLcHl7TVvmELtRYjeMtfLeN2eN6AOf+5VzpAff
         0XBKLWfq1h4h2DHxDoDRdKISSiQwGpbq4i6ZKdZRPCuKT1a4PGfd56vBIAfV3zFbYZ9n
         bW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u3RvsvSs47T3GUbelIPNnlTENmvBenSHZ/33EP24+QA=;
        b=rTb70MNwl8Tk2RCc4xsiYkl4j7jKKybgD2fAhYmb3BqKOs5g2Bgm2WCOf1PWN5qLDC
         lIj7HG9yeRpe94WAwjZll3vaQIBcN2MfDjnXjnUj7K9U2l+FmqTMa3FsLHGKALNclLPi
         6vLFqjkPz22E6tHvIMkeQC2ccyIgtjhIzIzukAan4HxUOZDU+o3bsM7jl1lnWyy/kT2Z
         7QDnLgx54rceaZu6+dz7f9e/KdGwOJsp2qJjWW8xSl0zmNXpsw4teVPnbOCF3Z6sx58g
         WceC6F5NYLJR8iN04k1X94J5Cvc5u3n11DJdOUzE/TO0AyxR4zfrz8QWgiqj+U++0TH1
         dRIg==
X-Gm-Message-State: AOAM5301iMNpLoR95qf2EViL/s4IT2RelOtBWsWWAu8IwCiSbHo0f21K
	ZiIVLYZJpizpjceUR4z++jcWGxySCVt/MMQiku7U5g==
X-Google-Smtp-Source: ABdhPJxop5XgtELTUYfW1cDPlpYr3aKlaQ9limxUBv8g+MMXMhoKurFIKF/C+cbUwTR3vVirAZ0jBl4Zm0PEJSAPPcU=
X-Received: by 2002:a17:906:f8d1:: with SMTP id lh17mr5857138ejb.409.1599049521207;
 Wed, 02 Sep 2020 05:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
 <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
 <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com> <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
In-Reply-To: <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
From: "Diego" <diego.rondini@kynetics.com>
Date: Wed, 2 Sep 2020 14:25:10 +0200
Message-ID: <CAMfw5Yo0iRaV8-cas1MPwRmCD6SWR66k-8yph5mVgnQM9GieDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Aug 26, 2020 at 9:16 AM Diego Rondini
<diego.rondini@kynetics.com> wrote:
>
> Hi Khem,
>
> On Tue, Aug 25, 2020 at 8:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Aug 25, 2020 at 10:59 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > >
> > > OK, I've overlooked that it's from gitlab, but are you sure that gitlab archives aren't re-generated from time to time like the github archives are?
> > >
> > > Or are you sure that https://gitlab.com/libeigen/eigen/-/releases are developer uploaded archives? It looks like gitlab creates them automatically:
> > > https://docs.gitlab.com/ee/user/project/releases/
> > > like github does with tag archives.
> > >
> >
> > while it fixes the issue it is trying to fix, it would be better to
> > fix the non-deterministic archive issue as well while here, I dont
> > know if gitlab's archiving is reproducible perhaps a question for
> > gitlab, but it would be ok to switch to using git fetcher to avoid
> > that suspicion. What do you think?
>
> I've posted the question, so we get an answer for all the other gitlab
> projects that are out there:
> https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888
>
> Let's see what the answer is.

So we have an initial answer:
https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3?u=diegorondini

The summary is: tarballs can be regenerated, but they are regenerated
identical by git archive according to the manual.
The use of git archive in the source code is not guaranteed in the
future as at the moment there is no immutability test in the gitaly
service.

Martin, Khem, what do you suggest to do?

Regards,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com
