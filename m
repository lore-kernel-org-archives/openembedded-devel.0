Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254FBCD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 17:27:01 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7701.1712770018117984987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 10:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jblh0LYa;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso5739879a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712770017; x=1713374817; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vL5m+eZSvIzAuyqdnl7qc9nvwG4nzMCCeWYzYWBeNw=;
        b=Jblh0LYaEFotVgz1sE78u7PXWkzmZSc7S/izLbBtKCB5pjrxXvcKRXaXUZnXq7HDaW
         VQ6aN7YA02NqO/eKQ6UFXeUxSGC6nZDI0rBfyh/fFYPFMy0f+56sJR19AgS5CPBW4nIz
         7VTTHC4FAOikgFvJZFSsWqBuwpUIMG1Kyz1xBqrlXxLUmw2mRpE77GpiGPeck4udDhjr
         soGWvziyoN4gy0O0NywKC/Ton0JftYslpphbYJNtrCZhn4+ekRAIgOPE58TyZonNij68
         2wSvGcK1WhlAQIQo2SkIBdp+BxncJWZkU47gGhzIF8CZyjvp19iPyBsVdqDuiyFyqeYR
         T5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712770017; x=1713374817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vL5m+eZSvIzAuyqdnl7qc9nvwG4nzMCCeWYzYWBeNw=;
        b=rT8TUnZ2goMOkGTGJPAnzWh8ZNbUQWZzevuPwF002F2U4Q+8jYCAgcsj4QJk5cHwcM
         H7u9WhNOJLKH6UDtDlh3VJm6O4n42UyBotc+MxtFG8XOfCBMWLjdrRtqyUf+rQX50yoD
         TMTb2zSHBKWerX8WoPj16kQFxe+cDhvnxWLPQRcsc+jsXSZrWFVm/DQ0JFBCKDkEMsaW
         iyUK7rGrC6aUsfHrBj/ArokJzp59Hc2eNjBBQnh5S7Lm306/4vyWnfRKvWb0K1KEaCCa
         4Sf0limcHDbQg0qQ8X0NVQ185gbvUZZwYDaGEkO/4jHtXuEP1MLAkoP0UWLuTqrOpFgB
         0zig==
X-Forwarded-Encrypted: i=1; AJvYcCUh7SYM30RKoTCxLstpw0BPniLjUsBKRZgh+h0+idhvPL4VWuYx+vG5G4T99+FmtTrOkY4h7xqZUa5bcQOvyOhe4msKhW6ApsgpSIv+zmiOjlgiGX2s2zNT6A==
X-Gm-Message-State: AOJu0Yw6HEEuGXAFhsFQCayncEbH7h0zJrXeyxVKB2J+hwu47hBriVBO
	773h9ljBe/XXi6Zy8xFjaiErdMSJMTLkQwsuY2DRe8GKUaIyFBq61wNqRFdEDcAbH5Gh9BmyHq8
	ok7esu03dm4K9HWM6qRVM43jB6EM=
X-Google-Smtp-Source: AGHT+IHSbO23Wg85eVgiepJwmqPZHXxAoLf/8ADZgBmiaAF8/in4H0AjTG7UWC41pV/p2rVrZN9qoTm+9na9gEUUi5k=
X-Received: by 2002:a17:90a:b282:b0:2a0:8eed:56ec with SMTP id
 c2-20020a17090ab28200b002a08eed56ecmr3387506pjr.39.1712770017344; Wed, 10 Apr
 2024 10:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com> <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com>
In-Reply-To: <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 10 Apr 2024 18:26:46 +0100
Message-ID: <CABQJdOGz8GNw0Gx=Yt87jVmocXy_Jkt8dwHsAURnP3SoyATO3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
To: Khem Raj <raj.khem@gmail.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 17:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109908

I don't know how that CVE tool is doing the checks, but it's doing
something wrong.
Both the CVEs that are mentioned in the list, have nothing to do with
the current library that is built with the recipe. I am actually
curious as to who is using this library anyway, because it seems to be
some random implementation with a very similar name.
The widely used library is the one at:
https://github.com/arvidn/libtorrent (this is the one used in stuff
like Deluge, and other torrent software).

CVE-2016-5301 was fixed in: https://github.com/arvidn/libtorrent/pull/782.
CVE-2009-1760 was fixed in:
https://github.com/arvidn/libtorrent/commit/eb2203abf51e63b1d5ba0c3e5d97293=
6df96c31a

Maybe we should replace the current recipe or add a separate one to
build the other library.

On Wed, 10 Apr 2024 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> Beniamin what is the resolution based on ? before we revert we should fin=
d
>
> On Wed, Apr 10, 2024 at 10:02=E2=80=AFAM Marko, Peter <Peter.Marko@siemen=
s.com> wrote:
> >
> > This CVE reappeared in https://autobuilder.yocto.io/pub/non-release/pat=
chmetrics-meta-oe/cve-status-master.txt
> > So it should not have been applied.
> >
> > Peter
> >
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> > Sent: Sunday, April 7, 2024 17:43
> > To: openembedded-devel@lists.openembedded.org; Beniamin Sandu <beniamin=
sandu@gmail.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
> >
> >
> > On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> > > The CVE mentioned in the recipe applies to a different libtorrent
> > > library, from:
> > > https://github.com/arvidn/libtorrent
> > >
> > >
> >
> > Applied, thanks!
> >
> > [1/1] libtorrent: remove CVE mention
> >       commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489
> >
> > Best regards,
> > --
> > Khem Raj <raj.khem@gmail.com>

