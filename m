Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7430BCCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 08:17:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43819.1762762659937414769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 00:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3XwIL8wp;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47755de027eso18276745e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 00:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762762658; x=1763367458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mE8szM50EC5ItEOvv4BV+fpAGyx85JH3fWvGVcz39DQ=;
        b=3XwIL8wpclqeDjPljyhKdlyiOocgYoOi7m8063xhCz9zK1eA78eziKr15kY4kQrXFm
         FxtidoeqTuO8zqXNPamZu4TXLQH1Fx/D5boFoC97g/qCyxFqUbD/eJtqV4GeuAa5l5xT
         z+eQkSeQBKGFi+oY6qEGBUQG1HGq57r+toFV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762658; x=1763367458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE8szM50EC5ItEOvv4BV+fpAGyx85JH3fWvGVcz39DQ=;
        b=KJg6BaHtWu+1kQzjFYWYs+hEfb1aO//gzD97GxE/dsgIXSrFJaY/H8ku3emQfNkfYo
         FfLjb3o/l6J0NPUpD+9GVZ+5CzUT3KiGIYXIANN4qCYIwXgt0c9BKjTp5mvdgN3wr7U0
         +TDs/L/pJlkmOgr0XeEXMG5Q6mN5dhdzHXwn6jjcyqggKvvYKdkNovwwm/KOd7dC+2oF
         LAqlWM53TvGIUnX3SveSVzaBMmnH/jdlPM+pvHYQTo5Kz+EHrHgaLsTpEKkpIs/SqSii
         jZzCIZwr9Hu6ut5sxN58pUG0FgaRpSdqS9zQdg/Aa2eTRe53BdLJ364m7sm0R1nJOwuM
         RJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvnx552WHO3e+8GkY/D04DrSjEXT7Gb2TWbHFiEImqiN393Fe6rghWiaarr2SMvsIkC26iork1lWtp4+iuvGL2ig=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPChe5i7jGuuaEZwPhN+4jg6y0xrno9qswznaXZ6rpHy8UFAzP
	Zfygp4/A1QLOxlNiDlVtORRhKzb3kS0+W9C2UVw1SoTXH8ciggWHh5+5J4YTdtYuVYlQyg9eiEk
	zqFyG0lo5KjFYwkfDLS7Infom1drcGxq6geZmxc6TVA==
X-Gm-Gg: ASbGncuyFV9CYtiUhbumsWJ8L7CkntRygmJp11Fe26FiLyHUUL1pRy9LKnsdrRTrg/1
	oEOY8UdptC3IuPVI1s1QEJLwngfsRWPU2uB3KiYBR9uOTy/lijr65W78WEzCB5KAgSyT0dewoyv
	EAeh2WoJae4vyPC7BI+PNrqIESCiCyzQfip0nqkn8kNyBtfmZVq4GK7amry4og0uxIPVt3Dhrc2
	Plj+4SZIvVQdR4E0sIWHh1/M80CI9ay68rlgS8aGGR0tscGYFjIO+F0DXXs6Gq/lzG/rLuy5Ygc
	LoZjgqW4q0ChK2QdGvdGxVXgoGnjUQ==
X-Google-Smtp-Source: AGHT+IGdI2VWgwUBtw+l8Wil0p7C4KZlIoflYjuYkUQysFAPLfAgvwTIpXuzHEx+gb4TzAr1BYbtn2M+pTm43+AphvI=
X-Received: by 2002:a05:6000:1acb:b0:42b:32a0:3484 with SMTP id
 ffacd0b85a97d-42b32a03626mr4338374f8f.45.1762762658086; Mon, 10 Nov 2025
 00:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20251108141838.259595-1-yi.zhao@windriver.com>
 <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com> <26b4e765-9fd2-47d6-8ee1-639c253c0df6@windriver.com>
In-Reply-To: <26b4e765-9fd2-47d6-8ee1-639c253c0df6@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 10 Nov 2025 09:17:12 +0100
X-Gm-Features: AWmQ_blBzgrQOMCix530Un7kE7VY3mDm-7p7hpVR2pjbKosxmiZ3tbr2gJKPpgw
Message-ID: <CAMSfU+6bojSf344BChguojV7nhwP7=Q8yiK0YwOTkteT25RicQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
To: Yi Zhao <yi.zhao@windriver.com>
Cc: yi.zhao@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000f12710643392acb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 08:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121451

--0000000000000f12710643392acb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 nov. 2025 =C3=A0 09:08, Yi Zhao <yi.zhao@windriver.com> a =C3=A9=
crit :

