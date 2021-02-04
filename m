Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.6203.1612435560888105663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 02:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d25mn6vw;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id f1so3839872lfu.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 02:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKWrVU0s+gGVVbUeb3IJ8TfaAaa7Lds1XaLUExWkzsQ=;
        b=d25mn6vwtygp1X/nJJTsxE7Yl+iUQMAx1O23RnbxW19IndUrYaNcLhk1Sphjd/+Ikp
         r5G1VaRhHslXO7rwidzGJGGF3Ya+9EbKJQmia/8SQTyn032sBpAEZ3EGilhObyvpe1O0
         dphzXq962ktcRA8vZwWAs+g26xD6zs903cHVqmyeFWqAvMdxeOt85QPxPpfndSVmE7Xb
         2yoq6y6RQb0HkmARVB0e3ap1Yeer3zHHzuBU+/XoPMFmf4NoYl15qUxLEY8Sq9i8Wuz9
         YPQKQCOCN0DBLX3+AEd9m7VJkLEFKEaEnHrw7XunycnYl6auEWpI0bwF4EJe0tzuIHrB
         FnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKWrVU0s+gGVVbUeb3IJ8TfaAaa7Lds1XaLUExWkzsQ=;
        b=PmWTAV+4Qvcixu1WPSQVXz90DhG6VKk1iXCLqh44g52+0w4sW31w4Dzia5eVTYRp/K
         TSd0BHm6yULNGyev4HNemjrzO3T6c84h54ykwsEqll8GEmzhaRtT0jDM9BnTgiqTA6sp
         V/EQgN2NkGIAfoKy1mYpn+4TKN/cII+1C9SbxsNzhOjTnCrpxw623z1Mflt9TTE4xefo
         us+1pbk4f4gq1wS0dsT3oVzt44Y9rmIlh8GZwiJh04yGNmYmtRwKHc1K3ZoMMvFNY7ps
         ZRC3pITmFmm3tKPg9Ck3xDXycc6JWpLVOOlYtTQTwCuNmS15kvTeb3ruE+wZCrfL9QRg
         9AJQ==
X-Gm-Message-State: AOAM533I7qLbYM4rwmb0We3xM+n/L/mRXc6K/AMizGjQF5zNYQleZwsM
	Mba6iFh7vIJLNgTdo1H6s62VifOksglD0bw/SEw=
X-Google-Smtp-Source: ABdhPJx5FNz3x8leqxuG2/96V1wMu8YDZBgXeXA/jcCV1ANJ57CDYqYXWGTTLaY+0v8rv2RcgGVhIOrgFzuz63R1ny0=
X-Received: by 2002:a05:6512:14f:: with SMTP id m15mr4175070lfo.304.1612435559027;
 Thu, 04 Feb 2021 02:45:59 -0800 (PST)
MIME-Version: 1.0
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com> <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
In-Reply-To: <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 4 Feb 2021 11:45:47 +0100
Message-ID: <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: hongxu <hongxu.jia@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Yi Fan Yu <yifan.yu@windriver.com>, 
	"Chen, Qi" <qi.chen@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross@burtonini.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 11:06 AM hongxu <hongxu.jia@windriver.com> wrote:
