Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F2DD6CFD4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:53:25 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61783.1769147596569825201
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LZoXHaUx;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78c66bdf675so17756727b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 21:53:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769147596; cv=none;
        d=google.com; s=arc-20240605;
        b=ECXo1BKnsE6E/Elxflgpe2R/7Lk/jlPBdRa04R55DC+JJZnalgesCJBoc8/mCKlizU
         ZN/gn6WKaMrhvHI4XkIydNZLZ22mTZ6p9XxyXNMRTuzS2jGWg8WzZBh+2LezstAWka2U
         y0wISB0y6Pe7L9ALZtZHFPgKQCB0y4UlmQ+Cj/8EPNkJhCvboGKvQm/0bMgh/DkuiXZY
         g0OoTrDUDk8og/Ac9bZOozyG2wBY2lAh/SS6lXb08GtsvEpZBGSGloguy3wVKzRyudxW
         97DJqtmN5ypy59JUE97FsuJGAVWTRQI3Yc/4mgdSXNA4cGLv1ubYqalxBEn/ixa13p33
         SVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oApxWMHxeqaS1IvQ8TkkDBikfobb32qR4znsvQoN4xw=;
        fh=Kuo8bXixDJVGyAmfEcBaOJAFeJ+zMTQnaCigoQan5Yo=;
        b=cFu+Zwd6paUGt4IxxrLLbF033kPF5Gm81cfI+ZKsLPn5VYj0X1CKXDH84+x3DzDYO9
         BJWwTcMu7ynmAWADDn49WjhROvH8EkzTbcYftOwty36zZNvqPaHyXxxtCEl7XHEpUVQT
         cFshZV/RHaCKaqjVaUnfTQe8baqaG3EQC9vR1PcixIuL940iSwkEBW33klJ30Bj7rZPH
         K27UN6OqPna+YduyKojOiaWZUggQgwZg5SnYXchHEMNkJSBtdXIUEfMrvbZKJ+HkETAt
         Y0UtXIaMHU3UlfmRh/kQnuuJs2OxnP3SME9Ucw5y/LBz5q14HCj6s63x15jKHw54FrMt
         D25Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769147596; x=1769752396; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oApxWMHxeqaS1IvQ8TkkDBikfobb32qR4znsvQoN4xw=;
        b=LZoXHaUxiu4FPOTxw6Icc2/u4WYLsd1IO+YoUwW8/65OFbABL6S8cFD5fiEU8RUf4H
         g+wiey2nxiwEWrjozGSp+y7ysYJgNucEvyXd5bDJKX3U2FAgA5beJaOQRH67Cod7QdXh
         XBzZcbVX3BLU6kCs1Vyg8vHVlVQ0f7Dvw61jkvGFGCOxKNa54deNs9zkBbvNuA/ZOKQT
         jZxhYdPk0c1bKbZrceaivUyoHAOnqvUF4yaSpnxMDxR35EfU8yvWE/PD3ykTNlSSW6ek
         FIcjBZZuZ/THFD7yJcfyOXzI/Et/41XqfOkq3mu3FVybgOnwiJP2DTAV/nZRRLGmt2oN
         RPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769147596; x=1769752396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oApxWMHxeqaS1IvQ8TkkDBikfobb32qR4znsvQoN4xw=;
        b=HRcy5YO0dv1IgR+u7MUFTAMWWYh4h1653Peaxk1TOQJgDsPPonZVUSD14mzp/mFDj5
         alwQoNJduoa7teXZzhRzaPM2zl6xrI9U2D2fA5sGUte7QzsZWOeZ7k7WeLLSjHmCT7WE
         vv6wVxb+IGnkKFDQI0LFVja5E6vP22O9zjQvEPvuxmqZPy6d544mxgtKT72IMvnAspPw
         +dRwP1ozjQpzJFcxhGuhRjkg46+CNN/e557lplD506UsTs5H4IlLw99PQPy3aAU+rDJ0
         4Y67rQmee4XYuGUWsccqm6RfBtLeqB9OurguUtjo558oax3j7TXm7h43Dnhs61BBk4eB
         G0hw==
X-Gm-Message-State: AOJu0Yxp5Qpw/za8vcks53KwckDy9z03xDAsmBx3F43NJrAq7Khcu66b
	1CF44XliTTQZOXbEM9TczgYBTl2N0NHXbWmb54aXBmVc/GdYVCtf2NmohIMpPFMYiiXbUW8SVo2
	9S4xEO4PVX9Qk/LT/rshkkSAT3V5zSh4=
