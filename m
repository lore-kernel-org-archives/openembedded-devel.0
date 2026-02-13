Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8BAEE369A
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:21:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68088.1770974487861271280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vi4l714t;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43284ed32a0so471285f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770974486; x=1771579286; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnPMa4sdVBc35lweerXadXKsKfC0zpob+qQyhavEHMQ=;
        b=Vi4l714tj8mFRmApKThpyWt4mR7en2/fLou4dbdBNlMHf2+wGOkNCyOr1r63zp1I0P
         TzZ2uySHHGfV3rPiCwAMMKEY7J7w/5JDuUWLZS5GXM33sP+1Zfe5+nZ/oJZKGrdwRfuE
         +Lc1dZxr19BxsG2aD+/vVseh68M4EaYXnj1fO4BAMP2CuFV7kYYh/MF8fHFUCPMxERoX
         v1lBPN/hv5uz1pbgyNrrtj9DfpYre4TYrTuw5+GhV5xanIyM40kFB/BrdOi4+/tRpzkA
         7C31i35RYh7xQduFuvPHcGgTFjs64OCk+eGeJvFLbh0TkuJwnjR+XllEQnvF3FLyjvaK
         xJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770974486; x=1771579286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnPMa4sdVBc35lweerXadXKsKfC0zpob+qQyhavEHMQ=;
        b=AeuDBXH0RZrXsfRy0vEvqT/pdYgJechhxdVz1O+CB33MaYyEXDZY4fsEH+Xa88lWUs
         LMYNmhUrwOAxK4MEQ8VmvgWDOhAguXYmV9afois1sBvQckHdqxzUQ/YT+aJWJQmkdCBt
         e/KXOMI96e7iWS0boLTTTZxLp1IEg74Wzv/UnYgVV3ytuzYsdEkJlHg+MQc6cRd66eZB
         AnayP3RkgXObM/zXGhY+0CN2pxZ6pEBuWL4CnabtCgz+ylKEgmMjCI4eRbULFxlMwUiD
         DVUDX9WIWvaaYYfY3XrAv7JnY7H3cxhAIxlg74wV0xFqpvIv7V5RPtNY1CWkzFTyZH93
         sxpQ==
X-Gm-Message-State: AOJu0Yw0NMmzcb73C9O87cvUW4iLfsQZ+Jz/wQ0+IgsTH+RSzV/iwKHK
	+/qnQvXevN5CZQI9Q9vMD5i1/ot9PbJ367FRmLqSevvEc0OpeBZ6lX/j
X-Gm-Gg: AZuq6aLLM3bAD1f09C8MmVJxFO+cQjFEmKIFPAS00kYp7pjb/Q6y3AcmPgiBp6pVuvL
	wuQtCeqInFM9kBfeVCTxbaKU+oUm+bQNs2pVv/IrLaDtfEhzjTWHrTZYIY5yqJw0hLZ+cEtTUpP
	ZtHRUnz+6V9xF1sSngl8BOx7Y7aHwUF/J0c50cukUU7UQZNWr3bukcc6ScCqAls+pQVuJZO9SpT
	EVVXb1f7vsSNCiBk5MetpkmLlFOt1C1K7uJKr3eN0LaOgBWah37mohQoy0mIpYp0tqvs4ucd1G7
	fsLK8CHFZvtpWMvqUKU4WvRzfEeXs6BUQdsUUWnE174f5OSSyVOe1I7a6r6NHnbkdzFnOHQvw3V
	g2SDGxTt+EBfabHkcmYAUauSNpTTM3JYUm5QMJ67aJFt1Y5WcEmX76JVjfu+/xpryFPZ+i9W1Tg
	WIJ88L9gfNuPRlEaEesLbvBar9cxXUHis=
