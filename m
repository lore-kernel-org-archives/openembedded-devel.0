Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3470.1793675768934837535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 19:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T1bF2iEI;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac4806e210so30928727b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 19:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793675768; cv=none;
        d=google.com; s=arc-20260327;
        b=HDEQQx3V0NpZrXs+GAny/wwDosu+4aQAgIKxSVEoSGt2dZipyW7fgE5PYwFFomC/I+
         /BeA7HVW+V1Di/h2wsSTyLHqEvEJ7NikVYqzMubrMeWGG5SjSpgn6rwmmysBE7vBxd1v
         +KZCkr8xbRc1YsEc8TWvhQhzKEfUfjtghVSf7+VN0QmDTLKGTIdez9Wx8kcL3yRZ4a7K
         LOHqIBK4fCPKPQncpSD0kPdQpv6tzKcWUAda0ImhFvHFZqCxxkJtF8vPd3aR3hw60XO1
         v9zOh5/blc07h5Pd6LJolukllZepv+pt/vEACIOjrE55zJRUZ1cnGg2O803x2R+nOLaL
         VBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9YR4MM00WbAXIMliZN1ymNPDYZXLjUbX88xGqKs/NA=;
        fh=RKFgezW4ipTiyc7t95qOfzy0faQPtUv/jmHz95qJva4=;
        b=DT83r+kyUAXrB61+vXx7xxrLIylH7GnIEXv2jYRhAiXQKf2XiJcafB4mj34JmzokCQ
         /YSDKBTwSlRRGrsgj7zHVeNwTEntNBu8vf8Hgqgm2KUnb8o/mmTS4lCssm9DTQJisHCN
         W9NsCrrn52VFd5LDHuYmfmDlMGD1pF1SZsyDUlVONkV1ciJn4JKlDID+521drzv2l6bC
         lymgUIANwzXBygTHM8zJn+403oMBw2o2y15rA1sOS+UVXHI6Zl8Ed9BSL+qmkx9r6h/m
         6pVxkeSmP0mkcYY9Yh2ID9W3RyUBasNThNNcBjyikX8PMFv5k3RSUtSVyDWCFTQphOjD
         eNzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675768; x=1794280568; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9YR4MM00WbAXIMliZN1ymNPDYZXLjUbX88xGqKs/NA=;
        b=T1bF2iEI7yQf/ejs1VBExiBdHQoSWHehVAvtPmVn1g04hXg8bem0YuMpR37Tk3RnqG
         Op63NPaBEySI3xZSUtGpdcdRFAvaLev0O07KXPkgJsGbpo/7x10Amswx5aIkJCRudGEX
         SbfeT/JkLw6qbUuiTkMozzAPwsDVSg7Xb2l8yosoazVQRL4IRzJkMqmLOjAKpwj7gMTT
         W7xhr3X5vmCXFmg9Mz7mpi/3XILTs1zfhtAklket1Xoy4gJ4iinsMtmYfpVfYwRItt2N
         OF3JvNt+LvxPG+ccnMw/Dfi5muxwI13a21NtMC0rrY/N2TVIAF2Oqefsr30/hIeWvaik
         FtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675768; x=1794280568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9YR4MM00WbAXIMliZN1ymNPDYZXLjUbX88xGqKs/NA=;
        b=z3GXP0VJQ7srrM0rPVmOKRnx5QPdXRgncnxtpGHa9gcPbPLZy5RpFRoMmbfbFkwJRJ
         88E8agLl3MbCW0PPI8Dv3FLmI7c+4X1y1mnRkBT0+Kxv+bK8b+mxMhadUOfCmzANY0jH
         N8LOIxjR8oKXArr+eOfhQpIZZMMCKtUOEl4/sK1mG2Vmu6n2Y1Un7Vwv/40N59mqfZTx
         DkGuWt0xNuViVOzFp+PiFJk0Ly2Bw3ul7HPrn3HjIg2pBDFjXMcpBbw6qpsSPXtd+raV
         A4fkLCnRJ22gmt6VG2YJoWsepNNCoyZITLTaQ/NLt1ftBo04+sR1oxa5Viic07wfadxr
         DtyQ==
