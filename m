Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D6FEDEC42
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 11:14:24 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.9097.1694603656182345537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 04:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EllHUVLl;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-450711d9bf1so2806089137.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694603655; x=1695208455; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J6f/aGf2R391BJZkIRD394dYAyK/9MiB+qWTxTT6iA8=;
        b=EllHUVLllbs1z3z9TT9ge1j0OntNYqOaRCLm7ZOU0kyTq7nechT8fTYObk90W3XxOA
         aemlylomwUxcqEFM2vctPXAcR6vgjC2vvnQVkfCq6rQSuZGgtPkdVHjXZLkU7WvGsJ6W
         +HYy8hlTFA2IpLkdFChWN/fWui1gaYMXfas3HesMW+NFDhV/akZlqCaVP5prWFlHGD2W
         XY51HnHheUMi8hboqRyZo92gsaSXrbPYr7clAK6TNlm5HH/5WG1UgpUaprFBuhI4szXd
         dn2EVUcrmHhRYd4aSlAEOSBQjHpKdiL3Mk2Eq8UQHEkgncl7EqGSS7PZKMUVQB/F/CRb
         dnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694603655; x=1695208455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6f/aGf2R391BJZkIRD394dYAyK/9MiB+qWTxTT6iA8=;
        b=ESkEcKPyzcna/Pj3f2gyt1zBEiG/cd5ug+TAMm8xmq81yLW7SujoTUE0HiFgGQXF/E
         mw4vILKO4d/k+ec+UTK1gY8UHfDWaFkWCPgGUaLcmwWh7+eyDg2F+5YQpydV7/rjGi9x
         XMjFcU3ySP5byFBV7jKT6yAA2CK7DNBaMCNlsGnnLmY11l9bAVwqrUljdWn8KpxZlNT9
         8iSmVZM/Riu0lyvBilRO5ud10adf5/ukiJTaXN/hi2sw+leKija9NmXkDiuKD7wkAHuA
         TZ5sfz9IEOXv3tLtUYa7ct4RcepSbyOAesJodYjpziKF6gR2Jm11twLE25E1Ibccckew
         X/WQ==
X-Gm-Message-State: AOJu0YwDpQp6mT0vyFHru/liL2xDLTI3I3plPCj/9HfQtNpEEA33pqA2
	mCN7X8wJ9no3VX1JC5yo9Xy5dpB+Hm9Hcihmf+FTQG3dp4g=
X-Google-Smtp-Source: AGHT+IEx4Cp+wwA32jWQDLEk6DRrIpfN6d8GXLVe54PYRsyXw4LhjLV0Ht+ITYRmRTQQ1wplZHR4DtcMcigftt/fJaU=
X-Received: by 2002:a05:6102:356f:b0:44d:4b34:af92 with SMTP id
 bh15-20020a056102356f00b0044d4b34af92mr1901554vsb.7.1694603655003; Wed, 13
 Sep 2023 04:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230913110145.1100755-1-jose.quaresma@foundries.io>
In-Reply-To: <20230913110145.1100755-1-jose.quaresma@foundries.io>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 13 Sep 2023 12:14:04 +0100
Message-ID: <CANPvuR=XRpP1H-k_LbjvrLWPkmJMhyGMAKuHu=vnv=PXz-rQ3g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] opensc: ignore CVE-2021-34193
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e4407c06053ba850"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 11:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104855

--000000000000e4407c06053ba850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry but forgot to mention that this patch is for kirstone, should I send
a new one?

Jose

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia quarta, 13/09/2023
=C3=A0(s) 12:02:

> The CVE-2021-34193 is a duplicate CVE covering the 5 individual already
> fixed.
>
> https://github.com/OpenSC/OpenSC/pull/2855
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta-oe/recipes-support/opensc/opensc_0.22.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> index 4590b85fa..3bb79b9d9 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> @@ -16,6 +16,11 @@ SRCREV =3D "c902e1992195e00ada12d71beb1029287cd72037"
>  SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dh=
ttps \
>             file://CVE-2023-2977.patch \
>            "
> +
> +# CVE-2021-34193 is a duplicate CVE covering the 5 individual
> +#
> https://github.com/OpenSC/OpenSC/pull/2855/commits/7a049fc3922060fb75cb9f=
ea9e58eef9edc357ae
> +CVE_CHECK_IGNORE +=3D "CVE-2021-34193"
> +
>  DEPENDS =3D "virtual/libiconv openssl"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e4407c06053ba850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry but forgot to mention that this patch is for ki=
rstone, should I send a new one?</div><div><br></div>Jose<div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; e=
screveu no dia quarta, 13/09/2023 =C3=A0(s) 12:02:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">The CVE-2021-34193 is a duplicate CVE co=
vering the 5 individual already fixed.<br>
<br>
<a href=3D"https://github.com/OpenSC/OpenSC/pull/2855" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/OpenSC/OpenSC/pull/2855</a><br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a> | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0=
.bb" rel=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a> b/meta-oe/re=
cipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">opensc_0.22.0.bb</a><br>
index 4590b85fa..3bb79b9d9 100644<br>
--- a/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a><br>
+++ b/meta-oe/recipes-support/opensc/<a href=3D"http://opensc_0.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opensc_0.22.0.bb</a><br>
@@ -16,6 +16,11 @@ SRCREV =3D &quot;c902e1992195e00ada12d71beb1029287cd7203=
7&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/OpenSC/OpenSC;br=
anch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github=
.com/OpenSC/OpenSC;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-2977.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+# CVE-2021-34193 is a duplicate CVE covering the 5 individual<br>
+# <a href=3D"https://github.com/OpenSC/OpenSC/pull/2855/commits/7a049fc392=
2060fb75cb9fea9e58eef9edc357ae" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/OpenSC/OpenSC/pull/2855/commits/7a049fc3922060fb75cb9fea9e58ee=
f9edc357ae</a><br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2021-34193&quot;<br>
+<br>
=C2=A0DEPENDS =3D &quot;virtual/libiconv openssl&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--000000000000e4407c06053ba850--

