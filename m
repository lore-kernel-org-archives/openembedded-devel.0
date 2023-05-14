Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28314C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 20:27:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.73957.1684096029381987752
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 13:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fmUSfdKf;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30786c87cdaso9221260f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684096028; x=1686688028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGmrveWkF9ZJ81jXy/olKHJbYKhh/zW9ONUpTiIj1v4=;
        b=fmUSfdKfcf8GqDOI9sOCiCG8uIuKj5snkG8MLulVu7pu2Ewg0dNtZdjw69HNNmsaks
         9MZ1p4jGdGZwgJYT6KC58EiazQq3Rn2hGujBpy3uMmXRkiu05XrdQV5fpx7uufDpgGnb
         TVcdAB3TkdE4tH32PZAy1o2qCbmm4diCbJlQzH/UmtJKFdCWrrc4XjoJ3FPKUe1b10Ty
         UGyH7cmCptnFxyGWHQhMH/7zm9lURuMGZmLN9jEajOrc0n1wF0GFYLkLcP5KV6UMzN8h
         kS6t1dtjnQEukFwBvtQjfkw3ZW+WjSrfFHUaTcEQn7Kvb2c68WLQh/Tsi5CR1lr8It5j
         vHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684096028; x=1686688028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGmrveWkF9ZJ81jXy/olKHJbYKhh/zW9ONUpTiIj1v4=;
        b=k+a3nTUo9xjpyWu6AxPUDoDQTrJXztbEPzpiMtUdcatj42/Afd5u5cHcf+Mki+h2Nn
         Q3wof6FVDi59D2UxcFjh9JQ56Dk9i4Rh29p5+EARrigh8Xjb1kAPbr9JKuW4N8z4i/fz
         6TGGxcev0nb+wwHS7kCxQZmp1gtPPhctZt1pNps6jtCoilsa3QMVswxTRjsISf6J409j
         dLjnJla4YQTaLh53JnZfaViC2tf807rdaVCDXJIh8ZtqpjOP2umClqlyO3gwW9s9vvCW
         8qJjJMdceQ7YodpZkVf2Jr5OmQCVEkxatUrwJ+dkRZuWpihPX0v9ht3/u46I77/H6l46
         lRHw==
X-Gm-Message-State: AC+VfDzUnlikPyw5PTZQR78EbZ005gFsVCb3p05Z8fYPTFMPD/6ly70+
	u11S8XNMzH4xEQN0azQj06HLzs9uLUlPLqRSdes=
X-Google-Smtp-Source: ACHHUZ7XnTkrHfINfzTMrOSJALcdGWWr+na12/OQ1RBb144AjplTEoGYSfVk8WwLJRKmootzYWvQy2XG/t23d+zQx2I=
X-Received: by 2002:adf:fccd:0:b0:2f5:7e67:9c68 with SMTP id
 f13-20020adffccd000000b002f57e679c68mr25157524wrs.30.1684096027574; Sun, 14
 May 2023 13:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230509024355.79006-1-marex@denx.de> <20230509024355.79006-7-marex@denx.de>
In-Reply-To: <20230509024355.79006-7-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 14 May 2023 22:26:55 +0200
Message-ID: <CA+chaQePfn6PG-_T9J=OdU49ALNt0KtuA7taOVddJHGFe=4P6A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 7/7] lvgl: Add dependency on fbdev into
 lvgl-demo-fb DISTRO_FEATURES
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>, Khem Raj <raj.khem@gmail.com>, 
	Philippe Coval <philippe.coval.ext@huawei.com>, Philippe Coval <philippe.coval@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000007dc38205fbad29de"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 20:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102587

--0000000000007dc38205fbad29de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is missing the features_check inherit causing:

ERROR: QA Issue: lvgl-demo-fb: recipe doesn't inherit features_check
[unhandled-features-check]

On Tue, May 9, 2023 at 4:44=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:

> This recipe hard depends on fbdev, since it specifically targets
> systems using it. Add the DISTRO_FEATURES dependency to indicate
> it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Philippe Coval <philippe.coval.ext@huawei.com>
> Cc: Philippe Coval <philippe.coval@huawei.com>
> ---
> V2: New patch
> ---
>  meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> index d86d6ff9c..8e0b91cac 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
> @@ -10,6 +10,8 @@ SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
>
>  S =3D "${WORKDIR}/git"
>
> +REQUIRED_DISTRO_FEATURES =3D "fbdev"
> +
>  EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
>
>  do_install() {
> --
> 2.39.2
>
>

--0000000000007dc38205fbad29de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is missing the features_check inherit causing:<div><b=
r></div><div>ERROR: QA Issue: lvgl-demo-fb: recipe doesn&#39;t inherit feat=
ures_check [unhandled-features-check]<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 4:44=
=E2=80=AFAM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his recipe hard depends on fbdev, since it specifically targets<br>
systems using it. Add the DISTRO_FEATURES dependency to indicate<br>
it.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
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
V2: New patch<br>
---<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a> b/m=
eta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
index d86d6ff9c..8e0b91cac 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl-demo-fb_8.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lvgl-demo-fb_8.3.0.bb</a><br>
@@ -10,6 +10,8 @@ SRCREV =3D &quot;adf2c4490e17a1b9ec1902cc412a24b3b8235c8e=
&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;fbdev&quot;<br>
+<br>
=C2=A0EXTRA_OEMAKE =3D &quot;DESTDIR=3D${D}&quot;<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--0000000000007dc38205fbad29de--

