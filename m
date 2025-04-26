Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229D7C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 18:44:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.14190.1745693038063111235
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 11:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HwepyiiU;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549963b5551so3398278e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745693036; x=1746297836; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ+wsw7e3RVhZ3Hp7fJTH7FLMO93ghN2OKSlZWMXe4c=;
        b=HwepyiiUkM2lTY9JCDUJdkCRdqoJSCT4MAbfVx2hFWxRasuTlIrKz+mq4ck2/r2lgy
         Mq8PXhBDJAN5lSGossZY1PYVdteCN6FZpiT+XnAm6mpAoudKWpvm2S0jCcRtlosqTOy8
         ZHJF1f7tw6bpNsfq0eOtUOmWHtW6vOOl6WftCU3JBa+oXeUPwuvB6LrMTWemRBLRwit4
         juZYMheoGVspOl3wXSSU+IBNfwjnyxy2tepTaTSVw4B2IFOVNpfrVTc+Sjde7DlR5008
         xdgbhiVlHpAryJ38oFrHjqCLpcgxe43RrCc+AQVzKVoU74ZKigSr/X4l6jRtTQG++JCD
         SI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745693036; x=1746297836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ+wsw7e3RVhZ3Hp7fJTH7FLMO93ghN2OKSlZWMXe4c=;
        b=i7TrvFs4idZJkLs/aSARfBrd1JPxOLcxcPHesBaDbhZWjDvZBpIj72eX6k5QoDso+J
         XNeWBS/8QNVRUddKmT6faY2atlL2p0uepTQrNPbixPm+vkfIy09DnuWh3mkQWVvxhEV4
         kOt4wQ8CnKbt/xobabKrtS+pgEO072fM8ydGs5+KTsQ/5DdUWMmWEUaWxxxsyPIUb1Ia
         IjU66NQsdKulwsASOu88iptcmd3CpGYSg/iGJOpDRzU4zUJ+Bn70y/6Qh9VqyZ23+yHw
         glQ9alKERv55RBobbqcarkn5jYbaRipMdbIikeG6nDTIQnf1muWrCdga4nWlIP/98nYF
         3Bdg==
X-Gm-Message-State: AOJu0YxqZMIvnrtuPgdoI0CzwU6a/xXdz8fAn0a7TUg5IsamLiH2KJTO
	W191MeWGWTSo1odLAAuTCLRUWOKW8ZcKzpoQSi8xPjoGN9x4B+8oFatAwE/Ijecmg2TYyhSTCYt
	f14745u2mJTD3/k0JFB9nEUZ7QbY=
X-Gm-Gg: ASbGncsqWkiA3OCSnNMrIgbqlgNqe1qxsMrJnkMfkUWnPEqdKzg/GK1IhPs1pLIn62j
	qwFngCZhEqKmMrvJrr1pHJOgJFHJMcnjF4Xh4J/8h6P7/g99P1jNCcV39+82wloqyWVyOkwr1TL
	f4KWQ06eBZ/xFlp63IUiC+gHtm
X-Google-Smtp-Source: AGHT+IFSsdEcY/w5lGpBHJ8teeFMVZVQlPfDg3MAvDYekJ42gulR7pyXYQEWcpDgfUO0GoFKCYIiYr4W6GnaMmLcvAU=
X-Received: by 2002:a05:6512:3d11:b0:54e:86f3:5e5d with SMTP id
 2adb3069b0e04-54e8cbcda59mr1841560e87.7.1745693035967; Sat, 26 Apr 2025
 11:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250426170358.2557974-1-martin.jansa@gmail.com> <20250426183626.7502-1-schonm@gmail.com>
In-Reply-To: <20250426183626.7502-1-schonm@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 26 Apr 2025 20:43:44 +0200
X-Gm-Features: ATxdqUEDUlveoZiGW5NyLJLN8Nxa_rIeMgNPtDVci3dVxFGZERnMpZQoj0MEuR0
Message-ID: <CA+chaQcOee0MWzewTARyJgLjXJ=F1vo00OouZg2gCZB0pGriCA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] pgpool2: use gnu17 to avoid build failure with gcc-15
To: Jason Schonberg <schonm@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 18:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117152

Feel free to do that, I don't even use pgpool2 I was just helping with
last few remaining build failures with gcc-15 shown in world build and
this is the amount of time I'm willing to spend on pgpool2.

On Sat, Apr 26, 2025 at 8:36=E2=80=AFPM Jason Schonberg <schonm@gmail.com> =
wrote:
>
> Martin,
>
> While I understand the desire to follow what gentoo is doing, would prote=
cting the typdef in question be a better solution?
>
> i.e. something like this : https://github.com/mirror/xmlrpc-c/pull/4/file=
s
>
> Thanks,
> Jason Schonberg

