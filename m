Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8121EA71AB
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 21:13:30 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7089.1776633200832939415
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 14:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BoW24XTw;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651bf4a4140so2385199d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 14:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776633200; cv=none;
        d=google.com; s=arc-20240605;
        b=DltJBAGAaVqj0kCllb6jMA+LXu13T32f7uquz7qsfTmixK53VfSpqTh6ReMRzDbysf
         gMx+wIY/Tlk88w/s1z7GU/l5Q7BN8IqlTqDqxbQ9/KYcbOMsT7MoTy/uNFdgEy6zrXZ/
         hsrhvWRDGy/Fp9MJ5cRHpcFlf5ya9+m8zNC+ueJnVCJ93Mu7TCrVJrBwoDw69XK05LRv
         3xaPqv9nPnjCSkcWtm6TK2+7brNqEJi0o1bgg2ymp9jPYP6t5d84JLsu+axEelCsKRWq
         ZZ4JY8ZqhOfRx5rKD4pxnquhbXyNSbwoZwh/HE0JUVTMFQbANU9aLt6EUCEHvOYcY26O
         ACBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TYDp0CynxwPJcDIXd5JZWedye16Jkl3ea3azF4LMW5U=;
        fh=wtQJmTNKI5f1UFKEvRhwyoTFPNk3MPf/Yr/dx5nN1Vo=;
        b=h+DwWu3nkv2Cp83W8cbQYt1Sb5TRxSqPRJoftCS3pxBY78EOFQQWwF/0Ia7MWYblN3
         jmmAxu7E5DFPUp77P1GZRtM7t13BZcUUGVB6C71s8mEqwxrPmGENiQk2wYrWasomugxT
         P/GX5b8FUXUgSvxitaIAdQrvn5GloOQa6em/E+Q9n+aS0WwCnu/0iab6pOCfsOGLEJPc
         N/Wyjh4XuOx5BfpSm5BbI8Z3ELwFpO41UREZD3G2sn6KYS9vKT7v99x9S9G2Bmb29E5X
         mrJwmsJxNEtSotD+MHUsOA5fqYmr5KnM39Y7ezJ4vGOJ6Qu8znqJsibglM9KHaP8llYt
         EitA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776633200; x=1777238000; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TYDp0CynxwPJcDIXd5JZWedye16Jkl3ea3azF4LMW5U=;
        b=BoW24XTwL0maDfmflIAyTOWp9frc/kX/XeibNR12HMrUrx7wKcJ68oGLrBdkgynHdF
         Aj25EymEiW74ZSKTO1jrU7YwOwu9+layMqxgjW0JdG4oGd8ynhCri+dRqvt3aa8HfQeR
         F4x5p3cMq7kcNhN3yP/jbZGjT/QmTBxqh4LlO0D7JC+JJp4T3cgFEt/UtPSdFFPX1loh
         HIjVh+p18UVxflXpYwgmw/ST+1K1rqQB06GmQMTT8XsnhTxtJTPBJcfvOHvxfWroRWAM
         /n3fXmaGcrAWaEAsVK24ARQUwUf2ZqvCqvIoNp7K/LjVo53Mol1J1fijkfvr/khHIwlW
         Jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776633200; x=1777238000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYDp0CynxwPJcDIXd5JZWedye16Jkl3ea3azF4LMW5U=;
        b=bEcdRE0ef/UEQ2ZhXTzWm2kya4SHT/uxTd14JNEozNvfvDutpDPDK1jW8iexHYEZ6U
         g73Hy5Bx9JUDm1PxS8Jy1g8ptLEcX4JR1tx1kKYX2GBjDV9rRgu5sEoWyKKfAlVUg+sA
         g3/InVxyZFadY1Dfx8Ms6MC98XZquIQEzBrdiUEDZasMPI7KKXLfEuPuv51uf2jUBAIX
         4B6IH81ztgNtVA5sXvDiAA0oDfR5ZHR1fndeztE9xCV1Aj9mwFQNVBtbZOWlMYlZe1Dc
         sY0qDv7XASvcOFtM9E2hOgy4GRz9k+BLsDAbB7PRDMYs6+EkT/C0w0WI8df1cgQAXv1b
         DCfA==
