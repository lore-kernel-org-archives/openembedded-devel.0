Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F4AC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:48:41 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.38527.1723434519871486941
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gw9I1MxE;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-664ccd158b0so37082837b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723434519; x=1724039319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UMqd+cWj+roOuXejT1klSRTugkGJUHs+avaPLka4y18=;
        b=Gw9I1MxE7mpuyYvp0p7UlB1KWGCX9thYr5e5SJLrnZfe06H5wOD0MFESIG473j2YYP
         jdz4V0GaT+pCbX9LbsBGTrklANuUSSyHwEPIW9YRPvFH+ikvQuJZlPEylehvLAEIbjpT
         tGV3SakJazWfB4lFs+u3GZqp2LPJkV5vF+aCU36onVX7eBfwA37a4LXgKR1fn7DXfOF4
         0/7vZL0dl083FJomkvN8tpAhRBjZttqfQe4LiH/qn+RZob8EdyRgK2P/q5/Db5zEqavA
         7Vk9ecQ8vy+dNlXRUVX1DED0wuAchHm3Fx41by79sf4azoDvQ49wI9a5CGx3Bi1sRZec
         RlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723434519; x=1724039319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMqd+cWj+roOuXejT1klSRTugkGJUHs+avaPLka4y18=;
        b=s26zNU4PJcHCM9Gd3Iq5ccxtgX4RhwJ/rALBZVPLpSxZsgj6DNoAVJAxt6cmo4yeeN
         ObtQ9nvAkkoMiSjPGBmdzaZqtVa+Bw19jnGpNDaRKyEY+vsaxmHDFmGz8z8z8YtX1uiJ
         XebARpx/EmYRJ2N5QHoMgoekyTpBMov3pxoE43+2GGCDGH3VdXqQ4O3UE/VUos26+++C
         u92JX3TQ1AsHu7Z3P05pWX4zUEkaZt8QzEacOBbtQ33TqAXHySuoOc2fgFFEVvKhT4Ic
         MyeUyR4oXn6TfYL0nqbXo/k3xoS3r/5tIdGd52zpmMfEMP2SGIrC+a/rfpO/V4D6i866
         f9iA==
X-Forwarded-Encrypted: i=1; AJvYcCWyta7dHTyWo7z82ty4ySQYAWhlYxC5LrNYiYhbpPyPmOZT8BoHcNk7n4P/UletnZzFcxpzBGUty4Bt/9RIRyZub0K7Fd8QEi7qloeepHA2Ri/BzjmSoTdp+Q==
X-Gm-Message-State: AOJu0YxNheUkoC2r8YEJg3B/EUqlIdUd9zwKVafigIWh4tXVH/n302z/
	WJJBcbet/2TGhBgGg6CCbtCgoka9V1j9Z35zBgXDRaQwNLtRBTEod3gyE+9eDM/R6tnZZYP2QCN
	2FF+4l3XMI0TQW8zRHkg6zCfkWco=
X-Google-Smtp-Source: AGHT+IEFN6ceSFNcVJor0ObMmNjrUiZ46M6ZA4RwzR+6wQx1vpQgao0jdQSAzuzvTMbjdYMyDBK2X4fraV7WfZjoPYs=
X-Received: by 2002:a05:690c:508b:b0:650:9c5e:f6db with SMTP id
 00721157ae682-69ec5e48c9fmr79981537b3.18.1723434518971; Sun, 11 Aug 2024
 20:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
 <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com> <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
 <e1585a38-36cf-4b3e-8ebb-ab669432ee0b@gmail.com>
In-Reply-To: <e1585a38-36cf-4b3e-8ebb-ab669432ee0b@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 11 Aug 2024 20:48:27 -0700
Message-ID: <CANx9H-BtPB4RwF1RZB4mc_oV0wzRnicM3TYCw0cvtCGMBzfY=g@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: akuster808@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, debrabander@gmail.com, dev@g0hl1n.net, 
	openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="0000000000004c0d71061f745e67"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111765

--0000000000004c0d71061f745e67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2024 at 8:07=E2=80=AFAM Armin Kuster via lists.openembedded=
.org
<akuster808=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On 8/6/24 4:09 PM, Khem Raj wrote:
> > On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via
> > lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >>
> >>
> >>> Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het
> volgende geschreven:
> >>>
> >>> =EF=BB=BF
> >>>
> >>>> On 7/31/24 4:07 AM, Frank de Brabander wrote:
> >>>> I was unaware of this discussion when I created the fix for master.
> >>>> Note that I've silenced the TMPDIR QA message, this still needs a
> >>>> proper fix in master as well.
> >>>>
> >>>> This indeed needs to be fixed in scarthgap as well, since the
> >>>> incompatible versions do break some code. My two cents for the
> available
> >>>> options:
> >>>>
> >>>>   - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
> >>>>   - Update pydantic-core to 2.18.1
> >>>>   - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
> >>>>
> >>>> Would only downgrade if this is the *only* allowed option according =
to
> >>>> the LTS branch policy. Version 2.7.x includes new features compared =
to
> >>>> 2.6.4. Removing these with a downgrade would violate the LTS patch
> policy
> >>>> of not merging "ABI/API breakage".
> >>> We have had this type of situation with a pkg (A) update in master an=
d
> then new lts was branched. We found out other later additional pkgs neede=
d
> to updated to work with pkg (A). pydantic update was in Master before
> scarthgap was branched.
> >>>> Option 2 or 3 are my preferred choices and they fall within the
> >>>> "fixes for bugs" category of the LTS patch policy. Option 2 is the
> smallest
> >>>> change to fix the problem, but option 3 includes some additional
> upstream
> >>>> fixes with the update from 2.7.0 to 2.7.3.
> >>> Master should be failing so if Master gets a revert of pydantic back
> to 2.6.4, then Scarthgap will follow. Is this an option? - Armin
> >> As far as I know master works now, so a revert would make no sense in
> that case.
> > Hi Armin
> >
> > scarthgap is relatively new and I think I would be in favor of making
> > an exception for this one case.
>
> Well since scarthgap got the pydantic update before release, updating
> pydantic-core is reasonable. I see Tim is working on the update and will
> wait for him to request a merge. BR, Armin
>

