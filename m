Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8075C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 15:00:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.14711.1682089235936638458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Apr 2023 08:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cfbZFFAG;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2a8db10a5d4so17314271fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682089234; x=1684681234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz5eZGtROnQLH/JUNdFsr9MFOyrn4SDS/y/hx2WaK5Y=;
        b=cfbZFFAGXM7vocQKpgFJ0QL/UM/Y0fx0BAeVxJ5kYAVMMzWCMfmHKjkHinubOGW+dU
         cCmGd9yhDTeJp+PtIl7NKn4Hlog94NllrlJE30t5Duk7bT57ffMox9etfONYi4HyyLoB
         yL0sLdhnlhW7QF1Xq9s8uFCuRTg1G52+03KvqXlvnNTgBEHhzT2cl5YBUl8HG28wx5BN
         HzyVyac8cof9+FcXX5l5heT5ioCBqldh11wtNZ0/am16EjaHnFvcOD16Obh4ZjBVfLsT
         oRg/FxulzSTvoQ2Md4xNFFPzQ5YcDjcqgcBDjBbiN8tG6hRDMdkmXt7EQXtnGTPBgwZZ
         OFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682089234; x=1684681234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz5eZGtROnQLH/JUNdFsr9MFOyrn4SDS/y/hx2WaK5Y=;
        b=aOEM1GZNZYFAAAe9Dp09aa8oW656ek1wxET0MVWF0PQE6w/iq7oceUIkhw7aYQSiCT
         BZOGWCIUhR5DW60Q08VMTsQ1sBG/gA2XBCo1JG8duvj0NqdQ6vryxiLFRY7cDrKyKjUA
         Nj/9PK0evGdP7XI7uA++HZ1MRy+uQXcQcBoqdb++IIGm1BFkEKTR6abujRkmNe2LMoU+
         1hufCJVWugc3A+DrV7m6p+4wT7ZQly9W+48YpnuauTaOGTbyc6RwZCPEJ2IBTrEVBZdn
         zqP0y+ltu8enjeZSv8IpupMcbECxJ/JLKBuKQstabicFOxt4cDhrUwxxK/akpzGjzxMI
         9s0Q==
X-Gm-Message-State: AAQBX9fXfxWe71n3H65+x7O5okNVMnjV1RkjCilSsWOCsTc832JBuSpW
	guo7wBkuqiP8focX034UW35NnV8UVo3RzemdWxg=
X-Google-Smtp-Source: AKy350ZTKo+5gAPZTVPaWGoC3AKH+myfMWYEzCzW7ui/3eIaNoS8uhZpaSsd/dXRKqnZ6u/8Tz4fXDtraZjQqh50zZY=
X-Received: by 2002:a2e:86c4:0:b0:2a7:970b:b046 with SMTP id
 n4-20020a2e86c4000000b002a7970bb046mr682451ljj.46.1682089233773; Fri, 21 Apr
 2023 08:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MeKia5r3CP6ZavcdEGoeR1cbPjV+5ewP-8aYg4pAejS=Q@mail.gmail.com>
In-Reply-To: <CAMRc=MeKia5r3CP6ZavcdEGoeR1cbPjV+5ewP-8aYg4pAejS=Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Apr 2023 17:00:22 +0200
Message-ID: <CANNYZj-5kNvLEbKsyO=J=eq6OTTc-c8m1bSBmwb5ncomz9FC7A@mail.gmail.com>
Subject: Re: [oe] Depending on external recipes in OE-core
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 15:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102145

PACKAGECONFIG definition for a feature such as qt5/6 support doesn't
have to be in an external .bbappend, as in itself it doesn't change
how a recipe is being built, it only defines a recipe option,
component command line switches to enable it, and dependencies that
need to be fulfilled.

If there are other missing recipe options, then just add them to the
gstreamer recipe.

Where and how these options should be enabled is another question:
default set in oe-core is made such that no external layers are
required. I tend to think that vendor layers such as meta-qt6
shouldn't mess with other recipes (through bbappends) behind
integrators' backs, unless those changes are strictly required for
building qt itself.

Alex

On Fri, 21 Apr 2023 at 16:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I noticed that there are some recipes in OE-core that depend on
> recipes living in third-party layers which are not in LAYERDEPENDS.
>
> For instance: gstreamer1.0-plugins-good has a PACKAGECONFIG switch for
> qt5 which pulls in a bunch of packages from meta-qt5 but the core
> layer (obviously) doesn't depend on meta-qt5.
>
> It would seem to me the right way to do it, would be to add a
> .bbappend to meta-qt5 that would extend the gstreamer recipe with qt5
> support.
>
> Is this done on purpose or is it just some leftover from earlier development?
>
> I'm asking because I want to add support for qt6qml gstreamer module
> but I'm not sure anymore where this should go - oe-core or meta-qt6.
>
> Bart
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102144): https://lists.openembedded.org/g/openembedded-devel/message/102144
> Mute This Topic: https://lists.openembedded.org/mt/98411872/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

