Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46801CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 03:56:03 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12648.1781063757471252488
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 20:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Is7m6QSz;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so9081282a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 20:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781063756; cv=none;
        d=google.com; s=arc-20240605;
        b=G4auC2j2YsKYhXhFuQ31ZHsZCnLv/j+R8A+ckUc/Km4lCp2YzvDPxk5IOw4zctQevE
         RORbe7IArl+nmc/0A1UMyIPg+3n4ShALxBKxMDjSw6+LgnHXaKOFSWow+D7BimoXt49i
         Tfn1FoU7B5fHoDo8bp+RqVB5lTYJwXKpaJGubaxNMyOBCsl6fmOkH0G5F1+ynYw0Zukq
         DmJS/U5U+Q0YGa/bkp8Z15J9WfKVbJ7dcFnHiYfB7oRwXzLN/dGlbtvuEhZyk98Cgtyk
         EHWx2j+9ZSTZ3BkUi0JSBjhpf06p3LyuFHd0cfa2ngK/DKi/Oz+Yof0eOpKYjBNnf5UX
         zWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NLUa/AXn6V5bBUpSlyq/Yv+7zR4q4NR1uwX8ZsQpNCM=;
        fh=mXYLdbXkTzIsUXpY2wyWeGWFvGXW0LbqSymLQPIsIJw=;
        b=VtZom9tXI0Y6O968JWUDBF63PzXigmy0FHOeNJkpZnoOPJN8c5ZFPAgT7b21NqM3xu
         QyIEEpTKDRPtS7vMKYOgySbaxwXx9svW1eAb5HRASQruVQ5mIFuSc5nIp4jVuKJSt6/p
         lkKnBJOv2elp8Ybn7Efvk/JszIOdv9fEkZgYgabarFzWgw1JrVhBQpGDF+EDQUHa89hp
         egz/lmdfulVmNDgrv6HFKT4eCrOqa6PRxI3PsWbgX+CPnfE+6MqYStVVGaWRqlZ3GPiY
         rwoT2q7AeWm3MoyUoWuXtrJdQ1DDyG9fcDwfT4NeDS/gta8XnQ8cft40nsDkxXMdp0cx
         vNOw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063756; x=1781668556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NLUa/AXn6V5bBUpSlyq/Yv+7zR4q4NR1uwX8ZsQpNCM=;
        b=Is7m6QSzREq3Fx9sFoSaaJODCyZs8JgJH2pAqR0I0XERsv7nf3pZP5lXHiWVVcTBF7
         GkhZio19otD7a4G0eVGUiyStHUi1UNeMmkWc3X9egjp0WQXJHbZ7CPIeSmROJlTnVGMU
         uCtXo+z5Z7kacMARf/8Z6jItJL/oKZPkmU/dUpY9XxQKBevXMvKJhzoLeVqAMMV+mD6v
         b1Zk+c916vyL25L8eWA4XNbF7Ag35JfBO8P2XqbiemTxFLo5gNuJ5aSpRCkcnEu8Bn4L
         nIrrj9alFHJj3RTuXe+fZewCcOnqGATVadx1ptmslY58rUU/O/i0GVgIPdgkHj7sR8Vx
         9tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063756; x=1781668556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLUa/AXn6V5bBUpSlyq/Yv+7zR4q4NR1uwX8ZsQpNCM=;
        b=oIWzjnMIsJdOzSRooQoL31VJO/OKyPSeBBq2RVRBw4RjArFNeDuar2WDDPG3+AbGim
         vXAi2RPiM/Kq9GAqXC6iyhIB5u3WAmimoEA8XH+dn5VHbChWfpw/pSg9q2tgeXhuXz4A
         nFPxG0w8N+umgRTcr0FOiQt/AH/9Aj7IlKvGki6YEzdBPvmNHDOk3rS5lBNAyXYh71IT
         BmwVE3EwqH9mPvY5uQceL//5ZeNJaBRnJCi/VR7sxVRJ5geO3Z4nCG93V1DRYHyQb59N
         rLAW4l8yWT1vzI/7XIWTuuP9iNG3ztRph5+mY2sH4+mNniWB04+Twrn/BuQ+LKEaSEoz
         mi4g==
