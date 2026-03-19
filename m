Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439D41091917
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 20:14:36 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5337.1773951273064754054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 13:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0Cl3oxV;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64e8cdafeffso1924170d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 13:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773951272; cv=none;
        d=google.com; s=arc-20240605;
        b=AUUw3My2nVgJzMqzqGZj0hbEzHcGWBoC5kgc78B+7jyYS263H2lgBr/eDFdOKTyZUW
         iedGGtdx41xqip4JdqepYh/Afri1//kQWR0usHf1SwuwAxrdsJ7EPzMq/rVO0veoAM4j
         OYEs3Tf7doq7zpaDref0f1v+QQduFdTnGragjAJw+em0H2OmBqL6m08F3wiPIIN8MzQN
         igaBF1/GYVuKo277Fqd2DjoAftkiTP316yVgLeKZPG4ONoYZXEG0queprHuLfVgvzEYh
         Cs48ECAc+TcA7zXWFYRYjTnX2mj95uLgDloBR8OOnKDI2BaTQNdH/bi3quYdAaCerjbb
         of3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m7cf/mtZb1glrIDG/d6fgXiojE/wTeOY19fDtRrFUMA=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=e5x7kpjubxgM0f7Ky3NlidSP4FklB4/yoZ3qdm01usIMTGV0ZTPuWIc9FcQmhx26tf
         FYLeQst0rMMBuUYMA0DdLtXi7Z+XdqOLi8NA231PrROFxVzhzZkNfSR+sL9kfl0AISX2
         s//bl5dG8NhOb3wNS4XrdtnMHC64eYR6rVqrJy+sHyh7o7YyeXLQDlUHtg5ep2b8XRnh
         y84mMTErbY2snrEpY2Xvl+y/FbWwHMFyOhaemypzIDUG/mmdDn/bXVXHDEY1eENYUgrv
         k22sXaXefWaytxLMuwXRSjjeWnhQvni9D6rvZ/+cOmXFCrXL1sx/JO6sHLSw6LWzlVMt
         P2bQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773951272; x=1774556072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7cf/mtZb1glrIDG/d6fgXiojE/wTeOY19fDtRrFUMA=;
        b=S0Cl3oxVeJW4jFfojQGEWR96SJuBp4N74WDGuF/WRuSm1OREjIS9FwqbBrgW6jjh9L
         HyBjo7W/O5Bhwzd/YBJQTyKhM5z7ZN9F/fNtlIzZrqHw7/hhPF+M7hzzIwrqunYCqAG/
         gZiPcyIAYf4Hgx1UaFuVZgHjIxIxYpm73cLstH7qqNITsMWNDXkRe8hTopdsjb0qnoWr
         mO1mzWHmQ16ImTF2ZqLIP5SjZ3weFb/FDCHe1XjQ1vTpW3MmFVZiDol9ux82jHU+6jl/
         F/avnwN4b5b+YZHHeFpICprYehF0O4ZHQEPFBqJl/n48sVcwdhRED+M6/wAN26QQjBxn
         YU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773951272; x=1774556072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7cf/mtZb1glrIDG/d6fgXiojE/wTeOY19fDtRrFUMA=;
        b=c9rltpMLWFY+3hlDq/cg16Q3+ma8TIPt/FsLsalQV66s5gxBJTKhk3la/4hM3s+YjP
         jFYsK0GhV16q4fkT250IqZmbemxV22v2/pJ6kpQ95uy9CQJ3MhSpjfSYbMPvfjEhROfI
         e3sVvYjndtnVeGLTislNB2Oc+YYBluJqf9mPRt5+ihgOWUF4iuM79jROfkf1TP2kGRvD
         nOqFurF0D5UuqlAFPpJ98uD4MZuFF2ZnUdxwEQdyaDRu86vDqCg9uXt9cV2fid2rYLUu
         78hZeOUqnK/RUHSgW8Ksj3HAUqop9QgCyDw9cPxrdXiB/xFEf1vQ6l12t49hAhSiCBEZ
         0ecA==
