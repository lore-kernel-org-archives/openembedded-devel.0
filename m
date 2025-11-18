Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84490CEBF8D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:21:26 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2431.1763432482980752889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihiq95GL;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63e16fbdd50so4528765d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763432482; x=1764037282; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amGb4m8oWewShaVf8KyksxIsaZ6vtTNCO/aqNFcYNu0=;
        b=ihiq95GL1bKGPNg0r8GrGXYh3vZ3ACQTcip5ITV37xWXMyal5K6tN0N7bMmSYqP/mI
         ngd8rzDuNKsqdv7ObArvagkGAzl7/mCpPOVzlOpbCrn7qKLU6lI6UpQe3vaR+zyD3/Ov
         MEqkZl6FL90GmFarKAssT/c4TCWyT01jlkeiUSnNpu9AwEdszONBJjdpyIC4omxd5ag6
         AMS8yAPCsgTVSTbyZnhoH94MKVhJhlUQwG11GbSNZhbYPTX7O+lJHrDn11kRRoxxjGCU
         nacQyXJDCoIsPfdgzDO/Efi3wzOPrZt77SyESCPiOE/OY/d1+szxP8kbY5mNUteQNwyr
         HISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763432482; x=1764037282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amGb4m8oWewShaVf8KyksxIsaZ6vtTNCO/aqNFcYNu0=;
        b=cPAIInkrSPP3Ycx4d9c7iDcCTLi7zJr6XFm/E8meIRvKtG3oYRJ/GuHnPB6j221uVK
         auZk7raBdCrXvzOIlGJX4WmPqJXqCVAa2eYCJaXoCIcldgz1ZU/9oiAXC4ypYt5H0rVq
         358t71ri6ojjjUTI4XvfE0vwAC+OkQD0YACPsNR/nJcWlTY0n+qfzVEzid3Scjst/K9Z
         7A+l2RRRX9Jqe/kqiLAtionZss6saxefQt1/1oya1BOdvmzmD0hyAMH8LXIZxsNdGOpN
         2OBWaYgACADzWLzr3Qm6r395NCWpyutOy32vcoAMZnH5SrB6AtWNLjbXmFeojbEPPzTL
         o05g==
X-Gm-Message-State: AOJu0Yx2Sc1rYVq5HdoJq+Njx+BzMiCDFtbnbSs6jKDmKXKweBxPcvi4
	BJ/kBGhlS/ioDrPF2lq6pa8r9WGGsAvaF35diOQCnL1Ov82RpQ1Bgr6VQ+J56oVohX2BT7rhgMT
	tdZWdnPjVC5hNbKQJabPNME3WToYz9DA=
X-Gm-Gg: ASbGncuADm0FF3RifM+ruxwgXjRL7zmDulJLw1U9gsJFKWOqPmQry1FEZNGDeRhWncQ
	iS5NzgKfD+R2UWoBdTvzyNcFNM/8IGbwawpMjaiR8J/a5bcFKP1e5zKXpEHTbCA4rzCvTQwAMp5
	wiihumFaXGJNnXxJwyKiZrNfsVX1tBFcL1qydmecmlNbNrKcnlrbPCLFjzNWqH68yRgAG8KuYHL
	bYEb5IWVC2zEU6qk+HedHwJ6K5wmnY14H+srvD/xRKuxPJLuap9v5ABZfs7ghBsz115H1qACIFs
	+ljNvXamyGXPa8RTkN5HlQvIwcm9u7HQjW5oIH7XrLUGtqRIQU37l2yqcn5DHAJbkiRzcTK5799
	2s38uCq8D5Ify7LaeXKR7T2Ta1AE=
X-Google-Smtp-Source: AGHT+IHqV+u23ftYmxKQ8YLULiAHbtNx9Pl1QuZ0JrNNIoVGvQ1D8aYrJtoJo2Lzgh19TIvjgmzXM7h11oYVhL2LP8A=
X-Received: by 2002:a05:690e:c49:b0:641:f5bc:6968 with SMTP id
 956f58d0204a3-642084aff4bmr3455295d50.84.1763432481928; Mon, 17 Nov 2025
 18:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20251117075131.2751-1-liuyd.fnst@fujitsu.com> <CAMKF1soY203r5wKKteDzEgumPZQHr8bBpzJvWHjYmNFaNrVJYA@mail.gmail.com>
 <TY3PR01MB11889865B0739EE9350A2886E9BC9A@TY3PR01MB11889.jpnprd01.prod.outlook.com>
 <CAMKF1srFxtrZAVCdp8rFedTYCSXT_pbtAEy2HgjsP6F6FbtAGg@mail.gmail.com> <TY3PR01MB11889BD38B96BC6C3ADB667F49BD6A@TY3PR01MB11889.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11889BD38B96BC6C3ADB667F49BD6A@TY3PR01MB11889.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Nov 2025 18:20:55 -0800
