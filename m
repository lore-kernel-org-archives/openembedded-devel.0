Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E90CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:09:29 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29905.1782457759866317213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JL+g6Pxl;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662bf1dab83so1054857d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 00:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782457759; cv=none;
        d=google.com; s=arc-20260327;
        b=jMpggSvErZmnvWiTrgeTUgi+zR01134wd8+zjTG0OjTgDPlun1VzX/45dqtnHf+JnF
         gdrbpZs3l/w2BZLOZX/dDPY7MfWjX8vppPzIrDQ52wKK9gds0qZ+6rNPHAUNqkISBnm7
         ZCJPeeTZDtSZicJPHI6cpHUaJc8phU56feMB2oKGcjteZgnRsg9v3TpJa9cffgrB5i/C
         YeCfmSbA6U9AJnzSfH0OhtJcseeS0zlgCyXKS5dL0KYFLQBrWREmEg93uRN9jg6z+vQ0
         O+unyWbhF94YvyvG1VJOmiM6DcNqm50PXbqzG7tmvimxEyG0eQ/QsmPQ7HdR9d7Cotlj
         taGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yv2iqqoGPcWMCOQE70mg5z+N/zM+9uSrBO5Z5ZQ6z78=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=RY8LWq+BS3qhjIIRK1hJQ2pJYsCzFho6McJxVlsTcrDyjRVW46h2n03TAqEPNgZIYY
         f1Y1d9JbeChW4ROszJvr+Hnq85eklvYH3nKt8WbdWj24+XbnE9dCeXJqZ/I8kkdlSUTd
         bsyVe684VT+wmJPdxBWaGk19eXUkCVPxnks6No2nweTAjziay0t1qnWfuSOwpuIrNhsA
         ywpE2WfQQJCs0MX8FhE2MR3IQIsytn9QfuyNLvdb19s48BBViQiCdc64XdB7e7qdMCYE
         tFTBZeI6DigWN9CjruwiEWfwhHF/ZPju2tEKQpc0DFIEXjzbpo9pVJ24vXfeTA3X1FxZ
         ZDdg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782457759; x=1783062559; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yv2iqqoGPcWMCOQE70mg5z+N/zM+9uSrBO5Z5ZQ6z78=;
        b=JL+g6PxlvmS0rL8S6t6TOJVgakbKeWTrus4iMXnFcuCVsvUeHLlbyzSFennB+2bhEW
         5C8UK64ktzlkpJWZOTE0lLQ9QJYdS7prPnlgj+MvZFT0hhFOa/EnGOgCrci9MroRQe49
         km/VJocApzabA4gUn17oWXRlMPpfmpfgo1Z/C6fvRa0hUJYxF0qkhfDlT3dP70ojgD2W
         li0wC8dqO2DCJ0HlKsWNih9LfpWV2U7wtp1Ockgp0RNBEdAPgy9bKu90UVcwY8ZjsRCY
         m5kKj8RzAV1kXeNgbxJKemhcqOITkDyjEGHP6DXo8mRF1n3OX6+Rv+giurpTYussDiG1
         tAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782457759; x=1783062559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yv2iqqoGPcWMCOQE70mg5z+N/zM+9uSrBO5Z5ZQ6z78=;
        b=H6Nvz4PBEn7yZ6AD49X+hJkTLsm7j2rijxZh+vha+Akgu8i/jyIhcCls+z4CFRN0dh
         z2brAjSi0/gdLJzSXMv/2EPiq7xhW6RjbOng01I0hSZQ2JcyjnEZqOfzQVIHolrKFACo
         yNdjPSqwz1peY2IduxPCjI2HVGeCZle8iU41/Tenw/Kkg+TjVzCflzw4AYx4mkpP9x3J
         t0iUa6EQePdRT7pQCEMTWoK19HGkjhp3JORkJ80aSE4p1XOwqqH5LYWBPXGJelAJ3Mf1
         ME9yhGMvIWt1VPg20yz5FxAJG2yMQXJiDliO2B2T1q4EAHr6j2HMrzOL+Z3MIkPwffPJ
         1Edg==
X-Gm-Message-State: AOJu0YzXrhzJ4Em6eM2z0eGiMQtS4S6WTJjARvAaZxSKwHPocDQ9LHEJ
	+CwIhXs4POzvLULQwIcIihrjhtzqzAECJZxhLvSikN+9sLPc8VySuS2DcEVXg2FL4oe3j1R6nVu
	EYkD5c5RyiVJkE9ZLtDdcXRwxAoYAYEk=
