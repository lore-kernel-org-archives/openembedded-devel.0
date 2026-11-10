Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15248.1794296596836032513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K8psDoVc;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1893361d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 23:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794296596; cv=none;
        d=google.com; s=arc-20260327;
        b=kM03sBkg2lNCTpKl2bySvEXkFyMeJNXSy/Wa3vsWUVug8vwYY6fIU1Ojo6tDDfALkV
         UJBYC6luGrZXO+2wvLOLE3t/iETXd2ZpdLJTC7RKSgUiPj9yVMhOqvoVANjwR2RPpT6M
         TrqNkRPPWYiMr0oTAMJjgH24b/J9axy9sf3k4au4W0eDB6M1Qv9C41G09v7det9MuKg7
         sZhdtgpiSqKM1qBxDdLw2nuLC5MVPawa+24h+m71gWcprWoUcQUGnA3HtBWucn2+81cI
         AMobVSMnJLfm+yfMj/tuQA15mw2P5ZkIkTVIVKgkOEWfvxU41pL9A5T81pOQHXohGLUs
         uZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1r8M1DuyENQGiw/lxocDxTQsgYwqWpQeN6Eg+dBW74=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=FtUqTGJBWnab6ZYychlI0GyxLf0ujAarOx/HXb0lwgEnyp+1O2bZbw/Xas9oAhxUd0
         TfB5U0JmDHvjHUYtXm3s7N55pvhaKNqKjKjOuiCXJ8/pbMCwMs5BnDS7tKIBEWqcfKjJ
         3sER/QoJttC5MziI2ESXvPZWx9UCCEyL83yfZSUElksA24Rfy6ddTsLbxf/kkzlko7/u
         N38MG+4USazhe4jhEyYBrMIHm2WlGWRFZaQ8W7hMPn1Re2MGwskcR/07dtG4CyMRHZwp
         xlGOO9JiQ27RwPMGz/ptd+MEcnbjZPhP91+Dep6OBoIbijU2wcTyl+r+BabQBv2KW0jZ
         gh4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296596; x=1794901396; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1r8M1DuyENQGiw/lxocDxTQsgYwqWpQeN6Eg+dBW74=;
        b=K8psDoVcWLMJKSbkZASjOZZTbUJIavzzv65e2EFzyjBDj/AZ0mh1ZDLsodmI856gym
         Kgq2ANjhdHQhlgjxlILmWjp+4Jc2ZZiDnfYX+M93yTR3WCgX7PJNlQV6Xi/KzRa4De9i
         HAq5lRtuSatnwQ7Sr+uZ728ISasthMoCv0i6IzfpiyVbr6Amr+abRcbI0Gq4mP1qYuGH
         NdaEZFQdzkYyA/X0aubX0DQH7Dh9BDZrxaoyMoLlAIGd/hVPn3cceb+ZTBfjLID7xlYr
         bLDNJJMwqRYIqJAYbwUtjrDGCrWOtyN0kirh7uWwTTfsmwLP/Tf6sJkP8BiH0/lyV2Cn
         bWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296596; x=1794901396;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1r8M1DuyENQGiw/lxocDxTQsgYwqWpQeN6Eg+dBW74=;
        b=tfG3RIkma17P0KBBAg1Kl9OGxjaslNFwvXVZ+ovbFyjUs2c8NuCjQ3kG12VJSYbrDO
         Yidvt97zp2x06+/LPZr75Pzs0bcw1KwzQ/wta4rElcVBOF0TUc+IOPwUQPfC85TtckGa
         Bwg4XyX2LdBhZLDaqSKsD5ZdZYar4Wgp979Z77ADdKHF9Mm2mIZjJrnEaEoIohGM4zUZ
         q9fepbA++pRq7eu3FJSSS054fv1xkTdr+W4fvW8YiI/42upEY8mDrZliUlclMyfdG1XG
         aFuZVT4swtudHl6QgIkGIsXpW0rT4MfSY5uVPLm5JoghCbwmUGPv0SppTp1RjNvvQUHB
         +4pA==
X-Gm-Message-State: APuU4Z/aoWXCn7ATHuPTtA2htV8F1BkjWw3kLT11FT46owuNEw/4kmRW
	JTkun2hzsdwLVGXEW5I9e9Wokjh3rKdwIOCvtE+AtliVsNhQoMf1kahIfcP6D4f3/yF0WskwG3d
	QaztU2vsfrQt1z0IKSu6ySu31064ULiA=
X-Gm-Gg: AYBFou0hmibGhTFSnkIUSh518qMfsE8CsvuobcpHo7n04+XkeXhv1Eth+NgkCUt96d1
	x7nquZyYzKXSK+FA2ENwBNJKs7MV6xWX/flBQOrK6PvznkahH73Ln2+iM50pT9Qv65aW/vmrBL9
	DqEHePAIRss8w8mnCB71fO2t/HHb/h3DgvL5k4UnDhxZUwL0M23cSoW+3ISgPEq8sSDFjcpnYCm
	3Tf/+A0m4N8bs6gh9v/XbRSsHc1v3HucMK7ZNWqtdfTYQd/6dBBqzE59cHhsIunQzMGx3bt6nWQ
	yFMovRSzN2JJBx8sgVSYwnjmCv1hO3qCDKLv+xfgZ63Eja4mrEsjm0ikevRIdih3lb/Bp5JKdWF
	JC0woWb3wdt2ZGchgOOISjsLAU+fQ2gxdKfHVXqEHa05SOQPTQ2IiaVVsHJqwSOk8c+KWi/+TPN
	vdm0VhWW8okq+JaHZB3K3XiCHMLyfzJrpt57SxIJarWJbIKEmRhno4M2sh+0HVT9kaEZFvtJKaS
	vOu+XBMrUdUInqthNoGtbhfIbhYd7ul986mVsQlhGlYQloKsYANsXOfoUp4BBSVKVp+QXA6cF0c
	NsSGrwF5f9+fTs9zIEZf1sgwQR5N2FX8ZhHddBujHLSLPlfIkkLbTw3aZlCAI7IHv1MTFp+4Age
	Ygc7UIbXMFo8DIj4+cmTH4KM74f+iDAv6nTWM3qwSc50=
