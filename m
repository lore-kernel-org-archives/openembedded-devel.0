Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFFBCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:52:07 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5874.1778701920971913947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 12:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a9/BXXui;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64e87a81639so8286229d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 12:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778701920; cv=none;
        d=google.com; s=arc-20240605;
        b=C7bfcamNRoHI8Y3AMmkradxYTDhuD/KtvVU4ul0R2FYOdex9t62kRvvx55sqMWvVqN
         TdnouUalhUvwIgUdUzBouzysr2i+EzyC2++UvUWCgmNnFChQBXWsIYlAeUvv7cYiR1hT
         ffKNVkMWzp1dE0cJbIftAVsbQRuL1+T+F8P+ngnc/IbaD+QgIpckcjWpBX9k7IyOcPwq
         t87Z8DPmBmM/sfyj06qFfpyS+c61vaUIThz78xqbCi6tbbGApKwZTqSgp+NoMb+bmiYZ
         CuvBjX/xtCjdaLwkFHm26GXxT1+lNsFnV8ST2t3mk+JxOOiEDl2d92F5ROEOuAR8am0T
         UNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Df2M3yqJdq+erxcg6Z7ZXdrcSmMJU3p8mjbZBV6e4Vk=;
        fh=hOOZNshoD7E+ZlkLLUqqnV9XtxlbdrhypBmJDQPY6KI=;
        b=frT1iD8pBp6I6KsyNmlznleln4+RynCSSLiuX8LGwH92uNuCV5ayG92iGVbdSchp8z
         97rAry5NVss8KZzgDnXzJK9QLxdk/FVBGnEHz5hwIhBITk5nzgVzlCS8HQDUtaeMALf2
         kBhOed41KK7kdE1SBbbqXxYSnuQjCiPaEHiTJD/0dkzW7eoxaeCwMRJ1288jzdq4gPso
         0w7f7t4cjK5Pfz53dGUNS844EfVN37c4kpjO+1bNrUtSm1vpZn3m8MxpRN3YLBtjo5Oq
         5fg3M7BeYA0+XQm0KBvrBKdmDacyi9d9U5zMlQDq2N/0Hps1oBqRtB4/fD8UGcs5vXK3
         0pVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778701920; x=1779306720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Df2M3yqJdq+erxcg6Z7ZXdrcSmMJU3p8mjbZBV6e4Vk=;
        b=a9/BXXuiqsbtVGILU7gJ999eFNs2nrcLPRVgFbC/FrsMPF7il5SO/uXHcG4qfOEqEE
         G1BGFYxSihkRXk+8B/Ettihej8Edxi5fK7PQ91V2/W/HpHW6JKpZE3XbHScC8f/VYG95
         KlBgOaAZbuC+5Dtg+1OkLY77Iqs/FMaD91Fna+RK3OI94aiB7Q5EEWYepU5FYwPknYTs
         8c6f5UnIvqEU8it0ASCqS9PEjqImWuDn1hjywjJzvnIeySOHUn95HCHa3hAqmX9aU3Bl
         1ET5IWrUx0FToxJMLivHxh97iwi1oPvFj/St38iSmI/3xB8cOyK30NIL2zLWRkAptcsd
         HznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701920; x=1779306720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df2M3yqJdq+erxcg6Z7ZXdrcSmMJU3p8mjbZBV6e4Vk=;
        b=ftz1HdysP37HNmtHjgueZ8Kd8p5N+Gczl7mJSQmAw9dVjZ2jqcxBXLkVWsjje7Sm5r
         CeilB/HrGInS1K2QUyOZ9urYU6SyCDMINSxAyBhrMf4CdjC0ChDeX7fLK36h6Hyq7UBa
         E2200Z3UhCUE7lcQFq3waeDtkc+EImcmZtWDhlrF5ZjKGnJqDBM8ZGMKHiSmY75wYv2m
         /69ydajxFb4OCIUTbIatVwJnDO4dTfLUHvtJCqZzA3Z29pd1E5ZLEPfLdVIH5Z5zBowd
         1KFoU/BCV6FEW/uUWQyNXGljO/5bb9arkE2pcUxFMoDZ5yBrB+74CizA94opZQeelJ+M
         TpYQ==
X-Gm-Message-State: AOJu0Yzex9ZNnGI7AfzpctkczfLyI0LzQVEP7vqsOKjSax0vlS+yyQ/R
	CTghR8PL/hSFTTH6+AdSUwEWE0vn//LCbZDuoqn2fuq73Gsz/aKB8w39QNBMuevAAW8L/BYID1u
	21OL20J33bgIAXV0gp7dAn+TbtVIS/1fyADv9k+0=
