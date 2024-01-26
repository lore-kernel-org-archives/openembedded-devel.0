Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6B2C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 04:54:09 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.8803.1706244839949565003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jan 2024 20:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcPsgVBi;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2142ef4a7feso203290fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 20:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706244839; x=1706849639; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pGOZWo/4tTvHMxI8lOvxrLLC8AATi2y+mgNqEKTwBg=;
        b=GcPsgVBi5kHSHPjMZShhtbSgTiMlRVv6GNGge0vQBquN8m3WxRI22D2VYVQvxFRE3F
         EmIJBr9WLhwFTr64twe084oGD90Xks5IzYsqZPaxO9rfl5AJf0Jk+Pr8OWBCz51jh/eu
         jGLKXNdo+e2SF4AxB74NCc75QGE+L+4o3WKkHVTttxYdrmKnVWgWkpCzIRzFb35Q3zJB
         rgcTGmKYcTIuYNHxbNSgfP2Xny2tpSjvxqxovCkvAxGVbB5x9kS1qmu0nIBBezWJZXfz
         bDIRGGYjwyNHzuBl6WD+YyWWQ4SjDCsk/4bmQyGWQMs2IqcZEBQatwYD/peMpO4s8tNg
         ABXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706244839; x=1706849639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pGOZWo/4tTvHMxI8lOvxrLLC8AATi2y+mgNqEKTwBg=;
        b=LcDhEdW4aogLtQDfwBmqJwG/0XdeAve4LKEskabpULJL4/xzna8/d4nKpBr6DburDB
         eJy984kZCO+0FNrw81MZmJ6OrXIZRb99VgTnoP8IUA4c1bUudCbrt/J+i0lI4WYoVBZx
         EoiLnx7KGfrvbbnbpXwl1e62DGzv09Lx4kZwPxlV+ffTzHSBeugp8VEpUYvmLmjLrwqJ
         4unzddRjUfuepU70UhvuO4u6AtyccFKCb26T5pcT88+3Q3PVLxvv71+HoPMFwBLW4mzD
         lHMHXRhO6//fbw4QUlsEp8sgjoryKE3kjU0LJ0ZHmTkdYNa3eC8IoMyAjX43Ch5U7yqw
         fUYw==
X-Gm-Message-State: AOJu0YxHKZp29pbANIkGnWJ+gm+pMdj2jVaC+ll/v3MYAhrrrHPrh7Xb
	YMQbbcGhC2K60zsaT2p+FCVh+io6luLzXLWpAhGw+icplBu4VhWH6v9PoG4J8B08vRgMsHk9RSJ
	z2+//VLjLfc4Lxja+N5j3o1Q5gA70BXUxjnpZ5A==
X-Google-Smtp-Source: AGHT+IHus/J4bOUg3AlteaxLbWCIs0mjp+Pf4mXpdnZHvQCeDW7PKozuB25ayC3eSSCZK2pHN9yTYdqjBOJUdiKTyMI=
X-Received: by 2002:a05:6870:c993:b0:206:b96f:be9f with SMTP id
 hi19-20020a056870c99300b00206b96fbe9fmr794702oab.32.1706244838365; Thu, 25
 Jan 2024 20:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20240124215938.2030548-1-denis@denix.org>
In-Reply-To: <20240124215938.2030548-1-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jan 2024 20:53:32 -0800
Message-ID: <CAMKF1srAw3TyPtG1bS+65C9ZvgZkE6scF4t06ACxB+BLXAAC5Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] libcamera: update 0.1.0 -> 0.2.0
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 04:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108455

seeing this build error on qemux86/clang

https://errors.yoctoproject.org/Errors/Details/751233/

