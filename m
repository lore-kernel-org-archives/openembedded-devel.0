Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAC2C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 06:01:50 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.25874.1699164108995688415
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 23:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJ7VDpuf;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1f03fdfcfacso2017955fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699164108; x=1699768908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgZTbwSm3AcmmhQhblsgO7sjGC0mGjikksMJzRKWMOI=;
        b=DJ7VDpufVOIKB4/IgDEpiELyFw9U5xM4sndmFhuNCi5P+HeggtrhMpacdCX/mWm2yh
         FGyslC96ZUj/6a9i2MCvA/bPoD+h/sbqxLHLzLhOmnL/Hhg1kKK55/Q4V3DqXrTigOMJ
         JKPxX3k+8C7imb8PSOuNrf1xmxlN/8P4IOjjkvsUsJiiPVcT0uniII0yzbuqpWp8PXnb
         021QbtX8SHJa5VXErSU4dP/DKRyRimFIEIuK8vtn/CkVpjhEtPPjjoTzxxuD54MeT6U0
         lpuSYPNiVTXq+pIG9zvYtabFWxD+GJiElv3OmAdecRfb1eGOS5qg1cXnRT6je5C3/lTu
         zMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699164108; x=1699768908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgZTbwSm3AcmmhQhblsgO7sjGC0mGjikksMJzRKWMOI=;
        b=IfjI5d4a3vYfs/K8/PEALVzBqshggrpPFSnhEJ8mI3P4nFNowHiSfGPZwp9gDZy2YR
         0scZICGb6jQbgLlowV7ZNsofS0IswDb8P/XjpLXSwpgNbWO1VBjknN2lTvz9mRClRNrz
         byL44qZOVKvRH4hwuNGa+3LpTtc1idtp/lwLBfCynqCqPebiFA9vtUjlZu1F8LzkkIgl
         9tRzc58ETIDHQ9baOBpYsUo73NzxtpooJZoL2KDBi63h6ts2jz0H5jD8hM6dNDxdrnPk
         mu+hZ+VA8YZZCIo4sQrUhzvkdqCMLYQAPjPoG6x4/8eKzB0f9v8dqgLfE/uaZZ1a5zZx
         pQ7A==
X-Gm-Message-State: AOJu0YwExk6vH6OCyqpcPKUPAV4urwmo+D6/D0DEU63sYwZSdN7vwnqD
	vFHA8yHXg56N54ldDTWe9MHyy941W5WspJQuYng=
X-Google-Smtp-Source: AGHT+IFBC2vEkhds1t5QPIBmNwp7+8ztAAL0IQr+4eV8Zr0hoN0XAtKD2+dNWqq2gaS0bTjPsg4D3fdsusfUCKTZUW4=
X-Received: by 2002:a05:6870:b48c:b0:1e9:c224:bb91 with SMTP id
 y12-20020a056870b48c00b001e9c224bb91mr32308806oap.38.1699164108172; Sat, 04
 Nov 2023 23:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b96bf15ca-12434bb6-db65-40ee-ac31-50374281f91b-000000@us-west-2.amazonses.com>
 <CAMKF1sr2fMn_3w8EmbQ3CsM2WKekxkJNj4W3iwKspNZvOAZuGg@mail.gmail.com> <8PYM3S.3H6MBNSC87B4@t-online.de>
In-Reply-To: <8PYM3S.3H6MBNSC87B4@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Nov 2023 23:01:37 -0700
Message-ID: <CAMKF1srSayfn6d=BkAo4RaYtDRkx+9T=LHN3JQeVyhzUkYuo8g@mail.gmail.com>
Subject: Re: [oe] [AUH] Upgrade status meta-oe: 2023-11-03
To: Markus Volk <f_l_k@t-online.de>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001533750609617950"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 06:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106380

--0000000000001533750609617950
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 4, 2023 at 10:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> On Sat, Nov 4 2023 at 01:23:48 PM -07:00:00, Khem Raj <raj.khem@gmail.com=
>
> wrote:
>
> Please review any recipe upgrade of interest to you and all feedback is
> welcome.
>
>
> The update of gnome-chess went wrong because there is a bogus tag for 44.=
0
> in their gitlab repository. 44.0 has not been released yet.
>
Ah thanks for noticing that

--0000000000001533750609617950
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Nov 4, 2023 at 10:46=E2=80=AFPM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><div id=3D"m_3367378907555924191geary-body" dir=3D"auto">=
On Sat, Nov 4 2023 at 01:23:48 PM -07:00:00, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
><blockquote type=3D"cite"><div style=3D"white-space:break-spaces">Please r=
eview any
recipe upgrade of interest to you and all feedback is welcome.</div></block=
quote><div><br></div><div>The update of gnome-chess went wrong because ther=
e is a bogus tag for 44.0 in their gitlab repository. 44.0 has not been rel=
eased yet.</div></div></blockquote></div></div><div dir=3D"auto">Ah thanks =
for noticing that</div><div dir=3D"auto"><br></div>

--0000000000001533750609617950--

