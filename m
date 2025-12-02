Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC2ACFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:46:08 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2884.1764661563969072841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 23:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gqwpIlMx;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78aa642f306so48275587b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 23:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661563; x=1765266363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4bOWxkCJi6jcENNMSV4WzrgNydCE3NzXBZrsVppN34=;
        b=gqwpIlMxo8BxJYPAfwNXLKOuM2HsNJBvzwYs59J+S5z6aEk2JPIPEN3niXM+uOOmVw
         GMhvf+ANNnbFX56DCae7mrwbRYyhLumzq37VWPbK9Ob58ihgO14GhKfqAYS97tf27dek
         rW2fMZ215hIUgc2jLxd0AEmmuz86c6y50v7ZhVvWTEcOc1YVhfoK3/oIIBqbE+3kFrt9
         YirpUXmeTw4eMyzYTO6PzsUXhsgr7wnvyC2z/udIlf+UIVDOcSYN/AdXsLs/WlSrI87+
         feeoiOJ/wTT++sMGRYIbSNtP34jwzWbrUmdfFb7WsZJ10mmCsaiPEMJrwZfMeQEohOIo
         hrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661563; x=1765266363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4bOWxkCJi6jcENNMSV4WzrgNydCE3NzXBZrsVppN34=;
        b=BHDeZ/SQtW2jX/jT/qoEZPPx2xwaR+F8hVeKjPmQ2saiOqay5lS1LRB6KVvrT9mAhg
         qbptRTRjbaUJLGYVTEFj/lNUpi3wBk6GDRqq21u0awkiRx7j+7VTQ2Im0d0sLnRpI59e
         DsudRxi/yzHqQQfxhm6Uq7uyqJTErFHfVBUQq/UAxH3Yt9S2TtpupZhWCSI5tLP7klA8
         7viVrOGGWm6s7UeYbtHjkbjXqLcLePvWEkSW/i9Hmid0G7YBnoaZxwjkfXgEAC7L4ZHX
         uEXouczXv5LJBtxGfyI9qhrjtnO+Od1JnW0DyOGpHnJS39agTpI+uDp0zNnVdQgTnAPZ
         +zqw==
X-Gm-Message-State: AOJu0YyDyRlOyXFAUxK1DxNxFKaEiA0B8fN92PLYvUnDTyDaGRhULtcU
	noip8Js/ePaW8GUSvMkf+2UBPHMBMH1esSCvYaCoY3xCrHOkZ72OiUESuSDIi2QMGCRvvxeF/nz
	gx8o5AZs/jfbXnvsVT1LyKMjf+fnbzOOizCj0tQE=
X-Gm-Gg: ASbGncsq2BMuCaBgBzch0BQHLw/dTgAdx1uV7VcJtoUz/81K8iWrUaI20VeHeuWBTvH
	OrsCjg9mmKPgQSqCaFgatQAmP12UI3bFpJNzEOMUVDdrmj5hIN1nJa/eWWy4mwcw4JiPzIkP90B
	cAXEX/Gkh8HZBTZoX2XkTd2xxjn/P6STIHfthPW7z1QKsjxwcbi4Z3Flk6tLzL6ugy/KlMFNYZs
	BlmVEf6JmlfOI+MEDNYaYZYejuAHKcDJ+cVpA+9i1sOLCdf2LvS5l2TPA4ifxUyJcFAA3xznr0O
	0lohMZOrlJsJ0ezfODBYfTyZpO4ZXXM6A3we1QLhEwcVwSb7LPwnZmTeJEhAdz6VuZkhBeEz9r0
	GewbXBX7BtUZmS433BMzHmDUG+KI4vvSJZaFxi+H1iLTN
X-Google-Smtp-Source: AGHT+IGOhGbo0J1zPxLmNo7iMigI797NqmRnVp9DSbqt9H9K4bSnje/B+nZLTW25pKzxcoSYiUTJoGjEGCrIS7qw0Vk=
X-Received: by 2002:a05:690c:4d0a:b0:786:72ec:6f6c with SMTP id
 00721157ae682-78ab6e2e3a4mr238910867b3.31.1764661562948; Mon, 01 Dec 2025
 23:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20251201104550.175387-1-jan.claussen10@web.de>
