Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D93DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:41:26 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.14777.1739364085848421287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 04:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBL6j+hB;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5fc447b03f2so1703805eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 04:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739364085; x=1739968885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPzmXen5FJDpyz69NG6eRNdKaTw1a/N4Gy5ymZNCXdo=;
        b=LBL6j+hBgFJD53NigitNugG20Mk0RB7G4TTG53ATAEFpKjWBcg5rbVs0osc4ofABVB
         2IsWNEQOnfo8Den9sGyy9NT9pnHMk8ApWmBdPSQHpPa4Z8sDnp/IZWQd4GHYrmFxt+9r
         kcaM3ORiot/JL6t4Sf8ARTQIZa9WDczKHfuIp6lH6ufgChniqtsMRKizLjoVb1yRwzxG
         LXAWfPNO2DmqcIdieshri3fu4ySy2EJtWEQCEaEHe5QKbIuUrk4qZ84HjOSVERjzJLBx
         5V7SIUJk/Onn8o87wMSnKINyC/N08t0cMN/J8bBVnogX/9Cc4d45fC3lGBwnMG5GcnO5
         /xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364085; x=1739968885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPzmXen5FJDpyz69NG6eRNdKaTw1a/N4Gy5ymZNCXdo=;
        b=HJ94pcBJkeT/nRR3sENLMJ4S8BeAUozcbZ9TFildNh0KPRtOVWP/ucGbrpJBg+jNjD
         ZlxQfqifD0Sv5S34ctGuEFdZLCKVZpqmWVFRy4Nfzp/b3ndTd+Sxq/o160FnGQQmxxz8
         A32TLSTyW8jLXIRpX9hIKPlvnlQG21jFxczrSsX08iFpfsQiNvJ6NZWOuY4Yalz6hyz0
         h/UPIJjCy6xwYNxCJXRuw3saLvbzt3311zksCYMFu216sHo5xTs+I8pQCnCQ9fTEyRxv
         Mp5zrnU+J9R6yBXomhvnhvXrFPPQgK2Ve404NpA7a9uK7Msed23cEjtd0bNa8HTCF9lV
         3P6A==
X-Gm-Message-State: AOJu0YwLxkkkDKXejGp5MLviG+q4RYL1isab4SrYBg0jwHdlHxp7X3C+
	fmrZb3EPbcA3QnOsq/uy+Z9p0HmVO+ZgXwWflyzLrcO17kS5rIBQrH412Dk+lBEKP2gCqBniymw
	4vIvya8sIxciMGPf50WWbpH0wElUjX/Y3
X-Gm-Gg: ASbGncueptkwQcEIo4+lbsfsV2XU55NLtA9OF9Y7fwDXE4x2ph4YBBC+XyJzJEL6j4c
	B+1AO1mtKSan2eKLs7SZEhOmflUoq1LldK1JMmqtifG4osu3MC0rwcwQgW8+HTyAdWDjz/eEult
	zkQKRvOkG2KFRESOp8bcOV7CfuIO4e8w==
X-Google-Smtp-Source: AGHT+IFqTqJlJIl2yYz5v+Azy1IdGPukvYvLmdiSYQxEGJxRgzYW0RYbS5R/arSHUrd/Qr4JnUwSoZSMxuyCMpwgowo=
X-Received: by 2002:a05:6870:c69a:b0:29e:40f8:ad9b with SMTP id
 586e51a60fabf-2b8d64d506dmr1851594fac.14.1739364084824; Wed, 12 Feb 2025
 04:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20250210132923.933209-1-ravi@prevas.dk> <CAMKF1soPmxVfZRLkMjWmMfv-FM=PqkDsdCnWHYDcPnXZRvKHXg@mail.gmail.com>
 <87cyfnr2ym.fsf@prevas.dk>
In-Reply-To: <87cyfnr2ym.fsf@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2025 04:41:14 -0800
X-Gm-Features: AWEUYZmcAhkIiVqOjgJNwm_yTRo65J0em44J6NJnwbRsdD1OnKcgj-xOpjtOTqg
Message-ID: <CAMKF1soMKH-4EEWQtypQouEwg1LxB+77Db7vq3km_nBK_AzwYA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] systemd-netlogd: new recipe
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069416c062df1427e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 12:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115443

--00000000000069416c062df1427e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 12:18=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> =
wrote:

> On Mon, Feb 10 2025, Khem Raj <raj.khem@gmail.com> wrote:
>
> > Thanks for your contribution, since this recipe depends on systemd, it
> > would make it specific to that being in distro features so it can be
> > safely ignored on
> > non-systemd distros.
> >
>
> IIUC, you're asking me to add
>
> REQUIRED_DISTRO_FEATURES =3D "systemd"


Yes precisely

>
>
> to the recipe? Yes, that makes sense.
>
> Rasmus
>
>

--00000000000069416c062df1427e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at 12:18=E2=80=AFA=
M Rasmus Villemoes &lt;<a href=3D"mailto:ravi@prevas.dk">ravi@prevas.dk</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">On Mon, Feb 10 2025, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:<br>
<br>
&gt; Thanks for your contribution, since this recipe depends on systemd, it=
<br>
&gt; would make it specific to that being in distro features so it can be<b=
r>
&gt; safely ignored on<br>
&gt; non-systemd distros.<br>
&gt;<br>
<br>
IIUC, you&#39;re asking me to add<br>
<br>
REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">Yes precisely=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
<br>
to the recipe? Yes, that makes sense.<br>
<br>
Rasmus<br>
<br>
</blockquote></div></div>

--00000000000069416c062df1427e--

