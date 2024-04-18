Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A6EC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 23:33:15 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.8202.1713483186469001839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 16:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQAR5ZYV;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2343ae31a9bso554752fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 16:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713483186; x=1714087986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Wnw3yhga4H8rwfVoPEQ+D0rMWVd+333dUPVj8v3tA=;
        b=eQAR5ZYVfyHdeS+TGJfUaNNqDrCTN7T/zjo0LpovK3hU33S2yZx6j8ONLq0ice6AI1
         1R7diFBMdWXaWl6NXAYXPXhZXtLkgUXJwiBKEjbA0+0H1D0cT6f4yk/UJrEPh1dJPo1+
         l7m4O+Bf/d24U+U6yuaIcC4EkBjYtdVa6ZiCS+8WAD+szV9sNjMZvzekN/oIPpZS1FeM
         enSyhucPyDXCqeklJfuB8TesBtYejtECwIat9TApWGnm3aDakS9vsiR4AdVgNL1MRYtz
         tR6Dy073vbEa9p+L5tLtFiVBg0kMNX0YAKHPQL8SC4lFnsBzvrivgexOQC48AYxSkedA
         AfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713483186; x=1714087986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7Wnw3yhga4H8rwfVoPEQ+D0rMWVd+333dUPVj8v3tA=;
        b=VgL/Phmvj4XAg6MRXkbA8z20GSk8F7ec08g6AVM9u4ZFc6cFpmIDlfbvTwULuzzHzv
         eAa0NF71Dy3hvOBvqBaNyXzbkIxlDKRo3uO+GshRlzjRlelndVozEoeQmlkThOeOx4Ar
         nep6go9ikts48ycBBqiPIM1zhuMAk+sf8/X8rECrfjovUnSh3t8SWAMXQh+QWb8lttBX
         Nh9T+MFfD3gzrZyLQJDH4I9wW12BB0bUiAo6J6pq/Unut3PE2y3I63laAf4oCU6zyiWb
         9fSWBkYpFefApCkC3cpgG14NReh9Df2TFElOs1fBbrhthdvwkNa4r/MR5lCi1/f3s3Tm
         XKnQ==
X-Gm-Message-State: AOJu0YzYzoCfbUptSyL7+j/nsvyEO4qn4eqNPr4CG8GwMfxZIIXi+QI4
	q9rfCWQFaf3NiFzg6+AudmLL+N6p9Gtww/rDXR7ph69oTpfuuz1GK3Q/iF9IDIqjYre1L/KuLdy
	xAnqHCtu9DaGHi2XMMCtI9zhWbC8=
X-Google-Smtp-Source: AGHT+IHTPWO3qrBxFLleYIS9aXKaowsOr2ye/EF42lzkYU03p/nLlI3YPc9cfmiPKBSlk46Nzl5nN9xM8r5eTCBaNwE=
X-Received: by 2002:a05:6871:259b:b0:222:8fd3:262 with SMTP id
 yy27-20020a056871259b00b002228fd30262mr496824oab.24.1713483185644; Thu, 18
 Apr 2024 16:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DLauDMx75MsCqqm9LRSOm=mJ0RYcFTC2QFXNAgH04Zfw@mail.gmail.com>
 <7441.1713476278132057062@lists.openembedded.org>
In-Reply-To: <7441.1713476278132057062@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Apr 2024 16:32:39 -0700
Message-ID: <CAMKF1sp6qeka7U4Ocb1vfq5u+x4Fg-3F3vVs7L62QvH5KHfZ7g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 23:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110056

On Thu, Apr 18, 2024 at 2:38=E2=80=AFPM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> Hi Tim, good to know :)
>
> I see this patch has already made it to master-next branch, I can remove =
the PYPI_PACKAGE line in a future patch after I have built it locally to ve=
rify.

master-next is staging many patches and is always in flux and
primarily meant for CI, so please send a v2 of this with the feedback
addressed.

>
> I'm hoping to backport this upgrade to Scarthgap as well so the latest LT=
S is not ~2 years out of date.
>
> I'm sure I will contribute more for the twisted recipe if I find any furt=
her improvements/cleanup. I believe we can split twisted-core into more ind=
ependent packages, but I will take my time with those changes before submit=
ting them so it may take a while.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110055): https://lists.openembedded.org/g/openembedde=
d-devel/message/110055
> Mute This Topic: https://lists.openembedded.org/mt/105594516/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

