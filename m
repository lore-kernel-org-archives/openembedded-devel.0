Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D98AD0D160
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:20:18 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12966.1767810016705317875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fofPi40C;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64472ea7d18so1725642d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810016; x=1768414816; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJDXEkSbvEX9MmuFtsNWzqEo+EKj9xnLzhACIiEPk4w=;
        b=fofPi40C0GSgJu2w1kxEVw4ATgNn5i2gglfqg5az0hbiwBAjc06GWAG480k5A4oRLL
         dNrmJXbQLkeBzf/pqC1hFpkB370EYVlaC1CITt+DiBV4b7Muu+dCNtqZ0G6leR2Yia6v
         tKZ+RWN6+0T/B+vtmW/yaUxmTOS1djkBcd6/L3yjimoTuvKoe/Fr5WeW46+36U9v3m0d
         rPTPD4rVUBZx73440H94fGwZL7oTKM+GiOHLZ089bBfDgcNcosHnAhVvH2RtTOFzzBVd
         f0bZfjpD5UGp5qutx5BJ9W1h32Q5qiDuB7F5zY+3mrv57op9dbF6EOntFEOMHx2nlRGl
         8wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810016; x=1768414816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJDXEkSbvEX9MmuFtsNWzqEo+EKj9xnLzhACIiEPk4w=;
        b=WeLoQWdMCKhbe6MSBk5ZAEMl788TkDp8bnBvUba4WAQdK+purcRoqesuxAK9xUsiGU
         RPqw4uxvWyJ15inwcRi91tZg1eMlS+JV8eV+OO3+Pww3b1AKUXHFXtpF3svHzIkeZw1a
         4IFoIdKTI1GpvqAmQQMp3GzYiOyGdvJZ+RqtUR8Q2tp+h/huNfclQdVtZFrlSast4yNS
         v08yKhZN5X4EdyKPkNkeSlKSBkz1mUXuphVH8mYimm8PLZHIpOiRR9LcrKlSrft4iZCg
         GXCnzo0DBBoHiK2F1AjVRdwP0NfBszbEhn/0tjxJJ2tmi/Ks6hiSEv8Zza5Eqt71Q5+N
         Atrw==
X-Gm-Message-State: AOJu0YyWRPo7iFFK63Il15wrXuOSRLMpkDP2jkJXBcQIes2wY+wWiFv5
	ETTctuTesoMYO7PDNy/leT7DNBB32KC98V8KPHhsnbI0u5u9A619NFy0qfcn+BtJXHI59T5CTm6
	o8SdYxVUfSe76n6zp6nOUp+rwKED6Tz41Cx2a
X-Gm-Gg: AY/fxX5iuvzaBP0SsgkdKIjnneYKUiDXMQqSfHcIfrc07kIxJdyGj7ejYE+HdgpglyS
	3Vdz5B3CpFKyDQiCP8NZgRYnk1zvMntru1wvTYRRa7qLvn4q48wrW1VGQIeeSXayJ3KAv17Vkjm
	nQTJwknt8bWVhnQykSP4Wir7he7QxqWym7i5XrCjySTA62konKQRT91iDUQL5xD5064SVSgEl7P
	l7Ks9XMC7sw+P+R9lF1ezLx+bJJdTAJ9QWvbbua205LUvEr5PCwvNCNmbKjhqlCA2drdWj/ESHO
	AJwxP0UWWy3xm7ZHa3zLiJF+6BybVipB7BUPw33H3wKaNtfxn7BfRWo1UKBXvjWokE8iEfnTKf4
	LQK2fsHzkPr24kmtYDKNts8qwhrb+ZlvbKMKbKocu7qh4Pw==
X-Google-Smtp-Source: AGHT+IEe+IxOLnUCd0FZjlxpThn1wF/LFGAL4iJEl9kv5t1MEr6ZgxGW7yImlsPVhm8EbJDtucAJcTuavx0UbhH2RZM=
X-Received: by 2002:a05:690e:14c3:b0:644:7a72:a506 with SMTP id
 956f58d0204a3-64716c5119fmr2708961d50.94.1767810015654; Wed, 07 Jan 2026
 10:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260107181140.1026336-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260107181140.1026336-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 10:19:48 -0800
