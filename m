Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C85C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:05:23 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web11.22643.1683277516248782237
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 02:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iJPZ1jja;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-44fa585ad7aso1055009e0c.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683277515; x=1685869515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ry1OX56gBsPL7lf7OFHJ/o8/QJptjVK1A4T4rcLjwxQ=;
        b=iJPZ1jja10vGygg44wqp00ine4GkqCVVLexLnVHePKci2BGz+xV8xQ3B5W27KTCWQ3
         a+9Xpgo534B10O3LoxWT8n6SFv5pyLI/A28RKdc/aZy5J/xsF9EUDx32sEQg1HCjOyLo
         1Xkfchyq5TK+LSCNdYilm+0KXZ1yXAoxuZ4sKw2JxCT91Yn/FGtExr7fJ/flr2BvmHvl
         VsbxWCmWEqk+KxX/FDZxLIIY67cWKlWHj8fs/fFgDRo+5T0tqXIu94Mz7pflXjUdiIFw
         Vm6z2DEMEw4Gg/YoMArZ9VksRaRCErCdaVGQW1KhVJwBC28+J1Rt9JkS/cPx7qmUqyg5
         nrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683277515; x=1685869515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ry1OX56gBsPL7lf7OFHJ/o8/QJptjVK1A4T4rcLjwxQ=;
        b=e0Va5Svs7I9w0zjhPhw3hKHLZH6N8V7tROPMZ8+HU4HD4iGJF246ICo7o4PiqT7KVa
         IGmg74UEYbzDFUpyBGHtvH+5zLbdbgUf7Fp9hzbQpssHcT9HPQazTIu6EZ972ULaV6Em
         aIbZOG+lyXC6H2P4IMopo/TrE4x6CLWZp7ZBhkS9AmW4j1jlJ1bqtpPxDEnCGWOiyclL
         KSm/oS/dV5NyH4VH539Bn3j6DyToSXfTVy4esgqt9hLrYh+ivLNBkFKfB4g2ilS3Egzw
         62VrDWnopQ2fx4CziGHIVah3SSJZbKeJGaSHUWZdS0MCrsIEAQoPA8/g20lWTUk5sMxQ
         mk7g==
X-Gm-Message-State: AC+VfDyYAQzzWH8psNEVvgTe0VB9y6OtKHNMkY4H/a6MLRnkR4QscTrM
	KplupTe4UoU2wqoQzvE5uxg4itlMptoCM+t2cgzzQli9Zh4=
X-Google-Smtp-Source: ACHHUZ4EdencWb2ieWBfh8Vl5Wo2K3YbgwYU1oMHGPEHSM+YH2NKzpfN2HucZLx3sKeaP3TR/Ujshfy96NVr3Zs4eYs=
X-Received: by 2002:a67:ebd6:0:b0:430:162b:deed with SMTP id
 y22-20020a67ebd6000000b00430162bdeedmr249236vso.20.1683277515173; Fri, 05 May
 2023 02:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230505072710.666230-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230505072710.666230-1-xiangyu.chen@eng.windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 5 May 2023 10:05:04 +0100
Message-ID: <CANPvuRmNPikxvkTOkw8_HRXKtnWKVQMjgrxwy1NndB4D3f7ZcQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] pahole: fix native package build error
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059b33c05faee9634"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 09:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102317

--00000000000059b33c05faee9634
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xiangyu Chen <xiangyu.chen@eng.windriver.com> escreveu no dia sexta,
5/05/2023 =C3=A0(s) 08:27:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> pahole-native package needs some uapi headers such like linux/btf.h,
> otherwise it would report error as below:
>
> btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98struct
> btf_enum64=E2=80=99
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> index 2bb73c3eb..93ee7f30f 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Shows and manipulates data structure layout"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -DEPENDS =3D "elfutils zlib libbpf"
> +DEPENDS =3D "elfutils zlib libbpf linux-libc-headers"
>

If it is only needed for native maybe using class-native is better:

DEPENDS:append:class-native =3D " linux-libc-headers"

Jose


>  # Depends on MACHINE_ARCH libbpf
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102316):
> https://lists.openembedded.org/g/openembedded-devel/message/102316
> Mute This Topic: https://lists.openembedded.org/mt/98700913/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000059b33c05faee9634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Xiangyu Chen &lt;<a href=3D"mailto:xi=
angyu.chen@eng.windriver.com">xiangyu.chen@eng.windriver.com</a>&gt; escrev=
eu no dia sexta, 5/05/2023 =C3=A0(s) 08:27:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:xiangy=
u.chen@windriver.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<=
br>
<br>
pahole-native package needs some uapi headers such like linux/btf.h,<br>
otherwise it would report error as below:<br>
<br>
btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98struct b=
tf_enum64=E2=80=99<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb" rel=
=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.=
bb" rel=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a> b/meta-oe/recip=
es-devtools/pahole/<a href=3D"http://pahole_1.24.bb" rel=3D"noreferrer" tar=
get=3D"_blank">pahole_1.24.bb</a><br>
index 2bb73c3eb..93ee7f30f 100644<br>
--- a/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb" rel=
=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a><br>
+++ b/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb" rel=
=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a><br>
@@ -3,7 +3,7 @@ SUMMARY =3D &quot;Shows and manipulates data structure layo=
ut&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7ab=
aabaa882bbe&quot;<br>
<br>
-DEPENDS =3D &quot;elfutils zlib libbpf&quot;<br>
+DEPENDS =3D &quot;elfutils zlib libbpf linux-libc-headers&quot;<br></block=
quote><div><br>If it is only needed for native maybe using class-native is =
better:</div><div><br></div><div>DEPENDS:append:class-native =3D &quot; lin=
ux-libc-headers&quot;</div><div><br></div><div>Jose</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0# Depends on MACHINE_ARCH libbpf<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102316): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102316" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102316</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98700913/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98700913/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000059b33c05faee9634--