>
> On 11/10/25 15:55, Yoann Congal wrote:
>
>
>
> Le sam. 8 nov. 2025 =C3=A0 15:18, Yi Zhao via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15Jdz=
RmFLAvPgmRlNwcN40j7$>
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :
>
>> Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
>> latest stable verison.
>>
>> Before the patch:
>> $ devtool latest-version menulibre
>> INFO: Current version: 2.4.0
>> INFO: Latest version:
>>
>> After the patch:
>> $ devtool latest-version menulibre
>> INFO: Current version: 2.4.0
>> INFO: Latest version: 2.4.0
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>  meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$>
>> | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$>
>> b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$>
>> index 71d3ab4d29..4c52249fed 100644
>> --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$>
>> +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>> <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN81Wey67$>
>> @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11
>> gobject-introspection-data"
>>  SRC_URI =3D "
>> https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz
>> <https://urldefense.com/v3/__https://github.com/bluesabre/$*7BBPN*7D/rel=
eases/download/$*7BBP*7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hDP=
Z1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRl=
N4rVMobI$>
>> "
>>  SRC_URI[sha256sum] =3D
>> "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
>>
>> +UPSTREAM_CHECK_URI =3D "https://github.com/bluesabre/menulibre/releases
>> <https://urldefense.com/v3/__https://github.com/bluesabre/menulibre/rele=
ases__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7=
ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN2yK_rrE$>
>> "
>> +UPSTREAM_CHECK_REGEX =3D "releases/tag/menulibre-(?P<pver>\d+(\.\d+)+)"
>>
>
> Have you thought about using the github-releases class?
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/g=
ithub-releases.bbclass
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-co=
re/tree/meta/classes-recipe/github-releases.bbclass__;!!AjveYdw8EvQ!bKY-Z8h=
DPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgm=
RlN7VVUaMq$>
>
> It doesn't work because the website address doesn't conform to the format
> in github-releases.bbclass:
>
> --2025-11-10 16:04:14--  https://github.com/menulibre/menulibre/releases/
> Resolving github.com (github.com)... 20.205.243.166
> Connecting to github.com (github.com)|20.205.243.166|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2025-11-10 16:04:14 ERROR 404: Not Found.
>
> INFO: Current version: 2.4.0
> INFO: Latest version:
>
>
> There is no https://github.com/menulibre/menulibre/releases/ , but
> https://github.com/bluesabre/menulibre/releases
>

You can maybe override GITHUB_BASE_URI and get the UPSTREAM_CHECK_*
variable "for free"?


