Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.3461.1622063169653188969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Ldd6wQys;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id r12so2541694wrp.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kPZ2yXj6u1ws3EvlQcqyMWTvA7s1KbMjLRib0V7LjPI=;
        b=Ldd6wQysWE1s2ONcj6iK5m5/PtdAH/O4fu+jb9OpCYeAaOUNVF3ApURPwvF0lazjiF
         XMLA32NtfjPZNUnsXwhvZ/Un9Awt9iMKoc6nJFRNRoYyHApsjtF4Mrp/FJElMuhMw+0+
         6wRt+sTo2SytvWq8Z18KDe8ovDgtYxXf5yOTPohP4hptTF3vdbCttHdrM4guOKsZ4IGL
         YR6Ztrh0CeTOknskRF1WgVhmddtOJ/ECfXzBv7gvs0sTJId/QAla2EN+KchYsoOvkFSH
         IMmizYibpRcv48fhAxfVO+8+Vjobd1G8R5mHP+rYOkfuH89Cwf0iMeR+OiP6byekDGeQ
         2ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kPZ2yXj6u1ws3EvlQcqyMWTvA7s1KbMjLRib0V7LjPI=;
        b=lLLkNaQhr0p1s0cysEy4F49nwtvOeZ9xxE4DNXdhnKuGHYTn44AtlNznzMgu5fuRlN
         tVJwRipP4OQw0rmo0Xy5ctpW3kVGSz65zNNzckV2jGeSlEx7Ge6f9TiaMNfRXfFZlrKl
         q1X+pwIlm+alYlZ7MDLuG6N1dL5qDIw7XBN+Q2TXHe/J6MlPb83yvbw85FeUNm2N8gNk
         2J3K1EPsKQmxVbJJhZ16ElZp5wKgmDAnxwWWQ5Ptt5wuDcc/teD9KR0BglAwmYRopkIf
         XP8YxiZDrp+UbUBemGPdxmovm1C1WNrKnPrRxEPg4p78qTB/OXF4fAsv/k7YswPOVt/y
         rKlQ==
X-Gm-Message-State: AOAM530geFk+v4/eNABdOcL/IbQUqkyjwprJRKgs8JJdNqeF2lee46tp
	nag432w4Ed1pTtrMMYc4TSQPYxlcL0m/0mZVY566Ow==
X-Google-Smtp-Source: ABdhPJzgFoPTiVRzQW+fH1y7G29dI+U1O5rRGaU3y1LoWn+GDIj9p0zyJmv/AG+zdmD9Iz6sj3uX61CUAo95rkrUySE=
X-Received: by 2002:a05:6000:110f:: with SMTP id z15mr34973150wrw.199.1622063168089;
 Wed, 26 May 2021 14:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210526143604.3921863-1-ross.burton@arm.com> <CALbNGRTdveaEGBNy+wcVbB-Yr4EJB_pcandXVGazeK3zcdqfQg@mail.gmail.com>
In-Reply-To: <CALbNGRTdveaEGBNy+wcVbB-Yr4EJB_pcandXVGazeK3zcdqfQg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 26 May 2021 22:05:57 +0100
Message-ID: <CAAnfSTu-asAvfPKuYVVLFfsH9v5Upm91c8NBHdVGozLAW1Xo7w@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-gnome] meta-gnome: add Cogl/Clutter from oe-core
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2021 at 20:58, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> On Wed, May 26, 2021 at 4:36 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > Nothing in openembedded-core needs Clutter now, and Clutter is abandone=
d
> > upstream.  Move it to meta-gnome as there are still a few users of
> > Clutter in Gnome.
> Just out of curiosity: What needs cogl & clutter these days? I thought
> that both were more or less merged into mutter.
>
> Or in other words: Who/what would miss them?

In meta-gnome, libchamplain needs it.  Totem is also using it still.

As those projects migrate to GTK 4 I entirely expect Clutter to
disappear entirely, but as of right now it is used by a few GNOME
components.

Ross
