Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.6384.1598480783940371542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 15:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YAaO0X+f;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c12so3081103qtn.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 15:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uf1qlLNSvL/7xlCbiD32UcospckFQcRWXrWcaP/luKM=;
        b=YAaO0X+fe+XNcDMNe3CJBLlOjof+hH2WOfGTz1Cg/tjMWLiyIBdtTsIQKGzzPjBqzt
         HXL8tI6gVpRzGr482vvHRltb1pEuzJ/4jH34vlNR6nSvUIZLj3/48q38pxKWHGQ65mt3
         CfThWiFSHoYEPRrwRxpw2C7Rla81SUJS0CZQE6vR3Hx119lNiZ/lnNXvfBOd1neg00CS
         tLMvAWBqET3L/NuTPNMPgIDJpfsGGuYfPh+u616PuNLZ95Vo5KSBxgMR7TOlxt+CnxG/
         MqyLUwxmUDtYzj3Du1Bx3JB52nTZNX0ldDEUUBZik6Y8WKptROJUqmE9QaC3OMeim7xT
         JuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uf1qlLNSvL/7xlCbiD32UcospckFQcRWXrWcaP/luKM=;
        b=NnUPrtlQDAoJuAGoxlvIcFWjZG6IAgcRhWc5Jcf74S0thOHMDqph+F90KAlgR9l7qP
         lZHTKAbYKEoQ3zCaW8xbY9C8hmejWWUqa+sT1g7zCUmu5sxUeIeiLWIi18vkFdcVe2Gw
         tHqi6NY2PnLy1aUppuvO1135J/J5fbWtv+ap/G8nxdsakxTar+OWPcjk40xf4bdLrekI
         c/sXjDWPt8N9lJ5dALwN1eKBhRyNRqbVlAar/lvZ9O9AU+meNFfnYEKdmd4quedaPPc0
         EWPLbNNdFQhYFCOaKoaYdsEWpy78ejJuirZgo6Ku7ueon1eh+0tyTUlhAeuBTze4YJpc
         El3Q==
X-Gm-Message-State: AOAM532Px5R3TcdO9mqSxv+wB+XhK+ww17rTNF+RZMkFYlqAKrTRcerl
	ivpfRGpWmaNYiBSWVb7hA/NKr0E+xfz4dgQQ+zw=
X-Google-Smtp-Source: ABdhPJxOxRsPxTh9vj7sSc/w9EgS9BL/PzQ7jXf/6jeaw4DVYoYe5MzJKk5Lem89oHyQ5kTez5LneRwFUm2NBoNM/KM=
X-Received: by 2002:ac8:2962:: with SMTP id z31mr15976611qtz.88.1598480783021;
 Wed, 26 Aug 2020 15:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
 <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
 <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com> <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
In-Reply-To: <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 Aug 2020 15:25:57 -0700
Message-ID: <CAMKF1spEW6iMaRk1Qa7P8Bs1n3gTZrgPoyQDnmMPMAw_9DDOEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Diego Rondini <diego.rondini@kynetics.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!

On Wed, Aug 26, 2020 at 12:16 AM Diego Rondini
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
>
> Regards,
> Diego Rondini
>
>
> >
> > > On Tue, Aug 25, 2020 at 6:36 PM Diego Rondini <diego.rondini@kynetics.com> wrote:
> > >>
> > >> Hi Martin,
> > >>
> > >> On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >> >
> > >> > Doesn't this trigger src-uri-bad QA warning? It would be better to use git fetcher.
> > >>
> > >> No warning because this is from git*lab*.
> > >>
> > >> Also, this the URL of an official release tarball taken from:
> > >> https://gitlab.com/libeigen/eigen/-/releases
> > >>
> > >> See also first comment here:
> > >> https://patchwork.openembedded.org/patch/161360/
> > >>
> > >> Regards,
> > >> Diego Rondini
> > >>
> > >>
> > >> >
> > >> > On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com> wrote:
> > >> >>
> > >> >> Bitbucket is no longer the official home of eigen, which has moved to
> > >> >> gitlab. Update SRC_URI to download releases from gitlab, fixing:
> > >> >> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
> > >> >> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
> > >> >> attempting MIRRORS if available
> > >> >>
> > >> >> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > >> >> ---
> > >> >>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
> > >> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> > >> >>
> > >> >> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> > >> >> index f638848d1..9c3d962f4 100644
> > >> >> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> > >> >> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> > >> >> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
> > >> >>  LICENSE = "MPL-2.0"
> > >> >>  LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
> > >> >>
> > >> >> -SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
> > >> >> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
> > >> >> -SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
> > >> >> +SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
> > >> >> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
> > >> >> +SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
> > >> >>
> > >> >> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
> > >> >> +S = "${WORKDIR}/eigen-${PV}"
> > >> >>
> > >> >>  inherit cmake
> > >> >>
> > >> >> --
> > >> >> 2.26.2
> > >> >>
> > >> >>
> > >
> > > 