X-Gm-Message-State: AOJu0YysLfLOAonCUO41jUu58qeJaII4QlU0oP/kL6QEqun7T/SBovla
	2IYQBln5Pswbk6m1Mv4xrM04cVdt9PVQNRLFv4Ls09Hr/EL9c8eLSheGwNxvkxb+slDQ1SEdCwQ
	8fzW/9IVbp7U73SlsB1qYQa16iGUIeME=
X-Gm-Gg: ATEYQzxMUeZewMHqKz37edq575GOVXv75Gb4qNT0qy9x5EWx/05teInO2RFjz0rgYXn
	O7qM+hRyrKBIeZyxDYUs/cpaujkupBH744ooTotwwIyroRg1Bo/XTwtub+lg5vdSRJW0z2mMZMS
	UPw+nTNCqKzDwU5ZNgCCgE3y9o7t7h7lwii8Ct6RpLj0WPkDA8V0zDNkdm0OQTiOmbmqkbkZipy
	Oo6Ma2ph6w6bTYCXwW8oO7YYxWGSZSilr5ny6VxoW0YwjC7lPIZUfebl52sT9R5hp1nE/kRhtia
	IiAO4iyxLqfPWpajfT5X8B+RzxZ5PUJiDwhJDgFfwgVIy2yTZ5W66NRBYKfpNq57/iS43mqNIt7
	sEBJ6L0bBqiBzefueBkkm33vO+Z4=
X-Received: by 2002:a53:cf0a:0:b0:64a:a578:9771 with SMTP id
 956f58d0204a3-64ea041e050mr2489765d50.26.1773951272004; Thu, 19 Mar 2026
 13:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260319194024.878293-1-skandigraun@gmail.com>
In-Reply-To: <20260319194024.878293-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Mar 2026 13:14:05 -0700
X-Gm-Features: AaiRm53xN3PZVJ0BjD5ecI7ReooonZA4JynuPBgjd1lOr_NTBkCm4w5CVISpdrU
Message-ID: <CAMKF1sq1mUZbaTHgZ2VKbnbehbJq21R89BO9Y3+qpPdK3YpdVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pychromecast: upgrade 14.0.9 -> 14.0.10
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006aaf8c064d6637bb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 20:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125413

--0000000000006aaf8c064d6637bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had cobbled together a similar patch in master-next, thanks for
submitting, I have replaced the staged version with this one.

