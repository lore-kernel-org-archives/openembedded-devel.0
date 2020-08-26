Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.7575.1598426186866110635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 00:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=nzucO+Z9;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.67, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ej1-f67.google.com with SMTP id o18so1410242eje.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SDz6cIwzz0N+4yg4gP2iAqbXYV780EszD1EXVaWCp8o=;
        b=nzucO+Z9Nb1XTId4tfizxwQ+UoQXbK0XqWVNlfSe30cStlPB37qT1QfHdwQYij7594
         jyzNkwfSNOwTQ3+G60nTFqjmOGx+NAO+qxo782yAiOBBtE+ehEaYuFD7tvzTU0Hv0siR
         MQuhzEZAn7BX/83ZtUGJjcVkiUbdAjx9uAp9ErYTrqC04cMFU2sM9VSNDkxZ/B2CkcRh
         tLg0+H1KN5r6ri9ZTlNTaubEFrv/xgr06AKqQ9DU3FrxNSaTZpXl07cTgk1+b9zhzu05
         CJKyhRFiPEjzD5e+aPg55foBZcbeoExJwRV+GutMwnco+NaB1ppJxKEYo54ic/Vg5SPn
         0ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SDz6cIwzz0N+4yg4gP2iAqbXYV780EszD1EXVaWCp8o=;
        b=FbGnEuyDdTMapTLemwsoWc88l6KowSiI7cKSizT5IM5Oe7ybdqok9fG9T6qxpv545s
         dMaYRPOSwIZo7rIvmD49d84paYMwhSM1iM5OJ48Mmha7uxAf9fEdljxDFfm7bm2vdWmc
         GVn4Cb+J/hKHQR/rnE9lUmH3DTlt1gBQQiQkcToQ44EroEM40GU8zbwxYYgWRXKzCR+D
         uwWNFFRzXplwITExFtIvGX7x/1zto7L1R49IAJXEGbuXkzyAKxE547rbzuFYM74GRVSh
         rJKldBUq0XkxLRRiCmfqwNffGKleXAEkVw+PeTlkKorPYLhMSf1Gu4YxRFbTIBRo5W3p
         Ta3w==
X-Gm-Message-State: AOAM53219RPlVfk7gmwwV4dmTkssHAkEmC9IqYb4pivcCVQuhviCoaLa
	Km++H19Taf914lgsva5/xcdMpl3Zcp6LstWD5GWDMQ==
X-Google-Smtp-Source: ABdhPJyzr7xnbr/ir1lIUQycMwUjrOhlo1OpnYmnxU11sTGE8G+C/jsFIq4bP014ujXpO2EmLSeUr17br1gx1DtFrSk=
X-Received: by 2002:a17:906:a8d:: with SMTP id y13mr11692129ejf.400.1598426185150;
 Wed, 26 Aug 2020 00:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
 <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com> <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com>
In-Reply-To: <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com>
From: "Diego" <diego.rondini@kynetics.com>
Date: Wed, 26 Aug 2020 09:16:14 +0200
Message-ID: <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Tue, Aug 25, 2020 at 8:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 10:59 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > OK, I've overlooked that it's from gitlab, but are you sure that gitlab archives aren't re-generated from time to time like the github archives are?
> >
> > Or are you sure that https://gitlab.com/libeigen/eigen/-/releases are developer uploaded archives? It looks like gitlab creates them automatically:
> > https://docs.gitlab.com/ee/user/project/releases/
> > like github does with tag archives.
> >
>
> while it fixes the issue it is trying to fix, it would be better to
> fix the non-deterministic archive issue as well while here, I dont
> know if gitlab's archiving is reproducible perhaps a question for
> gitlab, but it would be ok to switch to using git fetcher to avoid
> that suspicion. What do you think?

I've posted the question, so we get an answer for all the other gitlab
projects that are out there:
https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888

Let's see what the answer is.

Regards,
Diego Rondini


>
> > On Tue, Aug 25, 2020 at 6:36 PM Diego Rondini <diego.rondini@kynetics.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >> >
> >> > Doesn't this trigger src-uri-bad QA warning? It would be better to use git fetcher.
> >>
> >> No warning because this is from git*lab*.
> >>
> >> Also, this the URL of an official release tarball taken from:
> >> https://gitlab.com/libeigen/eigen/-/releases
> >>
> >> See also first comment here:
> >> https://patchwork.openembedded.org/patch/161360/
> >>
> >> Regards,
> >> Diego Rondini
> >>
> >>
> >> >
> >> > On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com> wrote:
> >> >>
> >> >> Bitbucket is no longer the official home of eigen, which has moved to
> >> >> gitlab. Update SRC_URI to download releases from gitlab, fixing:
> >> >> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
> >> >> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
> >> >> attempting MIRRORS if available
> >> >>
> >> >> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> >> >> ---
> >> >>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
> >> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >> >>
> >> >> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> >> index f638848d1..9c3d962f4 100644
> >> >> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> >> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> >> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
> >> >>  LICENSE = "MPL-2.0"
> >> >>  LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
> >> >>
> >> >> -SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
> >> >> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
> >> >> -SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
> >> >> +SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
> >> >> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
> >> >> +SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
> >> >>
> >> >> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
> >> >> +S = "${WORKDIR}/eigen-${PV}"
> >> >>
> >> >>  inherit cmake
> >> >>
> >> >> --
> >> >> 2.26.2
> >> >>
> >> >>
> >
> > 
