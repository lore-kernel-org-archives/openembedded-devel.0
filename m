Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BCAC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:23:23 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.55168.1711380196649361072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXPYgLuv;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4400078276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711380196; x=1711984996; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXGpzQMPniNmghpsxdby9wvm3iI6VKf9WjapNu9iZHM=;
        b=jXPYgLuvYRmn0n58T2RW+B7SwwSkrBGRryBkaRG0hiKMWCjQd1o6MXwD5FoLH+/DPp
         YNTXEUtOcpNdzu40qzxUYU6LTCTiLs3dDaByJMSne04C4Ad99ZVNBiWrjJn0n0SYSpJE
         BD3doS/HBSujEtiZRSNyr8ozB6zMFcH3uOlt6GIZfJ/OBFngxpxdtfRmIYn1kdCqOXMA
         cPGWp1tDCtoGaDoQIRo8TszzbXXrxeOhCZ9K09q6qUz1R5fdexVtUIpfzBEifhAK8F+T
         s9RTSaEZByIibS7bAwcYdXEoHrTuyVfgMGe1pKmUhrtGS1vjtPOT8TWyKe22r6aFKvVC
         gJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380196; x=1711984996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXGpzQMPniNmghpsxdby9wvm3iI6VKf9WjapNu9iZHM=;
        b=iCaSzi25RF90o2G+YykG1cVQeKDR+Y9Y8S15qKig6/YdaGUgxni6ILIjdASAdM4HSw
         /Nt5gYvPF5vY/lHKAL+Po8fQhX5h0MRbfYT7bvTdZi3kKrdpipaglkM28aLR+jRQeYtD
         dfwgm1ph+upJO5aDMOP6VmWVsH76nmE6HSvn/Qi55pO+iHNBPxD/X22BgD0O4bsTXVYY
         +EAEnq07Z2jgRusHahJX3zep0ARkDBw+ndy8/H0XNU5ffirQtRwTahbZQscQozfw/04V
         x2WOpdZGKK6KTo+Qgd6ZF71OaX43185wKnqXOwKYluJuargqme8GLOrT5j+n5ZfRsMOZ
         dm6w==
X-Gm-Message-State: AOJu0Yz5CDj51kd7ZAPN5O8w6EU2YkOHWzuHBr0U9EuJ5cNUUVXgj1XY
	PxAbj0ie6UwJ1Kdr6Xa9DMvYSjNUrwczjSh26HihAbpHfhXVaBmGwu/8K+smDWCUdU3U6ezef9C
	zSCC3QEArs9lF3HKAmD/2huPbuaQ=
X-Google-Smtp-Source: AGHT+IHsulRMLIy0WiU/neSGefy+0qIUyt0+iKXMJoqcOrX14t+zrZPI2wZ2YAQe/lm0n5qlHYt9yiP4lB6L/gkWEJ8=
X-Received: by 2002:a25:aac6:0:b0:dc7:3166:ad25 with SMTP id
 t64-20020a25aac6000000b00dc73166ad25mr5033054ybi.25.1711380195693; Mon, 25
 Mar 2024 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
 <20240325132603.2477-2-jermain.horsman@nedap.com> <CANx9H-DS7wfF2U5DrfTOM+GrxsufdW2J+VgHioUer03bbho=Uw@mail.gmail.com>
 <VI1PR10MB318284DFD0ECDE612997D104F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB318284DFD0ECDE612997D104F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 25 Mar 2024 08:23:04 -0700
Message-ID: <CANx9H-Ax+KFHkkmEMEUrpp69j_8-=Jwg7WQ2a6wnZiZi_7vh1Q@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH 2/7] icedtea: Update URL for source downloads
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a3dd1406147dc091"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 15:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109592

--000000000000a3dd1406147dc091
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 8:22=E2=80=AFAM Jermain Horsman <jermain.horsman@ne=
dap.com>
wrote:

> > > The old http://icedtea.classpath.org URL does not work anymore,
> > > update this to the http://icedtea.wildebeest.org URL used for other
> > > download sources.
> >
> > http://icedtea.wildebeest.org has some older sources, but not the
> newest.
> >
> > https://icedtea.classpath.org/download/source/ has some newer sources,
> but perhaps the
> > path has changed?
>
> You are correct, it seems the downloads are still updated (or at least
> more up-to-date)
> on icedtea.classpath.org, maybe I should have been more specific in the
> patch in saying
> the sources, at icedtea.wildebeest.org/hg/ specifically, are no longer
> available.
>

Yeah exactly. And I think using wildebeest for both in the recipe is less
confusing.


>
> Sincerely,
>
> Jermain Horsman
>

--000000000000a3dd1406147dc091
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 8:22=E2=80=AF=
AM Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.com">jermain=
.horsman@nedap.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">&gt; &gt; The old <a href=3D"http://icedtea.classpath.org=
" rel=3D"noreferrer" target=3D"_blank">http://icedtea.classpath.org</a> URL=
 does not work anymore,<br>
&gt; &gt; update this to the <a href=3D"http://icedtea.wildebeest.org" rel=
=3D"noreferrer" target=3D"_blank">http://icedtea.wildebeest.org</a> URL use=
d for other<br>
&gt; &gt; download sources.<br>
&gt; <br>
&gt; <a href=3D"http://icedtea.wildebeest.org" rel=3D"noreferrer" target=3D=
"_blank">http://icedtea.wildebeest.org</a> has some older sources, but not =
the newest.<br>
&gt; <br>
&gt; <a href=3D"https://icedtea.classpath.org/download/source/" rel=3D"nore=
ferrer" target=3D"_blank">https://icedtea.classpath.org/download/source/</a=
> has some newer sources, but perhaps the<br>
&gt; path has changed?<br>
<br>
You are correct, it seems the downloads are still updated (or at least more=
 up-to-date)<br>
on <a href=3D"http://icedtea.classpath.org" rel=3D"noreferrer" target=3D"_b=
lank">icedtea.classpath.org</a>, maybe I should have been more specific in =
the patch in saying<br>
the sources, at <a href=3D"http://icedtea.wildebeest.org/hg/" rel=3D"norefe=
rrer" target=3D"_blank">icedtea.wildebeest.org/hg/</a> specifically, are no=
 longer available.<br></blockquote><div><br></div><div>Yeah exactly. And I =
think using wildebeest for both in the recipe is less confusing.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Sincerely,<br>
<br>
Jermain Horsman<br>
</blockquote></div></div>

--000000000000a3dd1406147dc091--