X-Received: by 2002:a05:6000:268a:b0:436:7ab:9290 with SMTP id ffacd0b85a97d-43796ab1ee0mr3006784f8f.1.1770974485930;
        Fri, 13 Feb 2026 01:21:25 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm3683710f8f.38.2026.02.13.01.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:21:25 -0800 (PST)
Message-ID: <58021349-7596-4f3b-ab06-65d7f619d74f@gmail.com>
Date: Fri, 13 Feb 2026 10:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW29lXVttZXRhLW9lXVtQQVRDSCA1LzVdIGhvdGRv?=
 =?UTF-8?Q?c_=3A_Add_new_recipe?=
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
 <20260213023217.19706-6-liuyd.fnst@fujitsu.com>
 <7036633a-b1a6-4dd3-95d3-0be0ae170a51@gmail.com>
 <CAMKF1spAcEYFa6zE-b4wibUqjpZNf3mzGXbPiccnE48cFZoCpw@mail.gmail.com>
 <TY3PR01MB101104CF0A998F11B885257959B61A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TY3PR01MB101104CF0A998F11B885257959B61A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124378


On 2/13/26 09:26, Yiding Liu (Fujitsu) wrote:
> Hi Khem
>     -> I think this should go to meta-python also, 
>    Yes, and I plan to move it to meta-python/recipes-devtools/. Is
> that ok?
>

Yes, I think that will work. thanks

