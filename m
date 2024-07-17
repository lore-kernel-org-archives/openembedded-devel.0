Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A984C3DA5D
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:57:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13481.1721217445395025620
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1IguX4r;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fbc09ef46aso49144845ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721217445; x=1721822245; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=um3lrAOF2Owda8kL9rx2q/tDiFRYLz5lVPdiI+8n/T8=;
        b=G1IguX4rO48yM/XQ5kRViWh9+J+Z29JF9UtNfKW+JiQdtMNoytasULq4rg7a4vF6c2
         VGib7gPBD3dSVS6OmiMdfY9DEQm0HpNxie7DXgj2K0UacuEyQ+6etLsVX5pRzhoD+Uh8
         irI2E7nhTBuI+tLIPxjOWJBnh4Dl2BlYhxlGgcu/m9dtxd4jL8j5eLIO/oapjhQeI2gr
         j0VHq95tjR0lEEgfiW25Np1z4SuIV3a8N6Q8ZC744mvGV4/PVfbOlECHeH1w42ZOnOgR
         NkmbSGILTYWdjS8CELOHuocoJGSJhh1JogkUne8/OL+KO+wobsYXOBefP5Hhlea7H/BU
         Ea1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217445; x=1721822245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um3lrAOF2Owda8kL9rx2q/tDiFRYLz5lVPdiI+8n/T8=;
        b=bCwAGbDZr3JXyreKNWL5Wg6nGHyBYtpmf8cGhhFoHnlWI9hPZDfE7oZpkxqvjyDuys
         GFdN65cRvL2GUg+dcTYi9L0fTEqy2LzQBuftjEVIBjq1YIHT60audbeuE7Xts6pIjx6b
         hilpvkndNIWWa3BKJjo76MgKWfs8kKCEmNUbm1eocJwCLm6KziBzT01sspZ7uKJKo8ml
         byKMpOiKlni3fu3OVKXlsvfAcXnoI11tWZmDHIw1vSOCegXk+EQWpPSkbl34SPhST3zj
         uuniWt1Y+rSWV7tWvKpLzOaRoLglA9IR/NPKMMmY4mqott2O5tuJnl62tfk/j8oSOYgF
         20qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVtOR7QUN3U7t/7wx1JhhoZVK2ZbhnMU+oZrOX6mh+8w/O7NJfFng5UQ/l6rotfqOUxH+6BKauKrTbLtdBpFSeQzpoFHqInbFBcncSjaUep2/R8bmakk0dIw==
X-Gm-Message-State: AOJu0YwDUMjD3dMMvdBzz2R+YVvchVUbhpB1s15NvH3kwowV2UnBzsKB
	mafF6mY8cAj/VC5do5nfoeDtcwnJWMu3ZloFP01PimyGA+NbDdSX9caA/jD9dFDMMgUL6yxk5JW
	ilQ97RW/eKjfKkYGbZjq1QCdVAqA=
X-Google-Smtp-Source: AGHT+IFzauN6lTQ5X9xV3OSiu/jZstcZRV4+vGyjugQ9by53MUIw81Uu4dszvT3BEBV+ROjhd8wTqst9iOR1qSohUq0=
X-Received: by 2002:a17:903:1247:b0:1f7:26f:9185 with SMTP id
 d9443c01a7336-1fc4e11fea9mr11383715ad.10.1721217444613; Wed, 17 Jul 2024
 04:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240717063948.18385-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20240717063948.18385-1-shin.matsunaga@fujitsu.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 17 Jul 2024 13:57:12 +0200
Message-ID: <CAApg2=TuR+LmcZsop056LF41v+3ONTQpqxpq3+mhvx4F6VfSRg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] audit: Add linux_audit to CVE_PRODUCT
To: shin.matsunaga@fujitsu.com
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org, 
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Content-Type: multipart/alternative; boundary="0000000000005e1740061d702a58"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 11:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111380

--0000000000005e1740061d702a58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 8:39=E2=80=AFAM Matsunaga-Shinji via lists.openembe=
dded.org
<shin.matsunaga=3Dfujitsu.com@lists.openembedded.org> wrote:

> linux_audit is also a valid CVE_PRODUCT for audit,
> e.g., https://nvd.nist.gov/vuln/detail/CVE-2015-5186.
>
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> ---
>  meta-oe/recipes-security/audit/audit_4.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb
> b/meta-oe/recipes-security/audit/audit_4.0.1.bb
> index bd8f8cc31..0b5857cbf 100644
> --- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
> +++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
> @@ -102,4 +102,4 @@ do_install:append() {
>      install -d -m 0700 ${D}${localstatedir}/spool/audit
>  }
>
> -CVE_PRODUCT =3D "linux:audit"
> +CVE_PRODUCT =3D "linux:audit linux_audit"
>

Hello,
I think it will be better to put linux_audit_project:linux_audit

What do you think?

Kind regards,
Marta

--0000000000005e1740061d702a58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2024 at 8:39=E2=80=AF=
AM Matsunaga-Shinji via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;shin.matsunaga=3D<a href=3D"mailto:fujitsu.com@lists.=
openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">linux_audit is also a v=
alid CVE_PRODUCT for audit,<br>
e.g., <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2015-5186" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2015-5186</=
a>.<br>
<br>
Signed-off-by: Shinji Matsunaga &lt;<a href=3D"mailto:shin.matsunaga@fujits=
u.com" target=3D"_blank">shin.matsunaga@fujitsu.com</a>&gt;<br>
Signed-off-by: Shunsuke Tokumoto &lt;<a href=3D"mailto:s-tokumoto@fujitsu.c=
om" target=3D"_blank">s-tokumoto@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">audit_4.0.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">audit_4.0.1.bb</a> b/meta-oe/recipe=
s-security/audit/<a href=3D"http://audit_4.0.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">audit_4.0.1.bb</a><br>
index bd8f8cc31..0b5857cbf 100644<br>
--- a/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">audit_4.0.1.bb</a><br>
+++ b/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">audit_4.0.1.bb</a><br>
@@ -102,4 +102,4 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d -m 0700 ${D}${localstatedir}/spool/audit<br>
=C2=A0}<br>
<br>
-CVE_PRODUCT =3D &quot;linux:audit&quot;<br>
+CVE_PRODUCT =3D &quot;linux:audit linux_audit&quot;<br></blockquote><div><=
br></div><div>Hello,</div><div>I think it will be better to put linux_audit=
_project:linux_audit</div><div><br></div><div>What do you think?</div><div>=
<br></div><div>Kind regards,</div><div>Marta</div></div></div>

--0000000000005e1740061d702a58--

