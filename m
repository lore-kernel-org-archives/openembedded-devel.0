Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2678C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 18:08:00 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.321.1714759671517558899
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 11:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXs8HUkk;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61804067da0so90501137b3.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714759671; x=1715364471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AWQZDxXbojO/0WJB4MSyuaoNZUbn9O1zHQkgDVXFUIg=;
        b=KXs8HUkkuKrIu1BDpOwXclmtzwt2gI6v82HyYYYcjExkKW41srhOsySag0hmn9ACfi
         cp9WDbahdRj5bEE72sKNoLG1rjMmmWE0ltPJihJjNth0k+IoE6upWoC32AQVz9JYdoKj
         Rn1ufGbdtu9/gyEaKW9JMpnQJg/JhwIOif9L46dda6SLOtl8wzXIxygdPUqG6c4Ib0Aa
         IDxYiRUTGRaCLZV3Zq4aAiL6zTYBJOnygxOZLJzSyzkd76UHzytu2SQgPvHNs0ZZqk/u
         8BOn+yOINqVVnxgn2SlauUm7xG7fLMMUHuqHVBAwls6h0gXYnIh7FyjLRwU2yR+QEOSr
         J3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714759671; x=1715364471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWQZDxXbojO/0WJB4MSyuaoNZUbn9O1zHQkgDVXFUIg=;
        b=w/IRBrimciK+ViKxORKkVHk2KLL5MPsJIxJpFLjavqH32UsnYnM5lxXMdvOuEiB6RD
         5i3bmrFUX4HGo/DvozZVno/on+YTK8HbsM/67xT0B/HbrD3KPO/T+w6bJRtKN0IO+jXm
         M+4Vl2vAG5jw4g5IOEEr3Kh0VVpYiik7XCOvKFJuO2EvLJqRqTA3CuWJq14w3ZPDPccd
         du1ZfCcFrwo8Foaj3xTBD9sIx6PYI6+KbONytCXulYuTaYSHa+Po5QoKR3vDHamdlaBw
         lSBZgGFxAeErx4wcxKb1Z3QH42f4gfMTz2/3Cs4Qv6SuLGvt1cy8LDt20ECmA4WUavFo
         Vp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTGs6+coE9tTOJDr+mIMxREpyQI090GHvAG2m3NGqDJel8WGnmyQS71CYn7GA34YeQnDiwsRBM8/eqRg4tXFBP0QT2O9iZ/ezLmF5rTlovo58W4SEo3SZEvw==
X-Gm-Message-State: AOJu0YyEGQIP2R4FmblExy5z0223G3RnQ7+JHFSKLnUbfkMfIHpGsr3b
	k2451HXgLODVl/xMM48PwtCM5QjxcqT5ruAcV43fdKD/itZTtv7mJqHpjqaw8AXp8f0UlCO3Q3X
	HgLEqonlvDIQE2zQizg83sKBLOqg=
X-Google-Smtp-Source: AGHT+IEfPsoziu79toJ01C2BscsvzkG6kGbnt/NHSTSez2bnIGiJGeJiI2vG1cxHp8E9DyExNsFav166vnAhadPMx44=
X-Received: by 2002:a05:690c:f82:b0:609:ff6d:cb87 with SMTP id
 df2-20020a05690c0f8200b00609ff6dcb87mr3879743ywb.50.1714759670650; Fri, 03
 May 2024 11:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5At5T2kyhSLQCGyQPq9xQ986CEOr=TZaqgQ-RwBP2QH0A@mail.gmail.com>
In-Reply-To: <CAOMZO5At5T2kyhSLQCGyQPq9xQ986CEOr=TZaqgQ-RwBP2QH0A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 3 May 2024 11:07:39 -0700
Message-ID: <CANx9H-B6GWPHV0gA2-5JRXoBHWLnKkuv7+aZD9yuC5fGUmRfYQ@mail.gmail.com>
Subject: Re: [oe] libeigen: Backport license fix to kirkstone
To: festevam@gmail.com
Cc: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>, 
	"akash.hadke27@gmail.com" <akash.hadke27@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000b5f72061790998e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 18:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110250

--0000000000000b5f72061790998e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:03=E2=80=AFAM Fabio Estevam via lists.openembedde=
d.org
<festevam=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Khem,


Khem is not the kirkstone branch maintainer. Armin (cc=E2=80=99d) is.


>
> Can dff417630f26 ("libeigen: Update GPL-3.0-only to GPL-2.0-only") be
> backported to kirkstone?
>
> Akash sent a kirkstone backport sometime ago:
> https://lists.openembedded.org/g/openembedded-devel/message/105451
>
> Thanks,
>
> Fabio Estevam
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110249):
> https://lists.openembedded.org/g/openembedded-devel/message/110249
> Mute This Topic: https://lists.openembedded.org/mt/105893530/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000b5f72061790998e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 3, 2024 at 11:03=E2=80=AFAM Fabio Estevam via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;fes=
tevam=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hi Khem,</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">Khem is not the kirkston=
e branch maintainer. Armin (cc=E2=80=99d) is.</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Can dff417630f26 (&quot;libeigen: Update GPL-3.0-only to GPL-2.0-only&quot;=
) be<br>
backported to kirkstone?<br>
<br>
Akash sent a kirkstone backport sometime ago:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/1054=
51" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-devel/message/105451</a><br>
<br>
Thanks,<br>
<br>
Fabio Estevam<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110249): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110249" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110249</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105893530/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105893530/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000b5f72061790998e--

