Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A55EF48C2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:54:28 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62654.1770951268335988613
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOK/FPp3;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7946a1f2430so5582637b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770951267; cv=none;
        d=google.com; s=arc-20240605;
        b=Fkm0iYqwO/GQ7k2EqU06wtpQIkARN79K4aFgldTVD82Mqvtj/wPqm0mrKOVdGZcZEw
         zpjvBf9RVMSIEvY7/v5EHAykctoE+EeDUNUINlLbvhAdatcAag+cc4CtrugdHbjkL8XW
         cr7H1vA7yXkjqGPXVbgVpghQL4RYcgDeIujkIbTjjYDml76rpTBv9MTmhrE7f5BvetuI
         peUe06Qqpto31sy/Ijtw80x9XR+PMDHrfBTueCZqhL+C0fmJBAHYHt3W1EXsRdjlymvL
         kawkVkTLG5LhXo8mZoGU3FwS3C1gWJrsCEozogjAUZ0rLZjTTXWE634mrThlGQwSHtLI
         /J0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tOPUQ9iffHUboD1gbWGGKG46polg+Ezsfp/qN0YaEqQ=;
        fh=ZS13NFA3hg1F9OmIYe889gfWF5cai5+zNqKwmX79x+M=;
        b=Azf9Ya4Q+J0n+BGoG2dBwxFALEhaJNenJUvlNSxX/w9LZ6v3a/YYb83YOnz7SBX7tC
         HUligSsot0cD1SrXTSGYTZiw5TvNYYOF9rqmJO2sgG+ZySqTmW7oSgQrIDg6FfF1ULKh
         820xHOKi9ERnsj4kakY5/pSJAzyPboWCgDLh0TOZqL/086Ika7BoTr+zWCb0HC2BBhs7
         uUaxX4n7PBFrJd/fFbo2yDDdGSchK+1g+4goRmw28EDY5TS5ViCrEBGrOvjQWPjNqYBa
         bPrxn0TS/pF1HGmat8I6FhTJQ5TMJ2J0jj0pEeZcC608kMRSshw8zcvNjRRdXrVeWL/E
         b5Sg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770951267; x=1771556067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOPUQ9iffHUboD1gbWGGKG46polg+Ezsfp/qN0YaEqQ=;
        b=mOK/FPp3p4InTt/aQMjq0Bi/Kt/1qwplFxL/SrHQkdcH7/NYMrceoXKsLGTvetuUSM
         qq8svW+NswkvTiJ/Be4f1DC6ln6KGBhnkxExNhb9FHd6//xCDcpoovtn86L8urCWRMQN
         OD7n+9yFr/3iJkHRzTUSC0HNW4gV0Jk2yxTdjcSyqOydJMqP1JJAOgs2+Pp+MhfEiOev
         ShGG4OTFk62fRcrRjHlfK97KmGfA1lqmZn1e7rYBHW2MUr/XZc2gS99SwDKI6+czQ9G8
         vemJVEhCodZuRFKTpLm+lIh+qaPSRmOCEawrY3a23SqhMSDSEqDlYzD0BY0W9FvIPbm+
         NMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770951267; x=1771556067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOPUQ9iffHUboD1gbWGGKG46polg+Ezsfp/qN0YaEqQ=;
        b=ifVk27jadhqYqK2BcvczsynpNJQ+I0ewnpArqBkULqj1Mu+NE30CwwUev3N7E/ehUQ
         9iilYHQDfbT8B8SiJ5XLNq7sJS5+HiA0a9b+tplVHk9yOKuZKUqZ4yYVj/4G3W4BF/Qa
         o6I1oMgqC3TEXlnnhuRVB8MB0PzuRfn6BIWenCUdPCK80tUOA+PeBpc6q5Y7M6nx5MpA
         PCzGhEuZoOo2YPSZ8p9HifeFUQnTtsFpDh6BEO0DaxqvXF5E2gbWTyrhaBAWRVsu+yHn
         CSyozGarPfROexOINpHGgsc8f9vO4DWaB90mlo6Mf1h1ULls9L63w9gA6NldU8oL72xM
         jnIg==
