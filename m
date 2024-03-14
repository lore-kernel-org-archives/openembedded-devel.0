Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32931C54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 00:54:12 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.517.1710377645284645164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 17:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsWMuQl8;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2222c0462a9so328843fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710377644; x=1710982444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=902O8dalLDqFnjiscSvncp80UyZszIFJIINd0sGcrps=;
        b=VsWMuQl8fqJg/OkiYVcrIXyqZZyncoEHkoNbYootkaIQQvs26HjqyQxWQtHda17aei
         mpuhhBgHPWHgzzdRsRK1mdtVZt6pWwPQVfb1s+KMf5vItg2+diCgxru35RzzrQXkAtoH
         R7CbohTY68tTgnlJgxXM40jrTzQVcHq5CpMweRQ5/aHh9Po9aBVtowz4D6QV78rz+G5r
         omNDMBzzmADGNbo+fOMzNut+vfl74V3A0coxdd24ry6mkSoASso7hvYhr8DhPMBn6BBv
         yN09Akq9zNimTlQ/SQ6QKFpEq8ryzkarFuB0JBKGy04v8FyMp6v/qw/TeXD/qwO5BlCw
         U9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710377644; x=1710982444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=902O8dalLDqFnjiscSvncp80UyZszIFJIINd0sGcrps=;
        b=cFCQ46qXmJkV1Ub9A53+KfLQjXeM8UDFpxLJLt5xc6FKahuom0xz2ZfPw2wKlz/8Q4
         8Bu+7NSu8O3FfifWDdtOQoUqF0xUSbzOKxyt6nzRYF3EjOUSEmkoyidnqNF4fYhNBzzw
         wFT/kaMBooP4fdJgE2C8/lAW3zM4fhNDij2DJfd3eO7WWdsMvFG9jdimzEg0g7r1z0//
         KyNK+k/HWQFxdRnvjzqBxpnIc/hkro0rH28bUfNS6CqSRbH+DljkOTI58VdwR/gU0+3N
         yvQFj9tfVIAUsfsZ5DW/N/Bw8loq6eOrSWw3hVA45oyglmqFL4kh7a0Ac1XzELKX0pMK
         cgqw==
X-Forwarded-Encrypted: i=1; AJvYcCUzBLxmkt0G/uUvGoG8SvtRqAopuvtca9HV9cOa9dNTLubSfenX0qGtlIPd7MwCl/tV4nH6W1/Pg29WqjWu7/w0GTLk/gzOSRYGwQqhDQF933BgQ9TB1iPHdA==
X-Gm-Message-State: AOJu0YxswMbwMZawJecRT6C2TlAX/HPcUbKZ27ky3Me4SJZrX5rfp7t6
	omJMnUkTrxrki8SHP9TEMlJOcI7+NHlYE6DjFwB6FeG7nBMNzHKaTJW6dgwnFJ+Zij9PeEFKXKd
	O+tjar13HhASoaCByMP44wVmsQ3o=
X-Google-Smtp-Source: AGHT+IHRKwAigGkner2VXa0dNOhotW0D9Yhafxx7i7hMEf3dxP9ESnB1x0jPazConUtOVOvcAhGcq72fUP9lnWl8+E0=
X-Received: by 2002:a05:6870:910b:b0:221:bcde:29cc with SMTP id
 o11-20020a056870910b00b00221bcde29ccmr485082oae.21.1710377644477; Wed, 13 Mar
 2024 17:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240313045038.90500-1-marex@denx.de> <20240313045038.90500-3-marex@denx.de>
 <CAMKF1soot4YOaXGQeQJ5xnbwN-TApuALfFyDBLGQ6C=axZAfPA@mail.gmail.com> <9351a334-dd37-47d0-bdb4-01e574ba5104@denx.de>
In-Reply-To: <9351a334-dd37-47d0-bdb4-01e574ba5104@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 17:53:53 -0700
Message-ID: <CAMKF1sqMtezd5C4RaEFvPpR2mpBSmj2nobTxZSaFYpxsYgCg0g@mail.gmail.com>
Subject: Re: [PATCH 2/8] lvgl: Upgrade to LVGL 9 series
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ee51af06139453f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 00:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109306

--000000000000ee51af06139453f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 5:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> On 3/13/24 6:00 PM, Khem Raj wrote:
> > Thanks, seeing this QA issue
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3707/st=
eps/14/logs/errors
>
> Ah, sorry. I see a fix from you already too, thank you !
>
> Do you still want a V2 of this series ?


If that=E2=80=99s the only change then no

>
>

--000000000000ee51af06139453f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 13, 2024 at 5:43=E2=80=AFPM Marek Vasut &lt;<a =
href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On 3/13/24 6:00 PM, Khem Raj wrote:<br>
&gt; Thanks, seeing this QA issue<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/3707/steps/14/logs/errors" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3707/steps/14=
/logs/errors</a><br>
<br>
Ah, sorry. I see a fix from you already too, thank you !<br>
<br>
Do you still want a V2 of this series ?</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">If that=E2=80=99s the only change then no=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000ee51af06139453f0--

