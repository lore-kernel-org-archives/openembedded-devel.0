Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E789D4A5EB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 05:22:18 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29785.1768800135714407108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 21:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqVE4w3W;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c93313721so2238458b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 21:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768800135; cv=none;
        d=google.com; s=arc-20240605;
        b=iYSF6mJbSY9gUxf1X6H2mnPnpF3Xfbz4h442ATUXJVJKhelK2SqfmLENFQeQMCokBh
         Q2LUx/DwTgc4Fa86yehOhFQ9TRD9MgdexL4cTwP4fKrIGKATqawmz5nid/RlpqyZAuhC
         TuCpD8Acgy8xlhL9JlUMAwpLBwdEKw2D/Gg+WfFkYgQ5cRX0IEo/0iGQgOkgqjUfmJPU
         93uZadr2B/etOGmDWkl4NgE9yxk4bsOWve9hQeopPeCb8THVO9W4tSuyK0bZjLkUwKGH
         ha9YIFJSCrVoy1PNVrGb/+k4ianeIHiTV3zknmkoTujoUMe6f6GXhNe//q1GRor2NFsP
         wryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=twghLb/DJ4UNaNaf/6j5fmNOqK3AZFxbu7yKNg2NbQM=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=EsTitJ/1XxUnsgLIclNKM3CXarjgdAlN0ChU1zvu7Ux819/5db492E+UlyKNKwyibW
         jpmRudxejMbgr26ifNLbTzTF3DcMrcoddsvtz2O+Fxssh9oO384G1XzLpdVPV/+I0bpv
         f5oTIuKrJrhsP0c783WS2cXVx4L7Y2GxZPHWIGge/1MfeyUtTizZLqRlDsO+nlTvuamD
         L1iwVFD3/1TzUrnOWnc7cMU6pHk/p7DQTgNH6sR7VqGI7XD7Ik3bvdR25KT177Cm3kuB
         TCIItuzroJ6TJu9yGq112uRVlvp54v7aeI8VgDX/UuSeptt7CZAoae23Efa2xuVck/2c
         suIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768800135; x=1769404935; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twghLb/DJ4UNaNaf/6j5fmNOqK3AZFxbu7yKNg2NbQM=;
        b=QqVE4w3WvVY8QhggkN6R2CeSHnEYLGJ1LMSQKnwe7R26f/S7td3hqR6fIGPCmaMr1f
         TmgRvalAr3nxfDBvd+T6eV0c2/7fO99XzvQ1ElNOkALB1gMNfPre9di5uQrI5/wVtjrH
         owesmHcn2DPfS/90nBWNLvHulqlVQkcTsNnA8ioSw2DPyxhzqgeq3s4k6SGjxwP6LATQ
         2R92f2wiuz2kJGk1QdEhbu39Z0F1oQVizGv0uXzOmMn9oJzyT5HDQJ6ARMOdkvzfHHx2
         aSBB8zUEjrj4cvkz17ucTi+k+J56OwP0q7z7cRl+gK9OQIMki4u4DUAMRu9qJeMBqSe4
         WBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768800135; x=1769404935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twghLb/DJ4UNaNaf/6j5fmNOqK3AZFxbu7yKNg2NbQM=;
        b=ARhKHI+yiw8/G8tBq26HVWsfp3IsMgRyu8UWstmmGsuMdkfj2YtdLhmG7rPYchK4kn
         hpXz7h6es1qZXEpHLMW1ia75ELvRqHfpizLCQqTxZOhuhC8naCjiL9Cimjrv/sVxunj8
         hX2C2AiBa09wdzm7dhJIo+UBhAJ6su0Dl7JtltlUFLQ7vBgJDqYo+KHSyJ3kO1l4PLk8
         792LhzrcYMQslSJGZ7ys/v8pvDe0opVnJCknmOHv7tKuJUiKGgYD0VTeXWHCPCpZ57+P
         meiEu6ULXJndVR2c8yfwz7pa5tO5OuNq/Y/ma2ILO9IjZH1v3Bb9mWJF6xor3vcTlNSN
         cEQg==