On Thu, Mar 19, 2026 at 12:40=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Beside the below changelog, it also allows compiling with the latest
> Setuptools.
>
> Drop patches which became obsolete.
>
> Changes:
> - Ensure cec info is none if not supported
> - Add some fast pre-commit checks
> - Switch to ruff for checks and formatting
> - add D24f-J09 to const.py
> - Update const.py to include Lenovo Smart Display 10
> - Avoid logging graceful disconnect as error
> - Fix datetime deprecation
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...-version-to-0.46.1-for-python3-wheel.patch | 23 -------------------
>  .../0002-allow-newer-wheel.patch              | 22 ------------------
>  ...0.9.bb =3D> python3-pychromecast_14.0.10.bb} |  6 +----
>  3 files changed, 1 insertion(+), 50 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-requir=
ed-version-to-0.46.1-for-python3-wheel.patch
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-newer=
-wheel.patch
>  rename meta-python/recipes-devtools/python/{
> python3-pychromecast_14.0.9.bb =3D> python3-pychromecast_14.0.10.bb} (62%=
)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-requ=
ired-version-to-0.46.1-for-python3-wheel.patch
> b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-requ=
ired-version-to-0.46.1-for-python3-wheel.patch
> deleted file mode 100644
> index 655b9c08c7..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-requ=
ired-version-to-0.46.1-for-python3-wheel.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 672b0501526fc7c91725236fc37db82794096832 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 1 Jul 2025 23:14:08 -0700
> -Subject: [PATCH] bump required version to 0.46.1 for python3-wheel
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index d5a518c..a6a159d 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,5 +1,5 @@
> - [build-system]
> --requires =3D ["setuptools>=3D65.6,<81.0", "wheel>=3D0.37.1,<0.46.0"]
> -+requires =3D ["setuptools>=3D65.6,<81.0", "wheel>=3D0.37.1,<0.46.2"]
> - build-backend =3D "setuptools.build_meta"
> -
> - [project]
> diff --git
> a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-new=
er-wheel.patch
> b/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-new=
er-wheel.patch
> deleted file mode 100644
> index 456feb6010..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-new=
er-wheel.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From e11eb34d1196a9dc35fef213aeffdfd8e6e29f44 Mon Sep 17 00:00:00 2001
> -From: Tom Geelen <t.f.g.geelen@gmail.com>
> -Date: Sun, 8 Feb 2026 19:14:09 +0100
> -Subject: [PATCH] allow newer wheel
> -
> -Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> -Upstream-Status: Pending
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index 4c98630..75a15da 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,5 +1,5 @@
> - [build-system]
> --requires =3D ["setuptools>=3D65.6,<81.0", "wheel>=3D0.37.1,<0.46.2"]
> -+requires =3D ["setuptools>=3D65.6,<81.0", "wheel>=3D0.37.1,<0.46.4"]
> - build-backend =3D "setuptools.build_meta"
> -
> - [project]
> diff --git a/meta-python/recipes-devtools/python/
> python3-pychromecast_14.0.9.bb b/meta-python/recipes-devtools/python/
> python3-pychromecast_14.0.10.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/
> python3-pychromecast_14.0.9.bb
> rename to meta-python/recipes-devtools/python/
> python3-pychromecast_14.0.10.bb
> index 6f88684f8b..cdd85a550f 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
> @@ -3,11 +3,7 @@ HOMEPAGE =3D "https://github.com/balloob/pychromecast"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db1dbd4e85f47b389bdadee9c69466=
9f5"
>
> -SRC_URI +=3D
> "file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
> -           file://0002-allow-newer-wheel.patch \
> -           "
> -
> -SRC_URI[sha256sum] =3D
> "fe78841b0b04aa107d08aed216e91ab9cfb54b11d089d382be4e987e3631d4a6"
> +SRC_URI[sha256sum] =3D
> "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"
>
>  inherit pypi python_setuptools_build_meta
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125412):
> https://lists.openembedded.org/g/openembedded-devel/message/125412
> Mute This Topic: https://lists.openembedded.org/mt/118406719/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006aaf8c064d6637bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had cobbled together a similar patch in master-next, tha=
nks for submitting, I have replaced the staged version with this one.</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 19, 2026 at 12:40=E2=80=AFPM Gyorgy Sarvari via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;s=
kandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Beside the below changelog, it also allows compiling =
with the latest Setuptools.<br>
<br>
Drop patches which became obsolete.<br>
<br>
Changes:<br>
- Ensure cec info is none if not supported<br>
- Add some fast pre-commit checks<br>
- Switch to ruff for checks and formatting<br>
- add D24f-J09 to const.py<br>
- Update const.py to include Lenovo Smart Display 10<br>
- Avoid logging graceful disconnect as error<br>
- Fix datetime deprecation<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-version-to-0.46.1-for-python3-wheel.patch | 23 ------------------=
-<br>
=C2=A0.../0002-allow-newer-wheel.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 22 ------------------<br>
=C2=A0...<a href=3D"http://0.9.bb" rel=3D"noreferrer" target=3D"_blank">0.9=
.bb</a> =3D&gt; <a href=3D"http://python3-pychromecast_14.0.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pychromecast_14.0.10.bb</a>} |=C2=A0 6=
 +----<br>