X-Gm-Gg: Acq92OFIvJHLbnxi9nEmXTlmEbE9NThNYiIHZlJqQhzCgTZYXIO+xnknIeaU2jHHCS4
	QKSfJbCZahV/G61LI8C9YiqXihh+dnpSFZKIauMf7PlqYF32sS4/ONWXGZ9Ikv4441ei+pMORjw
	qyyNsn3UhFdVTblX4sBFjMFjyjbRIi2DSmnjkqVQ0XfwlG001jdjhno0V278W5Ig8k+/MLFErJ/
	UmefDjpuRANSeQVuPsvml9aHATyhA1hKGypx4K2Qn9p93aEt/sObEeYVbswdVL2QGoU3Nhd8jCV
	XfGrLLl/2Mcjce8xnuKFFOcIeijodV66WDziSZnJCq6ghE+g0NNBHkLVEACrOzQbm6Ww5+9QrJg
	Uj06PSCRohAWOLQeSRt58062+3LrdYGyqHl+De1T35aw9xtxf3qi/VvEXH7nj2KltXpz296BB4x
	z88zFe
X-Received: by 2002:a05:690e:4290:10b0:651:bf58:446b with SMTP id
 956f58d0204a3-65df8102f23mr3445291d50.10.1778701920053; Wed, 13 May 2026
 12:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260513040555.377-1-wangmy@fujitsu.com> <20260513040555.377-20-wangmy@fujitsu.com>
In-Reply-To: <20260513040555.377-20-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 12:51:48 -0700
X-Gm-Features: AVHnY4JRvSwa-MGD-8vJiyFqeucNxnPRFFJVAFfCYx9ZkDfSAHnZYBqvxEVFFYE
Message-ID: <CAMKF1spF65ovYF=n45R8f+fFOKQ3B8jnyt_wBwJ4LMBFSqSR7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 20/56] magic-enum: upgrade 0.9.7 -> 0.9.8
To: wangmy <wangmy@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b2dd80651b850d2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 19:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126977

--0000000000001b2dd80651b850d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wang Mingyu,

Do we need to keep "+git" for PV in this upgrade?

Best regards,

Khem Raj


On Tue, May 12, 2026, 9:10=E2=80=AFPM wangmy via lists.openembedded.org <wa=
ngmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../magic-enum/{magic-enum_0.9.7.bb =3D> magic-enum_0.9.8.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.7.bb =3D>
> magic-enum_0.9.8.bb} (95%)
>
> diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
> similarity index 95%
> rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
> index 958ae21065..2243ca4e00 100644
> --- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> +++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>  "
>
> -SRCREV =3D "7d87efb4a3dddbbe8caa9ca14eff05ede1102ab8"
> +SRCREV =3D "1384769c66bd16ec9bb1353f45fe8ec8ccc12dbd"
>  PV .=3D "+git"
>
>  inherit cmake ptest
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126905):
> https://lists.openembedded.org/g/openembedded-devel/message/126905
> Mute This Topic: https://lists.openembedded.org/mt/119292622/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001b2dd80651b850d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Wang Mingyu,<br><br>Do we need to keep &quot;+git&quot=
; for PV in this upgrade?<br><br>Best regards,<br><br>Khem Raj<div><br></di=
v></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 12, 2026, 9:10=E2=80=AFPM wangmy via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wang=
my=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.co=
m" target=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../magic-enum/{<a href=3D"http://magic-enum_0.9.7.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">magic-enum_0.9.7.bb</a> =3D&gt; <a href=
=3D"http://magic-enum_0.9.8.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">magic-enum_0.9.8.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/magic-enum/{<a href=3D"http://magic-e=
num_0.9.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.=
9.7.bb</a> =3D&gt; <a href=3D"http://magic-enum_0.9.8.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">magic-enum_0.9.8.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-en=
um_0.9.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9=
.7.bb</a> b/meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-enu=
m_0.9.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9.=
8.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-enu=
m_0.9.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9.=
7.bb</a><br>
rename to meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-enum_=
0.9.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9.8.=
bb</a><br>
index 958ae21065..2243ca4e00 100644<br>
--- a/meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-enum_0.9.=
7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9.7.bb</=
a><br>
+++ b/meta-oe/recipes-extended/magic-enum/<a href=3D"http://magic-enum_0.9.=
8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">magic-enum_0.9.8.bb</=
a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;7d87efb4a3dddbbe8caa9ca14eff05ede1102ab8&quot;<br>
+SRCREV =3D &quot;1384769c66bd16ec9bb1353f45fe8ec8ccc12dbd&quot;<br>
=C2=A0PV .=3D &quot;+git&quot;<br>
<br>
=C2=A0inherit cmake ptest<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126905): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126905" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/126905</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119292622/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119292622/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001b2dd80651b850d2--

