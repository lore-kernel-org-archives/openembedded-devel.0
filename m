Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFA0C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 19:25:19 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22662.1792005917780241251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 12:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Md1JzGMU;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93d92abf38dso431276485a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 12:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792005917; x=1792610717; darn=lists.openembedded.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLRV/HoBiZ2u1ivReSknBS68PlWMF+AXPEQQDZwlaCs=;
        b=Md1JzGMUhodegiCob4L1w9T7Qdp7sX4ycGDu8E/VDAmWNpup2hd4oBNrjxAShqZn89
         Yx+dFBOpvYbKXLRdHSio+hzX532BpR4dr/MOOJyhg3hxjQSDWIajo7Gi3ZbvT4ySnOUp
         DhDaoGmFMKcr11UiZ+MlNSdBCv2sgSUNeIap8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005917; x=1792610717;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLRV/HoBiZ2u1ivReSknBS68PlWMF+AXPEQQDZwlaCs=;
        b=q3Mx3114zPJ2LFaOL2TH0HEXmEmcc4vB3rIrz+QFnlw7H+lQwQmkh+uCoNcwnz3wFE
         ZQRUHuXYAU/Et7pHLtMITDM86kI8ZHaenXW1eUky4cI+/4AM1XV0hstGPK7HqQOHNQ7j
         IQUOeLPuLdrcqdrwXUkkNZJVjTg8ym/gXFGNf+l0B7QoME/PBGnC/78sUjs092ynfp0+
         MEbtmEmvzexb867j5Antx/hPGS2Q9M0Pb4VhFGNfWM49EwgaSUBxI5KOY3K48wzY35c2
         KAi04VeEWEGdYufX/OZcmVgeB8jTb7oOt8SIjiuew51GRq8S1q7Dp+4VOZ4KKrHD4FRO
         rurg==
X-Gm-Message-State: AFq9FYLjqchUXQn46TCMATXAiaj62I6XQy0+9Hv3zKsb2iJYSgsgfPGC
	mtTD8hQr2c5v3yWvFTQBNrr5yl0AqhBYZefUaHzmiCO6pGWGuV2ZcPE5k7aEnUDj7EQ=
X-Gm-Gg: AYBFou2IeNPsg5Rit+K9Qsdnd6DxZcV1T3mhtItoiO+cOLToDRSOAZJgcR/yRbi3Ehc
	LYGkNDdEDXN2VruC9ZzoeQRHn2pziE6QyhmJczQQWJEb1TqkSqqt2OTSoJ2+DE1mRG3tJct28Df
	bNpEzP/weHfLwut3eP61RMOaM8Sfi0tJpH1XsOCAnsvV4tEQFc8da6LXPWVCP8wtEscMYPbe/tn
	vezT7D+lLArAdM9XzbDng8tjYxOwhkyn6NTuDpHjiF3XVaMpBeXdPE1aBYUUaIMRiE6HPTkx1f4
	4R34onluzLQeD7gSbVwwy+myGxauPvyH7ba75nT4Le08W2IHpVp/l0iKYmutltRf2imTL4w2pYh
	NybizZUlz59TnWj2HP5SPf6vq8emBMmYlmYpzJYQJUR6Akq8apMC73izrPIpHaNgAd2rAHa6Lqu
	1KwAYimP8VGuPUjEO3K5PVrKqrwCIxJ1gx4e8TPhSEXnWg205hDP2gHCzemlkLZ503VhNbobfjN
	2WeRMwtI9epeGDDvrJH9Tk9Us8LXIjgZuDYJCRACZk3qFGOjP3OYdwN9jR/ETmUna5MwXE0aDFW
	DQYwa0PtXNKBQHseVCBuC5rn8kq4
X-Received: by 2002:a05:620a:1a0d:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93ebd222d85mr2617428085a.32.1792005916462;
        Wed, 14 Oct 2026 12:25:16 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502608bsm567715085a.25.2026.10.14.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:25:16 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:25:04 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 0/2] Some updates for pypi.bbclass
 changes
In-Reply-To: <CAMKF1so+TJ4W=8MpY9m9QXWHo1kqwHAABAx71d=P0dS2DBGZaQ@mail.gmail.com>
Message-ID: <7ccbd21a-ec69-727c-0870-6b061b6b9f65@konsulko.com>
References: <cover.1791537542.git.scott.murray@konsulko.com> <CAMKF1so+TJ4W=8MpY9m9QXWHo1kqwHAABAx71d=P0dS2DBGZaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-362290775-1792005916=:3939"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 19:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130899

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-362290775-1792005916=:3939
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 Oct 2026, Khem Raj wrote:

> Ross has sent a comprehensive patch which I could not test and apply due to
> travel, its now in master, can you revalidate your usecase and see if these
> fixes are still needed ?

You can drop these, things look fine now after Ross' patch.

Thanks,

Scott


> On Fri, Oct 9, 2026 at 3:05 AM Scott Murray via lists.openembedded.org
> <scott.murray=konsulko.com@lists.openembedded.org> wrote:
>
> > Here are a couple of PYPI_PACKAGE_SDIST additions to work with
> > the updated pypi.bbclass, they fix failures I was seeing with
> > meta-security CI.
> >
> > Changes:
> >
> > Scott Murray (2):
> >   python3-systemd: Add PYPI_PACKAGE_SDIST
> >   python3-dateutil: Add PYPI_PACKAGE_SDIST
> >
> >  meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb | 1 +
> >  meta-python/recipes-devtools/python/python3-systemd_235.bb    | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > --
> > 2.47.3
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#130682):
> > https://lists.openembedded.org/g/openembedded-devel/message/130682
> > Mute This Topic: https://lists.openembedded.org/mt/121669340/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> > raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
>
---1463811583-362290775-1792005916=:3939--

