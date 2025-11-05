Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA80CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 22:51:12 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1779.1762383070694249597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 14:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frfHowT7;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7866375e943so2933327b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 14:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383070; x=1762987870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG76lIvW333XnFCTYd8s/DnNhN7WsvsBefzD+JjqJpY=;
        b=frfHowT7qBtXM5RI2A3hJOGV9DeDKXpEYQiI/mn0bqgUHxFDNfkrNX4IYQsYH992si
         86kvDCgKW+gPtPbGmvgX+JjMi/7sx6W+A5jW5zVRB3PrBL2ZqWcSyXUN3Ed48JvJrNNv
         TPEBZS2el28q8lqnf+nrpr5eevNsWjTw61Ztx8IeEHfVoJyFUbMDnPp/zAqfaANmkhdd
         T9J9n1C6tYgu5DwouIuoypZepcGv89Q/VsjeUG0a1mAAMku1r3TUnAunq78Y0pyUvj78
         YHWNKDdU6PLAEJKojGSoZAqrbZmrDEVAxAp0zdfz4wbhHTpBsaHJX9/DzcZvFABVpnna
         IDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383070; x=1762987870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG76lIvW333XnFCTYd8s/DnNhN7WsvsBefzD+JjqJpY=;
        b=HJTPvMUeZafUWWlzW1oj/4PzCRDlSzxDGbGi53OcdUtL1Sr3cf15uCUO+HeWfHUR/g
         2YnIfEkZiVu/eUi1gO9K+tR3wM+HMbH/2VGfR4MkUx/hsbwPu0QTcG37zyOKmjJkK2Ql
         lrhzXvrEWDFSSDn4bV0He8VA2Oo6P1YQiaKDW4eheieNRsNz/30lMJ6NV1HAxWj7tqli
         t+Na02qRd0CNn906G3sEfyLRTUyHBwfqT+SlsyLgV7Cl8OPdUSHOCDpLERUkd0pQljlw
         tqY8veNcnu+elbWssbMy0RHzGkDog3HEemNjzkFXrs2w43Fv9UgDpoRadEHScSdpUdMu
         ppdQ==
X-Gm-Message-State: AOJu0YxBhvE2eUcvgJ3G4B51hwqec7SShdnyPyxhxaR1LPFYoyD12p2Y
	GPzdChfy8VSjvljGj9EMV7qtrQmE4M3D2Y219lqQgjGLJpfJ9mLyfkHxq9ty7xjLCU2+OQZ495y
	5l/6+Hh7Ek+JKPz0xce5bHw7ntKMQ438=
X-Gm-Gg: ASbGncvZJnjZ18NQTMLfFqzo90KCnTto+6YyrZKsrfifD8YIcxiCNNet2CcikLq32Xz
	7vvhf9GBQ33A36Tf0KdurKlrWbsARp9PD/7t5QczDEoLxx0yshQ+krIlXBMk1y77JBU12JEZ1dX
	JLj09pd0mWqga/B6A1PJDM6GaMoiJPHstNeCd2L7hWHQXln7QEMXg7O/qOb60UKvmv34wdyd8mc
	4BPOwNK4ryLT781MTAd3pMAD+De3FztKTjo2MqkX4vmiV/29RqgbCkwxR7W6hXrHwnmFuAPL8Jp
	HvkN5jDUUvZQonWECG746H/eBKDicP13Ru5Z0gHbwori
X-Google-Smtp-Source: AGHT+IEd63zIyP76i/3s8Ag9lwlL/cs4GVvAUmHugp8BC65v5TIxnh9UWJdzK4GJS6QWlPTveWAjWxLDIEjAzDLmTO8=
X-Received: by 2002:a05:690c:7512:b0:786:7797:6dba with SMTP id
 00721157ae682-786a4104793mr44374747b3.22.1762383069602; Wed, 05 Nov 2025
 14:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com> <20251105212631.386242-11-t.f.g.geelen@gmail.com>
In-Reply-To: <20251105212631.386242-11-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Nov 2025 14:50:42 -0800
X-Gm-Features: AWmQ_blezTapk-kozSq0ZqUvClY9D8vXToAx4_cxMStZd-G6IdobiPsSCO738eU
Message-ID: <CAMKF1sqeMW3ZEoPK6B=Qd4BNJjMTD0y=q5pOrNoDWHVy-p3UiQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 7/8] new recipe: python3-pytest-picked
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d266710642e0c839"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 22:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121338

--000000000000d266710642e0c839
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 1:28=E2=80=AFPM Tom Geelen via lists.openembedded.or=
g
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Run the tests related to the unstaged files or the current branch
> (according to Git)
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../python/python3-pytest-picked_0.5.1.bb          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb
> new file mode 100644
> index 0000000000..5bea05a036
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Run the tests related to the changed files"
> +HOMEPAGE =3D "https://github.com/anapaulagomes/pytest-picked"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d374a27c85c3fcc979009952ec16=
f1b"
> +RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI[sha256sum] =3D
> "6634c4356a560a5dc3dba35471865e6eb06bbd356b56b69c540593e9d5620ded"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
>

I think the test should be enabled as well for
e.g. meta-python-image-ptest-all
please add it to conf/include/ptest-packagelists-meta-python.inc as well.


> +
> +PYPI_PACKAGE =3D "pytest_picked"
> +RDEPENDS:${PN} =3D "python3-pytest (>=3D3.7.0)"
> +
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121336):
> https://lists.openembedded.org/g/openembedded-devel/message/121336
> Mute This Topic: https://lists.openembedded.org/mt/116142683/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d266710642e0c839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, =
2025 at 1:28=E2=80=AFPM Tom Geelen via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Run the tests =
related to the unstaged files or the current branch (according to Git)<br>
<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-picked_0.5.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pytest-picked_0.5.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-pytest-picked_0.5.1.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-picked_0.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-picked_0.5.1.bb</a><br>
new file mode 100644<br>
index 0000000000..5bea05a036<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-picked=
_0.5.1.bb</a><br>
@@ -0,0 +1,14 @@<br>
+SUMMARY =3D &quot;Run the tests related to the changed files&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/anapaulagomes/pytest-pick=
ed" rel=3D"noreferrer" target=3D"_blank">https://github.com/anapaulagomes/p=
ytest-picked</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6d374a27c85c3fcc979009952e=
c16f1b&quot;<br>
+RECIPE_MAINTAINER =3D &quot;Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@=
gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;6634c4356a560a5dc3dba35471865e6eb06bbd356b56b=
69c540593e9d5620ded&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest<br></blockqu=
ote><div><br></div><div>I think the test should be enabled as well for e.g.=
=C2=A0meta-python-image-ptest-all</div><div>please add it to=C2=A0conf/incl=
ude/ptest-packagelists-meta-python.inc as well.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+PYPI_PACKAGE =3D &quot;pytest_picked&quot;<br>
+RDEPENDS:${PN} =3D &quot;python3-pytest (&gt;=3D3.7.0)&quot;<br>
+<br>
+UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121336): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121336" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121336</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116142683/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116142683/1997914</a><br>
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

--000000000000d266710642e0c839--

