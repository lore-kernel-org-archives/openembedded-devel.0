Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C10C7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:14:19 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.4034.1683598451128412232
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fJADhvat;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-54fb509c4a7so495510eaf.0
        for <Openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 19:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683598450; x=1686190450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXmw4Hz6/Xugi+ArnPxy+PZK/rIrRDVEJ9Psqphb9z8=;
        b=fJADhvat51KhNzdCS27orNNH8nfNjU2YXWlSuh+4rD7FtEoI2eOqEecaudLVxkFuuD
         3MK6hwpBkQ2+N9YYAcg40EHl8fvwng/5zjw40SCmEN7m5zhIuwMtQgsrJImT9sIx+XUk
         ORVqpK2gMyNOztCQo5816KudUGffsg4C9xjVO7/nFraxtxEdFJjaszoj6rDU28oxV8uG
         2F77nXgbwZQLg0bR6yDbyr6svEwktcOSZfTR6FNezLuci3lcMfMbkUsfxFx6gZil44Ee
         enWodc30qxhDWcLxPIobmI2OpbA970TxnF2mb/PW08rIcU1N9ZDfHSYdim7hAcDxTJir
         WGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683598450; x=1686190450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXmw4Hz6/Xugi+ArnPxy+PZK/rIrRDVEJ9Psqphb9z8=;
        b=Jk0nA12+1lnCQU7XLWczqN778W7FVbg2NDK4dgsVRI9eLT+C3uibbO4fZOrK32mNSR
         OX0Wr7NE0GcYiX6ZyCid/eUItuuqe7yKOAGJzh4MR76duoW3dFQ/CFCISdsmn+oEJzd3
         ZqXGIyQDJN3wUSPkWR45wXteLyn0tK6ny5ymV7Pdliw4avwdwnoYvfwjdq7Pa6nJ5ZvY
         PPoGiC/UILHKXuvoAT5BjOF7YDoLGtlzL+fmfd2Mtxg2V+SujF6f3wroTqoCe3b0d5dx
         tfEkEZYVg7U1WwQp/VZgtZSyy0Jmhh9F0crS/aSuURX+jXq8yqB07eY5iWLGjI6+2QkI
         xlyw==
X-Gm-Message-State: AC+VfDwfA10eRV2PxpSta+qTP3N97pbDHD2694afmMXttY8asx24RoVq
	K7umzjyYRWi551V9QsF4HKdzrz/GMl2NNLk6Z1c=
X-Google-Smtp-Source: ACHHUZ5zUxl5d40iCgWge7fmYBt0WbkokTvgwrJnGNavagBoX6HKah94a2TtJkfwG89HdD96OQC+47Y7H8hnoafZeiU=
X-Received: by 2002:a05:6808:2895:b0:38e:60c9:9e0d with SMTP id
 eu21-20020a056808289500b0038e60c99e0dmr546723oib.6.1683598450161; Mon, 08 May
 2023 19:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230509015915.77182-1-marex@denx.de> <20230509015915.77182-2-marex@denx.de>
In-Reply-To: <20230509015915.77182-2-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 19:13:59 -0700
Message-ID: <CAMKF1srpymiiO36nnfAPgd-6J7ukysSfhqmBfgzd+wVTX9yQLQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/3] lvgl: Reinstate git submodules in lvgl-demo-fb
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <Martin.Jansa@gmail.com>, 
	Openembedded-devel@lists.openembedded.org, 
	Philippe Coval <philippe.coval@huawei.com>, Philippe Coval <philippe.coval.ext@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000090fdf205fb394f21"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102450

--00000000000090fdf205fb394f21
Content-Type: text/plain; charset="UTF-8"

Are these patches on top of previous ones ?
Or replacement ?
On Mon, May 8, 2023 at 6:59 PM Marek Vasut <marex@denx.de> wrote:

> The lvgl-demo-fb depends on specific configuration of LVGL which
> includes demo widgets, which as far as I can tell are not needed
> for regular LVGL application development. Reinstate the gitsm in
> this recipe temporarily, so it can again build its own version of
> LVGL and stops failing to build, at least until better fix exists.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> NOTE: I am almost tempted to drop this recipe, it basically builds
> two files against LVGL configured in specific way. And it seems the
> LVGL has no modularity support, so we cannot deal with packaging
> the extra widgets easily.
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Philippe Coval <philippe.coval.ext@huawei.com>
> Cc: Philippe Coval <philippe.coval@huawei.com>
> ---
>  meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> index 6d9ff89f5..d86d6ff9c 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> @@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=802d3d83ae80ef5f343050bf96cce3a4 \
>
>  file://lv_drivers/LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2 \
>
>  file://lvgl/LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
>
> -DEPENDS = "lvgl lv-drivers"
> -
> -SRC_URI = "git://
> github.com/lvgl/lv_port_linux_frame_buffer.git;branch=master;protocol=https
> "
> +SRC_URI = "gitsm://
> github.com/lvgl/lv_port_linux_frame_buffer.git;branch=master;protocol=https
> "
>  SRCREV = "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
>
>  S = "${WORKDIR}/git"
> --
> 2.39.2
>
>

--00000000000090fdf205fb394f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Are these patches on top of previous ones =
?</div><div dir=3D"auto">Or replacement ?=C2=A0</div><div dir=3D"auto"><div=
 class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, May 8, 2023 at 6:59 PM Marek Vasut &lt;<a href=3D"mailto:marex@denx.=
de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
e lvgl-demo-fb depends on specific configuration of LVGL which<br>
includes demo widgets, which as far as I can tell are not needed<br>
for regular LVGL application development. Reinstate the gitsm in<br>
this recipe temporarily, so it can again build its own version of<br>
LVGL and stops failing to build, at least until better fix exists.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
NOTE: I am almost tempted to drop this recipe, it basically builds<br>
two files against LVGL configured in specific way. And it seems the<br>
LVGL has no modularity support, so we cannot deal with packaging<br>
the extra widgets easily.<br>
---<br>
Cc: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=3D"_blank"=
>festevam@denx.de</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
Cc: Philippe Coval &lt;<a href=3D"mailto:philippe.coval.ext@huawei.com" tar=
get=3D"_blank">philippe.coval.ext@huawei.com</a>&gt;<br>
Cc: Philippe Coval &lt;<a href=3D"mailto:philippe.coval@huawei.com" target=
=3D"_blank">philippe.coval@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a> | 4 +---<b=
r>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a> b/m=
eta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
index 6d9ff89f5..d86d6ff9c 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D802d3d83ae8=
0ef5f343050bf96cce3a4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb8f2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62460b03a&quot;<br>
<br>
-DEPENDS =3D &quot;lvgl lv-drivers&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/lvgl/lv_port_linux_fr=
ame_buffer.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/lvgl/lv_port_linux_frame_buffer.git;branch=3Dmaster;=
protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/lvgl/lv_port_linux_=
frame_buffer.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/lvgl/lv_port_linux_frame_buffer.git;branch=3Dmaster=
;protocol=3Dhttps</a>&quot;<br>
=C2=A0SRCREV =3D &quot;adf2c4490e17a1b9ec1902cc412a24b3b8235c8e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--00000000000090fdf205fb394f21--

