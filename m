Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A499C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 15:51:28 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.15904.1678981885315331961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 08:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AdEOwADK;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id u32so2441590ybi.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678981884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmtQ/fbTwSRQnSkzTxkle2kett0kaTvWW+kINrLHbP4=;
        b=AdEOwADKQMmerTVSHZlaPkDV2kSo85W21DFQ+isb2JgMfuyhq0HewN+lIv/5rwIr+p
         kwU/aO/Xc5EU1rzrPRb1qF7Jc1txEV1nRyViEFLRZw3YQhjDPm2qZU8UAkdd4bIPa4gb
         ka4JWz0bLXeegggdh0dkUHGvejpoq4cyScx6EWe+mBClW+URBQ9vEEpTaeHVrqHjCYyZ
         u/eL7gx1itK0FH3DidlkJ3WC810kaEQoxE7t6DX3Q18BsDipJ8rq+P63IQNyib/CxgZt
         5zzphwnBQdAE1bYiAP/rLeXD+CUbQLHZqzLjJFNUjeOo0uggG2RiDdrogkDXKTc4FKzu
         2c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678981884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmtQ/fbTwSRQnSkzTxkle2kett0kaTvWW+kINrLHbP4=;
        b=rGJCC4kcK+SQ5UIxpIAarpILcCA+sJdD8EZjPBd5gpzzslruEcPEndU3Gg35oGJ/fN
         B4B/oxl790Aq1Bn2xiHeX2x0/SqbzAVqlpaDALOs3VWgWzBxogz4h5sU90p/c002e91Y
         AzTpwRnnqrwJVLhVJHLbFPS0f14N/4yev5NYRyd9hnuGE5XYBSi5HoOOPX5hCnqygsSt
         Qp7V6SpzRFQdbDIlqgTJt4FBJzALirqgNLC59+31FBVjYqIiO72zDP6jt0bmKiOIvoN8
         9w6DbclPPOB/Up4PXDpxLiMDtXjw/zXH+XqhvZ5d0vJj0xRpV4oHtO4nG1we07GDy/nZ
         hPJQ==
X-Gm-Message-State: AO0yUKVTAmxaGUFHwBwMdq1zP10vE1Ld+pASZuNV7xBRBD+tSojLYz1N
	XC+5Gwns1ZReZ/1jYp5dKcMlGaxh6f2EWDnIGs8=
X-Google-Smtp-Source: AK7set8JvHHyFj4DXLQ72p3t/20MeYcZW+2r+qdu+WfBBGH4ahyjJ81+PbWJ5L5MdouGWGaNcsol4Uv6O0P09fRfom0=
X-Received: by 2002:a05:6902:282:b0:a02:a3a6:7a67 with SMTP id
 v2-20020a056902028200b00a02a3a67a67mr28668695ybh.11.1678981884282; Thu, 16
 Mar 2023 08:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230315080429.2722555-1-zboszor@gmail.com>
In-Reply-To: <20230315080429.2722555-1-zboszor@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 16 Mar 2023 08:51:13 -0700
Message-ID: <CANx9H-B4=5sY3_0Y2LFZPt1eexFPn7fRq4SfyqJ76+yx=LXEVw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python_setuptools_build_meta_mesonpy.bbclass:
 New class
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc0b7805f7066e99"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 15:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101580

--000000000000cc0b7805f7066e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 1:04=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail.c=
om>
wrote:

> Some python modules (e.g. SciPy, scikit-image) use meson-python
> (a.k.a. mesonpy) in pyproject.toml:
>
>     [build-system]
>     build-backend =3D 'mesonpy'
>
> This class, together with python3-meson-python and its dependencies
> will allow building such modules.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...python_setuptools_build_meta_mesonpy.bbclass | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644
> meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
>

The name of the class is overly long. If you look at the other classes in
oe-core, they basically use the build-backend value,
prefixed with the "python_" namespace, so I would propose just
"python_mesonpy.bbclass"

The python_setuptools_build_meta.bbclass was named as such because the
build-backend is "setuptools.build_meta"
such as in https://github.com/jaraco/zipp/blob/main/pyproject.toml#L3


