Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D95FC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 22:19:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.727.1717539582886828776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 15:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiopbMog;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a5bcfb2d3so1476960a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717539581; x=1718144381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcZXEBWj3NQJ7DpuwM43ZyINeFqtPWjflWFPnBJyIpU=;
        b=OiopbMogs+LcdvPR8k0PpOWsl5yI/xohvM65xnOQDX1Syx4gV6xmQcU+q+uy8C7VGR
         RWq4T1lxWKBtlfucTiSSSxk1ghyPlzZOAYd2LMMTD0k6h2mgK3TbboP28j0vn1GO9U0x
         FscsA86PnSGgmzdSZRn0fzY8tr1SDcBsSJ7++EWKgiggqYr98p3yIJfS4AabASKOnEvs
         LXqxhElZ5GgZwS5OWDNZPY7cztkM5burSxs8IBfOJF23xcsGwySsMbqzBSFcNnaOsxF5
         DQFa2cnBCtKNU62I2bJhQPmsKEVjz0XXt9StD1eHw5wmaqoHm7Q+FoUop1xZMCqmlPNt
         fAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717539581; x=1718144381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcZXEBWj3NQJ7DpuwM43ZyINeFqtPWjflWFPnBJyIpU=;
        b=bd0njf4GC+tRUPaE5erYB3VYhJBBew5lC34j0ghA23I1ipBguV0VWjSa3FzE+2PMAp
         C8Uxlm7cHprhNE/NH6Z6JKJogZOPlSO+v0SVRwh69ls2fPeAQhJPwD8HI5JWHHVGEDs0
         IMluGR3QVG1pVQ1f74BcjHQoqpNrQQc5M2S1rDGNb2WlrtcPie6pwiP8+ELT1paSJ0Z0
         POzK14wQNYEZjp0dhMYbvsCTvpRr1DMjmvmQ8S3ccGO864t5CMenL0bVzedi8DwnundA
         F9zAnvnNgDmQ+X9AiKXLH8rkH35M8rqclcMkWRjKI9ZXuUKp2hNEA4p1chrBjc8X+zFe
         wYoQ==
X-Gm-Message-State: AOJu0YwyXXcZ8W8/bTWnY+4JNPoS1wgEFL+4i8nTS0XYT+Qzz0f8u6pm
	rZmboM3E7dc5xULggLB+8WgFrWKvbHNoJ5KHOiPJ4tfUdDgjT1fZtSM3KHad6dGHJqeblhbYLDQ
	LhblNmOCRHG25xuqd5ymZPBRIPKI=
X-Google-Smtp-Source: AGHT+IEUrdLcDmTXBTjCpR7waEMJNY7I1k0EN94oV2v+u76wr7rmv+BXBFQDqsrM/5U1zvlIYKtUvJ0EEMQqSKtp5zo=
X-Received: by 2002:a50:cd1a:0:b0:578:69cb:1efc with SMTP id
 4fb4d7f45d1cf-57a8b696d0amr653616a12.9.1717539581078; Tue, 04 Jun 2024
 15:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org> <CAMKF1so0jzeWU3+9P_Sf_3reufN37yeeOapOKD4bQKZXu37MMw@mail.gmail.com>
In-Reply-To: <CAMKF1so0jzeWU3+9P_Sf_3reufN37yeeOapOKD4bQKZXu37MMw@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 5 Jun 2024 01:19:29 +0300
Message-ID: <CALT56yOuRxy0--fB8uHQftX=8eo0mhnzxiPgr=_8NhP84jjH8g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/2] rrdtool: fix compilation with GCC 14
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 22:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110690

On Wed, 5 Jun 2024 at 00:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> This patch in itself is ok however ntopng fails now with this patch appli=
ed see

Pretty much like lmsensors, as it seems. How should we proceed? Fix
all existing uses?

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3899/st=
eps/15/logs/stdio
>
>    | src/LuaEngineNtop.cpp: In function 'int ntop_rrd_tune(lua_State*)':
>    | src/LuaEngineNtop.cpp:5430:27: error: invalid conversion from
> 'char**' to 'const char**' [-fpermissive]
>    |  5430 |   status =3D rrd_tune(argc, (char**)argv);
>    |       |                           ^~~~~~~~~~~~
>    |       |                           |
>    |       |                           char**
>
> On Mon, Jun 3, 2024 at 4:09=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Import patch from the rrdtool's git to fix building with GCC 14. Note,
> > it also requires fixing other tools (like lmsensors) in a similar way.


--=20
With best wishes
Dmitry

