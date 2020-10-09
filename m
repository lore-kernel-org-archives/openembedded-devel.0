Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.2146.1602270882030373647
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 12:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IlWeVLRm;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 67so8026640ybt.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 12:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SJ21Wav53Azs1hR/9jtsI6fqm2KmG9kt/h13DaY2lo=;
        b=IlWeVLRmfVyka20z1HG4oBi28hVBlE4lgJ0/AiPYoWIQLYb5SpUvQ+m+LSvrhjSWTp
         Pnb3rXoWXX9asWjVMHUFw60sBTOlAJRA/vtaCjHYurW7UkAHmdW+SBcIh2UUrTquOPhU
         m2ntDno4cjLkiA5wcfyHdsuFtTwHPZjs3XGCfHTPxuV+AdPVKWCzGyjiEiRf/085M2Sg
         IaeM4kAKvWydsetGLcOB5Xsx4aSW6qcjcdTYCW4buUnurtVtzi1hpCZU0gpUkje5Chca
         xuR2IK6yl+38cT8p7ZW9lEiQ2oxBpIJ3sPBrGgyOBFUc8bdn1MQl8bFMgnQ5NRQkkYxY
         46TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SJ21Wav53Azs1hR/9jtsI6fqm2KmG9kt/h13DaY2lo=;
        b=Thm6fintNGD/iuizzsISicJJU/Bja4d1YvewlzoQcpz4gXKhu+PFtmSvxjpo5LxaPU
         Oba4hirabEzWVJW4Hm9/9t19wQnRkeLSQzP/BEb/nvsKjNxFq4xLHHeNm1bDYh24DV1p
         6XCb9Ea1ZtL6MCp7+Ar7IVEXx3OsIAW4KpEhCSi9iBhspLeVkj3kmKKXvfVrCf3J1oIY
         CjB3GcPDL0PzrWAq06XHhTpizZpKgRWjPiECs4fczptN6qZDr2M/z+16xXUz6apQzaG4
         qsWulumHCeV4dpP3046uBIzOmh5ekHTeAUi0BAF9qFNCCaRk0yX4Hjz3PZZuG/rMnEfg
         60YQ==
X-Gm-Message-State: AOAM531eMtt80Hm2wKXgwKDGxQrWNxjl910h5M7TunAsPmvxf9dtvqvr
	92fveEq+UMH7MTyf+Hfsx0fTp1IlfktkYNZC0Mw=
X-Google-Smtp-Source: ABdhPJw972nU2/6IGlI8zsfInnfbfIOzqEDKzn26VU+yZigJRzoraGHrJ8kWZDpDftl5Kv+F9BCaGxgHr3E89J0Dk/Q=
X-Received: by 2002:a25:1405:: with SMTP id 5mr19589427ybu.97.1602270881168;
 Fri, 09 Oct 2020 12:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
 <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
 <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com>
 <CAMKF1sq6QcgpzYSQi6tr9GQ-2MOr34YneNMbE73dn9avAaqRFQ@mail.gmail.com> <CAAfyv34i61gF_LsojeLDaasie67h=fyVyC3-TCAbzGxnDNQ8Lg@mail.gmail.com>
In-Reply-To: <CAAfyv34i61gF_LsojeLDaasie67h=fyVyC3-TCAbzGxnDNQ8Lg@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 9 Oct 2020 09:14:30 -1000
Message-ID: <CAGDS+nmT-nLT1Kj713ihDAGtwU2361OHmaD7+Hhoii0PReKgQg@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: Marek Belisko <marek.belisko@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, akuster <akuster808@gmail.com>, veilleux.cedric@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2020 at 8:22 AM Marek Belisko <marek.belisko@gmail.com> wrote:
>
> On Tue, Oct 6, 2020 at 9:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 6, 2020 at 12:04 PM Belisko Marek <marek.belisko@gmail.com> wrote:
> > >
> > > On Tue, Oct 6, 2020 at 8:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Tue, Oct 6, 2020 at 11:20 AM akuster <akuster808@gmail.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> > > > > > I had the same issue and could not figure out what broke the
> > > > > > wireguard-module package.
> > > > > >
> > > > > > I had to resort to bissecting changes in meta-yocto.
> > > > > >
> > > > > > I finally isolated the change that breaks wireguard-module:
> > > > > >
> > > > > > 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> > > > > > renamed package provides original name
> > > > > >
> > > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
> > > > > >
> > > > > > It seems the package renaming that wireguard-module does (PKG_${PN} =
> > > > > > "kernel-module-${MODULE_NAME}") no longer works after the above commit.
> > > > >
> > > > > I have not seen this on any of my dunfell world builds.
> > > >
> > > > it only happens with master.
> > > hmm nope. I have it on dunfell also.
> >
> > Oh right, it got backported it dunfell recently hmm
> Can we please revert backport so we have working wireguard again? Thanks.

I'll revert this in oe-core dunfell.

To be sure I see requests like this in the future it would be best to
copy the oe-core list and/or myself.

Thanks for reporting the issue!

Steve



> > > > > Do you mind providing a reproducer e.g local.conf ?
> > > > >
> > > > > -armin
> > > > > >
> > > > > > At this point I do not understand the change regarding renamed package
> > > > > > names and dependencies enough to recommend the appropriate fix to
> > > > > > wireguard-module. I have been able to workaround the issue by renaming
> > > > > > the package kernel-module-wireguard and thus avoiding the rename
> > > > > > altogether.
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > as simple and primitive as possible
> > > -------------------------------------------------
> > > Marek Belisko - OPEN-NANDRA
> > > Freelance Developer
> > >
> > > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> > > Tel: +421 915 052 184
> > > skype: marekwhite
> > > twitter: #opennandra
> > > web: http://open-nandra.com
>
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
>
> 
>