X-Gm-Gg: AZuq6aKNpbrigKu4BDVo0gW2iHcX+Wtwx243YNFCWcm7fihNeuCYbCthwR/AIh966fi
	9RpLWmi1z+VgZv499FRjlm+4WED+1V3tcptgRym48pG8cONfVNJdgfR5+ChL5SPw+lDmtlM0Jf4
	+Yx6Nt9IcJqeYLNBTtv02swfsnNMrf26L1HjfmUxBrzdPAfaXEeFAnjXBrk7tKdPTYV2o9jK/gA
	LeZptM3VOR4GR6tqaVEhAGUFq0a8rHCWeELnEGuwOxvveu5+H3cdqHw2jgxa/i8r2GG9TRPG+JG
	IO0QIT5ZqJD+11kl8QRVp57b2WRtpuAjKUlSoWRkz1TX0X8WT/2KyyYwsJca/wJEBCCfcPFDP45
	1Fs/5JonFbQg+sz9aX6/3c93mR2eIvhBeyI9p4Ws4UqJeqg==
X-Received: by 2002:a05:690c:6711:b0:792:7675:f5bc with SMTP id
 00721157ae682-794398e5b71mr14795727b3.17.1769147595569; Thu, 22 Jan 2026
 21:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20260120110917.1390032-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260120110917.1390032-1-adam.duskett@amarulasolutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jan 2026 21:52:49 -0800
X-Gm-Features: AZwV_QjRpA-wj2FQAuElitjexgzzpYSfv190vN47wbtFmSs7AeiW7qcs0flPI-Q
Message-ID: <CAMKF1spgu0L2LTnrPtuS6YB58XoxCfe07mg+erf1Z8wHYaNdYQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v4 1/2] [meta-oe] libtsm: add recipe for kmscon dependency
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd3f77064907c5ed"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123763

--000000000000fd3f77064907c5ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

while I have accepted this patch, there remains one problem to address

WARNING: Nothing PROVIDES 'nativesdk-xkeyboard-config' (but
virtual:nativesdk:/home/kraj200/yoe/sources/meta-openembedded/meta-oe/recip=
es-graphics/libtsm/
libtsm_4.4.0.bb DEPENDS on or otherwise requires it). Close matches:
  nativesdk-gnu-config
  nativesdk-pkgconfig
  xkeyboard-config

It is because it has

BBCLASSEXTEND =3D "native nativesdk"

and has DEPENDS =3D "xkeyboard-config"

but there is no package for nativesdk-xkeyboard-config, xkeyboard-config is
provided by oe-core

so, please extend the xkeyboard-config to nativesdk or if nativesdk is not
needed remove extending libtsm for nativesdk.


On Tue, Jan 20, 2026 at 3:09=E2=80=AFAM Adam Duskett via lists.openembedded=
.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: add tag=3Dv${PV} to the SRC_URI
>
>  .../recipes-graphics/libtsm/libtsm_4.4.0.bb   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
>
> diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
> b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
> new file mode 100644
> index 0000000000..1764ba628a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "Terminal Emulator State Machine"
> +DESCRIPTION =3D "\
> +    TSM is a state machine for DEC VT100-VT520 compatible terminal
> emulators. \
> +    It tries to support all common standards while keeping compatibility
> to \
> +    existing emulators like xterm, gnome-terminal, konsole, etc. \
> +    TSM itself does not provide any rendering nor window management. It
> is a \
> +    simple plain state machine without any external dependencies. It can
> be \
> +    used to implement terminal emulators, but also to implement other \
> +    applications that need to interpret terminal escape sequences. \
> +"
> +HOMEPAGE =3D "https://github.com/kmscon/libtsm"
> +BUGTRACKER =3D "https://github.com/kmscon/libtsm/issues"
> +CVE_PRODUCT =3D "libtsm"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "\
> +    file://COPYING;md5=3D69e8256cdc4e949f86fedf94b1b320b4 \
> +    file://LICENSE_htable;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"
> +
> +DEPENDS =3D "xkeyboard-config"
> +
> +SRC_URI =3D "git://
> github.com/kmscon/libtsm;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}
> <http://github.com/kmscon/libtsm;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%=
7BPV%7D>
> "
> +SRCREV =3D "0d33498a6de3619628f7802a0c76fc98c8773d5b"
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON:append =3D " \
> +    -Dextra_debug=3Dfalse \
> +    -Dtests=3Dfalse \
> +    -Dgtktsm=3Dfalse \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123663):
> https://lists.openembedded.org/g/openembedded-devel/message/123663
> Mute This Topic: https://lists.openembedded.org/mt/117361246/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fd3f77064907c5ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">while I have accepted this patch, there remains one proble=
m to address<div><br></div><div>WARNING: Nothing PROVIDES &#39;nativesdk-xk=
eyboard-config&#39; (but virtual:nativesdk:/home/kraj200/yoe/sources/meta-o=
penembedded/meta-oe/recipes-graphics/libtsm/<a href=3D"http://libtsm_4.4.0.=
bb">libtsm_4.4.0.bb</a> DEPENDS on or otherwise requires it). Close matches=
:<br>=C2=A0 nativesdk-gnu-config<br>=C2=A0 nativesdk-pkgconfig<br>=C2=A0 xk=
eyboard-config</div><div><br></div><div>It is because it has</div><div><br>=
</div><div>BBCLASSEXTEND =3D &quot;native nativesdk&quot;</div><div><br></d=
iv><div>and has=C2=A0DEPENDS =3D &quot;xkeyboard-config&quot;</div><div><br=
></div><div>but there is no package for nativesdk-xkeyboard-config, xkeyboa=
rd-config is provided by oe-core</div><div><br></div><div>so, please extend=
 the=C2=A0xkeyboard-config to nativesdk or if nativesdk is not needed remov=
