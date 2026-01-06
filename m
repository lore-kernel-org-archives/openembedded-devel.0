Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E16CE9D6C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:51:11 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92871.1767714667223179666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHN9tyE1;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so1101361d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767714666; x=1768319466; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PKirDh6zkSZSLyXDi/HETBpJOghoSjWOaYqBVEPVGns=;
        b=LHN9tyE1B4OfHE5gQv6mWldODw4GfM/Q0jP6uX7rQ2ZUN3y8Uly+DcjxHkTkQeX1GC
         g89oMmQVIk6XChRyZBjKSRoXMaIwp4HpeQFuhafRxf2E8N1VDaoKQVPBaLtP0C12Fo19
         0EylBMhiUleLzxMnbqhk0LXV3BZutegt93AKnEU3W9fzmm+V1TGNWlb4L/Fv5J6spjmx
         RvJh5SofuR06xntKmjplgQkTtkZ+BIzZD+S39n6Z5DEv80gF7JE764uSYSR0kDfXyfZ/
         A1RiGoPVafhde942UaQN/Tx0JzP8q4rITI/pbf5Ilm83Q+VXbmMan4SATNSdQjDkAuUE
         uLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714666; x=1768319466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKirDh6zkSZSLyXDi/HETBpJOghoSjWOaYqBVEPVGns=;
        b=fHIxx4BQ0Jrovc0sM9lcUWQ/LlmfE1DFmYzx6+FsU2pT5aCiISRT7TD+v1gocvZMfr
         86CyEGaVlo1imrBM1wCdZYM1Rz4b0KgQocnhWyQROAKtirGniLREtKjVrBKXGvYs8RHO
         DWZZmeoYtcoszgMtoG1NbWzUZlLt+eVpRSqY2907h3RjdgZFhrZjtszzYoRMxAu48XF1
         MvVjkMS+e1O8N+C2v38YPxK7Ts6JJzOT1gCfWk1VoGLV4ZaBUFnmJT1P0/PdT+7xOwn0
         bRWnaVDxB+tP6+hYYHKBpRsI4b5ghSNTUA+U45QjGF/nXbC1+QMc+Ei4BZU/7u9eyiwM
         xHSQ==
X-Gm-Message-State: AOJu0Yw1mtz9XorGesAzrW21PFqWhZZguPBNCSirZI7QIi0kHSojNKI8
	kUkMQVPFpVLOzyraJA5j09WQsGpuTRhpOLpBuQuExGi8wx2G5vpYNEpjkcBEGPy4bDKP/3D4f/e
	W5vGK08gRJ/1/Fcdxb6oN6nsl9tM7ETyyZA==
X-Gm-Gg: AY/fxX7oR0uNs7nsFpTW/fE7b/Eh0C3x05T6PZwdY2icqUmP1vg3ALQrmsctCGaBXPR
	ljw0YbPl7sW4VVpXerrH8fOxGl/UUXWe5Lt4uJ2qYLniWNJjosWNKABynKApcq/F6kSJODmefJz
	WbkpAepZ3WXOShPB0NhYbTEnxxN6XQkLhOcqNz4lbe0UxvkiMSpaukLMo0HZAzVHfDdKf5qdKgc
	DPDWvGEBk8wi55JzCTgK6Jn8EkDxG0A57WynVavT17yT6Czs3IT8R7mk/qkKVQZaZNt6Oh0/Q2s
	FmqMpjFoSzWI1Mg5E/kIFiBSI4mfaLhtccakTGy7Ja4XOZC5+ocrKL0h6CMhkvtQWH6F5d2TRK8
	FpDCdnC3wpbYXeelh4jnw/eLuN24=
X-Google-Smtp-Source: AGHT+IFzHGoMQdhblluQwLgfxpAYGK9TFfCixCjc04jY+cbbubE08tSg5vJ/RABLdROY2aC3mYh9L5FrJP1d+SeA2SY=
X-Received: by 2002:a05:690e:140b:b0:63f:a87b:2066 with SMTP id
 956f58d0204a3-6470c83c370mr2508859d50.16.1767714666206; Tue, 06 Jan 2026
 07:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com> <20260106104151.2027936-2-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260106104151.2027936-2-viswanath.kraleti@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jan 2026 07:50:39 -0800
X-Gm-Features: AQt7F2qvRF6wvqhQNFp8mNxqXWdbgJ-VPjUGpbIvuFS14rDjisVZF0PXyH0S_Ms
Message-ID: <CAMKF1soUWA1-xvP2F97=no85hNpmKp4diDg4uCQ3phhk78eeDQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/2] modemmanager: upgrade 1.22.0 -> 1.24.2
To: viswanath.kraleti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000be5c750647ba2494"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 15:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123181