X-Gm-Features: AWmQ_bkcL8hM9s9HcunCuv8FHA-pZHRmRMAfToaiJzzxlcUEQEXIUde-ua6GWss
Message-ID: <CAMKF1sripy7Cm=ihTctNOorN5T=nXn-uYmHKRaykLWSeDO1BXQ@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH] python3-imageio: upgrade 2.37.0 -> 2.37.2
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000abb8b50643d51ee9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121797

--000000000000abb8b50643d51ee9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:21=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

> Hi Khem
>      I'm sorry to misunderstand it.
>      The date of Licence file changed, so LICENSE_CHECKSUM changed.
>      I will send a V2 patch to describe it.
>
>

Thanks.



>
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Khem Raj <raj.khem@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2025/11/18
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
> On Mon, Nov 17, 2025 at 2:16=E2=80=AFAM Yiding Liu (Fujitsu) <
> liuyd.fnst@fujitsu.com> wrote:
>
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
> That change I am not worried about. But why did LICENSE_CHECKSUM change ?
>
>
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

--000000000000abb8b50643d51ee9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 17,=
 2025 at 5:21=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.f=
nst@fujitsu.com">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-542814520141427602=
7">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:black">
Hi Khem<br>
=C2=A0 =C2=A0 =C2=A0I&#39;m sorry to misunderstand it.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt">
<span style=3D"color:black">=C2=A0 =C2=A0 =C2=A0The date of Licence file ch=
anged, so </span><span style=3D"color:rgb(0,0,0)">LICENSE_CHECKSUM changed.=
</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0I will send a V2 patch to <span style=3D"font-weight:50=
0">describe</span>=C2=A0it.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0</div></div></div></blockquote><div><br></div><div>Than=
ks.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div class=3D"msg-5428145201414276027"><div dir=3D"ltr"><di=
v style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri=
,Helvetica,sans-serif;font-size:12pt;color:black">=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-5428145201414276027divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02025/11/18<br>
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
<div style=3D"direction:ltr">On Mon, Nov 17, 2025 at 2:16=E2=80=AFAM Yiding=
 Liu (Fujitsu) &lt;<a id=3D"m_-5428145201414276027OWA46ebb867-bc3d-8f4e-9d1=
