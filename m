Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ABEF364AF
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 18:22:09 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139248.1775758919257071124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 11:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dc7Ugbtv;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65003f40a22so1099884d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775758918; cv=none;
        d=google.com; s=arc-20240605;
        b=MgyTTFbmC6czaT0/NOrYK0gucAcfsqrs+fBcRh2Ya20LMU0TTv2deCWaWL4ClKL3yW
         ohg/hF6OfA4gNxo9RZukIqswcaW5zQ9jMPwBGeN4J1Xk9RldK1gPSJ5y5687CGVXm98A
         C6ulDKSkCzE0WlvWBH0f4ng7qFQgUwURt0ud97BlLemDTBmznpcEoWrBOFdwLox+BRYc
         7RIDgZE5MoUtAFs1CK0ZfPMlrmLQawWYPgmn2VA4W5ckSZqAhYa1aw+6N7cpoJ7pgEoU
         w5RR+Iy6lfWFprLb50ckAQ5psupA/8di3Ts7+M3FIQAuXTRi5M4t+w4PX3X8DBe0pcV6
         /yvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tQyZ5mEvQqUDUKVKD9HJZprsIFtSw02z08QukR99pHo=;
        fh=7oI9jBHxrWCncumEnzG8BN56QlQkoa9xJ4TUQ95bJdU=;
        b=QOEiv5OXqvZs1J1fBvw30KZA6RpEziEYeYYihMl9wBN1w7Z0bD1mQUW2wJdNKZj1fy
         RzqHGlDy1WL9FmHwhfwwJY4SLacOmSkPGJ9vAwBtxxxr4XwvIoY5iLyMFLqOF0gJLWgY
         pnXuoGt8TQ9re58lzjZLG7Z9bF7hlgAlXVfXCPcBZveD6o4nFVxih+lfzK9WlejU0ZIt
         NYOkK1utGUW/boYMur/g7Xl0FnWwCeuZDEgACkTdpC4yZDqt5V9eTc1losf/wjrRN7L4
         KqOa95QtTpaRU8w8ywavvC4kdqVh8gXcYe1feMHsKJb3Fj0aiVWFLrKzo6Le6ecJBPW2
         kBlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775758918; x=1776363718; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQyZ5mEvQqUDUKVKD9HJZprsIFtSw02z08QukR99pHo=;
        b=Dc7UgbtvUo8M4vxXuknzZzr40ndDL7P1UrP8nAq3So3jxkpKe8MKevASlWOAGLzUQY
         teEYkxUzBuuBBXQ2T3vGj/s4VdeG/30ayQTadhfpmz+owBMPO6cbXeRZ50trMnJKSjEC
         U1Ga3EdQ1sLNNZUWyxjXTxyDyk2lO4I7epgdj2IXSYKv0roo5UeX8IE374Pfkd72i8kU
         UlBSyVGo+OSQwalnFyygHooJBve3FGV+ShphBuRLOAZjtmCV6N/6Lfl+nzEPApbUweD5
         0eJuhOnm7qgvik0p30t7RpmcaTh1D83zSRjVPE9AZOI27NzMbTF7TGJ4SxE6HPLLC2lr
         puhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758918; x=1776363718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQyZ5mEvQqUDUKVKD9HJZprsIFtSw02z08QukR99pHo=;
        b=UTMlhWL9byyTm409H1qY95eDXmc+fVn01T4HwQpzkfcC5xa+edpYhmk0FQTcvXj4oN
         3El6Rw4AMLrFAgqoABVsDHPFOKZF/M/wwIHzbKPcqgIKYRtwPccUh5BnfOHeddQIOEgG
         Rrhvq2B0JTv78oijdt8mPokmy7x/vjfXUm8n8L4Bex+oUM1StUTJe9E+a8FpmqkCy3sT
         y3+T3FY9jFtiTofpgLMpmmbnGUofgswuid/XgL+/OYE6LHIt63xBQ7AkO+E/Mc0FXBhu
         4e9Iyjy0HmRCqdEhtG7SJQ4oNAXMxKC2J5eMVadCScP3sfXNX/fCitNvZDCvLVRP5/HT
         nH2w==
X-Gm-Message-State: AOJu0YyCit/0yPz6aeKGPK+zKXWPFg4fDqpBBka2y6CKANSM/GklKBuT
	xHx/5YHKlZ0TiAisjz6NpHlk68fw5GGY4NLsoDjZL8H12NR1ThW4y4Wi91D+oqZUhns8B2NL0d4
	i/0pDHmLuuPY1pUr2CfxWIJJBFBe1aMjvwQ==
X-Gm-Gg: AeBDiev7xprpqMYOcxErauJsQAExwHkhi7eTa8XI7g1rYYTWpFP5yEo9dF7NMoqnkWZ
	KN5lFyfTI/aoNvCOA7h7FFbFyOPmduc4DViuEoplUHUBKljFTsc3EcYhYAHk3SfSNfK027/hkt+
	Y5Ms+aO+1gQVvWVxnG+FpReM+6Gy6Zzke9XSK8HyAKx8zTHQ9LzDSxz69v1Khdhoty8EOegImaC
	BoZ3wN9dRpJ6HsvjFspfFTm+Dn4oPeB9JuH41HvGK+OrqBf1zCpeIlQZgH3TLzPtrhrQpBci8EK
	ePEigKLFNWG5YLw57He+smHou9yXtJmzzGVGNhHr/RGz+a3CUCyzbtk5FehGmNgkDQ630PU0Y8g
	71bcgsgSUnFt0bRBjfJS92Ef1+kc=
