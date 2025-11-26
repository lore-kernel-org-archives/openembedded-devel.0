Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD0FD1037A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 03:57:02 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5651.1764129418467950250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 19:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKd7ATgj;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78802ac2296so61661377b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 19:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764129417; x=1764734217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1NgzixigiM+IArn1+RSJbuXPPcxQOg/wP0SVxZHjRbk=;
        b=fKd7ATgjLf45lVDIz582IIOByhqCufjIZeGUzf0jDQUKFYTrVslV8VKFNDJAtXpL7s
         nK1AimspaUJ296vJlJT5JTYE5jGPO01lgSKlfY3PbLX8ve86QWWRmKIvtOZq/C5wL6rO
         +Avwj91uO0NDqcc9G3a0VFyB2tADT166HA+gBS0wew+S7Dk0P1Bjyp99+ei7uSvUDOyl
         rDP+L9pJ8OhbRHZ/eNpGzTt6QIWMRBBC/rWUH18Nbg2MlaSYt40PyWhIUHPtJ41L5Hge
         1XtQdh2lfE/eo15XqLi01PlRjX5fV/GOO3MGDByfB9FbfTxQFeZ5dP5AUMc1Dq8DsHGc
         Jm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764129417; x=1764734217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NgzixigiM+IArn1+RSJbuXPPcxQOg/wP0SVxZHjRbk=;
        b=u/23Zgx9S22qc3Cq42CzqV9cxbLJ3wUHbj8DrhwDlCrd/bhOAdF46+cxdMKOJUcYNk
         vVS1AWjqgqiWX5kq/35sFWPNitVVSjtQ9DOoFcBtz+H143cNNaNBJ2D0j6GE4okGo8qY
         RkxNYk45CzK4NXFGBtH0lwIjkG/jEtSDnXyL9VPVq1XCbJU2/vJWabblnYRSSa9Tof9y
         TvfSlVBLfvzBZ9nEmGxU+VjkTSUVcl+reQxA0AkZ8u5ztJXQQSrOA1zLmHZrdnf0N3iw
         5iDClX1RhSAOR/n7bcoOqaCJuGHF3+RGYTPQFZZatokd2xlpey6Phpp6F0Fb+8TATx/l
         v6ww==
X-Gm-Message-State: AOJu0Yw1hxgBUevmOfbiGXRf7/mYPgyfKwCRNX/7Z9xzJi2tFvsQFtI8
	RKXHQCD3/6mDSSB+bWXw2bjklFXoBZdSZ0d9jICcMXpKM71SON4H6eZmloRBTxcz54tx6SI50lW
	Rp4v8D8zhWulAdseRsLiwq8Y3J5ocHMHwsp34qzw=
X-Gm-Gg: ASbGncv9I77QCylgyy/tlOfZdtPJr0pz24K06YlGRD/y0x/W8uecK8nOV87vb/Odni2
	ol6NELBXmlMIyty8QUwbZ12uWz/vbL1rQlGFC3BMakb92vWwjbBFMCYpwNvPuwYQKMOdvjbxoZt
	4jXa3mUKiLAwAAQ7UTkxZ+y4hQkIQT51mO555GiSl1Bs9DSqSQ3EjiXOXrst9kc7dK4vzIrPE8l
	r0U0BuSIMfttY+EnTuYfUpxc26mCwhBuf8TMoWhBUzqN4/FSVmeXoVkHrMaVhN9ICRlx/JwSXB1
	Yj2030p72i9DmkJmezl6bw8V82YDwba+9z5qN3MzEay8o48k16MboxkqsdDcjUsMzdxUFn2KIF+
	M7pzmOC9HZymO4jl34dXMGF8HUSUReJGN/QBV6bIWuuE2MpI8HNAJLshJ
X-Google-Smtp-Source: AGHT+IFKBNR3uR4G3l2Pw5Wxn/jHpXCRWR5iGBj7BJ+FbYI6IbPWpYtuJh9X7Gcy37SpsIaUDboU5gadDi+n2kGY3DY=
X-Received: by 2002:a05:690c:380c:b0:786:65c2:249b with SMTP id
 00721157ae682-78a8b529f86mr151181387b3.33.1764129417450; Tue, 25 Nov 2025
 19:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20251125202048.3753948-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20251125202048.3753948-2-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 19:56:30 -0800
X-Gm-Features: AWmQ_bm3dghRisrgdVLs36SNzOu0JGrUVS5zKxsNmEsjfWU8PFZylGp7VWLhiSg
Message-ID: <CAMKF1spvMytU-kLqo0BpSMOLxb=YXh1VS3rHKt885D=_XsHNUw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] new recipe: python3-pytest-picked
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043d87d06447763af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 03:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122069

--00000000000043d87d06447763af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch. The commit message could be improved a bit please see
https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html=
#examples

