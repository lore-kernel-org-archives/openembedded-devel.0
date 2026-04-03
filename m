Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A2CE8538C
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:05:04 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1633.1775239504323711120
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eqoAc1WB;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6500040f128so1964996d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 11:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775239503; cv=none;
        d=google.com; s=arc-20240605;
        b=hSEZMaDhif3M6ZMoe5b/FjO36iCMcAA+nvU+NehCgMenprMap/R0pJFy4ySybHmo9j
         ZKLqY/zuraXAyXtOA1hBEtzcLo7eE/uM+OcZer3f+rwKAdr5jgzwJ4fy+BG127YsHPP9
         o1WgawqEHRvkrIxCnlVr5jPck4xTeY/t6qFidrPdOsUxgZhfrW+6jDfx131p2/M3qkCP
         pBrk6FHchtme7zrOxO0WL5Bk4RtkdoQXd2k0sM7U00BohOnBJzyzwFCi73podcS7M9Vx
         d0wd3kUvFKsQfh3rFnpb1tNWjYnKuw6NYyLPjOGLCBdeOBwyTFBUEqEGj3K0AAY83JCs
         ovNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OFV2iAH4b11+GiTf05jwLgX2ZsOwjA211aUJUkgGPpU=;
        fh=Tjun94z5QcpIKl7rcFTSxMI3vHiekwoX6jPxW2Hh8r0=;
        b=gBiDsWRqqO4O3a6wLdAhgLwQTJG+zmSoANGyxwpTiwSIrJnHr4iOmtw1WlQW+RL8w2
         PmVxpGBkMkLt8ls/Xnfk499218yzb2eH4+mUh9nrNIwsYd2ylm1DV4r1p8YYG+N12ymm
         Qu5O5m2l7LwD4Mg8Xkf880Cr8mqnsWFQosSPyWc8Fie8fVW+F92x96N6RfhmrolFNGCq
         U/++7XMcwMJx/Lksn0luVkd3+g9EZxUkwBp1nhhpUenx5PgQ/HYOlnG0ejz2AsdYJ1Ew
         iT8RzxyKz0qcRcdEfFX1OQcfEpASzCuefUAsSng8a+ZX6E2M0H8v1T07tVzJHyqdSMzK
         RhYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775239503; x=1775844303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFV2iAH4b11+GiTf05jwLgX2ZsOwjA211aUJUkgGPpU=;
        b=eqoAc1WBbaVl84k8edTKa8u/7BlFk4t7xuTOxTH2t4N/4wRbtP7bc75wt314jszFFe
         8+uWolgsiz8JZIgjvSeZ4a6bTUJNWc5BUiWTupqsGzUfz3cOF2HfFsH975pDpJBf2OR7
         6U0nwS/vnXlYgvLz01Fr41pHzxAXzV1VybOD53hogIreVNUQFEG6SqGFFPPKlQTM1z3t
         USvEOjyYgnLTN4HJH0t8GCojAU9htgmEgU/x5MRzXbAXBI1rvLklB47tlPHP/iTXXkYB
         uwBf/KyWaaTY4Km+eHwbYmfggh/7GAqRAZTIyF9l400+Jhoa5b2fPUpoXElAbyjAIjbD
         r52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239503; x=1775844303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFV2iAH4b11+GiTf05jwLgX2ZsOwjA211aUJUkgGPpU=;
        b=b1DxyalZJofKwH867ryRpaeT1Xx5ikui9+7LZ+WW3BwyheO8omK98pEc/FoiEvzZJV
         +bLdt7REm/RHIABN++4e1cobfRpRGSORKahI0JWB98NygWZfE5HD87CLfiXjy67SsTTr
         kFmShDF1u13lKTCC7gh8ScpABNy0M/GNbo1XC3ttnRg1nFciq0Kb/jS/6ltqiSZQPHn3
         LgASJAWbYn+M7TziHf44PUYd/aQuucC81BFgDnkL6i25fJYmNFZgoghkfmakxFWapSBT
         MJ1C60VO7y1dzgygZNX9m+q4DFU1THknMn5Jb5CGGS0HWAv2A3aP78fsmHlM+rZToC9M
         1C6A==
X-Gm-Message-State: AOJu0Yzs6R6h16ecJFNJokPCOiIK96OsxJGnc+2axIGw62K09qlOh+hx
	w8lSITk/jVdkyQlQz5RW6ItuVhh1NtYfDqy0wR3OZMo9huy+4H26ewlJzz+/oNahiu1sEpGaq+N
	aoX5/ZCMCgyVt9tBY8xDZDFhtyAAxWV7tYvCJ
X-Gm-Gg: AeBDievg7HKUBTpTn7GdbghHWsacMtc79Z+V/OTxBe09GluybM0pTSgunZCjKi84voB
	gWpLh/h3ybF/hobj2iXKSUj5wEBja+kvJqd6q9wssGscHJFiiZgPAWJT6aGIXfncUQDh9hrQizc
	WDPu9ks8jM7a94/6yHSe2Rjk2fCrNw0dhco5LuTTYOC17ZLTJmPO6icxAODma/dNtxiTFd1+vdK
	sGsi6Sw92tvrDshCFw6cal1pQiH1gN4zd+Vovs6vGBt5VDKy53Pwg62pnbswpXywgZmhD2ECdNG
	coZr1dkXqFnrxd9V2iJUvf8zeO/NhO7yc2whhZxNXaiCuztl8DsD5w6AJRXJDFypPUT7U77WddY
	EG4jTPHiOjzywQeffIEJ8j+J5
