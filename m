Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B9AEDF059
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:45:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62524.1770950726261035724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=It7iSbXC;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso3321915e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770950725; x=1771555525; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVnW6/nScHbZvdzRafBFdZ+khHVIXwsavYSZ8+5rX54=;
        b=It7iSbXCOFHQ1pvocpNy8Wpn0HI+KdarHtUy0OboQk55Iz7NHI6Ti0lkcWnlLjsSRp
         FU2dnu7GHK2ki5t6phJFG/Av91+22OPG0I/SkK5KziZUBNS4wmZztyNhOW5IFXMsxNOc
         60ay2sg8PTLzddLkQ6E2dHGEVrbOimmLCM0OGOuTB4NhoX+zgCY26+p4cMwAYSJVApRP
         OxbXDmADz3NoelnM6gtTlDtDEvIi6tIVEa/G96XYyiXb3SExxQqjd0JgkWUfX2maNI8m
         RD3Gcz6oeYryF0w4tQL7226fnrNDUaOhq+Mv0PIBQIx/8U33RFjv2TYhmgJDOV221qDp
         kdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770950725; x=1771555525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVnW6/nScHbZvdzRafBFdZ+khHVIXwsavYSZ8+5rX54=;
        b=wyclsflWnAPkGbWPOz5eYVJafRVu3Fi+H2y41kGUXpfNaZ0AK43yyq2hHs+RoGowL+
         h0A+e2MPqTUO5b0GySHRnu6y8B95cAH+6DJb0hmw5/S3B1nKAqY8qxFGjr5e8Bvka1vy
         hPefxdf4jTUx8RGAhmVfuz98AHzgISR1fmsR2BE7d2A3PHxvZyogS4+TsofOIREPGbvN
         5r91B5+LxolwR9zLcvbRpfHYWbIUhBLeZDV+xLdOfNQIN1MgD6zF4jH7Z+BSbe3/KJa0
         tcDny7RJ6wZp/Koy5MFTMd3HM4WDjzwhGmhYrn7b+MykUz73Ghk4ExTE83Jx62lXzXiw
         0OAw==
X-Forwarded-Encrypted: i=1; AJvYcCUq4yfcOArPj1vFBHEV+d/4Kl4FmZkgyHB9yI62qh7EQp7WvFAhP3RZvPPpe5T46HIEYwXySYfpsg8+xRlXPAbEjmI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyvi7heVOKScpEnzZI81Y4vRTjVp/pWdOGGWGkJrVIvurGO6S40
	xtr0wnpSGsf85Sk9uSf39GqtY/TqvOC+fa6e3yfdygMAVKwVB6VvW9z/
X-Gm-Gg: AZuq6aLFy1RSyyZarXUCh7H3IECujb9X/eWEIm4o07BHy/qw54gMCl4X3mr7xLw1hmN
	b5GU983zzIE8CSq7W7XLFbHyS6X9VumluY+1gWQ9btKSs/v3kiFTNlUo5F/8ste3zBHh7NeLCvl
	4UprBUj0vbqc7J4t/MLqGjqj0/8lD+CxsOWzoSPVCFXWb6Y19eclsC5ysYFtLxdOTeRCzoee92V
	ObGGxzneM5THHtHpx9Dy6yaP1Q/UBnLMulION0wV6A0x6ed15xcUM1Fl9VUUdE0BQe1Wnf/npJz
	0gAGtnGPRF0K6unmh62DhAClYRUL7WRDevdB3TtTygNPiuUgmLMbry8UEdlShoGKe2JG0/tDS6o
	8N2zfIniVaiBwjhsDfLrPCEi972jHDDAznOrVhhUuk9cS6YamFkCTTrqdU4cSaQKKrYWM5pcGzZ
	9FCh9bFYRl1XgTcxIrUlwc9mpFXVcfp4Q=
X-Received: by 2002:a05:600c:818c:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-48373a5d56dmr3289695e9.22.1770950724259;
        Thu, 12 Feb 2026 18:45:24 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a763c2sm8178925e9.11.2026.02.12.18.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 18:45:22 -0800 (PST)
Message-ID: <7036633a-b1a6-4dd3-95d3-0be0ae170a51@gmail.com>
Date: Fri, 13 Feb 2026 03:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 5/5] hotdoc : Add new recipe
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
 <20260213023217.19706-6-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260213023217.19706-6-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124372

I think this should go to meta-python also, otherwise meta-oe will
depend on meta-python due to the newly added dependencies (or not?)

