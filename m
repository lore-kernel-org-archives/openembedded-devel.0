Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3281.1793326972334975256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 19:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HjD9vgK1;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8726acc5eadso2075727b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 19:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793326971; cv=none;
        d=google.com; s=arc-20260327;
        b=Aumj3rD1IQdiGuwj0qgAtL8WrFSu1VA6gLA2JcqCmRpsKJKzFMexpqgQljxkC17Zqd
         VDd7OjX+hSx6BxBXl3jgPNS/klRrbpRFaiWjN2+hRNVwSERiU3TYQBkEvOBbT4bHpyRm
         DVo864zmG/h8/1P4GCwzFx+8yvnzLGCYBfLaZ84cq2Bt3zC6Xcvf1aM7zBeS4+SrUdSi
         MJV6Z5Nn6WsX+OleSWKqT/4SYPya4PJuZawxHqaQ5VEdvYATTDRHR50+lDCOLPmkH6cj
         atPNjppLKitfK0jIG4ryxyIroZqT0pFWT+D9J4U6TRTkA9IkZvRDbTL6UPXyU8kdZQJ0
         Ys5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4V/JdhtHe1XU4P+p7yDWUaCV8AJxnlM9X35Xb5SDUqg=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=SGm5nqekJEelVS0ygUaY+n8SJ6rVUUJTVx6oyQw6SK2yADDNsaMdG3acNMDFhW+gaz
         JH2236jGZKH0ypuwVyky9LPF+GiW6+ZYGmKQswc4D8Z6RgeDLlXGpqrJGmRRuzg4LS2Y
         j6Gyepgm1SZoamiE1ktpOdn4NwnQoqodNqiAJfoYU8SK9l5jPbuoUI+mX/PmAuOqJ5X5
         xwUJ4n5Prt/e7vDMUyFxBBpZe09mLCj6Jy/2+usDS2MzFKgQZfE7KhC28Wn78XSENU80
         eRln7qL1292L5RIHF1Xlu2p3DxqYZe/exPA/TxHK+3WnssQPJy3XGseNKkM/tdXbdNMC
         alaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793326971; x=1793931771; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V/JdhtHe1XU4P+p7yDWUaCV8AJxnlM9X35Xb5SDUqg=;
        b=HjD9vgK1VvA8T/4+No7wTK0MdIju0YHB3MRJsdKTBc3KPiTXFkWCICmjZkpFzUMjfh
         S+JbzuqaR4MFX+aV3hJ5n030UBQQzVe1/CFramctQxoawgi0RsAA0LHZsPl9Dk6AqQ3A
         Hp4WYEHmwBuZBp4mzDepmjEcyPxl5fCTl43SxR5arzg2EC2vwp8y6NaOWe2PgJt98K2X
         w1XWlI/RcCebf2JMAo6tZ7rCwAjtIgHs2CRPLwy8WdX/r2sAl27zOlw+jFRG7yQhIK/d
         srfhmOrB/v84udEoYMzXC4IZ6eWxCxG5uN5+eIyAfoCm6ckr5dSZHzUmEoXQutC9SuRU
         H/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326971; x=1793931771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4V/JdhtHe1XU4P+p7yDWUaCV8AJxnlM9X35Xb5SDUqg=;
        b=Hy1vPD10Zq/mNaJIhJyodpndkP9RHfvZf9lT2oYTc1y5AEKB3SeVFLXNTgHIbESE/i
         tBLa0KDlLzecpJD3be/qRXMotNwWrI1gVKkBt5r2jW1LkqxNB0Y1YWDz2+bpOOsYLfla
         bgheP9PE76+wFikwtXUStJ+9anC7nBAbmjdx11O/bcV34PFUvL9OQhV7x7RZXfKiwwNW
         SJFVRERmgVb4vykDYIeHfo+xSf8IIfA0T5m1NijNJlidgNBK2OKT8vsghyeLWM9m40zp
         hiiqyE+mzwhY1WgBqGVIdYkdGToJ+Nt+ADFuJvYJ2YkBlWNIBolmCYaHr+ptIoeQbcNr
         Sz3Q==
X-Gm-Message-State: AFq9FYLucjAF6nHKoYJxWlDcFG96qZBTbsG6I8BnZhX2AMsFfacmAApd
	ZB9ladSYEdQ1fW3lNmPEsfEFQRKatjbacC4Iu04psEOk3jwHIYrGRG9a6wwPd77jhiyckixyKk3
	zputkxATjafCdmN2pXz8UhkN+rDyXEEg=
