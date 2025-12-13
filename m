Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7EBD59F70
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 06:26:58 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1098.1765607210613336133
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 22:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZ1rqzw3;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78c4aa7af99so21467787b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 22:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765607209; x=1766212009; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AxDom9BES25uZGX0uOId7spHjUvvTjE+ALYKIhIy1G4=;
        b=AZ1rqzw3mQoqkv2Uyn+V8bCXQyNMRD6GOm9FEkI+1a0o7FnjmyzPzaw3YWvE3ke0b3
         O0lFvIp+1WSxHB5cfouwT+mfPIdk/bhX/e7ooGDlsYa8gBzbomPNISEO+rgRt0g/DZhb
         6IxAb2hNwp9MyBNXRYcvH2RkkIM87GTGMNJh9lrZybNKK8MOgGzMtTmuvUbrGlTKotIz
         awVnn6f6bov3mPuY42ByffRVFCaaK/R8Cq3owRKI5Sljt6vbi/9GdYLWLO/PXV+rlWoi
         HV2qaCBLDIManTvNXkrIN1ToSh1HF5VTqSCaZu9f62qTdiRg49BV+5SZz3ypSRIoJjor
         qwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765607209; x=1766212009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxDom9BES25uZGX0uOId7spHjUvvTjE+ALYKIhIy1G4=;
        b=Hgvh6fS68+LmaUm1/KqOKr/pMk1u/rvW7nBBDyP53ffq/JcTAIBvmgnjFIHm3ZHUMc
         JtUo5I5Sn5xSl5ell3DZKCcwTNgnWgoM2MwCrYWRNhTX+428XK9vqLw/cUdCMLnT4HZ7
         uHBv5yn1li3CukA6usSK6hFrxu7ok0iNKBMV70WqQp2PfM9SMyRc5rJ8YdfV+4aKokxP
         RByiFfLf1xUClMdOTOvadUEjdkgrDCHVa5yQZR5w4F4eQcPeR57XNMZiCtostL71WuVq
         ssXB1wX2PYPGMNx2IxL1mRxU8dS48BSTeOjFPOtO9Be3xCej7PEuJ3MzQgsTjUEJTu+m
         5o2A==
X-Gm-Message-State: AOJu0YxwgbOJYGrUhEFnUPuJqzL4oLQS3Dx0bDSKQPG59rTwHP+WufcR
	Z/pB0sm/dyDgIQwngASnt7y9L3Z4l++g2q8CRfBkI5mlIfACw3NIrTHzlrmwd7eImu7m0MQGe3y
	RlQqeeX3Lc4m3phYldT5z4sff40m4uPf8vKIr
X-Gm-Gg: AY/fxX5fcPrDToWG95FiY5QVfwVjProMQ5KxwatChAXEzWvRwddNmJT6dNfnJeYHho0
	4GoygdR2AYEnpPsmsqeea0D+8CnjZGJ6nVT/X/VJQ9pE0E/kEwZ+Ic2YUnTgEZWTYKuip6gy8IT
	xAoFur3HnchXCExUDdT61ZhDSx9EBhF8y4E39VrEHB4oe1kQHWqpuP0zWJlf30ZAxNoUVGGtPzg
	wzemun4n7bX5Vazs+5i1p5aB9aW8FOs/cS0HhLUX1BDYt4aWgUCMdQ/Oz9c6Y/kLDV/jlIrUuIs
	CIOCwPHd8gzqStp/W7zSa8FtHZg+NMrcnViiBVdHMADZ1BKxxkn/P2Qfi/NPfQzH8qIFlh1tqMR
	vJGmguXtxu6XTZOmyNA3CixvYsgo=
X-Google-Smtp-Source: AGHT+IGqFISiUT3gJQz02CsGxUBhVm28Nr6sgD48Re3BvrVB4s+74C9k7aHQN7CJOV+kYh9U5BX/drRpNOufDPnN75M=
X-Received: by 2002:a05:690c:6206:b0:786:5620:fad8 with SMTP id
 00721157ae682-78e66c4b434mr41718017b3.55.1765607209556; Fri, 12 Dec 2025
 22:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20251213041635.3859879-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251213041635.3859879-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Dec 2025 22:26:21 -0800
X-Gm-Features: AQt7F2qR_TwGw9R3yptKVZC7B_90apKBaNXobNIznuqLYT99DN4vsAQgDLBwc04
Message-ID: <CAMKF1sqSCyza=QFo=jhA-FWTj2pM14CPVDP8cg2ZAvSg6uTYgw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ripgrep: limit libstd-rs DEPENDS to class-target
To: deepesh.varatharajan@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089de700645cf7696"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122631

--00000000000089de700645cf7696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 8:16=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Avoid pulling in a non-existent libstd-rs-native dependency by
> restricting libstd-rs to class-target builds.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> index 7bb6be1cb6..0ef671cf04 100644
> --- a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> @@ -15,7 +15,7 @@ S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
>
>  inherit cargo cargo-update-recipe-crates
>
> -DEPENDS +=3D "libstd-rs"
> +DEPENDS:class-target +=3D "libstd-rs"
>

This should be DEPENDS:append:class-target =3D " libstd-rs"


>
>  require ${BPN}-crates.inc
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122628):
> https://lists.openembedded.org/g/openembedded-devel/message/122628
> Mute This Topic: https://lists.openembedded.org/mt/116758522/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000089de700645cf7696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 12,=
 2025 at 8:16=E2=80=AFPM Varatharajan, Deepesh via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Vara=
tharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.co=
m</a>&gt;<br>
<br>
Avoid pulling in a non-existent libstd-rs-native dependency by<br>
restricting libstd-rs to class-target builds.<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a> b/meta-o=
e/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">ripgrep_15.1.0.bb</a><br>
index 7bb6be1cb6..0ef671cf04 100644<br>
--- a/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a><br>
+++ b/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a><br>
@@ -15,7 +15,7 @@ S =3D &quot;${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}&qu=
ot;<br>
<br>
=C2=A0inherit cargo cargo-update-recipe-crates<br>
<br>
-DEPENDS +=3D &quot;libstd-rs&quot;<br>
+DEPENDS:class-target +=3D &quot;libstd-rs&quot;<br></blockquote><div><br><=
/div><div>This should be DEPENDS:append:class-target =3D &quot; libstd-rs&q=
uot;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
=C2=A0require ${BPN}-crates.inc<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122628" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116758522/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116758522/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000089de700645cf7696--

