Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFF0C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:00:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.6772.1750510810972975658
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ar+JoB64;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4530921461aso21472765e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750510809; x=1751115609; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5qvj4IvaJOo4d1r4TCmCzbs4BQPLvOi3bVw2Ize0AJM=;
        b=Ar+JoB64ALYDlP74CI29Euetfzpm2YyXT0p6GUhpCwKHsZcYaoiMRH6EtYsBfcDTIE
         Q2pwx8ofQpurWxQxZZ3PrTpOj0Du160CntYRpNXN+zPH7ITdnJ2GH0cmbiGtlPcFI6Vv
         3iYSsihV/y/NG6+yZ3bVVEwtgDXAJiVR1vw6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510809; x=1751115609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qvj4IvaJOo4d1r4TCmCzbs4BQPLvOi3bVw2Ize0AJM=;
        b=a74x3cueqdtz23tva489EVh4oLPhUz4AGQJlLRaUtAVmakGnpqre2yEtoMcNqqwQUi
         VqNo+Wh15zRvvDwSVEzsahMpzsB+HPESl0Y337L0p64J9qjSmIxFobuK9l2KnCOeJyu4
         ZhZIc/OdhuQmQnkkG8XFAGBvxw0ZHopFVA/8HL1vto9FJwo4W1xSqX60ieec4SWZv0NI
         FZVM2QFm3u9NZYmR3t3u2JeLK/6a6DeaDe+LuQnZMz3kjozBFZX2sa5i4n3be1BkaYfQ
         FO1eJ2QFJyLzz+STh1O5gkmI00VbNJ+jKk6mb+mRn4tcm1UvapUuWSyIjgYjF9VQEbEt
         eYkg==
X-Gm-Message-State: AOJu0Yxp1pgRXuqyPRinFYEgACcR9m6L2DXOCCFTd0zVmRqaARlIFIOp
	55U3szVrgmckoLfr8en9Kb1Ajf3fOAosJTrXb0Zv4MFyLlJe/K0Z5jjv3FCqLc2S3r8ch7VQVwR
	HGPnxGCcROhrnD3jVt2KVXdGVDJn7UUQdgcvjwOxlbg==
X-Gm-Gg: ASbGnctsSM2BNLcCJ+gfZC/m0fSbsKSN17IZXBElKOk6W3YTxDrEdHjP5z1ID4enE9d
	LduiaCC6V3fwDs2GSDdpzkQXukKM25EDJjZMNSVwIlMa/XowomswjkqAJT4TNvViGlfGfb+msoe
	bbOXfMZhaNt6kJ0tOn+T1T8NnYhsn+vW6OJazL/0XgScfdZeguBs90QRiqMMo8qKzj2zoSoGmb4
	6av/w==
X-Google-Smtp-Source: AGHT+IE0QjX6yIuupZI7m3TZoGtiiggRZAXmEk2dYSTXBDq6vQbZuj3P0Ni2YNw6Tudp42B8knvbZOJFaglV9QLp4Cg=
X-Received: by 2002:a5d:64cc:0:b0:3a5:8cc2:dabc with SMTP id
 ffacd0b85a97d-3a6d1193d28mr5357399f8f.5.1750510808929; Sat, 21 Jun 2025
 06:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250621102550.1523918-1-alperyasinak1@gmail.com>
In-Reply-To: <20250621102550.1523918-1-alperyasinak1@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 21 Jun 2025 14:59:43 +0200
X-Gm-Features: Ac12FXy5_aUzUvSB3w8WDsYm7V-Gn20LckApr7aPi7Fxbx0LpHwaNnqYcek70WY
Message-ID: <CAMSfU+5ymAa0RFBaSkfuke3H_Bimui5sJn8_BNZ+yKE1hCvYSA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ace: Fix contains reference to TMPDIR
 [buildpaths] error
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f130080638148e08"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 13:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118006

--000000000000f130080638148e08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 21 juin 2025 =C3=A0 12:26, Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE_Compression.so.8.0.2 in package ace-dbg contains
> reference to TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains
> reference to TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE_ETCL.so.8.0.2 in package ace-dbg contains referenc=
e
> to TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE.so.8.0.2 in package ace-dbg contains reference to
> TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE_Monitor_Control.so.8.0.2 in package ace-dbg contai=
ns
> reference to TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libACE_RLECompression.so.8.0.2 in package ace-dbg contain=
s
> reference to TMPDIR [buildpaths]
> ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing
> task.
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> index b730b0a86c..e62ed39d0b 100644
> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> @@ -27,7 +27,7 @@ export ACE_ROOT =3D "${UNPACKDIR}/ACE_wrappers"
>  inherit pkgconfig
>
>  CXXFLAGS:append =3D " -fpermissive -Wnodeprecated-declarations"
> -CXX:append =3D " -ffile-prefix-map=3D${UNPACKDIR}=3D "
> +CXX:append =3D " ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR}=3D=
 "
>

Hello,

${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in
poky/meta/conf/bitbake.conf)

Do you know why it is not the case here? or why does it not work?

Thanks!


>  EXTRA_OEMAKE +=3D "INSTALL_LIB=3D${baselib} install_rpath=3D0"
>
>  do_install() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117996):
> https://lists.openembedded.org/g/openembedded-devel/message/117996
> Mute This Topic: https://lists.openembedded.org/mt/113755735/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f130080638148e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 21=
 juin 2025 =C3=A0=C2=A012:26, Alper Ak via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;alperyasinak1=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libAC=
E_Compression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [bui=
ldpaths]<br>
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ET=
CL_Parser.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpa=
ths]<br>
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ET=
CL.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]<br=
>
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE.so=
.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]<br>
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Mo=
nitor_Control.so.8.0.2 in package ace-dbg contains reference to TMPDIR [bui=
ldpaths]<br>
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_RL=
ECompression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buil=
dpaths]<br>
ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing task=
.<br>
<br>
Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targ=
et=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_8.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ace_8.0.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_8.0.2.b=
b" rel=3D"noreferrer" target=3D"_blank">ace_8.0.2.bb</a> b/meta-oe/recipes-=
connectivity/ace/<a href=3D"http://ace_8.0.2.bb" rel=3D"noreferrer" target=
=3D"_blank">ace_8.0.2.bb</a><br>
index b730b0a86c..e62ed39d0b 100644<br>
--- a/meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_8.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ace_8.0.2.bb</a><br>
+++ b/meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_8.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ace_8.0.2.bb</a><br>
@@ -27,7 +27,7 @@ export ACE_ROOT =3D &quot;${UNPACKDIR}/ACE_wrappers&quot;=
<br>
=C2=A0inherit pkgconfig<br>
<br>
=C2=A0CXXFLAGS:append =3D &quot; -fpermissive -Wnodeprecated-declarations&q=
uot;<br>
-CXX:append =3D &quot; -ffile-prefix-map=3D${UNPACKDIR}=3D &quot;<br>
+CXX:append =3D &quot; ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR}=
=3D &quot;<br></blockquote><div><br></div><div>Hello,</div><div><br></div><=
div>${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitba=
ke.conf)</div><div><br></div><div>Do you know why it is not the case here? =
or why does it not work?</div><div><br></div><div>Thanks!</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0EXTRA_OEMAKE +=3D &quot;INSTALL_LIB=3D${baselib} install_rpath=3D0&qu=
ot;<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117996): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117996" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117996</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113755735/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113755735/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f130080638148e08--

