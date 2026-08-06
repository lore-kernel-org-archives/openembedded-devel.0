Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AA9C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:23:40 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25172.1786037020082114517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p71jJbY1;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80c5cb9a888so29062647b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 10:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786037019; cv=none;
        d=google.com; s=arc-20260327;
        b=qcUV3DIYgqkmbsjdQxVPUz2ZuLFhoC6lHEQvIBd6vdTHuSUEYKqqXqNGgEef2QL3/C
         nxnRPJBr+GIup7Db4FD5AxQyKsAvY/72LSf6hOmSowpE98OBl6NYvQlhOIfSUhAjtLO7
         EOll6VNLHjoGZPrAjQMU8pG4HhepjfMlkWOBK87qIKlALcQpINat0Y9kV/c3pGUPXMk5
         lUlDKQf1F+ERRfLF7ayxUFvkx7u9T+EhOVLrr+SkU6ClzYkkQeD4eZJ41dynN23m/HN3
         Oa4a1FaT/g8tAhSKxgt9J/lpiOY+aWFIHlR+tAGE/WMCOCcTO0QloZ1uvzOOcBdBMyyn
         cDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z+cmZMwJdAeuBXXdwsF4WR8MeGc5L+7K7bN4Tt869DM=;
        fh=1JQgoyV2Fo95OQnnJCztnV535dLM1ApxTC7qxaKapHE=;
        b=qHt9gS7qpW9KLrlJJPh+QammI/By5AHxylbOgO657u/otZZS5FxLqEncJudIj+TH2c
         dZMHn45ydqc1KxCkMC78D+oGzPhddxsCKWZ/peNThB+H9bXJie2/fIH1gDnVV3r5Kbn3
         J1Qm1JIPfmcy5tyhOAUmGinD0izDH8xKXS9vt8pV93wXIHOhElHPU3fvcKtWoyfHDWfI
         WG7GSX+hHWCqmFgMVPYoKaRW/fjxQx1E6NDVnqdDhye4TDOsdLLtiPqdUtPQ0w+v4KM7
         ShxpeLscO+Pd8kmnk9Vf9GcGppLxPrOg5/wILPyS7M6lCJ6w8F6GGczK1384w6bKkHb1
         eRLA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786037019; x=1786641819; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+cmZMwJdAeuBXXdwsF4WR8MeGc5L+7K7bN4Tt869DM=;
        b=p71jJbY1JrLbXMm1qwTr/T3ULvDyYL44Aw9KhJ1YHFoO7K0jPGi4o6K7929MJP3rl2
         /+c5B5ZCGN1z2DMGxUP55SL5gdF/Adln++HgqeTrKUboUrvdN6Jo8XCXJr4TJAnkFqwD
         4AMT1tDoMAZGqvap0AkE0B37hDqUHGBlzMFBEy2JsJeBRYVzK9gFXYsQuzVGMZd7D6KQ
         rXMham8MUKgHcSQihRVrkPuepi0ZAa2LHQIE68E2EEDjFClr7YqZ0CjJZ3+Z8vM3WRVU
         eDbTBS97FKP+WH2rk8/nOVZNqGVo+0ko481PyZxOOsu8lESTQkliASiEO/j/eDCbEJE+
         Atag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786037019; x=1786641819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+cmZMwJdAeuBXXdwsF4WR8MeGc5L+7K7bN4Tt869DM=;
        b=iymUfRUiwGbYHiEgm4V+rkoP8Oo4NMFz+7mf0FITUy/+WMabapQM3XTIrXWTvuiq2n
         JfNxx0Bd/z2dpnDvzRJMqoizwxijyV0Xra/9hqeCTxrqoVPXG6Am9GU3g86MoOIWfCB9
         4EsROBrUKVkf7rKE1JS1llhsUNA3S2MW241mj+Wn07IHVqKnfAZjz3bsnfjl+1DQXJkz
         XgG4Nc2VDupn7E56iG96BcOesbahKAzdznBjW5PA7dx1BrVP88dYTT3proCJ6ZKUiv2J
         A8HNUClFEDiPxe3Lt+nHxuk91cTPSnSEgVZv8lZdoin9cOgR/pO5QtxSd6DgpCPJ7385
         EI/A==
X-Gm-Message-State: AOJu0YyI/0SOm8ll7bbIc45HPVBuHNOUMT1gKMXaYRSAOmDtXkTUMyeW
	mkI1a+d45ZoeB4AMjRWkwn2iJunIbFG1HXdx5rhERzGQXPRgqEM24ZgRJAXGR2rTkws0c3Gj1vH
	XCkw/nVInkhvDbfzfuvlkZn/tkDbjsMM=
X-Gm-Gg: AR+sD12DrRdspReKBPo+VfaOWz4lB17DLZClKWqpJxbvIGiqTh/YYbR0N1mp2zry8mm
	mxRKeJ0eWlVCl0QGal7syaHgr9DqYFz3dQpdLxoqw1WIGjUjeQAWEcIf3vX2vq6UZX9+3mCN5Mc
	3n0G3qdiCDxKVnMboEqEOUSbpQ8rJFo5Vv34SFwsEurGFOFG4I1H/EfN7L1bI0ya6YImMHFm+bM
	7S2mkn76A/oiDdnISU8nuGJxYihgHobMWaOE4eWBnhyr932s3yXIciXgn2cL8sRNQDacJfv6zTE
	TWkgNbcPdJNnKnHtGlW8l+9+3SGcoY8t1a7hXLe5+YIf+Ogyg2zOIIK0R1zYIovfgEdYv0h00BR
	BSoFAYonQgPbS3X1JPkVwtKhbRtYudbMAYveEnngdXN+lCjSFUd1AZm+OCesGEAbDnslgEMmhzn
	U+cISfAZBJ9qaZ/YCSXClkGcTeWt8sLcDbkUeMWkaVXKKbMEKf8+GLsq71PqAHXQ6KOL4+WLV5e
	8c=