On 2/13/26 03:32, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> 1. Backport following patch to solve build and runtime issue
>   0001-c_comment_scanner-fix-function-prototypes.patch
>   0002-avoid-third-party-backports-dependency-on-sufficient.patch
>   0003-CMake-4-compatibility.patch
>
> 2. Add do_configure:prepend() to solve buildpaths QA check
>   do_package_qa: QA Issue: File /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains reference to TMPDIR [buildpaths]
>
> 3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to solve buildpaths QA check
>   do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]
>
> 4. Add clang as RDEPENDS for following reason
>   Hotdoc has some Extensions including c-Extension.
>   The c-Extension needs llvm and clang in runtime as introduced in doc of hotdoc.
>   https://hotdoc.github.io/c-extension.html#c-extension
>   "The extension uses Clang to build and walk an AST from the source code"
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
>  ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
>  .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
>  ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
>  .../recipes-devtools/hotdoc/hotdoc_0.17.4.bb  | 28 ++++++++
>  5 files changed, 210 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
>  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
>  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
>  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
>  create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
>
> diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
> new file mode 100644
> index 0000000000..c26dde93b3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
> @@ -0,0 +1,32 @@
> +Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes
> +
> +scanner.l: Fix compile error as the following:
> +
> +python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_scanner/scanner.l:126:1: error: conflicting types for 'parse_comment'; have 'int(PyObject *)' {aka 'int(struct _object *)'}
> +|   126 | parse_comment (PyObject *comments)
> +
> +Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b47862a0a9a58824b6a421]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l b/hotdoc/parsers/c_comment_scanner/scanner.l
> +index 0408601..7bccd64 100644
> +--- a/hotdoc/parsers/c_comment_scanner/scanner.l
> ++++ b/hotdoc/parsers/c_comment_scanner/scanner.l
> +@@ -34,8 +34,8 @@
> + extern int yylex (PyObject *comments);
> + #define YY_DECL int yylex (PyObject *comments)
> + static int yywrap (void);
> +-static int parse_comment ();
> +-static int parse_define ();
> ++static int parse_comment (PyObject *);
> ++static int parse_define (PyObject *);
> + %}
> + 
> + %option nounput
> +-- 
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
> new file mode 100644
> index 0000000000..560d1257f0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
> @@ -0,0 +1,72 @@
> +Subject: [PATCH 2/2] avoid third-party backports dependency on sufficiently
> + new python
> +
> +`backports.entry_points_selectable` backports functionality from python
> +3.10 to older versions of python.
> +
> +Backport this patch to solve runtime backports import problem as following:
> +  File "/usr/lib/python3.14/site-packages/hotdoc/utils/utils.py", line 38, in <module>
> +  from backports.entry_points_selectable import entry_points
> +ModuleNotFoundError: No module named 'backports'
> +
> +Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c8232280581598b875073ded7]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + hotdoc/extensions/gi/utils.py | 6 +++++-
> + hotdoc/utils/utils.py         | 6 +++++-
> + setup.py                      | 2 +-
> + 3 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/hotdoc/extensions/gi/utils.py b/hotdoc/extensions/gi/utils.py
> +index 159c2b6..91902cb 100644
> +--- a/hotdoc/extensions/gi/utils.py
> ++++ b/hotdoc/extensions/gi/utils.py
> +@@ -1,9 +1,13 @@
> + import os
> + from collections import namedtuple
> + import pathlib
> ++import sys
> + import traceback
> + 
> +-from backports.entry_points_selectable import entry_points
> ++if sys.version_info >= (3, 10):
> ++    from importlib.metadata import entry_points
> ++else:
> ++    from backports.entry_points_selectable import entry_points
> + 
> + from hotdoc.core.links import Link
> + from hotdoc.utils.loggable import info, debug
> +diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py
> +index 518d308..aef657a 100644
> +--- a/hotdoc/utils/utils.py
> ++++ b/hotdoc/utils/utils.py
> +@@ -35,7 +35,11 @@ import importlib.util
> + from urllib.request import urlretrieve
> + from pathlib import Path
> + 
> +-from backports.entry_points_selectable import entry_points
> ++if sys.version_info >= (3, 10):
> ++    from importlib.metadata import entry_points
> ++else:
> ++    from backports.entry_points_selectable import entry_points
> ++
> + try:
> +     import importlib.metadata as meta
> + except ImportError:
> +diff --git a/setup.py b/setup.py
> +index 5d7f131..9ee504d 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -300,7 +300,7 @@ INSTALL_REQUIRES = [
> +     'wheezy.template',
> +     'toposort>=1.4',
> +     'importlib_metadata; python_version<"3.10"',
> +-    'backports.entry_points_selectable',
> ++    'backports.entry_points_selectable; python_version<"3.10"',
> + ]
> + 
> + # dbus-deviation requires sphinx, which requires python 3.5
> +-- 
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> new file mode 100644
> index 0000000000..056ad5d340
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
> @@ -0,0 +1,44 @@
> +Subject: [PATCH] CMake 4 compatibility
> +
> +All CMake versions older than 3.10 are deprecated.
> +
> +Upstream-Status: Backport [https://github.com/MathieuDuponchelle/cmark/commit/bd78193dbff98c3860e77629b5c7bfee6169d1da]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + CMakeLists.txt            | 11 ++---------
> + extensions/CMakeLists.txt |  2 +-
> + 2 files changed, 3 insertions(+), 10 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ff97419..45fdf6c 100755
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,12 +1,5 @@
> +-cmake_minimum_required(VERSION 2.8.9)
> +-
> +-# prevent ugly developer warnings because version is set directly, not through project()
> +-# it should be redone properly by using VERSION in project() if on CMake 3.x
> +-if(CMAKE_MAJOR_VERSION GREATER 2)
> +-    cmake_policy(SET CMP0048 OLD)
> +-endif()
> +-
> +-project(cmark)
> ++cmake_minimum_required(VERSION 3.10)
> ++project(cmark VERSION 0.28.3)
> + 
> + include("FindAsan.cmake")
> + 
> +diff --git a/extensions/CMakeLists.txt b/extensions/CMakeLists.txt
> +index e62d155..b6a1556 100644
> +--- a/extensions/CMakeLists.txt
> ++++ b/extensions/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8)
> ++cmake_minimum_required(VERSION 3.10)
> + set(LIBRARY "cmarkextensions")
> + set(LIBRARY_SOURCES
> +     core-extensions.c
> +-- 
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
> new file mode 100644
> index 0000000000..ae8c2ef3e7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
> @@ -0,0 +1,34 @@
> +Subject: [PATCH] Make path to relative in FlexExtension
> +
> +To fix following do_package QA Issue:
> +
> +do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 9ee504d..fc03c57 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -357,11 +357,11 @@ build_c_extension = os.environ.get('HOTDOC_BUILD_C_EXTENSION', 'auto')
> + class FlexExtension (Extension):
> +     def __init__(self, flex_sources, *args, **kwargs):
> +         Extension.__init__(self, *args, **kwargs)
> +-        self.__flex_sources = [src(s) for s in flex_sources]
> ++        self.__flex_sources = list(flex_sources)
> + 
> +     def __build_flex(self):
> +         src_dir = os.path.dirname(self.__flex_sources[0])
> +-        built_scanner_path = src(os.path.join(src_dir, 'scanner.c'))
> ++        built_scanner_path = os.path.join(src_dir, 'scanner.c')
> + 
> +         self.sources.append(built_scanner_path)
> +         if newer_group(self.__flex_sources, built_scanner_path):
> +-- 
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> new file mode 100644
> index 0000000000..6192a78989
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Hotdoc is a documentation framework"
> +DESCRIPTION = "Hotdoc is a documentation micro-framework. It provides an interface for extensions to plug upon, along with some base objects (formatters, ...)"
> +HOMEPAGE = "https://github.com/hotdoc/hotdoc"
> +
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
> +
> +SRC_URI[sha256sum] = "c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc"
> +
> +SRC_URI = "file://0001-c_comment_scanner-fix-function-prototypes.patch \
> +           file://0002-avoid-third-party-backports-dependency-on-sufficient.patch \
> +           file://0003-CMake-4-compatibility.patch;patchdir=cmark \
> +          "
> +
> +SRC_URI:append:class-target = "file://0004-Make-path-to-relative-in-FlexExtension.patch"
> +
> +DEPENDS += "libxml2 glib-2.0 json-glib"
> +
> +inherit pypi python_setuptools_build_meta pkgconfig
> +
> +#Fix LIBDIR path to fix buildpaths QA check of hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so
> +do_configure:prepend:class-target() {
> +    sed -i -e "s#'\"%s\"' % CMARK_BUILD_DIR#'\"${PYTHON_SITEPACKAGES_DIR}/${PN}\"'#" ${S}/setup.py
> +}
> +
> +RDEPENDS:${PN} += "clang python3-appdirs python3-cchardet python3-dbus-deviation python3-lxml python3-networkx python3-pkgconfig python3-pyyaml python3-schema python3-toposort python3-wheezy-template"
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124370): https://lists.openembedded.org/g/openembedded-devel/message/124370
> Mute This Topic: https://lists.openembedded.org/mt/117786773/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


