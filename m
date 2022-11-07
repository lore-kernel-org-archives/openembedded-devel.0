Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C90C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 03:08:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6134.1667790524706407763
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 06 Nov 2022 19:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hXuj4CA8;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l11so15513981edb.4
        for <Openembedded-devel@lists.openembedded.org>; Sun, 06 Nov 2022 19:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6/wp9InaOT+8nc7hbUlAlSBnjIQ5J6O8z9vMqtzGtw=;
        b=hXuj4CA8XAs3oXYBBeghNhBrsf3vLzQgorD9pHOe1U0Z5zoGje6YeUugvx2e0aKR24
         ZMRXrVoXWLLVFRBYJT/b6zH06Kh3NXC732xajWp6iPJBuE1ap20E8bnBkI9wrYdgXbD5
         uIzBSnuk+r/zna6QKpBwvHoF8MME7uMunOutQ/CyENCFfMFBi3YQiU4Z+d8itAyeUrKN
         7nHaM1aRZQStppHpsgLlz7n9a37vddj6jXDU/ehUjGUYM/E05Hgl2noftDeVoqxDVZx5
         al4m3flADLj6SsHQ3c30hRc499CLZdgjf0u54Bc0GiF2GyTVd/uUd79Y13TqjzZl0A7O
         KDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6/wp9InaOT+8nc7hbUlAlSBnjIQ5J6O8z9vMqtzGtw=;
        b=ybrauiVTmo4oNY6eNUhiWo9oy6i8JKmNBlsro6WOgHmi5BmEWKfmkgJ2MAup6NL7PR
         aLFzX1xRGHEooN6K1w7f6rw02ggKWr4khv7YhQuaeYIMwYpuEjkxxTR+6+ZgFWxdwqrB
         968o63CRKJ0PZH1HQnPBuNbB0lbs9UuQnawNZcZUJLKnhNw0ysg3KrWGImIFE39ywsbG
         YjEV0feW6C4XIGZ2B8gD243lNhfrdNr7j5Ex2/+ZfzjIfi9KLpKW/Qyaw8zD1Olb4PC3
         fkitdKqwu8zORAUu9MUhXfeY11nECOPY2I6d/Cg3J0LEXL33fszjLZ0l2gg2cjNVqxp6
         0Axw==
X-Gm-Message-State: ACrzQf24C87UUqclkZthj3i9hhareEImaz4/xLryU6+hxV8yTlb2afex
	4yZmKCtWfXLsRy/AsrjV5+sOXlEUUM+ld1UC8iQ=
X-Google-Smtp-Source: AMsMyM5q1p8vHh+/vO77fRK/vJk7uRMO/R98e6xuytkiQMKBe6mGKjhey6+F5ByW8rCS/jyRIOi6+xPdcVrc+yaaZEo=
X-Received: by 2002:a50:d602:0:b0:463:a83b:6f89 with SMTP id
 x2-20020a50d602000000b00463a83b6f89mr33201271edi.366.1667790522915; Sun, 06
 Nov 2022 19:08:42 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-A+O46Gdv45aemc+rQknE01c7ktDO83+C5U_jVfnXqc4Q@mail.gmail.com>
 <20221107030401.250-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221107030401.250-1-cp0613@linux.alibaba.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 6 Nov 2022 19:08:31 -0800
Message-ID: <CANx9H-C2mOAsEXQRqOj3GgJoTA7eP50GzufyJepfSbS8tEC-NA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH V2] add meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
To: cp0613 <cp0613@linux.alibaba.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ada1c005ecd8bd5d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 03:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99438

--000000000000ada1c005ecd8bd5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 6, 2022 at 7:04 PM cp0613 <cp0613@linux.alibaba.com> wrote:

> From: cp0613 <cp0613@linux.alibaba.com>
>

It looks like you need to set =E2=80=98git config --global user.name =E2=80=
=9CChen Pei=E2=80=9D=E2=80=99

This makes both the =E2=80=9CFrom:=E2=80=9D and =E2=80=9CSigned-off-by:=E2=
=80=9D populate properly, at
least in my experience.


> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  .../python/python3-brotli_1.0.9.bb             | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-brotli_1.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> new file mode 100644
> index 000000000..5dfac5823
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Brotli compression format"
> +HOMEPAGE =3D "https://pypi.org/project/Brotli/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D941ee9cd1609382f946352712a319=
b4b"
> +
> +PYPI_PACKAGE =3D "Brotli"
> +PYPI_PACKAGE_EXT =3D "zip"
> +
> +SRC_URI[sha256sum] =3D
> "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} =3D "\
> +  ${PYTHON_PN}-cffi \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99437):
> https://lists.openembedded.org/g/openembedded-devel/message/99437
> Mute This Topic: https://lists.openembedded.org/mt/94858817/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ada1c005ecd8bd5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 6, 2022 at 7:04 PM cp0613 &lt;<a href=3D"mailto=
:cp0613@linux.alibaba.com">cp0613@linux.alibaba.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">From: cp0613 &lt;<a href=3D"mailto:cp0613@l=
inux.alibaba.com" target=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It looks like yo=
u need to set =E2=80=98git config --global <a href=3D"http://user.name">use=
r.name</a> =E2=80=9CChen Pei=E2=80=9D=E2=80=99</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">This makes both the =E2=80=9CFrom:=E2=80=9D and =E2=
=80=9CSigned-off-by:=E2=80=9D populate properly, at least in my experience.=
</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Chen Pei &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" tar=
get=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-brotli_1.0.9.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-brotli_1.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-b=
rotli_1.0.9.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brot=
li_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</=
a><br>
new file mode 100644<br>
index 000000000..5dfac5823<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a><=
br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Brotli compression format&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Brotli/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/project/Brotli/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D941ee9cd1609382f946352712a=
319b4b&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;Brotli&quot;<br>
+PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;4d1b810aa0ed773f81dceda2cc7b403d01057458730e3=
09856356d4ef4188438&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 ${PYTHON_PN}-cffi \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99437): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99437" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99437</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94858817/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94858817/924729</a><br>
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

--000000000000ada1c005ecd8bd5d--

