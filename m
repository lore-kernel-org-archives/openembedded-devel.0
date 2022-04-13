Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A58AC4708D
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.4917.1649888348349603450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 15:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hBL9uxMw;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id k29so3034082pgm.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+IFE2HttGCfWcO22z7U0yxpX8VQLUukhFn4CnWWDcU=;
        b=hBL9uxMwtP4g/+W7Lhkk8+9S7eP4NNpsRLJNRKfYhcwbtsYE9ak+4LH6g3ftaBev89
         yGCRli8hLf323hcoYhCxuvMQwDgrRHjwF0OO7JD7291SA+NYBbvemqM1ChSUCZ4NCIpV
         zRFVOmBMoxLbYcoNECQoadTHf4K6LP1gAQO1Qu1hqU3eUGn7TndNFfKabARn94bh995T
         8Hvx7NqsMuWMQX36lm3yil2EAvLk6cHXc1btGA7ilq+GFhtTb+PcJqx5z8H8IdAVx7q3
         ytkKXXYuvtdVRvIJrt/A7r8PUedy4qPlW6ri32QcFnD/m2ZlIX2VbN/++QCqaD26uIom
         q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+IFE2HttGCfWcO22z7U0yxpX8VQLUukhFn4CnWWDcU=;
        b=0/5uFEK/avkgdQb6mTYB90FbtGYNjnosiIkpqTuP8e9OlH/iPeTH/b6S1JKd+lWJBX
         wv46DBo8ZteYJg970x3dmza21bqieSlDbkgN2lSR3ApRLhOsqIQJrnkXFmKKrMxumrmX
         BHQ+vkSFX+7k92MdVSjH0DRhaC89hbARM5+EsCYomUdHtadeBaUJttTmpNj9tWpORL3p
         /ZDGUNehJel/8FK+PsijjOlFGjd0d532g5pau34ju9ekFWx7NoBr5llsl1nP5LbgfoAK
         cIayOl3m3nJbdots2FxtXEkBCNYglBZ4A+4oovJ05/eaR13V9Gqp1FgLJIiRmbi24Qq9
         YzjQ==
X-Gm-Message-State: AOAM532ic+W6F8Q0xsopvnOrZlLCKEuYtNYlgQ+3XHTgl34YZB0Xe6hR
	yuI7WJlW2aFlsgYeM3RXnbYs8WwW6Jf6cLeei8g=
X-Google-Smtp-Source: 
 ABdhPJzwo6tLqT3Ugdf8S6qTYmTKqvVlJAO2XZSMkWb4RXGhtiAqWUlstKoOv0VdAbgUlimaJdmgzVvEMo+hZYlBUK0=
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr884907pfv.65.1649888347094; Wed, 13 Apr
 2022 15:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <1649605974-12443-1-git-send-email-wangmy@fujitsu.com>
 <1649605974-12443-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1649605974-12443-2-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 13 Apr 2022 15:18:55 -0700
Message-ID: 
 <CANx9H-AX-fHe06TCCg5-wmQ_NcaKY3ww05pJJxUFDc0fT56Q5w@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v2] python3-cppy: upgrade 1.2.0 ->
 1.2.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d9046305dc9090ab"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96622

--000000000000d9046305dc9090ab
Content-Type: text/plain; charset="UTF-8"

NAK. Instead inherit python _setuptools-buils-meta


https://github.com/nucleic/cppy/blob/main/pyproject.toml#L42
Which shows build-backend = "setuptools.build_meta"

We do not want to carry patches when upstream has modernized.

On Wed, Apr 13, 2022 at 1:56 AM wangmy <wangmy@fujitsu.com> wrote:

