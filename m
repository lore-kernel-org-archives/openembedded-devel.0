Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C57CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 18:05:15 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16135.1763402714465999238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 10:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zdtq6cdZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63e19642764so3810273d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763402713; x=1764007513; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7dIwiBMvJB9CjoJ+gX1jmlFZ2c50ZDMjQxHieLJiHJo=;
        b=Zdtq6cdZr+OfQnL3vc8FGe1vYL4ZlVPvjcndh2WF6x2BRJqPmJ6nVKv3g7a5+TXpPg
         gkoRLPfnpWIA/HhRGmbd3h+mYHCts+ulEeaeVzoazHzzCaCkPGYf7cqx+09qnNhEW85v
         OI/gp+IvMdMQZN0V6xrBVSLk++kRE4yCYWC2FPKMITDFJKEWoA7ywyxxxeniaYa8qx9A
         otTHpEqxp2y5oTdgOvgWacYQyDszllU73imdpP9xOet8cyGTO6jamXE7dPMOLlHyGz/W
         fZX2AD2eWewPHxJ5VgSS+pQdVavObbpGjR3ks8PHphxdz6O/tIA09UvXmok3UAYn3ZWM
         RyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763402713; x=1764007513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dIwiBMvJB9CjoJ+gX1jmlFZ2c50ZDMjQxHieLJiHJo=;
        b=GkTTcBG5jLd4KgWJijeVgLB5ToU41AJAQgxkREEDLd0549jognAUmFU0ba5P6DfJL0
         f4+CGRD3QqHswf5P0b9k87GtqXVwReak3d34p7Mtd033F6rn1KarqGiHUNJ+Y+qW2QZG
         VjaJypytx2wsoSrKmHUBAwWbSZErfgyXySLl3QElttFNvqiAHTmp4azxqiUYq/eX+KBS
         R66kwRejONjm8l1SnXpbA+h8Ru+9l803P9uLCarr2H+fShViY99zl2Nn1sdxxNzLTSSy
         OwDXp/yQMr8YDG1f9pcXSFUZeEJBLQyOvYJzJwBHJ3q8y0zSEfOL0AUiXeOad81kvOKC
         9b3w==
X-Gm-Message-State: AOJu0YyqcrMzG6d955b8uXLkYeSXlIu9REQzpE2I5Cran7Txb4/CptI0
	eLnB4K7dVXn2OQAg0T7z958j8pDr8fuMJT1D4/xgslSxrq0mofzGEucTG4i//Klj9BKWD8GTS/X
	V9EoPhiRBRVCnEM7dQc2m/HMEp8x6+V0V/JK5saw=
X-Gm-Gg: ASbGncsdtwmiT9Te0d+1L5G1KXB0ICY2ewSAbVs3ytJiSRfC9i1y/ppl35LnoMSIkpi
	vFHQ95XB1PlkLx+b+g9GtJqIb463NfdXW6IvV7jifzed8Bu7pr6OGGCj/bgvACWl5RL5RVFfdyk
	aoGZmZRTK/Sq/yXEHXIMWOVtuETlnu/9qR6tN6/wYhmpI6lCtzdAMIJTeJMv4YjHAyS5sXuhLLn
	4BYFTFTzHZw4CNfRskCz+qSasjRi5JfaMVFNvvxMCZnLuRvB5ZIdHcaRGe0Jxq4FxueRNlqbRVt
	YiK4xTjm79KWLBB4lVgP3xZmXtU7Cli0q/o5iK4tCwsUQwuumivUVVVM22EOSO/LvN1LoMd6FNr
	FeBHInrXMUVVs
X-Google-Smtp-Source: AGHT+IEygKNBV3Aud2HW04HctW26gN4kvv74+W8eJJOR1c3ELeRlz438G/SntmIKyL7w33Yt8fb5DwOSXaDRxlaBiOM=
X-Received: by 2002:a53:acc3:0:10b0:63f:aef7:d01b with SMTP id
 956f58d0204a3-641e7555715mr9318356d50.8.1763402713396; Mon, 17 Nov 2025
 10:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20251117075131.2751-1-liuyd.fnst@fujitsu.com> <CAMKF1soY203r5wKKteDzEgumPZQHr8bBpzJvWHjYmNFaNrVJYA@mail.gmail.com>
 <TY3PR01MB11889865B0739EE9350A2886E9BC9A@TY3PR01MB11889.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11889865B0739EE9350A2886E9BC9A@TY3PR01MB11889.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Nov 2025 10:04:47 -0800
X-Gm-Features: AWmQ_blcpl2x9qhWMOlfNmuDwiU6lWkt0deYW2Fdx2xSNRrqmG2Ge17dCp1IPJU
Message-ID: <CAMKF1srFxtrZAVCdp8rFedTYCSXT_pbtAEy2HgjsP6F6FbtAGg@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH] python3-imageio: upgrade 2.37.0 -> 2.37.2
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053f87f0643ce3063"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121784