X-Received: by 2002:a05:690e:130a:b0:64e:9cf7:95a5 with SMTP id
 956f58d0204a3-650488246c4mr3908877d50.44.1775239503245; Fri, 03 Apr 2026
 11:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260403101722.3656941-1-tafil@tafhub.de>
In-Reply-To: <20260403101722.3656941-1-tafil@tafhub.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Apr 2026 11:04:35 -0700
X-Gm-Features: AQROBzAEOUMa_JWF94BCI427YUns4ytI_DrzlJQwHn_7aeVfsBtloxNir0U4Xf0
Message-ID: <CAMKF1sp-XPXf=2cghJo9aqJJWdMewcckOySiU4pW3R2G3eeJFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fastfetch: upgrade 2.60.0 -> 2.61.0
To: tafil@tafhub.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb76e6064e922743"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 18:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125987

--000000000000fb76e6064e922743
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:18=E2=80=AFAM Tafil Avdyli via lists.openembedded.=
org
<tafil=3Dtafhub.de@lists.openembedded.org> wrote:

> The directx-headers dependency is no longer required and got removed
> from CMakeLists.txt
>
> Full changelog:
> https://github.com/fastfetch-cli/fastfetch/releases/tag/2.61.0
>
> Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
> ---
>  .../fastfetch/{fastfetch_2.60.0.bb =3D> fastfetch_2.61.0.bb}     | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-oe/recipes-support/fastfetch/{fastfetch_2.60.0.bb =3D>
> fastfetch_2.61.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
> b/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
> similarity index 97%
> rename from meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
> rename to meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
> index dbb999969b..e3394a7af5 100644
> --- a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
> +++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
> @@ -11,13 +11,12 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2090e7d93df7ad5a3d41f6fb4226ac76"
>  DEPENDS =3D "yyjson"
>
>  SRC_URI =3D "git://
> github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;branch=3Ddev;tag=
=3D${PV}
> <http://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;branch=3D=
dev;tag=3D$%7BPV%7D>
> "
> -SRCREV =3D "06ecc9c4805794ca8d632844e64950e82a6d5f7e"
> +SRCREV =3D "e5d600600614f5496b02907a11a7bc80c369d266"
>
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE +=3D "\
>      -DENABLE_SYSTEM_YYJSON=3DON \
> -    -DENABLE_DIRECTX_HEADERS=3DOFF \
>

There was another patch proposed earlier for upgrade. However I have
rebased this one on top of that
and taken the above change separately.


>  "
>
>  PACKAGECONFIG ??=3D "\
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125984):
> https://lists.openembedded.org/g/openembedded-devel/message/125984
> Mute This Topic: https://lists.openembedded.org/mt/118647414/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fb76e6064e922743
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, =
2026 at 3:18=E2=80=AFAM Tafil Avdyli via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;tafil=3D<a href=3D"mailto:tafhub.de@=
lists.openembedded.org">tafhub.de@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">The directx-headers=
 dependency is no longer required and got removed<br>
from CMakeLists.txt<br>
<br>
Full changelog:<br>
<a href=3D"https://github.com/fastfetch-cli/fastfetch/releases/tag/2.61.0" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/fastfetch-cli/fastf=
etch/releases/tag/2.61.0</a><br>
<br>
Signed-off-by: Tafil Avdyli &lt;<a href=3D"mailto:tafil@tafhub.de" target=
=3D"_blank">tafil@tafhub.de</a>&gt;<br>
---<br>
=C2=A0.../fastfetch/{<a href=3D"http://fastfetch_2.60.0.bb" rel=3D"noreferr=
er" target=3D"_blank">fastfetch_2.60.0.bb</a> =3D&gt; <a href=3D"http://fas=
tfetch_2.61.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.61.0.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/fastfetch/{<a href=3D"http://fastfetch=
_2.60.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.60.0.bb</a> =
=3D&gt; <a href=3D"http://fastfetch_2.61.0.bb" rel=3D"noreferrer" target=3D=
"_blank">fastfetch_2.61.0.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_=
2.60.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.60.0.bb</a> b/m=
eta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.61.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fastfetch_2.61.0.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2=
.60.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.60.0.bb</a><br>
rename to meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.6=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.61.0.bb</a><br>
index dbb999969b..e3394a7af5 100644<br>
--- a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.60.0.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.60.0.bb</a><br>
+++ b/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.61.0.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.61.0.bb</a><br>
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2090e7d=
93df7ad5a3d41f6fb4226ac76&quot;<br>
=C2=A0DEPENDS =3D &quot;yyjson&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/fastfetch-cli/fa=
stfetch.git;protocol=3Dhttps;branch=3Ddev;tag=3D$%7BPV%7D" rel=3D"noreferre=
r" target=3D"_blank">github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttp=
s;branch=3Ddev;tag=3D${PV}</a>&quot;<br>
-SRCREV =3D &quot;06ecc9c4805794ca8d632844e64950e82a6d5f7e&quot;<br>
+SRCREV =3D &quot;e5d600600614f5496b02907a11a7bc80c369d266&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_SYSTEM_YYJSON=3DON \<br>
-=C2=A0 =C2=A0 -DENABLE_DIRECTX_HEADERS=3DOFF \<br></blockquote><div><br></=
div><div>There was another patch proposed earlier for upgrade. However I ha=
ve rebased this one on top of that</div><div>and taken the above change sep=
arately.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;\<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125984): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125984" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125984</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118647414/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118647414/1997914</a><br>
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

--000000000000fb76e6064e922743--