> Add patch 0001-Fix-build-bug.patch to fix build bug caused by
> setup.py.
>
> Changelog:
> ==========
> make the pyproject.toml fully PEP 621 compliant PR #19
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python3-cppy/0001-Fix-build-bug.patch     | 37 +++++++++++++++++++
>  ...n3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} |  6 ++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
>  rename meta-python/recipes-devtools/python/{python3-cppy_1.2.0.bb =>
> python3-cppy_1.2.1.bb} (69%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
> b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
> new file mode 100644
> index 0000000000..ada03b9a27
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
> @@ -0,0 +1,37 @@
> +From 57733d2cece47095b3faf14090219fcb5fa8ca2c Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Wed, 13 Apr 2022 13:01:32 +0900
> +Subject: [PATCH] Fix build bug.
> +
> +Because the upstream cleared the setup.py, do_compile can't be excuted
> +correctly. So, recover setup.py from the last version.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + setup.py | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index f6f8487..8dfc33f 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -7,4 +7,14 @@
> + #
> ------------------------------------------------------------------------------
> + from setuptools import setup
> +
> +-setup()
> ++setup(
> ++    name="cppy",
> ++    author="The Nucleic Development Team",
> ++    author_email="sccolbert@gmail.com",
> ++    maintainer_email="m.dartiailh@gmail.com",
> ++    url="https://github.com/nucleic/cppy",
> ++    description="C++ headers for C extension development",
> ++    long_description=open("README.rst").read(),
> ++    packages=["cppy"],
> ++    package_data={"cppy": ["include/cppy/*.h"]},
> ++)
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
> b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
> index f86f571938..b9f7f08227 100644
> --- a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
> @@ -3,7 +3,11 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
>
> -SRC_URI[sha256sum] =
> "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
> +SRC_URI += " \
> +    file://0001-Fix-build-bug.patch \
> +"
> +
> +SRC_URI[sha256sum] =
> "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
>
>  RDEPENDS:${PN} += "python3-setuptools python3-distutils"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96614):
> https://lists.openembedded.org/g/openembedded-devel/message/96614
> Mute This Topic: https://lists.openembedded.org/mt/90436671/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d9046305dc9090ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">NAK. Instead inherit python _setuptools-buils-meta</div><=
div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></=
div><div dir=3D"auto"><div><a href=3D"https://github.com/nucleic/cppy/blob/=
main/pyproject.toml#L42">https://github.com/nucleic/cppy/blob/main/pyprojec=
t.toml#L42</a></div>Which shows build-backend =3D &quot;setuptools.build_me=
ta&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">We do not want =
to carry patches when upstream has modernized.</div><div dir=3D"auto"><br><=
div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Apr 13, 2022 at 1:56 AM wangmy &lt;<a href=3D"mailto:wangmy@fujit=
su.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Add pat=
ch 0001-Fix-build-bug.patch to fix build bug caused by<br>
setup.py.<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
make the pyproject.toml fully PEP 621 compliant PR #19<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python3-cppy/0001-Fix-build-bug.patch=C2=A0 =C2=A0 =C2=A0| 37 +++=
++++++++++++++++<br>
=C2=A0...<a href=3D"http://n3-cppy_1.2.0.bb" rel=3D"noreferrer" target=3D"_=
blank">n3-cppy_1.2.0.bb</a> =3D&gt; <a href=3D"http://python3-cppy_1.2.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.1.bb</a>} |=C2=A0 6=
 ++-<br>
=C2=A02 files changed, 42 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cppy/0=
001-Fix-build-bug.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cppy_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.0.bb<=
/a> =3D&gt; <a href=3D"http://python3-cppy_1.2.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3-cppy_1.2.1.bb</a>} (69%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-buil=
d-bug.patch b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-bui=
ld-bug.patch<br>
new file mode 100644<br>
index 0000000000..ada03b9a27<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.p=
atch<br>
@@ -0,0 +1,37 @@<br>
+From 57733d2cece47095b3faf14090219fcb5fa8ca2c Mon Sep 17 00:00:00 2001<br>
+From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_b=
lank">leimaohui@fujitsu.com</a>&gt;<br>
+Date: Wed, 13 Apr 2022 13:01:32 +0900<br>
+Subject: [PATCH] Fix build bug.<br>
+<br>
+Because the upstream cleared the setup.py, do_compile can&#39;t be excuted=
<br>
+correctly. So, recover setup.py from the last version.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" tar=
get=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
+---<br>
+ setup.py | 12 +++++++++++-<br>
+ 1 file changed, 11 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index f6f8487..8dfc33f 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -7,4 +7,14 @@<br>
+ # -----------------------------------------------------------------------=
-------<br>
+ from setuptools import setup<br>
+ <br>
+-setup()<br>
++setup(<br>
++=C2=A0 =C2=A0 name=3D&quot;cppy&quot;,<br>
++=C2=A0 =C2=A0 author=3D&quot;The Nucleic Development Team&quot;,<br>
++=C2=A0 =C2=A0 author_email=3D&quot;<a href=3D"mailto:sccolbert@gmail.com"=
 target=3D"_blank">sccolbert@gmail.com</a>&quot;,<br>
++=C2=A0 =C2=A0 maintainer_email=3D&quot;<a href=3D"mailto:m.dartiailh@gmai=
l.com" target=3D"_blank">m.dartiailh@gmail.com</a>&quot;,<br>
++=C2=A0 =C2=A0 url=3D&quot;<a href=3D"https://github.com/nucleic/cppy" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/nucleic/cppy</a>&quot;=
,<br>
++=C2=A0 =C2=A0 description=3D&quot;C++ headers for C extension development=
&quot;,<br>
++=C2=A0 =C2=A0 long_description=3Dopen(&quot;README.rst&quot;).read(),<br>
++=C2=A0 =C2=A0 packages=3D[&quot;cppy&quot;],<br>
++=C2=A0 =C2=A0 package_data=3D{&quot;cppy&quot;: [&quot;include/cppy/*.h&q=
uot;]},<br>
++)<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cppy_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.0.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cppy_1.2=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.1.bb</a><br>
similarity index 69%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-c=
ppy_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.0.bb</a=
><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-cpp=
y_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.1.bb</a><=
br>
index f86f571938..b9f7f08227 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cppy_1.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cppy_1.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cppy_1.2.1.bb</a><br>
@@ -3,7 +3,11 @@ HOMEPAGE =3D &quot;<a href=3D"https://cppy.readthedocs.io/=
en/latest/" rel=3D"noreferrer" target=3D"_blank">https://cppy.readthedocs.i=
o/en/latest/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0bfb3e39b13587f0028f1=
7baf0e42371&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa=
0d0a7a6b2ef850aeffc&quot;<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-Fix-build-bug.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;83b43bf17b1085ac15c5debdb42154f138b928234b214=
47358981f69d0d6fe1b&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-setuptools python3-distutils&quot;<=
br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96614): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96614" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96614</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90436671/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
90436671/924729</a><br>
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

--000000000000d9046305dc9090ab--

