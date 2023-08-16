Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D205CC10F19
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:54:10 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.168880.1692212044836753889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jtuUcEDJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-56e0d6651fbso84574eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692212044; x=1692816844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xH9RaTKquFC6v2t2qrbDXqhEtkBU1vR7c3EE56Os6+Y=;
        b=jtuUcEDJrVaZDCMZ6h5uDu6oGaQ7J6n6Y21y4kl0XseB4hWQQe0rjCZAzCIsnp6qjR
         2Msb4RNRASqR+u1HbrxylFZYrSSseFvhq7eVIz+0FYnpsNdfttfyeKz5Lse01eYcvuzV
         EFBw/W6AWZp5/rgkqdsRQ53sp7bEZQ/NR9U+fy4P4d7HSVaZl8RUrXJ4B4o4K6rSWpnS
         4FUAKv1dLCmM6r7SIFxVqsalfTv2Bg3wXNKdBUN4SmiJaG0PKb8mIDw6TWRWbC3C4hsn
         N3i6WngAd8+LHgEICYI9bY9yVB9/a0+SDSMqQgcxQd5fp0OtTQijoMXSPG8IcvFWzAg4
         csoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212044; x=1692816844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH9RaTKquFC6v2t2qrbDXqhEtkBU1vR7c3EE56Os6+Y=;
        b=Akjoy1ikAJ0oOX6G2+WD1PZ/mgIM7J202zHRbjo8L+BI4NFQlBQGuebRYsGyIMzbHl
         r8rUW4mAm7J9sdewzyMu3Z6x1Y7/yMoNtrhXeoQ76r+Jbd8NrF8Qqgp3u80qbzdj9JeH
         16qepk/LYae48ps8cKbGMkMEqp7b4XMxKz2zqs5Nve4lQU754HQLsz0TX8Xba/3eagxH
         QyF0bZXFMNQ1YBX7FNHXYUigdz+3xo3oOzWTBC+nBzKvJSJcQBJ2/pNDA1QBFYohl1Tr
         opXPJ+mBpgd22GclTOnyAXFW4VGUoMB9Fz79GRw3gdlpedxIZsKJNFoED5G/x2jqYxTa
         uHmQ==
X-Gm-Message-State: AOJu0Ywx3KA9dJEC19Jac+TtML6wkqcHdGUmFx8YYPtf0nq+V0R0mjXw
	cvoguX+sMI1rq5oQikebb/vVLJx6oT7YgFWGaVA=
X-Google-Smtp-Source: AGHT+IGzsj+HrOKAYd80Iliift7JL4eXVS966DaR5GEh0T8zoo5tx0fJ4oeHKVtPqL1zWdUZf85KELD5r9F0VX0Kjgs=
X-Received: by 2002:a05:6808:1292:b0:3a4:225d:8293 with SMTP id
 a18-20020a056808129200b003a4225d8293mr387318oiw.0.1692212043956; Wed, 16 Aug
 2023 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <7bf67950-8ded-4d76-a775-f0af4b8219ba@gmail.com> <29355.1692211942441887558@lists.openembedded.org>
In-Reply-To: <29355.1692211942441887558@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 11:53:53 -0700
Message-ID: <CAMKF1srdkiEpbGNHr0k_yHoR9VsTP15UHcGDab15TEXQc1MmSw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] recipes-bsp: Add bolt
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3c64106030ed1b1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 18:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104443

--000000000000c3c64106030ed1b1
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2023 at 11:52 AM Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
wrote:

> It is the same but yesterday's v2 patch but the mailing list
> <https://lists.openembedded.org/g/openembedded-devel/search?p=created%2C0%2C%2C1%2C2%2C0%2C0&q=recipes-bsp%3A+add+bolt> did
> not receive it (you apparently received it though) and I realized that I
> made a mistake in specifying email recipients so I resent it correctly this
> time.


Ok you did the right thing no worries I have it staged in master-next
already


> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104442):
> https://lists.openembedded.org/g/openembedded-devel/message/104442
> Mute This Topic: https://lists.openembedded.org/mt/100785507/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c3c64106030ed1b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 16, 2023 at 11:52 AM Chaitanya Vadrevu &lt;<a h=
ref=3D"mailto:chaitanya.vadrevu@ni.com">chaitanya.vadrevu@ni.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">It is the same but yesterday&#=
39;s v2 patch but the=C2=A0<a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/search?p=3Dcreated%2C0%2C%2C1%2C2%2C0%2C0&amp;q=3Drecipes-bs=
p%3A+add+bolt" rel=3D"noopener" target=3D"_blank">mailing list</a>=C2=A0did=
 not receive it (you apparently received it though) and I realized that I m=
ade a mistake in specifying email recipients so I resent it correctly this =
time.
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok you did the r=
ight thing no worries I have it staged in master-next already</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104442): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104442" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104442</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100785507/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100785507/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c3c64106030ed1b1--