X-Forwarded-Encrypted: i=1; AJvYcCX/8cwd+P7LG9F+0Kc10NCv4JwxI3ChsOLG2P4fA6UARR3z1M30I5kE3+mRC6uTuZY1/VWuBiycCYf7tAJ6U4Nts9s=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywx4NjaX19mSi1O2lc7dl/oQ+faTznxK2xxcSevX7ZJfuhD9Khc
	1v5dMzGoyAnoXXP5B97o0DBtIhbdHcC7mrB7kvT31C4dJAd6+Jt2vTGk/ikMJWQHgQBQUa5OUWX
	YlIvuPkQBG9OMKTUokVwuuz9lG+jzbst/QiC9Hp8=
X-Gm-Gg: AZuq6aICFRlRNs12ZSnicS4fB2q/7lYZtbGOt4bT3/sGOZ/VLkjqyAUzIuE1XQ5/3Y0
	6x1Eeq0fS70KG9cRMSTx1+HtcbhXfZihuLTFlTZ2lli5a3bbF2/6/GObGy13+USQ5v6O8Z2IUJU
	zM5DWe6I8sXWYdWXQaR5iwOpJqCSHLMxVpz/LW3N1hOlF0T3a2jquq/vY1RMdU/hKoqI111wdwn
	PnoIq0lYoCxkv91ahGf8Zf8OP8FUcgODcoheB37ZmWFNWttz4jotb8lfWSDKXe67nw06Dr1IGYe
	sFilhTinZNbogCeAJ10M0KWvd+UQWhxAiABLc3uC03IXiUw/u+QbCTpcdX/xJLss/szV5CXD0CZ
	sEvYSUCniTxvKYDukkQQbqsSw
X-Received: by 2002:a05:690c:90:b0:792:7823:734 with SMTP id
 00721157ae682-797a0cb9b5dmr3812877b3.37.1770951267327; Thu, 12 Feb 2026
 18:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
 <20260213023217.19706-6-liuyd.fnst@fujitsu.com> <7036633a-b1a6-4dd3-95d3-0be0ae170a51@gmail.com>
In-Reply-To: <7036633a-b1a6-4dd3-95d3-0be0ae170a51@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Feb 2026 18:54:01 -0800
X-Gm-Features: AZwV_QjefGrVWG9amTmY4thU0awSqk7aZ6spZjqYb75fDOCO0UHiAPa9gUsUvdE
Message-ID: <CAMKF1spAcEYFa6zE-b4wibUqjpZNf3mzGXbPiccnE48cFZoCpw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 5/5] hotdoc : Add new recipe
To: skandigraun@gmail.com
Cc: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000034217b064aabb9d8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124375

