Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.3529.1602083798315634562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 08:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VknAoGnq;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m9so2135591qth.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2020 08:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYEm2JPa6icpzE70/UPO1yyjCLzRK2PYtTTuHdTRVUU=;
        b=VknAoGnqnCRoTMNKaCE0PWpVNPBYV0g3z8tVJx1BTiarkGMhvJhB0vDOzKc+eoozIv
         GOltc5IzA+6BLg6ER1byPfLim9XACqCHDSfHdwPsro68ZneIaMfqk6lWu020dhRcgxU4
         IiQ0+EueopCCk64esRfbxWaei6BSWW5lsZgep1AZ1dpNGReCCvpru3wb7ZtLyq06Bzh0
         B6QIAPucsZ0JX03BQ+qbevfio1yxA8lKXhVIn3f/JeZcnywNC61BsLnThVUY12+vQolu
         vBefXyaf/dC7Ygvz4Squ7S1L5lhDoaEAfs5VtBFewCYKQmafVfMlqiw3T0+igJWwIHvH
         SnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYEm2JPa6icpzE70/UPO1yyjCLzRK2PYtTTuHdTRVUU=;
        b=VL0GgJ0GGQEkmzCafXx3N9kijMu2NXz6S6t5lswCJ94QoyvgBWnh6k/b353DZBB8qn
         Y65DYFvTKyrVejSJ1qOp/a35A/ZV/1fro86kDBM0zLrSbI1S56h/pnLVdlZiT/xt+rcY
         8gXXu9VJn+17wZ2NOKNC2Aflv/Zj9DvVpjMRGRmTIS+oLogfd2pNjPhtZAP6IxD1JCeF
         gQ0mqV13q8PVoZ+j0RhB7JKm85VscyuGWg8bIdcL0r1KvBgpHRYj0fWAQy8udVivklOH
         4f53PKF5zn5XyZNJ/6npiiV2MLGxd9JjXe3FRc/HSi93JEj4Iu8p/MvsG6mfcqUpCPvG
         IxuA==
X-Gm-Message-State: AOAM532BhrhLuFvwxk8i3R373B46HY2AieqL0NBhSVgE1Fq6qwZDZL5R
	UAHXW4Uh/x+K2YnzjfC2Xva62E5x7s/uJUaNvbU=
X-Google-Smtp-Source: ABdhPJxuXyJBg7XaZkaVoBiy/xQTG4aTCgmlaNk5rAQe5TYfHBNONW5e6wqkb76HivoqyIPuFr43jBVWBxGa2LUdhXA=
X-Received: by 2002:ac8:3975:: with SMTP id t50mr3732144qtb.53.1602083797207;
 Wed, 07 Oct 2020 08:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAAwVp3s_ubYfKsq4UCbAUHyN5OYMr=0b8CMci8a6_QeDaW4MOQ@mail.gmail.com>
 <2b59619007c9817b93c052a8da357c6d@agner.ch>
In-Reply-To: <2b59619007c9817b93c052a8da357c6d@agner.ch>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Oct 2020 08:16:10 -0700
Message-ID: <CAMKF1spAeUdNQYsaPp+64KG+CrL2Xe8F+OLby0rypBC9ZXz0Ew@mail.gmail.com>
Subject: Re: [oe] wireguard-tools systemd service file installation path
To: Stefan Agner <stefan@agner.ch>
Cc: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 7, 2020 at 6:59 AM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2020-10-07 14:05, Mario Schuknecht wrote:
> > Hi,
> >
> > I have a user question.
> >
> > Why does the recipe wireguard-tools
> > http://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb?h=dunfell
> > install the systemd service file wg-quick@.service to /lib/systemd/
> > and not to /lib/systemd/system/ as usual?
>
> Seems like a bug to me. I don't think I tested wg-quick back when I
> added the recipe.
>

I think we need a patch to fix it
> --
> Stefan
>
> >
> > In my system the file /lib/systemd/wg-quick@.service is not found by
> > systemd and the service is not executed.
> >
> > Is there a way to change the installation path or should the
> > wireguard-tools_1.0.20200319.bb recipe be changed?
> >
> >
> > Thanks in advance.
> >
> > Mario
>
> 
>
