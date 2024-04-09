Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7834ACD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 10:00:59 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.132914.1712656851790825339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 03:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lsp+X/wz;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-479e51438c0so839367137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712656851; x=1713261651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RhIF0IUmJrHWbAlLGa+9j6pr6mtVeVCTK2yGfGNm/RM=;
        b=lsp+X/wzcNY6XAYLNO6M8YlIP80sGyTfpD1EyNPYhTxi49oTLMubqvQO+/Ku4YSDGu
         4TPmlLdSc3UnNaUBPRVen0BJkw5M2JjaY+6XGhCgITMI9pUkqxZvr8pGKsNgDNIbpm2w
         3Dz7y09dLWau1Zj/lPKPRBpyDG+MB2QiKyuta8d/KKAeGt6gJWdp50qKlHOxH3qwSms1
         i8SK5nqBov5eTU0vQpIVxyaq9ga8N9eHXZzhvvJoCzmar27Ek+BfoqGKjBn8aFSiWzrj
         XQCZLp+6+o0QGX/hUKeo8Kj/HYtkuII+P/xDSOUj3+Tge+We/Z/4bgLW905XNMg2U19e
         cCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656851; x=1713261651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhIF0IUmJrHWbAlLGa+9j6pr6mtVeVCTK2yGfGNm/RM=;
        b=EI93Nu1XB51HD+a+xZWTd3sp6LMyTuw9mGYcpzhQMqkgF3fHyDkroJu8dvKcudAXSX
         vs1ZxJjKPR/DFpoNJtZ5NPLBvCs8blbTt79PrK+qqMYlD8NzYvfGRJycZck4fop+BqMS
         liKzLZF3GeqN4mrIix75YJAVGkCckTYOWh+mwJUKyydJK5qt8wFgnt6tW6HULTHPu4tW
         r40dPEJLqEh2IzZdch2vBYd49R0mxmDlU0zL/Cfigq4mt1YNPNMz+tShFF2COEZtSy7D
         9DGBC7zJS9XiK6VhVwtf97BUwYG+S5bGAp+/E3612oh0rRHJoYmaK7codFid2TZz71ya
         skzw==
X-Gm-Message-State: AOJu0YzE3B9ezDCyK8riaQ4lFincAxNxkWo4rVbH6Jxl8CboAypCd77k
	GJ1eMgaI5BJo8joPBpEPw3GYNOsWmja1glydFgiZVIcMVDcuL0C1ouongFz8+Dbf9fhKQ1dRFdV
	kIQwgXiUSFL+8OKL1a/SgKgWJFzk=
X-Google-Smtp-Source: AGHT+IH426XzO+s44u2xGewGk5t+hdgWQ0T3X7RxT21MgzcTOK80/rlxWo2XuZ7h5Bv+qosSOKwVPlvCixhL6Kf2Hzs=
X-Received: by 2002:a05:6102:f09:b0:47a:1cdb:6f78 with SMTP id
 v9-20020a0561020f0900b0047a1cdb6f78mr350124vss.27.1712656849989; Tue, 09 Apr
 2024 03:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240409075444.27196-1-fathi.boudra@linaro.org>
In-Reply-To: <20240409075444.27196-1-fathi.boudra@linaro.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Apr 2024 11:00:39 +0100
Message-ID: <CANPvuR==LDTbWyNLAkANhzhmv8CZg3OSbDTxs4De0dKd_m=mjA@mail.gmail.com>
Subject: Re: [PATCH] [oe][meta-filesystem][PATCH v2] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002a78b50615a6ff94"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 10:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109877

--0000000000002a78b50615a6ff94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fathi Boudra <fathi.boudra@linaro.org> escreveu (ter=C3=A7a, 9/04/2024 =C3=
=A0(s)
08:54):