0-8e3aad309a04" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">li=
uyd.fnst@fujitsu.com</a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Khem</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
When updraded to 2.37.2, there is no setup.py file in the source of python3=
-imageio.<br>
<br>
So it caused error as following in do_compile:<br>
<br>
ERROR: python3-imageio-2.37.2-r0 do_compile: Execution of &#39;.../tmp/work=
/x86-64-v3-poky-linux/python3-imageio/2.37.2/temp/run.do_compile.411383&#39=
; failed with exit code 2</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
ERROR: Logfile of failure stored in: .../tmp/work/x86-64-v3-poky-linux/pyth=
on3-imageio/2.37.2/temp/log.do_compile.411383</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Log data follows:</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| DEBUG: Executing shell function do_compile</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| nativepython3: can&#39;t open file &#39;.../tmp/work/x86-64-v3-poky-linux=
/python3-imageio/2.37.2/sources/imageio-2.37.2/setup.py&#39;: [Errno 2] No =
such file or directory</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
| WARNING: exit code 2 from a shell command.<br>
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
So I change setuptools3=C2=A0to python_setuptools_build_meta to fix this is=
sue.</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">That change I am not worried=C2=A0about. But w=
hy did LICENSE_CHECKSUM change ?</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"direction:ltr;display:inline-block;width:98%">
<div id=3D"m_-5428145201414276027x_m_-2857803371001866198divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Khem Raj &lt;<a id=3D"m_-542814520=
1414276027OWA1c11dea0-d029-1e82-596b-54c926ebae28" href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02025/11/17 16:28<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>=C2=A0Liu, Yiding/=E5=88=98 =E4=B9=99=E4=
=B8=81 &lt;<a id=3D"m_-5428145201414276027OWA9b6517ff-843c-fab3-4662-3018e1=
394527" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst=
@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b>=C2=A0<a id=3D"m_-5428145201414276027OWAeffd8c64-=
2a86-6f21-82a5-33001da4b37a" href=3D"mailto:openembedded-devel@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a>=
=C2=A0&lt;<a id=3D"m_-5428145201414276027OWA30c8aee1-6023-bbe1-a302-e826e03=
9f8df" href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a>&gt;<br>
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
<a id=3D"m_-5428145201414276027OWAaa4b4b9d-afee-dba7-fa28-0c9f60eabab4" hre=
f=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a>=C2=A0&lt;liuyd.fnst=3D<a id=3D"m_-54281452014142=
76027OWA85d4027b-4180-de0d-4700-d256b72c4fbd" href=3D"mailto:fujitsu.com@li=
sts.openembedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org<=
/a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">Changelog:<br>
=C2=A0<a id=3D"m_-5428145201414276027OWA03d2a014-b597-6ab4-121e-f7acaba5a62=
2" href=3D"https://github.com/imageio/imageio/releases/tag/v2.37.2" target=
=3D"_blank">https://github.com/imageio/imageio/releases/tag/v2.37.2</a><br>
<br>
Signed-off-by: Liu Yiding &lt;<a id=3D"m_-5428145201414276027OWAce07b5fe-ec=
ea-343f-1479-560babbfd3c9" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D=
"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a id=3D"m_-5428145201414276027OWA21289cb2-2225-f26b-4c36-289c0a2=
0086a" href=3D"http://python3-imageio_2.37.0.bb" target=3D"_blank">python3-=
imageio_2.37.0.bb</a>=C2=A0=3D&gt;
<a id=3D"m_-5428145201414276027OWAba33e645-361a-65bd-f077-723114fc4ea2" hre=
f=3D"http://python3-imageio_2.37.2.bb" target=3D"_blank">
python3-imageio_2.37.2.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a id=3D"m_-5428145201414=
276027OWA7a688b3c-18ff-74e7-05d1-e6fa40a1adfe" href=3D"http://python3-image=
io_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a>=C2=A0=3D&gt;
<a id=3D"m_-5428145201414276027OWA718f56ce-1375-abdb-a61f-9012433900c8" hre=
f=3D"http://python3-imageio_2.37.2.bb" target=3D"_blank">
python3-imageio_2.37.2.bb</a>} (58%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a id=3D"m_-54281452014142=
76027OWA9292e0de-7d04-636a-6c7e-3aa5c3724fec" href=3D"http://python3-imagei=
o_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a>=C2=A0b/meta-py=
thon/recipes-devtools/python/<a id=3D"m_-5428145201414276027OWA3e2b5150-9d4=
1-0890-2363-07ef96ad27fb" href=3D"http://python3-imageio_2.37.2.bb" target=
=3D"_blank">python3-imageio_2.37.2.bb</a><br>
similarity index 58%<br>
rename from meta-python/recipes-devtools/python/<a id=3D"m_-542814520141427=
6027OWA2b865f0a-2f9e-20e5-fcec-0ca47b1228e6" href=3D"http://python3-imageio=
_2.37.0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a id=3D"m_-54281452014142760=
27OWA21e40234-e0ad-cb40-91a1-c76f7c9c74be" href=3D"http://python3-imageio_2=
.37.2.bb" target=3D"_blank">python3-imageio_2.37.2.bb</a><br>
index 5de9ee466c..582cd348f9 100644<br>
--- a/meta-python/recipes-devtools/python/<a id=3D"m_-5428145201414276027OW=
Afad7bfb2-ddaa-5094-698f-a767802da3f0" href=3D"http://python3-imageio_2.37.=
0.bb" target=3D"_blank">python3-imageio_2.37.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a id=3D"m_-5428145201414276027OW=
A0ce9ed0b-2115-2e51-fd91-3a109f02bdd4" href=3D"http://python3-imageio_2.37.=
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
View/Reply Online (#121760): <a id=3D"m_-5428145201414276027OWA689e09b6-dce=
5-e5bd-ce6f-72be72da9901" href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/message/121760" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/121760</a><br>
Mute This Topic: <a id=3D"m_-5428145201414276027OWA4861f4b3-7d9a-452d-2fce-=
26c0831d0655" href=3D"https://lists.openembedded.org/mt/116334258/1997914" =
target=3D"_blank">
https://lists.openembedded.org/mt/116334258/1997914</a><br>
Group Owner: <a id=3D"m_-5428145201414276027OWAcb30ea84-b97a-370a-3575-f073=
9a45094d" href=3D"mailto:openembedded-devel%2Bowner@lists.openembedded.org"=
 target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a id=3D"m_-5428145201414276027OWA10e2515d-c765-2e20-8140-3bdc=
471b763c" href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub=
" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>=C2=A0[<a id=
=3D"m_-5428145201414276027OWA60b53efb-e256-115d-2cc0-2fb72c1ff813" href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
</blockquote>
</div>

</div></blockquote></div></div>

--000000000000abb8b50643d51ee9--