X-Received: by 2002:a05:690e:810:20b0:679:90f4:3223 with SMTP id
 956f58d0204a3-67c56e4c082mr746677d50.9.1794296595899; Mon, 09 Nov 2026
 23:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com> <20261107101154.2992152-5-ankur.tyagi85@gmail.com>
In-Reply-To: <20261107101154.2992152-5-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 23:42:49 -0800
X-Gm-Features: AclHuK-dHwpqyV3FB3FrVXaPvVqkLo2lv_dxZOizngG5pM-K3s69CJ4VMfbYMDQ
Message-ID: <CAMKF1sp4FTEJuM24HU5urX_j3F=KLLiLHFHN_XmH8977Hix8EQ@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH 5/11] wireplumber: upgrade 0.5.18 -> 0.5.19
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000038695b065fe73b7d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132069

--00000000000038695b065fe73b7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This failed ptests btw. I have sent a patch to fix this but in future I
will reject patches which fail ptests, so we can keep it
from regressing.

On Sat, Nov 7, 2026 at 2:12=E2=80=AFAM Ankur Tyagi via openembedded-devel
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
>
> https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.19/NEWS.rs=
t?ref_type=3Dtags
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../{wireplumber_0.5.18.bb =3D> wireplumber_0.5.19.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/wireplumber/{
> wireplumber_0.5.18.bb =3D> wireplumber_0.5.19.bb} (99%)
>
> diff --git a/meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.18.bb b/meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.19.bb
> similarity index 99%
> rename from meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.18.bb
> rename to meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.19.bb
> index 3b8494d124..f925aad8c3 100644
> --- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.b=
b
> +++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.b=
b
> @@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
>      ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
,
> "python3-native python3-lxml-native doxygen-native", "", d)} \
>  "
>
> -SRCREV =3D "81606cbb32d29df20147d1b68b662c1082654d81"
> +SRCREV =3D "4ab992fa2931ae2b17ef73508b1370030b7878c3"
>  SRC_URI =3D " \
>      git://
> gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV}
> <http://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;p=
rotocol=3Dhttps;tag=3D$%7BPV%7D>
> \
>      file://run-ptest \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131979):
> https://lists.openembedded.org/g/openembedded-devel/message/131979
> Mute This Topic: https://lists.openembedded.org/mt/122141743/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000038695b065fe73b7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This failed ptests btw. I have sent a patch to fix this bu=
t in future I will reject=C2=A0patches which fail ptests, so we can keep it=
<div>from regressing.=C2=A0</div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 7, 2026 =
at 2:12=E2=80=AFAM Ankur Tyagi via openembedded-devel &lt;ankur.tyagi85=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" ta=
rget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.1=
9/NEWS.rst?ref_type=3Dtags" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.19/NEWS.rst?ref_type=
=3Dtags</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://wireplumber_0.5.18.bb" rel=3D"noreferrer" targ=
et=3D"_blank">wireplumber_0.5.18.bb</a> =3D&gt; <a href=3D"http://wireplumb=
er_0.5.19.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.19.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/wireplumber/{<a href=3D"htt=
p://wireplumber_0.5.18.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber=
_0.5.18.bb</a> =3D&gt; <a href=3D"http://wireplumber_0.5.19.bb" rel=3D"nore=
ferrer" target=3D"_blank">wireplumber_0.5.19.bb</a>} (99%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http=
://wireplumber_0.5.18.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_=
0.5.18.bb</a> b/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"h=
ttp://wireplumber_0.5.19.bb" rel=3D"noreferrer" target=3D"_blank">wireplumb=
er_0.5.19.bb</a><br>
similarity index 99%<br>
rename from meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http:=
//wireplumber_0.5.18.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0=
.5.18.bb</a><br>
rename to meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://=
wireplumber_0.5.19.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5=
.19.bb</a><br>
index 3b8494d124..f925aad8c3 100644<br>
--- a/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://wire=
plumber_0.5.18.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.18.=
bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://wire=
plumber_0.5.19.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.19.=
bb</a><br>
@@ -10,7 +10,7 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native lua pipewire \=
<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot=
;gobject-introspection-data&quot;, &quot;python3-native python3-lxml-native=
 doxygen-native&quot;, &quot;&quot;, d)} \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;81606cbb32d29df20147d1b68b662c1082654d81&quot;<br>
+SRCREV =3D &quot;4ab992fa2931ae2b17ef73508b1370030b7878c3&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.freedesktop.org/pipewire=
/wireplumber.git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"n=
oreferrer" target=3D"_blank">gitlab.freedesktop.org/pipewire/wireplumber.gi=
t;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131979): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131979" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131979</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122141743/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122141743/1997914</a><br>
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

--00000000000038695b065fe73b7d--
