Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B95D111BA
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:15:52 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6948.1764198947318993472
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VH4Y8ex+;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640f2c9cc72so277920d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 15:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764198946; x=1764803746; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8SiG3GCoRru9JG+8ZjRstK7qKwvvQ/h+sMFFCCHckyE=;
        b=VH4Y8ex+MRI5N1NF7yc6qLzrRDhdINqZHUExYAVwDZ1bZQw34LwoeeCNgkgE3UH591
         dRc/W3sZ612/0FpA1AeHs4vFIe7yfZJl2Hp54pHuMCIsb3hDJFkS8pLyR6mjKQgbMZEs
         iAGMF2a4SelWSMd+T0K0wdxj8OcNfZ80kPpKpRyfnxDPqwMZsOr5l0EymVvMCnIlKR6s
         6zTPgh2xeImL0csvZEbbtHLQvVnDOzk5AeWJbpz2HB/adk1sUOPybnDsuHTzXGHfmiyC
         iCNBOsa1MoWyb3uefPp4dqtXMyKmPspJIjuvTC7h/kBA78BW3HMdjgBt9tBp3FTyo8R9
         DKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764198946; x=1764803746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SiG3GCoRru9JG+8ZjRstK7qKwvvQ/h+sMFFCCHckyE=;
        b=VusuGfPYseDV0bNZB4qKJDTzp+RzoNnST2GaxhNUR4aQjvp13xEORpnE6lkJRc8+B5
         zfb5fH8pJm0D+YWuneNrye2hpCT+EjCt0n8qT1xOjfwPQJ6vCsNeZzbSKb+OuF5LzZLc
         PrsszATQ1WlYu9HHTt58Ijr9PJN9AcxBc0vHGwkCn/JMUCRsJfLP9ikUzr6L01srteOM
         LeKx0Qj/PCqnosWzHMgn0mJkqGF83JOjWwztDWunWSim+c7TwE7nHFmolqFeHpkq1ieB
         QNeTxgfoR2oD12yN1D5yeZLTGfJS+KumVLZugvcLiE52lowPb5AKI+D7jewbdAYQiDqn
         YmKA==
X-Gm-Message-State: AOJu0YwP/rXy/2RxT4ESxjKQyujfgK/0Pc/U47qtPKNT5VWe5YDpcre0
	SzXRxgBlNidjd3foos9hXsT55UOv737GFQk6dvF9KC/RjXQGmZFH29HmcIsc6T3Zs7smKOr+epp
	DeNGnfMedSc6SvXh+0ow/gvckUBiu+r6DgI1G0dc=
X-Gm-Gg: ASbGncut0mBK9x1RVklJJ5Ud8b8TkO1cMHAm9Qw8h6kkNgcAkw8EsZ30j8iZPNCFRwD
	Tm8r7rwkmj1ghUEuuTnLchHmibGgkaLOVpMdML0gGWsFuv8RIz5sszQEhR/YdNMX/l6my2A83MT
	f7Ske+LsUMN/xJOcy/jRONAz9DYnytSWJGuYtuMGgYS/csLrDr84/PhO04CTOjq78Pvvpch9XYN
	HX9/DALKm01Os8A2G7sj+szLNKA4txQ7veziyR63qRMNmmvtQwae/YKCJ7a18FnAieZ7PjJvhY6
	0t4zWo4VEDRQCY5flVBlbezOf2I5FgAaA27IJ6da1hIuVZ8IrS/ieURr6YjaWS4+28+R998IuOt
	Im3fRDFZMOmjVXZ9JEI2Dj+GbY20cOp8XT3ZMKpIsdXcFww==
X-Google-Smtp-Source: AGHT+IF+cn+Vq9tIafyIw/Pqv/rDag62ycPyWsEwSQyOiRPufDWHqyPD6JtrQp27p9r9PNWYjRxQgAsUCEKcyML01aE=
X-Received: by 2002:a05:690c:6713:b0:787:badd:4c with SMTP id
 00721157ae682-78ab6dfc57fmr130467317b3.27.1764198946293; Wed, 26 Nov 2025
 15:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20251126215718.286295-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20251126215718.286295-2-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Nov 2025 15:15:20 -0800
