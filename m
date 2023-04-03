Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0201EC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:57:16 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.75138.1680537429229865833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cI9egsMd;
 spf=pass (domain: mvista.com, ip: 209.85.222.41, mailfrom: hprajapati@mvista.com)
Received: by mail-ua1-f41.google.com with SMTP id g9so21180736uam.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680537428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/IZGBXZw6apKpOMgxiPircSt73yplZeXPZv/65KZPD4=;
        b=cI9egsMdiKnJFdEDIT8s3kQtyC/53biZFcL/AA+06/iAD8SopimxnIMyzMNYJ5zgbr
         cgEDWOAEJG+qnvNRNvdJbeqQZQtEVp+WQGAOYXBIpUgGE8deuKOu+Lx/OjM/ZpSY3RBN
         O6CQmtawD4PLP4dYhJLl70olPxvFkcs+YtPSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IZGBXZw6apKpOMgxiPircSt73yplZeXPZv/65KZPD4=;
        b=ugBqT1/7l1WIJIOUrUzIsGZ4xynnAgN30dgc/5htUgjZE2RPucosvZgBrc96DbdNwV
         jF6FqmsLW4VzNGtttW8MqYYrd8c5pKdFTPuR5xkihsKIf7ub6SKTz1xFzjWFKYBYc5Wk
         64lD5QnccY5mOUT5Z82gMF0/k0pbVRbBTx08OU6qfpEkBLDgjL0s4+P7cE3E43f9wEWg
         G4pf/v6LUGsvKy8tpxihTRX16mofuIASnftR+2MKld1tozH0dat45tXJdLvtizxe2vqC
         UXFmPg7WNdF3Azj/3qQucfypt/15Zm/YdYGBM16apMRo0SnHBYvLvHdDs0LHS27Ba19s
         j/gg==
X-Gm-Message-State: AAQBX9fO7fq+P/1hEn4S/i9v58QqbxbD2eKdL+sQBqS9fdRsh+6qHLnY
	KPcfYkmL78tofghOhYy4SGrw/kCyORIJrTwo1jcuWg==
X-Google-Smtp-Source: AKy350b4CflPV6LA+ja5F6Gr5Q9b+SxbJTgONugYwhNbM8DMtMl1Y4Y5AKDm+ocIitpdRotjngGSmODg3gNuIyTujWc=
X-Received: by 2002:a05:6130:a88:b0:68a:6c1e:1aab with SMTP id
 by8-20020a0561300a8800b0068a6c1e1aabmr28666560uab.2.1680537428203; Mon, 03
 Apr 2023 08:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230324120404.43733-1-hprajapati@mvista.com> <24425.1680520543580336166@lists.openembedded.org>
 <e333be95-97e4-74d7-7a4e-a144897abb55@gmail.com>
In-Reply-To: <e333be95-97e4-74d7-7a4e-a144897abb55@gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Mon, 3 Apr 2023 21:26:56 +0530
Message-ID: <CACVbggEqbY_Vy3FvD00zypaiGU0y82zz7hC7WSvaWn7RMWY7pA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] postgresql: CVE-2022-41862 Client
 memory disclosure when connecting with Kerberos to modified server
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070b01805f8709c45"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 15:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101941

--00000000000070b01805f8709c45
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

No problem.

Thank you for the update.

Regards,
Hitendra

On Mon, 3 Apr 2023, 8:59 pm Armin Kuster, <akuster808@gmail.com> wrote:

>
>
> On 4/3/23 7:15 AM, Hitendra Prajapati wrote:
> > Hi Team,
> >
> > Any update on this issue ?
>
> Don't know yet. I have only on build system and these things take time
> to work though the branch rotations.
>
> -armin
> >
> > Regards,
> > Hitendra
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101939):
> https://lists.openembedded.org/g/openembedded-devel/message/101939
> Mute This Topic: https://lists.openembedded.org/mt/97822021/6955432
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000070b01805f8709c45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Armin,<div dir=3D"auto"><br></div><div dir=3D"auto">No=
 problem.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for=
=C2=A0the update.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regard=
s,</div><div dir=3D"auto">Hitendra=C2=A0</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 3 Apr 2023, 8:59 pm A=
rmin Kuster, &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 4/3/23 7:15 AM, Hitendra Prajapati wrote:<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; Any update on this issue ?<br>
<br>
Don&#39;t know yet. I have only on build system and these things take time =
<br>
to work though the branch rotations.<br>
<br>
-armin<br>
&gt;<br>
&gt; Regards,<br>
&gt; Hitendra<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101939): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101939" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/101939</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97822021/6955=
432" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97822021/6955432</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000070b01805f8709c45--