>
> On 2/3/21 3:17 AM, Randy MacLeod wrote:
> > On 2021-02-02 12:11 p.m., Ross Burton wrote:
> >> If you have anyone willing to work through some of the recipes in that
> >> list then that will be much appreciated.
> >>
> >> If the issues are not obvious feel free to reach out to me.
> >>
> >> Ross
> >
> >
> > YiFan, Hongxu, Qi, and anyone else.
> >
> >
> > YP is upreving autoconf to 2.71 in oe-core/master-next
> > after ~7 years of using autoconf-2.69!
> >
> > It breaks a few packages in meta-openembedded and I hear
> > from Richard/Ross that usually an uprev will work for both
> > the existing version of autoconf and the new version.
> >
> > Can we split up the list below among the team and do uprevs?
> > I have checked the meta-oe list and I don't see any uprevs in the queue.
> >
> > I'll take libssh2 since I need to move it to oe-core for rust.
> >
> > We (Wind River) are mainly interested in:
> >
> > - libssh2 - Randy 1.9.1 is close (days/weeks?) to release:
> > https://www.libssh2.org/mail/libssh2-devel-archive-2021-01/0020.shtml
> >
> > - lksctp-tools
> >
> Upstream has fixed it, it is easy to fix through backport a patch
> > - openldap
>
> Upstream has fixed it, but it is very hard to backport patches,
>
> we have to upgrade it from 2.4.57 to 2.5.0 alpha through git
>
> >
> > - freeradius
> Upstream is not alive and does not update autoconf to latest
> >
> > - libmcrypt - YiFan
> >
> > - iperf3 - YiFan

I just sent a patch for this one:
https://lists.openembedded.org/g/openembedded-devel/message/89274

YiFan, can you please have a look at it to see if it fits?

> >
> > - spice
> >
> > - postgresql
> >
> Upstream is not alive and does not update autoconf to latest
>
> //Hongxu
>
> >
> > but given your other work, please consider helping with the other
> > packages.
> >
> > This should be easy work and done soon. If there's a problem, reply
> > all and let
> > Ross know what's going wrong.
> >
> >
> > Other packages:
> >
> > - pidgin
> >
> > - geany
> >
> > - npdi
> >
> > - transmission
> >
> > - yasm
> >
> > - hidapi
> >
> > - libstatgrab
> >
> > - keepalived
> >
> >
> > ../Randy
> >
> >
> >>
> >> On Tue, 2 Feb 2021 at 17:07, Randy MacLeod
> >> <randy.macleod@windriver.com> wrote:
> >>> Khem, Ross,
> >>>
> >>> Richard mentioned on the YP call that there are some packages in
> >>> meta-openembedded that are affected by the autoconf uprev
> >>> in master-next.
> >>>
> >>> Do you need any help fixing/upreving those recipes
> >>> from say a WR student or more experienced WR Beijing developers?
> >>>
> >>> ../Randy
> >>>
> >>> commit a38a6203b4c584c91fc69c461bb2e1c8f4fcb389 (master-next)
> >>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> Date:   Fri Jan 29 10:57:42 2021
> >>>
> >>>       autoconf: Upgrade 2.70 -> 2.71
> >>>
> >>>       Drop patches backported from autoconf master.
> >>>
> >>>       Signed-off-by: Richard Purdie
> >>> <richard.purdie@linuxfoundation.org>
> >>>
> >>>
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/895/steps/12/logs/stdio
> >>>
> >>>
> >>> Summary: 18 tasks failed:
> >>> .../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
> >>>
> >>> .../meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb:do_configure
> >>>
> >>> .../meta-oe/recipes-support/openldap/openldap_2.4.57.bb:do_configure
> >>> .../meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb:do_configure
> >>> .../meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb:do_configure
> >>> .../meta-oe/recipes-devtools/geany/geany_1.36.bb:do_configure
> >>> .../meta-networking/recipes-support/ntopng/ndpi_3.4.bb:do_configure
> >>>
> >>> virtual:native:.../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
> >>>
> >>>
> >>> .../meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure
> >>>
> >>>
> >>> .../meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb:do_configure
> >>>
> >>>     .../meta-oe/recipes-devtools/yasm/yasm_git.bb:do_configure
> >>> .../meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb:do_configure
> >>> .../meta-oe/recipes-support/hidapi/hidapi_git.bb:do_configure
> >>> .../meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb:do_configure
> >>> .../meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb:do_configure
> >>> .../meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb:do_configure
> >>>
> >>> .../meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb:do_configure
> >>>
> >>> .../meta-networking/recipes-support/spice/spice_git.bb:do_configure
> >>> --
> >>> # Randy MacLeod
> >>> # Wind River Linux
> >
> >
>
>
> 
>


-- 
Regards,
Andrey.