X-Gm-Features: AWmQ_bkJUI2NeaFUpZvXUJXEb-IfOLTu9ekv8PkZuW2nD3AWkGQ1TRlMD2cj5_I
Message-ID: <CAMKF1sqgr_pViJHU6NjKPq3=8YrMhtSc95bUwWX7nUWrPiaZ7A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3] New recipe: python3-pytest-picked 0.5.1
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081ca180644879364"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 23:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122097

--00000000000081ca180644879364
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject should be something like

python3-pytest-picked: Add recipe for version 0.5.1

On Wed, Nov 26, 2025 at 1:58=E2=80=AFPM Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Python package description: Run the tests related to the unstaged files o=
r
> the current branch (according to Git)
> More information: https://pypi.org/project/pytest-picked/
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  ...g-tests-to-capture-only-ptest-output.patch | 51 +++++++++++++++++++
>  .../python/python3-pytest-picked/run-ptest    |  5 ++
>  .../python/python3-pytest-picked_0.5.1.bb     | 20 ++++++++
>  5 files changed, 78 insertions(+)
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
> index 0000000000..b4d7794e47
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-f=
ailing-tests-to-capture-only-ptest-output.patch
> @@ -0,0 +1,51 @@
> +From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001
> +From: Tom Geelen <t.f.g.geelen@gmail.com>
> +Date: Tue, 25 Nov 2025 20:42:15 +0100
> +Subject: [PATCH] adjust failing tests to capture only ptest output
> +
> +The tests should only check for warnings emitted by the plugin itself,
> +not for any other warnings that may be emitted by other plugins or pytes=
t
> +itself. This behavior is caused by the fact that pytest might throw some
> deprecation warnings
> +or other warnings that are unrelated to the plugin being tested.
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
> View/Reply Online (#122094):
> https://lists.openembedded.org/g/openembedded-devel/message/122094
> Mute This Topic: https://lists.openembedded.org/mt/116492554/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000081ca180644879364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Subject should be something like<div><br></div><div>python=
3-pytest-picked: Add recipe for version 0.5.1</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Nov 26, 2025 at 1:58=E2=80=AFPM Tom Geelen via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Python package description: Run the tests related to the unstaged files o=
r the current branch (according to Git)<br>
More information: <a href=3D"https://pypi.org/project/pytest-picked/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/pytest-picked/</=
a><br>
<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 1=
 +<br>
=C2=A0...g-tests-to-capture-only-ptest-output.patch | 51 ++++++++++++++++++=
+<br>
=C2=A0.../python/python3-pytest-picked/run-ptest=C2=A0 =C2=A0 |=C2=A0 5 ++<=
br>
=C2=A0.../python/<a href=3D"http://python3-pytest-picked_0.5.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pytest-picked_0.5.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 20 ++++++++<br>
=C2=A05 files changed, 78 insertions(+)<br>
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
index 0000000000..b4d7794e47<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust=
-failing-tests-to-capture-only-ptest-output.patch<br>
@@ -0,0 +1,51 @@<br>
+From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001<br>
+From: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_=
blank">t.f.g.geelen@gmail.com</a>&gt;<br>
+Date: Tue, 25 Nov 2025 20:42:15 +0100<br>
+Subject: [PATCH] adjust failing tests to capture only ptest output<br>
+<br>
+The tests should only check for warnings emitted by the plugin itself,<br>
+not for any other warnings that may be emitted by other plugins or pytest<=
br>
+itself. This behavior is caused by the fact that pytest might throw some d=
eprecation warnings<br>
+or other warnings that are unrelated to the plugin being tested.<br>
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
View/Reply Online (#122094): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122094" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122094</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116492554/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116492554/1997914</a><br>
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

--00000000000081ca180644879364--