> diff --git
> a/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
> b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
> new file mode 100644
> index 000000000..1d3fdbd7c
> --- /dev/null
> +++ b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
> @@ -0,0 +1,17 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit setuptools3-base pkgconfig meson-common python3targetconfig
> python_pep517
> +
> +DEPENDS +=3D "python3-setuptools-native python3-wheel-native ${@'' if
> d.getVar('PN') =3D=3D 'python3-meson-python-native' else
> 'python3-meson-python-native'}"
> +
> +PEP517_BUILD_OPTS =3D '--config-setting=3Dsetup-args=3D"${MESONOPTS}
> ${MESON_SOURCEPATH} ${B} ${MESON_CROSS_FILE} ${EXTRA_OEMESON}"'
> +
> +export MESONPY_BUILD =3D "${B}"
> +
> +# Python pyx -> c -> so build leaves absolute build paths in the code
> +INSANE_SKIP:${PN} +=3D "buildpaths"
> +INSANE_SKIP:${PN}-src +=3D "buildpaths"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101529):
> https://lists.openembedded.org/g/openembedded-devel/message/101529
> Mute This Topic: https://lists.openembedded.org/mt/97622993/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc0b7805f7066e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 15, 2023 at 1:04=E2=80=AF=
AM Zoltan Boszormenyi &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Some python modules (e.g. SciPy, scikit-image) use meson-python<br>
(a.k.a. mesonpy) in pyproject.toml:<br>
<br>
=C2=A0 =C2=A0 [build-system]<br>
=C2=A0 =C2=A0 build-backend =3D &#39;mesonpy&#39;<br>
<br>
This class, together with python3-meson-python and its dependencies<br>
will allow building such modules.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0...python_setuptools_build_meta_mesonpy.bbclass | 17 ++++++++++++++++=
+<br>
=C2=A01 file changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta-python/classes/python_setuptools_build_meta_m=
esonpy.bbclass<br></blockquote><div><br></div><div>The name of the class is=
 overly long. If you look at the other classes in oe-core, they basically u=
se the build-backend value,</div><div>prefixed with the &quot;python_&quot;=
 namespace, so I would propose just &quot;python_mesonpy.bbclass&quot;</div=
><div><br></div><div>The python_setuptools_build_meta.bbclass was named as =
such because the build-backend is &quot;setuptools.build_meta&quot;=C2=A0</=
div><div>such as in=C2=A0<a href=3D"https://github.com/jaraco/zipp/blob/mai=
n/pyproject.toml#L3">https://github.com/jaraco/zipp/blob/main/pyproject.tom=
l#L3</a></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
diff --git a/meta-python/classes/python_setuptools_build_meta_mesonpy.bbcla=
ss b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass<br>
new file mode 100644<br>
index 000000000..1d3fdbd7c<br>
--- /dev/null<br>
+++ b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass<br>
@@ -0,0 +1,17 @@<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+inherit setuptools3-base pkgconfig meson-common python3targetconfig python=
_pep517<br>
+<br>
+DEPENDS +=3D &quot;python3-setuptools-native python3-wheel-native ${@&#39;=
&#39; if d.getVar(&#39;PN&#39;) =3D=3D &#39;python3-meson-python-native&#39=
; else &#39;python3-meson-python-native&#39;}&quot;<br>
+<br>
+PEP517_BUILD_OPTS =3D &#39;--config-setting=3Dsetup-args=3D&quot;${MESONOP=
TS} ${MESON_SOURCEPATH} ${B} ${MESON_CROSS_FILE} ${EXTRA_OEMESON}&quot;&#39=
;<br>
+<br>
+export MESONPY_BUILD =3D &quot;${B}&quot;<br>
+<br>
+# Python pyx -&gt; c -&gt; so build leaves absolute build paths in the cod=
e<br>
+INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br>
+INSANE_SKIP:${PN}-src +=3D &quot;buildpaths&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101529): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101529" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101529</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97622993/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97622993/924729</a><br>
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

--000000000000cc0b7805f7066e99--

