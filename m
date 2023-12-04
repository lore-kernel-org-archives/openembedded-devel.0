Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183F1C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:23:12 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.71350.1701703388730731891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5rSwzdO;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1eb39505ba4so2072683fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 07:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701703388; x=1702308188; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICL5/4wydUyxLJfZC5GkxmBUaLFoGmSMwOQnk40cC2I=;
        b=P5rSwzdODUTuYAdWMX+97n2JxhK0zuy1vawaatnXlK12z+f/vYJrn65FYYLl0Vn75p
         TiNEBdyKJ4Y839FMFJW7Lw30nwiyrQblMCYmGkAAhk4zcG73Dv364akqAYzhzaG52ObB
         eQbWgCAqDPRaZ1VN4NSbUelvtCDwrU+XpqBMM2YlVMaNnc6B4FWQskyDIfArqokW5cTw
         pl+zo2VQWf94g9sNvvzHRErKIeXVicHLLbO5IOk2SHivMCW72TjWVILo8fxc15WCk2l3
         0bpK3rfd/t8If+qth4jSu4MaHiqEIicvVFa9YNSpWQt7x0HhljuD89nh88oqsF+ZO4pX
         5hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703388; x=1702308188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICL5/4wydUyxLJfZC5GkxmBUaLFoGmSMwOQnk40cC2I=;
        b=Gu+aMSHdSBw2/TyNHskF+gznps6dOPJUuyMiv7xV8hxDbCulkTUj3Dtx+A1NxQytBw
         7p1EBtZqwJN0TSnpK1RWJpT7EJCKq0IxCSYa3d9ZRPJYRlE51/UgpZWkht6BbGB7g+Uh
         1sbeIRjrafV+NGZdmbwXEV5IV7+/tMxboLZO2amilnwoGSvPDws+LrHaSDpo/b/mVAzR
         EF8fmoWnT6RQ9ti9F9F2XFswuTxmLSD4Fz7QCUAeyiNhuW3A7Nc75cGDb9rfoTzEHsCF
         IfzzDQe06px/uid31cDj2JMSwYbBWYloIKPTUfpReg28x0LBeo1fmBEq1DsB1fJma+3F
         ZUyw==
X-Gm-Message-State: AOJu0YyZrpGGZXOeMdumS/VnvlpzJSj81RXzZTTRfx/QSH4nUpNC1TxN
	I+ZLTeacCtVV6OOdaMDTErIj5Qx26bhdlYD2Kbbr5awk
X-Google-Smtp-Source: AGHT+IH75n1Lxy2+97pC9fCJrKtNVO9SHH0l2pkdUGegoWj+02LjZryV4KrC34DRqrAPJ0kPDNhvzDfufnpgUlwCdMs=
X-Received: by 2002:a05:6871:7283:b0:1f9:9ad0:cd3d with SMTP id
 mm3-20020a056871728300b001f99ad0cd3dmr7398231oac.4.1701703387739; Mon, 04 Dec
 2023 07:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
In-Reply-To: <20231204141856.2977926-1-p.chernikov@yadro.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Dec 2023 07:22:56 -0800
Message-ID: <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
To: Petr Chernikov <p.chernikov@yadro.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f07f1f060bb0b122"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 15:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107206

--000000000000f07f1f060bb0b122
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov <p.chernikov@yadro.co=
m> wrote:

> Old versions of abseil-cpp could not be compiled using C++ Standard 17.
> For now this cmake flag is not needed.


Can you check if this works with clang compiler as well

>
>
> Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index f847ebf15..4705b6f8c 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -26,7 +26,6 @@ inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>                   -DBUILD_TESTING=3DOFF    \
> -                 -DCMAKE_CXX_STANDARD=3D14 \
>                   -DABSL_ENABLE_INSTALL=3DON \
>                  "
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107204):
> https://lists.openembedded.org/g/openembedded-devel/message/107204
> Mute This Topic: https://lists.openembedded.org/mt/102970930/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f07f1f060bb0b122
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov &lt;<=
a href=3D"mailto:p.chernikov@yadro.com">p.chernikov@yadro.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Old versions of abseil-cpp could not be compile=
d using C++ Standard 17.<br>
For now this cmake flag is not needed.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Can you check if this works with clang compiler as we=
ll=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@yadro.com" =
target=3D"_blank">p.chernikov@yadro.com</a>&gt;<br>
<br>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-c=
pp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a> b/met=
a-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
index f847ebf15..4705b6f8c 100644<br>
--- a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.=
bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.=
bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
@@ -26,7 +26,6 @@ inherit cmake<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_TEST=
ING=3DOFF=C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_CXX_=
STANDARD=3D14 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DABSL_ENABL=
E_INSTALL=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107204): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107204" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107204</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102970930/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102970930/1997914</a><br>
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

--000000000000f07f1f060bb0b122--

