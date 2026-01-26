Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104C6D1951F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 21:38:50 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33022.1769463524207805764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 13:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXJzWBph;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso5027767e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769463522; cv=none;
        d=google.com; s=arc-20240605;
        b=fJ6hvn2FkV3OhLpSpgREA2Clv0fjaT6idV0v3DLDWgiNyvG3v+PAsZu2FjS/CyiCX0
         xMDHJiQjM+6oVSe0EYpyMl0Q0dslq+H90vX3ZWP3jcAd8Qxuf4d7wYCwZ3b4Yso7W+qs
         1ZbWIWKlUPkJHgZdiEyefHqgA9AFHYVHBy5RWOW4hNxioG9S8DnMoQUi+AOc058Wuuww
         qslY+/Mecrg+hAXU8LANBcbr9xQY8mVW+LkOqhwVreL6Tet+mLqL8DRjVIW2wbjmxIms
         cAyITMiREp8OUeefjpnyx9x9h0TZv4c7RwcTvd9enKhNNttmmULdDOkNiZe+dsLu8Rdt
         N4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ts8xyqqKJlUwrIY73ADxq27+FKJmSBm+tzLv0l7RgsE=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=Wugwva0Y5PHYPQcfo+fPfpkHatebHG8rfkXSP337NfSAFrVeZNDvRadyXJLGhCbX3a
         pVSMoN+luAZJKQ41ETvHqELTDQFbLyOZsdCYfzvaNDj6rWPVqCG0LBqX0zmRkOOuLHIg
         ZTmLIMJhZsvSUWk4HjzLrEfx4s8ef7dN7ZrJ1u616pksUZqJ/cBLKabXVDYW5hFZAKvb
         RFuT4FTwkmIfPwY9d5A4pQ3z/zgiTsAY8v+72vc8YAPVo6FH2eoACo7Oq/Iw/O4Qa6iR
         waazvv61KLYRywwsieSD5kyjzqTtin94hN/hS471GYyAU5V2TlnoASOEhZ82IDTm6B3a
         wt7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769463522; x=1770068322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts8xyqqKJlUwrIY73ADxq27+FKJmSBm+tzLv0l7RgsE=;
        b=fXJzWBphQAHzKqWkmbfff1ifGiWDi+cSFacMHvBjXcnNjZZ0yJjY6PuM2zv5g5yXow
         FcwmSUFLS9dtf0voDNMNTPw/prGATFNGSzLHcBKIPRbfgtSzjyIviQfC/0r5UiRB2pWt
         CCC22LceY4935OO7yhszwKS5lyXcb9JsGqj7DOwALoflDA0rw9PL4vcm39Z/jfzFz7ML
         QKqhlWFujlGd9yOhEwKyB5RPNAvPW8I5AcRwtx2LvDsTQA/DfhKDE8YVOmY05ViU9gzf
         0+Ci6/uEeMolEfwl+yhLLUaTxrgT4kar1iPrHsJplNt10Ilylj8NC6bvvLBRl/mYeCTk
         eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769463522; x=1770068322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts8xyqqKJlUwrIY73ADxq27+FKJmSBm+tzLv0l7RgsE=;
        b=ZPwqr2gxRd8cLurxfsOfkPMEEHhLY1A30JvS53FZfdEK5AxZl6Uj9XYV+v8JsS9+I/
         HLXKRrzMefJJg1tiV8hP548lVsbTJVpSXNk/cv9v0kzMZFDDwkVGWM0DuosJD1ZOlgE1
         CvoS0VL4us8PBs9cO7NDE8s8uCSbF8VbKQWWbUZoMGtj5E1sLiAq1ZIm+sAvsqwV5uGJ
         g2cNdnSxjpvOWCKPBKYvJjNTznpN2qoo4FPGHK4+QnSb4mgebhLlBDOj6hnrqYIX4Jfl
         oEVzB+hY0ul58DfMZvYaWCnQvWXEQdazBsxt5S4ZhbaT/yZQnJHxyQVj+nVbCgAQcqc3
         yljA==
