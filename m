Return-Path: <ninette@neighbourhood.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CF9C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 11:33:43 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.44603.1712921614079739050
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 04:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Q5/l2voZ;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.42, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso100432466b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 04:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712921612; x=1713526412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XtkKsEf0mVnGQ0cVPtLKs4KcTqvjnuQ46xMarWW/irA=;
        b=Q5/l2voZMWGWjbC5ZR71bru1v1P7lUCOjKtbEHwQNg/J36ff6z8Os5heNZsTPRIdp+
         uKr8qNFvChtSTe/XAeAM9cgYBTxqvUT2r3Qm3gNLOaU2CWICSWK/zseeHFmgIpth4QNK
         MsNfo6duYQP6o2zz78Ge752Vkyfmp5VpSmh7MW1xCem2zuJhyl/Quke/A9GyeoX3v8Nb
         qH3MOHUzPNSxTPwUNeuVfwlMIrWOKP63n4STEoxXmoBIr2pJu4Wz2sSmDal2h3RrvY+r
         9uCT7VAOUHudofSN0jAg2Ld2aS/F2Z0Wiso08VpuZt1Ho1aNA4MeidvLF9czkhRTRvaA
         XMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712921612; x=1713526412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtkKsEf0mVnGQ0cVPtLKs4KcTqvjnuQ46xMarWW/irA=;
        b=kVWVaw6wSxdbd+9vtZy6eddVUtkALgy9E30mbxq++cKJ7p5PkbITTE/ia2ytDz1XME
         yCxbUeUIaZH3JX91HyfVV9UAn7QUiarCzfDs47HQKoCEY+fua1j7qt9BJD8TYSjJeJoQ
         ratiZuuRXnsyhT0RMh9qpXxZfKnJi1oaLkdwJuiB4AKA/aI2US64xhpSuKXkQdIKH8GN
         lUd8J42hJbskDXogEgGJPxUEMNy4EX/WoqfzsQjRpWKaSwppSaEsS/oNz6bd2HEJ1Fab
         IIbU3bJ9A+O1dq0ku39JhvMRGiOeTtVeAmrgh3MieIJffX+NiBifWPZoZC/z4BDJISJB
         ajUw==
X-Gm-Message-State: AOJu0Yzp/ZJAIgedw/u1o3mhAPNhSiggAS1Yqtt0+zXbu0tL7JPo34o4
	JA2yk26izJ5vyuS0BnnlRIw1NCv4xZbNNLHtVsh67yRsdxG62gIPaCrTvCx2rKuJFKhVpRAwWSR
	Oo1EuCJN6zXWcBFpS291KPiTnE9868TUA7XaTzA==
X-Google-Smtp-Source: AGHT+IEOwwddnxzAVHjuevTkImrAw5DnGpQXh0I9UFVTW73CRRfp5usEGbbKArE4g53DK5DC++WpI0KiSmJeB6x78aE=
X-Received: by 2002:a17:907:720c:b0:a52:36e1:bdef with SMTP id
 dr12-20020a170907720c00b00a5236e1bdefmr1111385ejc.0.1712921612140; Fri, 12
 Apr 2024 04:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240410150453.12726-1-ninette@thehoodiefirm.com>
 <20240410150453.12726-2-ninette@thehoodiefirm.com> <AS1PR10MB5697292F84DCD4311F1227C7FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAG1aeW3if2t3Taf0ti3O3xjQX4jot1kArKSdDLYb6ZaSD26a2w@mail.gmail.com> <AS1PR10MB569743CA8A5017B46E75393CFD052@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569743CA8A5017B46E75393CFD052@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Ninette Adhikari <ninette@neighbourhood.ie>
Date: Fri, 12 Apr 2024 13:33:21 +0200
Message-ID: <CAG1aeW26HMT4v+Gv4hgQ1BxUsFNPWO90_AATtSe2j=Ja2BMLtA@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003859800615e4a492"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 11:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109940

--0000000000003859800615e4a492
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Peter for sharing the details. Shall I leave the patches as is then?
or do I need to update the commit details?

I've been going through the CVE list and will post patches for any other
invalid ones. It's a long clean up process but hopefully we'll get there:)

Ninette

