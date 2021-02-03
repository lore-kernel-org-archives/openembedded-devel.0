Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.4107.1612321331148211890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=croRZ0Q6;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id l11so11028080qvt.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Feb 2021 19:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AdAxlx+m39Yol4aCkAWbQb0yVzT0uI0Eq6fEXzyHero=;
        b=croRZ0Q6Hb8CYN0e18RaUOcAOgEn50mWyWC8Ll6mNraM3OdQh6NZ+ucJomFLf3RWoN
         SOC6nRkCSrgzib75jWdDQEHtdLbredu/Qd8Vx5ytHy/XOz/RA6jXhoJy4QCNiBYeB4Ai
         xD7RrlItZoDMuD3vI+XMmxJy0grl25J8WTusKw7WU+23d19bdL6T58Wf3B4tF7fVWXCJ
         JnVZJhzI7SEPx8Llu38iYFO+WZqlCqAnpTnkLtkeZUkNPDIwa4TCwu73PaTKVM2YNIp3
         bxbtSNg/HwiDoy15uwOGVQq4Hc+med4P+CT6/TTIufkuWz72KiAZHHvVOTO/gFsz4uxV
         MvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AdAxlx+m39Yol4aCkAWbQb0yVzT0uI0Eq6fEXzyHero=;
        b=HlDhsFmvwXzWcadBwuJ7Z0ZsWablN5CYexPgX+R8nCzM3IiKE6mJFMsCciClRPrL5Z
         NMdZ+pwhQhKIIvsutUgYYQD4XB0VR/5ZpGl3gOZfdSjGUlnCOpRk4CFSza1xpaIL184M
         err2aI1wq3QBhognfUHmt6dppkZM2pjx2qvg/+4PAkfsVtdF2jPXYJFWRYygsTtKnh9I
         taumSbQiGurBjSljec2YT9Omo6E8l1xpeCXs2zKUzjIhUhl2ko8oU2JEyEkZAYz9BL6c
         s6IhCxfkhLNBiWD6hddYhrnkTV2pOUUNgdyEmh4ihJptPikvsa/ea/ecIixUtnSf95SM
         js1Q==
X-Gm-Message-State: AOAM531hPkrWoENhgL6R//SyqwbV8IW6exE11+nEqFqcOSXoS2Z6hvyD
	QqNMXP6BojvAn2PvMWaj74DFoTsuEPh3PGmetWw=
X-Google-Smtp-Source: ABdhPJxX+NJniCsvbWc5QzWFwgLGDB/3Jk9DaOG4unOdIk0DXGjcrGYGX501gI86VP2AwQ9jrNNzAxm4nqrcPylDtNw=
X-Received: by 2002:a0c:eda6:: with SMTP id h6mr1111611qvr.19.1612321330158;
 Tue, 02 Feb 2021 19:02:10 -0800 (PST)
MIME-Version: 1.0
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com> <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
In-Reply-To: <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Feb 2021 19:01:44 -0800
Message-ID: <CAMKF1soycKg2my8x_2J6o5p9peiGh1ngQEJuiTu9H2GusE0XYw@mail.gmail.com>
Subject: Re: Help with dealing with autoconf uprev affected packages?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yi Fan Yu <yifan.yu@windriver.com>, "Jia, Hongxu" <Hongxu.Jia@windriver.com>, 
	"Chen, Qi" <qi.chen@windriver.com>, Ross Burton <ross@burtonini.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 11:18 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-02-02 12:11 p.m., Ross Burton wrote:
> > If you have anyone willing to work through some of the recipes in that
> > list then that will be much appreciated.
> >
> > If the issues are not obvious feel free to reach out to me.
> >
> > Ross
>
>
> YiFan, Hongxu, Qi, and anyone else.
>
>
> YP is upreving autoconf to 2.71 in oe-core/master-next
> after ~7 years of using autoconf-2.69!
>
> It breaks a few packages in meta-openembedded and I hear
> from Richard/Ross that usually an uprev will work for both
> the existing version of autoconf and the new version.
>
> Can we split up the list below among the team and do uprevs?
> I have checked the meta-oe list and I don't see any uprevs in the queue.
>
> I'll take libssh2 since I need to move it to oe-core for rust.
>

Thanks for chiming in Randy and team, really appreciate it. I have
fixed libssh2 already and sent the patch to ml since
it was breaking my image builds.

> We (Wind River) are mainly interested in:
>
> - libssh2 - Randy 1.9.1 is close (days/weeks?) to release:
> https://www.libssh2.org/mail/libssh2-devel-archive-2021-01/0020.shtml
>
> - lksctp-tools
>
> - openldap
>
> - freeradius
>
> - libmcrypt - YiFan
>
> - iperf3 - YiFan
>
> - spice
>
> - postgresql
>
>
> but given your other work, please consider helping with the other packages.
>
> This should be easy work and done soon. If there's a problem, reply all
> and let
> Ross know what's going wrong.
>
>
> Other packages:
>
> - pidgin
>
> - geany
>
> - npdi
>
> - transmission
>
> - yasm
>
> - hidapi
>
> - libstatgrab
>
> - keepalived
>
>
> ../Randy
>
>
> >
> > On Tue, 2 Feb 2021 at 17:07, Randy MacLeod <randy.macleod@windriver.com> wrote:
> >> Khem, Ross,
> >>
> >> Richard mentioned on the YP call that there are some packages in
> >> meta-openembedded that are affected by the autoconf uprev
> >> in master-next.
> >>
> >> Do you need any help fixing/upreving those recipes
> >> from say a WR student or more experienced WR Beijing developers?
> >>
> >> ../Randy
> >>
> >> commit a38a6203b4c584c91fc69c461bb2e1c8f4fcb389 (master-next)
> >> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Date:   Fri Jan 29 10:57:42 2021
> >>
> >>       autoconf: Upgrade 2.70 -> 2.71
> >>
> >>       Drop patches backported from autoconf master.
> >>
> >>       Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >>
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/895/steps/12/logs/stdio
> >>
> >> Summary: 18 tasks failed:
> >>     .../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
> >>
> >> .../meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb:do_configure
> >>     .../meta-oe/recipes-support/openldap/openldap_2.4.57.bb:do_configure
> >>     .../meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb:do_configure
> >>     .../meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb:do_configure
> >>     .../meta-oe/recipes-devtools/geany/geany_1.36.bb:do_configure
> >>     .../meta-networking/recipes-support/ntopng/ndpi_3.4.bb:do_configure
> >>
> >> virtual:native:.../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
> >>
> >> .../meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure
> >>
> >> .../meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb:do_configure
> >>     .../meta-oe/recipes-devtools/yasm/yasm_git.bb:do_configure
> >>     .../meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb:do_configure
> >>     .../meta-oe/recipes-support/hidapi/hidapi_git.bb:do_configure
> >>     .../meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb:do_configure
> >>     .../meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb:do_configure
> >>     .../meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb:do_configure
> >>
> >> .../meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb:do_configure
> >>     .../meta-networking/recipes-support/spice/spice_git.bb:do_configure
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