X-Gm-Message-State: AOJu0YycC+xU5ynbz9clrar2ApRdx2xx922dyAjn2PRqBjRqbWgU3jNI
	OQlry2q5+V4qmqrBW9yNLJKKFjU51PA6kMM6eVFXkfBWHfxmmPTiGAx6mTKaOTcAHyYSpdrFOt+
	+pLYYM8PeJVdb0t9FC+vm5W84EDWsKhc=
X-Gm-Gg: AZuq6aIq0LjWs5+vPoUYkDGHt/ASCjyViCGt3DuV6mD42BXp3ULsfJtJnLu9MPPCGP2
	fbSAICKTqv2ptP0B6BrFloe2hLjr2rAJi6n8h0KNiRlyOKVEZ5S8jZJeFNM68fRdLTF3VI5debz
	zD72jkYGTbYdeUnPp9acu5TqBFRBpE9U4lQbZF2EbOlSE+xQZ4i2CD/3+BtrrxJlGLWa/UEU5JL
	R49mKFkiXJViaFPLxM3hknQe9nassMq/bWIVFph/Dv1aBkdQb/LWIdMVxlo6Ibh8WLmeQ==
X-Received: by 2002:a05:6512:12d0:b0:59b:b021:6033 with SMTP id
 2adb3069b0e04-59df3a11023mr2173534e87.25.1769463521956; Mon, 26 Jan 2026
 13:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20260126204144.2576530-1-t.f.g.geelen@gmail.com> <TKOH9T.PWS6VF8I6ASD3@t-online.de>
In-Reply-To: <TKOH9T.PWS6VF8I6ASD3@t-online.de>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Mon, 26 Jan 2026 22:38:31 +0100
X-Gm-Features: AZwV_QhLDzuaIroBtLMeajF0Hc8iTkNlMnuyl6SMKwGLieH28ohvnsTnDlJHFH4
Message-ID: <CAJo0Az72+Tt8HteLwXw8pb0fqqg-xHOOf-4k=KSpAjsHKf6ybw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] rygel: remove x11 from REQUIRED_DISTRO_FEATURES
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab580a06495154ba"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 21:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123892

--000000000000ab580a06495154ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah you are right. I am mistaken. Sorry for the message. I drew a
correlation where there was none.

On Mon, Jan 26, 2026 at 9:51=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> Are you sure about this? Without having x11 in DISTRO_FEATURES I see:
> | Run-time dependency x11 found: NO (tried pkgconfig)
> |
> | ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency
> "x11" not found, tried pkgconfig
> |
> | A full log can be found at
> /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/rygel/4=
5.0/build/meson-logs/meson-log.txt
> |
> | Last 10 lines of meson-log.txt:
> | Package x11 was not found in the pkg-config search path.
> | Perhaps you should add the directory containing `x11.pc'
> | to the PKG_CONFIG_PATH environment variable
> | No package 'x11' found
> | -----------
> | CMake binary for host machine is cached as not found
> | Dependency lookup for x11 with method 'cmake' failed: CMake binary for
> machine host machine not found. Giving up.
> | Run-time dependency x11 found: NO (tried pkgconfig)
> |
> | ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency
> "x11" not found, tried pkgconfig
> |
> | ERROR: meson setup failed
>
>
>
> https://gitlab.gnome.org/GNOME/rygel/-/blob/master/src/rygel/meson.build?=
ref_type=3Dheads#L9
>
> On Mon, Jan 26 2026 at 21:41:44 +01:00:00, Tom Geelen via
> lists.openembedded.org <t.f.g.geelen=3Dgmail.com@lists.openembedded.org>
> wrote:
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com> ---
> meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-) diff --git
> a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb index
> 60a79f5fb3..97948d896f 100644 ---
> a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb +++
> b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb @@ -18,7 +18,7
> @@ RRECOMMENDS:${PN} =3D "rygel-plugin-media-export" inherit gnomebase
> features_check vala gobject-introspection gettext systemd #
> gobject-introspection is mandatory for libmediaart-2.0 and cannot be
> configured -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> SRC_URI[archive.sha256sum] =3D
> "82667b902fc0672e64cf91eb727a70137a8fdfe7a3d9a4c158b0f4b1fc700882"
> --
> 2.43.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this
> group. View/Reply Online (#123890):
> https://lists.openembedded.org/g/openembedded-devel/message/123890 Mute
> This Topic: https://lists.openembedded.org/mt/117476818/3618223 Group
> Owner: openembedded-devel+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ab580a06495154ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah you are right. I am mistaken. Sorry for the message. I =
drew a correlation where there was none.</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 2=
6, 2026 at 9:51=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online=
.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div id=3D"m_-7920550038181180472geary-body" dir=3D"a=
uto"><div>Are you sure about this? Without having x11 in DISTRO_FEATURES I =
see:</div><div><div>| Run-time dependency x11 found: NO (tried pkgconfig)</=
div><div>|</div><div>| ../sources/rygel-45.0/src/rygel/meson.build:9:80: ER=
ROR: Dependency &quot;x11&quot; not found, tried pkgconfig</div><div>|</div=
><div>| A full log can be found at /home/flk/bitbake-builds/poky/build/tmp/=
work/corei7-64-poky-linux/rygel/45.0/build/meson-logs/meson-log.txt</div><d=
iv>|</div><div>| Last 10 lines of meson-log.txt:</div><div>| Package x11 wa=
s not found in the pkg-config search path.</div><div>| Perhaps you should a=
dd the directory containing `x11.pc&#39;</div><div>| to the PKG_CONFIG_PATH=
 environment variable</div><div>| No package &#39;x11&#39; found</div><div>=