--00000000000053f87f0643ce3063
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 2:16=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

> Hi Khem
> When updraded to 2.37.2, there is no setup.py file in the source of
> python3-imageio.
>
> So it caused error as following in do_compile:
>
> ERROR: python3-imageio-2.37.2-r0 do_compile: Execution of
> '.../tmp/work/x86-64-v3-poky-linux/python3-imageio/2.37.2/temp/run.do_com=
pile.411383'
> failed with exit code 2
> ERROR: Logfile of failure stored in:
> .../tmp/work/x86-64-v3-poky-linux/python3-imageio/2.37.2/temp/log.do_comp=
ile.411383
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | nativepython3: can't open file
> '.../tmp/work/x86-64-v3-poky-linux/python3-imageio/2.37.2/sources/imageio=
-2.37.2/setup.py':
> [Errno 2] No such file or directory
> | WARNING: exit code 2 from a shell command.
>
> So I change setuptools3 to python_setuptools_build_meta to fix this issue=
.
>
>
That change I am not worried about. But why did LICENSE_CHECKSUM change ?


>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Khem Raj <raj.khem@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2025/11/17 16:28
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *=E4=B8=BB=E9=A2=98:* Re: [oe][meta-python][PATCH] python3-imageio: upgra=
de 2.37.0 ->
> 2.37.2
>
>
>
> On Sun, Nov 16, 2025 at 11:52=E2=80=AFPM Yiding Liu (Fujitsu) via
> lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
> wrote:
>
> Changelog:
>  https://github.com/imageio/imageio/releases/tag/v2.37.2
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...{python3-imageio_2.37.0.bb =3D> python3-imageio_2.37.2.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-imageio_2.37.0.bb =
=3D>
> python3-imageio_2.37.2.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.b=
b
>  b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
> rename to meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> index 5de9ee466c..582cd348f9 100644
> --- a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> @@ -3,10 +3,10 @@ write a wide range of image data, including animated
> images, video, \
>  volumetric data, and scientific formats."
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D24cb9a367a9e641b459a01c4d1525=
6ba"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9da78aa88ef5e9acd41f7bb288286=
273"
>
>
> what changed here ?
>
>
> -SRC_URI[sha256sum] =3D
> "71b57b3669666272c818497aebba2b4c5f20d5b37c81720e5e1a56d59c492996"
> +SRC_URI[sha256sum] =3D
> "0212ef2727ac9caa5ca4b2c75ae89454312f440a756fcfc8ef1993e718f50f8a"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D "python3-numpy python3-pillow"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121760):
> https://lists.openembedded.org/g/openembedded-devel/message/121760
> Mute This Topic: https://lists.openembedded.org/mt/116334258/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053f87f0643ce3063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 17,=
 2025 at 2:16=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.f=
nst@fujitsu.com">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-285780337100186619=
8">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Khem</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
When updraded to 2.37.2, there is no setup.py file in the source of python3=
-imageio.<br>
<br>
So it caused error as following in do_compile:<br>
<br>
ERROR: python3-imageio-2.37.2-r0 do_compile: Execution of &#39;.../tmp/work=
/x86-64-v3-poky-linux/python3-imageio/2.37.2/temp/run.do_compile.411383&#39=
; failed with exit code 2</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
ERROR: Logfile of failure stored in: .../tmp/work/x86-64-v3-poky-linux/pyth=
on3-imageio/2.37.2/temp/log.do_compile.411383</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Log data follows:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| DEBUG: Executing shell function do_compile</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| nativepython3: can&#39;t open file &#39;.../tmp/work/x86-64-v3-poky-linux=
/python3-imageio/2.37.2/sources/imageio-2.37.2/setup.py&#39;: [Errno 2] No =
such file or directory</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| WARNING: exit code 2 from a shell command.<br>
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
So I change setuptools3=C2=A0to python_setuptools_build_meta to fix this is=
sue.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div><br></div><div>That change I am not=
 worried=C2=A0about. But why did LICENSE_CHECKSUM change ?</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-2=
