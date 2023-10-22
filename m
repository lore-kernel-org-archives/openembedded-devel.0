Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5EBCDB474
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 20:10:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.106242.1698005415223639578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Oct 2023 13:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DEnR6ivn;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32d895584f1so1807866f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Oct 2023 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698005414; x=1698610214; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtthg6b/T3oiuTA9/Ac87UP97yD2XLm/FQgvq1+516E=;
        b=DEnR6ivn55CPFg9AX00RyOigY56pnUPRYpLNMxey83klDT9R4AIBSaZ/yCtlE0iC/N
         kpp0pP8YETGgKQQrxoDNM3EcFKHQlKKiKEANQ7Y9/tBgY+hEQRrQC85ZheKoYiVXGNZB
         mdD+++sZWsF+FHJvbVJXwi86ql0jJOOQmRdbOhl/R/H6f6NFRJFsvAn2tBWNrEPL8Iks
         ujNKCBMBOQx5I7xkPcAxJHMclSAkSHQNXX9xx26Fj0rXlsSqvThjG6QPSxjFTPkzvF6q
         zf8KJNsLnAf3Byv7uyzVG7dNL61T5sdqXZkJzZXCIay7fsFuPlrzEeoVL7v/WJOy52YQ
         1qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698005414; x=1698610214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtthg6b/T3oiuTA9/Ac87UP97yD2XLm/FQgvq1+516E=;
        b=CxOy/yuv7Zn+lIS0wlMRJ6ovE5wV9wJvtLGbMUFymKry7ET7wbOEmcRF+RrUuAYoqL
         xP8vfV2/ohWvclAARJBiba/+u7AdOpWfzVB3pXr0FNNsFxtdp5nTSDax//PiN6aLM9Xv
         OQ5PIO1LZRwHbrWchHT3IzbuyB1PlD73sKXxH0Z6MEkUkaABbwE7jsRSp4ewuTHQAnr9
         u8NL+glYElknwfPJ+2kGsLIzQ+zjdF9HjYbIkX8pKPsHENdHW4jWuQ9zo0mXtSkQyf2/
         t+yAA0LOOsesLEJn23XtaZP+zHFqUwrJSrtZaR/BNkn+48Aswb2TjcHhOQYgU6ElS4vP
         8F9Q==
X-Gm-Message-State: AOJu0Yyz/k8LKFpnaSs2BafwIoaffPu4NV5kRkJmJobYrTa9X8wnN4Ml
	uK5VnuLIo/St0ZqRjf6Y6svR4QbDhDGT//oEqds=
X-Google-Smtp-Source: AGHT+IF4Tcxd4rcCa3ItoDIx47dpfqFbpiDA6hHrH0REzNalHzfdkw8Yro5MveHFnLOhZCDCY4vhSuZWYpK5nigdJDc=
X-Received: by 2002:a5d:4cc2:0:b0:32d:c0c9:f661 with SMTP id
 c2-20020a5d4cc2000000b0032dc0c9f661mr4553554wrt.51.1698005413350; Sun, 22 Oct
 2023 13:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <17895B01A59EF33C.9230@lists.openembedded.org>
In-Reply-To: <17895B01A59EF33C.9230@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 22 Oct 2023 22:10:01 +0200
Message-ID: <CA+chaQddWyNJNSFsVrcjpZASGc-17oQdwfRZO5s=DcXX0sQ+tQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] packagegroup-meta-multimedia:
 restore x11 restriction for projucer
To: martin.jansa@gmail.com, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007d51da060853b171"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Oct 2023 20:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105629

--0000000000007d51da060853b171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 1:26=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * it was removed in:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Ddeb11a823c32d=
4090b3724a589641810e06df6bc
> * but still needed as shown in world build without x11 in DISTRO_FEATURES=
:
> ERROR: Nothing RPROVIDES 'projucer' (but
> /OE/build/luneos-nanbield/meta-openembedded/meta-multimedia/recipes-multi=
media/packagegroups/
> packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
> projucer was skipped: missing required distro feature 'x11' (not in
> DISTRO_FEATURES)
> NOTE: Runtime target 'projucer' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['projucer']
>

gentle ping

--0000000000007d51da060853b171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 29, 2023 at 1:26=E2=80=AFPM M=
artin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* it was=
 removed in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Ddeb11a823c32d4090b3724a589641810e06df6bc" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/meta-openembedded/commit/?id=3Ddeb11a82=
3c32d4090b3724a589641810e06df6bc</a><br>
* but still needed as shown in world build without x11 in DISTRO_FEATURES:<=
br>
ERROR: Nothing RPROVIDES &#39;projucer&#39; (but /OE/build/luneos-nanbield/=
meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/<a href=
=3D"http://packagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_b=
lank">packagegroup-meta-multimedia.bb</a> RDEPENDS on or otherwise requires=
 it)<br>
projucer was skipped: missing required distro feature &#39;x11&#39; (not in=
 DISTRO_FEATURES)<br>
NOTE: Runtime target &#39;projucer&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;projucer&#39;]<br></bloc=
kquote><div><br></div><div>gentle ping=C2=A0</div></div></div>

--0000000000007d51da060853b171--