X-Received: by 2002:a05:690c:c4e9:b0:820:b01:9d6 with SMTP id
 00721157ae682-820222bfdd7mr102169597b3.11.1786037018938; Thu, 06 Aug 2026
 10:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260806085958.3886559-1-leon.anavi@konsulko.com>
In-Reply-To: <20260806085958.3886559-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2026 10:23:25 -0700
X-Gm-Features: AUfX_myuWOfN_sySGcKGWe5EL7jng2oQXiIcPd7to0g_t3kfXWKqZdKlBW92Fvs
Message-ID: <CAMKF1srmwzD0ZMH9sTKd7jfbUYqUtaKXAfF88GjN6WMZjo_YpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] exempi: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000011d0fc0658642609"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 17:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128849

--00000000000011d0fc0658642609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026, 2:00=E2=80=AFAM Leon Anavi via lists.openembedded.org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Add recipe for exempi, an implementation of XMP based on Adobe XMP
> SDK and released under a BSD-style license like Adobe's.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-support/exempi/exempi_2.6.6.bb    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-support/exempi/exempi_2.6.6.bb
>
> diff --git a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
> b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
> new file mode 100644
> index 0000000000..711f54f552
> --- /dev/null
> +++ b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "An implementation of XMP"
> +DESCRIPTION =3D "An implementation of XMP based on Adobe XMP SDK\
> +and released under a BSD-style license like Adobe's."
> +HOMEPAGE =3D "https://libopenraw.freedesktop.org/exempi/"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df816aac8b22d16134477b8e156f0a=
0f4"
> +
> +SRC_URI =3D "
> https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"
> +
> +S =3D "${UNPACKDIR}/${BPN}-${PV}"
> +
>

Isnt this the default ?

+inherit autotools pkgconfig
> +
> +DEPENDS =3D "expat zlib"
> +
> +EXTRA_OECONF =3D "--disable-samples --disable-unittest"
> +
> +PACKAGES =3D+ "${PN}-bin"
> +FILES:${PN}-bin =3D "${bindir}/exempi"
> +FILES:${PN} =3D "${libdir}/lib*${SOLIBS}"
> +FILES:${PN}-dev +=3D "${libdir}/lib*${SOLIBSDEV} ${libdir}/pkgconfig
> ${includedir}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128839):
> https://lists.openembedded.org/g/openembedded-devel/message/128839
> Mute This Topic: https://lists.openembedded.org/mt/120623792/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000011d0fc0658642609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 6, 2026, 2:00=E2=80=
=AFAM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openem=
bedded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Add recipe for exempi, an im=
plementation of XMP based on Adobe XMP<br>
SDK and released under a BSD-style license like Adobe&#39;s.<br>
<br>
This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer =
noreferrer" target=3D"_blank">GOVCERT.LU</a>.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank" rel=3D"noreferrer">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/exempi/<a href=3D"http://exempi_2.6.6.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">exempi_2.6.6.bb</a>=C2=A0 =C2=A0 |=
 24 +++++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exempi/<a href=3D"http://e=
xempi_2.6.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">exempi_2.6.=
6.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/exempi/<a href=3D"http://exempi_2.6.6.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">exempi_2.6.6.bb</a> b/m=
eta-oe/recipes-support/exempi/<a href=3D"http://exempi_2.6.6.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">exempi_2.6.6.bb</a><br>
new file mode 100644<br>
index 0000000000..711f54f552<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/exempi/<a href=3D"http://exempi_2.6.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">exempi_2.6.6.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;An implementation of XMP&quot;<br>
+DESCRIPTION =3D &quot;An implementation of XMP based on Adobe XMP SDK\<br>
+and released under a BSD-style license like Adobe&#39;s.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://libopenraw.freedesktop.org/exempi/" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://libopenraw.freedesk=
top.org/exempi/</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df816aac8b22d16134477b8e156=
f0a0f4&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://libopenraw.freedesktop.org/download/$=
%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz</a>&quot;<=
br>
+SRC_URI[sha256sum] =3D &quot;900fb9957be2095c78e5111b99c49378adac58161a358=
f52f93c55126f34eb8f&quot;<br>
+<br>
+S =3D &quot;${UNPACKDIR}/${BPN}-${PV}&quot;<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Isnt this the default ?</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+inherit autotools pkgconfig<br>
+<br>
+DEPENDS =3D &quot;expat zlib&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-samples --disable-unittest&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-bin&quot;<br>
+FILES:${PN}-bin =3D &quot;${bindir}/exempi&quot;<br>
+FILES:${PN} =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
+FILES:${PN}-dev +=3D &quot;${libdir}/lib*${SOLIBSDEV} ${libdir}/pkgconfig =
${includedir}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128839): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128839" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/128839</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120623792/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120623792/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000011d0fc0658642609--

