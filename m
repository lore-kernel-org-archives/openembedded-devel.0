Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F402FC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:32:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.22498.1669131125809307715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=google header.b=eKGK2PE0;
 spf=pass (domain: gherzan.ro, ip: 209.85.218.51, mailfrom: andrei@gherzan.ro)
Received: by mail-ej1-f51.google.com with SMTP id me22so20059382ejb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 07:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DSb5GXIWVE6zJSfXT+O0twRJ+VSaYAwKD05OTsR+TkM=;
        b=eKGK2PE0ltD056AVHwKHM46B/G01AgMgKc4tnlIHYC5vvQ5sQLm19jySV5hRJupuiM
         mtenJbq0CVkMHptQMtREmL47APC3KxdJtsQ6n7YNTQxYAQ1AoeR15LRANoGgbkRBc0IQ
         JZE4+eM87AG97sG5oAlEgMd0hvW1zpSP2qigcGPREaxHD6wLpjtt+3EtnqQYx621VueJ
         o1PsfaBNmdjP5+e1drUwt16qAH5drzdd5F0qzTiy6ja780nzPGsxuvbu+iCHp9xNoyfS
         04/PdxuwGXkYam3249kYAZVCMz9pw60rGfMpDQWPo/G8agfMiNmdlX5sGyA0mZNrz7Wt
         fg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSb5GXIWVE6zJSfXT+O0twRJ+VSaYAwKD05OTsR+TkM=;
        b=afMCGtwNd1Vq0QqsQES2NZnxAhm7/4onhHmrMRp5KGgUY/WBtfrh7rTCtr3HT4L+4W
         VSTYZrVmmMLY76+2w+C13RzA/rAB1YrfSry1whSDIzaQ2cHpiSr2QUmfAmVzQrtzJEOS
         sz09uumnMqCB4+8xrmaB8EIYge5s5XlspmvkeWCLxavaPruNsZlLTpKRtLZYTGkt1mNy
         5NbhCYnF2LLxu6JD5PrzlzE58xT4s6tQmskKv7V9XPaor7l5UWCI8kyjtYKD/c+hq9zB
         eybKw6qLqcj+0uzrSKDe4chzV9p/Rx5SQFQINgkmOLYAuTIH/Z34ljNoHHQpSktc5Z8V
         uN7A==
X-Gm-Message-State: ANoB5pnv+RctiEv/AswF9EafiBi4CUmmlIM+VGDPxLje1vDzwVsgCgZ+
	vZhZ2bcxE/595L/O+YdAMXP0pI8NsPYHCV87e/2kdQ==
X-Google-Smtp-Source: AA0mqf6MI4pO5bCNZlA0SMjlEtLmy1uKuFfJCbVWtX3PRlMy2QNSXKWzMwbpsNN5ueFNPZ19h7pHJiyJjxRUc4Cmp2E=
X-Received: by 2002:a17:906:2e82:b0:7ae:44b2:cb7f with SMTP id
 o2-20020a1709062e8200b007ae44b2cb7fmr6206247eji.437.1669131124013; Tue, 22
 Nov 2022 07:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20221121075858.372-1-changhyeok.bae@gmail.com>
In-Reply-To: <20221121075858.372-1-changhyeok.bae@gmail.com>
From: Andrei Gherzan <andrei@gherzan.com>
Date: Tue, 22 Nov 2022 15:31:27 +0000
Message-ID: <CAK18fxH2Wg1+fkoFDHeMLz4sr4MA9ihhsirZ+Mw4cWYnMsmLyQ@mail.gmail.com>
Subject: Re: [kirkstone][meta-raspberrypi][PATCH] rpi-config: Set
 vc4-kms-v3d-pi4 in VC4DTBO for pi4
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb228c05ee10dfba"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 15:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99687

--000000000000bb228c05ee10dfba
Content-Type: text/plain; charset="UTF-8"

Hey Changhyeok,

Thanks for this,

On Mon, Nov 21, 2022 at 7:59 AM Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  recipes-bsp/bootfiles/rpi-config_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-bsp/bootfiles/rpi-config_git.bb
> b/recipes-bsp/bootfiles/rpi-config_git.bb
> index d9d8bb0..bcff0fe 100644
> --- a/recipes-bsp/bootfiles/rpi-config_git.bb
> +++ b/recipes-bsp/bootfiles/rpi-config_git.bb
> @@ -25,6 +25,7 @@ PITFT35r="${@bb.utils.contains("MACHINE_FEATURES",
> "pitft35r", "1", "0", d)}"
>
>  VC4GRAPHICS="${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "1",
> "0", d)}"
>  VC4DTBO ?= "vc4-kms-v3d"
> +VC4DTBO:raspberrypi4 = "vc4-kms-v3d-pi4"
>

First of all, this should first go to master and afterwards propose a patch
for kirkstone. Could you do that via a GitHub PR?

Thanks,
-- 
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640

--000000000000bb228c05ee10dfba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hey Changhyeok,</div><div><br></div>=
<div>Thanks for this,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Nov 21, 2022 at 7:59 AM Changhyeok Bae &=
lt;<a href=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com" t=
arget=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-bsp/bootfiles/<a href=3D"http://rpi-config_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpi-config_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-bsp/bootfiles/<a href=3D"http://rpi-config_git.bb" rel=
=3D"noreferrer" target=3D"_blank">rpi-config_git.bb</a> b/recipes-bsp/bootf=
iles/<a href=3D"http://rpi-config_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rpi-config_git.bb</a><br>
index d9d8bb0..bcff0fe 100644<br>
--- a/recipes-bsp/bootfiles/<a href=3D"http://rpi-config_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpi-config_git.bb</a><br>
+++ b/recipes-bsp/bootfiles/<a href=3D"http://rpi-config_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpi-config_git.bb</a><br>
@@ -25,6 +25,7 @@ PITFT35r=3D&quot;${@bb.utils.contains(&quot;MACHINE_FEATU=
RES&quot;, &quot;pitft35r&quot;, &quot;1&quot;, &quot;0&quot;, d)}&quot;<br=
>
<br>
=C2=A0VC4GRAPHICS=3D&quot;${@bb.utils.contains(&quot;MACHINE_FEATURES&quot;=
, &quot;vc4graphics&quot;, &quot;1&quot;, &quot;0&quot;, d)}&quot;<br>
=C2=A0VC4DTBO ?=3D &quot;vc4-kms-v3d&quot;<br>
+VC4DTBO:raspberrypi4 =3D &quot;vc4-kms-v3d-pi4&quot;<br></blockquote><div>=
<br></div><div>First of all, this should first go to master and afterwards =
propose a patch for kirkstone. Could you do that via a GitHub PR?</div><div=
><br></div><div>Thanks,</div><div><div><div><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div><div>--=C2=A0<br></div><div>Andrei Gherza=
n=C2=A0<br></div><div>gpg: rsa4096/D4D94F67AD0E9640<br></div></div></div></=
div></div></div></div></div></div>

--000000000000bb228c05ee10dfba--

