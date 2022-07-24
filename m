Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA39C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 19:31:42 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.20155.1658691099867723711
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzqLcj9h;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x91so11610256ede.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YyZNy4CHqg7K395hex4jsMPtFedSyRuTAaxzgwNgZc=;
        b=mzqLcj9httJyhrmwZ+Zzwv2+thZG4qDm2qTw2Lm6R3OwWGOYTTK7ZFfspM/tNOR4Yc
         l+eRVeL8N/6Q659TR+IhqNy9Jrw2hD5H9EH/SPK5u7zPNUDDdsmrAICC9ms8D1sqyhoG
         n/iie+jv9hb2+12Qwq0nQ/s/YxKfyHixLbXN2PzT17ZIWh9q558hAEI/qdZGNTlY3uOs
         qj9Wx5sStlRJ+lTBbt1tjjkjZi1SzOmKnKGx+fNjIaVkdkFsCiLaNrKwkDLWS/MKgAR3
         eK1XJPe0MIRfWNsg3gU39GRWN12fNgqdxUxlMPtAlw25dwflq5t1n9BHlTFt4PCDRtCy
         HOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YyZNy4CHqg7K395hex4jsMPtFedSyRuTAaxzgwNgZc=;
        b=LQtYVOVU9kI4RbNzXjc/MB4iYX75Fn7/5aNw/NU4k5vly+tSxStgNFpUG7rrBrGyhu
         KPitwoR2bwItyEi9LES925gBNxbuE3qwJXUG4I3dR6kp2Cch9PBB9hv3Pn2+1kA+7tUe
         a/AdeUe0JQvkJvekvRx60C7ClG/9GKQ/WQh/kWdq1KZqOP9XMOFPnn4TPPDoRXXhf4vY
         RVc1crjNyeeSr8g36X03beoqf5MwYiETabrkKE/qFl6j+TZrYUXacM4rjMQyrn3/GEmm
         f3VDI9lz7p22GOcxan634QJgstViUr0G52eHz8R1soz1O5IBoc3nQgoawxpA8mCDtE9z
         TeBQ==
X-Gm-Message-State: AJIora/E5sbD/xkfD1/gJ6zaemfJiN38ZK8tPQWu9q+7cHVi6sGw0aPT
	OfMBImgQo8LxsdIJyqTRf2wJLPyylRsi7SXxCNAwqaDB8p/cgA==
X-Google-Smtp-Source: 
 AGRyM1s5d2rsqrwhE+DA97POcLwC8awzCFtiy7UlHCT+N3t36J/iRd3panXF0we4AUbqRTQGAMseqgKZkftiyd4AvC4=
X-Received: by 2002:a05:6402:1d54:b0:43b:e20b:4ff1 with SMTP id
 dz20-20020a0564021d5400b0043be20b4ff1mr7133936edb.385.1658691098048; Sun, 24
 Jul 2022 12:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
In-Reply-To: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 24 Jul 2022 21:31:23 +0200
Message-ID: 
 <CABF_=yh7frbvHSe=+EokH+AuU5p7GRSN4+Kb_-qn__1HqyFu_Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] Add runtime dependencies for
 python3-supervisor
To: =?UTF-8?Q?Martin_Gro=C3=9Fhauser?= <mgrosshauser@gmx.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b0fa9e05e4921d88"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 19:31:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97963

--000000000000b0fa9e05e4921d88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Could it be it should be '${PYTHON_PN}-setuptools-native'
iso  '${PYTHON_PN}-setuptools' ?

Br

On Fri, Jul 22, 2022 at 9:39 PM Martin Gro=C3=9Fhauser <mgrosshauser@gmx.ne=
t>
wrote:

> Running supervisord without these fails with import errors. smtpd might
> look strange, but provides required asynchat.py.
> ---
>   .../recipes-devtools/python/python3-supervisor_4.2.4.bb      | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-supervisor_4.2.4.bb b/meta-python/recipes-devtools/python/
> python3-supervisor_4.2.4.bb
> index fdd8a76cf..7da29e39b 100644
> --- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
> @@ -13,6 +13,11 @@ PYPI_PACKAGE =3D "supervisor"
>   inherit pypi systemd setuptools3
>   RDEPENDS:${PN} =3D "\
>       ${PYTHON_PN}-meld3 \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-xmlrpc \
> +    ${PYTHON_PN}-resource \
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-smtpd \
>   "
>
>   SRC_URI +=3D "file://supervisord.conf \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97956):
> https://lists.openembedded.org/g/openembedded-devel/message/97956
> Mute This Topic: https://lists.openembedded.org/mt/92555239/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jan.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000b0fa9e05e4921d88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Could it be it=C2=A0should=C2=A0be =
&#39;${PYTHON_PN}-setuptools-native&#39; iso=C2=A0=C2=A0&#39;${PYTHON_PN}-s=
etuptools&#39; ?</div><div><br></div><div>Br</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 22, 2022 at 9=
:39 PM Martin Gro=C3=9Fhauser &lt;<a href=3D"mailto:mgrosshauser@gmx.net">m=
grosshauser@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Running supervisord without these fails with import erro=
rs. smtpd might look strange, but provides required asynchat.py.<br>
---<br>
=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-supervisor_4.2=
.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-supervisor_4.2.4.bb</a>=
=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-superviso=
r_4.2.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-super=
visor_4.2.4.bb</a><br>
index fdd8a76cf..7da29e39b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-supervi=
sor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-supervisor_4.2.4=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-supervi=
sor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-supervisor_4.2.4=
.bb</a><br>
@@ -13,6 +13,11 @@ PYPI_PACKAGE =3D &quot;supervisor&quot;<br>
=C2=A0 inherit pypi systemd setuptools3<br>
=C2=A0 RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-meld3 \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-xmlrpc \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-resource \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-smtpd \<br>
=C2=A0 &quot;<br>
<br>
=C2=A0 SRC_URI +=3D &quot;file://supervisord.conf \<br>
--<br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97956): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97956" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97956</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92555239/2167=
232" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92555239/2167232</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jan.vermaete@gmail.com" =
target=3D"_blank">jan.vermaete@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000b0fa9e05e4921d88--

