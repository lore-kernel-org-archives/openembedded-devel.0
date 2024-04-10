Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E0ECD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 18:37:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.9326.1712774218169367418
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 11:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4LoIHv6;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ecee5c08e6so6653129b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712774217; x=1713379017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW3bZjGHrruqEj4/QFchZN0x/xTh08zCahlVTkBw6+4=;
        b=P4LoIHv6dMYxkOsYPjc7ZTSZ//yfpR0hOK1r3/FZ/adjo3ybjEYO0cY09F72jQ88qP
         1D6pAju6+01oqqYW4qKR8ugXeBUD23gmf13wsvZ3kq2ZCcq07XljHHR9tK+bTBQn3CiO
         BvGQ4Krf9sWFJwj1yiDeVH6U77HzLCf8B/fL1nsNSrm66PLrkI3ePieaoO/nXF2Hs/1r
         AA5jcGALhu0mHNneTLOzkoPQr20IdNN2Bvylf0t2mjr/0IcD4s9Ug8I9my7Mo3zPlggX
         xWR7iF9DPWj6YSTM8dNS2Z7cJt3BgHjikklmSVxkHkHXHw6etN3kreBr32h/r1yuQv36
         FpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774217; x=1713379017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW3bZjGHrruqEj4/QFchZN0x/xTh08zCahlVTkBw6+4=;
        b=GeotdhPypnym29Ob4Ti0aTg3Ndri8gZXzcaCCdr2hVvXhGqex7FcPZE2tw0CTdA5Co
         66iPgx8i4cAs22C5D3Oav7WjAeUb+r5YGiB55XctJTChbbyLCC8VkNDP+MsVkygEYfNI
         EmywGzh0gDHolWWydEiqGezmmeH36VbGze6oYMN8bVOKNND1jRIZdJlvzktYDHzo5ZDO
         /zzOf4N9vxf2QrOUlwKWkTUKot+mNmpdy6b9Kn6+epnDeWe146kCsWoEJ4VdvhGQ9unt
         1/9WDLFm6cp1FIJ/UXW3uaWgto6/R0FkqZR1aIbqTrwEYGHXYqJw1Lc3ryhFFz2A6vyQ
         O1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKlh2m+bSlHEOjWMALt1xuvTDmcQqEap9H6daA2D5OBHmnHCQzEPFJpPMw/oib0ln9OaZJIG0qiiP+VlhY8S23cW++nG6o19nRvGO0+uzZZ7qGW2HE/49Huw==
X-Gm-Message-State: AOJu0Yz/fbaXyaabDdWuokI2Q7sTInbzEc9gRvGfIe/x2/DBmH6ErEPS
	tyP4zon7anx5C4rLDTs5xQ+8xtogM8et5bM8kzeGqOftuBwpMoaszY5D8yaOk88LDj2mdvGK0YH
	TrNdGZN58jip0/ds46qeCLD2fr+0=
X-Google-Smtp-Source: AGHT+IH0wz8C7cq0Cfdy0tr5wNt/ukY4CCC30Cz9XVJpH1rd36Zr3AxVTOhalU6ioFDSaDhYSoLdCSgZ/KGhsWIj9iY=
X-Received: by 2002:a05:6a20:5647:b0:1a7:34c5:d141 with SMTP id
 is7-20020a056a20564700b001a734c5d141mr3433622pzc.24.1712774217369; Wed, 10
 Apr 2024 11:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com> <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com>
 <CABQJdOGz8GNw0Gx=Yt87jVmocXy_Jkt8dwHsAURnP3SoyATO3g@mail.gmail.com> <CAMKF1soSk2xrEAAJWvXM9sy5db8fEGnoowCb1w6icq6+MJrGug@mail.gmail.com>
In-Reply-To: <CAMKF1soSk2xrEAAJWvXM9sy5db8fEGnoowCb1w6icq6+MJrGug@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 10 Apr 2024 19:36:46 +0100
Message-ID: <CABQJdOEvqMyUyaFCbV7pf1B3b1bVxn95LQs-WOAfkS-GQHAXbQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
To: Khem Raj <raj.khem@gmail.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 18:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109910

On Wed, 10 Apr 2024 at 19:11, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 10, 2024 at 10:26=E2=80=AFAM Beniamin Sandu <beniaminsandu@gm=
ail.com> wrote:
> >
> > I don't know how that CVE tool is doing the checks, but it's doing
> > something wrong.
> > Both the CVEs that are mentioned in the list, have nothing to do with
> > the current library that is built with the recipe. I am actually
> > curious as to who is using this library anyway, because it seems to be
> > some random implementation with a very similar name.
>
> Its not random infact, pretty old implementation.
>
> > The widely used library is the one at:
> > https://github.com/arvidn/libtorrent (this is the one used in stuff
> > like Deluge, and other torrent software).
> >
> > CVE-2016-5301 was fixed in: https://github.com/arvidn/libtorrent/pull/7=
82.
> > CVE-2009-1760 was fixed in:
> > https://github.com/arvidn/libtorrent/commit/eb2203abf51e63b1d5ba0c3e5d9=
72936df96c31a
> >
> > Maybe we should replace the current recipe or add a separate one to
> > build the other library.
>
> Existing libtorrent in meta-oe is used by rotorrent recipe and I dont
> see more users of it
> so question is
>
> 1. Can rtorrent use the arvidn implementation ? if so then we can use
> it for libtorrent systemwide
> 2. Merge libtorrent into rtorrent recipe since its the only user of it
> and libtorrent recipe uses arvidn fork
> 3. Create a separate recipe for arvidn implementation

I have started working on a separate recipe a couple of days ago,
called libtorrent-rasterbar(which seems it was the original name of
the arvidn library, also mentioned it one of the CVEs), but it
currently fails to build the python3 bindings for 32-bit arches, and I
did not have time to investigate yet.
If you feel like taking a look, I can send it right now with python3
bindings disabled and you could add a patch on top, or I can send it
sometimes in the future when I get back to it and fix it myself.

>
> >
> > On Wed, 10 Apr 2024 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Beniamin what is the resolution based on ? before we revert we should=
 find
> > >
> > > On Wed, Apr 10, 2024 at 10:02=E2=80=AFAM Marko, Peter <Peter.Marko@si=
emens.com> wrote:
> > > >
> > > > This CVE reappeared in https://autobuilder.yocto.io/pub/non-release=
/patchmetrics-meta-oe/cve-status-master.txt
> > > > So it should not have been applied.
> > > >
> > > > Peter
> > > >
> > > > -----Original Message-----
> > > > From: openembedded-devel@lists.openembedded.org <openembedded-devel=
@lists.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> > > > Sent: Sunday, April 7, 2024 17:43
> > > > To: openembedded-devel@lists.openembedded.org; Beniamin Sandu <beni=
aminsandu@gmail.com>
> > > > Cc: Khem Raj <raj.khem@gmail.com>
> > > > Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
> > > >
> > > >
> > > > On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> > > > > The CVE mentioned in the recipe applies to a different libtorrent
> > > > > library, from:
> > > > > https://github.com/arvidn/libtorrent
> > > > >
> > > > >
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/1] libtorrent: remove CVE mention
> > > >       commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489
> > > >
> > > > Best regards,
> > > > --
> > > > Khem Raj <raj.khem@gmail.com>

