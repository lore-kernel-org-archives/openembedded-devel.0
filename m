Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93401CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 22:52:12 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1768.1762383130441244531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 14:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8qPBAqn;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63fd17f0cbfso358716d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 14:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383129; x=1762987929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZFBmr5MzAp7lXIwiBz253DC9PpaARrf4XzgS73INHs=;
        b=b8qPBAqnTKJbpKFYytaGAs3d+/gi7beCQJGgIbQlPYuec2NZhmV50Gt1TdVQZw+Q5Y
         lfRaz5cFS5lBWzQ2MPC5ZWNvQT5qccItyPzZVglJynw6bHmYaFdXTmBTQUwUsacGfLEx
         uicEBbpihtA8ZCVWDchvN8ymuT3hTml34s1kTtAicXLJGrOfGbgxGV94ocu5tQdsjc7x
         IXuOX4JiW2ZtpnUa+06mtazNA4zo2CDxzXRYo2YyKOh6hVHYOJvPq4cHMz8zpKh8JuLN
         3MToo+DHZMVWvEh5MFgNThWpRW42ws/mQubioaH9JpuvjmUapX+gkMxxoJiivU1y2vvG
         z+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383129; x=1762987929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZFBmr5MzAp7lXIwiBz253DC9PpaARrf4XzgS73INHs=;
        b=ITgSSzTeT11TbGKM80+Grsz9IOnds9STIOVJTnIttfAIHmGmJxXYJy0Hz8Yp0541Pi
         Ehvo1BVzEdyaFFv1O0x+JfHLLBHzy/kwZJTG/IpQhelB8giJ0vY5ijfyKj2PfG+4eKkv
         rLCGcXlsmgqlmVVXMWjyNlmGaZqpm86E/Gj5dVS7NaY4coihNj+xSb7TKxOod2U1kHOm
         DMDZWu3ecL8gcRN0WXh0uoWr14N9GJK9p4kd46pnY+Trmk+Q3mKGUaIn8nwQJyzf1QbW
         ZP8aiWBzcpeqT+QOjV+OPsxg3iFWX621BZCmvagEeR4jx65lKkYTGwQD5xCUsKHGGKA5
         6WdQ==
X-Gm-Message-State: AOJu0Yw1m5yXBUPsURk2dnn3Eg/9syZph2A5xaq+dueTY+yIgPqWLshu
	xFUwj09rUuKxn6A1YugJCfkl52s5u8O4Z8b7JqLLC+ZMNMxr3Sdg0nQQCkMSWSDPBxJy17KonHN
	nCj/DsBJDd3QAap53wM2DknSSs5Mv44U=
X-Gm-Gg: ASbGncsK2WaQaK8lxc2+cXXVdEyUP4LU8QaEEdbg8m/XB4lQ7vN7pHXuMhlKIBRuuam
	gsK8fl124QQT4BNypj9jakF1uAnE7Xus5q23kSIDElvo+odUNXYCEFzI2AB/kQVOmRI7vzNHg63
	jUEKA+dL6rU+27ZhnB9YDHQixoIu08SvpBWjEarEvXqWBFR6H9KBEY90GhEaZT7IFuHrPB4405x
	PCU/1OdzWgO8SMENf0/2F1/2Ugg77SMruNrMLc+taqQLXYfJDZXu9BAs+RrDbLxXf0UEUusC+MA
	V++k3gFQ5MRjfBBf3W+8wJOMUpXnDbU15sJRZ4HP10HzytVzchXwn1E=
X-Google-Smtp-Source: AGHT+IEp9qxK4CzRdlhnwwkSe+WHFP+79WrTVdiacmqcVjWAUmEUuIbmQt/kaGFHOplhJ1bnIcBobUdaUeJVQEn12lY=
X-Received: by 2002:a05:690e:d0c:b0:63b:8e09:7a47 with SMTP id
 956f58d0204a3-63fd34c5155mr4294051d50.19.1762383129464; Wed, 05 Nov 2025
 14:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com> <20251105212631.386242-12-t.f.g.geelen@gmail.com>
In-Reply-To: <20251105212631.386242-12-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Nov 2025 14:51:43 -0800
X-Gm-Features: AWmQ_bmktcboWiLQajWKb0ZTqjsl0UJuKElY1ZNFtoyTv_OoZdr-SNPXHeg1CMo
Message-ID: <CAMKF1soGw9NadNvtz_o=GQHTq6ufabiKK77vNu381FLBMzQPHg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 8/8] new recipe: python3-pytest-retry
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000063d6550642e0cccf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 22:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121339

--00000000000063d6550642e0cccf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 1:28=E2=80=AFPM Tom Geelen via lists.openembedded.or=
g
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> pytest-retry is a plugin for Pytest which adds the ability to retry flaky
> tests, thereby improving the consistency of the test suite results.
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../python/python3-pytest-retry_1.7.0.bb            | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb
> new file mode 100644
> index 0000000000..f70adca68f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Adds the ability to retry flaky tests in CI environments"
> +HOMEPAGE =3D "https://github.com/str0zzapreti/pytest-retry"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25bd3d1db774af27b10acd6f80bf=
939"
> +RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI[sha256sum] =3D
> "f8d52339f01e949df47c11ba9ee8d5b362f5824dff580d3870ec9ae0057df80f"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
>

same here as well.


> +
> +PYPI_PACKAGE =3D "pytest_retry"
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> +RDEPENDS:${PN} =3D "python3-pytest"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121337):
> https://lists.openembedded.org/g/openembedded-devel/message/121337
> Mute This Topic: https://lists.openembedded.org/mt/116142684/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000063d6550642e0cccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, =
2025 at 1:28=E2=80=AFPM Tom Geelen via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">pytest-retry i=
s a plugin for Pytest which adds the ability to retry flaky tests, thereby =
improving the consistency of the test suite results.<br>
<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-retry_1.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pytest-retry_1.7.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-pytest-retry_1.7.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
retry_1.7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-retry_1.7.0.bb</a><br>
new file mode 100644<br>
index 0000000000..f70adca68f<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-retry_1=
.7.0.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Adds the ability to retry flaky tests in CI environments=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/str0zzapreti/pytest-retry=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/str0zzapreti/pyte=
st-retry</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc25bd3d1db774af27b10acd6f8=
0bf939&quot;<br>
+RECIPE_MAINTAINER =3D &quot;Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@=
gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;f8d52339f01e949df47c11ba9ee8d5b362f5824dff580=
d3870ec9ae0057df80f&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest<br></blockqu=
ote><div><br></div><div>same here as well.=C2=A0</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+PYPI_PACKAGE =3D &quot;pytest_retry&quot;<br>
+UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
+RDEPENDS:${PN} =3D &quot;python3-pytest&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121337): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121337" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121337</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116142684/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116142684/1997914</a><br>
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

--00000000000063d6550642e0cccf--