X-Gm-Message-State: AOJu0YyB3gL+ogEWNhWJZhxJnvQBqfXHjZrb5fmObDWBY91A7sJQw+LA
	k61fPUy/lVI4gV6ZV2MDl+8lGxX3eCjyfd6mukiWytYFYyGJ+qb4Dd33eo/IOlPvueYdUdx6DQ6
	QiZXt2XtagaW2QK1n1ov8kWFZTdm90VRgK9OAM7+Nz/uT
X-Gm-Gg: Acq92OFg7eqwiEIqxcjKAt9k2Kj6U+HTtn886UJH9TTQg/cNKNchlsVZ2jB8wNcbb+M
	0mIZ5Jm3bnP3u7ZcGVut6eDbgtmzqUd29FHaHDC+aZsnTLbi5f3rgPnjpFF3fTaTJOOthbKdkqx
	CpyLaK9LkMyJZmVqBenmzwIvm7f3gHoaBpn+K4+oRJI6Hf6AlLQRc7XDCz96B+qwlMZFs/HaCMI
	s5GwkH6W91Tevi5xVOkom3vI4ws368rtYrFwNVxcW3NyLNET7BX7nhkjSLMtRULgOY/qbKJ0WwP
	mhMi6KMe7SYVw0VnIq4eT3CTNOQpq1VuUv+q11q7FX/fXO8k9ZXRIVDOQT/AMu+vljPuuFQCfVm
	46GWBS2JIsB0z05YklQxd/LAV+sg5Yhfg3FPi9MVbwfw6mJ1LbC5LL6ecRRGh8tMdh7DO9vs6eu
	kcobnGknO8TTiN2yb+0g==
X-Received: by 2002:a05:6402:3608:b0:691:aeaf:42a7 with SMTP id
 4fb4d7f45d1cf-691aeaf44c4mr6435595a12.10.1781063755451; Tue, 09 Jun 2026
 20:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq2JtpgEWVmGAXp1QTmYOiMWyajir-bHDRN56pr_E-bJQ@mail.gmail.com>
 <82309.1781059436135938457@lists.openembedded.org>
In-Reply-To: <82309.1781059436135938457@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jun 2026 20:55:26 -0700
X-Gm-Features: AVVi8CeYsQecXBN_7VQUB9pWQrtC982Lw6mvEgXLxH8XMgNbEmTBasQg9vwzq34
Message-ID: <CAMKF1srP3yJ2a2n0gVdqv22hjUqZRg-yu4QCQGbZrYPJXFc+Jw@mail.gmail.com>
Subject: Re: [oe] GCC 16 and meta-openembedded
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007751570653de38be"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 03:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127506

--0000000000007751570653de38be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here is latest build logs

autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7107638/raw_inline

On Tue, Jun 9, 2026 at 7:43=E2=80=AFPM Hemanth Kumar M D via lists.openembe=
dded.org
<Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:

> Hi Khem,
>
> I'd be happy to help with the GCC 16 failures in meta-openembedded.
>
> Could you please let me know which recipes are still pending investigatio=
n
> or fixes?
>
> Thanks,
> Hemanth
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127504):
> https://lists.openembedded.org/g/openembedded-devel/message/127504
> Mute This Topic: https://lists.openembedded.org/mt/119715210/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007751570653de38be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">here is latest build logs<div><br></div><div><a href=3D"ht=
tps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7107638/raw_inline"=
>autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7107638/raw_inline</a></=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jun 9, 2026 at 7:43=E2=80=AFPM Hemanth Ku=
mar M D via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;Hemanth.KumarMD=3D<a href=3D"mailto:windriver.com@lists.openembed=
ded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div>
<blockquote>
<p>Hi Khem,</p>
<p>I&#39;d be happy to help with the GCC 16 failures in meta-openembedded.<=
/p>
<p>Could you please let me know which recipes are still pending investigati=
on or fixes?=C2=A0</p>
<p>Thanks,<br>Hemanth</p>
</blockquote>
<p>=C2=A0</p>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127504): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127504" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127504</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119715210/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119715210/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007751570653de38be--