X-Gm-Gg: AYBFou1y/Js8yXQgNzw8GMYO3crkuBXUxcclqHcEW5u3s7P3E2N2sTtCBwAtJ10ro2A
	18NAaRyB9QW1JrORi0y5DBWt2g2KMFBLymFcc+rTjHSSrF0t5DUVbJMFSljqQEMd0KET/PXsrSg
	8OUn7zrGLlIb0H3JSBbgc2B/sYZrjAJDnOCsdt5QEvMSZLUU13ti8zqxpHeQdr0DaT9sUmY3HV2
	J6+vU87mGBglaa04eJ9Ho48iPuro+ho2JP859VIeiZEfyuvR2bEOwhRvm2PAvpvNaOAX7AoAmxr
	+JfNYO5jtRTAanyJYO7ErvBiWBW9CaT51u/L2wTEhjBYPEV+CzfN2RbnpN37CqA2rMd2ZzJBvic
	sPK2wx1xhd1t55To4sC+ZrqRjJvWbhAOqfSERQzFy1+tjCqNuQuLGap2MLEElLFbka23Dq73PtN
	FSNusaXFl0eSHQiS0VMXXxQ7504InaUBxOG+Nw14tc0WTTmfcobjR8HKZ3BJKbbh0swfEBvDqvm
	ZmF6dA9NtDuX0xEuDNeCK8ROsGPvMz8O26DBB7mbUfiu3x90/SaftDHw4qCJLFiFFAXvhNo/O5o
	lG7/bJzWW+Q72eWaeSaHh0C+94w8tXbR/+vnKcGmO8UEXraKJKwz08qu3dRKyMmzExJI8CyS6H0
	gDepbhbkLVCqg2wKptdA7cg==
X-Received: by 2002:a05:690c:348a:b0:88f:df4:1c8e with SMTP id
 00721157ae682-8b2b66c5d61mr5851327b3.22.1793326971187; Thu, 29 Oct 2026
 19:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261029091705.1718506-1-schonm@gmail.com>
In-Reply-To: <20261029091705.1718506-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2026 19:22:25 -0700
X-Gm-Features: AclHuK8HSugKOSui6F9AvR3gBJ3gh1mkpDsqHtf9RwdrhkVcJPCRuUalrgXipEI
Message-ID: <CAMKF1spzVDTUtNG_iMp1+wuXNNEzJWQQbwrC0N-wmGZW8-gmmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 24.22.1 -> 24.22.2
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001575eb065f0579ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 02:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131678

--0000000000001575eb065f0579ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seems to be failing  -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1916/ste=
ps/17/logs/stdio

On Thu, Oct 29, 2026 at 2:17=E2=80=AFAM J. S. via lists.openembedded.org <s=
chonm=3D
gmail.com@lists.openembedded.org> wrote:

> Changelog: https://github.com/nodejs/node/releases/tag/v24.22.2
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../nodejs/{nodejs_24.22.1.bb =3D> nodejs_24.22.2.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_24.22.1.bb =3D>
> nodejs_24.22.2.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
> index 4912136f76..22355ab85c 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
> @@ -35,7 +35,7 @@ SRC_URI =3D "
> https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>  SRC_URI:append:class-target =3D " \
>             file://0009-Using-native-binaries.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "4f5379796280cdaeb0c2f358fd04b6a16cc4fb7dfa83b5a8c91a9d963b435231"
> +SRC_URI[sha256sum] =3D
> "8fe2ec1723bb9f8d0b683907c82708debbeda64af21cb2aa214c4241eed0a061"
>
>  S =3D "${UNPACKDIR}/node-v${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131644):
> https://lists.openembedded.org/g/openembedded-devel/message/131644
> Mute This Topic: https://lists.openembedded.org/mt/121991235/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001575eb065f0579ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seems to be failing =C2=A0-<a href=3D"https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/81/builds/1916/steps/17/logs/stdio">ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1916/steps=
/17/logs/stdio</a></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2026 at 2:17=E2=80=
=AFAM J. S. via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">=
gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Changelog: <a href=3D"https://github.com/n=
odejs/node/releases/tag/v24.22.2" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/nodejs/node/releases/tag/v24.22.2</a><br>
<br>
Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com" targ=
et=3D"_blank">schonm@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../nodejs/{<a href=3D"http://nodejs_24.22.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nodejs_24.22.1.bb</a> =3D&gt; <a href=3D"http://nodejs_24.=
22.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.2.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_24.2=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.1.bb</a> =3D&gt; =
<a href=3D"http://nodejs_24.22.2.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_24.22.2.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_24.22.2.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22.=
1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.1.bb</a><br>
rename to meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22.2.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.2.bb</a><br>
index 4912136f76..22355ab85c 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_24.22.2.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_24.22.2.bb</a><br>
@@ -35,7 +35,7 @@ SRC_URI =3D &quot;<a href=3D"https://nodejs.org/dist/v$%7=
BPV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-Using-native-binaries=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;4f5379796280cdaeb0c2f358fd04b6a16cc4fb7dfa83b=
5a8c91a9d963b435231&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8fe2ec1723bb9f8d0b683907c82708debbeda64af21cb=
2aa214c4241eed0a061&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/node-v${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131644): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131644" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131644</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121991235/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121991235/1997914</a><br>
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

--0000000000001575eb065f0579ad--