--00000000000034217b064aabb9d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 6:45=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> I think this should go to meta-python also, otherwise meta-oe will
> depend on meta-python due to the newly added dependencies (or not?)
>
> On 2/13/26 03:32, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> > 1. Backport following patch to solve build and runtime issue
> >   0001-c_comment_scanner-fix-function-prototypes.patch
> >   0002-avoid-third-party-backports-dependency-on-sufficient.patch
> >   0003-CMake-4-compatibility.patch
> >
> > 2. Add do_configure:prepend() to solve buildpaths QA check
> >   do_package_qa: QA Issue: File
> /usr/lib/python3.14/site-packages/hotdoc/parsers/
> cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains
> reference to TMPDIR [buildpaths]
> >
> > 3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to solve
> buildpaths QA check
> >   do_package_qa:QA Issue: File
> /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c i=
n
> package hotdoc-src contains reference to TMPDIR [buildpaths]
> >
> > 4. Add clang as RDEPENDS for following reason
> >   Hotdoc has some Extensions including c-Extension.
> >   The c-Extension needs llvm and clang in runtime as introduced in doc
> of hotdoc.
> >   https://hotdoc.github.io/c-extension.html#c-extension
> >   "The extension uses Clang to build and walk an AST from the source
> code"
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
> >  ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
> >  .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
> >  ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
> >  .../recipes-devtools/hotdoc/hotdoc_0.17.4.bb  | 28 ++++++++
> >  5 files changed, 210 insertions(+)
> >  create mode 100644
> meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-functio=
n-prototypes.patch
> >  create mode 100644
> meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-d=
ependency-on-sufficient.patch
> >  create mode 100644
> meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> >  create mode 100644
> meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-Flex=
Extension.patch
> >  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> >
> > diff --git
> a/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-funct=
ion-prototypes.patch
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-funct=
ion-prototypes.patch
> > new file mode 100644
> > index 0000000000..c26dde93b3
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-funct=
ion-prototypes.patch
> > @@ -0,0 +1,32 @@
> > +Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes
> > +
> > +scanner.l: Fix compile error as the following:
> > +
> >
> +python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_sca=
nner/scanner.l:126:1:
> error: conflicting types for 'parse_comment'; have 'int(PyObject *)' {aka
> 'int(struct _object *)'}
> > +|   126 | parse_comment (PyObject *comments)
> > +
> > +Upstream-Status: Backport [
> https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b47862a0a9a5882=
4b6a421
> ]
> > +
> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> > + hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l
> b/hotdoc/parsers/c_comment_scanner/scanner.l
> > +index 0408601..7bccd64 100644
> > +--- a/hotdoc/parsers/c_comment_scanner/scanner.l
> > ++++ b/hotdoc/parsers/c_comment_scanner/scanner.l
> > +@@ -34,8 +34,8 @@
> > + extern int yylex (PyObject *comments);
> > + #define YY_DECL int yylex (PyObject *comments)
> > + static int yywrap (void);
> > +-static int parse_comment ();
> > +-static int parse_define ();
> > ++static int parse_comment (PyObject *);
> > ++static int parse_define (PyObject *);
> > + %}
> > +
> > + %option nounput
> > +--
> > +2.43.0
> > +
> > diff --git
> a/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports=
-dependency-on-sufficient.patch
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports=
-dependency-on-sufficient.patch
> > new file mode 100644
> > index 0000000000..560d1257f0
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports=
-dependency-on-sufficient.patch
> > @@ -0,0 +1,72 @@
> > +Subject: [PATCH 2/2] avoid third-party backports dependency on
> sufficiently
> > + new python
> > +
> > +`backports.entry_points_selectable` backports functionality from pytho=
n
> > +3.10 to older versions of python.
> > +
> > +Backport this patch to solve runtime backports import problem as
> following:
> > +  File "/usr/lib/python3.14/site-packages/hotdoc/utils/utils.py", line
> 38, in <module>
> > +  from backports.entry_points_selectable import entry_points
> > +ModuleNotFoundError: No module named 'backports'
> > +
> > +Upstream-Status: Backport [
> https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c8232280581598b875=
073ded7
> ]
> > +
> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> > + hotdoc/extensions/gi/utils.py | 6 +++++-
> > + hotdoc/utils/utils.py         | 6 +++++-
> > + setup.py                      | 2 +-
> > + 3 files changed, 11 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/hotdoc/extensions/gi/utils.py
> b/hotdoc/extensions/gi/utils.py
> > +index 159c2b6..91902cb 100644
> > +--- a/hotdoc/extensions/gi/utils.py
> > ++++ b/hotdoc/extensions/gi/utils.py
> > +@@ -1,9 +1,13 @@
> > + import os
> > + from collections import namedtuple
> > + import pathlib
> > ++import sys
> > + import traceback
> > +
> > +-from backports.entry_points_selectable import entry_points
> > ++if sys.version_info >=3D (3, 10):
> > ++    from importlib.metadata import entry_points
> > ++else:
> > ++    from backports.entry_points_selectable import entry_points
> > +
> > + from hotdoc.core.links import Link
> > + from hotdoc.utils.loggable import info, debug
> > +diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py
> > +index 518d308..aef657a 100644
> > +--- a/hotdoc/utils/utils.py
> > ++++ b/hotdoc/utils/utils.py
> > +@@ -35,7 +35,11 @@ import importlib.util
> > + from urllib.request import urlretrieve
> > + from pathlib import Path
> > +
> > +-from backports.entry_points_selectable import entry_points
> > ++if sys.version_info >=3D (3, 10):
> > ++    from importlib.metadata import entry_points
> > ++else:
> > ++    from backports.entry_points_selectable import entry_points
> > ++
> > + try:
> > +     import importlib.metadata as meta
> > + except ImportError:
> > +diff --git a/setup.py b/setup.py
> > +index 5d7f131..9ee504d 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -300,7 +300,7 @@ INSTALL_REQUIRES =3D [
> > +     'wheezy.template',
> > +     'toposort>=3D1.4',
> > +     'importlib_metadata; python_version<"3.10"',
> > +-    'backports.entry_points_selectable',
> > ++    'backports.entry_points_selectable; python_version<"3.10"',
> > + ]
> > +
> > + # dbus-deviation requires sphinx, which requires python 3.5
> > +--
> > +2.43.0
> > +
> > diff --git
> a/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> > new file mode 100644
> > index 0000000000..056ad5d340
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> > @@ -0,0 +1,44 @@
> > +Subject: [PATCH] CMake 4 compatibility
> > +
> > +All CMake versions older than 3.10 are deprecated.
> > +
> > +Upstream-Status: Backport [
> https://github.com/MathieuDuponchelle/cmark/commit/bd78193dbff98c3860e776=
29b5c7bfee6169d1da
> ]
> > +
> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> > + CMakeLists.txt            | 11 ++---------
> > + extensions/CMakeLists.txt |  2 +-
> > + 2 files changed, 3 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index ff97419..45fdf6c 100755
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,12 +1,5 @@
> > +-cmake_minimum_required(VERSION 2.8.9)
> > +-
> > +-# prevent ugly developer warnings because version is set directly, no=
t
> through project()
> > +-# it should be redone properly by using VERSION in project() if on
> CMake 3.x
> > +-if(CMAKE_MAJOR_VERSION GREATER 2)
> > +-    cmake_policy(SET CMP0048 OLD)
> > +-endif()
> > +-
> > +-project(cmark)
> > ++cmake_minimum_required(VERSION 3.10)
> > ++project(cmark VERSION 0.28.3)
> > +
> > + include("FindAsan.cmake")
> > +
> > +diff --git a/extensions/CMakeLists.txt b/extensions/CMakeLists.txt
> > +index e62d155..b6a1556 100644
> > +--- a/extensions/CMakeLists.txt
> > ++++ b/extensions/CMakeLists.txt
> > +@@ -1,4 +1,4 @@
> > +-cmake_minimum_required(VERSION 2.8)
> > ++cmake_minimum_required(VERSION 3.10)
> > + set(LIBRARY "cmarkextensions")
> > + set(LIBRARY_SOURCES
> > +     core-extensions.c
> > +--
> > +2.43.0
> > +
> > diff --git
> a/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-Fl=
exExtension.patch
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-Fl=
exExtension.patch
> > new file mode 100644
> > index 0000000000..ae8c2ef3e7
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-Fl=
exExtension.patch
> > @@ -0,0 +1,34 @@
> > +Subject: [PATCH] Make path to relative in FlexExtension
> > +
> > +To fix following do_package QA Issue:
> > +
> > +do_package_qa:QA Issue: File
> /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c i=
n
> package hotdoc-src contains reference to TMPDIR [buildpaths]
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
> > +
>




> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> > + setup.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/setup.py b/setup.py
> > +index 9ee504d..fc03c57 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -357,11 +357,11 @@ build_c_extension =3D
> os.environ.get('HOTDOC_BUILD_C_EXTENSION', 'auto')
> > + class FlexExtension (Extension):
> > +     def __init__(self, flex_sources, *args, **kwargs):
> > +         Extension.__init__(self, *args, **kwargs)
> > +-        self.__flex_sources =3D [src(s) for s in flex_sources]
> > ++        self.__flex_sources =3D list(flex_sources)
> > +


how does this appear in sources I wonder if  using flex with
--noline option can be of help here.


> > +     def __build_flex(self):
> > +         src_dir =3D os.path.dirname(self.__flex_sources[0])
> > +-        built_scanner_path =3D src(os.path.join(src_dir, 'scanner.c')=
)
> > ++        built_scanner_path =3D os.path.join(src_dir, 'scanner.c')
> > +
> > +         self.sources.append(built_scanner_path)
> > +         if newer_group(self.__flex_sources, built_scanner_path):
> > +--
> > +2.43.0
> > +
> > diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> > new file mode 100644
> > index 0000000000..6192a78989
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY =3D "Hotdoc is a documentation framework"
> > +DESCRIPTION =3D "Hotdoc is a documentation micro-framework. It provide=
s
> an interface for extensions to plug upon, along with some base objects
> (formatters, ...)"
> > +HOMEPAGE =3D "https://github.com/hotdoc/hotdoc"
> > +
> > +LICENSE =3D "LGPL-2.1-or-later"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D90263a49bc1d9a204656fec4d56=
16c66"
> > +
> > +SRC_URI[sha256sum] =3D
> "c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc"
> > +
> > +SRC_URI =3D "file://0001-c_comment_scanner-fix-function-prototypes.pat=
ch \
> > +
>  file://0002-avoid-third-party-backports-dependency-on-sufficient.patch \
> > +           file://0003-CMake-4-compatibility.patch;patchdir=3Dcmark \
> > +          "
> > +
> > +SRC_URI:append:class-target =3D
> "file://0004-Make-path-to-relative-in-FlexExtension.patch"
> > +
> > +DEPENDS +=3D "libxml2 glib-2.0 json-glib"
> > +
> > +inherit pypi python_setuptools_build_meta pkgconfig
> > +
> > +#Fix LIBDIR path to fix buildpaths QA check of hotdoc/parsers/
> cmark.cpython-314-x86_64-linux-gnu.so
> > +do_configure:prepend:class-target() {
> > +    sed -i -e "s#'\"%s\"' %
> CMARK_BUILD_DIR#'\"${PYTHON_SITEPACKAGES_DIR}/${PN}\"'#" ${S}/setup.py
> > +}
> > +
> > +RDEPENDS:${PN} +=3D "clang python3-appdirs python3-cchardet
> python3-dbus-deviation python3-lxml python3-networkx python3-pkgconfig
> python3-pyyaml python3-schema python3-toposort python3-wheezy-template"
> > +
> > +BBCLASSEXTEND =3D "native"
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124372):
> https://lists.openembedded.org/g/openembedded-devel/message/124372
> Mute This Topic: https://lists.openembedded.org/mt/117786773/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000034217b064aabb9d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 12,=
 2026 at 6:45=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I think th=
