Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ABAE67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 16:58:45 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63894.1766336317582893868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 08:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSdOjnPE;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78c696717dbso27540737b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766336317; x=1766941117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms+9fR8AeeuqV20UenAAUUahmeEwK/Cak+Y4ynlAy/g=;
        b=iSdOjnPEwgmbOY78MBFfmDDzuumnk60Bj919nkCTNG/YpAU3V+BuqfCsV6JhfNL2Sk
         awg6xiHkdqyGZrFFKhx08mB5WAAEfK94kbGQwem0lefYHro+pGUXvBkCY/xeVsAc3u+h
         /kBIV5IdN2d09TzdIrSVPKwF+IzXifGHA8RyIHfyNhiXh9GaMfHy46VNe1WXWJPoE2jR
         +BBoiecshOHv1byWJTFA6nR6ndyGk6QANcjgN4kWuA7pyYKUk7rOMitV1sPh18pCQlwN
         NpPTkskkRZNNrRzpsaJ7C4ix4JD6WYepe//m/+BoBAgk0DxaRbV+36Eizkmk4jiN78Vq
         fJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766336317; x=1766941117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ms+9fR8AeeuqV20UenAAUUahmeEwK/Cak+Y4ynlAy/g=;
        b=YTzelEX9YxVa9SpXZtUbuQ3XyzJOEtW0l/uj6TiFk7I8usmyeET6ONYFigQnGeRtSS
         OBO+XdNLuLTA52ERmgExtB2iA2pvFW1BbA0Rn1ArSscjq2HGkbEpQElOhZQAYgggXcpp
         SQZtazapSOJ70PxqDzY/Bc8qDp91shiG2ORN9CvANLUue3wgTkr/FOOAq+B3mA55buyf
         ZGCCeXaG4ePl+QQ0l27j3owROdLx3Y6UvtJyVwbeKssSGgsgcZRMsPyEuK2v21hQofKG
         H9plO8RkKCere474ESqwLebntdavQnHpdqhrHpv35Iw7g7jrieIpegS84MGtOTLwHhVe
         d3hg==
X-Gm-Message-State: AOJu0Yz1hXI9as1QnbhF0/n5PwPN+8Ljc606q/M7p7lXzOA51fbwyFLG
	J99aO6JqkaqGMaMaB8qCD/7JBLzijfc+RbErw+UTQA1cOTMrfcSOGjejKyjqSqCnvAQ9nVr/rQk
	FiZvFPEo36bo07jfFUMrDFNzAJERceBA=
X-Gm-Gg: AY/fxX7vKazJ5wtZPN7rmJy87yf4udQjexhnqbLMCVRp2SNlRIxVcIJ0NdifcZMUhYi
	2BpvfOu9VtDooBD6rL+DYUaVdUmSDGV4j+0Pwu9kjtHnx56nPv000ZbvVavcw0ql15L0u72ck37
	1wBHMvOa6O+HqpVt0BUQrBhuiikUcFneMaAuCdlMRcLNqAiYU/eR+1mWPBJ0pbVFuLJCWjRlkrh
	lqUl+wrrtSY/ZpT6zpgWKco31hwy7RlqV+Iyb1ELCj63fCxdbYO51o1xLB5q+LZnNinUNZ8NuPZ
	B73RVy20I8wB5N/Nvjjfro3TvZnj850SygPOsYP+LVRWYtN5U+LZUXpKUAEsC2S53uXytituW7K
	J4oij7gAtLudv
X-Google-Smtp-Source: AGHT+IEOqiijuzForKScn+ATxAZc/b5TB2EqJV2t6zWVBDkp4/bN+lm3xNOZRc7EMuNTnHGxJn/ygAfVyqDmG9skWAw=
X-Received: by 2002:a05:690c:3705:b0:786:6383:6572 with SMTP id
 00721157ae682-78fb41c1b35mr72510167b3.61.1766336316599; Sun, 21 Dec 2025
 08:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20251217065631.33471-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251217065631.33471-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Dec 2025 08:58:10 -0800