X-Gm-Message-State: APuU4Z+yqtESixuy6DffYD4hbfBp0iILT5n/84kIL6ReKpTaWXypBxWS
	2FezQkhyUc6Dfj5TF4547pojQ81zbruJB1SU00PquweU+dfN/P6Lvw7/SSNBw1vpNEd5gxG7ZzZ
	8YCoCPiu/tI/v4J89H4VOMXifPw7wHFFxcX5Q
X-Gm-Gg: AYBFou06gtwHkL83/3kw3iUbODcBCUCHsh+ucuuWf+pwkz7esSPS6ohI5uByjXkLwNa
	PRImv77NcBlJAvLCc0u+b+/xOO99erYb6zI0zOJeCNCNybylzEE8LO4o++hYoDswyvcoKxq7Z1I
	dKbFE8XFRV9ljFz97ERyXF4VJ8HNoyawwcsXZIxCT7lH1qRKy8CPCDST383V0BPr4ui+CxKpXRD
	fVaoX2CgcipP5xSU34nsu0tJbVmqvie5h2859+KQJsRfbxABymaUU1zBP3VqCVeICyPmDeckftq
	SJJotTyVbP2e15l/TJMTakLw6Tlh2GZbC2fswyUzZDLCzZk80rhy7jhXiug6AGHfi+C+ktMfrZX
	GCRBdmzHLSN9Huu3f61+jhrULXg0HxgsCQvTtLVlon7Uw/B/PG3jNQZ5oL0TrX/OK3j1al+/0iV
	itCLbiG3QqUQ0r1INLnz0JLeQCTJBNbErJWBn13tecV7pg3pGcgzt83U0lP32dVlZQuenxdyEf0
	K4l/33gVaqPFHzg1KDvl1dnJpweUjg4HyZj+ctmA9LDOgj+lOFGtePhPjzmLarzFzJ3kGtxiDiw
	RqNvWht5jPEDBDqovwDEyx9CotIKkBDvXjqqNbK2YcM/gvL1dVxay7tLy0d8ZoHtwzRHWVd6ES7
	Q9b0DgcY74QguVfrdp5iwh+o=
X-Received: by 2002:a05:690c:d81:b0:8ac:6e11:3ddb with SMTP id
 00721157ae682-8b2b675d404mr82450197b3.34.1793675767686; Mon, 02 Nov 2026
 19:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20261102103459.3625067-1-sean@geanix.com> <20261102103459.3625067-2-sean@geanix.com>
In-Reply-To: <20261102103459.3625067-2-sean@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2026 19:15:41 -0800
X-Gm-Features: AclHuK-wz_mdTAsQ0WJVxEp923iCk9VhkaMzP12ygu4ABNj3WzkETmQ5yXDVaU4
Message-ID: <CAMKF1soDR+KvfX7YFqfoMG7y6EHxRmk7Aap7E=iTV2Jr8x4z=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] zsh: make libpcre2 a PACKAGECONFIG
To: sean@geanix.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f9ae46065f56aee0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 03:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131756

--000000000000f9ae46065f56aee0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:35=E2=80=AFAM Sean Nyekjaer via openembedded-devel=
 <sean=3D
geanix.com@lists.openembedded.org> wrote:

> libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled
> by default, so it can be dropped.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> index 47b9bfc18f..16a769612c 100644
> --- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> @@ -8,7 +8,7 @@ SECTION =3D "base/shell"
>  LICENSE =3D "LicenseRef-zsh"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514=
fec"
>
> -DEPENDS =3D "ncurses bison-native libcap libpcre2 groff-native"
> +DEPENDS =3D "ncurses bison-native libcap groff-native"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
>  SRC_URI[sha256sum] =3D
> "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81"
> @@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
>  ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
>  ALTERNATIVE_PRIORITY =3D "90"
>
> +PACKAGECONFIG ??=3D "pcre"
>  PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm"
> +PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre2"
>

