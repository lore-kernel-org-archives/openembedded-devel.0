Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFC3C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 12:44:46 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.10574.1715085883287098548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 05:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ZNCWaFhX;
 spf=pass (domain: smile.fr, ip: 209.85.218.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59cc765c29so516136966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715085881; x=1715690681; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mveUOVlquk+awnfDrV6KGXIXPPMahwXc1aCCM8VtLJk=;
        b=ZNCWaFhXnEZhh9IIXJhFJCrW7Ye0kgqGmRnyE7uJeC1w69aUREu9YMtXTjWvktxmGf
         25SyPdqLdDGpgjS918yjU3Qfs/9oHLxqgilBNmMQnVzkdFKaluCnZuLU58UIgLXluPrQ
         cNsYN2R2ANu9LCXDq/c85Wo4JIjEYFCb0wKn2551ktOubikj6jnSUAq9W0SEO6pY+GTP
         vgSNFloTxO4b44EsvtYMvZkSz4URJP9LwTIz42YOUFgV85AbNfDFcovPTwIZVEv9A1f+
         6t9B8+apIMYZ/7m6ppRp5E6lTgM0AXXlhiZcgLZbuEkZcY8hwmd0yi88Sm3+KlYCQ9Bc
         f+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715085881; x=1715690681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mveUOVlquk+awnfDrV6KGXIXPPMahwXc1aCCM8VtLJk=;
        b=F2PcUCWJrPVslr5TOfrS27WBShf6iOexpF4XzXrQRS//XDeNxQVIbJp3Wuf+9P8y28
         98f+Y+YBJPZg9Nnf8BkDAe4cwGuWQKX3ce1A5cTUfhrRpwnlm/KaEJzS4A7cvnXG6jEP
         u1Rh/KL0928NjYgq+rucolcfQ0E6LDzfotsWoMZv6D4Q/w1VfzPFhRnXv9S9g0FYLllu
         v0mBuwmTYNsL7vWPWPsp6kNzSc4ZaaD4etpKqaD3OkCg9PdAXV9y4ltlyfzd8DkQJTW7
         rLciSlSVgDNGCJZiISxuwq628HEVktTS5VFvfrKivrLi1dNzS2PYQyEYwvbfanmwrWmf
         76QA==
X-Forwarded-Encrypted: i=1; AJvYcCUFjKl1dGvtX1vlMHUPUhI1hux6TS93d4wvte2a0znAQdp+oQGueFapZ8FNtCD0GutSudehKN2uuTaMUh0hw+ssJzVk2A7wZcSnHbXOl4zDzG0y0FSQZdJuCQ==
X-Gm-Message-State: AOJu0YxSVAgVe1TWgiVWKlkhTxfz2hntT5qXGvegoRStoyaHBHuSAUAQ
	FdXJ0bFBAAgB8UvZVMCD0+QliF5/Zz9ls/jctAC2CzY5DgVd+oMBoPpZN6pv9o94b8BP/qBvST0
	RR4mDKNkOdkfYg4FCEe3MKPApP19YKbbQ+aMkNg==
X-Google-Smtp-Source: AGHT+IHRUbD05uBUur3qqL13YJi0HUSnhuhcZWd4LKIphh4R4KfWaOxy1C3DFO9Gr5h02IC17CsikNQ8UtD4OjDrREw=
X-Received: by 2002:a17:907:944f:b0:a59:cbb5:e09e with SMTP id
 dl15-20020a170907944f00b00a59cbb5e09emr5046760ejc.58.1715085881290; Tue, 07
 May 2024 05:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <17CB013F8E1A4961.26557@lists.openembedded.org>
 <A4ETCS.BYOOAI4M6HFR1@t-online.de> <CAMKF1spRQiNy9MQ1CLXJpifBHW_7Ctk1Z9-zO_W9tevm0qNZcQ@mail.gmail.com>
 <HWHTCS.LLXBF0M5JJGS1@t-online.de>
In-Reply-To: <HWHTCS.LLXBF0M5JJGS1@t-online.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 7 May 2024 14:44:14 +0200
Message-ID: <CAMSfU+6uwFOeQvfeSyXy_Tmw4GE9jS-ASF9fMYn=ExSib==cdA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
To: f_l_k@t-online.de
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6ce500617dc8c6c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 12:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110268

--000000000000b6ce500617dc8c6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

For your information, the missing nautilus -> glib/gio-2.79 breaks the
non-reproducibility test of meta-oe :
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/23/steps=
/16/logs/stdio
(line 18697)
That is not critical since this build is broken elsewhere (that's a work in
progress)

Regards,

Le mer. 1 mai 2024 =C3=A0 19:29, Markus Volk via lists.openembedded.org <f_=
l_k=3D
t-online.de@lists.openembedded.org> a =C3=A9crit :

> On Wed, May 1 2024 at 10:08:05 AM -07:00:00, Khem Raj <raj.khem@gmail.com=
>
> wrote:
>
> yes, there are a bunch of other 46.1 gnome recipe updates as well, are
> they interdependent in some ways that we will need to revert them too.
>
>
> As far as I can see its only nautilus that will require glib-2.80. The
> other ones should be fine.
>
> But I'm not sure about the changes that are needed in networkmanager for
> glib-2.80. I haven't gotten around to checking if they would work with
> glib-2.78.
>
> Another problem I have is with hyprland and the chore update.
> Hyprland is still broken with sdbus-c++ 2.0, but I guess a fix for this
> can be backported , once the issue was adressed
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110209):
> https://lists.openembedded.org/g/openembedded-devel/message/110209
> Mute This Topic: https://lists.openembedded.org/mt/105817245/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000b6ce500617dc8c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div>For your information=
, the missing nautilus -&gt; glib/gio-2.79 breaks the non-reproducibility t=
est of meta-oe :</div><div><a href=3D"https://autobuilder.yoctoproject.org/=
typhoon/#/builders/155/builds/23/steps/16/logs/stdio">https://autobuilder.y=
octoproject.org/typhoon/#/builders/155/builds/23/steps/16/logs/stdio</a> (l=
ine 18697)<br></div><div>That is not critical since this build is broken el=
sewhere (that&#39;s a work in progress)</div><div><br></div><div>Regards,<b=
r></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le=C2=A0mer. 1 mai 2024 =C3=A0=C2=A019:29, Markus Volk via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=
=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.=
openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div id=3D"m_3243612638818060145geary-body" di=
r=3D"auto">On Wed, May 1 2024 at 10:08:05 AM -07:00:00, Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-space=
s">yes, there are a bunch of other 46.1 gnome recipe updates as well, are
they interdependent in some ways that we will need to revert them too.</div=
></blockquote><div><br></div><div>As far as I can see its only nautilus tha=
t will require glib-2.80. The other ones should be fine.</div><div><br></di=
v><div><div>But I&#39;m not sure about the changes that are needed in netwo=
rkmanager for glib-2.80. I haven&#39;t gotten around to checking if they wo=
uld work with glib-2.78.</div><div><br></div><div>Another problem I have is=
 with hyprland and the chore update.</div><div>Hyprland is still broken wit=
h sdbus-c++ 2.0, but I guess a fix for this can be backported , once the is=
sue was adressed</div></div><div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110209): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110209" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110209</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105817245/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105817245/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000b6ce500617dc8c6c--