X-Gm-Gg: AfdE7ckuZ38MN8gZmqdIUd+fKak/la1KSgeoHz5pOLbRQnya4J3s2r/EVIocjB9EULL
	lX58ne26QQ4IZrqP4KB6NzDMchQcToGaI0PHjpjSubdM7shg67fJir0GO2H+tFLjkn3l0hvwdZw
	20R9QL5kyF2QgMGBzHGuv9fwzJ2B837x2OekN6XzCos5wLcpxlLIsbMvHp4iz+0gLZ6Oy8hG3jM
	AXiPtu/Yaksr8GGjoU8dPhiQD/Zze9JRdcac7us2gsXMZ/t3v7jt0+v19rOvzRQySudyY+wEsAP
	T/idSpXftSEnoge9URu/IO/NvzKRqooLp04oXg3n8qElI61c144OIQSb8yo8EJ89/sJqvKa/dD7
	9CuMk95i/2VLrrxq7a1i9Ot5Jgw3cf2Ex7xgQwAfvzFPKpcGToSIy6Y/jVmarIdwwHwAo1w==
X-Received: by 2002:a05:690e:d4e:b0:660:6780:f3e4 with SMTP id
 956f58d0204a3-66487e09602mr4575371d50.27.1782457758822; Fri, 26 Jun 2026
 00:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260624133044.1093352-1-f_l_k@t-online.de> <20260624133044.1093352-2-f_l_k@t-online.de>
In-Reply-To: <20260624133044.1093352-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 00:08:52 -0700
X-Gm-Features: AVVi8CdBGwKvzZFQASe9JqMVnZ4ogrH7PluoxYRnXCtupCKjyTjM0vuA1xZ6BhA
Message-ID: <CAMKF1sp3_iZ-NaFJ3qrdEFiOAwqXw+WDCZPtmiF1_4vfP-iRDA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia:
 add libdvdread to RDEPENDS
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ab325065522c9ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127789

--0000000000008ab325065522c9ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This results in

ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch
packagegroup shouldn't depend on packages which are dynamically renamed
(libdvdread to libdvdread8)

On Wed, Jun 24, 2026 at 6:31=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> libdvdread has recently been moved to meta-multimedia and the 'libdvdred'
> runtime
> dependency was removed from packagegroup-meta-oe
> Add the runtime dependency to packagegroup-meta-multimedia so that is
> included in
> world builds again.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/
> packagegroup-meta-multimedia.bb
> b/meta-multimedia/recipes-multimedia/packagegroups/
> packagegroup-meta-multimedia.bb
> index 4da9de3ff9..4e4f58f14a 100644
> --- a/meta-multimedia/recipes-multimedia/packagegroups/
> packagegroup-meta-multimedia.bb
> +++ b/meta-multimedia/recipes-multimedia/packagegroups/
> packagegroup-meta-multimedia.bb
> @@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
>      pipewire \
>      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial",
> bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
>      libcamera \
> +    libdvdread \
>      vorbis-tools \
>      libopenmpt \
>      mimic \
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127715):
> https://lists.openembedded.org/g/openembedded-devel/message/127715
> Mute This Topic: https://lists.openembedded.org/mt/119956631/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008ab325065522c9ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This results in<div><br></div><div>ERROR: packagegroup-met=
a-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn&#=
39;t depend on packages which are dynamically renamed (libdvdread to libdvd=
read8)<br></div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2026 at 6:31=E2=80=AF=
AM Markus Volk via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.o=
rg">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">libdvdread has recently been moved to=
 meta-multimedia and the &#39;libdvdred&#39; runtime<br>
dependency was removed from packagegroup-meta-oe<br>
Add the runtime dependency to packagegroup-meta-multimedia so that is inclu=
ded in<br>
world builds again.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-multimedia.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"ht=
tp://packagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-meta-multimedia.bb</a> b/meta-multimedia/recipes-multimedia/pa=
ckagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" rel=3D"noref=
errer" target=3D"_blank">packagegroup-meta-multimedia.bb</a><br>
index 4da9de3ff9..4e4f58f14a 100644<br>
--- a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
@@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0pipewire \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;LICENSE_FLAGS_ACCEPTED&quot;=
, &quot;commercial&quot;, bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &q=
uot;x11&quot;, &quot;projucer&quot;, &quot;&quot;, d), &quot;&quot;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0libcamera \<br>
+=C2=A0 =C2=A0 libdvdread \<br>
=C2=A0 =C2=A0 =C2=A0vorbis-tools \<br>
=C2=A0 =C2=A0 =C2=A0libopenmpt \<br>
=C2=A0 =C2=A0 =C2=A0mimic \<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127715): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127715" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127715</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119956631/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119956631/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008ab325065522c9ce--

