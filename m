Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76362D2068D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 02:09:43 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.13718.1729044575599908901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 19:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CsZ/Nqo9;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-716f9721ed0so230395a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729044575; x=1729649375; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbKwOhvvP1kOLGLZUm3HZP28Eqo4774meKFTDmUgs/c=;
        b=CsZ/Nqo9tNI4OvX6LanbGNyhAnJRj3RpV7u9Sx01YAcKquME46jGlUtOfhUOk5H5sN
         3NhEixzpRCmHeqBe0mz2IxhOninxjBZZy/RoBTM6H7uA/2x3eW87TJGLBT8A03MA4swF
         N3J5BS1stPh7iuejS0R09C02dn1YhfbUVYHAKfIeNWGA7+QAQbyoROauzaUA4ra8Ixv/
         wfUuCH2mjJfYL4XGrMu/IHaBqkDl3K+m9j8B/2bVROsV/Sq3JrvH0rwdIwKj3aCXQNE/
         vIdPeB1/4yADT07aeO2xpCVCucFaUWRDJt6u6+BeLjEiUnUZ4bRzt0HZMs79glGqJxZs
         mmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729044575; x=1729649375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbKwOhvvP1kOLGLZUm3HZP28Eqo4774meKFTDmUgs/c=;
        b=K+j36IRpwbAcOeim+kD9VEEBOmJC49gdIiJBrB3H5ribO73OhlsrwjDgEwatI4vFeg
         wrSfC2LeyjMUU9Ec4t2Q6kqdGwenDhyghv1yxT8+vUfxTem6FvcYsHgNsxCqX4AJbYYq
         5bvfG3JkdmwE6z7ComQqju7H6cDp9XDYIRvCiAUDQm0dWttaLNhYbwziAinD16zeNQAv
         V5K8mIhd+6rVgfR4cJKTbpc71KE/YwqfoNpGW7z6p6fz6cWzwtIL+xXEX0cu7odaf9B8
         3NKeMcKMOrZLp5m8FQZjyUb0KZhnssJdEkReXXhui/TOzSn8ctHNNdcDCJoAvLhRHDw6
         KwLQ==
X-Gm-Message-State: AOJu0Yw0apkAwlH58mfmRfsWEez3Q/BN8xkap9ji0FVVou4uTzLbBJta
	+vpchO99PfQXI2q74lYDVhMEIsWLeYmsATnnP/jPb0Zkz2ZwiiIChR7rED70bAzKqk2ArQizkZx
	BXNwXgxozyQp9+S3PEj7u2fjaMSMSDVdhM7w=
X-Google-Smtp-Source: AGHT+IFwHTiSfzs1jBeYqQzCy+r49lHqXaOFY4hRPMJb0p2fkWSkXkVhk+H0Gros82bBADn5fK6VP0BWS/M7cH7T6XI=
X-Received: by 2002:a05:6808:1307:b0:3e0:468f:7c5b with SMTP id
 5614622812f47-3e5effb1f8dmr1735980b6e.17.1729044574512; Tue, 15 Oct 2024
 19:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241015142939.719707-1-yi.zhao@windriver.com> <20241015142939.719707-3-yi.zhao@windriver.com>
In-Reply-To: <20241015142939.719707-3-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2024 19:09:08 -0700
Message-ID: <CAMKF1spBjFZ32QACcFQ9ybeYXYoByMjRx9m6Mrpys5vzVGXd+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] doxygen: upgrade 1.9.3 -> 1.12.0
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 02:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112933

Thanks for this patch and I do see you have tried to fix the build
with clang-19, there is another issue seen when using LLVM libc++
for standard C++ library. see

https://gist.github.com/kraj/66baa45d3844e81f47b69814d450b399

llvm libc++ has made changes to make char_traits to be more consistent see

https://libcxx.llvm.org/ReleaseNotes/19.html#deprecations-and-removals

I think doxygen can be fixed for not relying on this deprecated
behaviour and such a patch will be worthy of upstreaming as well.
e..g see how it got fixed for kea

https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410

Thanks
-Khem