is should go to meta-python also, otherwise meta-oe will<br>
depend on meta-python due to the newly added dependencies (or not?)<br>
<br>
On 2/13/26 03:32, Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; 1. Backport following patch to solve build and runtime issue<br>
&gt;=C2=A0 =C2=A00001-c_comment_scanner-fix-function-prototypes.patch<br>
&gt;=C2=A0 =C2=A00002-avoid-third-party-backports-dependency-on-sufficient.=
patch<br>
&gt;=C2=A0 =C2=A00003-CMake-4-compatibility.patch<br>
&gt;<br>
&gt; 2. Add do_configure:prepend() to solve buildpaths QA check<br>
&gt;=C2=A0 =C2=A0do_package_qa: QA Issue: File /usr/lib/python3.14/site-pac=
kages/hotdoc/parsers/<a href=3D"http://cmark.cpython-314-x86_64-linux-gnu.s=
o" rel=3D"noreferrer" target=3D"_blank">cmark.cpython-314-x86_64-linux-gnu.=
so</a> in package hotdoc contains reference to TMPDIR [buildpaths]<br>
&gt;<br>
&gt; 3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to solve buil=
dpaths QA check<br>
&gt;=C2=A0 =C2=A0do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/=
hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains r=
eference to TMPDIR [buildpaths]<br>
&gt;<br>
&gt; 4. Add clang as RDEPENDS for following reason<br>
&gt;=C2=A0 =C2=A0Hotdoc has some Extensions including c-Extension.<br>
&gt;=C2=A0 =C2=A0The c-Extension needs llvm and clang in runtime as introdu=
ced in doc of hotdoc.<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://hotdoc.github.io/c-extension.html#c-ext=
ension" rel=3D"noreferrer" target=3D"_blank">https://hotdoc.github.io/c-ext=
ension.html#c-extension</a><br>
&gt;=C2=A0 =C2=A0&quot;The extension uses Clang to build and walk an AST fr=
om the source code&quot;<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com=
" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++<br>
&gt;=C2=A0 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../hotdoc/0003-CMake-4-compatibility.patch=C2=A0 =C2=A0| 44 +++=
+++++++++<br>
&gt;=C2=A0 ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++<br>
&gt;=C2=A0 .../recipes-devtools/hotdoc/<a href=3D"http://hotdoc_0.17.4.bb" =
rel=3D"noreferrer" target=3D"_blank">hotdoc_0.17.4.bb</a>=C2=A0 | 28 ++++++=
++<br>
&gt;=C2=A0 5 files changed, 210 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c=
_comment_scanner-fix-function-prototypes.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0002-a=
void-third-party-backports-dependency-on-sufficient.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0003-C=
Make-4-compatibility.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0004-M=
ake-path-to-relative-in-FlexExtension.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/hotdoc/<a href=3D"ht=
tp://hotdoc_0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">hotdoc_0.17.4.b=
b</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_sca=
nner-fix-function-prototypes.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc=
/0001-c_comment_scanner-fix-function-prototypes.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c26dde93b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fi=
x-function-prototypes.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes<br>
&gt; +<br>
&gt; +scanner.l: Fix compile error as the following:<br>
&gt; +<br>
&gt; +python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_=
scanner/scanner.l:126:1: error: conflicting types for &#39;parse_comment&#3=
9;; have &#39;int(PyObject *)&#39; {aka &#39;int(struct _object *)&#39;}<br=
>
&gt; +|=C2=A0 =C2=A0126 | parse_comment (PyObject *comments)<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/hotdoc/hotdo=
c/commit/adf8518431fafb78c9b47862a0a9a58824b6a421" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b478=
62a0a9a58824b6a421</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l b/hotdoc/pars=
ers/c_comment_scanner/scanner.l<br>
&gt; +index 0408601..7bccd64 100644<br>
&gt; +--- a/hotdoc/parsers/c_comment_scanner/scanner.l<br>
&gt; ++++ b/hotdoc/parsers/c_comment_scanner/scanner.l<br>
&gt; +@@ -34,8 +34,8 @@<br>
&gt; + extern int yylex (PyObject *comments);<br>
&gt; + #define YY_DECL int yylex (PyObject *comments)<br>
&gt; + static int yywrap (void);<br>
&gt; +-static int parse_comment ();<br>
&gt; +-static int parse_define ();<br>
&gt; ++static int parse_comment (PyObject *);<br>
&gt; ++static int parse_define (PyObject *);<br>
&gt; + %}<br>
&gt; + <br>
&gt; + %option nounput<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-p=
arty-backports-dependency-on-sufficient.patch b/meta-oe/recipes-devtools/ho=
tdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..560d1257f0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-ba=
ckports-dependency-on-sufficient.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +Subject: [PATCH 2/2] avoid third-party backports dependency on suffic=
iently<br>
&gt; + new python<br>
&gt; +<br>
&gt; +`backports.entry_points_selectable` backports functionality from pyth=
on<br>
&gt; +3.10 to older versions of python.<br>
&gt; +<br>
&gt; +Backport this patch to solve runtime backports import problem as foll=
owing:<br>
&gt; +=C2=A0 File &quot;/usr/lib/python3.14/site-packages/hotdoc/utils/util=
s.py&quot;, line 38, in &lt;module&gt;<br>
&gt; +=C2=A0 from backports.entry_points_selectable import entry_points<br>
&gt; +ModuleNotFoundError: No module named &#39;backports&#39;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/hotdoc/hotdo=
c/commit/51043c3ef889e36c8232280581598b875073ded7" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c823228=
0581598b875073ded7</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + hotdoc/extensions/gi/utils.py | 6 +++++-<br>
&gt; + hotdoc/utils/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++-<br=
>
&gt; + setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; + 3 files changed, 11 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/hotdoc/extensions/gi/utils.py b/hotdoc/extensions/gi/uti=
ls.py<br>
&gt; +index 159c2b6..91902cb 100644<br>
&gt; +--- a/hotdoc/extensions/gi/utils.py<br>
&gt; ++++ b/hotdoc/extensions/gi/utils.py<br>
&gt; +@@ -1,9 +1,13 @@<br>
&gt; + import os<br>
&gt; + from collections import namedtuple<br>
&gt; + import pathlib<br>
&gt; ++import sys<br>
&gt; + import traceback<br>
&gt; + <br>
&gt; +-from backports.entry_points_selectable import entry_points<br>
&gt; ++if sys.version_info &gt;=3D (3, 10):<br>
&gt; ++=C2=A0 =C2=A0 from importlib.metadata import entry_points<br>
&gt; ++else:<br>
&gt; ++=C2=A0 =C2=A0 from backports.entry_points_selectable import entry_po=
ints<br>
&gt; + <br>
&gt; + from hotdoc.core.links import Link<br>
&gt; + from hotdoc.utils.loggable import info, debug<br>
&gt; +diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py<br>
&gt; +index 518d308..aef657a 100644<br>
&gt; +--- a/hotdoc/utils/utils.py<br>
&gt; ++++ b/hotdoc/utils/utils.py<br>
&gt; +@@ -35,7 +35,11 @@ import importlib.util<br>
&gt; + from urllib.request import urlretrieve<br>
&gt; + from pathlib import Path<br>
&gt; + <br>
&gt; +-from backports.entry_points_selectable import entry_points<br>
&gt; ++if sys.version_info &gt;=3D (3, 10):<br>
&gt; ++=C2=A0 =C2=A0 from importlib.metadata import entry_points<br>
&gt; ++else:<br>
&gt; ++=C2=A0 =C2=A0 from backports.entry_points_selectable import entry_po=
ints<br>
&gt; ++<br>
&gt; + try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0import importlib.metadata as meta<br>
&gt; + except ImportError:<br>
&gt; +diff --git a/setup.py b/setup.py<br>
&gt; +index 5d7f131..9ee504d 100644<br>
&gt; +--- a/setup.py<br>
&gt; ++++ b/setup.py<br>
&gt; +@@ -300,7 +300,7 @@ INSTALL_REQUIRES =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;wheezy.template&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;toposort&gt;=3D1.4&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;importlib_metadata; python_version&lt;&quot;=
3.10&quot;&#39;,<br>
&gt; +-=C2=A0 =C2=A0 &#39;backports.entry_points_selectable&#39;,<br>
&gt; ++=C2=A0 =C2=A0 &#39;backports.entry_points_selectable; python_version=
&lt;&quot;3.10&quot;&#39;,<br>
&gt; + ]<br>
&gt; + <br>
&gt; + # dbus-deviation requires sphinx, which requires python 3.5<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compa=
tibility.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compat=
ibility.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..056ad5d340<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibilit=
y.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +Subject: [PATCH] CMake 4 compatibility<br>
&gt; +<br>
&gt; +All CMake versions older than 3.10 are deprecated.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/MathieuDupon=
chelle/cmark/commit/bd78193dbff98c3860e77629b5c7bfee6169d1da" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/MathieuDuponchelle/cmark/commit/=
bd78193dbff98c3860e77629b5c7bfee6169d1da</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++-----=
----<br>
&gt; + extensions/CMakeLists.txt |=C2=A0 2 +-<br>
&gt; + 2 files changed, 3 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index ff97419..45fdf6c 100755<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -1,12 +1,5 @@<br>
&gt; +-cmake_minimum_required(VERSION 2.8.9)<br>
&gt; +-<br>
&gt; +-# prevent ugly developer warnings because version is set directly, n=
ot through project()<br>
&gt; +-# it should be redone properly by using VERSION in project() if on C=
Make 3.x<br>
&gt; +-if(CMAKE_MAJOR_VERSION GREATER 2)<br>
&gt; +-=C2=A0 =C2=A0 cmake_policy(SET CMP0048 OLD)<br>
&gt; +-endif()<br>
&gt; +-<br>
&gt; +-project(cmark)<br>
&gt; ++cmake_minimum_required(VERSION 3.10)<br>
&gt; ++project(cmark VERSION 0.28.3)<br>
&gt; + <br>
&gt; + include(&quot;FindAsan.cmake&quot;)<br>
&gt; + <br>
&gt; +diff --git a/extensions/CMakeLists.txt b/extensions/CMakeLists.txt<br=
>
&gt; +index e62d155..b6a1556 100644<br>
&gt; +--- a/extensions/CMakeLists.txt<br>
&gt; ++++ b/extensions/CMakeLists.txt<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-cmake_minimum_required(VERSION 2.8)<br>
&gt; ++cmake_minimum_required(VERSION 3.10)<br>
&gt; + set(LIBRARY &quot;cmarkextensions&quot;)<br>
&gt; + set(LIBRARY_SOURCES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0core-extensions.c<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-=
relative-in-FlexExtension.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/00=
04-Make-path-to-relative-in-FlexExtension.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ae8c2ef3e7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relativ=
e-in-FlexExtension.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +Subject: [PATCH] Make path to relative in FlexExtension<br>
&gt; +<br>
&gt; +To fix following do_package QA Issue:<br>
&gt; +<br>
&gt; +do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/pars=
ers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to=
 TMPDIR [buildpaths]<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-specific]<br>
