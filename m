Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A49CCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:27:02 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42958.1762759619369810757
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g+8HnOMx;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-787f586532bso3962597b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 23:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762759618; x=1763364418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BQwQIuokgpw7m78AkT2VO28GTfPaI03p97BJde5hq2o=;
        b=g+8HnOMxHfHdLDJsPVtWDE7adooJ3XoYC4Y8zyhcws0JYwHuMyoszgo3XAH4JidcGr
         /OyuczFBjtlYASqt49mfcvFDrONMHWXA+SoTKBmWXIvuDxapQhUENOZqL6BArhtbdiLA
         Y/2tc9eUp5qjW7D3pJufWi7xhm2Lza9dmaeQ9RusMsKmiYdpWR9/ESHWe21L2/rxMwfY
         U1f0dUUpK004Bu0azHPjlcxoVVpN8jIaWFMXsQDlD4DdcklD1xW2CzbLwV1QIbx4Mk5A
         uu/3k00p7VzAMqfO+IMkZZpf9i19hgxBrsxeEVwnA0cB4RsvDwDw+YWRvAkKUYiM3Tya
         /0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762759618; x=1763364418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQwQIuokgpw7m78AkT2VO28GTfPaI03p97BJde5hq2o=;
        b=HcsZ6iGwl3SmZ/6GGSaF/ZbVrhP2w+zdRLpeRgPuhsRhktS2Z1lcSLLWHP09pNysN+
         OcxJoIuVYkte8Ijj0V0RzQ8h83njuRTn2jrHYuWnW3e0N0Re4B0hb/MYltvxXW0PMPAq
         PckK0jTkxsuuoij9y8WuskYoUus2/xo1JDfy0i8BGHBz7jQFipHV033mPUXlrMfWaQku
         dK1auG7iVLc/rKkx7EwpMmV7sy9pONiD3ZueP5VMPgeufhvAqbV1vvbk010uc14z1UgQ
         Xp81wVmTXlYZrz7nF+aRdVBHntEsIh5IMEvSGN8nTin2Jma6JSMs50Fm2Gga4xXJ+06R
         Sgmg==
X-Gm-Message-State: AOJu0Yyla0IVcepYUY4jFLvpwQMHyQlU8hdlYFGr6J7kR/+8bSAW5qv4
	PTnmG16qOMwXI7wgjADJ/BQOHqMydxf4zCuvMj5SxDXQPjmOdk+kOjS6agKvJabEQzMaBtOIiTC
	8Zm+zFFbVdPkC1f7pafLpRR66olQZz5I=
X-Gm-Gg: ASbGncvRJViKXkWdlZcjdB6Mt0mdRq7ce0UrHYpJQFERaBeQJo9ddDhbVilENn/m7iE
	u1FHN+b1Cubh2TzjFX7o2QN+MILAvkSFL9JDyB/eVn9Rw4d2XEXCkOtH8XWmmFGTn9TLzX3PK8t
	XQFtnI456Y+xjIiXk3UQEEs2wgCbFafg1iM6f+/6hOSCLAY6HowPPxlhCofdK60uSGPp2TVK3ey
	ZINM1LWeBWTqIDVPU1SInR5ryBVSThLETeojagfe0HHTfKZlA9FJf3TkNR4ztmi25+anXS7kxsH
	LQyIujs86ANTkh1diciJriQX7gkHj0oE7I7V0zl/O8FcGmmBGqghM7216fgx2G2QEDlv1PM=
X-Google-Smtp-Source: AGHT+IFDh5mB2+R6h0dHYJMVHQXGje21olG93jL648wPWS81W8lai3eJ4cQFmPls2p+XcdEfe/j87gtqxyjRT/CXF7w=
X-Received: by 2002:a05:690c:6ac9:b0:786:5789:57df with SMTP id
 00721157ae682-787d5414d63mr75686097b3.45.1762759618372; Sun, 09 Nov 2025
 23:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20251109164541.2901-1-moraless.philius5@gmail.com>
In-Reply-To: <20251109164541.2901-1-moraless.philius5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Nov 2025 23:26:31 -0800
X-Gm-Features: AWmQ_bl2OoEO6P0DVwIB1qNy1dKULe0DoeBJAO3WxqLmMkRuy56Bm0FktAuo7uQ
Message-ID: <CAMKF1srh_7tQiHoafxDPjg-okoJM-Wnk+_DO4kbsMVBRJHxWcg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libtalloc: fix pytalloc package ordering
To: moraless.philius5@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0a9e006433874d3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 07:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121447

--000000000000e0a9e006433874d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please rebase it on master-next and resend