--000000000000be5c750647ba2494
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 2:42=E2=80=AFAM Viswanath Kraleti via lists.openembe=
dded.org
<viswanath.kraleti=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Changelog:
>
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-=
24/NEWS
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  .../{modemmanager_1.22.0.bb =3D> modemmanager_1.24.2.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.22.0.bb
> =3D> modemmanager_1.24.2.bb} (95%)
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.24.2.bb
> similarity index 95%
> rename from meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.22.0.bb
> rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.b=
b
> index 82cc1167e2..95adfa9a0a 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
> @@ -11,8 +11,8 @@ inherit gnomebase gettext systemd gobject-introspection
> bash-completion
>
>  DEPENDS =3D "glib-2.0 libgudev libxslt-native dbus"
>
> -SRCREV =3D "03f786ce66360d67c669f4f122f8aa458e6f01ea"
> -SRC_URI =3D "git://
> gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=3Dhttps=
;branch=3Dmm-1-22
> "
> +SRCREV =3D "f2b9ab1ad78d322f32134a444b5b54c6e8160e19"
> +SRC_URI =3D "git://
> gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=3Dhttps=
;branch=3Dmm-1-24
> "
>

See if you can also add tag=3D${PV} to the SRC_URI as well. It seems the ta=
gs
do exist for releases.


>
>
>  # strict, permissive
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123177):
> https://lists.openembedded.org/g/openembedded-devel/message/123177
> Mute This Topic: https://lists.openembedded.org/mt/117103076/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000be5c750647ba2494
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, =
2026 at 2:42=E2=80=AFAM Viswanath Kraleti via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;viswanath.kraleti=3D<a href=3D"=
mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Changelog:<br>
<a href=3D"https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/b=
lob/mm-1-24/NEWS" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS</a><br>
<br>
Signed-off-by: Viswanath Kraleti &lt;<a href=3D"mailto:viswanath.kraleti@os=
s.qualcomm.com" target=3D"_blank">viswanath.kraleti@oss.qualcomm.com</a>&gt=
;<br>
---<br>
=C2=A0.../{<a href=3D"http://modemmanager_1.22.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">modemmanager_1.22.0.bb</a> =3D&gt; <a href=3D"http://modemma=
nager_1.24.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.24.2.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-connectivity/modemmanager/{<a href=3D"http://m=
odemmanager_1.22.0.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.=
22.0.bb</a> =3D&gt; <a href=3D"http://modemmanager_1.24.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">modemmanager_1.24.2.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://mo=
demmanager_1.22.0.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.2=
2.0.bb</a> b/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://mo=
demmanager_1.24.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.2=
4.2.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://mod=
emmanager_1.22.0.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.22=
.0.bb</a><br>
rename to meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://modem=
manager_1.24.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.24.2=
.bb</a><br>
index 82cc1167e2..95adfa9a0a 100644<br>
--- a/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://modemmana=
ger_1.22.0.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.22.0.bb<=
/a><br>
+++ b/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://modemmana=
ger_1.24.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.24.2.bb<=
/a><br>
@@ -11,8 +11,8 @@ inherit gnomebase gettext systemd gobject-introspection b=
ash-completion<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 libgudev libxslt-native dbus&quot;<br>
<br>
-SRCREV =3D &quot;03f786ce66360d67c669f4f122f8aa458e6f01ea&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/mobile-br=
oadband/ModemManager.git;protocol=3Dhttps;branch=3Dmm-1-22" rel=3D"noreferr=
er" target=3D"_blank">gitlab.freedesktop.org/mobile-broadband/ModemManager.=
git;protocol=3Dhttps;branch=3Dmm-1-22</a>&quot;<br>
+SRCREV =3D &quot;f2b9ab1ad78d322f32134a444b5b54c6e8160e19&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/mobile-br=
oadband/ModemManager.git;protocol=3Dhttps;branch=3Dmm-1-24" rel=3D"noreferr=
er" target=3D"_blank">gitlab.freedesktop.org/mobile-broadband/ModemManager.=
git;protocol=3Dhttps;branch=3Dmm-1-24</a>&quot;<br></blockquote><div><br></=
div><div>See if you can also add tag=3D${PV} to the SRC_URI as well. It see=
ms the tags do exist for releases.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
=C2=A0# strict, permissive<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123177): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123177" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123177</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117103076/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117103076/1997914</a><br>
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

--000000000000be5c750647ba2494--

