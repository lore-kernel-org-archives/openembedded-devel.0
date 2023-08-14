Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C50C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 15:29:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.110374.1692026949228416842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 08:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AEmoYCr2;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3159d5e409dso3262316f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692026948; x=1692631748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7WV2Nbof65UF1FcR0K1LxWuRckt2BVmj8Blvw5sDcfo=;
        b=AEmoYCr2suOjEVyngD3DqyDjNtvwFZlET8ox3rdoswxLGRSaPplj/10qYpXXv6eUFI
         FjObhlEYvWPB1R9WhmMx4Jmk932FMme22+cStyY8p6hmPuvOPba3XNBb24NaBYcaNVb/
         zVQqxWoAQRQH7X13T3JiQtxNdaOderc2C+gJmIt8M/wPlfNWrNp/yG5R95Nv0P/AZTe0
         u0nzee2eYDPE3UAC93X8fkfY1Mak+GTUSyCnslJIopm50NbjWcIlAX2DK01luxUXfQDw
         Sq20ed26MvQvytxS3r+NTg/cKJQDvUemMI5F/1BQpLLI2kiAIUjZ8wuQwqIfvn9nVc7y
         Lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692026948; x=1692631748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WV2Nbof65UF1FcR0K1LxWuRckt2BVmj8Blvw5sDcfo=;
        b=PdyikSYNjpIVJyOQSnMcyvQHZSvkEdj3LzQb03cYcCA+8oadlR6WLF/JO4kurG7cWN
         i3wt691pyWSSNxmeP7VvldCSTxysJvF5pI3AcwpTJXwa76ZG3oJRSVF+Gl1p1dbuxJiU
         9AXvnqrR6R7MpUaN9JyYc+Zr1FRn9ff/SwVJGovoM6LJrO9QbPm0HxcffyoypJG05rdE
         VHVlFULmtpGW2xbX+rHJaTS4NDwly7SiGqiCOVzUL8V1dISZbAGuNu2tzOddsGhTJm6Y
         GVDuosKqaldjwdnRepGmnalsT0z6SBEkNIT5rz6RYu/yUoE+J+nBp/zH33uhwAdSY7O3
         NsHg==
X-Gm-Message-State: AOJu0YxEN6vEvBmr7KeSIINnDOY23Y4REnZ1AQ0t3nj9uwgAs5N5BII5
	MQjlL/l5Je4lC2Uxy1Bl5WW3uDWQwN8mEOAsNzU=
X-Google-Smtp-Source: AGHT+IGfv1uw/9ZKSJM6dCZOiEGQBiPGGprEjfWY+U//NwYmcxjQlvX/4vF2L/De4oAlcgZ8NLkhWH2LnQ0wLbhoRUQ=
X-Received: by 2002:a5d:6386:0:b0:317:dcdd:3fa1 with SMTP id
 p6-20020a5d6386000000b00317dcdd3fa1mr10027617wru.34.1692026947511; Mon, 14
 Aug 2023 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144304.2395362-1-m.vovard@phytec.de>
In-Reply-To: <20230814144304.2395362-1-m.vovard@phytec.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2023 17:28:51 +0200
Message-ID: <CA+chaQfZgtcjXxuqYw4=Zq8b9Xt4Vw=_ToQRn0P8bRnF8POxZQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/1] Remove X11 from REQUIRED_DISTRO_FEATURES
 from Kivy
To: Marine Vovard <M.Vovard@phytec.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002829320602e3b9a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 15:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104352

--0000000000002829320602e3b9a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 4:43=E2=80=AFPM Marine Vovard <M.Vovard@phytec.de> =
wrote:

> I'm not sure if removing X11 is the good option. Maybe we could try to
> say it's either Wayland or X11 in the distro if it's possible with
> Yocto.
>

meta/conf/documentation.conf:ANY_OF_DISTRO_FEATURES[doc] =3D "When a recipe
inherits the features_check class, at least one item in this variable must
be included in DISTRO_FEATURES."

--0000000000002829320602e3b9a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 14, 2023 at 4:43=E2=80=AFPM M=
arine Vovard &lt;<a href=3D"mailto:M.Vovard@phytec.de">M.Vovard@phytec.de</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">I&#39;m not sure if removing X11 is the good optio=
n. Maybe we could try to<br>
say it&#39;s either Wayland or X11 in the distro if it&#39;s possible with<=
br>
Yocto.<br></blockquote><div><br></div><div>meta/conf/documentation.conf:ANY=
_OF_DISTRO_FEATURES[doc] =3D &quot;When a recipe inherits the features_chec=
k class, at least one item in this variable must be included in DISTRO_FEAT=
URES.&quot;</div></div></div>

--0000000000002829320602e3b9a2--

