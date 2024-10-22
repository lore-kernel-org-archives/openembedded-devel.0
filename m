Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F394D2C559
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:54:35 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.18919.1729605272299903962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 06:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CS1yTsLH;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5eb73ec1e1aso2850117eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729605271; x=1730210071; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xif/GolSDM69qMGcAb8n7UcIwx2GaqzAgrl3pE1R4RE=;
        b=CS1yTsLHZG8W+70yjIgPdv51V/IkwqmQQHRctHAY/iut72b8S37CgKfVNEmr82g5nI
         JN9k5O6AzpfcW6FQJxvZPH66cLgalyNCEe8eLAOF78PniZsuguCYBNkCwFPBWNxYz49O
         Z1TJvCsZOtthmp1QDPbT8j6ZgSLpqsxunELHUfFTBg55pjXg/utd3aUGyPnQ3Bp79Srr
         6gvw+PhXw4CugEkmXby6fxwF6qQK1MPlQ9X91IMWCuPWF8VyQ2RROsSCXYnpenUyqJZT
         kpzVDkuwxYUxVmDc3sLn+Zt1WXRPaxGuRpYkQBF/KLmJ40nkgl2e71dmNHant/hA+pAz
         irog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729605271; x=1730210071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xif/GolSDM69qMGcAb8n7UcIwx2GaqzAgrl3pE1R4RE=;
        b=YYg4XDVOTsZCoyy66Ml1GjHNo58B4G113x/Bj8frExLq8vf3krX5vH82Qa/yIRSw8/
         vFGxtuN4DGRp2mhtdS108UAmiqL8wSQD+A2d5ANFGoVpprsOEb/nm1s7XaFkazC5PDwj
         ey14zLubLXfUNfTIQezPQ8PaU4DbIuDyxmaz9NjErbHQKTjQ4rz75ISeVpEYRx411SP4
         N8u6VZrTfuPQpQZgXXPcWcknFDFqAYplQTlBF55KRgPVLLu0Vg0K5xkg6DnFfN+yfLPb
         lIQ/h2+9/gbvNClkQrv5QydOWda4WkTQzReZolafSihfVhZaMA/2MDJf9ZQSat1cM8Yd
         ZxrA==
X-Gm-Message-State: AOJu0YwVrHYrx9JXuDsqbw6qTuj5bpR/psbNZLw2F9FV/+7nFqLnJn7N
	d6RVQSAhlQw8l6vBlkAz0a3gF0S2XtYnTaEU4Qbun+tzcAB1OPu9O8/f69baZy66F2nG1CFX2Ap
	7EFx3LkTfZa6qGdarl1F0Z1LTRpo=
X-Google-Smtp-Source: AGHT+IH9AutVO8svWuj83EWDclBaB6gzqwJ2tyc5PaCMU0LcLCEhsKULsbd9S7B3M5YxUuCmiAmRtst7tXiu2KCfYLQ=
X-Received: by 2002:a05:6820:c91:b0:5eb:6c26:1ca0 with SMTP id
 006d021491bc7-5eb8b3a4b8amr10793469eaf.1.1729605271372; Tue, 22 Oct 2024
 06:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241021203904.2905690-1-jan.vermaete@gmail.com>
In-Reply-To: <20241021203904.2905690-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Oct 2024 06:54:04 -0700
Message-ID: <CAMKF1soqwvmdudCb4u7OqEKBZkg=Px-4zK0-sxWz3k79AXAypg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] doxygen: version bump 1.9.3 -> 1.12.0
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 13:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113088

It fails when using libc++ instead of libstdc++ with clang

https://errors.yoctoproject.org/Errors/Details/810553/

I think char_traits usage could be made better in doxygen, a
workaround will be to set LIBCPLUSPLUS in meta-clang to force to use
libstdc++ always
for doxygen recipe.

On Mon, Oct 21, 2024 at 1:39=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * The project moved from sourceforge to github (https://github.com/doxyge=
n/doxygen?tab=3Dreadme-ov-file#source-code)
> * The python3 patches are not needed anymore
> * iconv patch: seems to be not longer needed
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../0001-build-don-t-look-for-Iconv.patch     |  37 ---
>  .../doxygen-native-only-check-python3.patch   | 232 ------------------
>  .../{doxygen_1.9.3.bb =3D> doxygen_1.12.0.bb}   |  16 +-
>  3 files changed, 9 insertions(+), 276 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-d=
on-t-look-for-Iconv.patch
>  delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/doxygen-nati=
ve-only-check-python3.patch
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.3.bb =3D> doxygen_1=
.12.0.bb} (50%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-lo=
ok-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-do=
n-t-look-for-Iconv.patch
> deleted file mode 100644
> index 47c8edb49..000000000
> --- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-=
Iconv.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 2001
> -From: Bartosz Golaszewski <brgl@bgdev.pl>
> -Date: Fri, 23 Nov 2018 11:44:56 +0100
> -Subject: [PATCH] build: don't look for Iconv
> -
> -Drop the find_package() for Iconv. CMake is unable to find iconv.h in
> -native build but all modern systems supply it as part of the standard
> -C library. We don't need this check in meta-openembedded.
> -
> -Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> -
> -Upstream-Status: Inappropriate
> -- upstream doxygen must build on many architectures, this change is
> -  too intrusive for upstream
> ----
> - CMakeLists.txt | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 06b9696f..f30b46b8 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -117,10 +117,6 @@ if (sqlite3)
> -   endif()
> - endif()
> -
> --find_package(Iconv REQUIRED)
> --include_directories(${ICONV_INCLUDE_DIR})
> --
> --
> - #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen=
 docs")
> - set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
> - set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
> ---
> -2.27.0
> -
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
> similarity index 50%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
> index 16a4250b2..11ea116af 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
> @@ -4,16 +4,17 @@ HOMEPAGE =3D "http://www.doxygen.org/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -DEPENDS =3D "flex-native bison-native"
> +DEPENDS =3D "bison-native flex-native"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
> -           file://0001-build-don-t-look-for-Iconv.patch \
> +SRC_URI =3D "\
> +    git://github.com/doxygen/doxygen.git;branch=3Dmaster;protocol=3Dhttp=
s \
>  "
> -SRC_URI:append:class-native =3D " file://doxygen-native-only-check-pytho=
n3.patch"
> -SRC_URI[sha256sum] =3D "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f=
6c81c50449d254e0"
>
> -UPSTREAM_CHECK_URI =3D "https://github.com/doxygen/doxygen/releases"
> -UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> +SRCREV =3D "c73f5d30f9e8b1df5ba15a1d064ff2067cbb8267"
> +
> +S =3D "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "Release_(?P<pver>\d+(\_\d+)+)"
>
>  inherit cmake python3native
>
> @@ -21,4 +22,5 @@ EXTRA_OECMAKE +=3D "\
>      -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
>      -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
>  "
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113082): https://lists.openembedded.org/g/openembedde=
d-devel/message/113082
> Mute This Topic: https://lists.openembedded.org/mt/109140777/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