X-Gm-Features: AQt7F2rzA2pWwT0ZVKglWvLWxdVy7uc9iVRjxMONGB-oriEPL3cwCF5m9NguOYo
Message-ID: <CAMKF1sruWosduHTCySJC7EjSmA+G0jgNTxse+=ckp=Ap6-Y37g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libjxl: Fix build error with arm and musl
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000376570647d0585e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123233

--0000000000000376570647d0585e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 10:11=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Build fails for qemuarm with musl with following error:
>
> /build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sour=
ces/libjxl-0.11.1/lib/jxl/convolve_separable5.cc
> | error: out of range pc-relative fixup value
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
> b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
> index 7b0a6db9fb..ad5b5d169b 100644
> --- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
> @@ -46,5 +46,8 @@ PACKAGECONFIG[sizeless-vectors] =3D
> "-DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON,-DJPEGXL_
>  # lcms/src/cmsps2.c
>  # error: out of range pc-relative fixup value
>  CFLAGS:append:toolchain-clang:arm =3D " -fno-integrated-as"
> +# lib/jxl/convolve_separable5.cc
> +# error: out of range pc-relative fixup value
> +CXXFLAGS:append:toolchain-clang:arm =3D " -fno-integrated-as"
>
>
in meta-clang we have following in nonclangable.conf

SELECTED_OPTIMIZATION:remove:pn-libjxl:arm:toolchain-clang =3D "-O2"
SELECTED_OPTIMIZATION:append:pn-libjxl:arm:toolchain-clang =3D " -Og"

I wonder if this should be removed now


>  FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123229):
> https://lists.openembedded.org/g/openembedded-devel/message/123229
> Mute This Topic: https://lists.openembedded.org/mt/117138971/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000376570647d0585e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 10:11=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur=
 Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ank=
ur.tyagi85@gmail.com</a>&gt;<br>
<br>
Build fails for qemuarm with musl with following error:<br>
/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/source=
s/libjxl-0.11.1/lib/jxl/convolve_separable5.cc<br>
| error: out of range pc-relative fixup value<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-multimedia/libjxl/<a href=3D"http://libjxl_0.11.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libjxl_0.11.1.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/libjxl/<a href=3D"http://libjxl_0.1=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">libjxl_0.11.1.bb</a> b/meta-oe=
/recipes-multimedia/libjxl/<a href=3D"http://libjxl_0.11.1.bb" rel=3D"noref=
errer" target=3D"_blank">libjxl_0.11.1.bb</a><br>
index 7b0a6db9fb..ad5b5d169b 100644<br>
--- a/meta-oe/recipes-multimedia/libjxl/<a href=3D"http://libjxl_0.11.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libjxl_0.11.1.bb</a><br>
+++ b/meta-oe/recipes-multimedia/libjxl/<a href=3D"http://libjxl_0.11.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libjxl_0.11.1.bb</a><br>
@@ -46,5 +46,8 @@ PACKAGECONFIG[sizeless-vectors] =3D &quot;-DJPEGXL_ENABLE=
_SIZELESS_VECTORS=3DON,-DJPEGXL_<br>
=C2=A0# lcms/src/cmsps2.c<br>
=C2=A0# error: out of range pc-relative fixup value<br>
=C2=A0CFLAGS:append:toolchain-clang:arm =3D &quot; -fno-integrated-as&quot;=
<br>
+# lib/jxl/convolve_separable5.cc<br>
+# error: out of range pc-relative fixup value<br>
+CXXFLAGS:append:toolchain-clang:arm =3D &quot; -fno-integrated-as&quot;<br=
>
<br></blockquote><div><br></div><div>in meta-clang we have following in non=
clangable.conf</div><div><br></div><div>SELECTED_OPTIMIZATION:remove:pn-lib=
jxl:arm:toolchain-clang =3D &quot;-O2&quot;</div><div>SELECTED_OPTIMIZATION=
:append:pn-libjxl:arm:toolchain-clang =3D &quot; -Og&quot;</div><div><br></=
div><div>I wonder if this should be removed now</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0FILES:${PN} +=3D &quot;${libdir}/gdk-pixbuf-2.0 ${datadir}&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123229): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123229" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123229</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117138971/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117138971/1997914</a><br>
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

--0000000000000376570647d0585e--