>
> //Yi
>
>
>
>> +
>>  do_compile[noexec] =3D "1"
>>
>>  do_install:append() {
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121387):
>> https://lists.openembedded.org/g/openembedded-devel/message/121387
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-devel/message/121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPu=
TzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$>
>> Mute This Topic: https://lists.openembedded.org/mt/116187911/4316185
>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/116187911=
/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUE=
xnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN6CRz5Io$>
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbr=
Xy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN-vzl8RS$>
>> [yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000f12710643392acb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 nov. 2025 =C3=A0=C2=A009:08, Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriv=
er.com">yi.zhao@windriver.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 11/10/25 15:55, Yoann Congal wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 8 nov. 2025 =
=C3=A0=C2=A015:18,
            Yi Zhao via <a href=3D"https://urldefense.com/v3/__http://lists=
.openembedded.org__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhN=
qbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlNwcN40j7$" target=3D"_blank">lis=
ts.openembedded.org</a>
            &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.openemb=
edded.org" target=3D"_blank">eng.windriver.com@lists.openembedded.org</a>&g=
t;
            a =C3=A9crit=C2=A0:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the
            correct<br>
            latest stable verison.<br>
            <br>
            Before the patch:<br>
            $ devtool latest-version menulibre<br>
            INFO: Current version: 2.4.0<br>
            INFO: Latest version:<br>
            <br>
            After the patch:<br>
            $ devtool latest-version menulibre<br>
            INFO: Current version: 2.4.0<br>
            INFO: Latest version: 2.4.0<br>
            <br>
            Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.=
com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0meta-xfce/recipes-apps/menulibre/<a href=3D"https://urlde=
fense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8Ga=
ffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81Wey67$=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a>
            | 3 +++<br>
            =C2=A01 file changed, 3 insertions(+)<br>
            <br>
            diff --git a/meta-xfce/recipes-apps/menulibre/<a href=3D"https:=
//urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1=
rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8=
1Wey67$" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a>
            b/meta-xfce/recipes-apps/menulibre/<a href=3D"https://urldefens=
e.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPb=
WE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81Wey67$" re=
l=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
            index 71d3ab4d29..4c52249fed 100644<br>
            --- a/meta-xfce/recipes-apps/menulibre/<a href=3D"https://urlde=
fense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8Ga=
ffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81Wey67$=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
            +++ b/meta-xfce/recipes-apps/menulibre/<a href=3D"https://urlde=
fense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8Ga=
ffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81Wey67$=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
            @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D &quot;x11
            gobject-introspection-data&quot;<br>
            =C2=A0SRC_URI =3D &quot;<a href=3D"https://urldefense.com/v3/__=
https://github.com/bluesabre/$*7BBPN*7D/releases/download/$*7BBP*7D/$*7BBP*=
7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhN=
qbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN4rVMobI$" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/bluesabre/${BPN}/releases/download/${BP}=
/${BP}.tar.gz</a>&quot;<br>
            =C2=A0SRC_URI[sha256sum] =3D
            &quot;d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465=
f593c9f&quot;<br>
            <br>
            +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urldefense.com=
/v3/__https://github.com/bluesabre/menulibre/releases__;!!AjveYdw8EvQ!bKY-Z=
8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvP=
gmRlN2yK_rrE$" rel=3D"noreferrer" target=3D"_blank">https://github.com/blue=
sabre/menulibre/releases</a>&quot;<br>
            +UPSTREAM_CHECK_REGEX =3D
            &quot;releases/tag/menulibre-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<=
br>
          </blockquote>
          <div><br>
          </div>
          <div>Have you thought about using the=C2=A0github-releases class?=
</div>
          <div><a href=3D"https://urldefense.com/v3/__https://git.openembed=
ded.org/openembedded-core/tree/meta/classes-recipe/github-releases.bbclass_=
_;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUT=
bNXw-L7ZA15JdzRmFLAvPgmRlN7VVUaMq$" target=3D"_blank">https://git.openembed=
ded.org/openembedded-core/tree/meta/classes-recipe/github-releases.bbclass<=
/a></div>
        </div>
      </div>
    </blockquote>
    <p><span lang=3D"en"><span><span>It doesn&#39;t work because the websit=
e address
            doesn&#39;t conform to the format in github-releases.bbclass:</=
span></span></span></p>
    <p>--2025-11-10 16:04:14--=C2=A0
      <a href=3D"https://github.com/menulibre/menulibre/releases/" target=
=3D"_blank">https://github.com/menulibre/menulibre/releases/</a><br>
      Resolving <a href=3D"http://github.com" target=3D"_blank">github.com<=
/a> (<a href=3D"http://github.com" target=3D"_blank">github.com</a>)... 20.=
205.243.166<br>
      Connecting to <a href=3D"http://github.com" target=3D"_blank">github.=
com</a> (<a href=3D"http://github.com" target=3D"_blank">github.com</a>)|20=
.205.243.166|:443...
      connected.<br>
      HTTP request sent, awaiting response... 404 Not Found<br>
      2025-11-10 16:04:14 ERROR 404: Not Found.<br>
      <br>
      INFO: Current version: 2.4.0<br>
      INFO: Latest version:=C2=A0</p>
    <p><br>
    </p>
    <p>There is no=C2=A0<a href=3D"https://github.com/menulibre/menulibre/r=
eleases/" target=3D"_blank">https://github.com/menulibre/menulibre/releases=
/</a> ,
      but <a href=3D"https://github.com/bluesabre/menulibre/releases" targe=
t=3D"_blank">https://github.com/bluesabre/menulibre/releases</a></p></div><=
/blockquote><div><br></div><div>You can maybe override=C2=A0GITHUB_BASE_URI=
 and get the=C2=A0UPSTREAM_CHECK_* variable &quot;for free&quot;?</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <p><br>
    </p>
    <p>//Yi</p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            =C2=A0do_compile[noexec] =3D &quot;1&quot;<br>
            <br>
            =C2=A0do_install:append() {<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#121387): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-devel/message/121387__;!=
!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNX=
w-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121387</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/116187911/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rIn=
c8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN6CRz=
5Io$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116187911/4316185</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists=
.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openemb=
edded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hDPZ1r=
Inc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN-v=
zl8RS$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoa=
nn.congal@smile.fr</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <br>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</fo=
nt>
            <div><font face=3D"Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000000f12710643392acb--

