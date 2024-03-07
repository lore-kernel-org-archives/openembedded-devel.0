Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5852AC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 04:24:17 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.15845.1709785448912521081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 20:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JG1QbqNp;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609acac53d0so4482277b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 20:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709785448; x=1710390248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/LJPoC+S6cJ8GRr9nSk9paE1wARwCL+CnYedABXVhpU=;
        b=JG1QbqNpf9Llgi53Fyq3JZt0cW9vB1eaO/XGbfLNG6EDDVpoHZWPbUsAkcbyc9zKem
         9Cfh+70tSIDomEtjGcK23eW7dn3vyrtzQ6U4nz3Yd/UYQyXZoZXGmkV+UKZ6Ov0KHy2s
         8LeqKtnbZKnh4BOVcRZxcecwW7eDSRiwl496Qi9Lg8HmcI6zkfc7eUtUDNM9C8J5sVXv
         7ir2MBHiLo8srmoNYUnUbdxo7dpAQH5Le8CFnC0qK0Ri7+BWUAH6skuD/uzyNPKo8g5t
         iOsVubafmMaOMNYThaEYa3pKopLW3Umu0tm/QbgiLWNU2e1qh2KF5WqIsJH0XJMynXbH
         Uitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709785448; x=1710390248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LJPoC+S6cJ8GRr9nSk9paE1wARwCL+CnYedABXVhpU=;
        b=N/T1efHmshhXyYx/f+El7mHda2l5g7obHsLaeNt0/zEu+jJ/eoZxL+28HtWSqFvKfE
         ac9gm0MLyiSWobZJVLp7Fr2higGMVv0AWaiskl7P86X6sl1EBib52CgrvPgkRoHRe40U
         nvp6xdREAt489AV/3iOn4myhYId5mYHLXus/AYASm4imZBYt0gdrIT6l8K2vNHpxKL5p
         WRkboDCMk3rV1EUkxx8Ar5ifuvCdrOt9tYe0484akjOAbdXWMeWIgL4FkbcFI42P0jHc
         eGQuMzQiL2nkJzQ3tfLUjBkjBkPkgU7FPy06S3gycolUXnKWjz17tC3X4BKgMWEua+6i
         WtBA==
X-Gm-Message-State: AOJu0YxGxKYHNnjXefNmv5cZMgQGAoWpew6kbmbDZXgvfOIR1CPwuoGZ
	AQkEAsWoKCFKq683jgvVDpqiWf5xwBMZcaVfVenYT/R+LlWRgD5UG9qW10WPFeYuPeAM00q9DDv
	cO+0xtLTDNQ5ZvT1/9kd+7+mPdK8=
X-Google-Smtp-Source: AGHT+IHr8Sm2yynDYN+837kNCQW0XK8MLEZgAD07sEorqsdvvrYSBmvScJ5VvZUpzFwq+KQsFFFTwg49B9HOMzpZFhc=
X-Received: by 2002:a0d:cb12:0:b0:609:f5b6:f105 with SMTP id
 n18-20020a0dcb12000000b00609f5b6f105mr127982ywd.2.1709785447952; Wed, 06 Mar
 2024 20:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20240306165441.429620-1-alperyasinak1@gmail.com>
In-Reply-To: <20240306165441.429620-1-alperyasinak1@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 6 Mar 2024 20:23:57 -0800
Message-ID: <CANx9H-ABQQiTUTQKsN2DEjmw0d4Pu3eiHEeSesdfHtLwzcOkCw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-invoke: add recipe
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000447af506130a725b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 04:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109189

--000000000000447af506130a725b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 8:55=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> w=
rote:

> Invoke is a Python library for managing shell-oriented subprocesses and
> organizing executable Python code into CLI-invokable tasks. It draws
> inspiration from various sources (make/rake, Fabric 1.x, etc) to arrive a=
t
> a powerful & clean feature set.


We should really gently judge upstream to update their pyproject.toml to
use a proper build-backend. There is nothing special in their setup.py

>
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-invoke_2.2.0.bb             | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-invoke_2.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
> b/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
> new file mode 100644
> index 000000000..3f2e6232d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Pythonic task execution"
> +HOMEPAGE =3D "https://www.pyinvoke.org/"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da8815068973f31b78c328dc067e29=
7ab"
> +
> +SRC_URI[sha256sum] =3D
> "ee6cbb101af1a859c7fe84f2a264c059020b0cb7fe3535f9424300ab568f6bd5"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} +=3D " \
> +        python3-fcntl \
> +        python3-json \
> +        python3-logging \
> +        python3-pprint \
> +        python3-terminal \
> +        python3-unittest \
> +        python3-unixadmin \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109172):
> https://lists.openembedded.org/g/openembedded-devel/message/109172
> Mute This Topic: https://lists.openembedded.org/mt/104769770/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000447af506130a725b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 6, 2024 at 8:55=E2=80=AFAM Alper Ak &lt;<a href=
=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">Invoke is a Python library for managing shell-ori=
ented subprocesses and organizing executable Python code into CLI-invokable=
 tasks. It draws inspiration from various sources (make/rake, Fabric 1.x, e=
tc) to arrive at a powerful &amp; clean feature set.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">We should really gently judge upstrea=
m to update their pyproject.toml to use a proper build-backend. There is no=
thing special in their setup.py</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-invoke_2.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-invoke_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-invoke_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-i=
nvoke_2.2.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
invoke_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-invoke_2.2.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-invo=
ke_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-invoke_2.2.0.bb</=
a><br>
new file mode 100644<br>
index 000000000..3f2e6232d<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-invoke_=
2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-invoke_2.2.0.bb</a><=
br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Pythonic task execution&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.pyinvoke.org/" rel=3D"noreferrer=
" target=3D"_blank">https://www.pyinvoke.org/</a>&quot;<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da8815068973f31b78c328dc067=
e297ab&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;ee6cbb101af1a859c7fe84f2a264c059020b0cb7fe353=
5f9424300ab568f6bd5&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-fcntl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-logging \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pprint \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-terminal \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-unittest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-unixadmin \<br>
+&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109172): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109172" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109172</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104769770/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104769770/924729</a><br>
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

--000000000000447af506130a725b--