e extending libtsm for nativesdk.</div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jan 20, 2026 at 3:09=E2=80=AFAM Adam Duskett via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;adam.duskett=3D<a =
href=3D"mailto:amarulasolutions.com@lists.openembedded.org">amarulasolution=
s.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Signed-off-by: Adam Duskett &lt;<a href=3D"mail=
to:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.duskett@amarul=
asolutions.com</a>&gt;<br>
---<br>
v1 -&gt; v2: add tag=3Dv${PV} to the SRC_URI<br>
<br>
=C2=A0.../recipes-graphics/libtsm/<a href=3D"http://libtsm_4.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libtsm_4.4.0.bb</a>=C2=A0 =C2=A0| 35 +++++++=
++++++++++++<br>
=C2=A01 file changed, 35 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libtsm/<a href=3D"http://=
libtsm_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libtsm_4.4.0.bb</a><b=
r>
<br>
diff --git a/meta-oe/recipes-graphics/libtsm/<a href=3D"http://libtsm_4.4.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libtsm_4.4.0.bb</a> b/meta-oe/rec=
ipes-graphics/libtsm/<a href=3D"http://libtsm_4.4.0.bb" rel=3D"noreferrer" =
target=3D"_blank">libtsm_4.4.0.bb</a><br>
new file mode 100644<br>
index 0000000000..1764ba628a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/libtsm/<a href=3D"http://libtsm_4.4.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libtsm_4.4.0.bb</a><br>
@@ -0,0 +1,35 @@<br>
+SUMMARY =3D &quot;Terminal Emulator State Machine&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 TSM is a state machine for DEC VT100-VT520 compatible termin=
al emulators. \<br>
+=C2=A0 =C2=A0 It tries to support all common standards while keeping compa=
tibility to \<br>
+=C2=A0 =C2=A0 existing emulators like xterm, gnome-terminal, konsole, etc.=
 \<br>
+=C2=A0 =C2=A0 TSM itself does not provide any rendering nor window managem=
ent. It is a \<br>
+=C2=A0 =C2=A0 simple plain state machine without any external dependencies=
. It can be \<br>
+=C2=A0 =C2=A0 used to implement terminal emulators, but also to implement =
other \<br>
+=C2=A0 =C2=A0 applications that need to interpret terminal escape sequence=
s. \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/kmscon/libtsm" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/kmscon/libtsm</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/kmscon/libtsm/issues" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/kmscon/libtsm/issues=
</a>&quot;<br>
+CVE_PRODUCT =3D &quot;libtsm&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;MIT &amp; LGPL-2.1-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://COPYING;md5=3D69e8256cdc4e949f86fedf94b1b320b4 \<br>
+=C2=A0 =C2=A0 file://LICENSE_htable;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \<br>
+&quot;<br>
+<br>
+DEPENDS =3D &quot;xkeyboard-config&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/kmscon/libtsm;protoco=
l=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/kmscon/libtsm;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a=
>&quot;<br>
+SRCREV =3D &quot;0d33498a6de3619628f7802a0c76fc98c8773d5b&quot;<br>
+<br>
+inherit meson pkgconfig<br>
+<br>
+EXTRA_OEMESON:append =3D &quot; \<br>
+=C2=A0 =C2=A0 -Dextra_debug=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dgtktsm=3Dfalse \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123663): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123663" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117361246/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117361246/1997914</a><br>
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

--000000000000fd3f77064907c5ed--