>    ->how does this appear in sources I wonder if  using flex with
> --noline option can be of help here.
>    Thank you for your advance, I will use --noline and send a v2 patch.
>
> ------------------------------------------------------------------------
> *发件人:* Khem Raj <raj.khem@gmail.com>
> *发送时间:* 2026年2月13日 10:54
> *收件人:* skandigraun@gmail.com <skandigraun@gmail.com>
> *抄送:* Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *主题:* Re: [oe][meta-oe][PATCH 5/5] hotdoc : Add new recipe
>  
>
>
> On Thu, Feb 12, 2026 at 6:45 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     I think this should go to meta-python also, otherwise meta-oe will
>     depend on meta-python due to the newly added dependencies (or not?)
>
>     On 2/13/26 03:32, Yiding Liu (Fujitsu) via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > 1. Backport following patch to solve build and runtime issue
>     >   0001-c_comment_scanner-fix-function-prototypes.patch
>     >   0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     >   0003-CMake-4-compatibility.patch
>     >
>     > 2. Add do_configure:prepend() to solve buildpaths QA check
>     >   do_package_qa: QA Issue: File
>     /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so
>     <http://cmark.cpython-314-x86_64-linux-gnu.so> in package hotdoc
>     contains reference to TMPDIR [buildpaths]
>     >
>     > 3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to
>     solve buildpaths QA check
>     >   do_package_qa:QA Issue: File
>     /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c
>     in package hotdoc-src contains reference to TMPDIR [buildpaths]
>     >
>     > 4. Add clang as RDEPENDS for following reason
>     >   Hotdoc has some Extensions including c-Extension.
>     >   The c-Extension needs llvm and clang in runtime as introduced
>     in doc of hotdoc.
>     >   https://hotdoc.github.io/c-extension.html#c-extension
>     >   "The extension uses Clang to build and walk an AST from the
>     source code"
>     >
>     > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>     > ---
>     >  ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
>     >  ...y-backports-dependency-on-sufficient.patch | 72
>     +++++++++++++++++++
>     >  .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
>     >  ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
>     >  .../recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>     <http://hotdoc_0.17.4.bb>  | 28 ++++++++
>     >  5 files changed, 210 insertions(+)
>     >  create mode 100644
>     meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>     >  create mode 100644
>     meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     >  create mode 100644
>     meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>     >  create mode 100644
>     meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>     >  create mode 100644
>     meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>     <http://hotdoc_0.17.4.bb>
>     >
>     > diff --git
>     a/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>     > new file mode 100644
>     > index 0000000000..c26dde93b3
>     > --- /dev/null
>     > +++
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>     > @@ -0,0 +1,32 @@
>     > +Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes
>     > +
>     > +scanner.l: Fix compile error as the following:
>     > +
>     >
>     +python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_scanner/scanner.l:126:1:
>     error: conflicting types for 'parse_comment'; have 'int(PyObject
>     *)' {aka 'int(struct _object *)'}
>     > +|   126 | parse_comment (PyObject *comments)
>     > +
>     > +Upstream-Status: Backport
>     [https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b47862a0a9a58824b6a421]
>     > +
>     > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>     > +---
>     > + hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--
>     > + 1 file changed, 2 insertions(+), 2 deletions(-)
>     > +
>     > +diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l
>     b/hotdoc/parsers/c_comment_scanner/scanner.l
>     > +index 0408601..7bccd64 100644
>     > +--- a/hotdoc/parsers/c_comment_scanner/scanner.l
>     > ++++ b/hotdoc/parsers/c_comment_scanner/scanner.l
>     > +@@ -34,8 +34,8 @@
>     > + extern int yylex (PyObject *comments);
>     > + #define YY_DECL int yylex (PyObject *comments)
>     > + static int yywrap (void);
>     > +-static int parse_comment ();
>     > +-static int parse_define ();
>     > ++static int parse_comment (PyObject *);
>     > ++static int parse_define (PyObject *);
>     > + %}
>     > +
>     > + %option nounput
>     > +--
>     > +2.43.0
>     > +
>     > diff --git
>     a/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     > new file mode 100644
>     > index 0000000000..560d1257f0
>     > --- /dev/null
>     > +++
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     > @@ -0,0 +1,72 @@
>     > +Subject: [PATCH 2/2] avoid third-party backports dependency on
>     sufficiently
>     > + new python
>     > +
>     > +`backports.entry_points_selectable` backports functionality
>     from python
>     > +3.10 to older versions of python.
>     > +
>     > +Backport this patch to solve runtime backports import problem
>     as following:
>     > +  File
>     "/usr/lib/python3.14/site-packages/hotdoc/utils/utils.py", line
>     38, in <module>
>     > +  from backports.entry_points_selectable import entry_points
>     > +ModuleNotFoundError: No module named 'backports'
>     > +
>     > +Upstream-Status: Backport
>     [https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c8232280581598b875073ded7]
>     > +
>     > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>     > +---
>     > + hotdoc/extensions/gi/utils.py | 6 +++++-
>     > + hotdoc/utils/utils.py         | 6 +++++-
>     > + setup.py                      | 2 +-
>     > + 3 files changed, 11 insertions(+), 3 deletions(-)
>     > +
>     > +diff --git a/hotdoc/extensions/gi/utils.py
>     b/hotdoc/extensions/gi/utils.py
>     > +index 159c2b6..91902cb 100644
>     > +--- a/hotdoc/extensions/gi/utils.py
>     > ++++ b/hotdoc/extensions/gi/utils.py
>     > +@@ -1,9 +1,13 @@
>     > + import os
>     > + from collections import namedtuple
>     > + import pathlib
>     > ++import sys
>     > + import traceback
>     > +
>     > +-from backports.entry_points_selectable import entry_points
>     > ++if sys.version_info >= (3, 10):
>     > ++    from importlib.metadata import entry_points
>     > ++else:
>     > ++    from backports.entry_points_selectable import entry_points
>     > +
>     > + from hotdoc.core.links import Link
>     > + from hotdoc.utils.loggable import info, debug
>     > +diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py
>     > +index 518d308..aef657a 100644
>     > +--- a/hotdoc/utils/utils.py
>     > ++++ b/hotdoc/utils/utils.py
>     > +@@ -35,7 +35,11 @@ import importlib.util
>     > + from urllib.request import urlretrieve
>     > + from pathlib import Path
>     > +
>     > +-from backports.entry_points_selectable import entry_points
>     > ++if sys.version_info >= (3, 10):
>     > ++    from importlib.metadata import entry_points
>     > ++else:
>     > ++    from backports.entry_points_selectable import entry_points
>     > ++
>     > + try:
>     > +     import importlib.metadata as meta
>     > + except ImportError:
>     > +diff --git a/setup.py b/setup.py
>     > +index 5d7f131..9ee504d 100644
>     > +--- a/setup.py
>     > ++++ b/setup.py
>     > +@@ -300,7 +300,7 @@ INSTALL_REQUIRES = [
>     > +     'wheezy.template',
>     > +     'toposort>=1.4',
>     > +     'importlib_metadata; python_version<"3.10"',
>     > +-    'backports.entry_points_selectable',
>     > ++    'backports.entry_points_selectable; python_version<"3.10"',
>     > + ]
>     > +
>     > + # dbus-deviation requires sphinx, which requires python 3.5
>     > +--
>     > +2.43.0
>     > +
>     > diff --git
>     a/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>     > new file mode 100644
>     > index 0000000000..056ad5d340
>     > --- /dev/null
>     > +++
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>     > @@ -0,0 +1,44 @@
>     > +Subject: [PATCH] CMake 4 compatibility
>     > +
>     > +All CMake versions older than 3.10 are deprecated.
>     > +
>     > +Upstream-Status: Backport
>     [https://github.com/MathieuDuponchelle/cmark/commit/bd78193dbff98c3860e77629b5c7bfee6169d1da]
>     > +
>     > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>     > +---
>     > + CMakeLists.txt            | 11 ++---------
>     > + extensions/CMakeLists.txt |  2 +-
>     > + 2 files changed, 3 insertions(+), 10 deletions(-)
>     > +
>     > +diff --git a/CMakeLists.txt b/CMakeLists.txt
>     > +index ff97419..45fdf6c 100755
>     > +--- a/CMakeLists.txt
>     > ++++ b/CMakeLists.txt
>     > +@@ -1,12 +1,5 @@
>     > +-cmake_minimum_required(VERSION 2.8.9)
>     > +-
>     > +-# prevent ugly developer warnings because version is set
>     directly, not through project()
>     > +-# it should be redone properly by using VERSION in project()
>     if on CMake 3.x
>     > +-if(CMAKE_MAJOR_VERSION GREATER 2)
>     > +-    cmake_policy(SET CMP0048 OLD)
>     > +-endif()
>     > +-
>     > +-project(cmark)
>     > ++cmake_minimum_required(VERSION 3.10)
>     > ++project(cmark VERSION 0.28.3)
>     > +
>     > + include("FindAsan.cmake")
>     > +
>     > +diff --git a/extensions/CMakeLists.txt b/extensions/CMakeLists.txt
>     > +index e62d155..b6a1556 100644
>     > +--- a/extensions/CMakeLists.txt
>     > ++++ b/extensions/CMakeLists.txt
>     > +@@ -1,4 +1,4 @@
>     > +-cmake_minimum_required(VERSION 2.8)
>     > ++cmake_minimum_required(VERSION 3.10)
>     > + set(LIBRARY "cmarkextensions")
>     > + set(LIBRARY_SOURCES
>     > +     core-extensions.c
>     > +--
>     > +2.43.0
>     > +
>     > diff --git
>     a/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>     > new file mode 100644
>     > index 0000000000..ae8c2ef3e7
>     > --- /dev/null
>     > +++
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>     > @@ -0,0 +1,34 @@
>     > +Subject: [PATCH] Make path to relative in FlexExtension
>     > +
>     > +To fix following do_package QA Issue:
>     > +
>     > +do_package_qa:QA Issue: File
>     /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c
>     in package hotdoc-src contains reference to TMPDIR [buildpaths]
>     > +
>     > +Upstream-Status: Inappropriate [oe-specific]
>     > +
>
>
>
>  
>
>     > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>     > +---
>     > + setup.py | 4 ++--
>     > + 1 file changed, 2 insertions(+), 2 deletions(-)
>     > +
>     > +diff --git a/setup.py b/setup.py
>     > +index 9ee504d..fc03c57 100644
>     > +--- a/setup.py
>     > ++++ b/setup.py
>     > +@@ -357,11 +357,11 @@ build_c_extension =
>     os.environ.get('HOTDOC_BUILD_C_EXTENSION', 'auto')
>     > + class FlexExtension (Extension):
>     > +     def __init__(self, flex_sources, *args, **kwargs):
>     > +         Extension.__init__(self, *args, **kwargs)
>     > +-        self.__flex_sources = [src(s) for s in flex_sources]
>     > ++        self.__flex_sources = list(flex_sources)
>     > +
>
>
> how does this appear in sources I wonder if  using flex with
> --noline option can be of help here.
>  
>
>     > +     def __build_flex(self):
>     > +         src_dir = os.path.dirname(self.__flex_sources[0])
>     > +-        built_scanner_path = src(os.path.join(src_dir,
>     'scanner.c'))
>     > ++        built_scanner_path = os.path.join(src_dir, 'scanner.c')
>     > +
>     > +         self.sources.append(built_scanner_path)
>     > +         if newer_group(self.__flex_sources, built_scanner_path):
>     > +--
>     > +2.43.0
>     > +
>     > diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>     <http://hotdoc_0.17.4.bb>
>     b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>     <http://hotdoc_0.17.4.bb>
>     > new file mode 100644
>     > index 0000000000..6192a78989
>     > --- /dev/null
>     > +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>     <http://hotdoc_0.17.4.bb>
>     > @@ -0,0 +1,28 @@
>     > +SUMMARY = "Hotdoc is a documentation framework"
>     > +DESCRIPTION = "Hotdoc is a documentation micro-framework. It
>     provides an interface for extensions to plug upon, along with some
>     base objects (formatters, ...)"
>     > +HOMEPAGE = "https://github.com/hotdoc/hotdoc"
>     > +
>     > +LICENSE = "LGPL-2.1-or-later"
>     > +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
>     > +
>     > +SRC_URI[sha256sum] =
>     "c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc"
>     > +
>     > +SRC_URI =
>     "file://0001-c_comment_scanner-fix-function-prototypes.patch \
>     > +         
>      file://0002-avoid-third-party-backports-dependency-on-sufficient.patch
>     \
>     > +           file://0003-CMake-4-compatibility.patch;patchdir=cmark \
>     > +          "
>     > +
>     > +SRC_URI:append:class-target =
>     "file://0004-Make-path-to-relative-in-FlexExtension.patch"
>     > +
>     > +DEPENDS += "libxml2 glib-2.0 json-glib"
>     > +
>     > +inherit pypi python_setuptools_build_meta pkgconfig
>     > +
>     > +#Fix LIBDIR path to fix buildpaths QA check of
>     hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so
>     <http://cmark.cpython-314-x86_64-linux-gnu.so>
>     > +do_configure:prepend:class-target() {
>     > +    sed -i -e "s#'\"%s\"' %
>     CMARK_BUILD_DIR#'\"${PYTHON_SITEPACKAGES_DIR}/${PN}\"'#" ${S}/setup.py
>     > +}
>     > +
>     > +RDEPENDS:${PN} += "clang python3-appdirs python3-cchardet
>     python3-dbus-deviation python3-lxml python3-networkx
>     python3-pkgconfig python3-pyyaml python3-schema python3-toposort
>     python3-wheezy-template"
>     > +
>     > +BBCLASSEXTEND = "native"
>     >
>     >
>     >
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#124372):
>     https://lists.openembedded.org/g/openembedded-devel/message/124372
>     Mute This Topic: https://lists.openembedded.org/mt/117786773/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


