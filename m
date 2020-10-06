Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.2135.1602012061083896875
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bLGdrO0o;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c23so6867703qtp.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ga0AAWGwrDEYHiliciTgB6accvoiwOdAl0xzDXKDWX0=;
        b=bLGdrO0oHK71lMfgUHco1ey40PEGybccMk5jdcX8bSGritDU60y/+WttYn9ToKDtPa
         pAYjbioVk3TrDa2OUiGNw+TGZixPopN13IHITeNWZsswsj46dhC7fwr9kVrZ+yfef2xg
         aV/kUifkNBUSaDSuYeA+tSPz6iIRPch8xU0ZrDM07GVVxarZfx0kTV/HXp2mcSGoQimP
         r9VzOsfVid4W1jf5YPJjbwhvT+Fc4HgdjWiffGHvK4RiffWYqDdH437/icnryJK3WVfJ
         kd19aIfCrqJNZ4LgG3l4+Nk0yhunnezYO4yndDo9lQ8UPxpKHj5IiRXop96thFBOFxLV
         12iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ga0AAWGwrDEYHiliciTgB6accvoiwOdAl0xzDXKDWX0=;
        b=ec8WJC+ry3zvnLpbI6ltex2/Fxpn0TT+Gi1TCcI3cUd0t7RCbZd8SYQPD2mAczJP+n
         QBNVc3ViFwHPpeqRhTTcY914jDLc3KJ1KELRkw2o+YSStBt9aTJQZxMrHA4qDDRohefl
         RhYEG+zSvVxHWFjhwpvXZpLQI3CahtRjNKt53eBwD4E/95KA7mf2YbNW1XLZHkmcj2FR
         Ra/tP3csUrgjxqFIqs/6xTtjqucen86KNeEqiZQ6ouzMBvCnZU/vMCu5h+U4FNe95TnS
         cp9vgHpepvSNGPxURhlM8Ycu4LuvGPi9U8NZdsCav9CbJWHTfbb7YE89c9W0lM7gP5Am
         YedA==
X-Gm-Message-State: AOAM5301DUIoT9Up8f9JOqMaWuxlkv7dWyu+eLiIYiZj/UeTwAKgEsrF
	bPjb46tnENbB0pEfrdm3xYkr8fH2DuRoUxiZxWA=
X-Google-Smtp-Source: ABdhPJw/D/yu093VLd0ezcoXLz0PflLQAoRH7e+cDDe6CI4jnlNEoHiLCk90YfZJnAmD/oZ6URCh4OjMLS+3jjTpdbo=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr6658045qtb.80.1602012060040;
 Tue, 06 Oct 2020 12:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
 <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com> <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com>
In-Reply-To: <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 12:20:34 -0700
Message-ID: <CAMKF1sq6QcgpzYSQi6tr9GQ-2MOr34YneNMbE73dn9avAaqRFQ@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: Belisko Marek <marek.belisko@gmail.com>
Cc: akuster <akuster808@gmail.com>, veilleux.cedric@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 12:04 PM Belisko Marek <marek.belisko@gmail.com> wrote:
>
> On Tue, Oct 6, 2020 at 8:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 6, 2020 at 11:20 AM akuster <akuster808@gmail.com> wrote:
> > >
> > >
> > >
> > > On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> > > > I had the same issue and could not figure out what broke the
> > > > wireguard-module package.
> > > >
> > > > I had to resort to bissecting changes in meta-yocto.
> > > >
> > > > I finally isolated the change that breaks wireguard-module:
> > > >
> > > > 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> > > > renamed package provides original name
> > > >
> > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
> > > >
> > > > It seems the package renaming that wireguard-module does (PKG_${PN} =
> > > > "kernel-module-${MODULE_NAME}") no longer works after the above commit.
> > >
> > > I have not seen this on any of my dunfell world builds.
> >
> > it only happens with master.
> hmm nope. I have it on dunfell also.

Oh right, it got backported it dunfell recently hmm

> >
> > >
> > > Do you mind providing a reproducer e.g local.conf ?
> > >
> > > -armin
> > > >
> > > > At this point I do not understand the change regarding renamed package
> > > > names and dependencies enough to recommend the appropriate fix to
> > > > wireguard-module. I have been able to workaround the issue by renaming
> > > > the package kernel-module-wireguard and thus avoiding the rename
> > > > altogether.
> > > >
> > > >
> > > >
> > >
> > >
> > >
> > >
> >
> > 
> >
>
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