On Tue, Oct 15, 2024 at 7:30=E2=80=AFAM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://www.doxygen.nl/manual/changelog.html#log_1_12_0
>
> * Refresh patch
> * Backport a patch to fix build with clang
> * Drop doxygen-native-only-check-python3.patch as the issue can not be
>   reproduced.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../0001-build-don-t-look-for-Iconv.patch     |  20 +-
>  .../0002-Fix-build-with-clang-19.0.patch      |  52 ++++
>  .../doxygen-native-only-check-python3.patch   | 232 ------------------
>  .../{doxygen_1.9.3.bb =3D> doxygen_1.12.0.bb}   |   4 +-
>  4 files changed, 64 insertions(+), 244 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-bui=
ld-with-clang-19.0.patch
>  delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/doxygen-nati=
ve-only-check-python3.patch
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.3.bb =3D> doxygen_1=
.12.0.bb} (80%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-lo=
ok-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-do=
n-t-look-for-Iconv.patch
> index 47c8edb49..6b0a48f00 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-=
Iconv.patch
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-=
Iconv.patch
> @@ -1,4 +1,4 @@
> -From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 2001
> +From 2d587d043fc061c53c3d8015501392a804c5f0b4 Mon Sep 17 00:00:00 2001
>  From: Bartosz Golaszewski <brgl@bgdev.pl>
>  Date: Fri, 23 Nov 2018 11:44:56 +0100
>  Subject: [PATCH] build: don't look for Iconv
> @@ -7,31 +7,31 @@ Drop the find_package() for Iconv. CMake is unable to f=
ind iconv.h in
>  native build but all modern systems supply it as part of the standard
>  C library. We don't need this check in meta-openembedded.
>
> -Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> -
> -Upstream-Status: Inappropriate
> +Upstream-Status: Inappropriate [oe-specific]
>  - upstream doxygen must build on many architectures, this change is
>    too intrusive for upstream
> +
> +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>  ---
>   CMakeLists.txt | 4 ----
>   1 file changed, 4 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 06b9696f..f30b46b8 100644
> +index 3adf456..ad73997 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -117,10 +117,6 @@ if (sqlite3)
> -   endif()
> +@@ -212,10 +212,6 @@ if ((CMAKE_BUILD_TYPE STREQUAL "Debug") OR enable_l=
ex_debug)
> +   set(LEX_FLAGS "${LEX_FLAGS} -d")
>   endif()
>
>  -find_package(Iconv REQUIRED)
> --include_directories(${ICONV_INCLUDE_DIR})
> +-include_directories(${Iconv_INCLUDE_DIRS})
>  -
>  -
>   #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen=
 docs")
>   set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
>   set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
>  --
> -2.27.0
> +2.25.1
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with=
-clang-19.0.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build=
-with-clang-19.0.patch
> new file mode 100644
> index 000000000..fc3aae75c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-clang-=
19.0.patch
> @@ -0,0 +1,52 @@
> +From cff64a87dea7596fd506a85521d4df4616dc845f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Bernhard=3D20Rosenkr=3DC3=3DA4nzer?=3D <bero@lindev.ch=
>
> +Date: Fri, 9 Aug 2024 14:13:34 +0200
> +Subject: [PATCH] Fix build with clang >=3D 19.0
> +
> +Clang >=3D 19.0 requires a template argument list after the template
> +keyword for CWG96 compliance, see
> +https://github.com/llvm/llvm-project/pull/80801
> +
> +This patch has also been submitted to upstream TinyDeflate as
> +https://github.com/bisqwit/TinyDeflate/pull/9
> +
> +Upstream-Status: Backport
> +[https://github.com/doxygen/doxygen/commit/cff64a87dea7596fd506a85521d4d=
f4616dc845f]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + deps/TinyDeflate/gunzip.hh | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/deps/TinyDeflate/gunzip.hh b/deps/TinyDeflate/gunzip.hh
> +index 652058ab8..3ba341487 100644
> +--- a/deps/TinyDeflate/gunzip.hh
> ++++ b/deps/TinyDeflate/gunzip.hh
> +@@ -1141,21 +1141,21 @@ namespace gunzip_ns
> +             //fprintf(stderr, "both track flag\n");
> +             SizeTracker<DeflateTrackBothSize> tracker;
> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
> +-                (tracker.template ForwardInput(i), tracker.template For=
wardOutput(o), tracker.template ForwardWindow(c), std::forward<B>(b)));
> ++                (tracker.template ForwardInput<I>(i), tracker.template =
ForwardOutput<O>(o), tracker.template ForwardWindow<C>(c), std::forward<B>(=
b)));
> +         }
> +         else if constexpr(code & Flag_TrackIn)
> +         {
> +             //fprintf(stderr, "in track flag\n");
> +             SizeTracker<DeflateTrackInSize> tracker;
> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
> +-                (tracker.template ForwardInput(i),std::forward<O>(o),st=
d::forward<C>(c),std::forward<B>(b)));
> ++                (tracker.template ForwardInput<I>(i),std::forward<O>(o)=
,std::forward<C>(c),std::forward<B>(b)));
> +         }
> +         else if constexpr(code & Flag_TrackOut)
> +         {
> +             //fprintf(stderr, "out track flag\n");
> +             SizeTracker<DeflateTrackOutSize> tracker;
> +             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
> +-                (std::forward<I>(i), tracker.template ForwardOutput(o),=
 tracker.template ForwardWindow(c), std::forward<B>(b)));
