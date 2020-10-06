Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.819.1602008565986739785
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 11:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhKFeyDR;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id v123so17718144qkd.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Ki30AnTG0iAr/2h23VKw4mrX2N0E/K14bh8fjzGd5A=;
        b=dhKFeyDRHj8T9pJUZGmAjnhEsyR8zr1XdnFUc11lH0BkUc5Sht1UGQ8ttQVfuJeW68
         BAxEfuwru02z8DIsh869afrUdLTkO0jnn7LA5QdPrC9xom8hlLtinJotZGO8Ej0lOFzQ
         DWyvTpBx+ZOEujnLYcx+lK7jnemYa9+VAi+qgAtvF/hBa5MpRDOTKASNY3fA4lc7cNRa
         Vcjd/Lq0FQZj9A75yIf26IsHrQI9fCtKgEFId/6IIl/0Vm+p93xP3amdb175mX2V9l4P
         7wVOKxTTTmVcgXtvQM3RXSAQwJkweNUQfKB+LsoLPGKdG4P5984gSRP9hcby1TD1QMjt
         mNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Ki30AnTG0iAr/2h23VKw4mrX2N0E/K14bh8fjzGd5A=;
        b=YhO8B3/quJ+GOGrPXuEfZDdaGJjNo9IR5fmqfxHZacUUAGFR447eH4yHpOy5rglLX4
         oJjekeTO5ru5s08t50B7Mfoex8+TIjna+YcqGYR40L6NNSeG6Ek4D4MM7qy1b95zeOuv
         SyJwcRk7jcNC5oUvjxI8N/0TxSqEJjtwJTsgg/68oyCV8rj/S4kSh8AgXrovNFUl2RlW
         Fgq2qpMpVpzvNoF9kUzh8MiyQ7FC7M7qo3pEuKMQw22OTmiT0D/egKSFOU9XPZ9EFJeV
         boaj79ZRGmJekMIydmRttAqLcybDEtSkx2X5wn6Smb488kgA95Y5ho7z/b/p7Eq47X1v
         xj6g==
X-Gm-Message-State: AOAM5312UTHgf9lN+q1Jk30o4U9oEgC1Dnh35+xzBvr8UBDiRQgVrt1y
	WIuVHxMoVoU3iy7p+IirS9zBUq315Hn8KJTWt3s=
X-Google-Smtp-Source: ABdhPJzlvzS/HPeIdSrV6p9Np0qIsFFTCmCVeROiVmf7BkCXB7Sc8wKP0HwbzWtko4+WE4+VtxyumCpkINAUfOB3JDA=
X-Received: by 2002:a37:4015:: with SMTP id n21mr6781432qka.212.1602008564884;
 Tue, 06 Oct 2020 11:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
In-Reply-To: <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 11:22:18 -0700
Message-ID: <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: akuster <akuster808@gmail.com>
Cc: veilleux.cedric@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 11:20 AM akuster <akuster808@gmail.com> wrote:
>
>
>
> On 10/6/20 10:19 AM, veilleux.cedric@gmail.com wrote:
> > I had the same issue and could not figure out what broke the
> > wireguard-module package.
> >
> > I had to resort to bissecting changes in meta-yocto.
> >
> > I finally isolated the change that breaks wireguard-module:
> >
> > 87c9d29635 package: get_package_mapping: avoid dependency mapping if
> > renamed package provides original name
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4
> >
> > It seems the package renaming that wireguard-module does (PKG_${PN} =
> > "kernel-module-${MODULE_NAME}") no longer works after the above commit.
>
> I have not seen this on any of my dunfell world builds.

it only happens with master.

>
> Do you mind providing a reproducer e.g local.conf ?
>
> -armin
> >
> > At this point I do not understand the change regarding renamed package
> > names and dependencies enough to recommend the appropriate fix to
> > wireguard-module. I have been able to workaround the issue by renaming
> > the package kernel-module-wireguard and thus avoiding the rename
> > altogether.
> >
> >
> >
>
>
> 
>
