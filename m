Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DB9C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:27:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.10949.1700047629623923990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNY6kooO;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507975d34e8so9545693e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 03:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700047628; x=1700652428; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk6Y3h//PsIA0kqDPVRTS4p8WgsxQgTg/npq3qnVC4g=;
        b=XNY6kooOutTr9B8Wqdy4nW9amqNEMVZ/qbczOJd3tXBl3weDhoc7gAMQkQ0mhF26SA
         MGqZJ64KfZ8FQbZwcWN2jhws89p0UYeTu2A3+NlGM5mRpUCDcoTtWgeZZ1gWB0D487Al
         yv1P+6JFYd4mT115j1uQsD1N6x7Jtz/1GoD3tiBsj5DuDJt4gF7VY/4AXfbsTi9wAJyD
         Lvhy/rtvzgbDZu7wy94V7JVqPNSKJfNPXlon85IVvzPTdMFccN8t21MUeFvqLySeI9wx
         /9G0a9AbQmYnc1kmsgSmnoU4oomVb1Ss+bDtLGH5MLLfCrRGAoLXoDZ5aGHKfSRCuEoY
         V6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700047628; x=1700652428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vk6Y3h//PsIA0kqDPVRTS4p8WgsxQgTg/npq3qnVC4g=;
        b=gTg6GlSx6lcBk7wY1NuLg/u97WBU/08F8LvX8ZOk6m3FojDYTLv8UT3gti3D0gQtoO
         iLl0bJEfBduN9wSznrjqdicfUx44EAB7+XwCSenN9KA95yuSsvznKR8bwMfS74MdYJw7
         wDShGf/d+CHLvJ2wCWPsB1Z7iGmOnocc+bMEXJIezcANAeQUs8fmvKLlatP6Wf0XvFCc
         XklOI79zETSCUWpCsfOJIPUIMEAg2xBS11fbEyLKPANWo0El7sr9JgxznA4KT88As5L6
         P2PfuqozqOwX/ymBw94UunVIJYvQlk3luxmuRJ67ol0Dr4IbHnY4B2czD7qdYune9TWT
         ps9A==
X-Gm-Message-State: AOJu0Ywq9TgMC+ycfHVz0xtyJ9VLqo9pwAVadH32bvV5RFKc/WVGwG7b
	KAcopAk5DmSxwnVMvGibZJOzUJ/HyC4PgiAOMtw=
X-Google-Smtp-Source: AGHT+IEK477JN2DEAEWshARy/F5364YdvbxzqUikJBTgPGZ68XVCutZ0ro+mQXy1mNVVPpvtYHFCbbbj4zoyLXwpvUw=
X-Received: by 2002:a05:6512:3f18:b0:50a:764d:7de9 with SMTP id
 y24-20020a0565123f1800b0050a764d7de9mr10171059lfa.66.1700047627449; Wed, 15
 Nov 2023 03:27:07 -0800 (PST)
MIME-Version: 1.0
References: <CA+chaQfoVmHQu_b6VajBdgVWkPvyQ_JCbaVQ-P2grWwmaSGhCQ@mail.gmail.com>
 <17365.1700046637120731117@lists.openembedded.org>
In-Reply-To: <17365.1700046637120731117@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 12:26:55 +0100
Message-ID: <CA+chaQfORjPDOyCj4DE6gvkEJvdzc7E_tVJp-ftU2Fk4FgLWVQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
To: Hains van den Bosch <hvdbosch@cybercomm.nl>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef7934060a2f2e83"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106754

--000000000000ef7934060a2f2e83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 12:10=E2=80=AFPM Hains van den Bosch <hvdbosch@cybe=
rcomm.nl>
wrote:

> Uncomment:
>
> EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
>
> libebml_1.4.4.
>
>
> https://git.openembedded.org/meta-openembedded/tree/meta-multimedia/recip=
es-mkv/libebml/libebml_1.4.4.bb#n14
>
> Did for me the trick to fix build Gerbera.


Can you send a patch with that?

I don't know why it was commented out during the upgrade and I don't use
neither libebml, libmatroska nor gerbera (other than them being included in
world builds).

--000000000000ef7934060a2f2e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Nov 15, 2023 at 12:10=E2=80=AFPM =
Hains van den Bosch &lt;<a href=3D"mailto:hvdbosch@cybercomm.nl">hvdbosch@c=
ybercomm.nl</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Uncomment:<br><br>
<pre><code></code></pre>
<pre><span>EXTRA_OECMAKE</span> <span>=3D</span> <span>&quot;-DBUILD_SHARED=
_LIBS=3DON&quot;</span></pre>
<pre><code></code></pre>
libebml_1.4.4.<br><br><a href=3D"https://git.openembedded.org/meta-openembe=
dded/tree/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb#n14" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded/tree/meta-multim=
edia/recipes-mkv/libebml/libebml_1.4.4.bb#n14</a><br><br>Did for me the tri=
ck to fix build Gerbera.</blockquote><div><br></div><div>Can you send a pat=
ch with that?</div><div><br></div><div>I don&#39;t know why it was commente=
d out during the upgrade and I don&#39;t use neither libebml, libmatroska n=
or gerbera (other than them being included in world builds).</div></div></d=
iv>

--000000000000ef7934060a2f2e83--