X-Received: by 2002:a05:690e:42c1:b0:650:146c:8784 with SMTP id
 956f58d0204a3-65198b9fa03mr5204d50.54.1775758918213; Thu, 09 Apr 2026
 11:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260409103446.3079100-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260409103446.3079100-1-peng.zhang1.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Apr 2026 11:21:30 -0700
X-Gm-Features: AQROBzD-vukcreIDkmfNhq1GZVx6XUAL4GMKHJXWNBNmrVLCv0vbbtUGhQYUsFQ
Message-ID: <CAMKF1sqPxJ7dAP-pWc6tR3wozBFWp3+Av0w11basE146oeYV1Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-codspeed: upgrade 3.0.0
 -> 4.3.0
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086e57e064f0b17ac"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 18:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126202

--00000000000086e57e064f0b17ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 3:35=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.o=
rg>
wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> Add python3-cffi-native to DEPENDS since v4.0.0 introduced
> CodSpeedHQ/instrument-hooks which uses cffi FFI bindings at
> build time.
>
> Changelog:
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.0
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.0
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.1
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.0
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.0
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.0
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.2
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.1
> https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.0
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  ...est-codspeed_3.0.0.bb =3D> python3-pytest-codspeed_4.3.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python3-pytest-codspeed_3.0.0.bb =3D> python3-pytest-codspeed_4.3.0.bb}
> (72%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-codspeed_4.3.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/
> python3-pytest-codspeed_3.0.0.bb
> rename to meta-python/recipes-devtools/python/
> python3-pytest-codspeed_4.3.0.bb
> index 0789e9f548..05c05e1048 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.b=
b
> @@ -3,8 +3,8 @@ HOMEPAGE =3D "https://codspeed.io/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2856cbe664e8843cd4fd4c1d1d85c=
2c3"
>
> -DEPENDS =3D "python3-hatchling-native"
> -SRC_URI[sha256sum] =3D
> "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c32fd06"
> +DEPENDS =3D "python3-hatchling-native python3-cffi-native"
>

its inheriting python_hatchling, which should automatically add
python3-hatchling-native to DEPENDS. Remove
it here.


> +SRC_URI[sha256sum] =3D
> "5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85653d5efee48"
>
>  inherit pypi python_hatchling
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126187):
> https://lists.openembedded.org/g/openembedded-devel/message/126187
> Mute This Topic: https://lists.openembedded.org/mt/118739978/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086e57e064f0b17ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, =
2026 at 3:35=E2=80=AFAM Zhang, Peng (Paul) (CN) via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;<a href=3D"http://peng.zh=
ang1.cn">peng.zhang1.cn</a>=3D<a href=3D"mailto:windriver.com@lists.openemb=
edded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Zhang Peng &lt;<a href=
=3D"mailto:peng.zhang1.cn@windriver.com" target=3D"_blank">peng.zhang1.cn@w=
indriver.com</a>&gt;<br>
<br>
Add python3-cffi-native to DEPENDS since v4.0.0 introduced<br>
CodSpeedHQ/instrument-hooks which uses cffi FFI bindings at<br>
build time.<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v4.3.0</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v4.2.0</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v4.1.1</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v4.1.0</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v4.0.0</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v3.2.0</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.=
2" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v3.1.2</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v3.1.1</a><br>
<a href=3D"https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/CodSpeedHQ/pytes=
t-codspeed/releases/tag/v3.1.0</a><br>
<br>
Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://est-codspeed_3.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">est-codspeed_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-pyt=
est-codspeed_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
codspeed_4.3.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pytest-codspeed_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyt=
est-codspeed_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-pytest-codspeed=
_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-codspeed_4.3=
.0.bb</a>} (72%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-codspeed_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyte=
st-codspeed_3.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-pytest-codspeed_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pytest-codspeed_4.3.0.bb</a><br>
similarity index 72%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ytest-codspeed_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-codspeed_3.0.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyt=
est-codspeed_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
codspeed_4.3.0.bb</a><br>
index 0789e9f548..05c05e1048 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
codspeed_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cods=
peed_3.0.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
codspeed_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cods=
peed_4.3.0.bb</a><br>
@@ -3,8 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://codspeed.io/" rel=3D"=
noreferrer" target=3D"_blank">https://codspeed.io/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2856cbe664e8843cd4fd4=
c1d1d85c2c3&quot;<br>
<br>
-DEPENDS =3D &quot;python3-hatchling-native&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c5b80100ea32dd44079bb2db298288763eb8fe859eafa=
1650a8711bd2c32fd06&quot;<br>
+DEPENDS =3D &quot;python3-hatchling-native python3-cffi-native&quot;<br></=
blockquote><div><br></div><div>its inheriting python_hatchling, which shoul=
d automatically add python3-hatchling-native to DEPENDS. Remove</div><div>i=
t here.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+SRC_URI[sha256sum] =3D &quot;5230d9d65f39063a313ed1820df775166227ec5c20a11=
22968f85653d5efee48&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126187): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126187" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126187</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118739978/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118739978/1997914</a><br>
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

--00000000000086e57e064f0b17ac--