X-Gm-Message-State: AOJu0YyG5FdF6naAWLMzwPXweaQuBJoH+4FjRh2Ut/Ce3UQZyW3Bhf3s
	TdoHYdI/ofhd2EREWrTLwramxmMxckyOpFm64otfWaqvIg1IRpz8pgGaYh5pJ6sS47rFVmo7omg
	RSTosbCxcSC29zf0vmQeR8grDb4aoS18=
X-Gm-Gg: AY/fxX5eCxJ8k6foVNzwice2dIA+fOX4kSsA0j2XKJNGNHMwZfUkrwCfxYv+AphTRlF
	zE0mkPWhD16ge0c7cSgsvxX2c67zsT8njj5mI/bLwEo4ASvjwAYwiZaum5RQuo88l34JajGYimW
	4NoYxj8rcAVrssNSADHSe1NmWnaUOMXXfxdRSv8hBTvDguLmsMo2ItMLXGRnXzQjc/mG8m1016O
	HB/1mVpaerjB2eCh5whg4ZaNji7IbaNe3H54MuvS7CIYFyqqFKS5y9f+aS+1BX3TLPxkUjK
X-Received: by 2002:a05:6808:4fe2:b0:45c:944a:6ea3 with SMTP id
 5614622812f47-45c9bf6eb99mr4619774b6e.23.1768800134868; Sun, 18 Jan 2026
 21:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
 <20260114130100.1016416-17-ankur.tyagi85@gmail.com> <CA+s=J=zLE43Ox920AVAeStZTQuJ6nL=Un6HCpb9g0eZiDUG-UQ@mail.gmail.com>
In-Reply-To: <CA+s=J=zLE43Ox920AVAeStZTQuJ6nL=Un6HCpb9g0eZiDUG-UQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 19 Jan 2026 18:22:03 +1300
X-Gm-Features: AZwV_QgOU_uz-bpZ5GCa1rv5G_JH8_5uoxNYrcxmcZsvHgPRHfQ0futbYF1AvJU
Message-ID: <CADySD0F8qVgnTOGJxmeCZ77t=k4abqCHGLAxEy=J6TtEcofwEw@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 17/20] python3-virtualenv:
 upgrade 20.25.3 -> 20.25.3
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 05:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123584

On Mon, Jan 19, 2026 at 4:12=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> Commit message says 20.25.3 -> 20.25.3 .. Please send v2. The
> virtualenv patches in this series after this also fail to apply.

Hi Anuj,

Realized that mistake and v2 is already sent
https://lists.openembedded.org/g/openembedded-devel/message/123477

regards
Ankur

> Thanks,
>
> Anuj
>
> On Wed, Jan 14, 2026 at 9:02=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-3-2024-04-17
> > https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-2-2024-04-16
> > https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-1-2024-02-21
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...hon3-virtualenv_20.25.0.bb =3D> python3-virtualenv_20.25.3.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0=
.bb =3D> python3-virtualenv_20.25.3.bb} (85%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.=
25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
> > similarity index 85%
> > rename from meta-python/recipes-devtools/python/python3-virtualenv_20.2=
5.0.bb
> > rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.=
3.bb
> > index 1858fee25a..fee5250c4d 100644
> > --- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
> > @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/pypa/virtualenv"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ce089158cf60a8ab6abb452b64=
05538"
> >
> > -SRC_URI[sha256sum] =3D "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b8695=
9257378aef020e1f1b"
> > +SRC_URI[sha256sum] =3D "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9f=
acf3a3bcfc703f45be"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> >  inherit pypi python_hatchling
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123470): https://lists.openembedded.org/g/openembed=
ded-devel/message/123470
> > Mute This Topic: https://lists.openembedded.org/mt/117260247/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