X-Gm-Features: AQt7F2ozEul0S2racEDIuqN9GsKuUAMyA6FugHTH5mgXJrA5YYgxuBRV-pJd8-w
Message-ID: <CAMKF1spYR63yy3anhBECp_7E84y8qBn0AzuaV8D-e7f0_MDrVA@mail.gmail.com>
Subject: Re: [oe][meta-gnome][PATCH 4/5] gegl: upgrade 0.4.64 -> 0.4.66
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b47307064679384f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 16:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122779

--000000000000b47307064679384f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails on qemuarm

https://errors.yoctoproject.org/Errors/Details/892003/



On Tue, Dec 16, 2025 at 10:56=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-gnome/recipes-gimp/gegl/{gegl_0.4.64.bb =3D> gegl_0.4.66.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.64.bb =3D> gegl_0.4.66.bb}
> (96%)
>
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
> b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
> similarity index 96%
> rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
> rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
> index 1a31f60f94..1b4ce8a50d 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
> @@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  SHPV =3D "${@gnome_verdir("${PV}")}"
>
>  SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
> -SRC_URI[sha256sum] =3D
> "0de1c9dd22c160d5e4bdfc388d292f03447cca6258541b9a12fed783d0cf7c60"
> +SRC_URI[sha256sum] =3D
> "92b05855e2190868949d70cea6e9a50b163a6a441242e740a6263975379f993b"
>
>  PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango poppler sdl2"
>  PACKAGECONFIG:class-native =3D "librsvg"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122716):
> https://lists.openembedded.org/g/openembedded-devel/message/122716
> Mute This Topic: https://lists.openembedded.org/mt/116823301/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b47307064679384f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails on qemuarm=C2=A0<div><br></div><div><a href=3D"=
https://errors.yoctoproject.org/Errors/Details/892003/">https://errors.yoct=
oproject.org/Errors/Details/892003/</a></div><div><br></div><div><br></div>=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Dec 16, 2025 at 10:56=E2=80=AFPM Yiding Liu (=
Fujitsu) via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.or=
g">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Signed-off-by: Liu Yiding &lt;<a href=
=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com=
</a>&gt;<br>
---<br>
=C2=A0meta-gnome/recipes-gimp/gegl/{<a href=3D"http://gegl_0.4.64.bb" rel=
=3D"noreferrer" target=3D"_blank">gegl_0.4.64.bb</a> =3D&gt; <a href=3D"htt=
p://gegl_0.4.66.bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.66.bb</a>=
} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-gnome/recipes-gimp/gegl/{<a href=3D"http://gegl_0.4.64.bb=
" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.64.bb</a> =3D&gt; <a href=
=3D"http://gegl_0.4.66.bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.66=
.bb</a>} (96%)<br>
<br>
diff --git a/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.64.bb"=
 rel=3D"noreferrer" target=3D"_blank">gegl_0.4.64.bb</a> b/meta-gnome/recip=
es-gimp/gegl/<a href=3D"http://gegl_0.4.66.bb" rel=3D"noreferrer" target=3D=
"_blank">gegl_0.4.66.bb</a><br>
similarity index 96%<br>
rename from meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.64.bb" =
rel=3D"noreferrer" target=3D"_blank">gegl_0.4.64.bb</a><br>
rename to meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.66.bb" re=
l=3D"noreferrer" target=3D"_blank">gegl_0.4.66.bb</a><br>
index 1a31f60f94..1b4ce8a50d 100644<br>
--- a/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.64.bb" rel=3D=
"noreferrer" target=3D"_blank">gegl_0.4.64.bb</a><br>
+++ b/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.66.bb" rel=3D=
"noreferrer" target=3D"_blank">gegl_0.4.66.bb</a><br>
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&qu=
ot;<br>
=C2=A0SHPV =3D &quot;${@gnome_verdir(&quot;${PV}&quot;)}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://download.gimp.org/pub/$%7BBPN%7D=
/$%7BSHPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0de1c9dd22c160d5e4bdfc388d292f03447cca6258541=
b9a12fed783d0cf7c60&quot;<br>
+SRC_URI[sha256sum] =3D &quot;92b05855e2190868949d70cea6e9a50b163a6a441242e=
740a6263975379f993b&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gexiv2 libraw librsvg pango poppler sdl2&qu=
ot;<br>
=C2=A0PACKAGECONFIG:class-native =3D &quot;librsvg&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122716): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122716" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122716</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116823301/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116823301/1997914</a><br>
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

--000000000000b47307064679384f--

