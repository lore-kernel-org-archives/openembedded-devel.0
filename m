Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C60C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 14:34:22 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.21061.1718030058048386759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 07:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8PPQQlm;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-24542b8607fso2306649fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 07:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030057; x=1718634857; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa9Hq10lx/WDU37VFbTXIRhdYyDGjyrytA4ZlkcCY8s=;
        b=M8PPQQlm8v7n/X83Cwmzbgh7cuE5kCDOhm/148VoDNK2YzSNk+KvrfH4HLbeZxeyOR
         A5Id0Bf2G4BMusQtkhA2om/XJbxqSFMRwyggPXVflDdanEVI/+9NKlxx1X55p6S3s0Yg
         Nak2TzoeJ3zOqBBqhW+vXj7w/v98Rua7Yj9VgFPr+UvifDhcLpnoJwwChQVhFe6q6KP+
         wmh+kiNVRxHHVo4VTGUk0ItRLHeR0NR6DL/ku2bRD96U48M7uGxDPuUvriJhD8ic1xgZ
         YmYWqhdM25O+r9u/ILEnFbe7M1auizOf/RWPBuOKDdwSMtK88lVY2UMU75emSPHXcdk/
         ARqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030057; x=1718634857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa9Hq10lx/WDU37VFbTXIRhdYyDGjyrytA4ZlkcCY8s=;
        b=u1oJHj4ns6SA0FgQZExKqLtMFH85wGzyw/8ZqRWSp5LBvGV4i9mhF7BKvetpOrvw3H
         Slbx3Udo5xeHnLZacmFF3Tp7+D77YDzb5tMQwvuLkQCI2+lTfMQt19j78qgny6NGmmJL
         874P80t87TkOfYEWtoETnGr5bMS1mx78IRHthU3ESNhCSkIONQw4LKdppjRz6UWmgoEo
         63UMwQjxhbA/j+09zoa2GpdAb/OgxdFlV7JCdm+sDIWMIm3l84UrmLC0faBSf6Q9whBw
         u72BfoyM6/embO5qil2ig5nkRDNiCT5qKzRMvMUMc4UwGmBZwzkQobUPq9T1iq+hXjrj
         zC/Q==
X-Gm-Message-State: AOJu0YzLeB6NtJHV7EaVCUkMJ6Cf/xJr4nZz1cn2jLTUpYgznpIy4g6K
	XJRZ0RFYGAAMkIUBKTKU6Ak+VpsA+mjefdf7GzLWHgy78RfuuxjiMgYbKLT9VOPLSOYdY6FK06V
	6MFXiv8ld5cxhvBUgqMDBpDgunrc=
X-Google-Smtp-Source: AGHT+IGuGLNmSUkbx/x8GuxFbA+I7GfimIbb6f/cFH9WTK+jNuQQWG63IdXdECFKgti8vXM6luAZRURelUc3nT/1B2g=
X-Received: by 2002:a05:6870:a353:b0:254:a810:cdf with SMTP id
 586e51a60fabf-254a8100ebemr6225492fac.13.1718030057014; Mon, 10 Jun 2024
 07:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240610102455.2252749-1-zboszor@gmail.com>
In-Reply-To: <20240610102455.2252749-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2024 07:34:04 -0700
Message-ID: <CAMKF1soUxJJPbw-_-+28pzv_KQOO=BU60_-kUs_TwCgAPe8A8g@mail.gmail.com>
Subject: Re: [meta-initramfs][PATCH] dracut: Drop an unnecessary patch
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000430ccf061a8a0b56"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110797

--000000000000430ccf061a8a0b56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 3:24=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>
wrote:

> Dropped 0001-util.h-include-sys-reg.h-when-libc-glibc.patch
> that's unnecessary for a long time now, because dracut
> (since version 049) does not rely on __WORDSIZE.
>

Does this still build on musl without this patch


> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ....h-include-sys-reg.h-when-libc-glibc.patch | 35 -------------------
>  .../recipes-devtools/dracut/dracut_102.bb     |  1 -
>  2 files changed, 36 deletions(-)
>  delete mode 100644
> meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg=
.h-when-libc-glibc.patch
>
> diff --git
> a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-r=
eg.h-when-libc-glibc.patch
> b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-r=
eg.h-when-libc-glibc.patch
> deleted file mode 100644
> index 68ec2b8fd..000000000
> ---
> a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-r=
eg.h-when-libc-glibc.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 13 Jul 2017 17:14:05 -0700
> -Subject: [PATCH] util.h: include <sys/reg.h> when libc !=3D glibc
> -
> -For musl libc it is required to include <sys/reg.h> to
> -have __WORDSIZE defined to e.g. 32 for arm*-musl.
> -
> -Taken from void-linux
> -
> https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/pat=
ches/musl-__wordsize.patch
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/install/util.h | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/install/util.h b/src/install/util.h
> -index a6f9a184..82732913 100644
> ---- a/src/install/util.h
> -+++ b/src/install/util.h
> -@@ -36,6 +36,9 @@
> - #include <sys/stat.h>
> - #include <dirent.h>
> - #include <sys/resource.h>
> -+#if !defined(__GLIBC__)
> -+#include <sys/reg.h>
> -+#endif
> -
> - #include "macro.h"
> -
> ---
> -2.17.1
> -
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
> index 496380a0f..39ff265a3 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
> @@ -9,7 +9,6 @@ PE =3D "1"
>
>  SRCREV =3D "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
>  SRC_URI =3D "git://
> github.com/dracut-ng/dracut-ng.git;protocol=3Dhttp;branch=3Dmain \
> -           file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
>
> file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
>             "
>
> --
> 2.45.2
>
>

--000000000000430ccf061a8a0b56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 10, 2024 at 3:24=E2=80=AFAM Zolt=C3=A1n B=C3=B6=
sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dropped 0001-uti=
l.h-include-sys-reg.h-when-libc-glibc.patch<br>
that&#39;s unnecessary for a long time now, because dracut<br>
(since version 049) does not rely on __WORDSIZE.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Does this still =
build on musl without this patch=C2=A0</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0....h-include-sys-reg.h-when-libc-glibc.patch | 35 ------------------=
-<br>
=C2=A0.../recipes-devtools/dracut/<a href=3D"http://dracut_102.bb" rel=3D"n=
oreferrer" target=3D"_blank">dracut_102.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 -<br>
=C2=A02 files changed, 36 deletions(-)<br>
=C2=A0delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001=
-util.h-include-sys-reg.h-when-libc-glibc.patch<br>
<br>
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-incl=
ude-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracu=
t/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch<br>
deleted file mode 100644<br>
index 68ec2b8fd..000000000<br>
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys=
-reg.h-when-libc-glibc.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 13 Jul 2017 17:14:05 -0700<br>
-Subject: [PATCH] util.h: include &lt;sys/reg.h&gt; when libc !=3D glibc<br=
>
-<br>
-For musl libc it is required to include &lt;sys/reg.h&gt; to<br>
-have __WORDSIZE defined to e.g. 32 for arm*-musl.<br>
-<br>
-Taken from void-linux<br>
-<a href=3D"https://github.com/voidlinux/void-packages/blob/master/srcpkgs/=
dracut/patches/musl-__wordsize.patch" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patch=
es/musl-__wordsize.patch</a><br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/install/util.h | 3 +++<br>
- 1 file changed, 3 insertions(+)<br>
-<br>
-diff --git a/src/install/util.h b/src/install/util.h<br>
-index a6f9a184..82732913 100644<br>
---- a/src/install/util.h<br>
-+++ b/src/install/util.h<br>
-@@ -36,6 +36,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;dirent.h&gt;<br>
- #include &lt;sys/resource.h&gt;<br>
-+#if !defined(__GLIBC__)<br>
-+#include &lt;sys/reg.h&gt;<br>
-+#endif<br>
- <br>
- #include &quot;macro.h&quot;<br>
- <br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta-initramfs/recipes-devtools/dracut/<a href=3D"http://dracu=
t_102.bb" rel=3D"noreferrer" target=3D"_blank">dracut_102.bb</a> b/meta-ini=
tramfs/recipes-devtools/dracut/<a href=3D"http://dracut_102.bb" rel=3D"nore=
ferrer" target=3D"_blank">dracut_102.bb</a><br>
index 496380a0f..39ff265a3 100644<br>
--- a/meta-initramfs/recipes-devtools/dracut/<a href=3D"http://dracut_102.b=
b" rel=3D"noreferrer" target=3D"_blank">dracut_102.bb</a><br>
+++ b/meta-initramfs/recipes-devtools/dracut/<a href=3D"http://dracut_102.b=
b" rel=3D"noreferrer" target=3D"_blank">dracut_102.bb</a><br>
@@ -9,7 +9,6 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/dracut-ng/dracut=
-ng.git;protocol=3Dhttp;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank"=
>github.com/dracut-ng/dracut-ng.git;protocol=3Dhttp;branch=3Dmain</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-util.h-include-sys-re=
g.h-when-libc-glibc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-feat-dracut-install-s=
plit-ldd-command-arguments-for-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.45.2<br>
<br>
</blockquote></div></div>

--000000000000430ccf061a8a0b56--