On Wed, Jan 24, 2024 at 1:59=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:
>
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Changelog:
> https://git.libcamera.org/libcamera/libcamera.git/tag/?h=3Dv0.2.0
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../0001-mojom-Drop-using-imp-module.patch    | 176 ------------------
>  ...{libcamera_0.1.0.bb =3D> libcamera_0.2.0.bb} |   4 +-
>  2 files changed, 1 insertion(+), 179 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-mojom-Drop-using-imp-module.patch
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.1.0.bb =
=3D> libcamera_0.2.0.bb} (95%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
mojom-Drop-using-imp-module.patch b/meta-multimedia/recipes-multimedia/libc=
amera/libcamera/0001-mojom-Drop-using-imp-module.patch
> deleted file mode 100644
> index b07a79059..000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-D=
rop-using-imp-module.patch
> +++ /dev/null
> @@ -1,176 +0,0 @@
> -From 23a9bbb9ab380344c5daf5bc0109fab249e41afd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Dec 2023 10:55:44 -0800
> -Subject: [PATCH] mojom: Drop using imp module.
> -
> -This module is gone in python 3.12 onwards, in most places it is unused
> -so remove from those places, in some places where its still is needed
> -replace it with importlib.util
> -
> -Fixes [1]
> -
> -[1] https://bugs.libcamera.org/show_bug.cgi?id=3D206
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2023-December/039986.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py        | 1 -
> - .../ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py | 1 -
> - .../tools/mojom/mojom/generate/generator_unittest.py       | 7 ++-----
> - .../tools/mojom/mojom/generate/translate_unittest.py       | 1 -
> - .../mojo/public/tools/mojom/mojom/parse/ast_unittest.py    | 1 -
> - .../mojom/mojom/parse/conditional_features_unittest.py     | 7 ++-----
> - utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py     | 1 -
> - .../mojo/public/tools/mojom/mojom/parse/lexer_unittest.py  | 6 ++----
> - .../mojo/public/tools/mojom/mojom/parse/parser_unittest.py | 1 -
> - 9 files changed, 6 insertions(+), 20 deletions(-)
> -
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py b/utils=
/ipc/mojo/public/tools/mojom/mojom/fileutil.py
> -index bf626f54..e1c823da 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
> -@@ -3,7 +3,6 @@
> - # found in the LICENSE file.
> -
> - import errno
> --import imp
> - import os.path
> - import sys
> -
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.p=
y b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
> -index ff5753a2..e754151f 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
> -@@ -2,7 +2,6 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> - import os.path
> - import shutil
> - import sys
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_=
unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_un=
ittest.py
> -index 32c884a8..6cae6092 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittes=
t.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittes=
t.py
> -@@ -2,7 +2,7 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> -+import importlib.util
> - import os.path
> - import sys
> - import unittest
> -@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
> -     if tail =3D=3D dirname:
> -       return path
> -
> --
> --try:
> --  imp.find_module("mojom")
> --except ImportError:
> -+if importlib.util.find_spec("mojom") is None:
> -   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
> - from mojom.generate import generator
> -
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_=
unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_un=
ittest.py
> -index 19905c8a..09724d88 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittes=
t.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittes=
t.py
> -@@ -2,7 +2,6 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> - import os.path
> - import sys
> - import unittest
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.=
py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
> -index 62798631..4ab51033 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
> -@@ -2,7 +2,6 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> - import os.path
> - import sys
> - import unittest
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_f=
eatures_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditi=
onal_features_unittest.py
> -index aa609be7..f3c2c95f 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features=
_unittest.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features=
_unittest.py
> -@@ -2,7 +2,7 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> -+import importlib.util
> - import os
> - import sys
> - import unittest
> -@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
> -     if tail =3D=3D dirname:
> -       return path
> -
> --
> --try:
> --  imp.find_module('mojom')
> --except ImportError:
> -+if importlib.util.find_spec("mojom") is None:
> -   sys.path.append(os.path.join(_GetDirAbove('pylib'), 'pylib'))
> - import mojom.parse.ast as ast
> - import mojom.parse.conditional_features as conditional_features
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py b/ut=
ils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
> -index 3e084bbf..1e8b49f2 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
> -@@ -2,7 +2,6 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> - import os.path
> - import sys
> -
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittes=
t.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
> -index eadc6587..77976507 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
> -@@ -2,7 +2,7 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> -+import importlib.util
> - import os.path
> - import sys
> - import unittest
> -@@ -22,9 +22,7 @@ def _GetDirAbove(dirname):
> - sys.path.insert(1, os.path.join(_GetDirAbove("mojo"), "third_party"))
> - from ply import lex
> -
> --try:
> --  imp.find_module("mojom")
> --except ImportError:
> -+if importlib.util.find_spec("mojom") is None:
> -   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
> - import mojom.parse.lexer
> -
> -diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unitte=
st.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
> -index 6d6b7153..7e8acf43 100644
> ---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
> -+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
> -@@ -2,7 +2,6 @@
> - # Use of this source code is governed by a BSD-style license that can b=
e
> - # found in the LICENSE file.
> -
> --import imp
> - import os.path
> - import sys
> - import unittest
> ---
> -2.43.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> similarity index 95%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> index c8ccff6f4..3fd17f0a8 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> @@ -10,10 +10,9 @@ LIC_FILES_CHKSUM =3D "\
>
>  SRC_URI =3D " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
> -        file://0001-mojom-Drop-using-imp-module.patch \
>  "
>
> -SRCREV =3D "960d0c1e19feaf310321c906e14bd5410c6be629"
> +SRCREV =3D "89227a428a82e724548399d35c98ea89566f9045"
>
>  PE =3D "1"
>
> @@ -73,4 +72,3 @@ FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
>  # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
>  # both 32 and 64 bit file APIs.
>  GLIBC_64BIT_TIME_FLAGS =3D ""
> -
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108452): https://lists.openembedded.org/g/openembedde=
d-devel/message/108452
> Mute This Topic: https://lists.openembedded.org/mt/103942085/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

