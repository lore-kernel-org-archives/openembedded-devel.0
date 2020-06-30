Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.17461.1593529665474738920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 08:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d1NJeiC8;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id h18so9407752qvl.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZ+gyaFhr8FTrjts2gvkGMlzHByMcuNpXpe4CZTWWms=;
        b=d1NJeiC8a6GJSEtvVcxpem5nddy+B09JW6CL15Wq+99oiGrg/VteYYZ0Pz6jmi8Gc/
         oC7+BzdY7w1wRJThMxLqFFcbMHdlwXmGIT4i/pfC0iF8IWbE3CNuDix268+h7JX9WCPO
         /eC/wiDldTRBS+sL+8BEtuwp9texaP54EaU1adzpK8gFGjdSr33Sezx1ZpIzok+oCdJh
         qDJeOxA/9IlCSxqDeAedOGS66oaS9a6GFxr7toS0e9VKA/pHkh48xxAD9KJnoTiuLz5X
         t49JeYoceSiro45XGm39fmVHytDbH1bGMRvjpiCAqkuDINfcGfmkcOiI5W2j31Tz1E70
         AY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZ+gyaFhr8FTrjts2gvkGMlzHByMcuNpXpe4CZTWWms=;
        b=mDc5CbyEj3LIzf4OIjQD1UOVfdgnIOe/xOK820s+7L0eAQDmvAE2Gzv21n0sJaoX3y
         b6YBZLTxbX+imePpWfU/RU4SMp5/NEsitb87/LFjGfbwG/kqexwo5K5qyczbLIfuYyAX
         VyOLupr6Un70liZcAdYMkSvpibyroT4+O2zn7GAj/FWjsLvcsegykDqfMqTWYit20u3n
         71K/dwnHonDkygU32kvSwsCLcupqByboRHT6wKJztJ7s44xmKBy1rwuXVEMELLhic0ux
         TfhYIGqNZ+gWn2/5JPDx4wmTjyghARnCMo2qVZYDCCMTmOcBtwehH5QbTg652CtmenYX
         w/+Q==
X-Gm-Message-State: AOAM531rZr6tQjyScVDNQTJ+DMBTBR1ogms+6TpMObU3eE6etRM2RAWm
	oKl2WujafGmYXc7rCttZ+USl3JqyrkcqAIm63ZjeDIXg
X-Google-Smtp-Source: ABdhPJyrMNv6ghocQHcWH/nvIx5S3rggkiclwTlpozhqWkmcvWjMyIxiOHWbN3UY4PTU7jLAPlKMZ89WrBCz/uztx3M=
X-Received: by 2002:a0c:fd2a:: with SMTP id i10mr20931572qvs.23.1593529664425;
 Tue, 30 Jun 2020 08:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <c1502c01-c4c8-b05c-5db1-979b0d335b38@gmail.com> <20200629151951.GA7038@localhost>
In-Reply-To: <20200629151951.GA7038@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 30 Jun 2020 08:07:18 -0700
Message-ID: <CAMKF1spiRhob53ZdB2c9OTboFUyBJJ6aWkmE8dC6aFTaAT6pEQ@mail.gmail.com>
Subject: Re: [oe] meta-python Dunfell branch maintenance
To: Adrian Bunk <bunk@stusta.de>
Cc: akuster <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2020 at 8:20 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Jun 29, 2020 at 07:59:13AM -0700, akuster wrote:
> > Hello all,
> >
> > I have notice many meta-python3 recipes are having their .inc files
> > being consolidated. I am considering backporting those consolidations
> > that are bug fix only
>
> Those consolidations can never be "bug fix only" - part of a recipe in
> an .inc file is not a bug.
>
> > so that maintenance moving forward is easier.
> >
> > Any concerns from the community on taking that route where  appropriate?
>
> I wouldn't see it appropriate for a stable branch in most cases.
>
> If you are backporting other changes for a recipe that were done in
> master on top of such a change this approach sounds like an option, but
> in the normal case that the recipe is never touched for other reasons in
> a stable branch I do not see the benefits of making such unnecessary changes.
>

I reckon that this would make it easy to maintain then in the future,
so the question is do
we do this now or do we wait until a bug fix is required on dunfell,
at that time the
the effort would be to do both. If its moving code around without
other changes then it's a trivial fix
I would leave it up to maintainer's discretion if it makes their work
easier, it's perhaps fine to
cherry-pick the easy ones.

> > regards,
> > Armin
>
> cu
> Adrian
> 