| -----------</div><div>| CMake binary for host machine is cached as not fo=
und</div><div>| Dependency lookup for x11 with method &#39;cmake&#39; faile=
d: CMake binary for machine host machine not found. Giving up.</div><div>| =
Run-time dependency x11 found: NO (tried pkgconfig)</div><div>|</div><div>|=
 ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency &quot;=
x11&quot; not found, tried pkgconfig</div><div>|</div><div>| ERROR: meson s=
etup failed</div></div><div><br></div><div><br></div><div><a href=3D"https:=
//gitlab.gnome.org/GNOME/rygel/-/blob/master/src/rygel/meson.build?ref_type=
=3Dheads#L9" target=3D"_blank">https://gitlab.gnome.org/GNOME/rygel/-/blob/=
master/src/rygel/meson.build?ref_type=3Dheads#L9</a></div></div><div id=3D"=
m_-7920550038181180472geary-quote" dir=3D"auto"><br>On Mon, Jan 26 2026 at =
21:41:44 +01:00:00, Tom Geelen via <a href=3D"http://lists.openembedded.org=
" target=3D"_blank">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br><blockquote type=3D"cite"><div style=
=3D"white-space:break-spaces">Signed-off-by: Tom Geelen &lt;<a href=3D"mail=
to:t.f.g.geelen@gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;
---
 meta-multimedia/recipes-connectivity/rygel/<a href=3D"http://rygel_45.0.bb=
" target=3D"_blank">rygel_45.0.bb</a> | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/<a href=3D"http://r=
ygel_45.0.bb" target=3D"_blank">rygel_45.0.bb</a> b/meta-multimedia/recipes=
-connectivity/rygel/<a href=3D"http://rygel_45.0.bb" target=3D"_blank">ryge=
l_45.0.bb</a>
index 60a79f5fb3..97948d896f 100644
--- a/meta-multimedia/recipes-connectivity/rygel/<a href=3D"http://rygel_45=
.0.bb" target=3D"_blank">rygel_45.0.bb</a>
+++ b/meta-multimedia/recipes-connectivity/rygel/<a href=3D"http://rygel_45=
.0.bb" target=3D"_blank">rygel_45.0.bb</a>
@@ -18,7 +18,7 @@ RRECOMMENDS:${PN} =3D &quot;rygel-plugin-media-export&quo=
t;
 inherit gnomebase features_check vala gobject-introspection gettext system=
d
=20
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be con=
figured
-REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data x11&quot;
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;
=20
 SRC_URI[archive.sha256sum] =3D &quot;82667b902fc0672e64cf91eb727a70137a8fd=
fe7a3d9a4c158b0f4b1fc700882&quot;
=20
<div>--=20
</div>2.43.0

</div><div style=3D"white-space:break-spaces">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123890" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/123890</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117476818/361=
8223" target=3D"_blank">https://lists.openembedded.org/mt/117476818/3618223=
</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-dev=
el/unsub</a> [<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@=
t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div></blockquote></div>

--000000000000ab580a06495154ba--