On Sun, Nov 9, 2025 at 11:22=E2=80=AFAM moraless.philius5 via lists.openemb=
edded.org
<moraless.philius5=3Dgmail.com@lists.openembedded.org> wrote:

> From: Moraless Philius <moraless.philius5@gmail.com>
>
> The libtalloc recipe did not properly populate the pytalloc package
> because pytalloc was listed after the main libtalloc package in the
> PACKAGES variable. As a result, the pytalloc package contained only
> talloc.so and was missing other required files.
>
> Signed-off-by: Moraless Philius <moraless.philius5@gmail.com>
> ---
>  .../recipes-support/libtalloc/libtalloc_2.4.2.bb       | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
> b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
> index b617f097cf..177872fd60 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
> @@ -49,13 +49,15 @@ do_install_ptest() {
>      install -m 0755 ${B}/bin/*_testsuite ${D}${PTEST_PATH}/tests/
>  }
>
> -PACKAGES +=3D "pytalloc pytalloc-dev"
> +PACKAGES =3D+ "pytalloc pytalloc-dev"
>
>  RPROVIDES:${PN}-dbg +=3D "pytalloc-dbg"
>
>  FILES:pytalloc =3D "${PYTHON_SITEPACKAGES_DIR}/* \
> -                  ${libdir}/libpytalloc-util.so.2 \
> -                  ${libdir}/libpytalloc-util.so.2.1.1 \
> +                  ${libdir}/libpytalloc-util.so.* \
>                   "
> -FILES:pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
> +FILES:pytalloc-dev =3D "${libdir}/libpytalloc-util.so \
> +                      ${includedir}/pytalloc.h \
> +                      ${libdir}/pkgconfig/pytalloc.pc \
> +                     "
>  RDEPENDS:pytalloc =3D "python3"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121445):
> https://lists.openembedded.org/g/openembedded-devel/message/121445
> Mute This Topic: https://lists.openembedded.org/mt/116207686/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e0a9e006433874d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">please rebase it on master-next and resend</div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sun, Nov 9, 2025 at 11:22=E2=80=AFAM moraless.philius5 via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;moraless.=
philius5=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Moraless Philius &lt;<a href=3D"mailto:moraless.p=
hilius5@gmail.com" target=3D"_blank">moraless.philius5@gmail.com</a>&gt;<br=
>
<br>
The libtalloc recipe did not properly populate the pytalloc package<br>
because pytalloc was listed after the main libtalloc package in the<br>
PACKAGES variable. As a result, the pytalloc package contained only<br>
talloc.so and was missing other required files.<br>
<br>
Signed-off-by: Moraless Philius &lt;<a href=3D"mailto:moraless.philius5@gma=
il.com" target=3D"_blank">moraless.philius5@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/libtalloc/<a href=3D"http://libtalloc_2.4.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtalloc_2.4.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-support/libtalloc/<a href=3D"http://li=
btalloc_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.4.2.bb</=
a> b/meta-networking/recipes-support/libtalloc/<a href=3D"http://libtalloc_=
2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.4.2.bb</a><br>
index b617f097cf..177872fd60 100644<br>
--- a/meta-networking/recipes-support/libtalloc/<a href=3D"http://libtalloc=
_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.4.2.bb</a><br>
+++ b/meta-networking/recipes-support/libtalloc/<a href=3D"http://libtalloc=
_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.4.2.bb</a><br>
@@ -49,13 +49,15 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 0755 ${B}/bin/*_testsuite ${D}${PTEST_PATH}/=
tests/<br>
=C2=A0}<br>
<br>
-PACKAGES +=3D &quot;pytalloc pytalloc-dev&quot;<br>
+PACKAGES =3D+ &quot;pytalloc pytalloc-dev&quot;<br>
<br>
=C2=A0RPROVIDES:${PN}-dbg +=3D &quot;pytalloc-dbg&quot;<br>
<br>
=C2=A0FILES:pytalloc =3D &quot;${PYTHON_SITEPACKAGES_DIR}/* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/l=
ibpytalloc-util.so.2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/l=
ibpytalloc-util.so.2.1.1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/l=
ibpytalloc-util.so.* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-FILES:pytalloc-dev =3D &quot;${libdir}/libpytalloc-util.so&quot;<br>
+FILES:pytalloc-dev =3D &quot;${libdir}/libpytalloc-util.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${includedir}/pytalloc.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/pkgconfig/pytalloc.pc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
=C2=A0RDEPENDS:pytalloc =3D &quot;python3&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121445): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121445" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121445</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116207686/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116207686/1997914</a><br>
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

--000000000000e0a9e006433874d3--

