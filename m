Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0BEC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 23:41:34 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.10104.1706053290980068271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 15:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mZEJIUw0;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso3959127276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 15:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706053287; x=1706658087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r6+Q2oenW43cO443o1FspWdqS8PJRjZTgSPzhxtoNZA=;
        b=mZEJIUw0EesfuFrbMebtycq040dFBM2jPjX+tzwhOYNP2VUmVAQk0bNuxtWSl9iX87
         3JMr3LU0EPPP6w/nPR3KaBzlGPTXYgvNBYI8ocPrLpioq64ecxKeDRWs25bsGyhFXx1e
         BwOr/hfqVIh/dJo+yOhK5YYwKoqt5SFZs2xgMgfksWr3zTvy90kW3o8lBIpAU1IT/tta
         zmnYASahsHe9hKTukpDd/CN2uBtKB0ovYVWj8CSqnTvM3ONhIjkVCTAvF6vU2PHQBm++
         YVbR9bAeXt40GhL5vDVQ0d1ntoe5gL0PVwGIARKYImZqtiME31uM9ntYcepEykfkq/eC
         DdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706053287; x=1706658087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6+Q2oenW43cO443o1FspWdqS8PJRjZTgSPzhxtoNZA=;
        b=tJXBCfye2q/FSJFETA//LpR7EHE0ZjOSKdp/v+aCAUa3x+mA/Au0SUEISxlYJs1XpQ
         VNtTCLACK6hFmEQeGB1DajocE7MWRgok2aEAL3Dp3iGScCvuYgApFyGOxIUGzNZjQLD3
         26CN4IPFlnCoyKloAF0h/HgCn0aJddmfjMPr51NKtfAS/6sNAz6BZBmu19Ka+q1fYZwg
         LORUyUiP00Kifd9CaddxzAXQ+j60yOHZa/iINt/S09wXGu5tV4np1JlksRRQj9DGnqdc
         XJ2YwDonibaaspvkqZOhzgd0xgxLKWNSvPKbIT23YxNTAhYXdjgBC0zFKhpVlleU9GDF
         ADwQ==
X-Gm-Message-State: AOJu0Yw89DAplJUjeQyOT4ZtOEQHrh7of4oKI/pU3fGso7+FxKaj4d+n
	3YzE8WrXLBTGDxWFUt6DaBBblTQulGxQnAYEHNVKbWPxIJSoc6BYZASuMVIaYGM1YYSObWi7+2j
	YoHPwJel0PW3DaKguT0FbN/zp5PrFSKHYXgw=
X-Google-Smtp-Source: AGHT+IFx28AkNipMKqoEihqYRQ24+kkeLM51t4rx7x3OtKsLzkDnL3h5J64LjtqNQu/rv7y/uiWWsPPdNzvQl1GD/W0=
X-Received: by 2002:a25:ae9d:0:b0:dc2:2a7a:721f with SMTP id
 b29-20020a25ae9d000000b00dc22a7a721fmr4177041ybj.76.1706053286817; Tue, 23
 Jan 2024 15:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20240123233625.38469-1-dev@g0hl1n.net>
In-Reply-To: <20240123233625.38469-1-dev@g0hl1n.net>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 23 Jan 2024 15:41:15 -0800
Message-ID: <CANx9H-BsbHJZ=Qf0Py2u8xK+a6feL92FU=jiyh2UusZYAw_f2g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-janus: add recipe for v1.0.0
To: dev@g0hl1n.net
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020f228060fa57cf3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 23:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108442

--00000000000020f228060fa57cf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 3:36=E2=80=AFPM Richard Leitner via lists.openembed=
ded.org
<dev=3Dg0hl1n.net@lists.openembedded.org> wrote:

> janus is a python library providing a mixed sync-async queue to
> interoperate between asyncio tasks and classic threads. This recipe uses
> pypi as source:
>
>         https://pypi.org/project/janus/
>
> Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> ---
>  .../python/python3-janus_1.0.0.bb                 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-janus_1.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
> b/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
> new file mode 100644
> index 000000000..be1f284d8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Mixed sync-async queue to interoperate between asyncio task=
s
> and classic threads"
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D23878c357ebb4c8ce1109be365043=
349"
> +
> +SRC_URI[sha256sum] =3D
> "df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612"
> +
> +inherit pypi setuptools3
>
inherit python_setuptools_build_meta
https://github.com/aio-libs/janus/blob/master/pyproject.toml#L3

> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-asyncio \
> +    python3-threading \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108441):
> https://lists.openembedded.org/g/openembedded-devel/message/108441
> Mute This Topic: https://lists.openembedded.org/mt/103921995/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000020f228060fa57cf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 23, 2024 at 3:36=E2=80=AF=
PM Richard Leitner via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;dev=3D<a href=3D"mailto:g0hl1n.net@lists.openembedded.=
org">g0hl1n.net@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">janus is a python library providing a=
 mixed sync-async queue to<br>
interoperate between asyncio tasks and classic threads. This recipe uses<br=
>
pypi as source:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://pypi.org/project/janus/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/janus/</a><br>
<br>
Signed-off-by: Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net" target=
=3D"_blank">dev@g0hl1n.net</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-janus_1.0.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-janus_1.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-janus_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ja=
nus_1.0.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
janus_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-janus_1.0.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-janus_=
1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-janus_1.0.0.bb</a><b=
r>
new file mode 100644<br>
index 000000000..be1f284d8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-janus_1=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-janus_1.0.0.bb</a><br=
>
@@ -0,0 +1,15 @@<br>
+SUMMARY =3D &quot;Mixed sync-async queue to interoperate between asyncio t=
asks and classic threads&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D23878c357ebb4c8ce1109be365=
043349&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643=
d3ad0e10de058cb1612&quot;<br>
+<br>
+inherit pypi setuptools3<br></blockquote><div>inherit python_setuptools_bu=
ild_meta</div><div><a href=3D"https://github.com/aio-libs/janus/blob/master=
/pyproject.toml#L3">https://github.com/aio-libs/janus/blob/master/pyproject=
.toml#L3</a>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-asyncio \<br>
+=C2=A0 =C2=A0 python3-threading \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108441): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108441" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108441</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103921995/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103921995/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000020f228060fa57cf3--

