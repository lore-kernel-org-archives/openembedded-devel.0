Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.972.1602267594120660663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 11:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+VjC0r1;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: marek.belisko@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id t20so4013444edr.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7hTGjHJ+2HkT1GTeZ4I4aV1YfND8LzD5e/MBq6FNCU=;
        b=j+VjC0r11d9Im/PzDGCXWMzaOs1/gt5mBeUnh7Vj6ZEoYF5t2DjLysepda3eCdCh6G
         HSA7rat2w5G2qZwVBSwp8gL2mxtJjEvVNuFW73ObM3fzORAh0HzS9NuAddOPM9jAvF7A
         C/65qGmKoTVpGzvZb9if1JKxTiJXnegMkRzUwbPVQDFKdKnMKSeg349jljhL9Rs7Z5XU
         LM5WvDdV9LWAZOYFcySHkisiRa3ZUlYG46unTyx0D7QfCQPkzMEwYI81/V3Mpt1UQxZS
         yHuiBnoj+tqO2pCLdFoZG1T6+TJv1d7Peicd7WuRvbLkASVUFP/LfCCYo9ZUbe50AFyC
         jNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7hTGjHJ+2HkT1GTeZ4I4aV1YfND8LzD5e/MBq6FNCU=;
        b=owIDeXRd3Ji/ZRg+WX8782qbMUS0crDVFkd9u7/afWw8+Lq/7Fick7YIiXGD1hVJt7
         wkaanYOgWG3dAFZUZfmSBLJ5nIRfhwvfgVJVZT1C0o+wD8xZ4kIeqr+5tUFe4Od56f7i
         7ggWfzMELDoP/DiXtc1r0tlKUsAOa+we05g24PDzispCFvHyGKdRybu4HzRs50iup1Kx
         RP0uaHrQZe8UaJEFIx82AVTLOLCSx1b9KDDdfSZ++a183suaYexZ6lgxYO+ysWrA7rwL
         h9s2WRjsCX4+0B2i2ws8Qd7wshHoNelM2ksQIKcPYaHm4hOG9MUJ67Oef7+JqCWCVBTW
         QvMQ==
X-Gm-Message-State: AOAM531mTnYLIhw0zheHReQg/zII0CR+KiWkZ5huntUs5FoWmHiK8xP0
	WNUUKFcgLiJbTM5/qaR0vrWM0DPKMJl5LAEK9JQ=
X-Google-Smtp-Source: ABdhPJxDrQV0l5uEnlH+fbJ/HKMsgQwEsLKaUGSTX+v5wDfMiWX1ZPu5ZhYbQtd80gyNgQOKZS/7AT+AhfKMJ+UBSkw=
X-Received: by 2002:a05:6402:1148:: with SMTP id g8mr473758edw.271.1602267592491;
 Fri, 09 Oct 2020 11:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
 <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
 <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com> <CAMKF1sq6QcgpzYSQi6tr9GQ-2MOr34YneNMbE73dn9avAaqRFQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq6QcgpzYSQi6tr9GQ-2MOr34YneNMbE73dn9avAaqRFQ@mail.gmail.com>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Fri, 9 Oct 2020 20:19:40 +0200
Message-ID: <CAAfyv34i61gF_LsojeLDaasie67h=fyVyC3-TCAbzGxnDNQ8Lg@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster808@gmail.com>, veilleux.cedric@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 9:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 6, 2020 at 12:04 PM Belisko Marek <marek.belisko@gmail.com> wrote:
> >
> > On Tue, Oct 6, 2020 at 8:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Oct 6, 2020 at 11:20 AM akuster <akuster808@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> > > > > I had the same issue and could not figure out what broke the
> > > > > wireguard-module package.
> > > > >
> > > > > I had to resort to bissecting changes in meta-yocto.
> > > > >
> > > > > I finally isolated the change that breaks wireguard-module:
> > > > >
> > > > > 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> > > > > renamed package provides original name
> > > > >
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
> > > > >
> > > > > It seems the package renaming that wireguard-module does (PKG_${PN} =
> > > > > "kernel-module-${MODULE_NAME}") no longer works after the above commit.
> > > >
> > > > I have not seen this on any of my dunfell world builds.
> > >
> > > it only happens with master.
> > hmm nope. I have it on dunfell also.
>
> Oh right, it got backported it dunfell recently hmm
Can we please revert backport so we have working wireguard again? Thanks.
>
> > >
> > > >
> > > > Do you mind providing a reproducer e.g local.conf ?
> > > >
> > > > -armin
> > > > >
> > > > > At this point I do not understand the change regarding renamed package
> > > > > names and dependencies enough to recommend the appropriate fix to
> > > > > wireguard-module. I have been able to workaround the issue by renaming
> > > > > the package kernel-module-wireguard and thus avoiding the rename
> > > > > altogether.
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > > 
> > >
> >
> >
> > --
> > as simple and primitive as possible
> > -------------------------------------------------
> > Marek Belisko - OPEN-NANDRA
> > Freelance Developer
> >
> > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> > Tel: +421 915 052 184
> > skype: marekwhite
> > twitter: #opennandra
> > web: http://open-nandra.com



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