On Tue, Nov 25, 2025 at 12:21=E2=80=AFPM Tom Geelen via lists.openembedded.=
org
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Sorry for the additional email. The previous patch still contained an
> erroneous line.
>
> Description: Run the tests related to the changed files
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  ...g-tests-to-capture-only-ptest-output.patch | 50 +++++++++++++++++++
>  .../python/python3-pytest-picked/run-ptest    |  5 ++
>  .../python/python3-pytest-picked_0.5.1.bb     | 20 ++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-fai=
ling-tests-to-capture-only-ptest-output.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index a172f8c676..1cb419a721 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -76,6 +76,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-pyserial \
>      python3-pytest-httpx \
>      python3-pytest-mock \
> +    python3-pytest-picked \
>      python3-pytest-sugar \
>      python3-pytoml \
>      python3-pyyaml-include \
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index ad68d74205..d3abc0761f 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -351,6 +351,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-pytest-httpx \
>      python3-pytest-lazy-fixtures \
>      python3-pytest-metadata \
> +    python3-pytest-picked\
>      python3-pytest-tempdir \
>      python3-pytest-timeout \
>      python3-pytest-xdist \
> diff --git
> a/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-f=
ailing-tests-to-capture-only-ptest-output.patch
> b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-f=
ailing-tests-to-capture-only-ptest-output.patch
> new file mode 100644
> index 0000000000..dfb50ace75
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-f=
ailing-tests-to-capture-only-ptest-output.patch
> @@ -0,0 +1,50 @@
> +From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001
> +From: Tom Geelen <t.f.g.geelen@gmail.com>
> +Date: Tue, 25 Nov 2025 20:42:15 +0100
> +Subject: [PATCH] adjust failing tests to capture only ptest output
> +
> +The tests should only check for warnings emitted by the plugin itself,
> +not for any other warnings that may be emitted by other plugins or pytes=
t
> +itself.
> +
> +Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + tests/test_pytest_picked.py | 17 ++++++++++++++---
> + 1 file changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/tests/test_pytest_picked.py b/tests/test_pytest_picked.py
> +index fb2bedb..947b43a 100644
> +--- a/tests/test_pytest_picked.py
> ++++ b/tests/test_pytest_picked.py
> +@@ -182,8 +182,13 @@ def test_should_accept_branch_as_mode(testdir,
> tmpdir, recwarn):
> +                 "Changed test folders... 0. []",
> +             ]
> +         )
> +-        assert len(recwarn) =3D=3D 1
> +-        assert str(recwarn[0].message) =3D=3D "Now `main` is the defaul=
t
> parent branch"
> ++    # Only count the plugin's own UserWarning about default parent bran=
ch
> ++    plugin_warnings =3D [
> ++        w
> ++        for w in recwarn
> ++        if w.category is UserWarning and "default parent branch" in
> str(w.message)
> ++    ]
> ++    assert len(plugin_warnings) =3D=3D 1
> +
> +
> + def test_should_accept_unstaged_as_mode(testdir, tmpdir, recwarn):
> +@@ -211,7 +216,13 @@ def test_should_accept_unstaged_as_mode(testdir,
> tmpdir, recwarn):
> +                 "Changed test folders... 0. []",
> +             ]
> +         )
> +-        assert len(recwarn) =3D=3D 0
> ++    # Ignore unrelated deprecation warnings from other plugins
> ++    plugin_warnings =3D [
> ++        w
> ++        for w in recwarn
> ++        if w.category is UserWarning and "default parent branch" in
> str(w.message)
> ++    ]
> ++    assert len(plugin_warnings) =3D=3D 0
> +
> +
> + def test_should_not_run_the_tests_if_mode_is_invalid(testdir, tmpdir):
> diff --git
> a/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
> b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
> new file mode 100644
> index 0000000000..39f369f20b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +# need to explicitly call the correct fixture as of pytest 8.x
> +
> +pytest -p pytester --automake
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb
> new file mode 100644
> index 0000000000..c7c2183337
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Run the tests related to the changed files"
> +HOMEPAGE =3D "https://github.com/anapaulagomes/pytest-picked"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d374a27c85c3fcc979009952ec16=
f1b"
> +RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI +=3D "file://run-ptest \
> +
>  file://0001-adjust-failing-tests-to-capture-only-ptest-output.patch \
> +           "
> +SRC_URI[sha256sum] =3D
> "6634c4356a560a5dc3dba35471865e6eb06bbd356b56b69c540593e9d5620ded"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> +
> +RDEPENDS:${PN} +=3D "\
> +    git \
> +    python3-pytest (>=3D3.7.0) \
> +"
> +
> +PYPI_PACKAGE =3D "pytest_picked"
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122062):
> https://lists.openembedded.org/g/openembedded-devel/message/122062
> Mute This Topic: https://lists.openembedded.org/mt/116475022/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000043d87d06447763af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch. The commit message could be improved=
 a bit please see<div><a href=3D"https://docs.yoctoproject.org/dev/contribu=
tor-guide/recipe-style-guide.html#examples">https://docs.yoctoproject.org/d=
ev/contributor-guide/recipe-style-guide.html#examples</a></div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Nov 25, 2025 at 12:21=E2=80=AFPM Tom Geelen via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;t.f.g.gee=
len=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Sorry for the additional email. The previous patch still con=
tained an erroneous line.<br>
<br>
Description: Run the tests related to the changed files<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 1=
 +<br>