On Thu, Apr 11, 2024 at 9:46=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hello Ninette,
>
>
>
> Yocto currently supports CVE statuses listed in this file
>
>
> https://git.openembedded.org/openembedded-core/tree/meta/conf/cve-check-m=
ap.conf
>
> In most cases you just want to add a status and description why the CVE i=
s
> ignored.
>
> If you want a different or more specialized status, you need to add it
> there first.
>
> But imho cpe-incorrect is good enough as there is also description which
> gives more detail about it.
>
>
>
> If you want to start working on open CVEs in meta-openembedded, here is a
> looong list to work on
>
> and many of them are invalid, e.g. to be ignored for similar reasons you
> tried to fix:
>
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-sta=
tus-master.txt
>
>
>
> Peter
>
>
>
> *From:* Ninette Adhikari <ninette@neighbourhood.ie>
> *Sent:* Thursday, April 11, 2024 18:19
> *To:* Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
>
>
>
> Hi Peter,
>
>
>
> Thanks so much for your response. Many apologies for the confusion, I was
> trying to follow the example here
> <https://git.yoctoproject.org/poky/commit/?id=3D378bc2f8e3ac393d89a6d2e52=
094478fb3879ef7>
> to report a CVE issue but clearly I chose an incorrect classification.
>
>
>
> I meant to say that the 7 CVEs are invalid or not relevant any more. I ca=
n
> make new patches marking them as "cve-invalid" instead of "cpe-incorrect"=
.
> Would that be okay? Let me know.
>
>
>
> Thanks again!
>
> Ninette
>

--0000000000003859800615e4a492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Peter for sharing the details. Shall I leave t=
he patches as is then? or do I need to update the commit details?<br></div>=
<div><br></div><div>I&#39;ve been going through the CVE list and will post =
patches for any other invalid ones. It&#39;s a long clean up process but ho=
pefully we&#39;ll get there:)<br></div><div><br></div><div>Ninette<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Apr 11, 2024 at 9:46=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter=
.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg418321089218335=
7147">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_4183210892183357147WordSection1">
<p class=3D"MsoNormal">Hello Ninette,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Yocto currently supports CVE statuses listed in this=
 file<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://git.openembedded.org/openembedded=
-core/tree/meta/conf/cve-check-map.conf" target=3D"_blank">https://git.open=
embedded.org/openembedded-core/tree/meta/conf/cve-check-map.conf</a><u></u>=
<u></u></p>
<p class=3D"MsoNormal">In most cases you just want to add a status and desc=
ription why the CVE is ignored.<u></u><u></u></p>
<p class=3D"MsoNormal">If you want a different or more specialized status, =
you need to add it there first.<u></u><u></u></p>
<p class=3D"MsoNormal">But imho cpe-incorrect is good enough as there is al=
so description which gives more detail about it.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If you want to start working on open CVEs in meta-op=
enembedded, here is a looong list to work on<u></u><u></u></p>
<p class=3D"MsoNormal">and many of them are invalid, e.g. to be ignored for=
 similar reasons you tried to fix:<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://autobuilder.yocto.io/pub/non-rele=
ase/patchmetrics-meta-oe/cve-status-master.txt" target=3D"_blank">https://a=
utobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-master.=
txt</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b>From:</b> Ninette Adhikari &lt;<a href=3D"mailto:=
ninette@neighbourhood.ie" target=3D"_blank">ninette@neighbourhood.ie</a>&gt=
; <br>
<b>Sent:</b> Thursday, April 11, 2024 18:19<br>
<b>To:</b> Marko, Peter (ADV D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Mark=
o@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status<u><=
/u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Peter,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks so much for your response. Many apologies for=
 the confusion, I was trying to follow the example
<a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D378bc2f8e3ac393d8=
9a6d2e52094478fb3879ef7" target=3D"_blank">
here</a> to report a CVE issue but clearly I chose an incorrect classificat=
ion.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I meant to say that the 7 CVEs are invalid or not re=
levant any more. I can make new patches marking them as &quot;cve-invalid&q=
uot; instead of &quot;cpe-incorrect&quot;. Would that be okay? Let me know.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks again!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ninette<u></u><u></u></p>
</div>
</div>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><br></div>

--0000000000003859800615e4a492--