=C2=A03 files changed, 1 insertion(+), 50 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-pychro=
mecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-pychro=
mecast/0002-allow-newer-wheel.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pychromecast_14.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychr=
omecast_14.0.9.bb</a> =3D&gt; <a href=3D"http://python3-pychromecast_14.0.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychromecast_14.0.10.bb<=
/a>} (62%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-=
bump-required-version-to-0.46.1-for-python3-wheel.patch b/meta-python/recip=
es-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.=
1-for-python3-wheel.patch<br>
deleted file mode 100644<br>
index 655b9c08c7..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-re=
quired-version-to-0.46.1-for-python3-wheel.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-From 672b0501526fc7c91725236fc37db82794096832 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 1 Jul 2025 23:14:08 -0700<br>
-Subject: [PATCH] bump required version to 0.46.1 for python3-wheel<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- pyproject.toml | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/pyproject.toml b/pyproject.toml<br>
-index d5a518c..a6a159d 100644<br>
---- a/pyproject.toml<br>
-+++ b/pyproject.toml<br>
-@@ -1,5 +1,5 @@<br>
- [build-system]<br>
--requires =3D [&quot;setuptools&gt;=3D65.6,&lt;81.0&quot;, &quot;wheel&gt;=
=3D0.37.1,&lt;0.46.0&quot;]<br>
-+requires =3D [&quot;setuptools&gt;=3D65.6,&lt;81.0&quot;, &quot;wheel&gt;=
=3D0.37.1,&lt;0.46.2&quot;]<br>
- build-backend =3D &quot;setuptools.build_meta&quot;<br>
- <br>
- [project]<br>
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0002-=
allow-newer-wheel.patch b/meta-python/recipes-devtools/python/python3-pychr=
omecast/0002-allow-newer-wheel.patch<br>
deleted file mode 100644<br>
index 456feb6010..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0002-allow-n=
ewer-wheel.patch<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-From e11eb34d1196a9dc35fef213aeffdfd8e6e29f44 Mon Sep 17 00:00:00 2001<br>
-From: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_=
blank">t.f.g.geelen@gmail.com</a>&gt;<br>
-Date: Sun, 8 Feb 2026 19:14:09 +0100<br>
-Subject: [PATCH] allow newer wheel<br>
-<br>
-Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" ta=
rget=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
-Upstream-Status: Pending<br>
----<br>
- pyproject.toml | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/pyproject.toml b/pyproject.toml<br>
-index 4c98630..75a15da 100644<br>
---- a/pyproject.toml<br>
-+++ b/pyproject.toml<br>
-@@ -1,5 +1,5 @@<br>
- [build-system]<br>
--requires =3D [&quot;setuptools&gt;=3D65.6,&lt;81.0&quot;, &quot;wheel&gt;=
=3D0.37.1,&lt;0.46.2&quot;]<br>
-+requires =3D [&quot;setuptools&gt;=3D65.6,&lt;81.0&quot;, &quot;wheel&gt;=
=3D0.37.1,&lt;0.46.4&quot;]<br>
- build-backend =3D &quot;setuptools.build_meta&quot;<br>
- <br>
- [project]<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pychromecast_14.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychro=
mecast_14.0.9.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pychromecast_14.0.10.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-pychromecast_14.0.10.bb</a><br>
similarity index 62%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ychromecast_14.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychrom=
ecast_14.0.9.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyc=
hromecast_14.0.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychrome=
cast_14.0.10.bb</a><br>
index 6f88684f8b..cdd85a550f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pychrom=
ecast_14.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychromecast_=
14.0.9.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pychrom=
ecast_14.0.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-pychromecast=
_14.0.10.bb</a><br>
@@ -3,11 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/balloob/p=
ychromecast" rel=3D"noreferrer" target=3D"_blank">https://github.com/balloo=
b/pychromecast</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db1dbd4e85f47b389bdade=
e9c694669f5&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-bump-required-version-to-0.46.1-for-python3=
-wheel.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-allow-newer-wheel.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;fe78841b0b04aa107d08aed216e91ab9cfb54b11d089d=
382be4e987e3631d4a6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f05a1c8d727d4f104c8c731688053033e05157f2ab81b=
c8eef50ec0c62f9373c&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125412): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125412" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125412</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118406719/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118406719/1997914</a><br>
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

--0000000000006aaf8c064d6637bb--

