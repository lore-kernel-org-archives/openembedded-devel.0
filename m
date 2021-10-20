Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D745C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:25:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.462.1634750713679829894
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KvyCf1Sh;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id q5so23128905pgr.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvzkJKhHkaHXXloide++LlSMA5KnXouzAXqaJ2OCUzk=;
        b=KvyCf1Sh9AqGiv2RUhOj7sLdFxnevXyw2dr8ljVHKsk7CGGLRWjDbF3RmPEoCs1U7c
         +yKmugMGxBYP7dASQZBqAjAiDzmo613TWrXqxVkWTRviO2P9IjoqLo3bSpH28PrEMLr1
         FetFKKEymSxTIfS0dkw4VkVUQdeHKlREZ7/WpWLoohidloEzIPG3FJv5hzmwZ/5CI1tG
         urAegn4HW/+gLlsIKakoa9YT57L9OxIdyVZT6+vSWQ8rSFXkixLgDUnlaAbOkexOEpv1
         kgsJjh87a1qJeP2OlKWWmLXdXydDFL015+cTskaF38PXgHPk5fO5D8WIsu53T6je40xc
         M70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvzkJKhHkaHXXloide++LlSMA5KnXouzAXqaJ2OCUzk=;
        b=2+L8TQ2KIs0cCTFFEw3Zwcm9qCd+dJUJMBKTPaiCoxNejJ4XnQayxKJEGnhpFmL2XQ
         4zLi6rCHEusK60/dM0oqHEHQo0tQ6B1clzc9gKUbMLAjVo79s0N6iaqS6yn5AYrUO1UU
         1ALmMwAjtLBC7AFFd9aaiseCxLSuBbkg+8lkDOF/YeLFbY3EIUrGZjBb/puxoWPuxfem
         eKntP6QAeXNgLP39gKLqG4eIm0ogNSZyFOv+NjbUPdUtW0cC3QyxgmFOkTc5nlwRaytq
         uz5UoqzL8Mto+6sY0riOaZfXJtXgFsYWHX8ekKHZ3Y8KVlOfVPLFBDoqA+H2o3tXHXtw
         QkvA==
X-Gm-Message-State: AOAM533cTw8qwLl3LxE23PUFLEQnZVxGZpanBMqsQBmRkNHbPabSZMGs
	rxFQPTODMR866wpGWUVXlSQATzknOXbewgN8Rdk=
X-Google-Smtp-Source: 
 ABdhPJwxDTTvsoywRcHTGrcO4oBamP1IwedO3M54U2r3uJXAOSs/Hz7SvK96xFPvg21iMQw7SnX/pMCoX9zoknTBw6Q=
X-Received: by 2002:aa7:9f46:0:b0:44c:7912:9b2e with SMTP id
 h6-20020aa79f46000000b0044c79129b2emr75928pfr.11.1634750713211; Wed, 20 Oct
 2021 10:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211020172214.394631-1-raj.khem@gmail.com>
 <20211020172214.394631-2-raj.khem@gmail.com>
In-Reply-To: <20211020172214.394631-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:25:02 +0200
Message-ID: 
 <CA+chaQd_VYdG-8EYfvgHAGTNEK5d-t_PJgMJuMHRn5W-_BZXxA@mail.gmail.com>
Subject: Re: [meta-python][PATCH 2/2] python3-kivy: Use new override syntax in
 RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	William Huang <whuang8933@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008eaf7705cecc0f83"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:25:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93493

--0000000000008eaf7705cecc0f83
Content-Type: text/plain; charset="UTF-8"

Thanks! <3

On Wed, Oct 20, 2021 at 7:22 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: William Huang <whuang8933@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> index d046489021..a4ec62626b 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> @@ -56,7 +56,7 @@ DEPENDS += " \
>      python3-cython-native \
>  "
>
> -RDEPENDS_${PN} = " \
> +RDEPENDS:${PN} = " \
>      gstreamer1.0 \
>      gstreamer1.0-python \
>      libsdl2 \
> --
> 2.33.1
>
>

--0000000000008eaf7705cecc0f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! &lt;3</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 7:22 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
Cc: William Huang &lt;<a href=3D"mailto:whuang8933@gmail.com" target=3D"_bl=
ank">whuang8933@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a> | 2 =
+-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
kivy_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a><br>
index d046489021..a4ec62626b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a><br>
@@ -56,7 +56,7 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-cython-native \<br>
=C2=A0&quot;<br>
<br>
-RDEPENDS_${PN} =3D &quot; \<br>
+RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gstreamer1.0 \<br>
=C2=A0 =C2=A0 =C2=A0gstreamer1.0-python \<br>
=C2=A0 =C2=A0 =C2=A0libsdl2 \<br>
-- <br>
2.33.1<br>
<br>
</blockquote></div>

--0000000000008eaf7705cecc0f83--