X-Gm-Message-State: AOJu0Yz8tvBGFQ2P6QblVzFPk7qMepX82heFdFIvitna1aZnL+mjQG3K
	4zmoRKH+1vE1xWiMA5mNZaKokYvNoEcLASYkNCrW11RVhYBIjtu4IulgugY3O3KG/EXDMv32cHt
	gsVy4HnPiM2Lu4ym13YHANZAPI02G2CsdPeR/
X-Gm-Gg: AeBDiescdV6E1RwpYSdoEa5nEdNzetTyx9N92tOf+i1vvJq5OwvR4IfcoRk9FKNpfUU
	FfQ1yhUxNZDE+9Iw3upmZVoTUI08kuf+zkJSAAB/zFTEcXDHR2u8KF02r/bQ6Hm265rNdxdtKm3
	ovEyX5QKpd6D/1X61bSKaOVxr8Xv35AsaFT4Qa4l5nC/WcjJmoaGMsKJTfoJgHUBeB3Oh62BgPs
	PYl0+rAMLYttH3OdFLyl5DURkQC4990r4+CtDgxfo5scRM9J9XwZ3x4ZsbwBCTbG5KA9wtFHsdR
	+b01npMm2aEjz8zQig9kzqhQaAH7cbSxWZRDcSnvCxVGWvmKc0nvevdh0I9ETclcK5Y1SfyOO5b
	Fq/liUl1mGFb2SzoVvp/25spXYcJ6vcHRvOYGvmaDL3RK/J83atwk1RrUKQil105RDUIA4mA/3L
	GI09QkY+Cfw17BpTw=
X-Received: by 2002:a05:690e:43c2:b0:650:49e:a9e3 with SMTP id
 956f58d0204a3-653107cb758mr6936321d50.11.1776633199711; Sun, 19 Apr 2026
 14:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <63d0406940654464c14f7d9cba2f2542f2ad7682.1776609146.git.joerg.sommer@navimatix.de>
In-Reply-To: <63d0406940654464c14f7d9cba2f2542f2ad7682.1776609146.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Apr 2026 14:12:52 -0700
X-Gm-Features: AQROBzDw5eTuso2x2dNKRPJdOoQ3IdBSevw_p8nkKJF2CVCBQIeCm9-x7G7fjtY
Message-ID: <CAMKF1soun2c6nCsGgceAej2DPEx=KxJgwMP1eLPPuLEoJhDrSA@mail.gmail.com>
Subject: Re: [oe] [PATCH] framebuffer-vncserver: New recipe for VNC server for framebuffer
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3e49c064fd6a6dd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 21:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126460

--000000000000c3e49c064fd6a6dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails to build with master that has newer version of cmake

| CMake Error at CMakeLists.txt:2 (CMAKE_MINIMUM_REQUIRED):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max>
syntax
|   to tell CMake that the project requires at least <min> but has been
updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!
| WARNING: exit code 1 from a shell command.
NOTE: recipe framebuffer-vncserver-git-r0: task do_configure: Failed

see
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6409157/raw_inlin=
e

On Sun, Apr 19, 2026 at 7:32=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../framebuffer-vncserver_git.bb              | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/framebuffer-vncserver/
> framebuffer-vncserver_git.bb
>
> diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/
> framebuffer-vncserver_git.bb
> b/meta-oe/recipes-graphics/framebuffer-vncserver/
> framebuffer-vncserver_git.bb
> new file mode 100644
> index 0000000000..09d54f3ff4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/framebuffer-vncserver/
> framebuffer-vncserver_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "VNC server for Linux framebuffer devices"
> +DESCRIPTION =3D "\
> +    The goal is to access remote embedded Linux systems without X.
> Implemented \
> +    features: remote display, touchscreen, keyboard, rotation. Not
> implemented: \
> +    file transfer, ... \
> +"
> +HOMEPAGE =3D "https://github.com/ponty/framebuffer-vncserver"
> +BUGTRACKER =3D "https://github.com/ponty/framebuffer-vncserver/issues"
> +SECTION =3D "graphics"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8264535c0c4e9c6c335635c4026a8=
022"
> +
> +SRC_URI =3D "git://
> github.com/ponty/framebuffer-vncserver.git;protocol=3Dhttps;branch=3Dmast=
er"
> +SRCREV =3D "1963e57bebfde420baeecbb2c6848a2382488413"
> +
> +DEPENDS =3D "libvncserver"
> +
> +inherit cmake systemd
> +
> +do_install:append() {
> +    install -m 644 -D -t ${D}${systemd_system_unitdir} ${S}/fbvnc.servic=
e
> +}
> +
> +SYSTEMD_SERVICE:${PN} =3D "fbvnc.service"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126459):
> https://lists.openembedded.org/g/openembedded-devel/message/126459
> Mute This Topic: https://lists.openembedded.org/mt/118904597/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c3e49c064fd6a6dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to build with master that has newer version of =
cmake<div><br></div><div>| CMake Error at CMakeLists.txt:2 (CMAKE_MINIMUM_R=
EQUIRED):<br>| =C2=A0 Compatibility with CMake &lt; 3.5 has been removed fr=
om CMake.<br>| <br>| =C2=A0 Update the VERSION argument &lt;min&gt; value.=
=C2=A0 Or, use the &lt;min&gt;...&lt;max&gt; syntax<br>| =C2=A0 to tell CMa=
ke that the project requires at least &lt;min&gt; but has been updated<br>|=
 =C2=A0 to work with policies introduced by &lt;max&gt; or earlier.<br>| <b=