> ++                (std::forward<I>(i), tracker.template ForwardOutput<O>(=
o), tracker.template ForwardWindow<C>(c), std::forward<B>(b)));
> +         }
> +         else
> +         {
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only=
-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-nat=
ive-only-check-python3.patch
> deleted file mode 100644
> index 796bc61dd..000000000
> --- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-=
python3.patch
> +++ /dev/null
> @@ -1,232 +0,0 @@
> -From daf686508f2ee4711d93e96e5b100e50bf161656 Mon Sep 17 00:00:00 2001
> -From: Leon Anavi <leon.anavi@konsulko.com>
> -Date: Wed, 26 Aug 2020 10:52:10 +0300
> -Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
> -
> -It fails to compile doxygen-native when /usr/bin/python is a link
> -to python3 on build host:
> -
> -| Failed to import the site module
> -| Traceback (most recent call last):
> -|   File "/usr/lib64/python3.6/site.py", line 564, in <module>
> -|     main()
> -|   File "/usr/lib64/python3.6/site.py", line 550, in main
> -|     known_paths =3D addusersitepackages(known_paths)
> -|   File "/usr/lib64/python3.6/site.py", line 282, in addusersitepackage=
s
> -|     user_site =3D getusersitepackages()
> -|   File "/usr/lib64/python3.6/site.py", line 258, in getusersitepackage=
s
> -|     user_base =3D getuserbase() # this will also set USER_BASE
> -|   File "/usr/lib64/python3.6/site.py", line 248, in getuserbase
> -|     USER_BASE =3D get_config_var('userbase')
> -|   File "/usr/lib64/python3.6/sysconfig.py", line 604, in get_config_va=
r
> -|     return get_config_vars().get(name)
> -|   File "/usr/lib64/python3.6/sysconfig.py", line 553, in get_config_va=
rs
> -|     _init_posix(_CONFIG_VARS)
> -|   File "/usr/lib64/python3.6/sysconfig.py", line 424, in _init_posix
> -|     _temp =3D __import__(name, globals(), locals(), ['build_time_vars'=
], 0)
> -| ModuleNotFoundError: No module named '_sysconfigdata'
> -
> -Replace find_package PythonInterp with Python3 to fix this issue
> -that it uses python3 from python3-native. And it also replaces the
> -result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
> -
> -This patch is only needded by doxygen-native.
> -
> -Updated to apply to release 1.9.1.
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Co-Authored-By: Kai Kang <kai.kang@windriver.com>
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> -
> ----
> - CMakeLists.txt                  |  2 +-
> - addon/doxywizard/CMakeLists.txt |  6 +++---
> - doc/CMakeLists.txt              |  6 +++---
> - examples/CMakeLists.txt         |  4 ++--
> - libmscgen/CMakeLists.txt        |  2 +-
> - src/CMakeLists.txt              | 10 +++++-----
> - testing/CMakeLists.txt          |  4 ++--
> - 7 files changed, 17 insertions(+), 17 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 2455793..28f0d83 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -105,7 +105,7 @@ else ()
> - endif ()
> -
> - find_program(DOT NAMES dot)
> --find_package(PythonInterp REQUIRED)
> -+find_package(Python3 REQUIRED)
> - find_package(FLEX REQUIRED)
> - find_package(BISON REQUIRED)
> - if (BISON_VERSION VERSION_LESS 2.7)
> -diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLis=
ts.txt
> -index 63ac8e3..d37d1d0 100644
> ---- a/addon/doxywizard/CMakeLists.txt
> -+++ b/addon/doxywizard/CMakeLists.txt
> -@@ -57,7 +57,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/se=
ttings.h PROPERTIES GENERA
> -
> - # generate version.cpp
> - add_custom_command(
> --    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py $=
{VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
> -+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py =
${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
> -     DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/ver=
sion.py
> -     OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
> - )
> -@@ -65,7 +65,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/ve=
rsion.cpp PROPERTIES GENER
> -
> - # generate configdoc.cpp
> - add_custom_command(
> --    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py=
 -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/config=
doc.cpp
> -+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.p=
y -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/confi=
gdoc.cpp
> -     DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE_DI=
R}/src/config.xml
> -     OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
> - )
> -@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/co=
nfigdoc.cpp PROPERTIES GEN
> - set(LEX_FILES config_doxyw)
> - foreach(lex_file ${LEX_FILES})
> -     add_custom_command(
> --        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_sta=
tes.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_S=
RC_WIZARD}/${lex_file}.l.h
> -+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_st=
ates.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_=
SRC_WIZARD}/${lex_file}.l.h
> -         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOUR=
CE_DIR}/addon/doxywizard/${lex_file}.l
> -         OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
> -     )
> -diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> -index ec63ceb..49a2bda 100644
> ---- a/doc/CMakeLists.txt
> -+++ b/doc/CMakeLists.txt
> -@@ -168,7 +168,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer=
.1      ${PROJECT_BINARY_DIR
> -
> - # doc/language.doc (see tag Doxyfile:INPUT)
> - add_custom_command(
> --        COMMAND ${PYTHON_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR=
}
> -+        COMMAND ${Python3_EXECUTABLE} translator.py ${PROJECT_SOURCE_DI=
R}
> -         DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_SOU=
RCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FI=
LES}
> -         OUTPUT language.doc
> -         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
> -@@ -177,7 +177,7 @@ set_source_files_properties(language.doc PROPERTIES =
GENERATED 1)
> -
> - # doc/config.doc (see tag Doxyfile:INPUT)
> - add_custom_command(
> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${TO=
P}/src/config.xml > config.doc
> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${T=
OP}/src/config.xml > config.doc
> -         DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
> -         OUTPUT config.doc
> -         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
> -@@ -228,7 +228,7 @@ add_custom_target(docs_chm
> -     COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${PROJ=
ECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
> -     COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.html')=
 or file.endswith('.png') or file.endswith('.css') or file.endswith('.gif')=
:" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
> -     COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join(ro=
ot, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
> --    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${PYTH=
ON_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >> =
${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
> -+    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${Pyth=
on3_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >>=
 ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
> -     COMMAND ${CMAKE_COMMAND} -E chdir ${PROJECT_BINARY_DIR}/chm "${HTML=
_HELP_COMPILER}" doxygen_manual.hhp || echo > nul
> -     COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.=
chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
> -         DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY=
_DIR}/doc/config.doc
> -diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
> -index 194b427..248b807 100644
> ---- a/examples/CMakeLists.txt
> -+++ b/examples/CMakeLists.txt
> -@@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR=
}/html/examples/${f}
> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR=
}/latex/examples/${f}
> -       COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py =
 < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_B=
INARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py=
  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_=
BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
> -       DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_exam=
ple.py
> -       OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html $=
{PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
> -     )
> -@@ -73,7 +73,7 @@ if (DOT)
> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR=
}/html/examples/diagrams
> -         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR=
}/latex/examples/diagrams
> -       COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
> --        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py =
 < ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman.tex > ${PROJE=
CT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
> -+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py=
  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${PROJE=
CT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
> -       DEPENDS doxygen diagrams_a.h diagrams_b.h diagrams_c.h diagrams_d=
.h diagrams_e.h diagrams.cfg ${TOP}/examples/strip_example.py
> -       OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.ht=
ml ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
> -   )
> -diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
> -index 34cf4d8..f015afc 100644
> ---- a/libmscgen/CMakeLists.txt
> -+++ b/libmscgen/CMakeLists.txt
> -@@ -7,7 +7,7 @@ include_directories(
> - set(LEX_FILES mscgen_lexer)
> - foreach(lex_file ${LEX_FILES})
> -     add_custom_command(
> --        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_sta=
tes.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${l=
ex_file}.l.h
> -+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_st=
ates.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${=
lex_file}.l.h
> -         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOUR=
CE_DIR}/libmscgen/${lex_file}.l
> -         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
> -     )
> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index 0e0c5f7..c1d3ca5 100644
> ---- a/src/CMakeLists.txt
> -+++ b/src/CMakeLists.txt
> -@@ -40,7 +40,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.=
h PROPERTIES GENERATED 1)
> -
> - # configvalues.h
> - add_custom_command(
> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py=
 -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues=
.h
> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.p=
y -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalue=
s.h
> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_D=
IR}/configgen.py
> -     OUTPUT ${GENERATED_SRC}/configvalues.h
> - )
> -@@ -52,7 +52,7 @@ add_custom_target(
> -
> - # configvalues.cpp
> - add_custom_command(
> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py=
 -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues=
.cpp
> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.p=
y -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalue=
s.cpp
> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_D=
IR}/configgen.py
> -     OUTPUT ${GENERATED_SRC}/configvalues.cpp
> - )
> -@@ -60,7 +60,7 @@ set_source_files_properties(${GENERATED_SRC}/configval=
ues.cpp PROPERTIES GENERAT
> -
> - # configoptions.cpp
> - add_custom_command(
> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py=
 -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions=
.cpp
> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.p=
y -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoption=
s.cpp
> -     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_D=
IR}/configgen.py
> -     OUTPUT ${GENERATED_SRC}/configoptions.cpp
> - )
> -@@ -95,7 +95,7 @@ endif()
> - # resources.cpp
> - add_custom_command(
> -     COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
> --    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.p=
y ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
> -+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.=
py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
> -     DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
> -     OUTPUT ${GENERATED_SRC}/resources.cpp
> - )
> -@@ -126,7 +126,7 @@ foreach(lex_file ${LEX_FILES})
> -     set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h=
 CACHE INTERNAL "Stores generated files")