857803371001866198"><div dir=3D"ltr"><div style=3D"font-family:Aptos,Aptos_=
EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-2857803371001866198divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02025/11/17 16:28<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>=C2=A0Liu, Yiding/=E5=88=98 =E4=B9=99=E4=
=B8=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuy=
d.fnst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b>=C2=A0<a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.o=
rg</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b>=C2=A0Re: [oe][meta-python][PATCH] python3-imagei=
o: upgrade 2.37.0 -&gt; 2.37.2</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Sun, Nov 16, 2025 at 11:52=E2=80=AFPM Yidin=
g Liu (Fujitsu) via
<a id=3D"m_-2857803371001866198OWA8fac1d50-5810-ddd5-f46f-7c92a2fbb96f" hre=
f=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a>=C2=A0&lt;liuyd.fnst=3D<a id=3D"m_-28578033710018=
66198OWA4c31850c-4d6c-9335-08d4-64198d7432b4" href=3D"mailto:fujitsu.com@li=
sts.openembedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org<=
/a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">Changelog:<br>
=C2=A0<a id=3D"m_-2857803371001866198OWAff9a1fb9-0c62-c69c-fc09-ccc7e419686=
4" href=3D"https://github.com/imageio/imageio/releases/tag/v2.37.2" target=
=3D"_blank">https://github.com/imageio/imageio/releases/tag/v2.37.2</a><br>
<br>
Signed-off-by: Liu Yiding &lt;<a id=3D"m_-2857803371001866198OWA94d9132f-f4=
ac-b6dd-c558-3cc466c6758c" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D=
"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a id=3D"m_-2857803371001866198OWA06f7909c-21d5-8d7f-0997-75830d0=
b9b14" href=3D"http://python3-imageio_2.37.0.bb" target=3D"_blank">python3-=
imageio_2.37.0.bb</a>=C2=A0=3D&gt;
<a id=3D"m_-2857803371001866198OWA820b6a55-507e-f376-429e-884e5d6c0edb" hre=
f=3D"http://python3-imageio_2.37.2.bb" target=3D"_blank">
python3-imageio_2.37.2.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a id=3D"m_-2857803371001=
866198OWAecf8ffda-a768-20cd-3eba-3eef696e7f4b" href=3D"http://python3-image=
io_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a>=C2=A0=3D&gt;
<a id=3D"m_-2857803371001866198OWAcb63aeae-165e-5d97-1b06-bf2a5f2047cb" hre=
f=3D"http://python3-imageio_2.37.2.bb" target=3D"_blank">
python3-imageio_2.37.2.bb</a>} (58%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a id=3D"m_-28578033710018=
66198OWA1d7e1372-c8bb-0841-8c49-57edc8df5392" href=3D"http://python3-imagei=
o_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a>=C2=A0b/meta-py=
thon/recipes-devtools/python/<a id=3D"m_-2857803371001866198OWA0be12d79-608=
8-8f3f-72a6-0495d70e4760" href=3D"http://python3-imageio_2.37.2.bb" target=
=3D"_blank">python3-imageio_2.37.2.bb</a><br>
similarity index 58%<br>
rename from meta-python/recipes-devtools/python/<a id=3D"m_-285780337100186=
6198OWA7671f0ed-0b73-f3ad-e36f-aeb58e99a4af" href=3D"http://python3-imageio=
_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a id=3D"m_-28578033710018661=
98OWA31e69783-7e09-b1a5-0389-b3d2edea23e8" href=3D"http://python3-imageio_2=
.37.2.bb" target=3D"_blank">python3-imageio_2.37.2.bb</a><br>
index 5de9ee466c..582cd348f9 100644<br>
--- a/meta-python/recipes-devtools/python/<a id=3D"m_-2857803371001866198OW=
A2d3da1d4-cf3a-4b8d-a1cb-8517e9256032" href=3D"http://python3-imageio_2.37.=
0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a id=3D"m_-2857803371001866198OW=
A17626e42-daad-a0fa-9e7a-4373862dd9a3" href=3D"http://python3-imageio_2.37.=
2.bb" target=3D"_blank">python3-imageio_2.37.2.bb</a><br>
@@ -3,10 +3,10 @@ write a wide range of image data, including animated imag=
es, video, \<br>
=C2=A0volumetric data, and scientific formats.&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D24cb9a367a9e641b459a01c4d1=
5256ba&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9da78aa88ef5e9acd41f7bb288=
286273&quot;<br>
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">what changed here ?</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">-SRC_URI[sha256sum] =3D &quot;71b57b3669666272=
c818497aebba2b4c5f20d5b37c81720e5e1a56d59c492996&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0212ef2727ac9caa5ca4b2c75ae89454312f440a756fc=
fc8ef1993e718f50f8a&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-numpy python3-pillow&quot;<br>
--<br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121760): <a id=3D"m_-2857803371001866198OWAebe637b9-d2f=
1-e755-1181-7e3152759164" href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/message/121760" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/121760</a><br>
Mute This Topic: <a id=3D"m_-2857803371001866198OWA8ce60f21-3b5e-37f9-9951-=
b196be48c5c8" href=3D"https://lists.openembedded.org/mt/116334258/1997914" =
target=3D"_blank">
https://lists.openembedded.org/mt/116334258/1997914</a><br>
Group Owner: <a id=3D"m_-2857803371001866198OWA10e260b5-9da7-e99e-6809-1093=
249e6e69" href=3D"mailto:openembedded-devel%2Bowner@lists.openembedded.org"=
 target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a id=3D"m_-2857803371001866198OWA0af77a0e-602a-dfd6-bfcf-3d91=
3e79cfdc" href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub=
" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>=C2=A0[<a id=
=3D"m_-2857803371001866198OWA28ac9f6f-b82f-d800-29fd-a72ec5b88fdb" href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
</div>

</div></blockquote></div></div>

--00000000000053f87f0643ce3063--