=C2=A0...g-tests-to-capture-only-ptest-output.patch | 50 ++++++++++++++++++=
+<br>
=C2=A0.../python/python3-pytest-picked/run-ptest=C2=A0 =C2=A0 |=C2=A0 5 ++<=
br>
=C2=A0.../python/<a href=3D"http://python3-pytest-picked_0.5.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pytest-picked_0.5.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 20 ++++++++<br>
=C2=A05 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pytest=
-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pytest=
-picked/run-ptest<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-pytest-picked_0.5.1.bb</a><br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index a172f8c676..1cb419a721 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -76,6 +76,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pyserial \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-httpx \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-mock \<br>
+=C2=A0 =C2=A0 python3-pytest-picked \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-sugar \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytoml \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyyaml-include \<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index ad68d74205..d3abc0761f 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -351,6 +351,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-httpx \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-lazy-fixtures \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-metadata \<br>
+=C2=A0 =C2=A0 python3-pytest-picked\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-tempdir \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-xdist \<br>
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked/0001=
-adjust-failing-tests-to-capture-only-ptest-output.patch b/meta-python/reci=
pes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capt=
ure-only-ptest-output.patch<br>
new file mode 100644<br>
index 0000000000..dfb50ace75<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust=
-failing-tests-to-capture-only-ptest-output.patch<br>
@@ -0,0 +1,50 @@<br>
+From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001<br>
+From: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_=
blank">t.f.g.geelen@gmail.com</a>&gt;<br>
+Date: Tue, 25 Nov 2025 20:42:15 +0100<br>
+Subject: [PATCH] adjust failing tests to capture only ptest output<br>
+<br>
+The tests should only check for warnings emitted by the plugin itself,<br>
+not for any other warnings that may be emitted by other plugins or pytest<=
br>
+itself.<br>
+<br>
+Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" ta=
rget=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+---<br>
+ tests/test_pytest_picked.py | 17 ++++++++++++++---<br>
+ 1 file changed, 14 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/tests/test_pytest_picked.py b/tests/test_pytest_picked.py<br>
+index fb2bedb..947b43a 100644<br>
+--- a/tests/test_pytest_picked.py<br>
++++ b/tests/test_pytest_picked.py<br>
+@@ -182,8 +182,13 @@ def test_should_accept_branch_as_mode(testdir, tmpdir=
, recwarn):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Change=
d test folders... 0. []&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert len(recwarn) =3D=3D 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert str(recwarn[0].message) =3D=3D &quot;N=
ow `main` is the default parent branch&quot;<br>
++=C2=A0 =C2=A0 # Only count the plugin&#39;s own UserWarning about default=
 parent branch<br>
++=C2=A0 =C2=A0 plugin_warnings =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 w<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for w in recwarn<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if w.category is UserWarning and &quot;defaul=
t parent branch&quot; in str(w.message)<br>
++=C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 assert len(plugin_warnings) =3D=3D 1<br>
+ <br>
+ <br>
+ def test_should_accept_unstaged_as_mode(testdir, tmpdir, recwarn):<br>
+@@ -211,7 +216,13 @@ def test_should_accept_unstaged_as_mode(testdir, tmpd=
ir, recwarn):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Change=
d test folders... 0. []&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert len(recwarn) =3D=3D 0<br>
++=C2=A0 =C2=A0 # Ignore unrelated deprecation warnings from other plugins<=
br>
++=C2=A0 =C2=A0 plugin_warnings =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 w<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for w in recwarn<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if w.category is UserWarning and &quot;defaul=
t parent branch&quot; in str(w.message)<br>
++=C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 assert len(plugin_warnings) =3D=3D 0<br>
+ <br>
+ <br>
+ def test_should_not_run_the_tests_if_mode_is_invalid(testdir, tmpdir):<br=
>
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked/run-=
ptest b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest=
<br>
new file mode 100644<br>
index 0000000000..39f369f20b<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest<b=
r>
@@ -0,0 +1,5 @@<br>
+#!/bin/sh<br>
+<br>
+# need to explicitly call the correct fixture as of pytest 8.x<br>
+<br>
+pytest -p pytester --automake<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-picked_0.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-picked_0.5.1.bb</a><br>
new file mode 100644<br>
index 0000000000..c7c2183337<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-picked=
_0.5.1.bb</a><br>
@@ -0,0 +1,20 @@<br>
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
+SRC_URI +=3D &quot;file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-adjust-failing-tests-=
to-capture-only-ptest-output.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6634c4356a560a5dc3dba35471865e6eb06bbd356b56b=
69c540593e9d5620ded&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 git \<br>
+=C2=A0 =C2=A0 python3-pytest (&gt;=3D3.7.0) \<br>
+&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;pytest_picked&quot;<br>
+UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122062): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122062" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122062</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116475022/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116475022/1997914</a><br>
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

--00000000000043d87d06447763af--