r>| =C2=A0 Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring =
anyway.<br>| <br>| <br>| -- Configuring incomplete, errors occurred!<br>| W=
ARNING: exit code 1 from a shell command.<br>NOTE: recipe framebuffer-vncse=
rver-git-r0: task do_configure: Failed</div><div><br></div><div>see</div><d=
iv><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/640=
9157/raw_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/=
6409157/raw_inline</a></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 19, 2026 at 7=
:32=E2=80=AFAM J=C3=B6rg Sommer via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimati=
x.de@lists.openembedded.org">navimatix.de@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: J=C3=
=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de" target=3D"_bl=
ank">joerg.sommer@navimatix.de</a>&gt;<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://framebuffer-vncserver_git.bb" rel=3D"noreferrer=
" target=3D"_blank">framebuffer-vncserver_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 +++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/framebuffer-vncserver/<a =
href=3D"http://framebuffer-vncserver_git.bb" rel=3D"noreferrer" target=3D"_=
blank">framebuffer-vncserver_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/<a href=3D"http=
://framebuffer-vncserver_git.bb" rel=3D"noreferrer" target=3D"_blank">frame=
buffer-vncserver_git.bb</a> b/meta-oe/recipes-graphics/framebuffer-vncserve=
r/<a href=3D"http://framebuffer-vncserver_git.bb" rel=3D"noreferrer" target=
=3D"_blank">framebuffer-vncserver_git.bb</a><br>
new file mode 100644<br>
index 0000000000..09d54f3ff4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/framebuffer-vncserver/<a href=3D"http://fram=
ebuffer-vncserver_git.bb" rel=3D"noreferrer" target=3D"_blank">framebuffer-=
vncserver_git.bb</a><br>
@@ -0,0 +1,25 @@<br>
+SUMMARY =3D &quot;VNC server for Linux framebuffer devices&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 The goal is to access remote embedded Linux systems without =
X. Implemented \<br>
+=C2=A0 =C2=A0 features: remote display, touchscreen, keyboard, rotation. N=
ot implemented: \<br>
+=C2=A0 =C2=A0 file transfer, ... \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ponty/framebuffer-vncserv=
er" rel=3D"noreferrer" target=3D"_blank">https://github.com/ponty/framebuff=
er-vncserver</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/ponty/framebuffer-vncse=
rver/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/ponty/=
framebuffer-vncserver/issues</a>&quot;<br>
+SECTION =3D &quot;graphics&quot;<br>
+<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8264535c0c4e9c6c335635c402=
6a8022&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ponty/framebuffer-vnc=
server.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/ponty/framebuffer-vncserver.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;1963e57bebfde420baeecbb2c6848a2382488413&quot;<br>
+<br>
+DEPENDS =3D &quot;libvncserver&quot;<br>
+<br>
+inherit cmake systemd<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 install -m 644 -D -t ${D}${systemd_system_unitdir} ${S}/fbvn=
c.service<br>
+}<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;fbvnc.service&quot;<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126459): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126459" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126459</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118904597/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118904597/1997914</a><br>
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

--000000000000c3e49c064fd6a6dd--

