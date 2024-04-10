Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58044CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 18:11:21 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.8675.1712772680408664739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 11:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2J70yrH;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c5d9bec755so3511776b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712772679; x=1713377479; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujuFOzdFuufr7YN9I+iGXwUaV6Y7FlyS368Qq329vZA=;
        b=m2J70yrH4O3ko69dDaJEO7/B0umLlqxbOgeq3xBuAH6ciaPUd/mJIWXZzkJ20LUoTl
         HvJaC+n4fjTsq4FwBvRP6pvIXiRXh8bG9C696ji7hsm3YTAw15FJfNfc7a7y8xwkvU1n
         0PnodbEYEjSyXewXSO68cLnJppo2T1MC5lmghR1XXZUzXRv3/GPAZsmr39sx02nd5yGC
         iug8k4y4yXC1Dgwjwt4UOMtdSMhVVX53hlby4E2VzzvXNz2Yo593ZqSuTDsYfojMlkLr
         /iEfSt0PMC1T0VFDqfizQEcEBb1e8ZtT6keMBgjWhJuP3KjDUcSWrX5HaBmDDJPSRP9M
         L1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772679; x=1713377479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujuFOzdFuufr7YN9I+iGXwUaV6Y7FlyS368Qq329vZA=;
        b=P2sLcf18gnuPRaG4CigcGI6jVjpzxLJbR6YQyd10maJWhqlbtufwmbgtGTBeXkNqvq
         737CDJOrNgBI5MK0opATMvceH2DCDLShfJNNwNQhtRweeR7lA9gEWExTLD+uBqZsENMf
         s2lnPcqXclcYu1xEuZeH48FG6qPlfjH3+OdAm5GG1GRwZ2czhoZ/K9Op8n7WBXU+aM9T
         eHgzfbevM1OpC9k1rEBAwVMrFpUjWUaIHWqd37+coD53D1eiD15xpUtGRV1beVsQIo3s
         TtgxDcDzZJ3QqZdXcGDigJGR+pABYCiL8s3lfjdRDHjvPxBpX+CNGCDdpjgEriXrN4ry
         SvMg==
X-Forwarded-Encrypted: i=1; AJvYcCUOoCQkWzpbBU5pInZATUECZj+ZzX1SCmSlK1EY2vhfqby0wTXI2rMHGNCegpM5MhzqxWikrTLrF7Pu2JFBlHF6EhXpvvaV57O+cvKbTcMm3+f2fidUJDVZQg==
X-Gm-Message-State: AOJu0Yx7m6d40QRkzX40u5311it04+gr4FctNIN/Tow1pc86UiAqv3Dt
	3D1lGRTe8PwoorCvMVqAdEp965WkBfgsBmehvlvyHHNrBvXL8ikV9pxQtcdiJGhEoQxdeNB/NMI
	HuLj3RvkzV7pNHBD1VU3U6Tn3V+o=
X-Google-Smtp-Source: AGHT+IErG+tDXjXYzKkbIx5wRcLhMzI9hQ7ezCx/Xr2ivxZABVdUwy1jsyvJ7nMMdvcVbjJx/7t+XI8Db3trPyXFWtc=
X-Received: by 2002:a05:6871:589:b0:21e:7751:312c with SMTP id
 u9-20020a056871058900b0021e7751312cmr3588305oan.30.1712772679623; Wed, 10 Apr
 2024 11:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com> <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com> <CABQJdOGz8GNw0Gx=Yt87jVmocXy_Jkt8dwHsAURnP3SoyATO3g@mail.gmail.com>
In-Reply-To: <CABQJdOGz8GNw0Gx=Yt87jVmocXy_Jkt8dwHsAURnP3SoyATO3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Apr 2024 11:10:52 -0700
Message-ID: <CAMKF1soSk2xrEAAJWvXM9sy5db8fEGnoowCb1w6icq6+MJrGug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 18:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109909

On Wed, Apr 10, 2024 at 10:26=E2=80=AFAM Beniamin Sandu <beniaminsandu@gmai=
l.com> wrote:
>
> I don't know how that CVE tool is doing the checks, but it's doing
> something wrong.
> Both the CVEs that are mentioned in the list, have nothing to do with
> the current library that is built with the recipe. I am actually
> curious as to who is using this library anyway, because it seems to be
> some random implementation with a very similar name.

Its not random infact, pretty old implementation.

> The widely used library is the one at:
> https://github.com/arvidn/libtorrent (this is the one used in stuff
> like Deluge, and other torrent software).
>
> CVE-2016-5301 was fixed in: https://github.com/arvidn/libtorrent/pull/782=
.
> CVE-2009-1760 was fixed in:
> https://github.com/arvidn/libtorrent/commit/eb2203abf51e63b1d5ba0c3e5d972=
936df96c31a
>
> Maybe we should replace the current recipe or add a separate one to
> build the other library.

Existing libtorrent in meta-oe is used by rotorrent recipe and I dont
see more users of it
so question is

1. Can rtorrent use the arvidn implementation ? if so then we can use
it for libtorrent systemwide
2. Merge libtorrent into rtorrent recipe since its the only user of it
and libtorrent recipe uses arvidn fork
3. Create a separate recipe for arvidn implementation

>
> On Wed, 10 Apr 2024 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Beniamin what is the resolution based on ? before we revert we should f=
ind
> >
> > On Wed, Apr 10, 2024 at 10:02=E2=80=AFAM Marko, Peter <Peter.Marko@siem=
ens.com> wrote:
> > >
> > > This CVE reappeared in https://autobuilder.yocto.io/pub/non-release/p=
atchmetrics-meta-oe/cve-status-master.txt
> > > So it should not have been applied.
> > >
> > > Peter
> > >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-devel@l=
ists.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> > > Sent: Sunday, April 7, 2024 17:43
> > > To: openembedded-devel@lists.openembedded.org; Beniamin Sandu <beniam=
insandu@gmail.com>
> > > Cc: Khem Raj <raj.khem@gmail.com>
> > > Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
> > >
> > >
> > > On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> > > > The CVE mentioned in the recipe applies to a different libtorrent
> > > > library, from:
> > > > https://github.com/arvidn/libtorrent
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [1/1] libtorrent: remove CVE mention
> > >       commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489
> > >
> > > Best regards,
> > > --
> > > Khem Raj <raj.khem@gmail.com>

