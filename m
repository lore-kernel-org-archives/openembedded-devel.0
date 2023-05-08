Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E228C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 16:14:30 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.111986.1683562466603115222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 09:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=awPzJ/GW;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3921cd76d5bso3136352b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683562466; x=1686154466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN1saGd9WVJ4DVthu20PO1b+ryg7Y3MzrbP/PYc3zPw=;
        b=awPzJ/GWph2gPBzygPq7K89va2d49z1xYOb5pGcIcg+xMXKLllxHQk6Cf9fxKVXCoU
         SV+mmavj0lh1OIdifrEVAg2w9z8VGKKNx4Tx2wK6gMhzMTHR9Fwbx67V45ADtOWN7k6A
         Jz1ts+f+ri9bFQpkCRJJgQD1+wQe/kgnsR5W0Q2uL2tK+NRzwUX8nq1zAD154gUHQM9q
         twQVltxhBTnOwnsLQyJ+5+heZHCGWHYielMzaH2SCwbSofj6mrK0On6QgjQ1tV5PYrA5
         BAMMwPTpKAPT7U9gcjP3IjyCKsF79NE7pk7BS7AemDpkCSA1obKQrSlIdSIgqOxaO9lQ
         5PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683562466; x=1686154466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN1saGd9WVJ4DVthu20PO1b+ryg7Y3MzrbP/PYc3zPw=;
        b=Ad/Q3PZjFNGT4Sfhdhqkorq70MVWWRHQtlZI9FqNdajYz9yPKLxeZyZmAYWN3ZKPAQ
         8wt4d9EVYRNYYbvqGrcM0tf2Tmq3zHw36O+evVivyx+uIipjlioKrU11BG3HvDhrgxch
         nF8DmVRjPikRvtiD6rY1NhQN4mjj/0IoXFLMs448z7df2RujuKlCjUL44xRLgYi4TpCe
         wLmCpFbqE4I7igekFRRB1UrxpwuOoFpaSj24vsYGjSXIA4vrohz+Sdh0Fc0TbEBnFXd2
         24C18qkIK4eYvYdoo7oo1hRqS0FsOMVUZcrIKNK/aCmLrgK2mT9UnZPpu2h7NnfFw5MJ
         1MDQ==
X-Gm-Message-State: AC+VfDwVU3TFFmqlpQX5DOzSCvU892Ti3Pglnxnz6r1/8Rx2edmdMflj
	7Eauylcf0xb/VbD4KLIHs94q1HHbyBstPxbsHJI=
X-Google-Smtp-Source: ACHHUZ7nipEyeC+PnHzv07Va2KnoPi/V9x0BTOD92nCoVJKo2/wexksRBtUpspoRS1ozHUHnXgJ3tFaL0H3La5J6Vks=
X-Received: by 2002:a05:6808:7ca:b0:38e:c2a4:3530 with SMTP id
 f10-20020a05680807ca00b0038ec2a43530mr5022985oij.9.1683562465718; Mon, 08 May
 2023 09:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230507132349.10674-1-marex@denx.de> <20230507132349.10674-5-marex@denx.de>
In-Reply-To: <20230507132349.10674-5-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 09:13:59 -0700
Message-ID: <CAMKF1spAwPFozjiiVV2ZXKsMqQ6VaGr2t-k2A6mOSXQjc7fxPw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 5/5] lvgl: Upgrade lvgl-demo-fb to 8.3 and
 decouple from submodules
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>, 
	Philippe Coval <philippe.coval.ext@huawei.com>, Philippe Coval <philippe.coval@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 16:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102443

there is license mismatch perhaps as seen in this build

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2727

On Sun, May 7, 2023 at 6:24=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> The lvgl-demo-fb really contains its own copy of lvgl and lv-drivers,
> for which meta-openembedded already contains its own recipes. Stop
> pulling those as git submodules and instead only pull the example
> application, and compile it against the lvgl and lv-drivers from
> local recipes.
>
> Upgrade the lvgl-demo-fb to 8.3.0 to match the lvgl and lv-drivers too.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Philippe Coval <philippe.coval.ext@huawei.com>
> Cc: Philippe Coval <philippe.coval@huawei.com>
> ---
>  .../lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_8.3.0.bb}         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_=
8.3.0.bb} (72%)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb b/meta-oe/reci=
pes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> similarity index 72%
> rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
> rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> index 3430c2491..6d9ff89f5 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> @@ -5,8 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80e=
f5f343050bf96cce3a4 \
>                      file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045=
981b516bb8f2 \
>                      file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
>
> -SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
> -SRCREV =3D "dd010430b959f40b8f25a51c76bc920cbc2550cc"
> +DEPENDS =3D "lvgl lv-drivers"
> +
> +SRC_URI =3D "git://github.com/lvgl/lv_port_linux_frame_buffer.git;branch=
=3Dmaster;protocol=3Dhttps"
> +SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.39.2
>

