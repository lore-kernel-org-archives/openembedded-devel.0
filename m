Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.543.1602272436187186740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 12:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g/BfedkF;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: veilleux.cedric@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id g29so8048050pgl.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkU9cNNm9ANLd/E/hg6u42SCquuEQlLYLhEe2FUJapU=;
        b=g/BfedkFCn3P5za21ntyZdeBRFGXxMbD+JVlTZu7PLmBUBCjw7Aso41kPoVh0YRPR6
         jyomPV5WWtk8Sc8lpKnO4RPsKFw6TxM43w5/x9F/ufItP75wd0zWEnz3y3NANgCcWxtE
         vbrrs00xWWkAqJKwfMSGLNAeFzknqkWPQSpxPL3pDZdKVxt/nLDoPSG+218PU4qe+DYJ
         /nP81xYtt5yepqbKX5xQN/CRIC6UeKu1y0FiOjBHOpg4NVpIjhIQVJju1iVRV7dBZPF8
         FHXZkZNO786MtuwUQr66w8KMJgqZw4d/9yFMTJs3djMTvn0KdmHr3bhcZXIucBypgdUQ
         LcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkU9cNNm9ANLd/E/hg6u42SCquuEQlLYLhEe2FUJapU=;
        b=BNwbNCeO6m3UrIC/5vvpV5jvbSazV1x575sxTSix6qmjbSaA+xEJOn+YGr2LQESXPe
         kKlKk07tAcyhUV6LBjvVifeSOYgFZ2seaywNC1vZBlQjju1c3nq3LijkL/Aumqchv6An
         xyoTpgkHEQGgSesflo7fU9FOSdzb03vAYMNitdTsnejyQ//i19emaz1uHF5OHwBb5DUC
         F0Ms+RT7BEiWyWcFo4DlE5WiqZY9rVAXx8RFs8Nvo365cGZxDpwqinvFeLfdPUfL3arU
         HACy8lY+EROY2wu9y+RiXf0BCs1/fx+fyOUPBxnu6Hw1cBIU6WN0/1RSLUmXL88BwJLa
         DnkQ==
X-Gm-Message-State: AOAM530fz+VV8kZUn8k2XgMd7XrkxH/4XcZxkGLrFD/6MHrRtX4Zek+g
	zchlzyyqm0mdZ6NND8d3WnLw0Ff9H2g1FWWqEGc=
X-Google-Smtp-Source: ABdhPJx82sO4LwA2vAHLO84LhnxNvYhLUIJ/Sv3RgRmmgLJYFrr+tn9EMoOwdhisyiVyTVQ9Io1BuNBsitLDQ89B964=
X-Received: by 2002:aa7:8249:0:b029:142:2501:35c9 with SMTP id
 e9-20020aa782490000b0290142250135c9mr13710016pfn.41.1602272435555; Fri, 09
 Oct 2020 12:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org> <7783209f-0e7e-fc17-d7ab-49cc9ba1afee@gmail.com>
 <CAMKF1sq3kGPdu2B1bO7mt-g7=NaCN3tSX7cfLaoLsxSrbJHi2Q@mail.gmail.com>
 <CAAfyv35kN7jZhn-CZ5ztJ=Ocsy-8VGt80PMJX5fNtdgbew-nSw@mail.gmail.com>
 <CAMKF1sq6QcgpzYSQi6tr9GQ-2MOr34YneNMbE73dn9avAaqRFQ@mail.gmail.com>
 <CAAfyv34i61gF_LsojeLDaasie67h=fyVyC3-TCAbzGxnDNQ8Lg@mail.gmail.com> <CAGDS+nmT-nLT1Kj713ihDAGtwU2361OHmaD7+Hhoii0PReKgQg@mail.gmail.com>
In-Reply-To: <CAGDS+nmT-nLT1Kj713ihDAGtwU2361OHmaD7+Hhoii0PReKgQg@mail.gmail.com>
From: veilleux.cedric@gmail.com
Date: Fri, 9 Oct 2020 15:40:24 -0400
Message-ID: <CA+Xfe4Fs7H5C12kY=GTiDbSxwNNzg07vceMmPonqXS-ucTyyFw@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: Steve Sakoman <sakoman@gmail.com>
Cc: Marek Belisko <marek.belisko@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	akuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

> > > Oh right, it got backported it dunfell recently hmm
> > Can we please revert backport so we have working wireguard again? Thanks.
>
> I'll revert this in oe-core dunfell.
>
> To be sure I see requests like this in the future it would be best to
> copy the oe-core list and/or myself.

My understanding is that the change that causes the problem is in poky
/ package.bbclass

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=87c9d296357638082f5a7131a87365285fc813c4

If I revert this commit wireguard builds fine.

I don't understand why though.
