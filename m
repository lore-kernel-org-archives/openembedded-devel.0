Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D94C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 10:28:49 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.133442.1712658528532455198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 03:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HRwCsQIq;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-47a0f54fb13so529320137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 03:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712658527; x=1713263327; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W7erMjpYG3CcLw5DM/gIAoRVx6bKDLBU78BCFZ28OR8=;
        b=HRwCsQIqAYpJT+qaeIySL9wBsG+o3SUtqpHhuw+tl8pIIJe4IIsbgpggwSz5eUhvHk
         4RJhjQoqm6TE3wdCZKN66jkxpaPAEnoruTznpgZV8Fmu7qzzCgMcbnoUBgPQnmBstn0e
         JSweOCo1etQRLI+R9Vq32aWOOUNdcI+AqYt/rpc6BZS4Mc6rEpNySAKJkZiyCctw5zJx
         c57kaGX4bON4lEH7h/5F3Igo5XL1CvOCn0Dly+9XmZJj6HrhDCyDYeSaLD+L/EIZJ1Bp
         LhslycSAs3Ya4WYYEpANe3r6TzITBgZt5ktZHNwfvyzGWirTSfGoKEFRWNPtxoUeQaVM
         RixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658527; x=1713263327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7erMjpYG3CcLw5DM/gIAoRVx6bKDLBU78BCFZ28OR8=;
        b=BB/sa/bdpw/AsMFj3QHJG5kbnSMlMknw1OpYYC6eG5cT6kPlabawF3ZVHrkfLhGT87
         qPoSZqsCDIsD/19XHcU5ZS3c9oxmEVPRo/HNRCDU77qfQBc3P9ZoFjK8bUb2qHST2gll
         FRNVb4hVadL67OS15zQ5piGoi0U1TInVniUZHkN5KqDaGJg78vY2ea/7oqh+++FCMWIG
         lqkLcmas4KFOn4CEFIi1NxDnzyrZbPjxgwa1CjnVez4ImChxBPZepwyxfjsUZjwDuPp1
         1z8fRsVhXYsh8A5xyONAW8gw45I8WSHuauNpRVe3HWGtXMjJYovheT/Y4W2rImTgvHqc
         ABiQ==
X-Gm-Message-State: AOJu0YydcWQlE7DUHlMi9PMqlDhcVs4j0ZDnhe62E2WT0MK9tGEudziG
	ViMt/+ef4JpJNDAR0TmgAWOp2vOVVhCLd4X2ZyfrPwG2NqEYEyrOKlxg3KodaEEPzkUB13UHIwt
	A8z2J5hGkyAJ7/Kvom5queYIntMs=
X-Google-Smtp-Source: AGHT+IEX9UzNOwfrl/4qmXSS1W3QXeWBxE/D8IRiZQzYQAuAOf6yU6lgeuohA1R49CZHfadFfEvxEBFz+JyMy4+Vth4=
X-Received: by 2002:a05:6102:54a6:b0:47a:f93:5fb9 with SMTP id
 bk38-20020a05610254a600b0047a0f935fb9mr3367233vsb.5.1712658527517; Tue, 09
 Apr 2024 03:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240409075444.27196-1-fathi.boudra@linaro.org>
 <CANPvuR==LDTbWyNLAkANhzhmv8CZg3OSbDTxs4De0dKd_m=mjA@mail.gmail.com> <CAGNsrLDn+pyjP9SQA=Pb5ybHtQrkBNphO=mCK5htBV=T1hGs0Q@mail.gmail.com>
In-Reply-To: <CAGNsrLDn+pyjP9SQA=Pb5ybHtQrkBNphO=mCK5htBV=T1hGs0Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Apr 2024 11:28:36 +0100
Message-ID: <CANPvuRmVFx5h17D7USiE3UR8=HEELORxvZ9UTao4Y4hof38VOg@mail.gmail.com>
Subject: Re: [PATCH] [oe][meta-filesystem][PATCH v2] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002783000615a7631b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 10:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109879

--0000000000002783000615a7631b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fathi Boudra <fathi.boudra@linaro.org> escreveu (ter=C3=A7a, 9/04/2024 =C3=
=A0(s)
11:09):

> Hi Jos=C3=A9,
>
> On Tue, 9 Apr 2024 at 12:00, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > Hi Fathi,
> >
> > Maybe just the #include <libgen.h> can do the job.
> >
> > It includes the posix implementation of the basename
> > https://man7.org/linux/man-pages/man0/libgen.h.0p.html
> >
> > Added the same comment on the github PR.
> >
> > Jose
>
>  I tried it initially. It looks like we need to use the gnu
> implementation in this case, not the posix one (including libgen.h
> won't be enough). Hence, I ended to propose the approach used in kmod.
>

Ok, understand.
My suggestion was mainly because I saw several patches on the Khem branch.
Thanks for the clarification.


> Though, as many projects are affected and we can find several patches
> floating around to fix the musl basename function changes, I wonder if
> we should go down the road to include a stub in musl. I think that's
> what alpine proposed at some point.
>

Seems like a good plan but I didn't find references about this problem on
the musl mailing list.

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002783000615a7631b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Fathi Boudra &lt;<a href=3D"mailto:fa=
thi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; escreveu (ter=C3=A7a=
, 9/04/2024 =C3=A0(s) 11:09):<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Jos=C3=A9,<br>
<br>
On Tue, 9 Apr 2024 at 12:00, Jose Quaresma &lt;<a href=3D"mailto:quaresma.j=
ose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt; Hi Fathi,<br>
&gt;<br>
&gt; Maybe just the #include &lt;libgen.h&gt; can do the job.<br>
&gt;<br>
&gt; It includes the posix implementation of the basename<br>
&gt; <a href=3D"https://man7.org/linux/man-pages/man0/libgen.h.0p.html" rel=
=3D"noreferrer" target=3D"_blank">https://man7.org/linux/man-pages/man0/lib=
gen.h.0p.html</a><br>
&gt;<br>
&gt; Added the same comment on the github PR.<br>
&gt;<br>
&gt; Jose<br>
<br>
=C2=A0I tried it initially. It looks like we need to use the gnu<br>
implementation in this case, not the posix one (including libgen.h<br>
won&#39;t be enough). Hence, I ended to propose the approach used in kmod.<=
br></blockquote><div><br></div><div>Ok, understand.</div><div>My suggestion=
 was mainly because I saw several patches on the Khem branch.<br></div><div=
>Thanks for the clarification.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Though, as many projects are affected and we can find several patches<br>
floating around to fix the musl basename function changes, I wonder if<br>
we should go down the road to include a stub in musl. I think that&#39;s<br=
>
what alpine proposed at some point.<br></blockquote><div><br></div><div>See=
ms like a good plan but I didn&#39;t find references about this problem on =
the musl mailing list.</div></div><div><br></div><span class=3D"gmail_signa=
ture_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div=
>

--0000000000002783000615a7631b--

