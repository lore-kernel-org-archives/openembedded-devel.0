Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAE1C04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:08:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.1881.1690996082423960719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kdSNf8Nn;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-317744867a6so32503f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996081; x=1691600881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bihkq6gt313azzZzhTbGKD4egT6Zf1rSA3BVJfSR2rk=;
        b=kdSNf8Nnwvl9WoRuY4GvJnTBgd9R/PtaUiuUgYWwPxK405RVZTfU7SlyRgleUtlOti
         04rEPCIydf4ZXPmmNDxOJvdM+nqKVSJHPBKx8eytLUg0Si9FGlB1KcwAGC1Pe7SP1ayc
         d8F16aGNFbpd0xPm9E8nn7wSVWihwrO/e3ZWtaYXROCVf1cbObEOWlvqzBjRfdQ5jy8x
         uBlFW9us0xcSXNG84JuN0mH3R1oKdZARCcEqBsJXkH8yvuHWX3t9ifkvH2jddudA9Mnc
         C4ZpSeYO900kF42GbpIQybYUY5hc8M8vxwzEBCkcrOIRgF24ldZG/ymMYDvKH4Giqw4k
         ql6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996081; x=1691600881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bihkq6gt313azzZzhTbGKD4egT6Zf1rSA3BVJfSR2rk=;
        b=M1uwXtGqQRNOM7ACFBQaREU77ulkfcAP8yDHLdogXptSj89X7O6RrLj/xcxVgLfGj8
         SRj0xD+Erh/EKWYD5YCJWLKTpDw53DpqFiFCynC4dwCYX75jFUHZVucara6fzKNAkvkY
         QJaCtm0gFPTsEZ9GM514/iW2ZLZj4hl0PNHsPl0UV/SIFqdQGCcu1dEASJFTq1ajGucF
         EgKmYbVPJHEp4jaezVAJQRrIsKlU3/tF6ogp690nFvVzUyYfHl4wE0uSotNLo1WOn+dH
         QRyIoEhMuIkTkluIw1MdqDJouO4k+EPE5F0gJPJPC5at7/yawV2gk4QH19/sjB+lebsS
         12jA==
X-Gm-Message-State: ABy/qLaDZKExS4UVGkuDWgJaPQmVYqZV5VXqM9m6FlZarJCmenfEOdfy
	vEXWzyX+GJFPWkaL+QI58m2xL1R2+unKjt+9Csw0NirM
X-Google-Smtp-Source: APBJJlF/pHBJq3MjTmkF1ytWlzHvregnA/kSw094bGovu9zdVrBkEvXKKkSMzUucmQgV5UIlFRKWkGjtUWgfPBxRx04=
X-Received: by 2002:a05:6000:1206:b0:317:6ff6:fe93 with SMTP id
 e6-20020a056000120600b003176ff6fe93mr5624664wrx.47.1690996080548; Wed, 02 Aug
 2023 10:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170036.9288-1-Robert.Berger@ReliableEmbeddedSystems.com>
In-Reply-To: <20230802170036.9288-1-Robert.Berger@ReliableEmbeddedSystems.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Aug 2023 19:07:43 +0200
Message-ID: <CA+chaQc-bPFrjQTgJifGf7KF3wo=Uf6V9ibKrDYQeTFi72sJ3w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] replace /usr/bin/env python -> python3
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Robert Berger <Robert.Berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="000000000000b2a2080601f3b4a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 17:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104205

--000000000000b2a2080601f3b4a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does it work when you re-execute do_configure or do you get python33? I
think you should anchor the regexp with '$'.

On Wed, Aug 2, 2023 at 7:00=E2=80=AFPM Robert Berger <oecore.mailinglist@gm=
ail.com>
wrote:

> Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
> ---
>  meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
> b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
> index 4e1edc6ce..851acd745 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
> @@ -30,6 +30,7 @@ EXTRA_UFTRACE_OECONF =3D "ARCH=3D${@set_target_arch(d)}=
 \
>                          with_elfutils=3D/use/libelf/from/sysroot"
>
>  do_configure() {
> +    find . -type f -exec sed -i 's/#!\/usr\/bin\/env
> python/#!\/usr\/bin\/env python3/g' {} +
>      ${S}/configure ${EXTRA_UFTRACE_OECONF}
>  }
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104204):
> https://lists.openembedded.org/g/openembedded-devel/message/104204
> Mute This Topic: https://lists.openembedded.org/mt/100509860/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b2a2080601f3b4a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does it work when you re-execute do_configure or do you ge=
t python33? I think you should anchor the regexp with &#39;$&#39;.</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, A=
ug 2, 2023 at 7:00=E2=80=AFPM Robert Berger &lt;<a href=3D"mailto:oecore.ma=
ilinglist@gmail.com">oecore.mailinglist@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Robert Berg=
er &lt;Robert.Berger@ReliableEmbeddedSystems.com&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/uftrace/<a href=3D"http://uftrace_0.13.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">uftrace_0.13.1.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/uftrace/<a href=3D"http://uftrace_0.1=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">uftrace_0.13.1.bb</a> b/meta-o=
e/recipes-devtools/uftrace/<a href=3D"http://uftrace_0.13.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">uftrace_0.13.1.bb</a><br>
index 4e1edc6ce..851acd745 100644<br>
--- a/meta-oe/recipes-devtools/uftrace/<a href=3D"http://uftrace_0.13.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">uftrace_0.13.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/uftrace/<a href=3D"http://uftrace_0.13.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">uftrace_0.13.1.bb</a><br>
@@ -30,6 +30,7 @@ EXTRA_UFTRACE_OECONF =3D &quot;ARCH=3D${@set_target_arch(=
d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0with_elfutils=3D/use/libelf/from/sysroot&quot;<br>
<br>
=C2=A0do_configure() {<br>
+=C2=A0 =C2=A0 find . -type f -exec sed -i &#39;s/#!\/usr\/bin\/env python/=
#!\/usr\/bin\/env python3/g&#39; {} +<br>
=C2=A0 =C2=A0 =C2=A0${S}/configure ${EXTRA_UFTRACE_OECONF}<br>
=C2=A0}<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104204): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104204" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104204</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100509860/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100509860/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b2a2080601f3b4a2--