I nearly took this version, but there were several complications in
applying patches. I opted for cherry-picking as much as possible from
master since that is a more typical pattern. This patch was superseded by:
https://lore.kernel.org/openembedded-devel/eac1c83ac65b72f3469a3f875cd0cf1b=
9a2a5d6d.1723432397.git.tim.orling@konsulko.com/

Given we were in a completely non-functional, broken situation, and 2.18.1
was never merged to master, I opted for taking 2.18.4 and that drove the
upgrade of python3-pydantic itself beyond this version.

Thank you for all the work on this unfortunate situation.

--Tim

>
> >>>>
> >>>> Regards,
> >>>> Frank
> >>
> >>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111736):
> https://lists.openembedded.org/g/openembedded-devel/message/111736
> Mute This Topic: https://lists.openembedded.org/mt/107073841/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004c0d71061f745e67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 10, 2024 at 8:07=E2=80=AF=
AM Armin Kuster via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;akuster808=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/6/24 4:09 PM, Khem Raj wrote:<br>
&gt; On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Op 3 aug 2024 om 18:51 heeft akuster808 &lt;<a href=3D"mailto:=
akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; het vo=
lgende geschreven:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =EF=BB=BF<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 7/31/24 4:07 AM, Frank de Brabander wrote:<br>
&gt;&gt;&gt;&gt; I was unaware of this discussion when I created the fix fo=
r master.<br>
&gt;&gt;&gt;&gt; Note that I&#39;ve silenced the TMPDIR QA message, this st=
ill needs a<br>
&gt;&gt;&gt;&gt; proper fix in master as well.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This indeed needs to be fixed in scarthgap as well, since =
the<br>
&gt;&gt;&gt;&gt; incompatible versions do break some code. My two cents for=
 the available<br>
&gt;&gt;&gt;&gt; options:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- Revert pydantic upgrade (from 2.7.0 back to =
2.6.4)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- Update pydantic-core to 2.18.1<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- Use master (pydantic 2.7.3 and pydantic-core=
 2.18.4)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Would only downgrade if this is the *only* allowed option =
according to<br>
&gt;&gt;&gt;&gt; the LTS branch policy. Version 2.7.x includes new features=
 compared to<br>
&gt;&gt;&gt;&gt; 2.6.4. Removing these with a downgrade would violate the L=
TS patch policy<br>
&gt;&gt;&gt;&gt; of not merging &quot;ABI/API breakage&quot;.<br>
&gt;&gt;&gt; We have had this type of situation with a pkg (A) update in ma=
ster and then new lts was branched. We found out other later additional pkg=
s needed to updated to work with pkg (A). pydantic update was in Master bef=
ore scarthgap was branched.<br>
&gt;&gt;&gt;&gt; Option 2 or 3 are my preferred choices and they fall withi=
n the<br>
&gt;&gt;&gt;&gt; &quot;fixes for bugs&quot; category of the LTS patch polic=
y. Option 2 is the smallest<br>
&gt;&gt;&gt;&gt; change to fix the problem, but option 3 includes some addi=
tional upstream<br>
&gt;&gt;&gt;&gt; fixes with the update from 2.7.0 to 2.7.3.<br>
&gt;&gt;&gt; Master should be failing so if Master gets a revert of pydanti=
c back to 2.6.4, then Scarthgap will follow. Is this an option? - Armin<br>
&gt;&gt; As far as I know master works now, so a revert would make no sense=
 in that case.<br>
&gt; Hi Armin<br>
&gt;<br>
&gt; scarthgap is relatively new and I think I would be in favor of making<=
br>
&gt; an exception for this one case.<br>
<br>
Well since scarthgap got the pydantic update before release, updating <br>
pydantic-core is reasonable. I see Tim is working on the update and will <b=
r>
wait for him to request a merge. BR, Armin<br></blockquote><div><br></div><=
div>I nearly took this version, but there were several complications in app=
lying patches. I opted for cherry-picking as much as possible from</div><di=
v>master since that is a more typical pattern. This patch was superseded=C2=
=A0by:</div><div><a href=3D"https://lore.kernel.org/openembedded-devel/eac1=
c83ac65b72f3469a3f875cd0cf1b9a2a5d6d.1723432397.git.tim.orling@konsulko.com=
/">https://lore.kernel.org/openembedded-devel/eac1c83ac65b72f3469a3f875cd0c=
f1b9a2a5d6d.1723432397.git.tim.orling@konsulko.com/</a></div><div>=C2=A0</d=
iv><div>Given we were in a completely non-functional, broken situation, and=
 2.18.1 was never merged to master, I opted for taking 2.18.4 and that drov=
e the upgrade of python3-pydantic=C2=A0itself beyond this version.</div><di=
v><br></div><div>Thank you for all the work on this unfortunate situation.<=
/div><div><br></div><div>--Tim</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Frank<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111736): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111736" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111736</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107073841/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107073841/924729</a><br>
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

--0000000000004c0d71061f745e67--

