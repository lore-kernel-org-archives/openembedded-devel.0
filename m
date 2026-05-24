Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2223FCD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 16:09:30 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10445.1779638962982793404
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 09:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z62cNjxX;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c7492a2ceso7814649d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 09:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779638962; cv=none;
        d=google.com; s=arc-20240605;
        b=ZF6feuVLiCZfqs5+UXhs2I+Er3/LSVf+zt/2lMh1J9/2mKSCAzr+4RsY3vMGSuu8vX
         O6iSn+ch56bLg7BcuA0LQPdjfdhVfs8T5X3arRxXPwJWzGKWTKFy9rms1EHETEShilTn
         +GEyEHs2j8kf5Zgv3bCV2f0Tc7PFPpgIpgKRB5ziXEHp+t8iZQ8rBo59/Apa/S2ZzIjG
         l8ovhFi1fQLI+8njXrz9c53bdfxSzxscdMHYRWYaIqYjxVFsJcCX/DrjWFyHgkc8gYym
         im9PaKq7UB7j1OjwcSkJJyb8oZjw6MF/dtZpPI45XT5GAYKbt0EaH9yYzGJT8JJ/mLLP
         Q+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ncLglbld7T4lHSLycxwG+vyYdTdhjBqDYyOjo1mEa4s=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=CEqTivwBCwCyqnsKt9kxMo3QJ8algms6Dp+LY8QrRsS+5wcgEOTE6WoMnSW0AUGBE8
         X4eVAlYKjwriFWQ1YGcws0WdjX2oYxnRkb7lyz2rlC51lgv9xGiIk2JLQvaNVbDyWw+z
         ugCOExBYK3qj0a3+RlBrx2OK64/y4KqQikc587xg0q5RgxHfk3qO2rcofdVsR92HqzvC
         B5wwsYGLKow7KWg7CRYmunnWJ3x25uN3+gFTJPFa34v64QIrsJpfFfOiOnJEWtC6Dx9u
         NH3JlXNZd/rizXS4eUrG+zytKW5oEDjGxqBrXGgtQ1hPyJcHcokA8sx8pFJ0eOQMlbvP
         Af4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779638962; x=1780243762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ncLglbld7T4lHSLycxwG+vyYdTdhjBqDYyOjo1mEa4s=;
        b=Z62cNjxXSUy5lCJZ4dmBKk4h0OLUlRV3bPyMYx/T1WnxTGvI38PS/1IlgqgzDrghKA
         z+CU0GZ8u7n0ilWiGAXdZxpJoJzWatO5udlSTKonvjmDLAF2OgdLSzY9gB+MQOyRcZZF
         yTarRYGdqdrN4sK9acgfQ90mwGSM5XRtQFXqFNIGsTN6ova8/I0kRxotZo+OL+0bACQq
         IaNHyt8d/BuwtrKIpX/LyL+KiDl/pgXeksiX8DDlyMoqc8gkglBdUx5RReAlB6SNKVPT
         T0P91aJ9H34G27ajLgphOkBH+iWg7rxZizehXrPlvJ8ZrtDSY7isZim4S+/0UDAAjBLx
         Y+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779638962; x=1780243762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncLglbld7T4lHSLycxwG+vyYdTdhjBqDYyOjo1mEa4s=;
        b=o1CPxfNSjmb5YWQjzM/HAn8TJtWiOK09EngDKHash6Shf2FGPzPqcPHJ3YWlJrkmES
         oap756cJncxU1lmmke2wIvRyRo3px04FEKMGNF5CsrtM0Ze9LOS10A6RYMyJgDMYY1QU
         4K4jS6bZJZc8ukvAgk7ej+kSv9DjeXFi/42/ofSVRpb3oB3I8WvwcZMzmjnhyuQUwZ4d
         jJXLaDho27BbPS14yOMQ+UKBj0gURTeccoCneuUTu3weoKud1PQVU1KFD8ypWVdvd34E
         rNI+NErPoc2JDtEWUN7IdI0G4Jvg64ux6j4mvlV0njDSNy+hi/m11pjjOWcATW0XU3w0
         O4kA==
X-Gm-Message-State: AOJu0YzOkKOhSOzf9A5ofMjk1SBN0N3ziA9P1xn6UhcjJxZD7x3dNWaZ
	gDYS8SeU/y4ffSYXW8m0jMuhOA3zr4eI2PH41JOlqRse01ucQFt/rT20nw+fTfR/zTMuKpk+s7G
	kbUmYy3VziTmxEV/35K4uMEGbyFwdR0E=
