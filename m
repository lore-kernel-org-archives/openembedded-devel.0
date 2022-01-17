Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16915C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 17:35:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.459.1642440899649432599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ohjoXcJJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso25458480wmj.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wPYQ2YBNoFrmDdnJOoprl14VuRLrlk+/er3S4cWl9TU=;
        b=ohjoXcJJz9tsUcMO4nqe8kDGLwQHpJdwrnV6dZEaIuh+k3J/qaiJV0J16UjK3W4EvJ
         ivrqfQiyZHVtpX0ZdT4BgV7dOStnYNhkCjohoUtjxWjvo+W40HnR8JDVD+u4OJ37CI5O
         SQIqS1vLnneqdXVnrW672h9iOZLa2BHmcPVNFSLhxnmP7RqG4iq2/qRS/aEzTqThexGI
         Rs4A7V6uli7l1MXOEfz34zLzKVXl+Y6M5PZwptt/2Sj1r0dOYVOrjX+8l84yJH09AUEN
         G7zBUBuIOdNZSv3o7fqAquXOCBdLw9sO/T3tq/5JGQf1nN+4pAHYid48738VDGQ1r011
         FLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPYQ2YBNoFrmDdnJOoprl14VuRLrlk+/er3S4cWl9TU=;
        b=TTp0/FW/kQ69eyLvk5r8Ot+PN/fyQmEi/h3DC3WErYVgPwj3tFvhGA/YPHutoT4lrq
         KR7qklNBS1ob/A8PlnBl6AVOTR1QcIQlYAhzruZJelWya7CNql0bkYD9RL3HS+EpyQZ1
         hM2EIJRTHIsuAsj9XpmovA6tQUn+Sz0DC7tO0EtHJaywXFXwKzHICQJAqlVsrXQpZvRe
         AiYriZW9vShJlHICVrrm412W9uQSwa220kUJjEScEe4h4AKw/s7xXqOK7OcbtcHkhL+9
         pF24L8K5DFP4RbP0f9Nq9UsgTr7QqoCrmjm0VmzkXMrXapSwINROPhUTnXt5+UKyZsKs
         Rvbw==
X-Gm-Message-State: AOAM533r1nvB5/3F92Yi9HVC1lgyTFmrwB/Vc/H9blxZw523kWino1r4
	Fp44S5FYpGVEn3jDJLoT9IDg0ZdMWbfqSKmzc8rtaWwE
X-Google-Smtp-Source: 
 ABdhPJyBspd65R9mnzQWECIS5MpdOegmBBuRvvsga9e3e5sphUp9f3Er6+gcNYCrdIQVsSi5CwS4aq+o9UxKGTCnwOw=
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr19855520wro.35.1642440898118;
 Mon, 17 Jan 2022 09:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20220111224714.1289840-1-marex@denx.de>
 <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
 <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
 <d2d5d5dc-c1db-700d-470c-42126bc394dc@gmail.com>
 <5e27977c-15aa-42ca-463a-744d1b36d306@denx.de>
 <47b66e62-0682-38c7-6c03-a53427fdf4d9@gmail.com>
 <e8bb6f21-5d2f-635f-ed8a-7977e4a32656@denx.de>
In-Reply-To: <e8bb6f21-5d2f-635f-ed8a-7977e4a32656@denx.de>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 17 Jan 2022 18:34:46 +0100
Message-ID: 
 <CAApg2=QC-VnA3brVeOya4Yps+PLthVMQK7sZY8OKAh9WctH7LA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
To: Marek Vasut <marex@denx.de>
Cc: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004c07b605d5ca920b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 17:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94901

--0000000000004c07b605d5ca920b
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 16, 2022 at 7:22 PM Marek Vasut <marex@denx.de> wrote:

> On 1/16/22 19:05, akuster808 wrote:
> >
> >
> > On 1/15/22 7:45 AM, Marek Vasut wrote:
> >> On 1/15/22 14:43, akuster808 wrote:
> >>>
> >>>
> >>> On 1/11/22 8:57 PM, Marek Vasut wrote:
> >>>> On 1/12/22 05:42, akuster808 wrote:
> >>>>>
> >>>>>
> >>>>> On 1/11/22 2:47 PM, Marek Vasut wrote:
> >>>>>> From: Khem Raj <raj.khem@gmail.com>
> >>>>>>
> >>>>>> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
> >>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>
> >>>>> And why should I allow this?
> >>>>
> >>>> This ... what ? The SoB line or the update ?
> >>>
> >>> What is in the update from 2.2.0 to 2.4.1?
> >>
> >> This patch updates freerdp from 2.0.0 to 2.2.0 , not from 2.2.0 to
> >> 2.4.1 , that's a later patch.
> > I still see new features being added in 2.2.0 so the same statements
> > apply.  Until the process changes to allow package updates that include
> > new features and functionality for a LTS branch, I am going to decline
> > taking this patch series.
>
> What about the large amount of CVE fixes and the fact that this is still
> a stable-2.0 branch update, not upgrade to 3.x , as explained below ?
>
>
Marek,
Are you able to backport needed fixes to 2.2.x series? This would be
something
Armin would likely accept.

Kind regards,
Marta

--0000000000004c07b605d5ca920b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 16, 2022 at 7:22 PM Marek=
 Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1/16/22 19:05, =
akuster808 wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 1/15/22 7:45 AM, Marek Vasut wrote:<br>
&gt;&gt; On 1/15/22 14:43, akuster808 wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 1/11/22 8:57 PM, Marek Vasut wrote:<br>
&gt;&gt;&gt;&gt; On 1/12/22 05:42, akuster808 wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 1/11/22 2:47 PM, Marek Vasut wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; (cherry picked from commit f751dcf81a18fe817b40e75=
5a2ba3f54a74d1e02)<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:m=
arex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; And why should I allow this?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This ... what ? The SoB line or the update ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What is in the update from 2.2.0 to 2.4.1?<br>
&gt;&gt;<br>
&gt;&gt; This patch updates freerdp from 2.0.0 to 2.2.0 , not from 2.2.0 to=
<br>
&gt;&gt; 2.4.1 , that&#39;s a later patch.<br>
&gt; I still see new features being added in 2.2.0 so the same statements<b=
r>
&gt; apply.=C2=A0 Until the process changes to allow package updates that i=
nclude<br>
&gt; new features and functionality for a LTS branch, I am going to decline=
<br>
&gt; taking this patch series.<br>
<br>
What about the large amount of CVE fixes and the fact that this is still <b=
r>
a stable-2.0 branch update, not upgrade to 3.x , as explained below ?<br>
<br></blockquote><div><br></div><div>Marek,</div><div>Are you able to backp=
ort needed fixes <span class=3D"ng" style=3D"background:rgba(0,0,0,0) none =
repeat scroll 0% 0%!important">to 2.2.x</span> series? This would be someth=
ing</div><div>Armin would likely accept.</div><div><br></div><div>Kind rega=
rds,</div><div>Marta<br></div></div></div>

--0000000000004c07b605d5ca920b--