&gt; +<br></blockquote><div><br></div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; +Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + setup.py | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/setup.py b/setup.py<br>
&gt; +index 9ee504d..fc03c57 100644<br>
&gt; +--- a/setup.py<br>
&gt; ++++ b/setup.py<br>
&gt; +@@ -357,11 +357,11 @@ build_c_extension =3D os.environ.get(&#39;HOTDO=
C_BUILD_C_EXTENSION&#39;, &#39;auto&#39;)<br>
&gt; + class FlexExtension (Extension):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def __init__(self, flex_sources, *args, **kwargs)=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Extension.__init__(self, *args, **k=
wargs)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.__flex_sources =3D [src(s) for s in=
 flex_sources]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.__flex_sources =3D list(flex_source=
s)<br>
&gt; +</blockquote><div><br></div><div>how does this appear in sources I wo=
nder if=C2=A0 using flex with --noline=C2=A0option can be of help here.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0def __build_flex(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src_dir =3D os.path.dirname(self.__=
flex_sources[0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 built_scanner_path =3D src(os.path.join(=
src_dir, &#39;scanner.c&#39;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 built_scanner_path =3D os.path.join(src_=
dir, &#39;scanner.c&#39;)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sources.append(built_scanner_p=
ath)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if newer_group(self.__flex_sources,=
 built_scanner_path):<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/hotdoc/<a href=3D"http://hotdoc_=
0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">hotdoc_0.17.4.bb</a> b/meta=
-oe/recipes-devtools/hotdoc/<a href=3D"http://hotdoc_0.17.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">hotdoc_0.17.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6192a78989<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/hotdoc/<a href=3D"http://hotdoc_0.17.4.=
bb" rel=3D"noreferrer" target=3D"_blank">hotdoc_0.17.4.bb</a><br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +SUMMARY =3D &quot;Hotdoc is a documentation framework&quot;<br>
&gt; +DESCRIPTION =3D &quot;Hotdoc is a documentation micro-framework. It p=
rovides an interface for extensions to plug upon, along with some base obje=
cts (formatters, ...)&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/hotdoc/hotdoc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/hotdoc/hotdoc</a>&quot=
;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D90263a49bc1d9a204656f=
ec4d5616c66&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c4d5dff647f03aa87a1d2d06035d2819edd099b9=
1635e3b2ee390829357ae9fc&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;file://0001-c_comment_scanner-fix-function-prototyp=
es.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-avoid-third-part=
y-backports-dependency-on-sufficient.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-CMake-4-compatib=
ility.patch;patchdir=3Dcmark \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +SRC_URI:append:class-target =3D &quot;file://0004-Make-path-to-relati=
ve-in-FlexExtension.patch&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;libxml2 glib-2.0 json-glib&quot;<br>
&gt; +<br>
&gt; +inherit pypi python_setuptools_build_meta pkgconfig<br>
&gt; +<br>
&gt; +#Fix LIBDIR path to fix buildpaths QA check of hotdoc/parsers/<a href=
=3D"http://cmark.cpython-314-x86_64-linux-gnu.so" rel=3D"noreferrer" target=
=3D"_blank">cmark.cpython-314-x86_64-linux-gnu.so</a><br>
&gt; +do_configure:prepend:class-target() {<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s#&#39;\&quot;%s\&quot;&#39; % CMARK_BU=
ILD_DIR#&#39;\&quot;${PYTHON_SITEPACKAGES_DIR}/${PN}\&quot;&#39;#&quot; ${S=
}/setup.py<br>
&gt; +}<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;clang python3-appdirs python3-cchardet pyth=
on3-dbus-deviation python3-lxml python3-networkx python3-pkgconfig python3-=
pyyaml python3-schema python3-toposort python3-wheezy-template&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124372): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124372" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124372</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117786773/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117786773/1997914</a><br>
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

--00000000000034217b064aabb9d8--

