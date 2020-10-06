Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.1783.1602011056478927459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LVqyE0lo;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a3so19202228ejy.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9QQV4cja0gXJGuUi0nfXGpGb4OI20utT+EvADkwbq4=;
        b=LVqyE0loeuZz1NvzQk2doWomFIE92DJyFDwXKnS/lkkBrr+uqasGPiu7zR0abTg6oL
         /Y9CbzyXUQvoiHZQ3EyuULLMv9GEgzTxE6CzmgYjzWIj8dCLSchBs8nyyZTGnJkBA14N
         oes/i8HG8JKaS/t+6mA0Gbtoe5JpbcxDEwWMXhX3G/uj8V6BIGNSeR9FfMgc0hxnKimu
         7O5svtNHLuEE/DLS5YCMk/TsZOWvctrZ0xpiHK4bTXAa6QysRMqPXlXiLNfdswRdvS7t
         lh1xbWm22X5bQzxWapH78cTPI9Tosl5X9p59CfOB3w6ZV3po63A3xg+m/jwTPKiDSDtW
         7PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9QQV4cja0gXJGuUi0nfXGpGb4OI20utT+EvADkwbq4=;
        b=Uyd+Y7gTMtLtP4l0r2aurTCIOj2STH5E7lIm7/ARdBl8pWnFv7+o2bHpVHvaxv2p1a
         ocDytE705Y0bWiPL3z1q6k74G1on8yNqdicTBF0MjYFzd23s2oOVguvlWdEfNorOZ0lt
         ENYApiAhwqJx5hbTATD3BCP4ZHS1MnyGN1PtnZ+b61IaoTju16SeP/XWpLm6wlrqwyRQ
         IAUei7WTgR39agy7BDQf3y1a5F8wAuWjDQ8pKv9BJO8Uh04zfOVuJeQfzd0QUzGQmZcX
         qnOWLr80bMQTHQQcpy8p91nV1BCrvdjuI+n4R5HyybqVULOXUYen7RZhN2pFddvwFCkl
         mWjQ==
X-Gm-Message-State: AOAM532nSy6J240OxhgBmIAWlj5up0MOu0fMhH2dxjhkzZcaVPnc6Fx9
	t4nbJ6VFPNF6zHOrh2daB9dAjYKKmzRImVowJ/U=
X-Google-Smtp-Source: ABdhPJyd8a2XW5pkN1L1LqJP0hMK3IC0IvM1HnkgEyMtHGQVut2uPuK3W5D0bPOjxXK74ZM9nq58qtTEMLVnQywI9cE=
X-Received: by 2002:a17:906:1f08:: with SMTP id w8mr987568ejj.181.1602011054851;
 Tue, 06 Oct 2020 12:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
 <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Tue, 6 Oct 2020 21:04:03 +0200
Message-ID: <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster808@gmail.com>, veilleux.cedric@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 8:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 6, 2020 at 11:20 AM akuster <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> > > I had the same issue and could not figure out what broke the
> > > wireguard-module package.
> > >
> > > I had to resort to bissecting changes in meta-yocto.
> > >
> > > I finally isolated the change that breaks wireguard-module:
> > >
> > > 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> > > renamed package provides original name
> > >
> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
> > >
> > > It seems the package renaming that wireguard-module does (PKG_${PN} =
> > > "kernel-module-${MODULE_NAME}") no longer works after the above commit.
> >
> > I have not seen this on any of my dunfell world builds.
>
> it only happens with master.
hmm nope. I have it on dunfell also.
>
> >
> > Do you mind providing a reproducer e.g local.conf ?
> >
> > -armin
> > >
> > > At this point I do not understand the change regarding renamed package
> > > names and dependencies enough to recommend the appropriate fix to
> > > wireguard-module. I have been able to workaround the issue by renaming
> > > the package kernel-module-wireguard and thus avoiding the rename
> > > altogether.
> > >
> > >
> > >
> >
> >
> >
> >
>
> 
>


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