In-Reply-To: <20251201104550.175387-1-jan.claussen10@web.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Dec 2025 23:45:36 -0800
X-Gm-Features: AWmQ_bkT8yEOijeEosl6lcE-vR4ozGtSRg9g27yquXMjpRbfK9QnB6UhIStGX7U
Message-ID: <CAMKF1sqfuZ=1H4RAoSPoJg+sMmtVuTtSqfWS94ZhSKQFFG_Yhw@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-mpv: Add recipe
To: jan.claussen10@web.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009bc1fb0644f34941"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 07:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122233

--0000000000009bc1fb0644f34941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It results in YP-compatible tests failing

ERROR: Nothing PROVIDES 'ffmpeg' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-multimedia/mplayer/mpv_0.40.0.bb
DEPENDS on or otherwise requires it)
ffmpeg was skipped: Has a restricted license 'commercial' which is not
listed in your LICENSE_FLAGS_ACCEPTED.
NOTE: Runtime target 'mpv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'python3-mpv', 'mpv', 'ffmpeg']


On Mon, Dec 1, 2025 at 2:45=E2=80=AFAM Jan Clau=C3=9Fen via lists.openembed=
ded.org
<jan.claussen10=3Dweb.de@lists.openembedded.org> wrote:

> python-mpv is a ctypes-based python interface to the mpv media player.
> ---
>  .../recipes-devtools/python/python3-mpv_1.0.8.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-mpv_1.0.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
> b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
> new file mode 100644
> index 0000000000..c11ad4a118
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Python bindings for mpv"
> +DESCRIPTION =3D "python-mpv is a ctypes-based python interface to the mp=
v
> media player"
> +HOMEPAGE =3D "https://github.com/jaseg/python-mpv"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI[sha256sum] =3D
> "95dbd4d869cd8de7a27914ad33e776accc0f01cb82a6d5b31ca439ade2208ffb"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +RDEPENDS:${PN} +=3D "\
> +    mpv \
> +    python3-ctypes \
> +"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122201):
> https://lists.openembedded.org/g/openembedded-devel/message/122201
> Mute This Topic: https://lists.openembedded.org/mt/116553801/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009bc1fb0644f34941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It results in YP-compatible tests failing<br><br class=3D"=
gmail-Apple-interchange-newline"><div><pre style=3D"color:rgb(255,255,255)"=
>ERROR: Nothing PROVIDES &#39;ffmpeg&#39; (but /srv/pokybuild/yocto-worker/=
meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/<a href=
=3D"http://mpv_0.40.0.bb">mpv_0.40.0.bb</a> DEPENDS on or otherwise require=
s it)
ffmpeg was skipped: Has a restricted license &#39;commercial&#39; which is =
not listed in your LICENSE_FLAGS_ACCEPTED.
NOTE: Runtime target &#39;mpv&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;mpv&#39;, &#39;ffmpeg&#3=
9;]
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
providers.
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 &#39;python3-mpv&#39;, &#39;mpv&#39;, &#39;ffmpeg&#39;]</pre></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Dec 1, 2025 at 2:45=E2=80=AFAM Jan Clau=C3=9Fen via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;jan.cl=
aussen10=3D<a href=3D"mailto:web.de@lists.openembedded.org" target=3D"_blan=
k">web.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">python-mpv is a ctypes-based python interf=
ace to the mpv media player.<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-mpv_1.0.8.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-mpv_1.0.8.bb</a> | 16 +++++++++=
+++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-mpv_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-mpv_=
1.0.8.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
mpv_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-mpv_1.0.8.bb</a>=
 b/meta-python/recipes-devtools/python/<a href=3D"http://python3-mpv_1.0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-mpv_1.0.8.bb</a><br>
new file mode 100644<br>
index 0000000000..c11ad4a118<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-mpv_1.0=
.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-mpv_1.0.8.bb</a><br>
@@ -0,0 +1,16 @@<br>
+SUMMARY =3D &quot;Python bindings for mpv&quot;<br>
+DESCRIPTION =3D &quot;python-mpv is a ctypes-based python interface to the=
 mpv media player&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/jaseg/python-mpv" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/jaseg/python-mpv</a>&quot;=
<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;95dbd4d869cd8de7a27914ad33e776accc0f01cb82a6d=
5b31ca439ade2208ffb&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 mpv \<br>
+=C2=A0 =C2=A0 python3-ctypes \<br>
+&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122201): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122201" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122201</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116553801/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116553801/1997914</a><br>
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

--0000000000009bc1fb0644f34941--