> -     set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}=
.cpp CACHE INTERNAL "Stores generated files")
> -     add_custom_command(
> --        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_sta=
tes.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_fil=
e}.l.h
> -+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_st=
ates.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_fi=
le}.l.h
> -         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURREN=
T_LIST_DIR}/${lex_file}.l
> -         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
> -     )
> -diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
> -index fd6912e..0af1865 100644
> ---- a/testing/CMakeLists.txt
> -+++ b/testing/CMakeLists.txt
> -@@ -1,7 +1,7 @@
> - # run all tests sequentially (keep for backward compatibility)
> - add_custom_target(tests
> -       COMMENT "Running doxygen tests..."
> --      COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtes=
ts.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOUR=
CE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
> -+      COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runte=
sts.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOU=
RCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
> -       DEPENDS doxygen
> - )
> -
> -@@ -19,6 +19,6 @@ foreach(TEST_FILE ${TEST_FILES})
> -       string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID "$=
{TEST_FILE}")
> -       # add a test target for each test
> -       add_test(NAME ${TEST_NAME}
> --               COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testi=
ng/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir =
${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
> -+               COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/test=
ing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir=
 ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
> -       )
> - endforeach()
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb b/meta-oe/=
recipes-devtools/doxygen/doxygen_1.12.0.bb
> similarity index 80%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
> index 16a4250b2..ed0c71b31 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
> @@ -8,9 +8,9 @@ DEPENDS =3D "flex-native bison-native"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>             file://0001-build-don-t-look-for-Iconv.patch \
> +           file://0002-Fix-build-with-clang-19.0.patch \
>  "
> -SRC_URI:append:class-native =3D " file://doxygen-native-only-check-pytho=
n3.patch"
> -SRC_URI[sha256sum] =3D "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f=
6c81c50449d254e0"
> +SRC_URI[sha256sum] =3D "a3a3dba2018ef409d83d81a2fc42a0d19bdbe087252ef342=
bf214b51b8b01634"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/doxygen/doxygen/releases"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112929): https://lists.openembedded.org/g/openembedde=
d-devel/message/112929
> Mute This Topic: https://lists.openembedded.org/mt/109023379/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