> Tools to handle creating and mounting composefs images
>
> Flexible mechanism to support read-only mountable filesystem trees,
> stacking on top of Linux filesystem.
>
> It will allow to enable filesystem integrity by leveraging the stack:
> ostree -> composefs -> fs-verity
>
> For reference:
>
> https://github.com/containers/composefs?tab=3Dreadme-ov-file#filesystem-i=
ntegrity
> https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostree
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>
> Changes since v1:
>  * move the recipe to meta-filesystem due to fuse3 dependency.
>  * add a patch to support latest musl due to the basename function
>
> https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb=
64470881e86a92e7
>
>  .../composefs/composefs_1.0.3.bb              | 23 ++++++
>  ...e-portable-implementation-for-basena.patch | 75 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 meta-filesystems/recipes-support/composefs/
> composefs_1.0.3.bb
>  create mode 100644
> meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-p=
ortable-implementation-for-basena.patch
>
> diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.b=
b
> b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
> new file mode 100644
> index 0000000000..7607b0a12c
> --- /dev/null
> +++ b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Tools to handle creating and mounting composefs images"
> +HOMEPAGE =3D "https://github.com/containers/composefs"
> +LICENSE =3D "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
> +LIC_FILES_CHKSUM =3D "\
> +    file://BSD-2-Clause.txt;md5=3D121c8a0a8fa5961a26b7863034ebcce8 \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.Apache-2.0;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> +"
> +DEPENDS =3D "fuse3 openssl"
> +SRCREV =3D "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
> +PV =3D "1.0.3"
> +
> +SRC_URI =3D "\
> +    git://github.com/containers/composefs.git;protocol=3Dhttps;branch=3D=
main
> \
> +
> file://0001-musl-basename-use-portable-implementation-for-basena.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> diff --git
> a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use=
-portable-implementation-for-basena.patch
> b/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use=
-portable-implementation-for-basena.patch
> new file mode 100644
> index 0000000000..49a0b21c6e
> --- /dev/null
> +++
> b/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use=
-portable-implementation-for-basena.patch
> @@ -0,0 +1,75 @@
> +From b21a9d4f10a066cac76bb345d31fdd24afcf3e6f Mon Sep 17 00:00:00 2001
> +From: Fathi Boudra <fathi.boudra@linaro.org>
> +Date: Tue, 9 Apr 2024 08:47:37 +0200
> +Subject: [PATCH] musl: basename: use portable implementation for basenam=
e
> API
> +
> +musl has removed the non-prototype declaration of basename from string.h
> which
> +now results in build errors with newer clang compilers.
> +
> +Implement GNU basename behavior using strchr which is portable across
> libcs.
> +
> +Fixes:
> +| ../../git/tools/mountcomposefs.c:43:20:
> +| error: call to undeclared function 'basename'; ISO C99 and later do no=
t
> +| support implicit function declarations [-Wimplicit-function-declaratio=
n]
> +|    43 |         const char *bin =3D basename(argv0);
> +|       |                           ^
> +| ../../git/tools/mountcomposefs.c:43:14:
> +| error: incompatible integer to pointer conversion initializing 'const
> char *'
> +| with an expression of type 'int' [-Wint-conversion]
> +|    43 |         const char *bin =3D basename(argv0);
> +|       |                     ^     ~~~~~~~~~~~~~~~
> +
> +For reference:
> +
> https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb=
64470881e86a92e7
> +
> +Closes: https://github.com/containers/composefs/issues/272
> +
> +Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> +
> +Upstream-Status: Submitted [
> https://github.com/containers/composefs/pull/273]
> +---
> + libcomposefs/lcfs-utils.h |    6 ++++++
> + tools/mkcomposefs.c       |    2 +-
> + tools/mountcomposefs.c    |    3 ++-
> + 3 files changed, 9 insertions(+), 2 deletions(-)
> +
> +--- a/tools/mountcomposefs.c
> ++++ b/tools/mountcomposefs.c
> +@@ -37,10 +37,11 @@
> + #include <linux/fsverity.h>
> +
> + #include "libcomposefs/lcfs-mount.h"
> ++#include "libcomposefs/lcfs-utils.h"
>

Hi Fathi,

Maybe just the #include <libgen.h> can do the job.

It includes the posix implementation of the basename
https://man7.org/linux/man-pages/man0/libgen.h.0p.html

Added the same comment on the github PR.

Jose

+
> + static void usage(const char *argv0)
> + {
> +-      const char *bin =3D basename(argv0);
> ++      const char *bin =3D gnu_basename(argv0);
> +       fprintf(stderr,
> +               "usage: %s [-t type] [-o opt[,opts..]] IMAGE MOUNTPOINT\n=
"
> +               "Example:\n"
> +--- a/libcomposefs/lcfs-utils.h
> ++++ b/libcomposefs/lcfs-utils.h
> +@@ -161,4 +161,10 @@ static inline void *steal_pointer(void *
> + /* type safety */
> + #define steal_pointer(pp) (0 ? (*(pp)) : (steal_pointer)(pp))
> +
> ++static inline const char *gnu_basename(const char *filename)
> ++{
> ++      const char *p =3D strrchr(filename, '/');
> ++      return p ? p+1 : filename;
> ++}
> ++
> + #endif
> +--- a/tools/mkcomposefs.c
> ++++ b/tools/mkcomposefs.c
> +@@ -315,7 +315,7 @@ static int fill_store(struct lcfs_node_s
> +
> + static void usage(const char *argv0)
> + {
> +-      const char *bin =3D basename(argv0);
> ++      const char *bin =3D gnu_basename(argv0);
> +       fprintf(stderr,
> +               "Usage: %s [OPTIONS] SOURCE IMAGE\n"
> +               "Options:\n"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109876):
> https://lists.openembedded.org/g/openembedded-devel/message/109876
> Mute This Topic: https://lists.openembedded.org/mt/105417917/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002a78b50615a6ff94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Fathi Boudra &lt;<a href=3D"mailto:fa=
thi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; escreveu (ter=C3=A7a=
, 9/04/2024 =C3=A0(s) 08:54):<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Tools to handle creating and mounting composefs images<br>
<br>
Flexible mechanism to support read-only mountable filesystem trees,<br>
stacking on top of Linux filesystem.<br>
<br>
It will allow to enable filesystem integrity by leveraging the stack:<br>
ostree -&gt; composefs -&gt; fs-verity<br>
<br>
For reference:<br>
<a href=3D"https://github.com/containers/composefs?tab=3Dreadme-ov-file#fil=
esystem-integrity" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
containers/composefs?tab=3Dreadme-ov-file#filesystem-integrity</a><br>
<a href=3D"https://ostreedev.github.io/ostree/composefs/#using-composefs-wi=
th-ostree" rel=3D"noreferrer" target=3D"_blank">https://ostreedev.github.io=
/ostree/composefs/#using-composefs-with-ostree</a><br>
<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org" =
target=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br>
---<br>
<br>
Changes since v1:<br>
=C2=A0* move the recipe to meta-filesystem due to fuse3 dependency.<br>
=C2=A0* add a patch to support latest musl due to the basename function<br>
=C2=A0 =C2=A0<a href=3D"https://git.musl-libc.org/cgit/musl/commit/?id=3D72=
5e17ed6dff4d0cd22487bb64470881e86a92e7" rel=3D"noreferrer" target=3D"_blank=
">https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb=
64470881e86a92e7</a><br>
<br>
=C2=A0.../composefs/<a href=3D"http://composefs_1.0.3.bb" rel=3D"noreferrer=
" target=3D"_blank">composefs_1.0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 23 ++++++<br>
=C2=A0...e-portable-implementation-for-basena.patch | 75 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 98 insertions(+)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-support/composefs/<a href=
=3D"http://composefs_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">compose=
fs_1.0.3.bb</a><br>
=C2=A0create mode 100644 meta-filesystems/recipes-support/composefs/files/0=
001-musl-basename-use-portable-implementation-for-basena.patch<br>
<br>
diff --git a/meta-filesystems/recipes-support/composefs/<a href=3D"http://c=
omposefs_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb<=
/a> b/meta-filesystems/recipes-support/composefs/<a href=3D"http://composef=
s_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb</a><br>
new file mode 100644<br>
index 0000000000..7607b0a12c<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-support/composefs/<a href=3D"http://composef=
s_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Tools to handle creating and mounting composefs images&q=
uot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/containers/composefs" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/containers/composefs</=
a>&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later &amp; LGPL-2.0-or-later &amp; Apache-2.=
0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://BSD-2-Clause.txt;md5=3D121c8a0a8fa5961a26b7863034ebcc=
e8 \<br>
+=C2=A0 =C2=A0 file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
+=C2=A0 =C2=A0 file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46d=
f6 \<br>
+=C2=A0 =C2=A0 file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \<=
br>
+=C2=A0 =C2=A0 file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br=
>
+=C2=A0 =C2=A0 file://LICENSE.Apache-2.0;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57 \<br>
+&quot;<br>
+DEPENDS =3D &quot;fuse3 openssl&quot;<br>
+SRCREV =3D &quot;2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649&quot;<br>
+PV =3D &quot;1.0.3&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/composefs.git;=
protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">github=
.com/containers/composefs.git;protocol=3Dhttps;branch=3Dmain</a> \<br>
+=C2=A0 =C2=A0 file://0001-musl-basename-use-portable-implementation-for-ba=
sena.patch \<br>
+&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
diff --git a/meta-filesystems/recipes-support/composefs/files/0001-musl-bas=
ename-use-portable-implementation-for-basena.patch b/meta-filesystems/recip=
es-support/composefs/files/0001-musl-basename-use-portable-implementation-f=
or-basena.patch<br>
new file mode 100644<br>
index 0000000000..49a0b21c6e<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-u=
se-portable-implementation-for-basena.patch<br>
@@ -0,0 +1,75 @@<br>
+From b21a9d4f10a066cac76bb345d31fdd24afcf3e6f Mon Sep 17 00:00:00 2001<br>
+From: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org" target=
=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br>
+Date: Tue, 9 Apr 2024 08:47:37 +0200<br>
+Subject: [PATCH] musl: basename: use portable implementation for basename =
API<br>
+<br>
+musl has removed the non-prototype declaration of basename from string.h w=
hich<br>
+now results in build errors with newer clang compilers.<br>
+<br>
+Implement GNU basename behavior using strchr which is portable across libc=
s.<br>
+<br>
+Fixes:<br>
+| ../../git/tools/mountcomposefs.c:43:20:<br>
+| error: call to undeclared function &#39;basename&#39;; ISO C99 and later=
 do not<br>
+| support implicit function declarations [-Wimplicit-function-declaration]=
<br>
+|=C2=A0 =C2=A0 43 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bin =3D b=
asename(argv0);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+| ../../git/tools/mountcomposefs.c:43:14:<br>
+| error: incompatible integer to pointer conversion initializing &#39;cons=
t char *&#39;<br>
+| with an expression of type &#39;int&#39; [-Wint-conversion]<br>
+|=C2=A0 =C2=A0 43 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bin =3D b=
asename(argv0);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~<br>
+<br>
+For reference:<br>
+<a href=3D"https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d=
0cd22487bb64470881e86a92e7" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb64470881e86a=
92e7</a><br>
+<br>
+Closes: <a href=3D"https://github.com/containers/composefs/issues/272" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/containers/composefs/i=
ssues/272</a><br>
+<br>
+Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org"=
 target=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/containers/compo=
sefs/pull/273" rel=3D"noreferrer" target=3D"_blank">https://github.com/cont=
ainers/composefs/pull/273</a>]<br>
+---<br>
+ libcomposefs/lcfs-utils.h |=C2=A0 =C2=A0 6 ++++++<br>
+ tools/mkcomposefs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
+ tools/mountcomposefs.c=C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 ++-<br>
+ 3 files changed, 9 insertions(+), 2 deletions(-)<br>
+<br>
+--- a/tools/mountcomposefs.c<br>
++++ b/tools/mountcomposefs.c<br>
+@@ -37,10 +37,11 @@<br>
+ #include &lt;linux/fsverity.h&gt;<br>
+ <br>
+ #include &quot;libcomposefs/lcfs-mount.h&quot;<br>
++#include &quot;libcomposefs/lcfs-utils.h&quot;<br></blockquote><div><br><=
/div><div>Hi Fathi,<br><br>Maybe just the #include &lt;libgen.h&gt; can do =
the job.<br><br>It includes the posix implementation of the basename<br><a =
href=3D"https://man7.org/linux/man-pages/man0/libgen.h.0p.html">https://man=
7.org/linux/man-pages/man0/libgen.h.0p.html</a></div><div><br></div><div>Ad=
ded the same comment on the github PR.</div><div><br></div><div>Jose</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ <br>
+ static void usage(const char *argv0)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 const char *bin =3D basename(argv0);<br>
++=C2=A0 =C2=A0 =C2=A0 const char *bin =3D gnu_basename(argv0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;usage: %s [-t=
 type] [-o opt[,opts..]] IMAGE MOUNTPOINT\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Example:\n&qu=
ot;<br>
+--- a/libcomposefs/lcfs-utils.h<br>
++++ b/libcomposefs/lcfs-utils.h<br>
+@@ -161,4 +161,10 @@ static inline void *steal_pointer(void *<br>
+ /* type safety */<br>
+ #define steal_pointer(pp) (0 ? (*(pp)) : (steal_pointer)(pp))<br>
+ <br>
++static inline const char *gnu_basename(const char *filename)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *p =3D strrchr(filename, &#39;/&#39;);<br=
>
++=C2=A0 =C2=A0 =C2=A0 return p ? p+1 : filename;<br>
++}<br>
++<br>
+ #endif<br>
+--- a/tools/mkcomposefs.c<br>
++++ b/tools/mkcomposefs.c<br>
+@@ -315,7 +315,7 @@ static int fill_store(struct lcfs_node_s<br>
+ <br>
+ static void usage(const char *argv0)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 const char *bin =3D basename(argv0);<br>
++=C2=A0 =C2=A0 =C2=A0 const char *bin =3D gnu_basename(argv0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Usage: %s [OP=
TIONS] SOURCE IMAGE\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Options:\n&qu=
ot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109876): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109876" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109876</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105417917/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105417917/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000002a78b50615a6ff94--