X-Gm-Gg: Acq92OHvNyd5nsBY70ACpTbyLZJt9PGy8ZHIw/B0orDW++uy06kCDJooGoImbqSV71D
	stuMitVIxYpgEMAOjRpAI226d3xgEw2jRAR2NOWjurfaaNoGPSo3OBfyG4ZaQk1MDxOhXLKgsEK
	inTHf5F/o3fUr1j8N+VdcoaLDZ+7OdTl2HZtm+ClR8Ypj/f5UxBiL7IPoOiFYjjZYAmBj5yg7sE
	vUOqKXkFwxVSAtxIUIDve/stg7dEhWhJ2JDP060dxG+zd5n3vHfOm+XEhWCbex+6LjInhjTmI7N
	rwcoEBZqPdC7ElsjuWu4TD2bwLQOgzZiyBdbjXjKj5dDKKGCi/cbyRZYDBmv1ht3eq0VvsGWnl8
	jRIUVCTYn1T2VyelyAZ9InHYFV2MXtob6i0r3XYuwUb9odIba9BtFp+vepI7LsZlCR8LFMF/r+k
	4VxE3v
X-Received: by 2002:a05:690e:b47:b0:652:fc9b:4a1b with SMTP id
 956f58d0204a3-65ec98a3fcbmr10819487d50.40.1779638961037; Sun, 24 May 2026
 09:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260524125709.9164-1-f_l_k@t-online.de> <20260524125709.9164-2-f_l_k@t-online.de>
In-Reply-To: <20260524125709.9164-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 May 2026 09:08:54 -0700
X-Gm-Features: AVHnY4KDVqAQI3OJ3D0e3a8LbI6eurDxqukH1k-0NA4fULFTSJ7CxYV9YKDl3vo
Message-ID: <CAMKF1sqponLgN3oOLfz+H64bTvBpyZNMHbJ=s12gbRLHr5aakw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] mpv-mpris: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000019e4a70652927cff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 16:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127190

--00000000000019e4a70652927cff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1535

On Sun, May 24, 2026 at 5:57=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> mpv-mpris is a plugin for mpv which allows control of the player using
> standard media keys.
>
> This plugin implements the MPRIS D-Bus interface and can be controlled
> using tools such as
> playerctl or through many open source desktop environments, such as GNOME
> and KDE.
>
> It requires mpv to be built with --enable-cplugins (default as of mpv
> 0.26) and to
> be built with Lua support (to enable loading scripts).
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../mplayer/mpv-mpris_1.2.bb                   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> new file mode 100644
> index 0000000000..d4c42483a0
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "mpv-mpris is a plugin for mpv which allows control of the
> player using standard media keys"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d9f933220f595813218a175adc13=
001"
> +
> +SRC_URI =3D "git://
> github.com/hoyon/mpv-mpris.git;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "df95f07c48926d1589ee5fe36a455c1f49cbe4c8"
> +
> +DEPENDS +=3D "ffmpeg glib-2.0 mpv"
> +
> +inherit pkgconfig
> +
> +do_install() {
> +       oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> +}
> +
> +INSANE_SKIP:${PN} =3D "dev-so"
> +
> +RDEPENDS:${PN} =3D "playerctl"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127185):
> https://lists.openembedded.org/g/openembedded-devel/message/127185
> Mute This Topic: https://lists.openembedded.org/mt/119466178/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000019e4a70652927cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#=
/builders/81/builds/1535">https://autobuilder.yoctoproject.org/valkyrie/#/b=
uilders/81/builds/1535</a></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 24, 2026 at 5:5=
7=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.open=
embedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">mpv-mpris is a plugin for m=
pv which allows control of the player using standard media keys.<br>
<br>
This plugin implements the MPRIS D-Bus interface and can be controlled usin=
g tools such as<br>
playerctl or through many open source desktop environments, such as GNOME a=
nd KDE.<br>
<br>
It requires mpv to be built with --enable-cplugins (default as of mpv 0.26)=
 and to<br>
be built with Lua support (to enable loading scripts).<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../mplayer/<a href=3D"http://mpv-mpris_1.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mpv-mpris_1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/mplayer/<a href=3D"http=
://mpv-mpris_1.2.bb" rel=3D"noreferrer" target=3D"_blank">mpv-mpris_1.2.bb<=
/a><br>
<br>
diff --git a/meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv-mpris=
_1.2.bb" rel=3D"noreferrer" target=3D"_blank">mpv-mpris_1.2.bb</a> b/meta-o=
e/recipes-multimedia/mplayer/<a href=3D"http://mpv-mpris_1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">mpv-mpris_1.2.bb</a><br>
new file mode 100644<br>
index 0000000000..d4c42483a0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv-mpris_1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">mpv-mpris_1.2.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;mpv-mpris is a plugin for mpv which allows control of th=
e player using standard media keys&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6d9f933220f595813218a175ad=
c13001&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/hoyon/mpv-mpris.git;p=
rotocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/hoyon/mpv-mpris.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;df95f07c48926d1589ee5fe36a455c1f49cbe4c8&quot;<br>
+<br>
+DEPENDS +=3D &quot;ffmpeg glib-2.0 mpv&quot;<br>
+<br>
+inherit pkgconfig<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} in=
stall<br>
+}<br>
+<br>
+INSANE_SKIP:${PN} =3D &quot;dev-so&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;playerctl&quot;<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127185): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127185" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127185</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119466178/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119466178/1997914</a><br>
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

--00000000000019e4a70652927cff--