zsh/pcre module is link=3Ddynamic only and the recipe uses --disable-dynami=
c,
so the module is not built as such.

Making pcre a PACKAGECONFIG enabled by default, started passing
--enable-pcre, which zsh never got before (its default is off). configure
then runs pcre2-config, but libpcre2 inherits binconfig-disabled, so
`pcre2-config --cflags` returns bogus stuff. One can fix that by using
pkgconfig
or writing a small wrapper for pcre2-config using pkgconfig but servees no
point if dynamic modules are disabled.

Other patch to turn gdbm into a packageconfig also has same problem.


>  # Needed for manpages.bbclass, but they're always installed
>  PACKAGECONFIG[manpages] =3D ""
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131748):
> https://lists.openembedded.org/g/openembedded-devel/message/131748
> Mute This Topic: https://lists.openembedded.org/mt/122055384/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f9ae46065f56aee0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, =
2026 at 2:35=E2=80=AFAM Sean Nyekjaer via openembedded-devel &lt;sean=3D<a =
href=3D"mailto:geanix.com@lists.openembedded.org">geanix.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled=
<br>
by default, so it can be dropped.<br>
<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=
=3D"_blank">sean@geanix.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsh_5.9.2.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a> b/meta-oe/recipes-shells=
/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">z=
sh_5.9.2.bb</a><br>
index 47b9bfc18f..16a769612c 100644<br>
--- a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
+++ b/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
@@ -8,7 +8,7 @@ SECTION =3D &quot;base/shell&quot;<br>
=C2=A0LICENSE =3D &quot;LicenseRef-zsh&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3D1a4c4cda3e8096d2fd483=
ff2f4514fec&quot;<br>
<br>
-DEPENDS =3D &quot;ncurses bison-native libcap libpcre2 groff-native&quot;<=
br>
+DEPENDS =3D &quot;ncurses bison-native libcap groff-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/$=
{BP}.tar.xz&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;36fa734374b44783582cec09bcd67822e2f992c7=
79ec1624ab5596df078d2f81&quot;<br>
@@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D &quot;${base_bindir}/sh&quo=
t;<br>
=C2=A0ALTERNATIVE_TARGET[sh] =3D &quot;${base_bindir}/${BPN}&quot;<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;pcre&quot;<br>
=C2=A0PACKAGECONFIG[gdbm] =3D &quot;--enable-gdbm,--disable-gdbm,gdbm&quot;=
<br>
+PACKAGECONFIG[pcre] =3D &quot;--enable-pcre,--disable-pcre,libpcre2&quot;<=
br></blockquote><div><br></div><div>zsh/pcre module is link=3Ddynamic only =
and the recipe uses --disable-dynamic,</div><div>so the module is not built=
 as such.=C2=A0</div><div><br></div><div>Making pcre a PACKAGECONFIG enable=
d by default,=C2=A0<span style=3D"background-color:transparent">started pas=
sing</span></div><div><span style=3D"background-color:transparent">--enable=
-pcre, which zsh never got before (its default is off). configure</span></d=
iv><div><span style=3D"background-color:transparent">then runs pcre2-config=
, but libpcre2 inherits binconfig-disabled, so</span></div><div><span style=
=3D"background-color:transparent">`pcre2-config --cflags` returns bogus stu=
ff. One can fix that by using pkgconfig</span></div><div><span style=3D"bac=
kground-color:transparent">or writing a small wrapper for pcre2-config usin=
g pkgconfig but servees=C2=A0no</span></div><div><span style=3D"background-=
color:transparent">point if dynamic modules are disabled.</span></div><div>=
<br></div><div>Other patch to turn=C2=A0gdbm into a packageconfig also has =
same problem.</div><div><span style=3D"background-color:transparent">=C2=A0=
</span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0# Needed for manpages.bbclass, but they&#39;re always installed<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;&quot;<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131748): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131748" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131748</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122055384/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122055384/1997914</a><br>
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

--000000000000f9ae46065f56aee0--
